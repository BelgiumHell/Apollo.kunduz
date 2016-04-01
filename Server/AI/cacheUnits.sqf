/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

{
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;

_groupC = switch (side (_units select 0)) do {
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
