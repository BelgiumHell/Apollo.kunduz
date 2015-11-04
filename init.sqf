/////////////////////////
//Script made by Jochem//
/////////////////////////

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Server\serverCompile.sqf";
//#include "Client\clientCompile.sqf";

// RealOps by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.52>

enableSaving [false, false];

if(isServer)then{
    []call JOC_serverInit;
}else{
    //startLoadingScreen ["Init"];
};
