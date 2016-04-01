/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_leader"];

_group = group _leader;
_units = units _group;
_hideout = _leader getVariable "hideout";
_handle = scriptNull;
_patrolHandles = [];
_nearestPlayers = [];
_nearestSurrender = [];
_iedCount = 0;
_unit = objNull;

sleep 10;

while{simulationEnabled _leader && alive _leader}do{
    _nearestPlayers = [];
    _nearestSurrender = [];
    {
        if((_x distance _leader) < 500)then{
            if(_group knowsAbout _x > 2)then{
                _nearestPlayers pushBack _x;
                if(captive _x)then{
                    _nearestSurrender pushBack _x;
                };
            };
        };
    } forEach (playableUnits + switchableUnits);

    //Behaviour
    //Check for combat
    if(count (_nearestPlayers - _nearestSurrender) > 0)then{
        terminate _handle;
        {
            terminate (_x select 1);
        } forEach _patrolHandles;
        _handle = [_group]spawn JOC_rebelDefend;
        waitUntil {sleep 10; scriptDone _handle};
    }else{
        //When player surrender, capture him (if no active enemies nearby)
        if((count _nearestSurrender) > 0 && (scriptDone _handle))then{
            if(!((_nearestSurrender select 0) getVariable "captureIP"))then{
                _unit = selectRandom (units _group);
                {
                    if(_x select 0 == _unit)then{
                        terminate (_x select 1);
                    };
                } forEach _patrolHandles;
                _handle = [_unit,(_nearestSurrender select 0)]call JOC_rebelCapture;
            };
        }else{
            //Place ied on chance
            if(_iedCount < 1 && (random 10) < 2 && (scriptDone _handle))then{
                _unit = selectRandom (units _group);
                {
                    if(_x select 0 == _unit)then{
                        terminate (_x select 1);
                    };
                } forEach _patrolHandles;
                _handle = [_unit, _hideout]spawn JOC_rebelPlaceIED;
            }else{
                //Else just patrol
                if(scriptDone _handle)then{
                    {
                        _patrolHandle = [_x,_hideout]spawn JOC_rebelPatrol;
                        _patrolHandles pushBack [_x, _patrolHandle];
                    } forEach (units _group);
                };
            };
        };
    };

    sleep (10 + random 5);
};

terminate _handle;
{
    terminate (_x select 1);
} forEach _patrolHandles;

sleep 10;

if(!alive _leader && count (_units - allDead - [objNull]) > 0)then{
    [leader _group]spawn JOC_rebelBehaviour;
};
