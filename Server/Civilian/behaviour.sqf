/////////////////////////
//Script made by Jochem//
/////////////////////////
_prevDis = 9999;
_patrolHandles = [];

_unitCount = 0;
_approval = random 100;
_approvalStart = _approval;
_unit = objNull;
_handle = scriptNull;

sleep 10;

while{true}do{
    sleep 20;
    _units = units civGroup - [civGroupLeader];

    civGroup setBehaviour "SAFE";
    civGroup setSpeedMode "LIMITED";

    {
        /*_home = _x getVariable "home";

        if(damage _home > 0.3)then{
            [_x]spawn JOC_civJoinRebels;
        };*/
        _x disableAI "AUTOCOMBAT";
    } forEach _units;

    //Bomber
    if((random 100 * _approval) < 1 && _approval < 8 && (scriptDone _handle))then{
        _unit = selectRandom _units;
        {
            if(_x select 0 == _unit)then{
                terminate (_x select 1);
            };
        } forEach _patrolHandles;

        [_unit,_home]spawn JOC_civBomber;
    }else{
        //Walk around
        if(scriptDone _handle)then{
            {
                if(!(_x getVariable ["loiter",false]))then{
                    diag_log "loiter";
                    _home = _x getVariable "home";
                    _x setVariable ["loiter", true];
                    _patrolHandle = [_x,_home]spawn JOC_civLoiter;
                    _patrolHandles pushBack [_x, _patrolHandle];
                };
            } forEach _units;
        };
    };
    sleep 20;
    diag_log "civ loop";
};
