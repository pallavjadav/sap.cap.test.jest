using myempsrv as service from '../../srv/service';

annotate service.MyEmp with @(
    UI.SelectionFields #filterBarMacro: [
        ID,
        name,
        dob,
        erpSystem_erpSystem,
        status_code
    ],
    UI.LineItem #tableMacro           : [
        {
            $Type                    : 'UI.DataField',
            Value                    : status_code,
            Criticality              : criticality,
            Label                    : '{i18n>Status}',
            CriticalityRepresentation: #WithIcon,
            ![@UI.Importance]        : #High,
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: '{i18n>Name}',
        },
        {
            $Type: 'UI.DataField',
            Value: erpSystem_erpSystem,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: client,
            ![@UI.Hidden],
        },

        {
            $Type: 'UI.DataField',
            Value: dob,
            Label: '{i18n>Dob}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'myempsrv.Hired',
            Label : '{i18n>Hired}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'myempsrv.Inactive',
            Label : '{i18n>SetInactive}'
        },

    ],
    UI.HeaderInfo                     : {
        TypeName      : '{i18n>Employee}',
        TypeNamePlural: '{i18n>Employees}',
        Title         : {
            $Type: 'UI.DataField',
            Value: name,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: dob,
        },
        // Initials      : name,
        TypeImageUrl  : 'https://media.licdn.com/dms/image/v2/D4D03AQFI-EkMrmiLzA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1699030913771?e=1736985600&v=beta&t=1og6ktPgeEYWkUywezFUf1F-B7eMgB_YFgXHOSZwbds',
        ImageUrl      : 'https://media.licdn.com/dms/image/v2/D4D03AQFI-EkMrmiLzA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1699030913771?e=1736985600&v=beta&t=1og6ktPgeEYWkUywezFUf1F-B7eMgB_YFgXHOSZwbds'
    },
    UI.Facets                         : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : '{i18n>GeneralInformation}',
        Target: '@UI.FieldGroup#GeneratedGroup',
        ![@UI.Hidden],
    },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Employee}',
            ID : 'i18nEmployee',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Personal}',
                    ID : 'Personal',
                    Target : '@UI.FieldGroup#Personal',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>SystemInfo}',
                    ID : 'SystemInfo',
                    Target : '@UI.FieldGroup#SystemInfo',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>status}',
                    ID : 'i18nstatus',
                    Target : '@UI.FieldGroup#i18nstatus',
                },
            ],
        }, ],
    UI.FieldGroup #GeneratedGroup     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
                Label: '{i18n>Name}',
            },
            {
                $Type: 'UI.DataField',
                Value: dob,
                Label: '{i18n>Dob}',
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>ErpSystem}',
                Value: erpSystem_erpSystem
            },
            {
                $Type      : 'UI.DataField',
                Label      : '{i18n>Status}',
                Value      : status_code,
                Criticality: criticality
            },
            {
                $Type        : 'UI.DataField',
                Label        : '{i18n>Client}',
                Value        : client,
                // #hide :Hide an element using edmJson
                ![@UI.Hidden]: {$edmJson: {$Eq: [
                    {$Path: 'name'},
                    'name-21068100'
                ]}}
            },
        ],
    },
    UI.FieldGroup #Personal : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : dob,
            },
        ],
    },
    UI.FieldGroup #SystemInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : erpSystem_erpSystem,
            },
            {
                $Type : 'UI.DataField',
                Value : erpSystem.client,
            },
        ],
    },
    UI.FieldGroup #i18nstatus : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'status_code',
                Criticality : criticality,
            },
        ],
    },
    UI.FieldGroup #AllEmployees : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },

);

annotate service.MyEmp with @(UI.Identification: [
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'myempsrv.Hired',
        Label : '{i18n>Hired}',
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'myempsrv.Inactive',
        Label : '{i18n>SetInactive}',
    },
]);
annotate service.MyEmp with {
    status @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Statuses',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : status_code,
                ValueListProperty : 'code',
            },
        ],
        Label : 'Status',
    }
};

annotate service.MyEmp with {
    erpSystem @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'landingMapping',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : erpSystem_erpSystem,
                    ValueListProperty : 'erpSystem',
                },
            ],
            Label : 'Systems',
        }
)};

