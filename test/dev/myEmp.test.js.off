const cds = require('@sap/cds');

describe('CAP Application - MyEmp Service', () => {

  const { GET, POST, PATCH, DELETE, expect } = cds.test(__dirname + '/../');

  beforeAll(() => {
    cds.User.default = cds.User.Privileged;
  });

  const employeeID = '2283121f-00bc-4d50-ade0-7ce25fa5fe4a';
  const newEmployee = {
    ID: employeeID,
    name: 'name-2283121',
    dob: '2022-06-10'
  };

  // Test: POST a new employee
  it('should POST a new employee', async () => {
    const response = await POST(`/odata/v4/myempsrv/MyEmp`, newEmployee);
    expect(response.status).to.equal(201); // Created
    expect(response.data).to.include(newEmployee);
  });

  // Test: GET all employees
  it('should GET all employees', async () => {
    const { data } = await GET(`/odata/v4/myempsrv/MyEmp`);
    expect(data.value).to.be.an('array');
    expect(data.value.some(emp => emp.ID === employeeID)).to.be.true; // Ensure the new employee exists
  });

  // Test: PATCH the employee
  it('should PATCH the employee details', async () => {
    const updatedEmployee = {
      name: 'updated-name-2283121',
      dob: '2022-06-10'
    };
    const response = await PATCH(`/odata/v4/myempsrv/MyEmp/${employeeID}`, updatedEmployee);
    expect(response.status).to.equal(200); // Success
    expect(response.data.name).to.equal(updatedEmployee.name);
  });

  // Test: DELETE the employee
  it('should DELETE the employee', async () => {
    const response = await DELETE(`/odata/v4/myempsrv/MyEmp/${employeeID}`);
    expect(response.status).to.equal(204); // No Content (successfully deleted)
  });

  // Test: Confirm the employee is deleted
  it('should return 404 after the employee is deleted', async () => {
    try {
      const response = await GET(`/odata/v4/myempsrv/MyEmp/${employeeID}`);
      throw new Error(`Expected 404 Not Found, but received: ${response.status}`);
    } catch (error) {
      expect(error.response.status).to.equal(404); // Employee is deleted, so 404 is expected
    }
  });

});
