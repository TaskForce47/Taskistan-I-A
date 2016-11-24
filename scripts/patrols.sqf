

_pos = getMarkerPos "pat20";

_vic = "rhsgref_ins_g_btr70" createVehicle _pos;
createVehicleCrew _vic;

[_vic,"pat2","NOWAIT","NOSLOW","TRACK"] execVM "ups_hc.sqf"; 