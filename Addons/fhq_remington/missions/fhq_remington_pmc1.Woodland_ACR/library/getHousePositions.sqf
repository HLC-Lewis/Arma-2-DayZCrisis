private ["_buidling", "_list", "_pos", "_i"];

_building = _this select 0;
_list = [];
_i = 0;

while {true} do {
	_pos = _building buildingpos _i;
            
	// Assume zero x/y means no position #_i present
	if (((_pos select 0) == 0) && ((_pos select 1) == 0)) exitWith {}; 

	_list = _list + [_pos]; 
	_i = _i + 1;
};

_list;