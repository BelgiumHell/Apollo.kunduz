/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_hideout","_unit"];

_group = group (_units select 0);
_safe = true;
_roeHandle = scriptNull;

if(_unit == leader (group _unit))then{
    _units = _hideout getVariable "units";
    _units = _units - [objNull];

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
