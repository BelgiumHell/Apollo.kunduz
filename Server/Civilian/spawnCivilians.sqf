/////////////////////////
//Script made by Jochem//
/////////////////////////
_housesR = [houses, ((count houses) / 5)]call Zen_ArrayGetRandomSequence;
_housesI = [housesVillages + _housesR, (count (housesVillages + _housesR))]call Zen_ArrayGetRandomSequence;
_housesO = [(houses - housesVillages - _housesR), (count (houses - housesVillages - _housesR))]call Zen_ArrayGetRandomSequence;

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
    } forEach (units _group);
    _house setVariable ["units", (units _group), true];
    [(units _group)]call JOC_virtualize;
    {
        if(count (units _x) == 0)then{
            deleteGroup _x;
        };
    } forEach allGroups;

    _i = _i + 1;
};
