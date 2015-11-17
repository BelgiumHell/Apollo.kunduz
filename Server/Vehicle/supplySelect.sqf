/////////////////////////
//Script made by Jochem//
/////////////////////////
[[],{
    supplyLaptop addAction ["Vehicle selector", VVS_fnc_openVVS,["respawn_west","All"]];

    supplyLaptop addAction ["Current drop", {
        _string = "";
        {
            _cfgInfo = [_x] call VVS_fnc_cfgInfo;
            _string = composeText [_string, lineBreak, (_cfgInfo select 3)];
        } forEach cargoDrop;
        hint _string;
    }];

    supplyLaptop addAction ["Remove last vehicle from drop", {
        cargoDrop deleteAt ((count cargoDrop) - 1);
    }];

    supplyLaptop addAction ["Clear drop", {
        cargoDrop = [];
        publicVariable "cargoDrop";
    }];
}] remoteExec ["BIS_fnc_spawn", 0, true];
