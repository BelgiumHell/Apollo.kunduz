/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_group"];

if((leader _group) getVariable "JOC_caching_disabled")exitWith{};

_units = units _group;

{
    if(vehicleVarName _x == "")then{
        _name = [10] call Zen_StringGenerateRandom;
        _x setVehicleVarName _name;
    };
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;

_groupC = switch (side _group) do {
    case east: {
        cachedArray pushBack _units;
        cacheGroupEast
    };
    case civilian: {
        cacheGroupCiv
    };
};

_units joinSilent _groupC;
deleteGroup _group;
