/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_veh","_dis","_time","_codeE"];
params["_spawnObj"];
_oldVeh = objNull;
_time = 0;

while{!(isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull]))}do{
	_veh = nearestObject [_spawnObj, "AllVehicles"];
	_dis = _veh distance _spawnObj;
	if((_dis < 4) && (_oldVeh != _veh))then{
		_veh setPos getPos _spawnObj;
		_veh setDir (getDir _spawnObj);
		_oldVeh = _veh;
	};
};

waitUntil {isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull])};

sleep 1;
_veh = nearestObject [_spawnObj, "AllVehicles"];
_dis = _veh distance _spawnObj;

if(_dis > 10)then{
	hint "No vehicle spawned";
	sleep 2;
	_veh = nearestObjects [_spawnObj, ["AllVehicles"], 50];
	{
	    if(local _x && _x != player)then{
			deleteVehicle _x;
		};
	} forEach _veh;
}else{
	{
		deleteVehicle _x;
	}forEach (crew _veh);
	_codeE = [_veh]call BIS_fnc_exportVehicle;
	_class = typeOf _veh;
	deleteVehicle _veh;

	_codeS = [_codeE,"position player","(getPos player)",true] call Zen_StringFindReplace;
	//Fix script errors in export, 'cause LOL, I really should be the one doing that
	switch (_class) do {
	    case ("RHS_M2A3"): {
	        _codeS = [_codeS,"true",",0",true] call Zen_StringFindReplace;
	    };
		case ("RHS_M2A3_BUSKI"): {
	        _codeS = [_codeS,"true",",0",true] call Zen_StringFindReplace;
	    };
		case ("RHS_M2A3_BUSKIII"): {
	        _codeS = [_codeS,"true",",0",true] call Zen_StringFindReplace;
	    };
	};
	_codeS = _codeS + "_veh allowDamage false; _veh";
	_code = compile _codeS;
	_veh = []call _code;

	//Failsafe
	if(isNil{_veh})then{
		hint "Error in loading vehicle, spawning standard one";
		_veh = _class createVehicle [0,0,100];
	};
	
	_veh setPos getPos _spawnObj;
	_veh setDir (getDir _spawnObj);

	sleep 1;

	_veh allowDamage true;
	_veh enableSimulation true;

	[_veh]spawn JOC_vehInit;
};
