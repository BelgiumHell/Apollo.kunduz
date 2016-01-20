/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_group = (group _unit);
_units = [];
_hideout = _unit getVariable "hideout";
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

    _group setBehaviour "AWARE";

    [_units, getPos _hideout]spawn Zen_OrderInfantryPatrolBuilding;
};


waitUntil{
    sleep 5;
    _nearestPlayers = [];
    _nearestSurrender = [];
    {
        if((_x distance _unit) < 500)then{
            if(_unit knowsAbout _x > 1)then{
                _nearestPlayers pushBack _x;
                if(captive _x)then{
                    _nearestSurrender pushBack _x;
                };
            };
        };
    } forEach (playableUnits + switchableUnits);
    (count (_nearestPlayers - _nearestSurrender) == 0  OR ((count (units _group)) == 0))
};
terminate _roeHandle;
