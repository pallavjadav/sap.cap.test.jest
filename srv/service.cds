using { db } from '../db/schema';

@(requires:'authenticated-user')
service myempsrv {
    entity MyEmp as projection on db.MyEmp{*, erpSystem.client as client};
    entity landingMapping as projection on db.landingMapping;
}