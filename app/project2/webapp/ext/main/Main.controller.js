sap.ui.define(
    [
        'sap/fe/core/PageController',
        'sap/ui/model/json/JSONModel',
        'sap/m/MessageToast'
    ],
    function(PageController, JSONModel,MessageToast) {
        'use strict';

        return PageController.extend('project2.ext.main.Main', {

            onAfterRendering: function (oEvent) {
				var oView = this.getView();
				var mFBConditions = new JSONModel({
					allFilters: "",
					expanded: false,
					filtersTextInfo: oView.byId("FilterBar").getActiveFiltersText()
				});
				oView.setModel(mFBConditions, "fbConditions");
			},
			handlers: {
				onFiltersChanged: function (oEvent) {
					var oView = this.getView();
					var filterBar = oView.byId("FilterBar");
					var allFilters = filterBar.getFilters();

					var oSource = oEvent.getSource();
					var mFBConditions = oSource.getModel("fbConditions");
					mFBConditions.setProperty("/allFilters", JSON.stringify(allFilters, null, "  "));

					if (Object.keys(allFilters).length > 0) {
						mFBConditions.setProperty("/expanded", true);
					}
					MessageToast.show("FilterBar filters are changed!");
					mFBConditions.setProperty("/filtersTextInfo", oSource.getActiveFiltersText());
				},
                onTilePress: function(oEvent){
                    MessageToast.show('Tile was Pressed.. ***Can be used to filter probably***')
                }
			}






























            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf project2.ext.main.Main
             */
            //  onInit: function () {
            //      PageController.prototype.onInit.apply(this, arguments); // needs to be called to properly initialize the page controller
            //  },

            /**
             * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
             * (NOT before the first rendering! onInit() is used for that one!).
             * @memberOf project2.ext.main.Main
             */
            //  onBeforeRendering: function() {
            //
            //  },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf project2.ext.main.Main
             */
            //  onAfterRendering: function() {
            //
            //  },

            /**
             * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
             * @memberOf project2.ext.main.Main
             */
            //  onExit: function() {
            //
            //  }
        });
    }
);
