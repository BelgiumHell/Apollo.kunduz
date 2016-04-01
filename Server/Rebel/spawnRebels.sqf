/////////////////////////
//Script made by Jochem//
/////////////////////////
_houses = [(houses - housesVillages - homes - housesSafe), (count (houses - housesVillages - homes - housesSafe))]call Zen_ArrayGetRandomSequence;

//Groups
_i = 0;
while{_i < ((count _houses) * (population / 2.5))}do{
    _house = _houses select _i;
    _positions = [_house] call BIS_fnc_buildingPositions;
    hideouts pushBack _house;

    _group = [getPos _house, east, "sof", [3,6], "basic"] call Zen_SpawnInfantryGarrison;
    {
        _x setVariable["hideout",_house];
        _x setVariable ["needed", false];
    } forEach (units _group);
    _house setVariable ["units", (units _group)];
    [_house]call JOC_rebelCreateHideout;
    [(units _group)]call JOC_virtualize;
    {
        if(count (units _x) == 0)then{
            deleteGroup _x;
        };
    } forEach allGroups;

    _i = _i + 1;
};
