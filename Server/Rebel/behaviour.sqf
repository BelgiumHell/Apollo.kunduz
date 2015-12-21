/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];
_patrolHandle = 0;
_hideout = _unit getVariable "hideout";

_unit setBehaviour "SAFE";
_patrol = false;
_nearestPlayers = [];
_nearestSurrender = [];

while {alive _unit} do {
    waitUntil{sleep 10; simulationEnabled _unit};

    //Get player stats
    _nearestPlayers = [];
    _nearestSurrender = [];
    {
        if (isPlayer _x && (_x distance _unit) < 500)then {
            _nearestPlayers pushBack _x;
            if(captive _x)then{
                _nearestSurrender pushBack _x;
            };
        };
    } forEach (playableUnits + switchableUnits);

    //If hideout is destroyed, create new one
    if(!alive _hideout && !_destroyed)then{
        terminate _patrolHandle;
        _patrol = false;
        //_destroyed = true;
    };

    //When nothing to do, patrol around
    if(!_patrol && (behaviour _unit) != "COMBAT")then{
        _patrol = true;
        _patrolHandle = [_unit,_hideout]spawn JOC_rebelPatrol;
    };

    //When player surrender, capture him (if no active enemies nearby)
    if((count _nearestSurrender > 0) && (count _nearestSurrender == count _nearestPlayers) && !((_nearestSurrender select 0) getVariable "captureIP"))then{
        hint "capture";
        terminate _patrolHandle;
        _patrol = false;
        _handle = [_unit,(_nearestSurrender select 0)]spawn JOC_rebelCapture;
        sleep 10;
        waitUntil{scriptDone _handle || !((_nearestSurrender select 0) getVariable "captureIP" || !alive _unit)};
        terminate _handle;
        if(!alive _unit)then{
            (_nearestSurrender select 0) setCaptive false;
        };
    };

    //Place ied
    if((count iedArray) < 30 && (random 70) < 2)then{
        terminate _patrolHandle;
        _patrol = false;
        _handle = [_unit, _hideout]spawn JOC_rebelPlaceIED;
        waitUntil{scriptDone _handle};
    };

    if(!(isNull (_unit findNearestEnemy (getPos _hideout))) && ((getPos _hideout) distance (_unit findNearestEnemy (getPos _hideout))) < 900)then{
        terminate _patrolHandle;
        _patrol = false;
        _handle = [_unit]spawn JOC_rebelDefend;
        waitUntil{scriptDone _handle};
    };

    waitUntil{sleep 10; simulationEnabled _unit};
};
