sap.ui.define(["sap/ui/core/mvc/ControllerExtension"],function(e){"use strict";return e.extend("project1.ext.controller.Extension1",{override:{onInit:function(){var e=this.base.getExtensionAPI().getModel();this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::name").addStyleClass("backgroundColorName");this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::dob").addStyleClass("backgroundColorDob")}}})});
//# sourceMappingURL=Extension1.controller.js.map