/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_prevDis","_groupIdG","_group","_position"];

onMapSingleClick{
	_prevDis = 999;
	_groupIdG = "";
	_group = 0;
	_position = _pos;
	_markers = allMapMarkers;
	{
		_distance = ((getMarkerPos _x) distance _position);
		_control = (findDisplay 12) displayCtrl 51; //Arma 3
		_scale = ctrlMapScale _control; //returns number from 1 to 0.001
		_scale = _scale * 300;
		if((_distance < _scale) && (_distance < _prevDis))then{
			_prevDis = _distance;
			_groupIdG = _x;
		};
	}forEach _markers;

	if(!(_groupIdG == ""))then{
		{
			if((groupId _x) == _groupIdG)then{
				_group = _x;
			};
		}forEach allGroups;

		_unitsG = (units _group);
		_unitText = "";
		{
			_veh = vehicle _x;
			if(_veh isKindOf "man")then{
				_vehText = "";
			}else{
				_vehText = format["(%1)",(typeOf _veh)]
			};
			_unitText = composeText [_unitText, lineBreak, (name _x) + ""];
		}forEach _unitsG;
		_text = parseText format["<t color='#0080FF' size='2'>%1</t>",_groupIdG];
		_freq = 0;
		{
			_freq = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;
		}forEach [(leader _group)];
		_freqText = format["SW freq: %1",_freq];
		_text = composeText [_text, lineBreak, _unitText, lineBreak, lineBreak, _freqText];
		hint _text;
	};
};
