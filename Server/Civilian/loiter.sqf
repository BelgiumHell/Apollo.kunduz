/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_home"];

while{(alive _unit) && ((side _unit) == civilian)}do{
    _pos = [getPos _home,[0,700]]call Zen_FindGroundPosition;
    while{(_unit distance _pos) > 20}do{
        _unit doMove _pos;
        (group _unit) setBehaviour "SAFE";
        (group _unit) setSpeedMode "LIMITED";
        sleep 120;
    };
};
