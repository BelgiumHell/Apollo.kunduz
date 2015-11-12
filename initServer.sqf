/////////////////////////
//Script made by Jochem//
/////////////////////////
#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Server\serverCompile.sqf";

JOC_initComplete = false;
publicVariable "JOC_initComplete";

[]call JOC_serverInit;
