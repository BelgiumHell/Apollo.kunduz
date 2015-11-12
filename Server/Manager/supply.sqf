/////////////////////////
//Script made by Jochem//
/////////////////////////
cargoDrop = ["rhsusf_m1025_w_m2","rhsusf_m1025_w_m2","rhsusf_m998_d_2dr_halftop","rhsusf_m998_d_2dr_halftop"];

while{true}do{
    //Spawn aircraft
    _plane = createVehicle ["USAF_C17",getMarkerPos "mrk_jetStart", [], 0, "FLY"]; //[getMarkerPos "mrk_jetStart","USAF_C17",200]call Zen_SpawnAircraft;
    _group =[getMarkerPos "mrk_jetStart",["B_Pilot_F"]]call Zen_SpawnGroup;
    {
        _x moveInDriver _plane;
    } forEach (units _group);
    {
        _x setDamage 0;
        _x allowDamage false;
    } forEach (crew _plane);

    //Order aircraft move
    [_plane,getMarkerPos "mrk_dropzone","limited",70]spawn Zen_OrderVehicleMove;
    waitUntil{(_plane distance2D (getMarkerPos "mrk_dropZone")) < 100};

    //Drop cargo
    {
        _veh = _x createVehicle (getPosASL _plane);
        _veh setPosASL [((getPosASL _plane) select 0),(((getPosASL _plane) select 1) - 40),((getPosASL _plane) select 2)];
        sleep 0.05;
        [_veh,""]spawn Zen_SpawnParachute;
    } forEach cargoDrop;

    //Order to move to end point
    [_plane,getMarkerPos "mrk_jetEnd","normal",2000]spawn Zen_OrderVehicleMove;

    //Delete aircraft
    waitUntil{(_plane distance2d (getMarkerPos "mrk_jetEnd")) < 500};
    {
        deleteVehicle _x;
    } forEach (crew _plane);
    deleteVehicle _plane;

    sleep 1800;
};
