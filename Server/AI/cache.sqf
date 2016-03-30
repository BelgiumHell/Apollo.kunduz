/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

if((_units select 0) getVariable "JOC_caching_disabled")exitWith{};

{
    if(vehicleVarName _x == "")then{
        _name = [10] call Zen_StringGenerateRandom;
        _x setVehicleVarName _name;
    };
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;

switch (side (_units select 0)) do {
    case east: {
        cachedArray pushBack _units;
        _units joinSilent cacheGroupEast;
        deleteGroup (group (_units select 0));
    };
    case civilian: {

    };
};
