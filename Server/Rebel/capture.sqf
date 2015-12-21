/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit","_target"];

//Make sure only one goes to capture the target
sleep (random 5);
if(_target getVariable "captureIP")exitWith {};
_target setVariable ["captureIP", true, true];

[_target]spawn{
    params ["_target"];
    waitUntil {sleep 15; (!captive _target)};
    _target setVariable ["captureIP", false, true];
};

_unit doMove (getPos _target);
_unit setBehaviour "AWARE";

waitUntil{(_unit distance _target) < 3};
[_target, true, (random 500 + 487)]call ace_medical_fnc_setUnconscious;
[_unit,_target]call ace_dragging_fnc_startCarry;

sleep 3;

_unit doMove (getPos (_unit getVariable "hideout"));
_unit setBehaviour "SAFE";
waitUntil {_unit distance (_unit getVariable "hideout") < 3};
[_unit,_target]call ace_dragging_fnc_dropObject_carry;
[_target,true]call ace_captives_fnc_setHandcuffed;
