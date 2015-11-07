/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
} forEach _units;

if((side (_units select 0)) != civilian)then{
    _group = createGroup (side (_units select 0));
    _units joinSilent _group;
    _group selectLeader (_units select 0);
    cachedArray = cachedArray - [_units];
};
