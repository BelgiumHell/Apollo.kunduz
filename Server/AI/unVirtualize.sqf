/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_array"];

virtualizedArray = virtualizedArray - [_array];

_groupJ = createGroup east;
{
    _unit = _groupJ createUnit [(_x select 0), (_x select 1), [], 0, "FORM"];
} forEach (_array select 0);

_group = createGroup (_array select 2);
(units _groupJ) joinSilent _group;

if(count (_array select 1) != 0)then{
    {
        _vehicle = (_x select 1) createVehicle (_x select 0);
        _crew = [];

        {
            _crew pushBack ((units _group) select _x);
        } forEach (_x select 2);

        [_crew,_vehicle,"All"]spawn Zen_MoveInVehicle;
    } forEach (_array select 1);
};

_units = (units _group);

if((_array select 3) != objNull)then{
    switch ((_array select 2)) do {
        case (east): {
            {
                _x setVariable ["hideout", (_array select 3)];
                (_array select 3) setVariable ["units", _units];
            } forEach _units;
        };
        case (civilian): {
            {
                _x setVariable ["home", (_array select 3)];
                (_array select 3) setVariable ["units", _units];
                [_x]joinSilent cacheGroupCiv;
            } forEach _units;
        };
    };
};

[_units]call JOC_cacheUnits;
