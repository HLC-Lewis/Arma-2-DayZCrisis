/* Initialize FHQ helo air taxi
 * 
 * At least two objects have to be linked: The helo that is to be used, and a helipad that
 * will serve as it's homebase (can be invisible, too)
 * 
 * Callbacks:
 * Callbacks are always invoked with same set of parameters:
 * [logic, helo, pilot, player group]
 * Additionally, the callback will be executed on the machine where the controlling player is
 * local (i.e. the team leader)
 */

FHQ_heloInit = false;
publicVariable "FHQ_heloInit";
 
FHQ_commandExecute = {};
publicVariable "FHQ_commandExecute";

FHQ_controlPlayer = objNull;
FHQ_controlAll = objNull;

"FHQ_controlPlayer" addPublicVariableEventHandler 
{
    if (local (_this select 1)) then 
    {
        _this call FHQ_commandExecute;
    };
};

"FHQ_controlAll" addPublicVariableEventHandler 
{
    diag_log "Calling function";
    _this call FHQ_commandExecute;
};

//[] call compile preprocessFileLineNumbers "scripts\FHQ_functions.sqf";
_handle = [] execVM "functions\helo\FHQ_functions.sqf";

waitUntil { scriptDone _handle};

if (!isServer) exitWith {true};

FHQ_heloLogic = _this;
publicVariable "FHQ_heloLogic";

_objects = synchronizedObjects _this;
_helo = vehicle (_objects select 1);
_playerGroup = group (_objects select 2);
_playableUnits = playableUnits;
if (!isMultiplayer) then
{
	_playableUnits = switchableUnits;
};  

/* Find the heli (first "Man" in a vehicle is crew member) */
{
    if (_x isKindOf "Man" && _x != vehicle _x) 
        exitWith {_helo = vehicle _x;};

} forEach _objects;

/* Find player (first "Man" that is in playable units) */
{
    if (_x isKindOf "Man" && _x in _playableUnits) 
        exitWith {_playerGroup = group _x;};

} forEach _objects;

_heliPad = nearestObject [_helo, "HeliH"];
_homeBase = getPos _heliPad;

if (isNull _heliPad) then 
{
    _homeBase = getPos _helo;
};
 
// Set the parameters as variables on the Logic so we can retrieve them outside of the FSM
_this setVariable ["FHQ_helo", _helo, true];
_this setVariable ["FHQ_homeBase", _homeBase, true];
_this setVariable ["FHQ_playerGroup", _playerGroup, true];
_this setVariable ["FHQ_waypointList", [], true];
_this setVariable ["FHQ_currentWaypoint", -1];
_this setVariable ["FHQ_readyToMove", false, true];
_this setVariable ["FHQ_heloIsCalled", false, true];
_this setVariable ["FHQ_heloIsCancelled", false, true];
 
// Callbacks
[_this, "selectPickupDest", {}] call FHQ_fnc_setHeloCallback;
[_this, "selectDropoffDest", {}] call FHQ_fnc_setHeloCallback;
[_this, "enRouteForPickup", {}] call FHQ_fnc_setHeloCallback;
[_this, "enRouteForDropoff", {}] call FHQ_fnc_setHeloCallback;
[_this, "returnToBase", {}] call FHQ_fnc_setHeloCallback;
[_this, "heloDestroyed", {}] call FHQ_fnc_setHeloCallback;
[_this, "reachUnload", {}] call FHQ_fnc_setHeloCallback;
[_this, "reachLoad", {}] call FHQ_fnc_setHeloCallback;
[_this, "reachMove", {}] call FHQ_fnc_setHeloCallback;
[_this, "reachBase", {}] call FHQ_fnc_setHeloCallback;
 
[_helo, _homeBase, _playerGroup, _this] execFSM "functions\helo\FHQ_heloTaxi.fsm";
  

_helo setVariable ["FHQ_controlLogic", _this, true];
_helo setVariable ["FHQ_showMarker", false, true];
_helo setCombatMode "GREEN";
_helo setBehaviour "SAFE"; 


FHQ_heloInit = true;
publicVariable "FHQ_heloInit";
 
true