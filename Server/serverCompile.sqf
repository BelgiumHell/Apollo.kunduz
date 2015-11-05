/////////////////////////
//Script made by Jochem//
/////////////////////////
JOC_serverInit = compileFinal preprocessFileLineNumbers "Server\serverInit.sqf";

//AI
JOC_aiManager = compileFinal preprocessFileLineNumbers "Server\AI\aiManager.sqf";
JOC_cache = compileFinal preprocessFileLineNumbers "Server\AI\cache.sqf";
JOC_cacheUnits = compileFinal preprocessFileLineNumbers "Server\AI\cacheUnits.sqf";
JOC_virtualize = compileFinal preprocessFileLineNumbers "Server\AI\virtualize.sqf";
JOC_unCache = compileFinal preprocessFileLineNumbers "Server\AI\unCache.sqf";
JOC_unVirtualize = compileFinal preprocessFileLineNumbers "Server\AI\unVirtualize.sqf";

//Civilian
JOC_civBehavior = compileFinal preprocessFileLineNumbers "Server\Civilian\behavior.sqf";
JOC_civLoiter = compileFinal preprocessFileLineNumbers "Server\Civilian\loiter.sqf";
JOC_spawnCivilians = compileFinal preprocessFileLineNumbers "Server\Civilian\spawnCivilians.sqf";

//Core
JOC_supply = compileFinal preprocessFileLineNumbers "Server\Core\supply.sqf";

//Init
JOC_initGenerateCompounds = compileFinal preprocessFileLineNumbers "Server\Init\generateCompounds.sqf";

//Rebel
JOC_rebelCreateHideout = compileFinal preprocessFileLineNumbers "Server\Rebel\Functions\createHideout.sqf";
JOC_rebelPlaceIED = compileFinal preprocessFileLineNumbers "Server\Rebel\Functions\placeIED.sqf";
JOC_rebelBehaviour = compileFinal preprocessFileLineNumbers "Server\Rebel\behaviour.sqf";
JOC_rebelPatrol = compileFinal preprocessFileLineNumbers "Server\Rebel\patrol.sqf";
JOC_spawnRebels = compileFinal preprocessFileLineNumbers "Server\Rebel\spawnRebels.sqf";
