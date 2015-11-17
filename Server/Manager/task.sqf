/////////////////////////
//Script made by Jochem//
/////////////////////////
taskActive = false;

hostage = 0;

_tasks = ["hostage"];//All (almost)finished tasks are in here

sleep 60;

while{true}do{
    _task = _tasks call BIS_fnc_selectRandom;

    if(_task == "hostage" and hostage < 1) then{
        []spawn JOC_taskHostage;
        taskActive = true;
        hostage = 0;
    };

    if(taskActive)then{
        hostage = hostage - 1;
    };

    waitUntil{sleep 10; !taskActive};
    sleep 1200;
};
