using { db } from '../db/schema';

@(requires:'authenticated-user')
service myempsrv {
    entity MyEmp as projection on db.MyEmp;
}