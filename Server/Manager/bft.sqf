/////////////////////////
//Script made by Jochem//
/////////////////////////
_groups = [];
while{true}do{
	_groups = [];
	{
		if(side _x == west)then{
			[_groups, (count _groups), _x] call Zen_ArrayInsert;
		};
	}forEach allGroups;

	{
		_id = (groupId _x);
		_leader = (leader _x);
		if(alive _leader)then{
			_icon = 0;
			////////////////////////////////////////////////
			if((count((getMarkerPos _id) - [0,0,0]))>1)then{
				_id setMarkerPos (getPos _leader);
			}else{
				_marker = createMarker [_id, (getPos _leader)];
			};

			if((vehicle _leader) isKindOf "man")then{
				_icon = "b_inf";
			};
			if((vehicle _leader) isKindOf "LandVehicle")then{
				if((vehicle _leader) isKindOf "car")then{
					_icon = "b_motor_inf";
				};
				if((vehicle _leader) isKindOf "Truck_F")then{
					_icon = "b_motor_inf";
				};
				if((vehicle _leader) isKindOf "tank")then{
					_icon = "b_armor";
				};
				if((typeOf (vehicle _leader)) in motorizedArray)then{
					_icon = "b_mech_inf";
				};
				if((typeOf (vehicle _leader)) in logisticsVehArray)then{
					_icon = "b_maint";
				};
				if((typeOf (vehicle _leader)) == "rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy")then{
					_icon = "b_support";
				};
			};
			if((vehicle _leader) isKindOf "Air")then{
				_icon = "b_air";
			};
			if((vehicle _leader) isKindOf "Ship")then{
				_icon = "b_naval";
			};
			///////////////////////////////////////////////////
			_id setMarkerType _icon;
			_id setMarkerText _id;
		}else{
			deleteMarker _id;
		};
	}forEach _groups;
	sleep bftRefresh;
};
