/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_house"];

_bPos = [_house]call BIS_fnc_buildingPositions;
_bPos deleteAt ((count _bPos) - 1);
_pos = _bPos select 1;

_crate = "Box_IND_Ammo_F" createVehicle _pos;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
_crate setPosATL _pos;
