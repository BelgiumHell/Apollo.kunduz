/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_hideout"];

//New group
_unitGroup = createGroup civilian;
[_unit] joinSilent grpNull;
[_unit] joinSilent _unitGroup;
_unit allowFleeing 0;
_unit disableAI "AUTOCOMBAT";

//Set vars
_unit setVariable ["hideout", _hideout];
_unit setVariable ["JOC_caching_disabled",true];

//when killed, BOOM
_unit addEventHandler["killed", {
    _bomb = "R_80mm_HE" createVehicle getPos (_this select 0);
}];

//Move to nearest town
_townPos = (getPos ((nearestLocations [getPos _unit, ["NameVillage","NameCity","NameCityCapital"], (worldSize*2^0.5)]) select 0));
while{(alive _unit) && ((_unit distance2D _townPos) > 100)}do{
    _unit doMove _townPos;
    sleep 20;
};
_unit addVest "rhs_vydra_3m";

_target = objNull;
_distanceT = 999;
_loiterHandle = scriptNull;

while{_distanceT > 20 && alive _unit}do{
	sleep 4;

    _target = objNull;
    _prevDis = 99999;
    {
        if(_unit knowsAbout _x > 0)then{
    	    _dis = (vehicle _x) distance _unit;
    	    if(isPlayer _x || _dis < _prevDis)then{
    		    _target = _x;
    		    _prevDis = _dis;
    	    };
        };
    } forEach (playableUnits + switchableUnits);

	_target = _unit findNearestEnemy (getPos _unit);
    _unit doMove (getPos _target);

    if(isNull _target && scriptDone _loiterHandle)then{
        _loiterHandle = [_unit,_hideout]spawn JOC_rebelPatrol;
        _distanceT = 999;
    }else{
        if(!(isNull _target))then{
            terminate _loiterHandle;
            _unit doMove (getPos _target);
            _unit setSpeedMode "FULL";
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
