/////////////////////////
//Script made by Jochem//
/////////////////////////
switch (_this select 1) do
{
	//UP -> increase height
	case 200:
	{
		_object = player getVariable "buildObject";
		detach _object;
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") + 0.10)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") + 0.10)];
	};
	//DOWN -> decrease height
	case 208:
	{
		_object = player getVariable "buildObject";
		detach _object;
		_object attachTo [player,[0,5,((_object getVariable "buildHeight") - 0.10)]];
		_object setVariable ["buildHeight",((_object getVariable "buildHeight") - 0.10)];
	};

	//Ignore all others
	default{};
};
