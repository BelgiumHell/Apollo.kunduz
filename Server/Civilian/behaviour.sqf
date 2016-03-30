/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_mosqueB = objNull;
_prevDis = 9999;
_loiterHandle = scriptNull;
_handle = scriptNull;
_home = _unit getVariable "home";

_unit setBehaviour "SAFE";
_unitCount = count (units (group _unit));
_approval = random 10;
_approvalStart = _approval;

//sleep a bit
sleep 10;

while {alive _unit} do {
    waitUntil{sleep 20; simulationEnabled _unit};

    /*
    //Influence approval
    if(count (units (group _unit)) < _unitCount)then{
        _approval = _approval - (15 / _approvalStart);
    };
    _unitCount = count (units (group _unit));
    */

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
            if(daytime > 7 && daytime < 7.5 && (random 3) < 1 && (scriptDone _handle))then{
                _handle = [_unit]spawn JOC_civMosque;
            }else{
                if(scriptDone _handle)then{
                    if((20 < daytime) || (daytime < 5) && (scriptDone _handle))then{
                        terminate _loiterHandle;
                        _loiterHandle = [_unit,getPos _home]spawn Zen_OrderInfantryPatrolBuilding;
                    }else{
                        terminate _loiterHandle;
                        _loiterHandle = [_unit,_home]spawn JOC_civLoiter;
                    };
                };
            };
        };
    };
    waitUntil{sleep 20; simulationEnabled _unit};
};
