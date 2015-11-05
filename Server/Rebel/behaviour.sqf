/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];
_patrolHandle = 0;
_hideout = _unit getVariable "hideout";

_unit setBehaviour "SAFE";
_destroyed = false;
_patrol = false;
_ied = false;

//Add killed eventhandler

while {alive _unit} do {
    //If hideout is destroyed, create new one
    if(!alive _hideout && !_destroyed)then{
        terminate _patrolHandle;
        _destroyed = true;
        if(true)exitWith{};
    };

    //When nothing to do, patrol around
    if(!_patrol && !_destroyed && !_ied)then{
        _patrol = true;
        _patrolHandle = [_unit,_hideout]spawn JOC_rebelPatrol;
    };

    if(!_ied && (count iedArray) < 30 && (random 70) < 2)then{
        terminate _patrolHandle;
        _ied = true;
        _handle = [_unit, _hideout]spawn JOC_rebelPlaceIED;
        waitUntil{scriptDone _handle};
        _ied = false;
    };

    sleep 10;
};
