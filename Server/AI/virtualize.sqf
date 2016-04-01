/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];
private ["_sideU"];

if(isNil{(_units select 0)})exitWith{};
if(isNull (_units select 0))exitWith{};
if((_units select 0) getVariable "JOC_caching_disabled")exitWith{};

cachedArray = cachedArray - [_units];

_special = objNull;
switch (side (_units select 0)) do {
    case (east): {
        _special = (_units select 0) getVariable ["hideout",objNull];
    };
    case (civilian): {
        _special = (_units select 0) getVariable ["home",objNull];
    };
};

_sideU = (side (_units select 0));
_vehicles = [];
_vehiclesTemp = [];
{
    if(!(isNull objectParent _x))then{
        if(!((vehicle _x) in _vehiclesTemp))then{
            _vehicles pushBack [(getPos (vehicle _x)),(typeOf (vehicle _x)),[_forEachIndex]];
            _vehiclesTemp pushBack (vehicle _x);
        }else{
            _index = _vehiclesTemp find (vehicle _x);
            (_vehicles select _index select 2) pushBack _forEachIndex;
        };
    };
    _vehicles
} forEach _units;

_unitClasses = [];
{
    _unitClasses pushBack [(typeOf _x),getPos _x];
    deleteVehicle _x;
} forEach _units;

{
    deleteVehicle _x;
} forEach _vehiclesTemp;

if(isNil{_sideU})then{
    _sideU = east;
};
_array = [_unitClasses,_vehicles,_sideU,_special];

virtualizedArray pushBack _array;
