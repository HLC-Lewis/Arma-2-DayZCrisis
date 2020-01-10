if (!isServer) exitWith {};

_units = _this select 0;
_markerName = _this select 1;

FHQ_RETREAT_deleteVehicle = {
    private ["_vehicle", "_x"];
    
	_vehicle = vehicle _this;
    
	{
        deleteVehicle _x;
    } forEach crew _vehicle;
    
    deleteVehicle _vehicle;
};

FHQ_RETREAT_deleteGroup = {
    private "_x";
    
    {
        if ((_x distance (_this select 0)) < (_this select 1)) then {  
        	_x call FHQ_RETREAT_deleteVehicle;
        };
    } forEach (units (_this select 0));
};

_code = "[this, 100] call FHQ_RETREAT_deleteGroup;";

if (count _this == 3) then {
	_code = _this select 2;
};

{
    _side = side _x;
    _grp = createGroup _side;
    
    (units _x) joinSilent _grp;
    
    _newPos = [getMarkerPos _markerName, random (30), random(360)] call BIS_fnc_relPos;
    
    _wp = _grp addWaypoint [_newPos, 20];
    
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCombatMode "GREEN";
	_wp setWaypointStatements ["true", _code];
} forEach _units;   