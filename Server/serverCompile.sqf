/////////////////////////
//Script made by Jochem//
/////////////////////////
JOC_serverInit = compileFinal preprocessFileLineNumbers "Server\serverInit.sqf";

//AI
JOC_aiManager = compileFinal preprocessFileLineNumbers "Server\AI\aiManager.sqf";
JOC_cache = compileFinal preprocessFileLineNumbers "Server\AI\cache.sqf";
JOC_cacheUnits = compileFinal preprocessFileLineNumbers "Server\AI\cacheUnits.sqf";
JOC_unCache = compileFinal preprocessFileLineNumbers "Server\AI\unCache.sqf";
JOC_HCInit = compileFinal preprocessFileLineNumbers "Server\AI\HCInit.sqf";
JOC_virtualize = compileFinal preprocessFileLineNumbers "Server\AI\virtualize.sqf";
JOC_unVirtualize = compileFinal preprocessFileLineNumbers "Server\AI\unVirtualize.sqf";

//Civilian
JOC_civAid = compileFinal preprocessFileLineNumbers "Server\Civilian\aid.sqf";
JOC_civBehaviour = compileFinal preprocessFileLineNumbers "Server\Civilian\behaviour.sqf";
JOC_civBomber = compileFinal preprocessFileLineNumbers "Server\Civilian\bomber.sqf";
JOC_civjoinRebels = compileFinal preprocessFileLineNumbers "Server\Civilian\joinRebels.sqf";
JOC_civLoiter = compileFinal preprocessFileLineNumbers "Server\Civilian\loiter.sqf";
JOC_civMosque = compileFinal preprocessFileLineNumbers "Server\Civilian\mosque.sqf";
JOC_spawnCivilians = compileFinal preprocessFileLineNumbers "Server\Civilian\spawnCivilians.sqf";

//Init
JOC_initGenerateCompounds = compileFinal preprocessFileLineNumbers "Server\Init\generateCompounds.sqf";
JOC_initMisc = compileFinal preprocessFileLineNumbers "Server\Init\misc.sqf";

//Manager
JOC_managerBft = compileFinal preprocessFileLineNumbers "Server\Manager\bft.sqf";
JOC_managerSupply = compileFinal preprocessFileLineNumbers "Server\Manager\supply.sqf";
JOC_managerTask = compileFinal preprocessFileLineNumbers "Server\Manager\task.sqf";

//Misc
JOC_miscClean = compileFinal preprocessFileLineNumbers "Server\Misc\clean.sqf";
JOC_crateAmmo = compileFinal preprocessFileLineNumbers "Server\Misc\crateAmmo.sqf";
JOC_crateMedical = compileFinal preprocessFileLineNumbers "Server\Misc\crateMedical.sqf";
JOC_miscFindCenter = compileFinal preprocessFileLineNumbers "Server\Misc\findCenter.sqf";
JOC_miscGetNearest = compileFinal preprocessFileLineNumbers "Server\Misc\getNearest.sqf";
JOC_miscIed = compileFinal preprocessFileLineNumbers "Server\Misc\ied.sqf";
JOC_miscNearestPlants = compileFinal preprocessFileLineNumbers "Server\Misc\nearestPlants.sqf";
JOC_miscSave = compileFinal preprocessFileLineNumbers "Server\Misc\save.sqf";

//Rebel
JOC_rebelCreateHideout = compileFinal preprocessFileLineNumbers "Server\Rebel\Functions\createHideout.sqf";
JOC_rebelPlaceIED = compileFinal preprocessFileLineNumbers "Server\Rebel\Functions\placeIED.sqf";
JOC_rebelBehaviour = compileFinal preprocessFileLineNumbers "Server\Rebel\behaviour.sqf";
JOC_rebelCapture = compileFinal preprocessFileLineNumbers "Server\Rebel\capture.sqf";
JOC_rebelDefend = compileFinal preprocessFileLineNumbers "Server\Rebel\defend.sqf";
JOC_rebelPatrol = compileFinal preprocessFileLineNumbers "Server\Rebel\patrol.sqf";
JOC_spawnRebels = compileFinal preprocessFileLineNumbers "Server\Rebel\spawnRebels.sqf";

//Supply
JOC_supplyArsenal = compileFinal preprocessFileLineNumbers "Server\Supply\arsenal.sqf";
JOC_supplyMerge = compileFinal preprocessFileLineNumbers "Server\Supply\merge.sqf";
JOC_supplySpawnObject = compileFinal preprocessFileLineNumbers "Server\Supply\spawnObject.sqf";
JOC_supplySupplySelect = compileFinal preprocessFileLineNumbers "Server\Supply\supplySelect.sqf";

//Tasks
JOC_taskHostage = compileFinal preprocessFileLineNumbers "Server\Tasks\hostage.sqf";
JOC_taskHVT = compileFinal preprocessFileLineNumbers "Server\Tasks\hvt.sqf";

//Vehicle
#include "Vehicle\fn_vehicle_compile.sqf";
JOC_service = compileFinal preprocessFileLineNumbers "Server\Vehicle\service.sqf";
JOC_vehInit = compileFinal preprocessFileLineNumbers "Server\Vehicle\vehInit.sqf";
