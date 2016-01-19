/////////////////////////
//Script made by Jochem//
/////////////////////////
while{true}do{
    //Remove destroyed ieds from array
    iedArray = iedArray - [objNull];

    //Cleanup
    _items = nearestObjects [(getMarkerPos "mrk_area"), ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 10000];
    {
        _nearestPlayers = [];
        _location = (getPos _x);
        {
            if (isPlayer _x && _x distance _location < 500) then {
                _nearestPlayers pushBack _x;
            };
        } forEach (playableUnits + switchableUnits);
        if(count _nearestPlayers == 0)then{
            deleteVehicle _x;
        };
    }forEach _items;

    _items = nearestObjects [(getMarkerPos "respawn_west"), ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","SmokeShell","TimeBombCore"], 100];
    {
        deleteVehicle _x;
    }forEach _items;
    {
        _nearestPlayers = [];
        _location = (getPos _x);
        {
            if (isPlayer _x && (_x distance _location) < 500) then {
                _nearestPlayers pushBack _x;
            };
        } forEach (playableUnits + switchableUnits);

        if(count _nearestPlayers == 0 or (_x distance (getMarkerPos "respawn_west")) < 100)then{
            _pad = (_x getVariable "pad");
            _pad setVariable["count",((_pad getVariable "count") - 1),true];
            deleteVehicle _x;
        };
    }forEach allDead;
};
