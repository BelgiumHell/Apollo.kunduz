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
            if(side _x != west)then{
                if(_x != cacheGroup)then{
                    _objects = nearestObjects [(getPos (leader _x)),["Man","Car","Tank","Air"],1500];

                    if ((west countSide _objects) == 0)then{
                        [_x]call JOC_cache;
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
        sleep 15;
        cachedArray = cachedArray - [[]];
    };
};

/*
//Virtualizing/unvirtualizing
[]spawn{
    while {true} do {
        {
            _objects = nearestObjects [(((_x select 0) select 1) select 1),["Man","Car","Tank","Air"],5000];

            if((west countSide _objects) > 0)then{
                [_x]call JOC_unVirtualize;
            };
        } forEach virtualizedArray;
        sleep 30;
    };
};
*/
