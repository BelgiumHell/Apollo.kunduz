/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_hideout"];

_units = _hideout getVariable "units";
_units = _units - [objNull];
_group = group (_units select 0);

hint "defend";

[_units, getPos _hideout]spawn Zen_OrderInfantryPatrolBuilding;

waitUntil{
    sleep 5; _units = _units - [objNull];
    (isNull((_units select 0) findNearestEnemy (getPos _hideout)) OR ((count _units) == 0))
};
