/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];
_mosqueB = objNull;
_prevDis = 9999;
_loiterHandle = 0;
_home = _unit getVariable "hideout";

_unit setBehaviour "SAFE";
doStop _unit;
_injured = false;
_patrol = false;
_mosque = false;

//Add killed eventhandler

while {alive _unit} do {
    //If home is destroyed, join the rebels
    if(!alive _home)then{
        //[_unit]spawn JOC_civJoinRebels;
        if(true)exitWith{};
    };

    //If night, go home
    if((20 < daytime) OR (daytime < 5) && !_injured)then{
        _patrol = false;
        terminate _loiterHandle;
        [_unit,getPos _home]spawn Zen_OrderInfantryPatrolBuilding;
    };

    //If day, wonder around
    if(!((20 < daytime) OR (daytime < 5))  && !_injured && !_patrol && !_mosque)then{
        _patrol = true;
        _loiterHandle = [_unit,_home]spawn JOC_civLoiter;
    };

    //If injured, go to nearest player or NATO hq
    if(damage _unit > 0.1)then{
        _injured = true;
        _patrol = false;
        terminate _loiterHandle;

        waitUntil{(damage _unit) < 0.1};
        _injured = false;
    };

    //Go to mosque at set time
    if(((daytime > 7) AND (daytime < 7.05))  && !_injured)then{
        _unit setVariable["JOC_caching_disabled",true];
        {
            if((_unit distance _x) < _prevDis)then{
                _mosqueB = _x;
                _prevDis = (_unit distance _x);
            };
        } forEach mosques;
        _timeNeeded = (_prevDis * 3.6);

        timeT = _timeNeeded;

        sleep (7200 - _timeNeeded);
        _mosque = true;
        terminate _loiterHandle;

        _unit doMove (getPos _mosqueB);

        waitUntil{sleep 5; (_unit distance _mosqueB) < 20};
        //disableAI "MOVE";

        waitUntil{daytime > 9.5};
        _unit setVariable["JOC_caching_disabled",false];
        //enableAI "MOVE";
        _mosque = false;
        _patrol = false;
    };

    sleep 10;
};
