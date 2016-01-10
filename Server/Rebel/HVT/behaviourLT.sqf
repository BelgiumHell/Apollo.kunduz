/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_group = group _unit;
_hideout = _unit getVariable "hideout";
_unitsAttending = [];

while{alive _unit}do{
    sleep (round (random 2));
    _unitsAttending = [];

    //Get meeting place
    _place = hideouts call BIS_fnc_selectRandom;

    //Get nearby units to join meeting
    {
        if(_x distance _place < 500)then{
            _units = _x getVariable "units";
            {
                _x setVariable ["needed", true];
            } forEach _units;
            _units pushBack _unitsAttending;
        };
    } forEach hidouts;

    //Just to make sure the behaviour script let's this use the unit
    sleep 30;

    _unitsAttending doMove (getPos _place);

    //Order officer move
    [_group,_place]spawn Zen_OrderInfantryPatrolBuilding;

    //waitUntil officer reached location
    waitUntil {(_unit distance _place) < 10 || (!alive _unit)};
    if(!alive _unit)then{
        {
            _x setVariable ["needed", false];
        } forEach _unitsAttending;
    };

    sleep 600;

    {
        _x setVariable ["needed", false];
    } forEach _unitsAttending;

    //End meeting
    if(random 3 <= 1)then{
        _group move (getPos cmdHideout);
    }else{
        _group move (getPos _hideout);
    };
};
