_array = _this select 0;

_vehicleData = [
	[],	//CARS
	[],	//ARMOUR
	[],	//HELIS
	[],	//PLANES
	[],	//NAVAL
	[]	//STATICS
];


_vehicleDataTypes_enum = [
	[ "car", "carx" ],
	[ "tank", "tankx" ],
	[ "helicopter", "helicopterx", "helicopterrtd" ],
	[ "airplane", "airplanex" ],
	[ "ship", "shipx", "sumbarinex" ]
];



_fnc_getVehicleDataTypeIndex = {
	_type = toLower _this;
	_return = -1;
	{
		if ( _type in _x ) exitWith {
			_return = _forEachIndex;
		};
	}forEach _vehicleDataTypes_enum;
	_return
};



_defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");
"
	_cfgPath = _x;
	_simulType = getText ( _cfgPath >> 'simulation' );
	_simulIndex = _simulType call _fnc_getVehicleDataTypeIndex;

	if ( ( tolower ( getText ( _cfgPath >> 'vehicleClass' ) ) isEqualTo 'static' ) ) then {
		_simulIndex = 5;
	};

	if (( configName _cfgPath) in _array ) then {
		if ( getnumber (_cfgPath >> 'scope') == 2 && {gettext (_cfgPath >> 'crew') != _defaultCrew} && { _simulIndex >= 0 }  ) then {

			_side = getNumber ( _cfgPath >> 'side' );
			_model = getText ( _cfgPath >> 'model' );

			_sides = [_side];

			{

				_tmpSide = _vehicleData;

				_tmpTypes = _tmpSide select _simulIndex;

				_index = ( _tmpTypes find _model );

				if ( _index >= 0 ) then {
					_index = _index + 1;
					( _tmpTypes select _index ) pushback _cfgPath;
				}else{
					_tmpTypes pushback _model;
					_tmpTypes pushback [ _cfgPath ];
				};

			}foreach _sides;
		};
	};
" configClasses ( configFile >> "CfgVehicles" );

resturnVar = _vehicleData;

_vehicleData
