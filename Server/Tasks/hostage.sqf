/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_name = [5] call Zen_StringGenerateRandom;

//Generate location
_compound = hideouts call BIS_fnc_selectRandom;
_location = getPos _compound;

//Create task
_task = [west, "A journalist Journalist has been taken hostage by the Taliban. Attempts to negotiate with them have unfortunately failed and plans are made to execute him. This could have a big influence on public opinions, something we cannot afford at all. Rescue him and return him to the FOB Prince","Rescue journalist",0,false,"",_name] call Zen_InvokeTask;

//Spawn hostage
_bPos = [_location]call Zen_FindBuildingPositions;

_locationS = _bPos call BIS_fnc_selectRandom;//[_location,[0,50],0,1,[1,150]] call Zen_FindGroundPosition;

_groupHostage = createGroup civilian;
_civ = _groupHostage createUnit ["C_journalist_F",_locationS, [], 0, "NONE"];
_civ allowFleeing 0;
_locationHostage = _locationS;
_civ setPos _locationHostage;

//Hostage set behaviour
_civ setBehaviour "Careless";
doStop _civ;
commandStop _civ;
_civ switchMove "AmovPercMstpSsurWnonDnon";

//Spawn enemy
[_location, east, "sof", 2, "basic"] call Zen_SpawnInfantryGarrison;

//Wait until complete or failed
waitUntil {(!alive _civ) or ((_civ distance (getMarkerPos "mrk_base")) < 10)};

if (!alive _civ) then{
    [_name, "failed"] call Zen_UpdateTask;
};

if ((_civ distance (getMarkerPos "mrk_base")) < 10) then{
    [_name, "succeeded"] call Zen_UpdateTask;
};
sleep 15;


//Cleanup
deleteVehicle _civ;
taskActive = false;
