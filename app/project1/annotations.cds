using myempsrv as service from '../../srv/service';

annotate service.MyEmp with @(
    // UI.UpdateHidden : { $edmJson: {$Not: { $Path: '/Configuration/isAdmin'} } },
    // Reference1: https://cap.cloud.sap/docs/advanced/fiori#use-roles-to-toggle-visibility-of-ui-elements
    // Reference2: https://github.com/SAP-samples/fiori-elements-feature-showcase/blob/main/app/featureShowcase/capabilities.cds
    UI.CreateHidden              : {$edmJson: {$Path: '/checkAdmin/isNotAdmin'}},

    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: dob,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ERP System',
                Value: erpSystem_erpSystem
            },
            {
                $Type: 'UI.DataField',
                Label: 'Client',
                Value: client,
                // #hide :Hide an element using edmJson 
                ![@UI.Hidden]: {$edmJson: {$Eq: [{$Path: 'name'}, 'name-21068100' ]}}
            },
        ],
    },
    UI.SelectionFields           : [name],
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: dob,
        },
        {
            $Type: 'UI.DataField',
            Label: 'ERP System',
            Value: erpSystem_erpSystem

        },
        // {
        //     $Type : 'UI.DataField',
        //     Label : 'ERP System',
        //     Value : erpSystems,
        //     ![@UI.Hidden] : true

        // },
        {
            $Type: 'UI.DataField',
            Label: 'Client',
            Value: client,
        },
    ],
);

annotate service.MyEmp with {
    name @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'MyEmp',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: name,
            ValueListProperty: 'name',
        }, ],
    }
};
