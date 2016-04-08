/////////////////////////
//Script made by Jochem//
/////////////////////////
//location
_compound = selectRandom hideouts;
_location = getPos _compound;

//Create task
_task = [west,"Intel shows the location of an enemy HVT. Move in, capture him and bring him to base for interrogation.","Capture officer",_location,true,"",_name] call Zen_InvokeTask;

//Create marker
_name = [5] call Zen_StringGenerateRandom;
_marker = createMarker [_name, _location];
_name setMarkerType "mil_objective";
_name setMarkerColor "ColorOPFOR";

//Spawn officer
_locationS = [_location,[0,50],0,1,[1,150]] call Zen_FindGroundPosition;

_groupOfficer = createGroup east;
_officer = _groupOfficer createUnit ["O_officer_F",_locationS, [], 0, "NONE"];
_officer allowFleeing 0;

//Personal protection
_group = [_locationS, east, "sof", 3,"basic"] call Zen_SpawnInfantry;
_officer joinSilent _group;
_officer setLeader _group;

//Wait until complete or failed
waitUntil {!alive _officer OR (_officer distance (getMarkerPos "mrk_base")) < 10};

if(!alive _officer)then{
    [_name, "failed"] call Zen_UpdateTask;
}else{
    [_name, "succeeded"] call Zen_UpdateTask;
};
sleep 15;


//Cleanup
deleteVehicle _officer;
deleteMarker _marker;
taskActive = false;
