/////////////////////////
//Script made by Jochem//
/////////////////////////
_type = _this select 0;
_unable = true;

//Get spawn obj
{
	_veh = (nearestObjects [(getPos _x),["All"],3] - [_x]);
	if((count _veh) >= 1)then{
	}else{
		_obj = _type createVehicle [99995,99995,0];
		_obj setDir (getDir _x);
		_obj setPos (getPos _x);
		[_obj]spawn JOC_vehInit;
		_unable = false;
	};
	if((count _veh) == 0)exitWith{};
} forEach [logiSpawn_0,logiSpawn_1,logiSpawn_2,logiSpawn_3,logiSpawn_4,logiSpawn_5];

if(_unable)then{
	hint "No empty pads available";
};
