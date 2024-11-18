using { myempsrv } from '../srv/service';

annotate myempsrv.MyEmp {
    
}actions {
    Hired @(
        Core.OperationAvailable   : {$edmJson: {$Ne:[{$Path: 'in/status_code'},'H']}},
        Common:{
            SideEffects : {
                $Type : 'Common.SideEffectsType',
                TargetProperties:[
                    'in/status_code'
                ],
                TargetEntities:[
                    '/myempsrv.EntityContainer/MyEmp'
                ]
            },
        }
    );
    Inactive @(
        Core.OperationAvailable   : {$edmJson: {$Ne:[{$Path: 'in/status_code'},'X']}},
         Common:{
            SideEffects : {
                $Type : 'Common.SideEffectsType',
                TargetProperties:[
                    'in/status_code'
                ],
                TargetEntities:[
                    '/myempsrv.EntityContainer/MyEmp'
                ]
            },
        }

    )
} ;
