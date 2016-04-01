/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_veh"];
params["_veh"];

_veh vehicleChat "Servicing, please wait...";
_veh setFuel 0;
sleep 5;

_veh vehicleChat "Repairing...";
sleep 5;
_veh setDamage 0;

_veh vehicleChat "Rearming...";
sleep 5;

_veh vehicleChat "Refueling...";
sleep 5;
_veh setFuel 1;

_veh vehicleChat "Done!";
