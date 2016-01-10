/////////////////////////
//Script made by Jochem//
/////////////////////////
supplyDrop = "Day";
publicVariable "supplyDrop";

[[],{
    _action_supply = ["supply", "Supply", "", {true}, {true}] call ace_interact_menu_fnc_createAction;

    _action_supplyChoose = ["chooseDrop", "Choose drop", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseCoyote = ["chooseDropCoyote", "2x Coyote", "", {supplyDrop = "Coyote"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseJackel = ["chooseDropJackel", "2x Jackel", "", {supplyDrop = "Jackel"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseApache = ["chooseDropApache", "1x Apache", "", {supplyDrop = "Apache"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseMerlin = ["chooseDropMerlin", "1x Merlin", "", {supplyDrop = "Merlin"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseDay = ["chooseDropDay", "Ammunition: Day", "", {supplyDrop = "Day"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseNight = ["chooseDropNight", "Ammunition: Night", "", {supplyDrop = "Night"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;
    _action_supplyChooseMedical = ["chooseDropMedical", "Medical", "", {supplyDrop = "Medical"; publicVariable "supplyDrop";}, {true}] call ace_interact_menu_fnc_createAction;

    _action_supplyCheck = ["checkDrop", "Current drop", "", {hint supplyDrop}, {true}] call ace_interact_menu_fnc_createAction;


    [supplyLaptop, 0, ["ACE_MainActions"], _action_supply] call ace_interact_menu_fnc_addActionToObject;

    [supplyLaptop, 0, ["ACE_MainActions", "supply"], _action_supplyChoose] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseCoyote] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseJackel] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseApache] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseMerlin] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseDay] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseNight] call ace_interact_menu_fnc_addActionToObject;
    [supplyLaptop, 0, ["ACE_MainActions", "supply", "chooseDrop"], _action_supplyChooseMedical] call ace_interact_menu_fnc_addActionToObject;

    [supplyLaptop, 0, ["ACE_MainActions", "supply"], _action_supplyCheck] call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn", 0, true];
