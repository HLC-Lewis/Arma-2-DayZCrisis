_x = _this select 0;
_y = _this select 1;
_type = "waypoint";
_scale = 0.5;

if (count _this > 2) then {
	_type = _this select 2;
};

if (count _this > 3) then {
    _scale = _this select 3;
};

_dbg = createMarker [format["debug%1%2", _x, _y], [_x, _y, 0]];
_dbg setMarkerShape "ICON";
_dbg setMarkerType _type;
_dbg setMarkerSize [_scale, _scale];

_dbg;