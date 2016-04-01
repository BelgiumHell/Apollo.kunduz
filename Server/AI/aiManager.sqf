/////////////////////////
//Script made by Jochem//
/////////////////////////
_objects = [];

//For caching
while{true}do{
    //caching
    waitUntil {sleep 1; (!JOC_pauseCache)};
    {
        if(count (units _x) == 0)then{
            deleteGroup _x;
        };
        if(side _x == east)then{
            if(!(_x in[cacheGroupEast,cacheGroupCiv,placeholderGroupWest]))then{
                _objects = ((getPos (leader _x)) nearEntities [["Man","Car","Tank"],1500]) - [placeholderGroupLeaderWest];

                if ((west countSide _objects) == 0)then{
                    [units _x]call JOC_cache;
                };
            };
        };
    } forEach allGroups;
    waitUntil {sleep 1; (!JOC_pauseCache)};


    //uncaching
    cachedArray = cachedArray - [[]];
    {
        if(isNull(_x select 0))then{
            cachedArray deleteAt _forEachIndex;
        }else{
            _objects = (getPos (_x select 0) nearEntities [["Man","Car","Tank"],1500]) - [placeholderGroupLeaderWest];

            if((west countSide _objects) > 0)then{
                [_x]call JOC_unCache;
            };
        };
    } forEach cachedArray;

    //civilian uncaching
    {
        if(!isNil{(_x getVariable "units")})then{
            _objects = ((getPos _x) nearEntities [["Man","Car","Tank"],1000]) - [placeholderGroupLeaderWest];

            if((west countSide _objects) > 0)then{
                [(_x getVariable "units")]call JOC_unCache;
            }else{
                _objects = ((getPos _x) nearEntities [["Man","Car","Tank","Helicopter"],2500]) - [placeholderGroupLeaderWest];
                if((west countSide _objects) == 0)then{
                    [(_x getVariable "units")]call JOC_virtualize;
                }else{
                    [(_x getVariable "units")]call JOC_cache;
                };
            };
        }else{
            homes deleteAt _forEachIndex;
        };
    } forEach homes;
};
