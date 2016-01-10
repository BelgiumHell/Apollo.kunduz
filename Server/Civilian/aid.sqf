/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];

_endTime = time + 1800;
_time = 0;

//Find nearest medic
while{alive _unit && (damage _unit) > 0.1}do{
    _medicsAll = nearestObjects [(getPos _unit), [""], 1000];
    _medicsAware = [];
    {
        if(_unit knowsAbout _x && !(_unit getVariable "combat"))then{
            _medicsAware pushBack _x;
        };
    } forEach _medicsAll;

    if(!isNil {_medicsAware select 0})then{
        _unit doMove (getPos (_medicsAware select 0));
    }else{
        _unit doMove (getMarkerPos "mrk_base");
    };
};
