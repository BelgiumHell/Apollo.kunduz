/////////////////////////
//Script made by Jochem//
/////////////////////////
switch (_this select 1) do
{
	//Open CDU
	case 210:
	{
		[]spawn JOC_vehCDU;
	};

	//UP -> increase height
	case 200:
	{
		_object = player getVariable "buildObject";
		detach _object;
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") + 0.25)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") + 0.25)];
	};
	//DOWN -> decrease height
	case 208:
	{
		_object = player getVariable "buildObject";
		detach _object;
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") - 0.25)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") - 0.25)];
	};

	//Ignore all others
	default{};
};
