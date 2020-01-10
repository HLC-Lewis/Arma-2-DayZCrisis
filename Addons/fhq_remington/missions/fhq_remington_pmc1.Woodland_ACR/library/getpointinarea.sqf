/* This script generates a random location inside a given marker. The marker
 * can have any form (rectangle, ellipse) and can be tilted.
 */

private ["_tX", "_tY", "_size", "_marker", "_pos", "_dir", "_shape", "_x", "_y", "_dist", "_phi"];

_marker = _this select 0;

_size = getMarkerSize _marker;
_pos = getMarkerPos _marker;
_dir = markerDir _marker;
_shape = markerShape _marker;

_x = 0;
_y = 0;

if (_shape == "RECTANGLE") then {
    _tX = 1.0 - ((random 20000) / 10000.0);
	_tY = 1.0 - ((random 20000) / 10000.0); 
	/* Calculate the actual coordinates. */
    _x = (_pos select 0) + (((_tX * (_size select 0)) * cos(-_dir)) - ((_tY * (_size select 1)) * sin(-_dir)));
    _y = (_pos select 1) + (((_tX * (_size select 0)) * sin(-_dir)) + ((_tY * (_size select 1)) * cos(-_dir)));
} else {
    _dist = (random 10000) / 10000.0 + (random 10000) / 10000.0;
    _phi = (random 36000) / 100.0;
    if (_dist > 1.0) then {_dist = 2.0 - _dist};
    _tX = (_dist * (_size select 0)) * sin(_phi);
    _ty = (_dist * (_size select 1)) * cos(_phi);
    _x = (_pos select 0) + (_tX * cos(-_dir)) - (_tY * sin(-_dir));
    _y = (_pos select 1) + (_tX * sin(-_dir)) + (_tY * cos(-_dir));
};

/* DEBUG */
//_dbg = createMarker [format["debug%1%2", _x, _y], [_x, _y, 0]];
//_dbg setMarkerShape "ICON";
//_dbg setMarkerType "waypoint";
//_dbg setMarkerSize [0.5, 0.5];

[_x, _y, 0]