/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
	_placeHolder = objNull;

	if(!isNull curatorCamera)then{
		_curator = (getAssignedCuratorLogic player);
		[[_curator],{
			params["_curator"];
			_curator addCuratorEditableObjects [(allUnits - [civGroupLeader, cacheGroupLeaderCiv, cacheGroupLeaderEast, placeholderGroupLeaderWest]),false];
			_curator addCuratorEditableObjects [allDead,false];
			_curator addCuratorEditableObjects [vehicles,false];
		}] remoteExec ["BIS_fnc_spawn", 2];
	};

	//Captive and caching stuff
	if(!captive player)then{
		player setVariable ["captureIP", false, true];
	}else{
		_placeHolder = placeHolderGroupWest createUnit ["B_Soldier_F", [0,0,0], [], 0, "FORM"];
		[[_placeHolder],{
			params["_placeHolder"];
			_placeHolder hideObjectGlobal true;
			_placeHolder enableSimulationGlobal false;
			_placeHolder allowDamage false;
		}] remoteExec ["BIS_fnc_spawn", 2];
		waitUntil{isObjectHidden _placeHolder};
		_placeHolder setPosWorld (getPosWorld player);
		waitUntil{sleep 1; !captive player};
		deleteVehicle _placeHolder;
	};


	sleep 5;
};
