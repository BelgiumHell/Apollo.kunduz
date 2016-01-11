/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_radius"];

_objects = nearestObjects [_pos, [], _radius];
_plants = [];

{
    _bool = [];
    _bool pushBack (["jbad_p_papaver.p3d",(str _x)]call Zen_StringIsInString);
    _bool pushBack (["jbad_p_papaverwhite.p3d",(str _x)]call Zen_StringIsInString);
    _bool pushBack (["jbad_p_papaverred.p3d",(str _x)]call Zen_StringIsInString);
    _bool pushBack (["praa_wheat5_s.p3d",(str _x)]call Zen_StringIsInString);
    if(true in _bool)then{
        _plants pushBack _x;
    };
} forEach _objects;

_plants
