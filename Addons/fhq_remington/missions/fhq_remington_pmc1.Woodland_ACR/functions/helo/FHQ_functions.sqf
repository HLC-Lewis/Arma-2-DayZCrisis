FHQ_addWaypoint =
{ 
	/* Add a waypoint to the list of waypoints attached to the logic. 
 	 * Each entry is an array of the form
 	 * [pos, type, seq]
 	 * pos is the position, type is the type (move, load, unload) and seq is the sequence number
 	 *
 	 * The script is called as [pos, logic, type] call FHQ_addWaypoint.sqf 
 	 */

	_pos = _this select 0;
	_logic = _this select 1;
	_type = _this select 2;

	_waypoints = _logic getVariable "FHQ_waypointList";
	_num = count _waypoints;
    _pos2 = _logic getVariable "FHQ_homeBase";
    
    if (_type == "unload") then
    {

        _x1 = _pos select 0;
        _x2 = _pos2 select 0;
        _y1 = _pos select 1;
        _y2 = _pos2 select 1;
        dist = sqrt((_x2 - _x1) * (_x2 - _x1) + (_y2 - _y1) * (_y2 - _y1));
        if (dist < 50) then
        {
            _pos = _pos2;
        }; 
    };

	_mrk = createMarker [format["FHQ_dest_mark_%1", _num], _pos];
	_mrk setMarkerShape "ICON";

	if (_type == "unload") then
	{
		_mrk setMarkerType "hd_start";
	};

	if (_type == "load") then
	{
		_mrk setMarkerType "hd_end";
	};

	if (_type == "move") then 
	{
	    _mrk setMarkerType "hd_dot";
        _mrk setMarkerText format["%1", _num + 1];
	};

	_newpoint = [_pos, _type, _num];
	_waypoints = _waypoints + [_newpoint];

	_logic setVariable ["FHQ_waypointList", _waypoints, true];
};

publicVariable "FHQ_addWaypoint";


/* --------------------------------------------------------------------------------------  */

FHQ_removeEmptyHeliPad = 
{
    if (!isNil "FHQ_emptyHeliPad") then
    {
    	deleteVehicle FHQ_emptyHeliPad;
    	FHQ_emptyHeliPad = objNull;
    	publicVariable "FHQ_emptyHeliPad";
    };
};   

publicVariable "FHQ_removeEmptyHeliPad";


/* --------------------------------------------------------------------------------------  */

FHQ_plotRoute = 
{
	// Called by onMapSingleClick "_null = [_pos, _units, _shift, _alt, _type] call FHQ_plotRoute";
	_pos = _this select 0;
	_units = _this select 1;
	_shift = _this select 2;
	_alt = _this select 3;
    _type = _this select 4;
    

	call FHQ_removeEmptyHeliPad;
    
	if (_shift || _alt) then
	{
	    [_pos, FHQ_heloLogic, "move"] call FHQ_addWaypoint;
	}
	else
	{
        [_pos, FHQ_heloLogic, _type] call FHQ_addWaypoint; 
		onMapSingleClick "";
		FHQ_heloLogic setVariable ["FHQ_readyToMove", true, true];
	};
    
    _num = FHQ_heloLogic getVariable "FHQ_currentWaypoint";
    
    if (_num == -1) then
    {
    	FHQ_heloLogic setVariable ["FHQ_currentWaypoint", 0, true];
    };
};

publicVariable "FHQ_plotRoute";


/* --------------------------------------------------------------------------------------  */

FHQ_clearWaypoints =
{
	/* Clear all waypoints on the given logic.
 	 * The script is called as [logic] call FHQ_clearWaypoint.sqf 
 	 */
	FHQ_controlPlayer = leader _playerGroup;
	FHQ_commandExecute =
	{
		onMapSingleClick "";
	};
	publicVariable "FHQ_commandExecute";

	if (local FHQ_controlPlayer) then
	{
		call FHQ_commandExecute;
	}
	else
	{
		publicVariable "FHQ_controlPlayer";
	};
    
 	_logic = _this select 0; 
	_waypoints = _logic getVariable "FHQ_waypointList";

	{
     	_num = _x select 2;
        delete_code = 
        {
            _num = _this select 0;
   			deleteMarker format["FHQ_dest_mark_%1", _num];
            diag_log format["deleting FHQ_dest_mark_%1", _num];
        };
        publicVariable "delete_code";
        [objNull, objNull, rCALLVAR, [_num], "delete_code"] call RE;
	} forEach _waypoints;
    
 	_logic setVariable ["FHQ_waypointList", [], true];
    FHQ_heloLogic setVariable ["FHQ_readyToMove", false, true];
    FHQ_heloLogic setVariable ["FHQ_heloIsCancelled", false, true];
    FHQ_heloLogic setVariable ["FHQ_heloIsCalled", false, true];
};

publicVariable "FHQ_clearWaypoints";


/* --------------------------------------------------------------------------------------  */

FHQ_clearHeloOrders =
{
    /* Clear the choppers orders, by replacing it's group.
     * Called as [chopper] call FHQ_clearChopperOrders;
     */

	_helo = _this select 0;
    
    _pilot = (crew _helo) select 0;
    _grp = group _pilot; 
	_newGrp = createGroup side _pilot;
	units _grp joinSilent _newGrp;
	deleteGroup _grp;
    
	call FHQ_removeEmptyHeliPad;
};

publicVariable "FHQ_clearHeloOrders";


/* --------------------------------------------------------------------------------------  */

FHQ_moveHelo = 
{
    /* Create a chain of waypoints for the chopper
	 * Script called as [_logic, _helo] call FHQ_moveHelo;
     */
    _logic = _this select 0;
	_helo = _this select 1;
 	_waypoints = _logic getVariable "FHQ_waypointList";
    
    {
        _pos = _x select 0;
        _type = _x select 1;
        _seq = _x select 2;
        
		_pilot = (crew _helo) select 0;
		_grp = group _pilot;
         
    	_wp = _grp addWaypoint [_pos, 2];
        _wp setWaypointType _type;
        
        if (_type == "unload") then
        {
			_wp setWaypointStatements ["true", "[FHQ_heloLogic, ""FHQ_reachUnloadCb""] call FHQ_invokeCalback; (vehicle this) land ""GET OUT"";"];
            FHQ_emptyHeliPad = "HeliHEmpty" createVehicle (_pos);
            publicVariable "FHQ_emptyHeliPad";
        };

		if (_type == "load") then
        {
			_wp setWaypointStatements ["true", "[FHQ_heloLogic, ""FHQ_reachLoadCb""] call FHQ_invokeCalback;(vehicle this) land ""GET IN"";"];
            FHQ_emptyHeliPad = "HeliHEmpty" createVehicle (_pos);
            publicVariable "FHQ_emptyHeliPad";
        };
        
        if (_type == "move") then
        {
            _wp setWaypointStatements ["true", "[FHQ_heloLogic, ""FHQ_reachMoveCb""] call FHQ_invokeCalback;"];
        };
             
    } forEach _waypoints;
};

publicVariable "FHQ_moveHelo";


/* --------------------------------------------------------------------------------------  */

FHQ_powerDown = 
{
	_pilot = _this select 0;
	_vehicle = _this select 1;

	waituntil {getPosATL _vehicle select 2 < 1};

	_pilot action ["engineOff", _vehicle]; 
};

publicVariable "FHQ_powerDown";


/* --------------------------------------------------------------------------------------  */

FHQ_returnToBase = 
{
    /* Create a chain of waypoints for the chopper
	 * Script called as [_logic, _helo] call FHQ_returnToBase;
     */
    _logic = _this select 0;
	_helo = _this select 1;
    _pos = _logic getVariable "FHQ_homeBase";
     
	_pilot = (crew _helo) select 0;
	_grp = group _pilot;
         
   	_wp = _grp addWaypoint [_pos, 2];
    _wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", "[FHQ_heloLogic, ""FHQ_reachBaseCb""] call FHQ_invokeCalback; (vehicle this) land ""LAND""; _null = [this, vehicle this] spawn FHQ_powerDown;"];              
};

publicVariable "FHQ_returnToBase";



/* --------------------------------------------------------------------------------------  */

FHQ_moveHeloToPlayer = 
{
    /* Call chopper (make it come to given position)
	 * Script called as [_logic, _pos] call FHQ_returnToBase;
     */
    _logic = _this select 0;
    _pos = _this select 1;
    _helo = _logic getVariable "FHQ_helo";
    
    _pilot = (crew _helo) select 0;
	_grp = group _pilot;
    
	_wp = _grp addWaypoint [_pos, 2];
	_wp setWaypointType "LOAD";
	_wp setWaypointStatements ["true", "(vehicle this) land ""GET IN"";"];

	FHQ_emptyHeliPad = "HeliHEmpty" createVehicle _pos;
	publicVariable "FHQ_emptyHeliPad";
};

publicVariable "FHQ_moveHeloToPlayer";


/* --------------------------------------------------------------------------------------  */

FHQ_executeLocal = 
{
    /* Execute second argument on the machine the first argument is local */
    _player = _this select 0;
    _code = _this select 1;
    
    FHQ_controlPlayer = _player;
    FHQ_commandExecute = _code;
	publicVariable "FHQ_commandExecute";
	
	if (local FHQ_controlPlayer) then
	{
		call FHQ_commandExecute;
	}
	else
	{
		publicVariable "FHQ_controlPlayer";
	};
};

publicVariable "FHQ_executeLocal";

/* --------------------------------------------------------------------------------------  */

FHQ_executeAll = 
{
    /* Execute second argument on all machines */
    _player = _this select 0;
    _code = _this select 1;
    
    FHQ_controlAll = _player;
    FHQ_commandExecute = _code;
	publicVariable "FHQ_commandExecute";
	
	call FHQ_commandExecute;
	publicVariable "FHQ_controAll";
};

publicVariable "FHQ_executeAll";


FHQ_invokeCalback =
{
    _logic = _this select 0;
    _callback = _this select 1;
    
    _helo = _logic getVariable "FHQ_helo";
    _pilot = driver _helo;
    _playerGroup = _logic getVariable "FHQ_playerGroup";
    
    _code = _logic getVariable _callback;
    
    [_logic, _helo, _pilot, _playerGroup] call _code; 
};

publicVariable "FHQ_invokeCalback";

/* -------------------------------------------------------------------------------------- 
 * The following functions are user callable
 * -------------------------------------------------------------------------------------- */


/*
FHQ_callHelo = 
{
    FHQ_heloLogic setVariable ["FHQ_heloIsCalled", true, true];
};

publicVariable "FHQ_callHelo";
*/

/*
FHQ_cancelHelo = 
{
    FHQ_heloLogic setVariable ["FHQ_heloIsCancelled", true, true];
};

publicVariable "FHQ_cancelHelo";
*/

FHQ_setCallback = 
{
    /* Set a callback. First parameter is logic, second the callback name, third is the code to execute */
    _logic = _this select 0;
    _name = _this select 1;
    _code = _this select 2;
    
    _varName = "FHQ_" + _name + "Cb";
    _logic setVariable [_varName, _code, true];
};

publicVariable "FHQ_setCallback";  