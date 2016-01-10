/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_town","_officer"];

//Get nearby units to join meeting
_unitsAttending = [];
{
    if(_x distance _officer < 500)then{
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
        (group _x) move (getPos _town);
        (group _x) setCombatMode "YELLOW";
        (group _x) setBehaviour "AWARE";
    };
} forEach _unitsAttending;
(group _officer) move (getPos _town);

waitUntil {sleep 10; _officer distance (getPos _town) < 100 || !alive _unit};

waitUntil {
    sleep 10;
    _unitsAttending = _unitsAttending - [objNull];
    ((west countSide (nearestObjects [getPos _town,["Man","Car","Tank","Air"],400])) > 5 || (count _unitsAttending) < (_startCount / 2))
};

{
    _x setVariable ["needed", false];
} forEach _unitsAttending;
