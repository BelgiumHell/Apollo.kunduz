/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_unit"];
_hideout = _unit getVariable "hideout";
_towns = [];
_outposts = [];
_town = 0;
_handle = scriptNull;

while{alive _unit}do{
    sleep (round(random 5400));

    //Ceck for activity to do
    _towns = [];
    {
        _objects = nearestObjects [getPos _x,["Man","Car","Tank","Air"],400];

        if((west countSide _objects) > 5)then{
            _towns pushBack _x;
        };
    } forEach villages;

    if(count _towns > 0)then{
        _prevDis = 99999;
        {
            _dis = (_unit distance (getPos _x));
            if(_prevDis > _dis)then{
                _town = _x;
                _prevDis = _dis;
            };
        } forEach _towns;
        _handle = [_town,_unit]spawn JOC_rebelHvtAttack;
    }else{
        _handle = [_unit]spawn JOC_rebelHvtAmbush;
    };

    waitUntil {sleep 10; scriptDone _handle};

    _unit doMove (getPos _hideout);
};
