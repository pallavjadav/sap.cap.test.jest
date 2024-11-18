using {db} from '../db/schema';

@(requires: 'authenticated-user')
service myempsrv {
  @Capabilities.SearchRestrictions: {Searchable: false

  }
  @odata.draft.enabled
  entity MyEmp          as
    projection on db.MyEmp {
      *,
      status.criticality as criticality,
      erpSystem.client as client
    }
    actions {
      action Hired();
      action Inactive();
    };
  
  entity landingMapping as projection on db.landingMapping;

  @odata.singleton  @cds.persistency.skip
  entity checkAdmin {
    key ID      : String;
        isNotAdmin : Boolean;
  }

}
