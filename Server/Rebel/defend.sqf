/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_group"];

_units = units _group;
_hideout = (leader _group) getVariable "hideout";
_safe = true;
_roeHandle = scriptNull;
_patrolHandle = scriptNull;

_roeHandle = [_group]spawn{
    params["_group"];

    while{true}do{
        _safe = true;

        {
            if((_x findNearestEnemy (getPos _x)) distance _x < 250)then{
                _group setCombatMode "RED";
                _safe = false;
            };
        } forEach (units _group);

        if(_safe)then{
            _group setCombatMode "YELLOW";
        };
    };
};

{
    _x disableAI "AUTOCOMBAT";
} forEach _units;
_group setBehaviour "COMBAT";
_patrolHandle = [_units, getPos _hideout]spawn Zen_OrderInfantryPatrolBuilding;

waitUntil{
    sleep 5;
    _nearestPlayers = [];
    _nearestSurrender = [];
    {
        if((_x distance (leader _group)) < 500)then{
            if((leader _group) knowsAbout _x > 1)then{
                _nearestPlayers pushBack _x;
                if(captive _x)then{
                    _nearestSurrender pushBack _x;
                };
            };
        };
    } forEach (playableUnits + switchableUnits);
    (count (_nearestPlayers - _nearestSurrender) == 0  OR ((count (units _group)) == 0))
};
{
    _x enableAI "AUTOCOMBAT";
} forEach _units;
//terminate _roeHandle;
terminate _patrolHandle;
