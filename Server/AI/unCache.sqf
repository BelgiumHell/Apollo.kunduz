/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

_group = createGroup (side (_units select 0));
_units joinSilent _group;
_group selectLeader (_units select 0);

{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
} forEach _units;

if((side (_units select 0)) == civilian)then{
    {
        [_x]spawn JOC_civBehavior;
    }forEach _units;
};

cachedArray = cachedArray - [_units];
