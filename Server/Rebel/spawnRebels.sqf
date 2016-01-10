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
        _x setVariable ["needed", false];
        [_x]spawn JOC_rebelBehaviour;
    } forEach (units _group);
    _house setVariable ["units", (units _group)];
    [_house]call JOC_rebelCreateHideout;
    [(units _group)]call JOC_cacheUnits;

    _i = _i + 1;
};

//Chain of command
//Generate usable houses
{
    if((count ([_x] call BIS_fnc_buildingPositions)) > 8)then{
        housesMain pushBack _x;
    };
} forEach (houses - hideouts);

//Spawn leaders
_i = 0;
while{_i < 4}do{
    _compound = housesMain call BIS_fnc_selectRandom;
    hideoutsMain pushBack _compound;
    _location = getPos _compound;
    _groupOfficer = createGroup east;
    _officer = _groupOfficer createUnit ["O_officer_F",_location, [], 0, "NONE"];

    _officer setVariable ["JOC_caching_disabled", true, true];

    if(_i == 0)then{
        rebelCommander = _officer;
        cmdHideout = _hideout;
    }else{
        officerArray pushBack _officer;
        [_officer]spawn JOC_rebelHvtbehaviourLt;
    };

    _group = [_location, east, "sof", 3,"basic"] call Zen_SpawnInfantryGarrison;
    [_officer] joinSilent _group;
    _group selectLeader _officer;
    _i = _i + 1;
};

//Add diary record
[[officerArray,rebelCommander],{
    params["_list","_cmd"];
    player createDiarySubject ["intel","Intel"];
    {
        player createDiaryRecord ["intel", ["HVT", (name _x)]];
    } forEach _list;
    player createDiaryRecord ["intel", ["HVT", "<t size='1.25'>Lieutenants:</t>"]];
    player createDiaryRecord ["intel", ["HVT", (name _cmd)]];
    player createDiaryRecord ["intel", ["HVT", "<t size='1.25'>Commander:</t>"]];
}] remoteExec ["BIS_fnc_spawn", 0, true];

//Spawn field commanders
_i = 0;
while{_i < ((count houses) * (population / 4))*0.06}do{
    _house = _houses select _i;
    _positions = [_house] call BIS_fnc_buildingPositions;
    hideouts pushBack _house;

    _group = [getPos _house, east, "sof", [3,6], "basic"] call Zen_SpawnInfantryGarrison;
    {
        _x setVariable["hideout",_house];
        _x setVariable ["needed", false];
        [_x]spawn JOC_rebelHvtBehaviourField;
    } forEach (units _group);
    (leader _group)setVariable ["JOC_caching_disabled", true, true];
    _house setVariable ["units", (units _group)];
    [_house]call JOC_rebelCreateHideout;

    _i = _i + 1;
};
