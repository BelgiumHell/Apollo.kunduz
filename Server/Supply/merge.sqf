/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_crate"];

{
    boxAmmo addItemCargoGlobal [_x, 1];
} forEach (magazineCargo _crate);

{
    if(_x in ["ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_morphine","ACE_atropine","ACE_epinephrine","ACE_plasmaIV_500","ACE_bloodIV_500","ACE_salineIV_500","ACE_quikclot","ACE_surgicalKit","ACE_bodyBag","ACE_personalAidKit"])then{
        boxMedical addItemCargoGlobal [_x, 1];
    }else{
        boxItems addItemCargoGlobal [_x, 1];
    };
} forEach ((itemCargo _crate) + (weaponCargo _crate));

deleteVehicle _crate;
