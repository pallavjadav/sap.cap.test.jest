module.exports = cds.service.impl(async function () {

    this.on("getUser","MyEmp", async req =>{
        console.log('USer >>>>>>>>>>>>>',req.user.id)
        return req.user.id
    })


})