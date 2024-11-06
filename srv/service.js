module.exports = cds.service.impl(async function () {

    this.on("getUser","MyEmp", async req =>{
        console.log('USer >>>>>>>>>>>>>',req.user.id)
        return req.user.id
    })

    this.on('READ', 'checkIsAdmin', async req => {
        req.reply({
            isAdmin: req.user.is('admin') //admin is the role, which for example is also used in @requires annotation
        });
    });

})