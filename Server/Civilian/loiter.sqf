/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_home"];

_handeSleep = scriptNull;

while{(alive _unit) && ((side _unit) == civilian)}do{
    diag_log "civ-loiter-loop";
    if(daytime > 7 && daytime < 19)then{
        diag_log "civ-loiter-day";
        terminate _handeSleep;
        _handeSleep = scriptNull;
        if(daytime > 9 && daytime < 17)then{
            diag_log "civ-loiter-work";
            _plant = selectRandom ([plants,(getPos _home), 600]call JOC_miscGetNearest);
            while{(_unit distance _plant) > 2}do{
                _unit doMove (getPos _plant);
                sleep 30;
            };
            _i = 0;
            while{_i < 100}do{
                _unit playMove "AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon";
                sleep 6;
                _i = _i + 1;
            };
            _unit playMove "";
            [_unit,getPos _home]spawn Zen_OrderInfantryPatrolBuilding;
            waitUntil {sleep 10; _unit distance _home < 2};
        }else{
            diag_log "civ-loiter-free";
            _pos = [getPos _home,[0,700]]call Zen_FindGroundPosition;
            while{(_unit distance _pos) > 20}do{
                _unit doMove _pos;
                sleep 30;
            };
        };
    }else{
        if(isNull _handeSleep)then{
            diag_log "civ-loiter-sleep";
            _handeSleep = [_unit,getPos _home]spawn Zen_OrderInfantryPatrolBuilding;
        };
    };

    sleep 30;
};
