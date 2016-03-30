/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_home"];

while{(alive _unit) && ((side _unit) == civilian)}do{
    if(daytime > 7 && daytime < 19)then{
        if(daytime > 9 && daytime < 17)then{
            _plant = ([(getPos _unit), 500]call JOC_miscNearestPlants) call BIS_fnc_selectRandom;
            _unit doMove _plant;
            waitUntil {sleep 10; _unit distance _plant < 2};
            _unit playMove "Acts_TreatingWounded03";
            sleep 10;
        }else{
            _pos = [getPos _home,[0,700]]call Zen_FindGroundPosition;
            while{(_unit distance _pos) > 20}do{
                _unit doMove _pos;
                (group _unit) setBehaviour "SAFE";
                (group _unit) setSpeedMode "LIMITED";
                sleep 120;
            };
        };
    }else{
        _pos = [getPos _home,[0,700]]call Zen_FindGroundPosition;
        while{(_unit distance _pos) > 20}do{
            _unit doMove _pos;
            (group _unit) setBehaviour "SAFE";
            (group _unit) setSpeedMode "LIMITED";
            sleep 120;
        };
    };
};
