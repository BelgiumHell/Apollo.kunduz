params["_array","_pos","_radius"];

_near = [];

{
    if((_x distance _pos) <= _radius)then{
        _near pushBack _x;
    };
} forEach _array;

_near
