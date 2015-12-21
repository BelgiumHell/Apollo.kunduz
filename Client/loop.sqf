/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
	if(!isNull curatorCamera)then{
		_curator = (getAssignedCuratorLogic player);
		[[_curator],{
			_curator = _this select 0;
			_curator addCuratorEditableObjects [(allUnits - [cacheGroupLeader]),false];
			_curator addCuratorEditableObjects [allDead,false];
			_curator addCuratorEditableObjects [vehicles,false];
		}] remoteExec ["BIS_fnc_spawn", 2];

	};
	sleep 10;
};
