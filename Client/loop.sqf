/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
	_placeHolder = objNull;

	if(!isNull curatorCamera)then{
		_curator = (getAssignedCuratorLogic player);
		[[_curator],{
			params["_curator"];
			_curator addCuratorEditableObjects [(allUnits - [cacheGroupLeaderCiv, cacheGroupLeaderEast, placeholderGroupLeaderWest]),false];
			_curator addCuratorEditableObjects [allDead,false];
			_curator addCuratorEditableObjects [vehicles,false];
		}] remoteExec ["BIS_fnc_spawn", 2];

	};

	//Captive and caching stuff
	if(captive player)then{
		_placeHolder = placeholderGroupWest createUnit ["b_survivor_F",(getPos player), [], 0, "NONE"];
		[[_placeHolder],{
			params["_placeHolder"];
			_placeHolder enableSimulationGlobal false;
			_placeHolder hideObjectGlobal true;
		}] remoteExec ["BIS_fnc_spawn", 2];

	}else{
		player setVariable ["captureIP", false, true];
		deleteVehicle _placeHolder;
	};

	sleep 5;
};
