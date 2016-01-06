/////////////////////////
//Script made by Jochem//
/////////////////////////
supplyDrop = [];
publicVariable "supplyDrop";

[[],{
    hint "New supplies will be delivered in 10 minutes";
}] remoteExec ["BIS_fnc_spawn", 0, true];
sleep 600;

while{true}do{
    //You can't change drop while aircraft is in the air
    _supplyDrop = supplyDrop;
    _cargoDrop = [];

    //Spawn aircraft
    _plane = createVehicle ["globemaster_c17_ZZ172_RAF",getMarkerPos "mrk_jetStart", [], 0, "FLY"]; //[getMarkerPos "mrk_jetStart","USAF_C17",200]call Zen_SpawnAircraft;
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
    switch (_supplyDrop) do {
        case ("Coyote"): {
            _cargoDrop = ["UK3CB_BAF_Coyote_Logistics_L111A1_D","UK3CB_BAF_Coyote_Passenger_L111A1_D"];
        };
        case ("Jackel"): {
            _cargoDrop = ["UK3CB_BAF_Jackal2_L2A1_D","UK3CB_BAF_Jackal2_L2A1_D"];
        };
        case ("Apache"): {
            _cargoDrop = ["UK3CB_BAF_Apache_AH1_JS"];
        };
        case ("Merlin"): {
            _cargoDrop = ["UK3CB_BAF_Vehicles_Merlin_RAF_ZJ124"];
        };
        case ("Day"): {
            _cargoDrop = ["B_CargoNet_01_ammo_F"];
        };
        case ("Night"): {
            _cargoDrop = ["B_CargoNet_01_ammo_F"];
        };
        case ("Medical"): {
            _cargoDrop = ["CargoNet_01_box_F"];
        };
    };


    {
        _veh = _x createVehicle (getPosASL _plane);
        _veh setPosASL [((getPosASL _plane) select 0),(((getPosASL _plane) select 1) - 40),((getPosASL _plane) select 2)];
        sleep 0.15;
        [_veh,""]spawn Zen_SpawnParachute;

        clearWeaponCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        clearItemCargoGlobal _veh;

        [_veh]spawn JOC_vehInit;

        if(typeOf _veh == "B_CargoNet_01_ammo_F")then{
            switch (_supplyDrop) do {
                case ("Day"): {
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_30Rnd", 40];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_20Rnd", 20];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_75Rnd", 16];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_17Rnd_9mm", 12];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_100Rnd", 12];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_L115A3_Mag", 10];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Pellets", 8];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Slugs", 8];
                    _veh addMagazineCargoGlobal ["HandGrenade", 8];
                    _veh addItemCargoGlobal ["ACE_EarPlugs", 20];
                    _veh addMagazineCargoGlobal ["SmokeShell", 8];
                    _veh addMagazineCargoGlobal ["SmokeShellGreen", 4];
                    _veh addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
                    _veh addWeaponCargoGlobal ["tf47_at4_hp", 1];
                    _veh addWeaponCargoGlobal ["tf47_at4_hedp", 1];
                    _veh addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
                };
                case ("Night"): {
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_30Rnd_T", 40];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_20Rnd_T", 20];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_75Rnd_T", 16];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_17Rnd_9mm", 12];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_100Rnd_T", 12];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_L115A3_Mag", 10];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Pellets", 8];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Slugs", 8];
                    _veh addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_HEDP_Grenade_shell", 8];
                    _veh addMagazineCargoGlobal ["HandGrenade", 8];
                    _veh addItemCargoGlobal ["ACE_EarPlugs", 20];
                    _veh addMagazineCargoGlobal ["ACE_HandFlare_White", 4];
                    _veh addMagazineCargoGlobal ["ACE_HandFlare_Green", 4];
                    _veh addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
                    _veh addWeaponCargoGlobal ["tf47_at4_hp", 1];
                    _veh addWeaponCargoGlobal ["tf47_at4_hedp", 1];
                    _veh addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
                };
            };
            _action = ["merge", "Merge crate", "", {[_this select 0]call JOC_supplyMerge;}, {(_this select 0) distance2D boxArsenal < 15}] call ace_interact_menu_fnc_createAction;
            [_veh, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
        };
        if(typeOf _veh == "CargoNet_01_box_F")then{
            clearWeaponCargoGlobal _veh;
            clearMagazineCargoGlobal _veh;
            clearItemCargoGlobal _veh;
            _veh addItemCargoGlobal ["ACE_fieldDressing", 100];
            _veh addItemCargoGlobal ["ACE_packingBandage", 25];
            _veh addItemCargoGlobal ["ACE_elasticBandage", 25];
            _veh addItemCargoGlobal ["ACE_tourniquet", 10];
            _veh addItemCargoGlobal ["ACE_morphine", 50];
            _veh addItemCargoGlobal ["ACE_atropine", 25];
            _veh addItemCargoGlobal ["ACE_epinephrine", 50];
            _veh addItemCargoGlobal ["ACE_plasmaIV_500", 2];
            _veh addItemCargoGlobal ["ACE_bloodIV_500", 2];
            _veh addItemCargoGlobal ["ACE_salineIV_500", 2];
            _veh addItemCargoGlobal ["ACE_quikclot", 50];
            _veh addItemCargoGlobal ["ACE_surgicalKit", 10];
            _veh addItemCargoGlobal ["ACE_bodyBag", 2];
            _veh addItemCargoGlobal ["ACE_personalAidKit", 1];
            _action = ["merge", "Merge crate", "", {[_this select 0]call JOC_supplyMerge;}, {(_this select 0) distance2D boxArsenal < 15}] call ace_interact_menu_fnc_createAction;
            [_veh, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
        };
    } forEach _cargoDrop;

    //Order to move to end point
    [_plane,getMarkerPos "mrk_jetEnd","full",2000]spawn Zen_OrderVehicleMove;

    //Delete aircraft
    waitUntil{(_plane distance2d (getMarkerPos "mrk_jetEnd")) < 500};
    {
        deleteVehicle _x;
    } forEach (crew _plane);
    deleteVehicle _plane;

    sleep 1800;
    [[],{
        hint "New supplies will be delivered in 10 minutes";
    }] remoteExec ["BIS_fnc_spawn", 0, true];
    sleep 600;
};



/*
this addItemCargoGlobal ["ACE_fieldDressing", 100];
this addItemCargoGlobal ["ACE_packingBandage", 25];
this addItemCargoGlobal ["ACE_elasticBandage", 25];
this addItemCargoGlobal ["ACE_tourniquet", 10];
this addItemCargoGlobal ["ACE_morphine", 50];
this addItemCargoGlobal ["ACE_atropine", 25];
this addItemCargoGlobal ["ACE_epinephrine", 50];
this addItemCargoGlobal ["ACE_plasmaIV_500", 2];
this addItemCargoGlobal ["ACE_bloodIV_500", 2];
this addItemCargoGlobal ["ACE_salineIV_500", 2];
this addItemCargoGlobal ["ACE_quikclot", 50];
this addItemCargoGlobal ["ACE_surgicalKit", 10];
this addItemCargoGlobal ["ACE_bodyBag", 2];
this addItemCargoGlobal ["ACE_personalAidKit", 1];
this addItemCargoGlobal ["ACE_fieldDressing", 100];
this addItemCargoGlobal ["ACE_packingBandage", 25];
this addItemCargoGlobal ["ACE_elasticBandage", 25];
this addItemCargoGlobal ["ACE_tourniquet", 10];
this addItemCargoGlobal ["ACE_morphine", 50];
this addItemCargoGlobal ["ACE_atropine", 25];
this addItemCargoGlobal ["ACE_epinephrine", 50];
this addItemCargoGlobal ["ACE_plasmaIV_500", 2];
this addItemCargoGlobal ["ACE_bloodIV_500", 2];
this addItemCargoGlobal ["ACE_salineIV_500", 2];
this addItemCargoGlobal ["ACE_quikclot", 50];
this addItemCargoGlobal ["ACE_surgicalKit", 10];
this addItemCargoGlobal ["ACE_bodyBag", 2];
this addItemCargoGlobal ["ACE_personalAidKit", 1];
this addItemCargoGlobal ["ACE_fieldDressing", 100];
this addItemCargoGlobal ["ACE_packingBandage", 25];
this addItemCargoGlobal ["ACE_elasticBandage", 25];
this addItemCargoGlobal ["ACE_tourniquet", 10];
this addItemCargoGlobal ["ACE_morphine", 50];
this addItemCargoGlobal ["ACE_atropine", 25];
this addItemCargoGlobal ["ACE_epinephrine", 50];
this addItemCargoGlobal ["ACE_plasmaIV_500", 2];
this addItemCargoGlobal ["ACE_bloodIV_500", 2];
this addItemCargoGlobal ["ACE_salineIV_500", 2];
this addItemCargoGlobal ["ACE_quikclot", 50];
this addItemCargoGlobal ["ACE_surgicalKit", 10];
this addItemCargoGlobal ["ACE_bodyBag", 2];
this addItemCargoGlobal ["ACE_personalAidKit", 1];
this addItemCargoGlobal ["ACE_fieldDressing", 100];
this addItemCargoGlobal ["ACE_packingBandage", 25];
this addItemCargoGlobal ["ACE_elasticBandage", 25];
this addItemCargoGlobal ["ACE_tourniquet", 10];
this addItemCargoGlobal ["ACE_morphine", 50];
this addItemCargoGlobal ["ACE_atropine", 25];
this addItemCargoGlobal ["ACE_epinephrine", 50];
this addItemCargoGlobal ["ACE_plasmaIV_500", 2];
this addItemCargoGlobal ["ACE_bloodIV_500", 2];
this addItemCargoGlobal ["ACE_salineIV_500", 2];
this addItemCargoGlobal ["ACE_quikclot", 50];
this addItemCargoGlobal ["ACE_surgicalKit", 10];
this addItemCargoGlobal ["ACE_bodyBag", 2];
this addItemCargoGlobal ["ACE_personalAidKit", 1];
this addMagazineCargoGlobal ["UK3CB_BAF_30Rnd_T", 40];
this addMagazineCargoGlobal ["UK3CB_BAF_20Rnd_T", 20];
this addMagazineCargoGlobal ["UK3CB_BAF_75Rnd_T", 16];
this addMagazineCargoGlobal ["UK3CB_BAF_17Rnd_9mm", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_100Rnd_T", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_L115A3_Mag", 10];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Pellets", 8];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Slugs", 8];
this addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_HEDP_Grenade_shell", 8];
this addMagazineCargoGlobal ["HandGrenade", 8];
this addItemCargoGlobal ["ACE_EarPlugs", 20];
this addMagazineCargoGlobal ["ACE_HandFlare_White", 4];
this addMagazineCargoGlobal ["ACE_HandFlare_Green", 4];
this addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
this addWeaponCargoGlobal ["tf47_at4_hp", 1];
this addWeaponCargoGlobal ["tf47_at4_hedp", 1];
this addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
this addMagazineCargoGlobal ["UK3CB_BAF_30Rnd_T", 40];
this addMagazineCargoGlobal ["UK3CB_BAF_20Rnd_T", 20];
this addMagazineCargoGlobal ["UK3CB_BAF_75Rnd_T", 16];
this addMagazineCargoGlobal ["UK3CB_BAF_17Rnd_9mm", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_100Rnd_T", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_L115A3_Mag", 10];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Pellets", 8];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Slugs", 8];
this addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_HEDP_Grenade_shell", 8];
this addMagazineCargoGlobal ["HandGrenade", 8];
this addItemCargoGlobal ["ACE_EarPlugs", 20];
this addMagazineCargoGlobal ["ACE_HandFlare_White", 4];
this addMagazineCargoGlobal ["ACE_HandFlare_Green", 4];
this addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
this addWeaponCargoGlobal ["tf47_at4_hp", 1];
this addWeaponCargoGlobal ["tf47_at4_hedp", 1];
this addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
this addMagazineCargoGlobal ["UK3CB_BAF_30Rnd", 40];
this addMagazineCargoGlobal ["UK3CB_BAF_20Rnd", 20];
this addMagazineCargoGlobal ["UK3CB_BAF_75Rnd", 16];
this addMagazineCargoGlobal ["UK3CB_BAF_17Rnd_9mm", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_100Rnd", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_L115A3_Mag", 10];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Pellets", 8];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Slugs", 8];
this addMagazineCargoGlobal ["HandGrenade", 8];
this addItemCargoGlobal ["ACE_EarPlugs", 20];
this addMagazineCargoGlobal ["SmokeShell", 8];
this addMagazineCargoGlobal ["SmokeShellGreen", 4];
this addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
this addWeaponCargoGlobal ["tf47_at4_hp", 1];
this addWeaponCargoGlobal ["tf47_at4_hedp", 1];
this addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
this addMagazineCargoGlobal ["UK3CB_BAF_30Rnd", 40];
this addMagazineCargoGlobal ["UK3CB_BAF_20Rnd", 20];
this addMagazineCargoGlobal ["UK3CB_BAF_75Rnd", 16];
this addMagazineCargoGlobal ["UK3CB_BAF_17Rnd_9mm", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_100Rnd", 12];
this addMagazineCargoGlobal ["UK3CB_BAF_L115A3_Mag", 10];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Pellets", 8];
this addMagazineCargoGlobal ["UK3CB_BAF_L128A1_Slugs", 8];
this addMagazineCargoGlobal ["HandGrenade", 8];
this addItemCargoGlobal ["ACE_EarPlugs", 20];
this addMagazineCargoGlobal ["SmokeShell", 8];
this addMagazineCargoGlobal ["SmokeShellGreen", 4];
this addMagazineCargoGlobal ["tf47_m3maaws_he", 2];
this addWeaponCargoGlobal ["tf47_at4_hp", 1];
this addWeaponCargoGlobal ["tf47_at4_hedp", 1];
this addItemCargoGlobal ["DemoCharge_Remote_Mag", 4];
*/
