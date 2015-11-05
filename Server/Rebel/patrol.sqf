/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_hideout"];
_pos = 0;

while{alive _unit}do{
    _pos = [getPos _hideout,[0,300]]call Zen_FindGroundPosition;
    while{(_unit distance _pos) > 20}do{
        _unit doMove _pos;
        _unit setBehaviour "SAFE";
        (group _unit) setSpeedMode "LIMITED";
        (group _unit) setCombatMode "YELLOW";
        //waitUntil{sleep 5; !(isNull(_unit findNearestEnemy (getPos _unit)))};
        //[_unit,_hideout]call JOC_rebelDefense;
        sleep 120;
    };
};
