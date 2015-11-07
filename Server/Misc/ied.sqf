/////////////////////////////
//Script made by Jochem    //
//Snippets from TWC scripts//
/////////////////////////////
params["_ied"];

_ied addEventHandler ["Killed", {
    params ["_ied", "_killer"];
    _iedExplosive = createMine [typeOf _ied, getPos _ied, [], 0];
    sleep 0.5;
    _iedExplosive setDamage 1;
}];

_trigger = createTrigger ["EmptyDetector", getPos _ied, true];
_trigger setTriggerArea [20, 20, 0, false];
_trigger setTriggerActivation ["WEST", "PRESENT", true];
_trigger setTriggerStatements [
    "{
        if (abs (speed _x) >= 3 && (getPosATL _x select 2) < 5) exitWith {true};
        false
    } forEach thisList;",
    "(thisTrigger getVariable ""JOC_ied"") setDamage 1;deleteVehicle thisTrigger;",
    ""
];

_trigger setVariable ["JOC_ied", _ied];
