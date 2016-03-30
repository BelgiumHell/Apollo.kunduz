/////////////////////////
//Script made by Jochem//
/////////////////////////
//For caching
[]spawn{
    while{true}do{
        {
            if(count (units _x) == 0)then{
                deleteGroup _x;
            };
            if(side _x == east)then{
                if(_x != cacheGroupCiv && _x != cacheGroupEast)then{
                    _objects = nearestObjects [(getPos (leader _x)),["Man","Car","Tank","Air"],1500];

                    if ((west countSide _objects) == 0)then{
                        [units _x]call JOC_cache;
                    };

                };
            };
        } forEach allGroups;
        sleep 15;
    };
};

//uncaching
[]spawn{
    while {true} do {
        {
            _objects = nearestObjects [_x select 0,["Man","Car","Tank","Air"],1500];

            if((west countSide _objects) > 0)then{
                [_x]call JOC_unCache;
            };
        } forEach cachedArray;
        sleep 5;
        cachedArray = cachedArray - [[]];
    };
};

//civilian uncaching
[]spawn{
    while {true} do {
        {
            _objects = nearestObjects [(getPos _x),["Man","Car","Tank","Air"],1500];

            if((west countSide _objects) > 0)then{
                [(_x getVariable "units")]call JOC_unCache;
            }else{
                [(_x getVariable "units")]call JOC_cache;
            };
        } forEach homes;
        sleep 5;
    };
};
