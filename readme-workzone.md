# Getting Started

**Integration of an app to the BASF WorkZone subaccount.**

Official SAP documentation can be found here:
- [Developing HTML5 Business Solutions as Content Providers | SAP Help Portal](https://help.sap.com/docs/build-work-zone-standard-edition/sap-build-work-zone-standard-edition/developing-html5-apps-for-cross-subaccount-consumption?locale=en-US)
- [Simplifying HTML5 Content Consumption Across Subaccount - SAP Community](https://community.sap.com/t5/technology-blogs-by-sap/simplifying-html5-content-consumption-across-subaccounts/ba-p/13758568)
- [Youtube Video Enable Work Zone to Consume Business Solutions from Other BTP Subaccounts (content federation)](https://www.youtube.com/watch?v=rSw0BVHQzV0)


You can also use following instructions:

## 1. Cloud service

Include sap.cloud.service definition in UI App manifest (e.g. [webapp/manifest.json](helloworld4/webapp/manifest.json))

You should name the service consisting out of your space and application name. In our case it is "combasfexamplebooks".

```
...
  "sap.cloud": {
  "public": true,
  "service": "combasfhelloworldx"
  }
```
**Important:** the service used here is the Work Zone cdm endpoint, if you want to bundle more the one application in a Work Zone Content Provider, use the same service name in each manifest.jason file of your applications 

## 2. CDM exposure

Create a folder **``workzone``** in the root of your project.

Create a file **``cdm.json``** inside that workzone folder.

Paste following code to your cdm.json file:

```
[
    {
      "_version": "3.0",
      "identification": {
        "id": "livlab.helloworldx.role",
        "entityType": "role",
        "title": "integ.livlab.helloworldx.role"
      },
      "payload": {
        "apps": [
          {
            "id": "com.basf.helloworld4"
          }
        ]
      }
    }
  ]
```

Adapt the values of **"id"** and **"title"** of the role fitting to your app.

For the **"id"** please follow the naming conventions:
"provider subaccount name.custom role name.role"
Example:
livlab.helloworldx.role

For the **"id"** and **"title"** please follow the naming conventions:
"integ.provider subaccount.custom role name.role"
Example:
integ.livlab.helloworldx.role

**Important:** Adapt the value of payload **"id"** with your **id** of your UI App manifest (e.g. [git cloneson), at line 4).

## 3. Edit MTA file

Apply following changes/additions to your [mta.yaml file](mta.yaml)

**Important**: Replace "workzone-integration" with the ID of your project, which should already be defined in your mta-file!

### 3.1 Workzone resources

Add this code block, or add both commands if your mta-file already contains **before-all**:

```
...
build-parameters:
  before-all:
  - builder: custom
    commands:
    - mkdir -p resources
    - cp workzone/cdm.json resources/cdm.json
...
```

### 3.2 Designtime destination

Add following block to create the designtime destination.

Replace the last part of the URL (https://html5-apps-repo-rt.${default-domain}/applications/cdm/...) with the sap-cloud-service defined in **Step 1** of this README.


```
...
modules:
...
# Destination deployer module - create CDM DT destination      
- name: workzone-exposure-destination-content
  type: com.sap.application.content
  requires:
  - name: workzone-exposure-destination-service
    parameters:
      content-target: true
  - name: workzone-exposure-repo-host
    parameters:
      service-key:
        name: workzone-exposure-repo-host-key
  - name: uaa_workzone-exposure
    parameters:
      service-key:
        name: uaa_workzone-exposure-key
  parameters:
    content:
      subaccount:
          destinations:
          - Name: wz-webplatformdev-livlab-halloworldcdm-dt
            ServiceInstanceName: workzone-exposure-html5-srv
            ServiceKeyName: workzone-exposure-repo-host-key
            URL: https://html5-apps-repo-rt.${default-domain}/applications/cdm/combasfhelloworldx
          existing_destinations_policy: update
  build-parameters:
    no-source: true
...
```
To structure all destinations within the BTP please rename **"destinations -Name"** as within the following naming conventions:

"**wz-consumer subaccount**-**provider subaccount**-**application name**-**dt**"

Example: 
wz-webplatformdev-livlab-halloworl4-dt

if you want to bundle more then one Apllication (like explained in **Step 1** sap.cloud,service) plase choose a unique cdm endoint name instead the application name 

Example: 
wz-webplatformdev-livlab-halloworlcdm-dt

### 3.3 HTML5 App-runtime resource

Add or modify following block to create the app-runtime resource.

```
...
resources:
...
# HTML5 app-runtime resource for CDM DT destination
- name: workzone-exposure-repo-host
  type: org.cloudfoundry.managed-service
  parameters:
    service: html5-apps-repo
    service-name: workzone-exposure-html5-srv
    service-plan: app-runtime
...
```

### 3.4 Runtime destination

Add following block to create the runtime destination.

Replace the URL with the URL provided by your WorkZone team. Contact **sap-fiori@basf.com**, if you have not been provided with the URL.

```
...
resources:
...
# Destination resource for CDM RT destination
- name: workzone-exposure-destination-service
  type: org.cloudfoundry.managed-service
  parameters:
    config:
      HTML5Runtime_enabled: true
      init_data:
        subaccount:
          destinations:
          - Authentication: NoAuthentication
            Name: wz-webplatformdev-livlab-halloworldcdm-rt
            ProxyType: Internet
            Type: HTTP
            CEP.HTML5contentprovider: true
            URL: https://livlab-sbx.launchpad.cfapps.eu10.hana.ondemand.com
          existing_destinations_policy: update
      version: 1.0.0
    service: destination
    service-name: workzone-exposure-destination-service
    service-plan: lite
...
```

To structure all destinations within the BTP please rename **"destinations -Name"** as within the following naming conventions:

"**wz-consumer subaccount**-**provider subaccount**-**application name**-**rt**"

Example: 
wz-webplatformdev-livlab-halloworl4-rt

if you want to bundle more then one Apllication (like explained in **Step 1** sap.cloud,service) plase choose a unique cdm endoint name instead the application name 

Example: 
wz-webplatformdev-livlab-halloworlcdm-rt

### 3.5 XSUAA resource

Add or modify the following block to create the XSUAA resource.

**Important**: Make sure that your project contains a "xs-security.json". See [SAP Documentation](https://help.sap.com/docs/SAP_HANA_PLATFORM/4505d0bdaf4948449b7f7379d24d0f0d/6d3ed64092f748cbac691abc5fe52985.html).

```
...
resources:
...
# XSUAA resource - upload html5 apps 
- name: uaa_workzone-exposure
  type: org.cloudfoundry.managed-service
  parameters:
    path: ./xs-security.json
    service: xsuaa
    service-name: workzone-exposure-xsuaa-service
    service-plan: application
...
```
### 3.6 HTML5 app-host resource - upload html5 apps

If not already available in your mta.yaml please also add this resources

```
...
resources:
...
# HTML5 app-host resource - upload html5 apps
- name: workzone-exposure_html_repo_host
  type: org.cloudfoundry.managed-service
  parameters:
    service: html5-apps-repo
    service-name: workzone-exposure-html5-app-host-service
    service-plan: app-host
...
```
### 3.7 # HTML5 app deployer module - store xsuaa, backend destinations

Please add the name of your XSUAA resource and the name of the app-host module as a requires.

```
...
requires:
  - name: uaa_workzone-exposure #added from XSUAA resource
  - name: workzone-exposure_html_repo_host #added from HTML5 app-host resource
...
```

### 4 Work Zone Intergrtaion issues

If the Application Tile is not visble in Work Zone Page:

Check in Work Zone if Visualization Type of zhe Tile = Static Tile) 

if not please add the section to your [webapp/manifest.json](helloworld4/webapp/manifest.json)

```
...
"crossNavigation": {
      "inbounds": {
        "test-none": {
          "semanticObject": "test",
          "action": "none",
          "title": "{{flpTitle}}",
          "signature": {
            "parameters": {},
            "additionalParameters": "allowed"
          }
        }
      }
    }
...

```

in the i18n File of your application add 
```
...
flpTitle="Tite of your Application"  
...
```