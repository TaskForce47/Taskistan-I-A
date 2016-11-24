/*
* Short Description
*
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/
params ["_flagpole",objNull,[objNull]];

if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
waitUntil { !isNil "cfgTF47" };
call cfgTF47;
private _pathToScripts = "tf47CoreScripts\";

_flagpole allowDamage false; 

_flagpole addAction [("<t color=""#fadf3e"">" + ("Show Tickets") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["show"]];  

_flagpole addAction [("<t color=""#9ffa3e"">" + ("Add Tickets: 1") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["add", 1]];  
_flagpole addAction [("<t color=""#9ffa3e"">" + ("Add Tickets: 5") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["add", 5]];  
_flagpole addAction [("<t color=""#9ffa3e"">" + ("Add Tickets: 10") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["add", 10]];   

_flagpole addAction [("<t color=""#fa6f3e"">" + ("Take Tickets: 1") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["use", 1]];  
_flagpole addAction [("<t color=""#fa6f3e"">" + ("Take Tickets: 5") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["use", 5]];  
_flagpole addAction [("<t color=""#fa6f3e"">" + ("Take Tickets: 10") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["use", 10]];   

_flagpole addAction [("<t color=""#fa9f3e"">" + ("Reset Tickets") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["init"]];  