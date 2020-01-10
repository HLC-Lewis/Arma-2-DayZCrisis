/* create random air traffic
 * Parameters are
 * [ _minTime, _maxTime, _minAlt, _maxAlt, [_vehicleList], _playerGroup, _spawnDistance]
 */
 
if (!isServer) exitWith {};

FHQ_RAT_deleteVehicle =
{
	_vehicle = vehicle _this;
    
	{
        deleteVehicle _x;
    } forEach crew _vehicle;
    
    deleteVehicle _vehicle;
};


_this spawn
{
	_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_centerPos set [2, 0];
    _maxX = (_centerPos select 0) * 2;
    _maxY = (_centerPos select 1) * 2;
    
    _minTime = _this select 0;
    _maxTime = _this select 1;
    _minAlt = _this select 2;
    _maxAlt = _this select 3;
    _vehicleList = _this select 4;
    _playerGroup = _this select 5;
    _spawnDistance = _this select 6;
    
    while {true} do
    {
        _timeout = _minTime + random (_maxTime - _minTime);
        sleep _timeout;
        
        _vehicleSpawn = _vehicleList call BIS_fnc_selectRandom;
        
        _refDir = random 360;
        _moveDir = ((_refDir - 45) + random 90) - 180;
        _refPos = getPos leader _playerGroup;
        _startPos = [_refPos, _spawnDistance, _refDir] call BIS_fnc_relPos;
        _targetPos  = [_refPos, _spawnDistance, _moveDir] call BIS_fnc_relPos;
        _altitude = _minAlt + random (_maxAlt - _minAlt);
        
        _startPos set [2, _altitude];
        _targetPos set [2, _altitude];
        
        _vehicleVec = [_startPos, _moveDir, _vehicleSpawn, civilian] call BIS_fnc_spawnVehicle;
        
        _grp = _vehicleVec select 2;
        _vehicle = _vehicleVec select 0;
        
        (driver _vehicle) disableAI "TARGET";
        (driver _vehicle) disableAI "AUTOTARGET";
        (driver _vehicle) disableAI "FSM";
        _vehicle flyInHeight _altitude;

         
        _wp = _grp addWaypoint [_targetPos, 1];
		_wp setWaypointType "MOVE";
        _wp setWaypointSpeed "NORMAL";
        _wp setWaypointBehaviour "CARELESS";
        _wp setWaypointCombatMode "BLUE";
		_wp setWaypointStatements ["true", "this call FHQ_RAT_deleteVehicle"];   
          
/*        player sideChat format["(DEBUG) Spawning %1 (start = %2, end = %3, refDir = %4, targetDir = %5)",
        	 _vehicleSpawn, _startPos, _targetPos, _refDir, _moveDir];
		[_vehicle, _startPos, _targetPos] spawn 
        {
           	_vehicle = _this select 0;
            _startPos = _this select 1;
            _endPos = _this select 2;
            
            _startMark = createMarker [name driver _vehicle + "start", _startPos];
            _startMark setMarkerShape "ICON";
            _startMark setMarkerType "Start";

            _endMark = createMarker [name driver _vehicle + "end", _endPos];
            _endMark setMarkerShape "ICON";
            _endMark setMarkerType "End";
                        
            _marker = createMarker [name driver _vehicle, getPos _vehicle];
            _marker setMarkerShape "ICON";
            _marker setMarkerType "Dot";
            
            while {alive _vehicle} do
            {
                sleep 1;
                _marker setMarkerPos getPos _vehicle;
            };
            
            deleteMarker _marker;
            deleteMarker _startMark;
            deleteMarker _endMark;
        };*/
		

    };
};