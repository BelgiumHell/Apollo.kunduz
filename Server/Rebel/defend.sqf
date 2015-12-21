/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_hideout","_unit"];

if(_unit == leader (group _unit))then{
    _units = _hideout getVariable "units";
    _units = _units - [objNull];
    _group = group (_units select 0);

    _group setCombatMode "WHITE";

    _group move (getPos _hideout);
    _grou^p setBehaviour "AWARE";

    waitUntil{(_unit distance _hideout) < 15};
    [_units, getPos _hideout]spawn Zen_OrderInfantryPatrolBuilding;
};


waitUntil{
    sleep 5;
    _units = _units - [objNull];
    (isNull((_units select 0) findNearestEnemy (getPos _hideout)) OR ((count _units) == 0))
};
