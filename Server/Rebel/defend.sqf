/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_group = (group _unit);
_units = [];
_hiedout = _unit getVariable "hideout";
_safe = true;
_roeHandle = scriptNull;

if(_unit == leader _group)then{
    _units = units _group;

    _roeHandle = [_group]spawn{
        params["_group"];

        {
            if((_x findNearestEnemy (getPos _x)) distance _x < 250)then{
                _group setCombatMode "YELLOW";
            }else{
                _safe = true;
            };
        } forEach (units _group);

        if(_safe)then{
            _group setCombatMode "WHITE";
        };
    };

    _group move (getPos _hideout);
    _group setBehaviour "AWARE";

    waitUntil{(_unit distance _hideout) < 15};
    [_units, getPos _hideout]spawn Zen_OrderInfantryPatrolBuilding;
};


waitUntil{
    sleep 5;
    (isNull((leader _group) findNearestEnemy (getPos _hideout)) OR ((count (units _group)) == 0))
};
terminate _roeHandle;
