/////////////////////////
//Script made by Jochem//
/////////////////////////
//Parameters *FREE TO EDIT*
infantryPool = ["CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_GL","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_SVD"];    //infantry classnames
civPool = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_04","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_02"];
population = 0.4;           //Percentage of houses to occupy. 0-none // 1-all

//Init variables *DON'T CHANGE*
//Init caching vars
cacheGroupEast = createGroup east;
cacheGroupCiv = createGroup civilian;
[cacheGroupLeaderEast] joinSilent cacheGroupEast;
[cacheGroupLeaderCiv] joinSilent cacheGroupCiv;
cachedArray = [];

iedArray = [];
houses = [];
housesMain = [];
homes = [];
hideouts = [];
hideoutsMain = [];

hvtFieldArray = [];
hvtLtArray = [];

//ACRE setup
[true] call acre_api_fnc_setRevealToAI;
[1] call acre_api_fnc_setLossModelScale;
[true] call acre_api_fnc_setFullDuplex;
[true] call acre_api_fnc_setInterference;

_marker = createMarker ["mrk_area", [0,0,0]];
"mrk_area" setMarkerShape "RECTANGLE";
"mrk_area" setMarkerPos [worldSize/2,worldSize/2];
"mrk_area" setMarkerSize [worldSize/2,worldSize/2];
"mrk_area" setMarkerAlpha 0;

//Call
[]call JOC_supplySupplySelect;
[]call JOC_initGenerateCompounds;
[]call JOC_spawnCivilians;
[]call JOC_spawnRebels;

JOC_initComplete = true;
publicVariable "JOC_initComplete";
[[],{
    hint "Mission loaded, have fun";
}] remoteExec ["BIS_fnc_spawn", 0, true];

//Spawn
[]spawn JOC_aiManager;
//[]spawn JOC_managerBft;
[]spawn JOC_managerSupply;
//[]spawn JOC_managerTask;

[]spawn{
    while{true}do{
        //Remove destroyed ieds from array
        iedArray = iedArray - [objNull];

        //Cleanup
        _items = nearestObjects [(getMarkerPos "mrk_area"), ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 10000];
        {
        	_nearestPlayers = [];
        	_location = (getPos this);
            {
                if (isPlayer _x && _x distance _location < 500) then {
                    _nearestPlayers pushBack _x;
                };
            } forEach (playableUnits + switchableUnits);
            if(count _nearestPlayers == 0)then{
        		deleteVehicle _x;
        	};
        }forEach _items;

        _items = nearestObjects [(getMarkerPos "mrk_base"), ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 100];
        {
        	deleteVehicle _x;
        }forEach _items;
        {
        	_nearestPlayers = [];
        	_location = (getPos this);
            {
                if (isPlayer _x && _x distance _location < 500) then {
                    _nearestPlayers pushBack _x;
                };
            } forEach (playableUnits + switchableUnits);

            if(count _nearestPlayers == 0 or (_x distance respawn_obj) < 100)then{
        		_pad = (_x getVariable "pad");
        		_pad setVariable["count",((_pad getVariable "count") - 1),true];
        		deleteVehicle _x;
        	};
        }forEach allDead;
    };
};
