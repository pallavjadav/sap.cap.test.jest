using myempsrv as service from '../../srv/service';

annotate service.MyEmp with @(
    UI.SelectionFields #filterBarMacro: [
        ID,
        name,
        dob,
        erpSystem_erpSystem
    ],
    UI.LineItem #tableMacro           : [
        {
            $Type: 'UI.DataField',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: dob
        },
        {
            $Type: 'UI.DataField',
            Value: erpSystem_erpSystem
        },
        {
            $Type: 'UI.DataField',
            Value: client
        },

    ],
    UI.HeaderInfo                     : {
        TypeName      : 'Employee',
        TypeNamePlural: 'Employees',
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
);
