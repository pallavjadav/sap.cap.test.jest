sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/MyEmpList',
		'project1/test/integration/pages/MyEmpObjectPage'
    ],
    function(JourneyRunner, opaJourney, MyEmpList, MyEmpObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMyEmpList: MyEmpList,
					onTheMyEmpObjectPage: MyEmpObjectPage
                }
            },
            opaJourney.run
        );
    }
);