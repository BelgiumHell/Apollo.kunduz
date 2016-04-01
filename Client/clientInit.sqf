/////////////////////////
//Script made by Jochem//
/////////////////////////
sleep 1;

//Scripts
[]spawn JOC_clientLoop;
//[]call JOC_garage;
//[]call JOC_clientClick;

//Set variables
player setVariable ["captureIP", false, true];
player setVariable ["combat", false, true];

//EH
player addEventHandler ["Fired", {
	[]spawn{
		player setVariable ["combat", true, true];
		sleep 400;
		player setVariable ["combat", false, true];
	};
}];

//Ace interaction
//View distance
_viewDistanceI = ["ViewDistance","View distance","",{[]spawn CHVD_fnc_openDialog},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _viewDistanceI] call ace_interact_menu_fnc_addActionToObject;
//Defuse IED
_defuseI = ["defuseIED", "Defuse IED", "", {
	[30, [_this select 0], {_trg = ((_this select 0) select 0) getVariable "JOC_trg"; deleteVehicle _trg; deleteVehicle ((_this select 0) select 0);}, {((_this select 0) select 0) setDamage 1;}, "Defusing"] call ace_common_fnc_progressBar;
}, {true}] call ace_interact_menu_fnc_createAction;
["IEDLandBig_F", 0, ["ACE_MainActions"], _defuseI] call ace_interact_menu_fnc_addActionToClass;

//Arsenal fix
["Preload"]call XLA_fnc_arsenal;

player enableSimulation true;

//Loadouts
[]execVM "onPlayerRespawn.sqf";

//intro text
_date = date;
_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;

_name = name player;

if(_hour < 10)then{
	_hour = format["0%1",_hour];
};
if(_minute < 10)then{
	_minute = format["0%1",_minute];
};

_textDate = format["%3/%2/%1 - %4%5hrs",_year,_month,_day,_hour,_minute];
_textName = format["%1 - ISAF",_name];
waitUntil {!isNull player};
waitUntil {player == player};

[
	[
		["Apollo","<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
		[_textDate,"<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
		[_textName,"<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
        ["FOB Prince","<t align = 'center' shadow = '1' size = '0.6'>%1</t><br/>"],
        [worldName,"<t align = 'center' shadow = '1' size = '0.6'>%1</t>",30]
	],
    1,
    1,
    "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

/*
[{
	_nearestEntities = (getPos player) nearEntities [["Man"],300];
	if(cameraOn isEqualTo player && {cameraView isEqualTo "EXTERNAL"})then{
		{
		    if(lineIntersects [eyePos player, aimPos _x, player, _x])then{
				_x hideObject true;
			}else{
				_x hideObject false;
			};
		} forEach _nearestEntities;
	}else{
		{
		    _x hideObject false;
		} forEach _nearestEntities;
	};
}, 0, []] call CBA_fnc_addPerFrameHandler;
*/
