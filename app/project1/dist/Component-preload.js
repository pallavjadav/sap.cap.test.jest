//@ui5-bundle project1/Component-preload.js
sap.ui.require.preload({
	"project1/Component.js":function(){
sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("project1.Component",{metadata:{manifest:"json"}})});
},
	"project1/ext/controller/Extension1.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/ControllerExtension"],function(e){"use strict";return e.extend("project1.ext.controller.Extension1",{override:{onInit:function(){var e=this.base.getExtensionAPI().getModel();this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::name").addStyleClass("backgroundColorName");this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::dob").addStyleClass("backgroundColorDob")}}})});
},
	"project1/i18n/i18n.properties":'# This is the resource bundle for project1\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Trial Fiori Element App for Testing features\n\n#YDES: Application description\nappDescription=An SAP Fiori application for Testing annotation features.',
	"project1/manifest.json":'{"_version":"1.65.0","sap.app":{"id":"project1","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:lrop","version":"1.15.2","toolsId":"28ee3889-c383-40ad-833d-4f64a6c82ccb"},"dataSources":{"mainService":{"uri":"./odata/v4/myempsrv/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"project1-display":{"semanticObject":"project1","action":"display","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.129.2","libs":{"sap.m":{},"sap.ui.core":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"project1.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[{"uri":"css/style.css"}]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"MyEmpList","target":"MyEmpList"},{"pattern":"MyEmp({key}):?query:","name":"MyEmpObjectPage","target":"MyEmpObjectPage"}],"targets":{"MyEmpList":{"type":"Component","id":"MyEmpList","name":"sap.fe.templates.ListReport","options":{"settings":{"contextPath":"/MyEmp","variantManagement":"Page","navigation":{"MyEmp":{"detail":{"route":"MyEmpObjectPage"}}},"controlConfiguration":{"@com.sap.vocabularies.UI.v1.LineItem":{"tableSettings":{"type":"ResponsiveTable"},"actions":{"GetUser":{"press":"project1.ext.getUser.GetUser.getUser","visible":true,"enabled":true,"requiresSelection":true,"text":"GetUser"}}}},"initialLoad":"Enabled"}}},"MyEmpObjectPage":{"type":"Component","id":"MyEmpObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"contextPath":"/MyEmp"}}}}},"extends":{"extensions":{"sap.ui.controllerExtensions":{"sap.fe.templates.ListReport.ListReportController":{"controllerName":"project1.ext.controller.Extension1"}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"sapcapwrkzn"}}'
});
//# sourceMappingURL=Component-preload.js.map
