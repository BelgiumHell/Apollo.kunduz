/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_units"];

_patrolHandle = scriptNull;
_handle = scriptNull;
_home = (_units select 0) getVariable "home";
_currentPatrol = "";

(group (_units select 0)) setBehaviour "SAFE";
_approval = random 10;

//sleep a bit
sleep 10;

while {simulationEnabled (_units select 0)} do {
    sleep 10;

    //If home is destroyed, join the rebels
    if(!alive _home)then{
        terminate _loiterHandle;
        terminate _handle;

        [_unit]spawn JOC_civJoinRebels;
        if(true)exitWith{};
    };

    if(damage _unit > 0.1)then{
        terminate _loiterHandle;
        terminate _handle;

        _handle = [_unit]spawn JOC_civAid;
        waitUntil {sleep 10; scriptDone _handle};
        if((damage _unit) > 0.1)then{
            _approval = 0.5;
        }else{
            _approval = _approval + (_approval / 2);
        };
    }else{
        if((random 100 * _approval) < 1 && _approval < 8 && (scriptDone _handle))then{
            terminate _loiterHandle;
            terminate _handle;

            [_unit,_home]spawn JOC_civBomber;
            if(true)exitWith{};
        }else{
            if(daytime > 7 && daytime < 19)then{
                if(/*daytime > 9 && daytime < 17*/false)then{
                }else{
                    if(_currentPatrol != "loiter")then{
                        _wp = (group (_units select 0)) addWaypoint [getPos _home, 0];
                        _wp setWaypointType "loiter";
                    };
                    {
                        //code
                    } forEach _units;
                };
            }else{
                if(_currentPatrol != "sleep")then{
                    _patrolHandle = [_units,getPos _home,false,"safe"]spawn Zen_OrderInfantryPatrolBuilding;
                };
            };
        };
    };

    sleep 10;
};
