/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_hideout","_unit"];

_group = group (_units select 0);

if(_unit == leader (group _unit))then{
    _units = _hideout getVariable "units";
    _units = _units - [objNull];

    _group setCombatMode "WHITE";

    _group move (getPos _hideout);
    _group setBehaviour "AWARE";

    waitUntil{(_unit distance _hideout) < 15};
    [_units, getPos _hideout]spawn Zen_OrderInfantryPatrolBuilding;
};


waitUntil{
    sleep 5;
    (isNull((leader _group) findNearestEnemy (getPos _hideout)) OR ((count (units _group)) == 0))
};
