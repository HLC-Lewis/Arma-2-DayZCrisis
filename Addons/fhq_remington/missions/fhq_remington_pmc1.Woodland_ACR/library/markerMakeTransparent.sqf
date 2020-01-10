private  ["_i", "_pos"];

_i = 0;
_pos = getMarkerPos format["%1%2", _this, _i];


while {_pos select 0 != 0 && _pos select 1 != 0} do {
     format["%1%2", _this, _i] setMarkerAlpha 0;
     _i = _i + 1;
     _pos = getMarkerPos format["%1%2", _this, _i];
};     