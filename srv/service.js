module.exports = cds.service.impl(async function () {

    this.on("Hired","MyEmp", async req =>{
       await UPDATE(`db.MyEmp`,req.params[0]).with({status_code:'H'})
    })
    this.on("Inactive","MyEmp",  async req =>{
        await UPDATE(`db.MyEmp`,req.params[0]).with({status_code:'X'})
       
    })

    this.on('READ', 'checkAdmin', async req => {
        req.reply({
            ID: req.user.id,
            isNotAdmin: !req.user.is('admin') //admin is the role, which for example is also used in @requires annotation
        });
    });

})