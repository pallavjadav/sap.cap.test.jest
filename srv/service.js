module.exports = cds.service.impl(async function () {

    this.on("getUser","MyEmp", async req =>{
        console.log('USer >>>>>>>>>>>>>',req.user.id)
        return req.user.id
    })

    this.on('READ', 'checkAdmin', async req => {
        req.reply({
            ID: req.user.id,
            isNotAdmin: !req.user.is('admin') //admin is the role, which for example is also used in @requires annotation
        });
    });

})