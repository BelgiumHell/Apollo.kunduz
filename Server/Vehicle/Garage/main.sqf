/////////////////////////
//Script made by Jochem//
/////////////////////////
_airA = ["rhsusf_CH53E_USMC_D","RHS_UH1Y_FFAR_d","RHS_UH1Y_d","RHS_UH1Y_UNARMED_d","RHS_AH1ZR"];
_carA = ["EWK_m1151_m2_deployment_AT4","ExA_RG31_M2","EWK_m1151_TOW_deployment","EWK_m1151_m240_deployment","DAR_MK23ADT"];
_armorA = ["rhsusf_m1a2sep1d_usarmy","rhsusf_m1a2sep1tuskid_usarmy","rhsusf_m1a2sep1tuskiid_usarmy","RHS_M2A3_wd","RHS_M2A3_BUSKI_wd","RHS_M2A3_BUSKIII_wd","rhsusf_m113_usarmy","rhsusf_m113_usarmy_M240","rhsusf_m113_usarmy_MK19","B_MBT_01_cannon_F","B_MBT_01_TUSK_F","B_APC_Wheeled_01_cannon_F"];
_suppA = [];
_medA = ["EWK_M997A2_Ambulance_Tan"];
_jetA = ["rhsusf_f22","RHS_A10","JS_JC_FA18E","JS_JC_FA18F","FIR_F14D"];

garage_spawner_0 addAction ["Request vehicle",{
	if(garage_spawn_0 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_0),["AllVehicles"],3] - [garage_spawn_0]);
	if((count _veh) >= 1)then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_0), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		testV = _array;
		["Open",_array] call BIS_fnc_garage;
		[garage_spawn_0]spawn JOC_garageFnc;
	};
},_airA];

garage_spawner_1 addAction ["Request vehicle",{
	if(garage_spawn_1 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_1),["AllVehicles"],3] - [garage_spawn_1]);
	if((count _veh) >= 1)then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_1), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		BIS_fnc_garage_data = _array;
		testV = _array;
		["Open",_array] call BIS_fnc_garage;
		[garage_spawn_1]spawn JOC_garageFnc;
	};
},_jetA];

garage_spawner_2 addAction ["Request vehicle",{
	if(garage_spawn_2 getVariable "unable")exitWith{hint "Pad not available"};
	_veh = (nearestObjects [(getPos garage_spawn_2),["AllVehicles"],3] - [garage_spawn_2]);
	if((count _veh) >= 1)then{
		hint "Pad not clear or max vehicles reached";
	}else{
		BIS_fnc_garage_center = createVehicle ["Land_HelipadEmpty_F", (getPos garage_spawn_2), [], 0, "CAN_COLLIDE" ];
		_array = [(_this select 3)]call JOC_garageGetArray;
		testV = _array;
		BIS_fnc_garage_data = _array;
		["Open",_array] call BIS_fnc_garage;
		[garage_spawn_2]spawn JOC_garageFnc;
	};
},_carA];
