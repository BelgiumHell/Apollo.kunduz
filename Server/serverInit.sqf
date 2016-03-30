/////////////////////////
//Script made by Jochem//
/////////////////////////
//Parameters *FREE TO EDIT*
infantryPool = ["CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_GL","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_SVD"];    //infantry classnames
civPool = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_04","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_02"];
population = 0.2;           //Percentage of houses to occupy. 0-none // 1-all

//Init variables *DON'T CHANGE*
//Init caching vars
cacheGroupEast = createGroup east;
cacheGroupCiv = createGroup civilian;
placeholderGroupWest = createGroup west;
[cacheGroupLeaderEast] joinSilent cacheGroupEast;
[cacheGroupLeaderCiv] joinSilent cacheGroupCiv;
[placeholderGroupLeaderWest] joinSilent placeholderGroupWest;
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

_marker = createMarker ["mrk_dropZone", [0,0,0]];
"mrk_dropZone" setMarkerShape "RECTANGLE";
"mrk_dropZone" setMarkerPos [worldSize/2,worldSize/2];
"mrk_dropZone" setMarkerSize [worldSize/2 - (worldSize/2/5),worldSize/2 - (worldSize/2/5)];
"mrk_dropZone" setMarkerAlpha 0;

//Call
[]call JOC_supplySupplySelect;
[]call JOC_initGenerateCompounds;
//[]call JOC_spawnCivilians;
[]call JOC_spawnRebels;

JOC_initComplete = true;
publicVariable "JOC_initComplete";
[[],{
    hint "Mission loaded, have fun";
}] remoteExec ["BIS_fnc_spawn", 0, true];

sleep 10;

//Spawn
[]spawn JOC_aiManager;
[]spawn JOC_managerSupply;
[]spawn JOC_miscClean;
