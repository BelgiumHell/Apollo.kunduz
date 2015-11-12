/////////////////////////
//Script made by Jochem//
/////////////////////////

// RealOps by Jochem
// Version = 0.6
// Tested with ArmA 3 <1.52>

enableSaving [false, false];

if(isServer)then{

}else{

    if(!hasInterface)then{
        #include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
        #include "Server\serverCompile.sqf";
        []call HCInit;
    }else{
        #include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
        #include "Client\clientCompile.sqf";
        if(!JOC_initComplete)then{
            hint "Mission not loaded, please remain in base";
        };
        sleep 1;
        []call JOC_clientInit;
    };
};
