/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_officer"]

//Get nearby units to join meeting
_unitsAttending = [];
{
    if(_x distance _officer < 200)then{
        _units = _x getVariable "units";
        {
            _x setVariable ["needed", true];
        } forEach _units;
        _units pushBack _unitsAttending;
    };
} forEach hidouts;

_startCount = count _unitsAttending;

sleep 30;

{
    if(_x == (leader (group _x)))then{
        (group _x) move (getPos _ambushLoc);
        (group _x) setCombatMode "WHITE";
        (group _x) setBehaviour "STEALTH";
    };
} forEach _unitsAttending;
(group _officer) move (getPos _ambushLoc);

waitUntil {sleep 2; ((west countSide (nearestObjects [_x select 0,["Man","Car","Tank","Air"],100])) > 1)};

{
    if(_x == (leader (group _x)))then{
        (group _x) move (getPos _ambushLoc);
        (group _x) setCombatMode "RED";
        (group _x) setBehaviour "COMBAT";
    };
} forEach _unitsAttending;

waitUntil {
    sleep 10;
    _unitsAttending = _unitsAttending - [objNull];
    ((west countSide (nearestObjects [getPos _town,["Man","Car","Tank","Air"],400])) > 5 || (count _unitsAttending) < (_startCount / 2))
};

{
    _x setVariable ["needed", false];
} forEach _unitsAttending;
