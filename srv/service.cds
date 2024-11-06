using {db} from '../db/schema';

@(requires: 'authenticated-user')
service myempsrv {
  @Capabilities.SearchRestrictions: {Searchable: false

  }
  @odata.draft.enabled
  entity MyEmp          as
    projection on db.MyEmp {
      *,
      erpSystem.client as client
    }
    actions {
      function getUser() returns String;
    };

  entity landingMapping as projection on db.landingMapping;

  @odata.singleton  @cds.persistency.skip
  entity checkIsAdmin {
    key ID      : String;
        isAdmin : Boolean;
  }

}
