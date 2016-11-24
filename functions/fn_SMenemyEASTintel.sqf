/*
@filename: QS_fnc_SMenemyEASTintel.sqf
Author: 

	Quiksilver
	
Last modified:

	25/04/2014

Description:

	Spawn OPFOR enemy around intel objectives
	Enemy should have backbone AA/AT + random composition.
	Smaller number of enemy due to more complex objective.
	
___________________________________________*/

//---------- CONFIG

#define INF_TEAMS "rhsgref_group_chdkz_infantry_patrol","rhsgref_group_chdkz_ins_gurgents_squad","rhsgref_group_chdkz_infantry_mg","rhsgref_group_chdkz_infantry_aa","rhsgref_group_chdkz_infantry_at"
#define VEH_TYPES "rhsgref_ins_g_btr70","rhsgref_ins_g_bmp2d","rhsgref_ins_g_t72bc","rhsgref_ins_g_uaz_ags","rhsgref_ins_g_uaz_spg9"
private ["_x","_pos","_flatPos","_randomPos","_unitsArray","_enemiesArray","_infteamPatrol","_SMvehPatrol","_SMveh","_SMaaPatrol","_SMaa"];
_enemiesArray = [grpNull];
_x = 0;

//---------- INFANTRY

for "_x" from 0 to (1 + (random 3)) do {
	_infteamPatrol = createGroup east;
	_randomPos = [[[getPos _intelObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhsgref_faction_chdkz_g" >> "rhsgref_group_chdkz_ins_gurgents_infantry" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos _intelObj, 100] call BIS_fnc_taskPatrol;
	[(units _infteamPatrol)] call QS_fnc_setSkill2;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];

	// {
		// _x addCuratorEditableObjects [units _infteamPatrol, false];
	// } foreach adminCurators;

};

//---------- RANDOM VEHICLE

_SMvehPatrol = createGroup east;
_randomPos = [[[getPos _intelObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh};
if(typeOf _SMveh == "rhsgref_ins_g_uaz_ags" || typeOf _SMveh == "rhsgref_ins_g_uaz_spg9" || typeOf _SMveh == "rhsgref_ins_g_uaz_dshkm_chdkz") then {
	_helperGroup = createGroup east;
	"rhsgref_ins_g_crew" createUnit [_randomPos, _helperGroup];
	"rhsgref_ins_g_crew" createUnit [_randomPos, _helperGroup];
	((units _helperGroup) select 0) assignAsDriver _SMveh;
	((units _helperGroup) select 0) moveInDriver _SMveh;
	((units _helperGroup) select 0) addWeapon "NVGoggles_INDEP";
	((units _helperGroup) select 1) assignAsGunner _SMveh;
	((units _helperGroup) select 1) moveInGunner _SMveh;
	((units _helperGroup) select 1) addWeapon "NVGoggles_INDEP";
} else {
[_SMveh, _SMvehPatrol] call BIS_fnc_spawnCrew;
};
[_SMvehPatrol, getPos _intelObj, 150] call BIS_fnc_taskPatrol;
[(units _SMvehPatrol)] call QS_fnc_setSkill2;
_SMveh lock 3;
if (random 1 >= 0.5) then {
	_SMveh allowCrewInImmobile true;
};
	
_enemiesArray = _enemiesArray + [_SMvehPatrol];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMveh];

// {
	// _x addCuratorEditableObjects [[_SMveh], false];
	// _x addCuratorEditableObjects [units _SMvehPatrol, false];
// } foreach adminCurators;

_enemiesArray