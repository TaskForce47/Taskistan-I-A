/*
@filename: initPlayerLocal.sqf
Author:
	
	Quiksilver

Last modified:

	29/10/2014 ArmA 1.32 by Quiksilver
	
Description:

	Client scripts and event handlers.
______________________________________________________*/

if (!hasInterface) exitWith {};

enableSentences FALSE;															
enableSaving [FALSE,FALSE];


//------------------------------------------------ Handle parameters
/* done in init.sqf
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};
*/
//------------------- client executions

//{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;
/*
_null = [] execvm "scripts\vehicle\crew\crew.sqf"; 								// vehicle HUD
_null = [] execVM 'scripts\group_manager.sqf';									// group manager
_null = [] execVM "scripts\restrictions.sqf"; 									// gear restrictions and safezone
_null = [] execVM "scripts\pilotCheck.sqf"; 									// pilots only
_null = [] execVM "scripts\jump.sqf";											// jump action 
*/
// _null = [] execVM "scripts\misc\diary.sqf";										// diary tabs	
/*
_null = [] execVM "scripts\icons.sqf";											// blufor map tracker Quicksilver
_null = [] execVM "scripts\VAclient.sqf";										// Virtual Arsenal
_null = [] execVM "scripts\misc\Intro.sqf";										// AW intro screen
_null = [] execVM "scripts\voice_control\voiceControl.sqf";						// Voice Control
if (PARAMS_HeliRope != 0) then {call compile preprocessFileLineNumbers "scripts\vehicle\fastrope\zlt_fastrope.sqf";};	
if (PARAMS_HeliSling != 0) then {call compile preprocessFileLineNumbers "scripts\vehicle\sling\sling_config.sqf";};				// Heli Sling.

[] call QS_fnc_respawnPilot;
*/

_null = [] execVM "scripts\safezone.sqf"; 										// spawn protection
_null = [] execVM "scripts\misc\diary.sqf";										// diary tabs	
if (isMultiplayer) then {_null = [_this select 0] execVM "scripts\tf47\checkTFAR.sqf";};							//check if TFAR is enabled
//_null = [] execVM "scripts\icons.sqf";										// blufor map tracker

//waituntil {!	(isnull (finddisplay 46)	)	&& !(isNil "player") };

//[player] spawn TF47_UMenu_fnc_initPlayerLocal;
#include "ZadeServicePoint\include\initPlayerLocal.hpp";


_player = _this select 0;

// _action = ["TF47_CPR", "CPR (TF47)", "", {[_this select 0,_this select 1] execVM "scripts\tf47\CPR.sqf"}, {([_this select 0] call tf47_fnc_isStable) and ((typeof (_this select 1) in ["rhsusf_army_ucp_medic","rhsusf_army_ocp_medic"])) and ((_this select 0) getvariable ["ACE_isUnconscious", false])}] call ace_interact_menu_fnc_createAction;
// [_player, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//[_this select 0] spawn TF47_UMenu_fnc_initPlayerLocal;
enableCamShake false;

//hint "It is possible, that you experience low FPS for the first 2 minutes, due to script initialisations! \n \n Es ist möglich, dass du weniger FPS in den ersten beiden Minuten hast, dies liegt an Scriptinitialisierungen!";
hint "Drücke STRG + U für das U-Menü (Freq-Tracker, Viewdistance, BFT)! \n \n Press CTRL + U for the U-Menu (Freq-Tracker, Viewdistance, BFT)!";
//-------------------- PVEHs

"showNotification" addPublicVariableEventHandler
{
	private ["_type", "_message"];
	_array = _this select 1;
	_type = _array select 0;
	_message = "";
	if (count _array > 1) then { _message = _array select 1; };
	[_type, [_message]] call BIS_fnc_showNotification;
};

"GlobalHint" addPublicVariableEventHandler
{
	private ["_GHint"];
	_GHint = _this select 1;
	hint parseText format["%1", _GHint];
};

"hqSideChat" addPublicVariableEventHandler
{
	_message = _this select 1;
	[WEST,"HQ"] sideChat _message;
};

"addToScore" addPublicVariableEventHandler
{
	((_this select 1) select 0) addScore ((_this select 1) select 1);
};

"radioTower" addPublicVariableEventHandler
{
	"radioMarker" setMarkerPosLocal (markerPos "radioMarker");
	"radioMarker" setMarkerTextLocal (markerText "radioMarker");
	"radioCircle" setMarkerPosLocal (markerPos "radioCircle");
};

"sideMarker" addPublicVariableEventHandler
{
	"sideMarker" setMarkerPosLocal (markerPos "sideMarker");
	"sideCircle" setMarkerPosLocal (markerPos "sideCircle");
	"sideMarker" setMarkerTextLocal format["Side Mission: %1",sideMarkerText];
};

"priorityMarker" addPublicVariableEventHandler
{
	"priorityMarker" setMarkerPosLocal (markerPos "priorityMarker");
	"priorityCircle" setMarkerPosLocal (markerPos "priorityCircle");
	"priorityMarker" setMarkerTextLocal format["Priority Target: %1",priorityTargetText];
};


//["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Arsenal
_null = [] execVM "scripts\VA.sqf";
// Hier Stand mal die AddActions für das MISFIT Loadout Spawnschild Dingens


// _infoArray = squadParams player;    
// _infoSquad = _infoArray select 0;
// _squad = _infoSquad select 1;
// _infoName = _infoArray select 1;
// _name = _infoName select 1; 
// _email = _infoSquad select 2;
[[uh60,"uh60"],"setVehicleVarname",true] call BIS_fnc_MP;
[[dustoff,"dustoff"],"setVehicleVarname",true] call BIS_fnc_MP;
[[mh6,"mh6"],"setVehicleVarname",true] call BIS_fnc_MP;
[[ah6,"ah6"],"setVehicleVarname",true] call BIS_fnc_MP;
[[ch47,"ch47"],"setVehicleVarname",true] call BIS_fnc_MP;
[[uh1y,"uh1y"],"setVehicleVarname",true] call BIS_fnc_MP;
[[ah1z,"ah1z"],"setVehicleVarname",true] call BIS_fnc_MP;
[[a10,"a10"],"setVehicleVarname",true] call BIS_fnc_MP;
[[f16,"f16"],"setVehicleVarname",true] call BIS_fnc_MP;
[[c130j,"c130j"],"setVehicleVarname",true] call BIS_fnc_MP;
[[uav,"uav"],"setVehicleVarname",true] call BIS_fnc_MP;
[[tank1,"tank1"],"setVehicleVarname",true] call BIS_fnc_MP;
[[tank2,"tank2"],"setVehicleVarname",true] call BIS_fnc_MP;
[[ifv,"ifv"],"setVehicleVarname",true] call BIS_fnc_MP;
[[ifv2,"ifv2"],"setVehicleVarname",true] call BIS_fnc_MP;
[[M119_1,"M119_1"],"setVehicleVarname",true] call BIS_fnc_MP;
[[M119_2,"M119_2"],"setVehicleVarname",true] call BIS_fnc_MP;

TF47_UMenu_isEnabled = true;
publicVariable "TF47_UMenu_isEnabled";

sleep 5;

#include "tf47CoreScripts\umenu\Includes\initPlayerLocal.sqf";

// replace line below with your Squad xml's email
// TODO
//if (_email == "arma@ahoyworld.co.uk") then {

// GlobalHint = format["<t align='center' size='2.2' color='#FF0000'>%1<br/></t><t size='1.4' color='#33CCFF'>%2</t><br/>has joined the server, To get involved in the Ahoy World community, register an account at www.AhoyWorld.co.uk and get stuck in!</t><br/>","mifi","wilalrd"];

// hint parseText GlobalHint; publicVariable "GlobalHint";
//} else {};