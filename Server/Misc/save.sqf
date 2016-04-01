/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
    [[],{
        startLoadingScreen["Saving..."];
        player setPos getMarkerPos "mrk_savePos";
    }] remoteExec ["BIS_fnc_spawn", 0, true];



    sleep 60;
    "delete" call inidbi;

    {
        if((((_x select 0) select 0) select 0) != "")then{
            _side = (_x select 2);
            if(_side == civilian)then{
                _side = "civilian";
            };
            if(isNil{_side})then{
                _side = "civilian";
            };
            if(typeName _side != "STRING")then{
                _side = "east";
            };
            _array = [(_x select 0), (_x select 1), _side, str (_x select 3)];
            ["write", ["main", format["virtualizedArray_%1",_forEachIndex], _array]] call inidbi;
        };
    } forEach virtualizedArray;

    _housesDamage = [];
    {
        _housesDamage pushBack (damage _x);
    } forEach houses;
    ["write", ["main", "housesDamage", _housesDamage]] call inidbi;
    _homes = [];
    {
        _homes pushBack (str _x);
    } forEach homes;
    ["write", ["main", "homes", _homes]] call inidbi;
    _hideouts = [];
    {
        _hideouts pushBack (str _x);
    } forEach hideouts;
    ["write", ["main", "hideouts", _hideouts]] call inidbi;

    [[],{
        endLoadingScreen;
        hintC "Progress saved";
        "end1" call BIS_fnc_endMission;
    }] remoteExec ["BIS_fnc_spawn", 0, true];
}] remoteExec ["BIS_fnc_spawn", 2];
