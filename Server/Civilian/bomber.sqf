/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_hideout"];

_x setVariable ["hideout", _hideout];


[_unit] call Zen_TrackInfantry;

//when killed, BOOM
_unit addEventHandler["killed", {
    _bomb = "Bo_GBU12_LGB" createVehicle getPos (_this select 0);
}];

while{(alive _unit) && (_unit distance _hideout) > 5}do{
    _unit doMove (getPos _hideout);
    sleep 120;
};

_unitGroup = createGroup east;
[_unit] joinSilent grpNull;
[_unit] joinSilent _unitGroup;

sleep 1;

//Move to nearest town
_townPos = (getPos ((nearestLocations [getPos _unit, ["NameVillage","NameCity","NameCityCapital"], (worldSize*2^0.5)]) select 0));
while{(alive _unit) && (_unit distance _townPos) > 100}do{
    _unit doMove (getPos _townPos);
    sleep 120;
};


_unit setSpeedMode "FULL";
_unit allowFleeing 0;

_unit addVest "V_Chestrig_khk";

_target = objNull;
_distanceT = 999;
_loiterHandle = scriptNull;

while{_distanceT > 20 && alive _unit}do{
	sleep 4;

	_target = _unit findNearestEnemy (getPos _unit);
    _unit doMove (getPos _target);

    if(isNull _target && scriptDone _loiterHandle)then{
        _loiterHandle = [_unit,_hideout]spawn JOC_rebelPatrol;
        _distanceT = 999;
    }else{
        if(!(isNull _target))then{
            terminate _loiterHandle;
            _unit doMove (getPos _target);
            _distanceT = _unit distance _target;
        };
    };
};

if(alive _unit)then{

    [[_unit],{
        params["_unit"];
        _unit say3D "scream";
    }] remoteExec ["BIS_fnc_spawn", 0, true];
    sleep 1;
    _unit setDamage 1;
};
