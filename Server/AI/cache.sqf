/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

if((_units select 0) getVariable "JOC_caching_disabled")exitWith{};

{
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;

switch (side (_units select 0)) do {
    case east: {
        cachedArray pushBack _units;
        deleteGroup (group (_units select 0));
        _units joinSilent cacheGroupEast;
    };
    case civilian: {
        _units joinSilent cacheGroupCiv;
    };
};
