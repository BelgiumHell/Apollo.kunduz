/////////////////////////
//Script made by Jochem//
/////////////////////////
JOC_HC = true;
publicVariable "JOC_HC";

waitUntil {JOC_initComplete};

//Transfer groups
{
    if((count((units _x) - (switchableUnits + playableUnits))) == (count (units _x)))then{
        _x setGroupOwner (owner HC);
    };
} forEach allGroups;
