/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_veh"];

_vehType = typeOf _veh;
if(_vehType == "UK3CB_BAF_Coyote_Logistics_L111A1_D")then{
    ["ACE_Wheel",_veh,6,false]call ace_cargo_fnc_addCargoItem;
};
if(_vehType == "UK3CB_BAF_Vehicles_Merlin_RAF_ZJ124")then{
    [_veh]call Zen_AddFastRope;
};

/*
_veh addEventHandler ["Killed", {
    params ["_veh"];
    cargoDrop pushBack (typeOf _veh);
    publicVariable "cargoDrop";
}];
*/
