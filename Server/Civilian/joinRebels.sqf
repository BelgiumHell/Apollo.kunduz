/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

//Find nearest group
_groups = [];
_group = grpNull;
{
    if(side _x == east)then{
        _groups pushBack _x;
    };
} forEach allGroups;
_prevDis = 999999;
{
    _dis = (_unit distance (leader _x));
    if(_prevDis > _dis)then{
        _group = _x;
        _prevDis = _dis;
    };
} forEach _groups;

[_unit] joinSilent grpNull;
[_unit] joinSilent _group;

_hideout = ((leader _group) getVariable "hideout");
_hideout setVariable ["units", (units _group)];

_unit setVariable["hideout",_hideout];
_unit setVariable ["needed", false];

_unit doMove (getPos _hideout);
waitUntil {sleep 10; _unit distance2D _hideout < 2};

_unit addPrimaryWeaponItem "";
_handle = [_unit]call asr_ai3_main_fnc_rearm;  //required ASR AI

[_unit]spawn JOC_rebelBehaviour;
