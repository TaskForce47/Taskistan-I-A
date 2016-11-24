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

#define INF_TEAMS "rhsgref_group_chdkz_infantry_patrol","rhsgref_group_chdkz_ins_gurgents_squad","rhsgref_group_chdkz_infantry_mg","rhsgref_group_chdkz_infantry_aa","rhsgref_group_chdkz_infantry_at"
#define VEH_TYPES "rhsgref_ins_g_btr70","rhsgref_ins_g_bmp2d","rhsgref_ins_g_t72bc","rhsgref_ins_g_uaz_ags","rhsgref_ins_g_uaz_spg9"
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
	_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhsgref_faction_chdkz_g" >> "rhsgref_group_chdkz_ins_gurgents_infantry" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos sideObj, 100] call BIS_fnc_taskPatrol;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];

	// {
		// _x addCuratorEditableObjects [units _infteamPatrol, false];
	// } foreach adminCurators;

};

//---------- SNIPER

for "_x" from 0 to 1 do {
	_randomPos = [getPos sideObj, 500, 100, 20] call BIS_fnc_findOverwatch;
	_smSniperTeam = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad_sniper")] call BIS_fnc_spawnGroup;
	_smSniperTeam setBehaviour "COMBAT";
	_smSniperTeam setCombatMode "RED";
		
	_enemiesArray = _enemiesArray + [_smSniperTeam];

	// {
		// _x addCuratorEditableObjects [units _smSniperTeam, false];
	// } foreach adminCurators;

};
	
//---------- VEHICLE RANDOM
	
_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh1 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh1};
if(typeOf _SMveh1 == "rhsgref_ins_g_uaz_ags" || typeOf _SMveh1 == "rhsgref_ins_g_uaz_spg9" || typeOf _SMveh1 == "rhsgref_ins_g_uaz_dshkm_chdkz") then {
	_helperGroup = createGroup east;
	"rhsgref_ins_g_crew" createUnit [_randomPos, _helperGroup];
	"rhsgref_ins_g_crew" createUnit [_randomPos, _helperGroup];
	((units _helperGroup) select 0) assignAsDriver _SMveh1;
	((units _helperGroup) select 0) moveInDriver _SMveh1;
	((units _helperGroup) select 0) addWeapon "NVGoggles_INDEP";
	((units _helperGroup) select 1) assignAsGunner _SMveh1;
	((units _helperGroup) select 1) moveInGunner _SMveh1;
	((units _helperGroup) select 1) addWeapon "NVGoggles_INDEP";
} else {
[_SMveh1, _SMvehPatrol] call BIS_fnc_spawnCrew;
};
[_SMvehPatrol, getPos sideObj, 75] call BIS_fnc_taskPatrol;
_SMveh1 lock 3;
if (random 1 >= 0.5) then {
	_SMveh1 allowCrewInImmobile true;
};
sleep 0.1;
	
_enemiesArray = _enemiesArray + [_SMveh1];

// {
	// _x addCuratorEditableObjects [[_SMveh1], false];
	// _x addCuratorEditableObjects [units _SMvehPatrol, false];
// } foreach adminCurators;
	
//---------- VEHICLE RANDOM	
	
_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh2 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh2};
if(typeOf _SMveh2 == "rhsgref_ins_g_uaz_ags" || typeOf _SMveh2 == "rhsgref_ins_g_uaz_spg9" || typeOf _SMveh2 == "rhsgref_ins_g_uaz_dshkm_chdkz") then {
	_helperGroup = createGroup east;
	"rhsgref_ins_g_crew" createUnit [_randomPos, _helperGroup];
	"rhsgref_ins_g_crew" createUnit [_randomPos, _helperGroup];
	((units _helperGroup) select 0) assignAsDriver _SMveh2;
	((units _helperGroup) select 0) moveInDriver _SMveh2;
	((units _helperGroup) select 0) addWeapon "NVGoggles_INDEP";
	((units _helperGroup) select 1) assignAsGunner _SMveh2;
	((units _helperGroup) select 1) moveInGunner _SMveh2;
	((units _helperGroup) select 1) addWeapon "NVGoggles_INDEP";
} else {
	[_SMveh2, _SMvehPatrol] call BIS_fnc_spawnCrew;
};
[_SMvehPatrol, getPos sideObj, 150] call BIS_fnc_taskPatrol;
_SMveh2 lock 3;
if (random 1 >= 0.5) then {
	_SMveh2 allowCrewInImmobile true;
};
sleep 0.1;
	
_enemiesArray = _enemiesArray + [_SMveh2];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMvehPatrol];

// {
	// _x addCuratorEditableObjects [[_SMveh2], false];
	// _x addCuratorEditableObjects [units _SMvehPatrol, false];
// } foreach adminCurators;

//---------- VEHICLE AA
	
_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMaa = "rhsgref_ins_g_zsu234" createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMaa};
[_SMaa, _SMaaPatrol] call BIS_fnc_spawnCrew;
_SMaa lock 3;
if (random 1 >= 0.5) then {
	_SMaa allowCrewInImmobile true;
};
[_SMaaPatrol, getPos sideObj, 150] call BIS_fnc_taskPatrol;
	
_enemiesArray = _enemiesArray + [_SMaaPatrol];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMaa];

// {
	// _x addCuratorEditableObjects [[_SMaa], false];
	// _x addCuratorEditableObjects [units _SMaaPatrol, false];
// } foreach adminCurators;

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
		// {
			// _x addCuratorEditableObjects [units _newGrp, false];
		// } foreach adminCurators;

	} forEach (getPos sideObj nearObjects ["House", 150]);
	
_enemiesArray