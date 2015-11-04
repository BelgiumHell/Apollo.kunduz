/////////////////////////
//Script made by Jochem//
/////////////////////////
//Parameters *FREE TO EDIT*
infantryPool = ["CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_GL","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_SVD"];    //infantry classnames
civPool = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_04","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_02"];
population = 0.05;           //Percentage of houses to occupy. 0-none // 1-all

//Init variables *DON'T CHANGE*
//Init caching vars
cacheGroupEast = createGroup east;
cacheGroupCiv = createGroup civilian;
[cacheGroupLeaderEast] joinSilent cacheGroupEast;
[cacheGroupLeaderCiv] joinSilent cacheGroupCiv;
cachedArray = [];

//Spawn
//[]call JOC_aiManager;

//Call
[]call JOC_initGenerateCompounds;
[]call JOC_spawnCivilians;
[]call JOC_spawnRebels;
