/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];
_mosqueB = objNull;
_prevDis = 9999;
_loiterHandle = 0;
_home = _unit getVariable "home";

_unit setBehaviour "SAFE";
_unitCount = 0;
_approval = random 10;
_approvalStart = _approval;
_injured = false;
_patrol = false;
_mosque = false;

//sleep a bit
sleep 10;

while {alive _unit} do {
    waitUntil{sleep 10; simulationEnabled _unit};

    //Influence approval
    if(count (units (group _unit)) < _unitCount)then{
        _approval = _approval - (0.05 / _approvalStart);
    };
    _unitCount = count (units (group _unit));

    //If home is destroyed, join the rebels
    if(!alive _home)then{
        //[_unit]spawn JOC_civJoinRebels;
        if(true)exitWith{};
    };

    //If night, go home
    if((20 < daytime) || (daytime < 5) && !_injured)then{
        _patrol = false;
        terminate _loiterHandle;
        [_unit,getPos _home]spawn Zen_OrderInfantryPatrolBuilding;
    };

    //If day, wonder around
    if(!((20 < daytime) || (daytime < 5))  && !_injured && !_patrol && !_mosque)then{
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
    if(((daytime > 7) && (daytime < 7.05)) && !_injured)then{
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

        waitUntil{daytime > 9.5};
        _unit setVariable["JOC_caching_disabled",false];
        _mosque = false;
        _patrol = false;
    };

    //Slight chance on suicide terrorist
    if((random 100 * _approval) < 1 && _approval < 5)then{
        [_unit,_hideout]spawn JOC_civBomber;
        if(true)exitWith{};
    };
};
