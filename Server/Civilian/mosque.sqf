/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_unit setVariable["JOC_caching_disabled",true];
{
    if((_unit distance _x) < _prevDis)then{
        _mosqueB = _x;
        _prevDis = (_unit distance _x);
    };
} forEach mosques;
_timeNeeded = (_prevDis * 3.6);

sleep (7200 - _timeNeeded);
_mosque = true;
terminate _loiterHandle;

_buildings = nearestObjects [(getPos _mosque), ["Land_Jbad_A_Mosque_small_1"], 100];
_building = _buildings call BIS_fnc_selectRandom;

[_unit,getPos _building]spawn Zen_OrderInfantryPatrolBuilding;

waitUntil{sleep 5; (_unit distance _mosqueB) < 20};

sleep 1200;

_unit setVariable["JOC_caching_disabled",false];
