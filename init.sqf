/////////////////////////
//Script made by Jochem//
/////////////////////////

// Apollo by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.56>

enableSaving [false, false];
sleep 1;
startLoadingScreen["Loading..."];

if(isServer)then{
    #include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
    #include "Server\serverCompile.sqf";

    inidbi = ["new", "MERCURY"] call OO_INIDBI;

    JOC_initComplete = false;
    publicVariable "JOC_initComplete";

    exec "Server\serverInit.sqs";
}else{

    if(!hasInterface)then{
        #include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
        #include "Server\serverCompile.sqf";
        []call HCInit;
    }else{
        #include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
        #include "Client\clientCompile.sqf";
        #include "Server\serverCompile.sqf";
        JOC_clientLoaded = true;
        playerStartPos = getPosWorld player;
        player enableSimulation false;
    };
};
