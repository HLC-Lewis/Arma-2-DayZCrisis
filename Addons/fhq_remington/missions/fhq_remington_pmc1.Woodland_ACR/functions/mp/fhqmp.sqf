#define EXTENSIONS_162
/* Events:
 * 
 * The FHQ MP framework is similar to CBA without the need for an addon.
 * Like in CBA, events are defined by name with a piece of code that is
 * executed when the event is raised. Events can be raised either locally,
 * globally on all attached machines, on all "other" machines, or on 
 * selected machines. Selected in this context means machines that fulfil a
 * certain constraint. This can be locality of an object, side of the player
 * on that machine, or group membership.
 * 
 * Events must be defined on the machine that they can be raised on. That means
 * that if a machine does not have the code for a certain event, the event 
 * will not execute on that machine, and no error is reported.
 * 
 * Events are defined by calling FHQ_MP_addEvent, and removed by FHQ_MP_remEvent 
 * (see the documentations of those functions for more information).
 * 
 * Raising an event is done by calling the following functions (most functions mirror
 * the name of the CBA functions):
 * - FHQ_MP_localEvent: The event is only invoked on this machine
 * - FHQ_MP_globalEvent: The event is invoked on all machines (including this one)
 * - FHQ_MP_remoteEvent: The event is invoked on all machines but the caller
 * - FHQ_MP_specificEvent: The event is invoked on the machine where the given object
 *            is local. 
 * 
 * The last function can be used to minimize network traffic. If the object is local to
 * the caller, it will not propagate. Likewise, even if it will propagate, the locality
 * check is made before the (costly) event string matching, limiting script overhead
 * on non-affected clients
 *
 * See the documentation of the individual functions for more information.   
 * 
 */

//#define FHQ_MP_DEBUG

#ifdef FHQ_MP_DEBUG
#define DEBUG(x) x
#define DEBUG_LOG(x)  player sideChat (x);
#else
#define DEBUG(x)
#define DEBUG_LOG(x)
#endif

/* FHQ_MP_init: Initialize the FHQ_MP framework.
 * 
 * This is called at the end of this file and has to run on all clients and the server
 * by executing the fhqmp.sqf script file:
 * call preprocessFileLineNumbers "fhqmp.sqf";
 * 
 * To wait for it to finish execution, wait for FHQ_MP_InitDone to become not NIL: 
 * 
 * waitUntil {!(isNil "FHQ_MP_InitDone")};
 * 
 * Usage:
 * 	call FHQ_MP_init
 * 
 * Parameters:
 *  None  
 * 
 * Results:
 * 	None
 * 
 * Optional behavior can be set through the description.ext:
 * 	class Options
 *  {
 *		options[] = {"FHQ_MP_OneEvent"};
 *	};
 *	
 * 	Possible values:
 *		FHQ_MP_OneEvent: Only the first matching event is executed, subsequent event
 *                       handlers of the same name are not executed. 
 */
FHQ_MP_init =
{
    private ["_count", "_i", "_handler", "_code", "_pname", "_pval", "_grp", "_options"];
    
    if (!(isNil "FHQ_MP_InitDone")) exitWith {DEBUG_LOG("Already initialized") };

	DEBUG_LOG("FHQ_MP_Init");
    
	if (isServer) then
	{
    	if (isDedicated) then
    	{
    		DEBUG_LOG("dedicated server")
   		}
   		else
   		{
	        DEBUG_LOG("hosted server")
       		DEBUG_LOG(format["player is %1", player])
   		};
	}
	else
	{
		DEBUG_LOG("client")
		if (isNull player) then
		{
			DEBUG_LOG("JIP player")
		}
		else
		{
			DEBUG_LOG(format["player is %1", player])
		};
	};

	/* Create the tracker object */
	if (isServer) then
    {
 		_grp = createGroup sideLogic; 
        FHQ_MP_Tracker = _grp createUnit ["Logic", [0,0,0], [], 0, "NONE"];
 
        if (isNull FHQ_MP_Tracker) then
        {
            DEBUG_LOG("Can't create tracker");
        };
        
        publicVariable "FHQ_MP_Tracker";
    };
	
    /* Should make this a hash table later */
    FHQ_MP_eventHandlers = [];
    FHQ_MP_eventHandlersCode = [];
    FHQ_MP_JIPHandlerList = [];
    
    /* Default options */
	FHQ_MP_OneEvent = false;

	_count =  count (missionConfigFile >> "FHQ_MultiplayerFramework" >> "Events");
	for [ {_i = 0}, {_i < _count }, {_i = _i + 1} ] do
	{
   		_handler =  configName ((missionConfigFile >> "FHQ_MultiplayerFramework" >> "Events") select _i);
        _code = getText (missionConfigFile >> "FHQ_MultiplayerFramework" >> "Events" >> _handler >> "Code");
        
        [_handler, compile _code] call FHQ_MP_addEvent;
    };
    
    /* Parse options */
    _options = getArray (missionConfigFile >> "FHQ_MultiplayerFramework" >> "Options" >> "Options");
    {
    	switch (tolower(_x)) do
        {
            case "fhq_mp_oneevent":
            {
                FHQ_MP_OneEvent = true;
            };
        };
    } foreach _options;
    
    /* Create default JIP event list */
    _options = getArray (missionConfigFile >> "FHQ_MultiplayerFramework" >> "JoinEvents" >> "Events");
    {
		FHQ_MP_JIPHandlerList = FHQ_MP_JIPHandlerList + [_x];
   	} forEach _options;
    
	if (isMultiplayer) then
	{
	    // Process parameters
	 	for [ {_i = 0}, {_i < count (paramsArray) }, {_i = _i + 1} ] do
	 	{
		  	_pname = configName ((missionConfigFile >> "Params") select _i);
		  	_pval  = paramsArray select _i;
  
	 	 	call compile format ["%1 = %2; publicVariable ""%1"";", _pname, _pval];
 		};    
	}
    else
    {
        // Read defaults
        _count = count (missionConfigFile >> "Params");
        for [ {_i = 0}, {_i < _count }, {_i = _i + 1} ] do
        {
//            _pname = configName ((missionConfigFile >> "Params") select _i);
//            _pval = getText (missionConfigFile >> "Params" >> _pname >> "default");
//            call compile format ["%1 = %2; publicVariable ""%1"";", _pname, _pval];
        };
    };
        
    /* Add variable handler */
    "FHQ_MP_BroadcastVar" addPublicVariableEventHandler {(_this select 1) call FHQ_MP_eventHandler;};
    "FHQ_MP_BroadcastVarSpecific" addPublicVariableEventHandler {(_this select 1) call FHQ_MP_eventHandlerSpecific;};


    /* Check if the player is a join in progress player and raise the events if it is */
    if (!isServer && (isNil {player} || isNull player)) then
    {
        [] spawn
        {
            waitUntil {!isNil {player}};
            waitUntil {!isNull player};
            
            _count = count FHQ_MP_JIPHandlerList;
            for [ {_i = 0}, {_i < _count }, {_i = _i + 1} ] do
           	{
	           	[FHQ_MP_JIPHandlerList select _i, [player, true]] call FHQ_MP_localEvent;
           	};          
        };
    }
    else
    {
        /* Player joins on local server, or remote client without jip */
        if (!isDedicated) then
        {
            _count = count FHQ_MP_JIPHandlerList;
            for [ {_i = 0}, {_i < _count }, {_i = _i + 1} ] do
           	{
	           	[FHQ_MP_JIPHandlerList select _i, [player, false]] call FHQ_MP_localEvent;
           	};              
        };
    };
              
            
    FHQ_MP_InitDone = true;
};

/* FHQ_MP_addEvent: Add an event handler
 * 
 * This function registers the given code with the event name. Note that
 * this event will only be registerd on the machine this function is called on.
 * If you need to register it on other (all) machine, they must register an event
 * handler with the same name.
 * 
 * Usage:
 *	_handle = [_name, _code] call FHQ_MP_addEvent;
 * 
 * Parameters:
 *  _name (string): Name of the handler
 *  _code (code): Code to be executed when this event is triggered.
 * 
 * Result:
 *	_handle (number): A handle which can be used to remove the event.
 *                    Note that this might or might not be an ascending
 *                    number. Do not try to interpret this value in any way.
 */

FHQ_MP_addEvent = 
{
    private ["_name", "_code", "_count", "_idx", "_i"];
    
    _name = _this select 0;
    _code = _this select 1;
    
    _count = count FHQ_MP_eventHandlers;
    _idx = _count;
    
    
    for [ {_i = 0}, {_i < _count}, { _i = _i + 1 } ] do
    {
        if (FHQ_MP_eventHandlers select _i == "") exitWith { _idx = _i; };
    };
    
    FHQ_MP_eventHandlers set [_idx, _name];
    FHQ_MP_eventHandlersCode set [_idx, _code];
    
    _idx;
};


/* FHQ_MP_remEvent: Remove an event given by handle
 * 
 * This function removes the handler with the given handle.
 * 
 * Usage:
 * 	[_handle] call FHQ_MP_remEvent
 * 
 * Parameters:
 *	_handle (Number): The return value you got from FHQ_MP_addHandler
 * 
 * Result:
 * 	None
 */

FHQ_MP_remEvent = 
{
    private ["_rem"];
    
    _rem = _this select 0;
    if (_rem < count FHQ_MP_eventHandlers) then
    {
        FHQ_MP_eventHandlers set [_rem, ""];
    };
};


FHQ_MP_eventHandler = 
{
	private ["_eventName", "_parameters", "_count"];
    
   	_eventName = _this select 0;
    _parameters = [];
    
	if (count _this > 1) then 
    {
        _parameters = _this select 1;
    };
   
	_count = count FHQ_MP_EventHandlers;
   	for [ {_i = 0}, {_i < _count}, { _i = _i + 1 } ] do
   	{
   		if ((FHQ_MP_eventHandlers select _i) == _eventName) then
        {
            _parameters spawn (FHQ_MP_eventHandlersCode select _i);
            if (FHQ_MP_OneEvent) exitWith {};
        };
    };
};

FHQ_MP_eventHandlerSpecific = 
{
	private ["_eventName", "_object", "_parameters", "_count"];
    
    _eventName = _this select 0;
    _object = _this select 1;
    _parameters = _this select 2;
    
    if (local _object) then
	{
        _count = count FHQ_MP_EventHandlers;
   		for [ {_i = 0}, {_i < _count}, { _i = _i + 1 } ] do
   		{
        	if ((FHQ_MP_eventHandlers select _i) == _eventName) then
        	{
	            _parameters spawn (FHQ_MP_eventHandlersCode select _i);
				if (FHQ_MP_OneEvent) exitWith {};
    	    };
    	};
    };
};


/* FHQ_MP_localEvent: raise an event on the local machine
 * 
 * This will cause the event handler to be executed on the local machine only.
 * 
 * Usage:
 * 	[_eventName, _eventParameters] call FHQ_MP_localEvent;
 *  
 * Parameters:
 * 	_eventName (string): Name of the event
 * 	_eventParameters (any): Parameters passed to the event handler
 * 
 * Result:
 * 	None
 * 
 * Example:
 * 	["endMission", ["Mission Accomplished", "END1"]] call FHQ_MP_localEvent;
 */
 
FHQ_MP_localEvent =
{
	_this call FHQ_MP_eventHandler;
};

/* FHQ_MP_remoteEvent: raise an event on the all other machines (not this one)
 * 
 * This will cause the event handler to be executed on all but the local machine.
 * 
 * Usage:
 * 	[_eventName, _eventParameters] call FHQ_MP_remoteEvent;
 *  
 * Parameters:
 * 	_eventName (string): Name of the event
 * 	_eventParameters (any): Parameters passed to the event handler
 * 
 * Result:
 * 	None
 * 
 */
 
FHQ_MP_remoteEvent =
{
	FHQ_MP_BroadcastVar = _this;
    publicVariable "FHQ_MP_BroadcastVar";
};


/* FHQ_MP_globalEvent: raise an event on the all machines (including this one)
 * 
 * This will cause the event handler to be executed on all machines, including the local one.
 * 
 * Usage:
 * 	[_eventName, _eventParameters] call FHQ_MP_remoteEvent;
 *  
 * Parameters:
 * 	_eventName (string): Name of the event
 * 	_eventParameters (any): Parameters passed to the event handler
 * 
 * Result:
 * 	None
 * 
 */
 
FHQ_MP_globalEvent =
{
    _this call FHQ_MP_eventHandler;
	FHQ_MP_BroadcastVar = _this;
    publicVariable "FHQ_MP_BroadcastVar";
};


/* FHQ_MP_specificEvent: raise an event on the machine the given object is local
 * 
 * This will cause the event handler to be executed only on the machine where the given
 * reference object is local.
 * 
 * Usage:
 * 	[_eventName, _object, _eventParameters] call FHQ_MP_specificEvent;
 *  
 * Parameters:
 * 	_eventName (string): Name of the event
 * 	_object (object): An object
 * 	_eventParameters (any): Parameters passed to the event handler
 * 
 * Result:
 * 	None
 * 
 */
 
FHQ_MP_specificEvent =
{
    if (local (_this select 1)) then
    {
    	_this call FHQ_MP_eventHandlerSpecific;
    }
    else
    {
		FHQ_MP_BroadcastVarSpecific = _this;
    	publicVariable "FHQ_MP_BroadcastVarSpecific";
    };
};


/* FHQ_MP_addJoinEvents: Make existing events a join event.
 * 
 * This function add already declared events to the list of events executed on players joining.
 * The events are only executed for new joining players, already existing players will not receive
 * the,.
 * 
 * Usage:
 * 	[_eventName(s)] call FHQ_MP_addJoinEvents;
 * Result:
 *	None
 * Example:
 *  ["setTasks", "setBriefing", "setWeather"] call FHQ_MP_addJoinEvents
 */
FHQ_MP_addJoinEvents = 
{
   	FHQ_MP_JIPHandlerList = FHQ_MP_JIPHandlerList + _this
};

/* FHQ_MP_removeJoinEvents: Remove join events from the join event list
 * 
 * This function removes events from the list of events executed on players joining.
 * 
 * Usage:
 * 	[_eventName(s)] call FHQ_MP_removeJoinEvents;
 * Result:
 *	None
 * Example:
 *  ["setTasks", "setWeather"] call FHQ_MP_removeJoinEvents
 */
FHQ_MP_removeJoinEvents = 
{
  	FHQ_MP_JIPHandlerList = FHQ_MP_JIPHandlerList - _this;
};


#ifdef EXTENSIONS_162
/* FHQ_MP_serverEvent: raise an event on the serer only.
 * 
 * This will cause the event handler to be executed on the server machine only
 * 
 * Usage:
 * 	[_eventName, _eventParameters] call FHQ_MP_serverEvent;
 *  
 * Parameters:
 * 	_eventName (string): Name of the event
 * 	_eventParameters (any): Parameters passed to the event handler
 * 
 * Result:
 * 	None
 * 
 */
 
FHQ_MP_serverEvent =
{
    if (isServer) then {
    	_this call FHQ_MP_eventHandler;
    } else {
		FHQ_MP_BroadcastVar = _this;
    	publicVariableServer "FHQ_MP_BroadcastVar";
    };
};


/* FHQ_MP_clientEvent: raise an event on a specific client
 * 
 * This will cause the event handler to be executed only on the client given by _clientId
 * 
 * Usage:
 * 	[_eventName, _clientId, _eventParameters] call FHQ_MP_specificEvent;
 *  
 * Parameters:
 * 	_eventName (string): Name of the event
 * 	_clientId (number): Id of the client
 * 	_eventParameters (any): Parameters passed to the event handler
 * 
 * Result:
 * 	None
 * 
 */
 
FHQ_MP_clientEvent =
{
	private ["_name", "_params"];
    
	_name = _this select 0;
	_params = [];
        
	if (count _this > 1) then {
		_params = _this select 2;
	};
 
    if (!isDedicated && (owner player == _this select 1)) then
    {       
    	[_name, _params]  call FHQ_MP_eventHandler;
    }
    else
    {
		FHQ_MP_BroadcastVar = [_name, _params];
    	publicVariable "FHQ_MP_BroadcastVar";
    };
};

#endif

/* ------------ End of file, calling init ------------ */
call FHQ_MP_Init;