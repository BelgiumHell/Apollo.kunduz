/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];
private ["_side"];
_group = grpNull;

_side = (side (_units select 0));
if(isNil{_side})then{
    _side = civilian;
};

if(_side != civilian)then{
    _group = createGroup east;
    _units joinSilent _group;
    _group selectLeader (_units select 0);
    cachedArray = cachedArray - [_units];
    [(_units select 0)]spawn JOC_rebelBehaviour;
}else{
    _group = createGroup civilian;
    _units joinSilent _group;
    _group selectLeader (_units select 0);
    [_units]spawn JOC_civBehaviour;
};

[[_units],{
    params["_units"];
    {
        _x enableSimulationGlobal true;
        _x hideObjectGlobal false;
    } forEach _units;
}] remoteExec ["BIS_fnc_spawn", 2];
