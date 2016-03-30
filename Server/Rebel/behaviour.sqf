/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_hideout = _unit getVariable "hideout";
_handle = scriptNull;
_patrolHandle = scriptNull;
_nearestPlayers = [];
_nearestSurrender = [];

while {alive _unit} do {
    waitUntil{sleep 10; simulationEnabled _unit};

    _nearestPlayers = [];
    _nearestSurrender = [];
    {
        if((_x distance _unit) < 500)then{
            if(_unit knowsAbout _x > 2)then{
                _nearestPlayers pushBack _x;
                if(captive _x)then{
                    _nearestSurrender pushBack _x;
                };
            };
        };
    } forEach (playableUnits + switchableUnits);

    //testV = (_nearestPlayers - _nearestSurrender);

    //Behaviour
    //Check for combat
    if(count (_nearestPlayers - _nearestSurrender) > 0)then{
        terminate _handle;
        terminate _patrolHandle;
        _handle = [_unit]spawn JOC_rebelDefend;
        waitUntil {sleep 10; scriptDone _handle};
    }else{
        if(_unit getVariable "needed")then{
            waitUntil {sleep 10; !(_unit getVariable "needed")};
        }else{
            //When player surrender, capture him (if no active enemies nearby)
            if((count _nearestSurrender) > 0 && (scriptDone _handle))then{
                if(!((_nearestSurrender select 0) getVariable "captureIP"))then{
                    terminate _patrolHandle;
                    _handle = [_unit,(_nearestSurrender select 0)]spawn JOC_rebelCapture;
                };
            }else{
                //Place ied on chance
                if((count iedArray) < 30 && (random 70) < 2 && (scriptDone _handle))then{
                    terminate _patrolHandle;
                    _handle = [_unit, _hideout]spawn JOC_rebelPlaceIED;
                }else{
                    //Else just patrol
                    if(scriptDone _handle)then{
                        _patrolHandle = [_unit,_hideout]spawn JOC_rebelPatrol;
                    };
                };
            };
        };
    };

    waitUntil{sleep 10; simulationEnabled _unit};
};
