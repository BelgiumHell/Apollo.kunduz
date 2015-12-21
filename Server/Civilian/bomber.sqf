/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_hideout"];

[_unit] call Zen_TrackInfantry;

_unit addEventHandler["killed", {
    _bomb = "Bo_GBU12_LGB" createVehicle getPos (_this select 0);
}];

while{(alive _unit) && (_unit distance _hideout) > 20}do{
    _unit doMove (getPos _hideout);
    sleep 120;
};
_unit doMove (getPos _hideout);


_unitGroup = createGroup east;
[_unit] joinSilent grpNull;
[_unit] joinSilent _unitGroup;

sleep 1;

_target = _unit findNearestEnemy (getPos _unit);

_unit setSpeedMode "FULL";
_unit allowFleeing 0;

_unit addVest "V_Chestrig_khk";

_distanceT = _unit distance _target;

while{_distanceT > 20 && alive _unit}do{
	_unit doMove (getPos _target);
	sleep 4;
	_target = _unit findNearestEnemy (getPos _unit);
	_distanceT = _unit distance _target;
};

if(alive _unit)then{

    [[_unit],{
        params["_unit"];
        _unit say ["scream", 25];
    }] remoteExec ["BIS_fnc_spawn", 0, true];
    sleep 1;
    _unit setDamage 1;
};
