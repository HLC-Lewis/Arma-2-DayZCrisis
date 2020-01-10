if (!isServer) exitWith {/* Server only */};

_startPos = [ 
	(getMarkerPos "markChoppaSpawn") select 0,
    (getMarkerPos "markChoppaSpawn") select 1,
    40
];

_choppaVec = [_startPos, 0, "Ka60_PMC", side (leader FHQ_playerGroup)] call BIS_fnc_spawnVehicle;

_grp = _choppaVec select 2;
FHQ_choppa = _choppaVec select 0;

_wp = _grp addWaypoint [getMarkerPos "markExtract", 0];
_wp setWaypointType "LOAD";
_wp setWaypointStatements ["true", "FHQ_choppa land ""GET IN"";"];

//"HeliHEmpty" createVehicle (getMarkerPos "markExtract");

waitUntil {
    ({alive _x} count units FHQ_playerGroup) 
    ==
    ({_x in FHQ_choppa} count units FHQ_playerGroup)
};

_wp = _grp addWaypoint [getMarkerPos "markChoppaSpawn", 0];
_wp setWaypointType "MOVE";

["taskExtract", "succeeded"] call FHQ_TT_setTaskState;
["missionEnd", ["END2", "Mission Successful", 20]] call FHQ_MP_globalEvent;