/////////////////////////
//Script made by Jochem//
/////////////////////////
//Strategic compounds
strategic = nearestObjects [[worldSize/2,worldSize/2], ["Land_BagBunker_Small_F","Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F",
"Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F",
"Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"], (worldSize*2^0.5)];

//Houses
_housesB = nearestObjects [[worldSize/2,worldSize/2], ["Land_MilOffices_V1_F","Land_nav_pier_m_F","Land_Pier_addon","Land_Pier_Box_F","Land_Pier_F","Land_Pier_small_F","Land_Pier_wall_F"], (worldSize*2^0.5)];
_housesP = ((nearestObjects [[worldSize/2,worldSize/2], ["house"], (worldSize*2^0.5)]) - strategic - _housesB);

{
    if(((nearestBuilding _x) == _x) && ((count ([_x]call BIS_fnc_buildingPositions)) > 1))then{
        houses pushBack _x;
    }
} forEach _housesP;

villages = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital"], (worldSize*2^0.5)];
housesVillages = [];
{
    _house = _x;
    {
        if((getPos _x) distance2d _house < 400)then{
            housesVillages pushBack _house;
        };
    } forEach villages;
} forEach houses;

//Mosques
mosques = nearestObjects [[worldSize/2,worldSize/2], ["Land_Jbad_A_Minaret"], (worldSize*2^0.5)];
