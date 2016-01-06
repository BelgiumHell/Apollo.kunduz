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

//Civilian
JOC_civBehaviour = compileFinal preprocessFileLineNumbers "Server\Civilian\behaviour.sqf";
JOC_civBomber = compileFinal preprocessFileLineNumbers "Server\Civilian\bomber.sqf";
JOC_civLoiter = compileFinal preprocessFileLineNumbers "Server\Civilian\loiter.sqf";
JOC_spawnCivilians = compileFinal preprocessFileLineNumbers "Server\Civilian\spawnCivilians.sqf";

//Core
JOC_supply = compileFinal preprocessFileLineNumbers "Server\Core\supply.sqf";

//Init
JOC_initGenerateCompounds = compileFinal preprocessFileLineNumbers "Server\Init\generateCompounds.sqf";

//Manager
JOC_managerBft = compileFinal preprocessFileLineNumbers "Server\Manager\bft.sqf";
JOC_managerSupply = compileFinal preprocessFileLineNumbers "Server\Manager\supply.sqf";
JOC_managerTask = compileFinal preprocessFileLineNumbers "Server\Manager\task.sqf";

//Misc
JOC_miscFindCenter = compileFinal preprocessFileLineNumbers "Server\Misc\findCenter.sqf";
JOC_miscIed = compileFinal preprocessFileLineNumbers "Server\Misc\ied.sqf";

//Rebel
JOC_rebelCreateHideout = compileFinal preprocessFileLineNumbers "Server\Rebel\Functions\createHideout.sqf";
JOC_rebelPlaceIED = compileFinal preprocessFileLineNumbers "Server\Rebel\Functions\placeIED.sqf";
JOC_rebelHvtbehaviourCmd = compileFinal preprocessFileLineNumbers "Server\Rebel\HVT\behaviourCmd.sqf";
JOC_rebelHvtbehaviourField = compileFinal preprocessFileLineNumbers "Server\Rebel\HVT\behaviourField.sqf";
JOC_rebelHvtbehaviourLt = compileFinal preprocessFileLineNumbers "Server\Rebel\HVT\behaviourLT.sqf";
JOC_rebelBehaviour = compileFinal preprocessFileLineNumbers "Server\Rebel\behaviour.sqf";
JOC_rebelCapture = compileFinal preprocessFileLineNumbers "Server\Rebel\capture.sqf";
JOC_rebelDefend = compileFinal preprocessFileLineNumbers "Server\Rebel\defend.sqf";
JOC_rebelPatrol = compileFinal preprocessFileLineNumbers "Server\Rebel\patrol.sqf";
JOC_spawnRebels = compileFinal preprocessFileLineNumbers "Server\Rebel\spawnRebels.sqf";

//Supply
JOC_supplyMerge = compileFinal preprocessFileLineNumbers "Server\Supply\merge.sqf";
JOC_supplySupplySelect = compileFinal preprocessFileLineNumbers "Server\Supply\supplySelect.sqf";

//Tasks
JOC_taskHostage = compileFinal preprocessFileLineNumbers "Server\Tasks\hostage.sqf";
JOC_taskHVT = compileFinal preprocessFileLineNumbers "Server\Tasks\hvt.sqf";

//Vehicle
JOC_vehInit = compileFinal preprocessFileLineNumbers "Server\Vehicle\vehInit.sqf";
