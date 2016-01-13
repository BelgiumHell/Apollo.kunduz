/////////////////////////
//Script made by Jochem//
/////////////////////////
sleep 1;
//intro text
_date = date;
_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;

_rank = rank player;
_name = name player;

if(_hour < 10)then{
	_hour = format["0%1",_hour];
};

_textDate = format["%3/%2/%1 - %4%5hrs",_year,_month,_day,_hour,_minute];
_textName = format["%1 %2 - ISAF",_rank,_name];
waitUntil {!isNull player};
waitUntil {player == player};

//Arsenal fix
["Preload"]call XLA_fnc_arsenal;

//Set basic loadout
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
player forceAddUniform "G2_RU_MTP";
player addVest "JPC_MC_1";
player addHeadgear "crye_airframe_tan_AF_VAS_cover";

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

//Start client loop
[]spawn JOC_clientLoop;

//Add clicking on mpa function - disabled: Ctab should be used instead
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
_viewDistanceI = ["ViewDistance","View distance","",{[]spawn CHVD_fnc_openDialog},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _viewDistanceI] call ace_interact_menu_fnc_addActionToObject;
