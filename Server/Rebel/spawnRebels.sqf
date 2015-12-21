/////////////////////////
//Script made by Jochem//
/////////////////////////
_houses = [(houses - housesVillages - homes), (count (houses - housesVillages - homes))]call Zen_ArrayGetRandomSequence;


//Groups
_i = 0;
while{_i < ((count houses) * (population / 4))}do{
    _house = _houses select _i;
    _positions = [_house] call BIS_fnc_buildingPositions;
    hideouts pushBack _house;

    _group = [getPos _house, east, "sof", [3,6], "basic"] call Zen_SpawnInfantryGarrison;
    {
        _x setVariable["hideout",_house];
        [_x]spawn JOC_rebelBehaviour;
    } forEach (units _group);
    _house setVariable ["units", (units _group)];
    [_house]call JOC_rebelCreateHideout;
    [(units _group)]call JOC_cacheUnits;

    _i = _i + 1;
};

//Techicals
_i = 0;
while{_i < ((count _houses) * (population / 7))}do{
    //_pos = [0,0,["mrk_safeZone"],1,[2,300]] call Zen_FindGroundPosition;
    _loc = [0,0,["mrk_safeZone"],1,0] call Zen_FindGroundPosition;
    _pos = _loc findEmptyPosition [0,300,"CAF_AG_ME_T_Offroad_armed_01"];

    _car = "CAF_AG_ME_T_Offroad_armed_01" createVehicle _pos;
    createVehicleCrew _car;
    [[_car],"mrk_area",["mrk_safeZone"],[0,360],"full","safe"]spawn Zen_OrderVehiclePatrol;
    [(crew _car)]call JOC_cacheUnits;

    _i = _i + 1;
};

//Mortars
_housesP = [];
_house = objNull;
_i = 0;
while{_i < ((count _houses) * (population / 20))}do{
    //_pos = [0,0,["mrk_safeZone"],1,[2,300]] call Zen_FindGroundPosition;
    _house = houses call BIS_fnc_selectRandom;
    _housesP = [];
    {
        if((_x distance _house) < 75)then{
            _housesP pushBack (getPos _x);
        };
    } forEach houses;
    testV = _housesP;

    _loc = [_housesP]call JOC_miscFindCenter;
    _pos = _loc findEmptyPosition [0,300,"B_Heli_Transport_03_unarmed_F"];

    _mortar = "B_G_Mortar_01_F" createVehicle _pos;
    _group =[_pos,["CAF_AG_ME_T_AK47"]]call Zen_SpawnGroup;
    leader _group moveInGunner _mortar;
    [(crew _mortar)]call JOC_cacheUnits;

    _i = _i + 1;
};
