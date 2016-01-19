/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_box","_unit","_uniforms","_vests","_helmets","_backpacks"];
params["_box"];

_weapons = [
	"UK3CB_BAF_L110A2",
	"UK3CB_BAF_L110A2_FIST",
	"UK3CB_BAF_L115A3",
	"UK3CB_BAF_L128A1",
	"UK3CB_BAF_L129A1",
	"UK3CB_BAF_L129A1_AFG",
	"UK3CB_BAF_L129A1_FGrip",
	"UK3CB_BAF_L129A1_Grippod",
	"UK3CB_BAF_L22",
	"UK3CB_BAF_L22A2",
	"UK3CB_BAF_L7A2",
	"UK3CB_BAF_L85A2",
	"UK3CB_BAF_L85A2_RIS",
	"UK3CB_BAF_L85A2_UGL",
	"UK3CB_BAF_L85A2_UGL_HWS",
	"UK3CB_BAF_L131A1",
	"tf47_m3maaws"
];

_magazines = [
];
_uniforms = [
	"G2_CU_MTP",
	"G2_RU_MTP",
	"U_B_CombatUniform_mcam_tshirt",
	"G3_CU_MT",
	"G3_RU_MTP",
	"U_I_G_Story_Protagonist_F"
];
_vests = [
    "JPC_MC_1",
    "JPC_MC_2",
    "JPC_MC_3",
	"JPC_MC_4",
    "JPC_MC_5",
	"lbt_comms_coy",
	"lbt_medical_coy",
	"lbt_operator_coy",
	"lbt_tl_coy",
	"lbt_weapons_coy",
	"lbt_comms_od",
	"lbt_medical_od",
	"lbt_operator_od",
	"lbt_tl_od",
	"lbt_weapons_od"
];
_helmets = [
	"noraf_opscore_helmet_cover_blk",
	"noraf_opscore_helmet_cover_fg",
	"noraf_opscore_helmet_cover",
	"noraf_opscore_helmet",
	"noraf_opscore_helmet_cover_blk_pelt",
	"noraf_opscore_helmet_cover_fg_pelt",
	"noraf_opscore_helmet_cover_pelt",
	"crye_airframe_rg_AF_VAS",
	"crye_airframe_tan_AF_VAS_cover",
	"crye_airframe_blk_AF_VAS_cover",
	"crye_airframe_rg_AF_VAS_cover",
	"crye_airframe_blk_AF_VAS_Pelt_cover",
	"crye_airframe_rg_AF_VAS_Pelt_cover",
	"H_HelmetSpecB_snakeskin",
	"H_HelmetB_snakeskin"
];
_backpacks = [
	"B_UAV_01_backpack_F",
	"ACE_TacticalLadder_Pack",
	"B_TacticalPack_oli",
	"B_TacticalPack_mcamo",
	"B_TacticalPack_blk",
	"B_Kitbag_mcamo",
	"B_Kitbag_rgr",
	"B_Kitbag_cbr",
	"B_FieldPack_cbr",
	"B_Carryall_cbr",
	"B_Carryall_mcamo",
	"B_AssaultPack_mcamo",
	"B_AssaultPack_rgr",
	"B_AssaultPack_cbr"
];

_items = [
	"UK3CB_BAF_SFFH",
	"UK3CB_BAF_Flashlight_L131A1",
	"UK3CB_BAF_LLM_Flashlight_Black",
    "UK3CB_BAF_LLM_Flashlight_Tan",
	"UK3CB_BAF_LLM_IR_Black LLM",
	"UK3CB_BAF_LLM_IR_Tan",
	"UK3CB_BAF_SpecterLDS",
	"UK3CB_BAF_SpecterLDS_Dot",
	"UK3CB_BAF_Eotech",
	"UK3CB_BAF_SB31250",
	"UK3CB_BAF_SB31250_Desert",
	"UK3CB_BAF_SUSAT",
	"UK3CB_BAF_TA31F",
	"UK3CB_BAF_TA31F_Hornbill",
	"UK3CB_BAF_TA648_308",
	"tf47_optic_m3maaws",

    "ACE_Flashlight_MX991",
	"ACE_NVG_Gen1",
    "ACE_NVG_Gen2",
    "ItemMap",
    "ItemCompass",
    "ItemWatch",
	"ItemAndroid",
	"ItemcTab",
	"ItemcTabHCam",
    "G_Tactical_Black",
    "G_Tactical_Clear",
    "G_Combat",
	"Binocular",
	"Rangefinder"
];

[_box,_weapons,false,true] call XLA_fnc_addVirtualWeaponCargo;
[_box,_magazines,false,true] call XLA_fnc_addVirtualMagazineCargo;
[_box,_backpacks,false,true] call XLA_fnc_addVirtualBackpackCargo;
[_box,(_uniforms + _vests + _helmets + _items),false,true] call XLA_fnc_addVirtualItemCargo;

[[_box],{
	params["_box"];
    _action_343 = ["radio_343", "Get AN/PRC 343", "", {(_this select 1) addItem "ACRE_PRC343"}, {true}] call ace_interact_menu_fnc_createAction;
	[_box, 0, ["ACE_MainActions"], _action_343] call ace_interact_menu_fnc_addActionToObject;

	_action_148 = ["radio_148", "Get AN/PRC 148", "", {(_this select 1) addItem "ACRE_PRC148"}, {true}] call ace_interact_menu_fnc_createAction;
	[_box, 0, ["ACE_MainActions"], _action_148] call ace_interact_menu_fnc_addActionToObject;
}] remoteExec ["BIS_fnc_spawn", 0, true];
