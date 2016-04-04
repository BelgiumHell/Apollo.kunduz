/////////////////////////
//Script made by Jochem//
/////////////////////////
diag_log "serverInit";

//Parameters *FREE TO EDIT*
infantryPool = ["CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_GL","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_SVD"]; //infantry classnames
truckPool = ["LOP_ISTS_Landrover","LOP_ISTS_Landrover_M2","LOP_ISTS_Offroad","LOP_ISTS_Offroad_M2","LOP_ISTS_Truck"];
civPool = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_04","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_02"];
population = 0.25;           //Percentage of houses to occupy. 0-none // 1-all

//Init variables *DON'T CHANGE*
//Init caching vars
civGroup = createGroup civilian;
cacheGroupEast = createGroup east;
cacheGroupCiv = createGroup civilian;
placeholderGroupWest = createGroup west;
[civGroupLeader] joinSilent civGroup;
[cacheGroupLeaderEast] joinSilent cacheGroupEast;
[cacheGroupLeaderCiv] joinSilent cacheGroupCiv;
[placeholderGroupLeaderWest] joinSilent placeholderGroupWest;
publicVariable "placeholderGroupWest";
cachedArray = [];
virtualizedArray = [];
JOC_pauseCache = false;

//arsenalBoxes = [arsenal1,arsenal2,arsenal3];
iedArray = [];
houses = [];
housesMain = [];
housesBlack = [];
housesVillages = [];
housesSafe = [];
homes = [];
hideouts = [];

//ACRE setup
[true] call acre_api_fnc_setRevealToAI;
[1] call acre_api_fnc_setLossModelScale;
[true] call acre_api_fnc_setFullDuplex;
[true] call acre_api_fnc_setInterference;

//Markers
_marker = createMarker ["mrk_area", [0,0,0]];
"mrk_area" setMarkerShape "RECTANGLE";
"mrk_area" setMarkerPos [worldSize/2,worldSize/2];
"mrk_area" setMarkerSize [worldSize/2,worldSize/2];
"mrk_area" setMarkerAlpha 0;
_marker = createMarker ["mrk_dropZone", [0,0,0]];
"mrk_dropZone" setMarkerShape "RECTANGLE";
"mrk_dropZone" setMarkerPos [worldSize/2,worldSize/2];
"mrk_dropZone" setMarkerSize [worldSize/2 - (worldSize/2/4),worldSize/2 - (worldSize/2/4)];
"mrk_dropZone" setMarkerAlpha 0;


//Generate houses to use
[]call JOC_initGenerateCompounds;

//Get from database
if(typeName (["read", ["main", "virtualizedArray_0",0]] call inidbi) != typeName 0)then{
    _index = 0;
    while{typeName (["read", ["main", format["virtualizedArray_%1",_index],0]] call inidbi) != typeName 0}do{
        virtualizedArray = virtualizedArray + [(["read", ["main", format["virtualizedArray_%1",_index]]] call inidbi)];
        _index = _index + 1;
    };
};
if(typeName (["read", ["main", "housesDamage",0]] call inidbi) != typeName 0)then{
    _housesDamage = ["read", ["main", "housesDamage"]] call inidbi;
    {
        _x setDamage (_housesDamage select _forEachIndex);
    } forEach houses;
};
if(typeName (["read", ["main", "homes",0]] call inidbi) != typeName 0)then{
    homes = ["read", ["main", "homes"]] call inidbi;
};
if(typeName (["read", ["main", "hideouts",0]] call inidbi) != typeName 0)then{
    hideouts = ["read", ["main", "hideouts"]] call inidbi;
};

//Call
[]call JOC_initMisc;
[]call JOC_supplySupplySelect;
[[],{
    progressLoadingScreen 0.3;
}] remoteExec ["BIS_fnc_spawn", 0, true];

_newSpawn = (count virtualizedArray == 0);

if(_newSpawn)then{
    []call JOC_spawnCivilians;
};

[[],{
    progressLoadingScreen 0.6;
}] remoteExec ["BIS_fnc_spawn", 0, true];
if(_newSpawn)then{
    //[]call JOC_spawnRebels;
};

[[],{
    progressLoadingScreen 0.9;
}] remoteExec ["BIS_fnc_spawn", 0, true];
{
    [_x]call JOC_unVirtualize;
} forEach virtualizedArray;

[[],{
    endLoadingScreen;
    JOC_serverLoaded = true;
    if(!isServer)then{
        waitUntil {!isNil{JOC_clientLoaded}};
        []spawn JOC_clientInit;
    };
}] remoteExec ["BIS_fnc_spawn", 0, true];;

JOC_initComplete = true;
publicVariable "JOC_initComplete";
[[],{
    hint "Mission loaded, have fun";
}] remoteExec ["BIS_fnc_spawn", 0, true];

//Spawn
[]spawn JOC_aiManager;
[]spawn JOC_miscClean;
[]spawn JOC_managerSupply;
