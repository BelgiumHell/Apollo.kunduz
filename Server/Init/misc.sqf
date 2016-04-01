/////////////////////////
//Script made by Jochem//
/////////////////////////
/*gates = nearestObjects [[worldSize/2,worldSize/2], ["Land_BarGate_F"], (worldSize*2^0.5)];

{
    _trg = createTrigger ["EmptyDetector",(getPos _x),true];
    _trg setTriggerArea [8,27,getDir _x,true];
    _trg setTriggerActivation ["WEST","PRESENT", true];
    _trg setTriggerStatements ["this",format["(gates select %1) animate [""Door_1_rot"", 1] ",_forEachIndex],format["(gates select %1) animate [""Door_1_rot"", 0] ",_forEachIndex]];
} forEach gates;*/

{
    _name = (_x select 3);
    _array = _x;
    {
        if((vehicleVarName _x) == _name)then{
            _array set [3,_x];
        };
    } forEach houses;
    _array set [2,(call compile (_x select 2))];
} forEach virtualizedArray;

{
    _name = _x;
    _index = _forEachIndex;
    {
        if((vehicleVarName _x) == _name)then{
            homes set [_index,_x];
        };
    } forEach houses;
} forEach homes;

{
    _name = _x;
    _index = _forEachIndex;
    {
        if((vehicleVarName _x) == _name)then{
            hideouts set [_index,_x];
        };
    } forEach houses;
} forEach hideouts;

{
    [_x]call JOC_rebelCreateHideout;
} forEach hideouts;
