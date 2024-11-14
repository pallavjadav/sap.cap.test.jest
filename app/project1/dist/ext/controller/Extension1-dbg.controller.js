sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('project1.ext.controller.Extension1', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf project1.ext.controller.Extension1
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
				var oModel = this.base.getExtensionAPI().getModel();
				// this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::name").addStyleClass("backgroundcolor")
				this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::name").addStyleClass("backgroundColorName")
				this.getView().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::dob").addStyleClass("backgroundColorDob")
				// sap.ui.getCore().byId("project1::MyEmpList--fe::table::MyEmp::LineItem::C::name-innerColumn").addStyleClass("backgroundcolor")
			}
		}
	});
});
