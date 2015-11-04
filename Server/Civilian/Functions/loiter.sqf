/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_home"];

while{(alive _unit) && ((side _unit) == civilian)}do{
    _pos = [getPos _home,[0,700]]call Zen_FindGroundPosition;
    while{(_unit distance _pos) > 20}do{
        _unit doMove _pos;
        _unit setBehaviour "SAFE";
        (group _unit) setSpeedMode "LIMITED";
        waitUntil{sleep 5; behaviour _unit == "COMBAT"};
        waitUntil{sleep 5; behaviour _unit == "SAFE"};
    };
};
