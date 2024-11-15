using myempsrv as service from '../../srv/service';
annotate service.MyEmp with @(
    UI.SelectionFields #filterBarMacro : [
    ID,name, dob,erpSystem_erpSystem
    ]
);

