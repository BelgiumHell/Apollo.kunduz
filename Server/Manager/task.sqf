/////////////////////////
//Script made by Jochem//
/////////////////////////
taskActive = false;

_hostage = 0;
_hvt = 0;

_tasks = ["hostage","hvt"];//All (almost)finished tasks are in here
_task = "";

sleep 60;

while{true}do{
    _task = _tasks call BIS_fnc_selectRandom;

    if(_task == "hostage" && _hostage < 1) then{
        []spawn JOC_taskHostage;
        taskActive = true;
        _hostage = 1;
    };
    if(_task == "hvt" && _hvt < 1) then{
        []spawn JOC_taskHVT;
        taskActive = true;
        _hostage = 1;
    };

    if(taskActive)then{
        _hostage = _hostage - 1;
        _hvt = _hvt - 1;

        waitUntil{sleep 10; !taskActive};
        sleep 1200;
    };
};
