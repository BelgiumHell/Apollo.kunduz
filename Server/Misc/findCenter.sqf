/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_points"];

_xt = 0;
_xn = count _points;
_yt = 0;
_yn = count _points;

{
    _xt = _xt + (_x select 0);
    _yt = _yt + (_x select 1);
} forEach _points;

_pos = [(_xt/_xn),(_yt/_yn)];

_pos
