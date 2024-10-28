using myempsrv as service from '../../srv/service';
annotate service.MyEmp with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : dob,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ERP System',
                Value : erpSystem_erpSystem
            },
            {
                $Type : 'UI.DataField',
                Label : 'Client',
                Value : client,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : dob,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ERP System',
            Value : erpSystem_erpSystem
           
        },
        // {
        //     $Type : 'UI.DataField',
        //     Label : 'ERP System',
        //     Value : erpSystems,
        //     ![@UI.Hidden] : true
           
        // },
        {
            $Type : 'UI.DataField',
            Label : 'Client',
            Value : client,
        },
    ],
);

// annotate service.MyEmp with {
//     erpSystem @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'landingMapping',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : erpSystem_erpSystem,
//                 ValueListProperty : 'erpSystem',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'client',
//             },
//         ],
//     }
// };

