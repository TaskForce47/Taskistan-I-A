// _type = _this select 3;
_spawner = _this select 0;
_spawnerdir = direction _spawner;
_spawnpos = getPos _spawner getPos[3, _spawnerdir + 180];
_near = nearestObjects [_spawnpos, ["B_Slingload_01_Repair_F","B_Slingload_01_Ammo_F","B_Slingload_01_Fuel_F","B_Slingload_01_Medevac_F","B_Slingload_01_Cargo_F"], 10];



 // hint str _near;
if(count _near > 0) then {
	{
		_x setVariable ["debugRespawn", true];
		deleteVehicle _x;
	} forEach _near;
};

