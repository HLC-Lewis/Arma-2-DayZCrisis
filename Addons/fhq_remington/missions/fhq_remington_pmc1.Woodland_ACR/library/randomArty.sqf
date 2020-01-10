/* This script is meant for generating random artillery impacts in a given marker's area.
 * The script is called like this:
 * ["markerName", min, max, salvoSize, rounds, [list of shell classnames], markerAlpha, code] execVM "library/randomArty.sqf";
 * 
 * markerName - name of the marker used as the shelling area. Must be rectangle/ellipse (no icon) and can be any angle
 * min, max - minimum and maximum pause between salvos
 * salvoSize - number of rounds per salvo
 * rounds - total number of rounds to be fire (-1 for infinite)
 * [list of shell classnames] - list of classnames for possible shells. One will be picked at random
 * markerAlpha - alpha value for the marker. If 0, the marker will be invisible.
 * code - code that is executed after each salvo. If it returns 0, it will end the script 
 */

if (!isServer) exitWith {};

_this spawn {
    private ["_getpointinarea", "_marker", "_minInterval", "_maxInterval", "_salvoSize", "_roundCount", 
    		"_shellList", "_code", "_pos", "_ord"];
            
    _getpointinarea = compile preprocessFileLineNumbers "library\getpointinarea.sqf";
	_marker = _this select 0;
	_minInterval = _this select 1;
	_maxInterval = _this select 2;
	_salvoSize = _this select 3;
	_roundCount = _this select 4;
    _shellList = _this select 5;

    _code = compile "";
    if (count _this > 7) then {
        _code = compile (_this select 7);
    };
      
    _marker setMarkerAlpha (_this select 6);
    
    /* Make sure we don't get started before the mission rolls */
    sleep 0.1;

	while {_roundCount != 0} do {
        /* Wait for a time between _minInterval and _maxInterval */
        sleep  _minInterval + (random ((_maxInterval - _minInterval) * 1000) / 1000);
         
        for "_i" from 1 to _salvoSize do {
            _pos = [_marker] call _getpointinarea;
            _ord = _shellList call BIS_fnc_selectRandom;
            _ord createVehicle _pos; 
            
            sleep 0.1 + (random 1000 / 10000);
            
			if (_roundCount > 0) then {
            	_roundCount = _roundCount - 1;
            };
        };
        
        if (([_roundCount] call _code) == 0) exitWith {};
    };
};
