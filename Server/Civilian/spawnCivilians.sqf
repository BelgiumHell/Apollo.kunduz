/////////////////////////
//Script made by Jochem//
/////////////////////////
_housesI = [housesVillages, (count housesVillages)]call Zen_ArrayGetRandomSequence;
_housesO = [(houses - housesVillages), (count (houses - housesVillages))]call Zen_ArrayGetRandomSequence;

_houses = _housesI + _housesO;

_house = objNull;

_i = 0;
while{_i < ((count houses) * population)}do{
    _house = _houses select _i;
    _positions = [_house] call BIS_fnc_buildingPositions;
    homes pushBack _house;

    _group = [getPos _house, civilian, "Infantry", (round((count _positions)/3)), "civ"] call Zen_SpawnInfantryGarrison;
    {
        _x setVariable["home",_house];
        [_x]spawn JOC_civBehaviour;
    } forEach (units _group);
    _house setVariable ["units", (units _group), true];
    [(units _group)]call JOC_cacheUnits;

    _i = _i + 1;
};
