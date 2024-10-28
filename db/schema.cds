namespace db;

entity MyEmp {
    key ID   : UUID @title : 'ID';
        name : String @title : 'Name';
        dob  : Date @title : 'DOB';
        erpSystem : Association to landingMapping @title : 'ERP System';
}

entity landingMapping {
    key erpSystem : String @title : 'ERP System';
        client : String(3)@title : 'Client';
}