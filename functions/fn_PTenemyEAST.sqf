/*
Author: 

	Quiksilver
	
Last modified:

	25/04/2014

Description:

	Spawn OPFOR enemy around side objectives.
	Enemy should have backbone AA/AT + random composition.
	
___________________________________________*/

//---------- CONFIG

#define INF_TEAMS "rhsgref_group_chdkz_infantry_at","rhsgref_group_chdkz_infantry_mg","rhsgref_group_chdkz_ins_gurgents_squad","rhsgref_group_chdkz_ins_gurgents_squad","rhsgref_group_chdkz_ins_gurgents_squad"
#define VEH_TYPES "rhsgref_ins_g_btr70","rhsgref_ins_g_bmp2d","rhsgref_ins_g_t72bc","rhsgref_ins_g_zsu234"
private ["_x","_pos","_flatPos","_randomPos","_enemiesArray","_infteamPatrol","_SMvehPatrol","_SMveh","_SMaaPatrol","_SMaa","_smSniperTeam"];
_enemiesArray = [grpNull];
_x = 0;

//---------- GROUPS
	
_infteamPatrol = createGroup east;
_smSniperTeam = createGroup east;
_SMvehPatrol = createGroup east;
_SMaaPatrol = createGroup east;

//---------- INFANTRY RANDOM
	
for "_x" from 0 to (3 + (random 4)) do {
	_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhsgref_faction_chdkz_g" >> "rhsgref_group_chdkz_ins_gurgents_infantry" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos priorityObj1, 100] call BIS_fnc_taskPatrol;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];
};

//---------- SNIPER

for "_x" from 0 to 1 do {
	_randomPos = [getPos priorityObj1, 500, 100, 20] call BIS_fnc_findOverwatch;
	_smSniperTeam = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad_sniper")] call BIS_fnc_spawnGroup;
	_smSniperTeam setBehaviour "COMBAT";
	_smSniperTeam setCombatMode "RED";
		
	_enemiesArray = _enemiesArray + [_smSniperTeam];
};
	
//---------- VEHICLE RANDOM
	
_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh1 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
//waitUntil {sleep 0.5; !(isNil "_SMveh1")};
waitUntil {sleep 0.5; !isNull _SMveh1};
[_SMveh1, _SMvehPatrol] call BIS_fnc_spawnCrew;

_SMveh1 lock 3;
[_SMvehPatrol, getPos priorityObj1, 75] call BIS_fnc_taskPatrol;
sleep 0.1;
	
_enemiesArray = _enemiesArray + [_SMveh1];
	
//---------- VEHICLE RANDOM	
	
_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh2 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh2};
[_SMveh2, _SMvehPatrol] call BIS_fnc_spawnCrew;

_SMveh2 lock 3;
[_SMvehPatrol, getPos priorityObj1, 150] call BIS_fnc_taskPatrol;
sleep 0.1;
	
_enemiesArray = _enemiesArray + [_SMveh2];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMvehPatrol];

//---------- VEHICLE AA
	
_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMaa = "rhsgref_ins_g_zsu234" createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMaa};
[_SMaa, _SMaaPatrol] call BIS_fnc_spawnCrew;

_SMaa lock 3;
[_SMaaPatrol, getPos priorityObj1, 150] call BIS_fnc_taskPatrol;
	
_enemiesArray = _enemiesArray + [_SMaaPatrol];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMaa];

//---------- COMMON

[(units _infteamPatrol)] call QS_fnc_setSkill2;
[(units _smSniperTeam)] call QS_fnc_setSkill3;
[(units _SMaaPatrol)] call QS_fnc_setSkill4;
[(units _SMvehPatrol)] call QS_fnc_setSkill2;
	
//---------- GARRISON FORTIFICATIONS
	
	{
		_newGrp = [_x] call QS_fnc_garrisonFortEAST;
		if (!isNull _newGrp) then { 
		_enemiesArray = _enemiesArray + [_newGrp]; };
	} forEach (getPos priorityObj1 nearObjects ["House", 150]);
	
_enemiesArray