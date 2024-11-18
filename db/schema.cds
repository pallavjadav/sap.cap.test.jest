namespace db;
@cds.autoexpose
entity MyEmp {
    key ID        : UUID                          @title: 'ID';
        name      : String                        @title: 'Name';
        dob       : Date                          @title: 'DOB';
        status    : Association to Statuses  @readonly  @Common.ValueListWithFixedValues @title : 'Code';
        erpSystem : Association to landingMapping @title: 'ERP System';
        

}

entity landingMapping {
    key erpSystem : String    @title: 'ERP System';
        client    : String(3) @title: 'Client';
}

entity Statuses {
    key code : String enum {
            Hired = 'H';
            Inactive = 'X';
        } default 'X';
 criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
  fieldControl: Integer @odata.Type:'Edm.Byte'; // 1: #ReadOnly, 7: #Mandatory
  createDeleteHidden: Boolean;
}

// entity TravelStatus : CodeList {
//   key code : String enum {
//     Open     = 'O';
//     Accepted = 'A';
//     Canceled = 'X';
//   } default 'O'; //> will be used for foreign keys as well
//   criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
//   fieldControl: Integer @odata.Type:'Edm.Byte'; // 1: #ReadOnly, 7: #Mandatory
//   createDeleteHidden: Boolean;
// }
