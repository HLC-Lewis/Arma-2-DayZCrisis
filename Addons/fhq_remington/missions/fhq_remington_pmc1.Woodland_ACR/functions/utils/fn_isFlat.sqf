/*
 * Check if a given area is (mostly) flat or not. We do this by checking
 * all four main compass direction points and the center with an object
 * for altitude above sea level.
 *
 * Idea by Rübe.
 *
 * Parameter
 * _this select 0 - position array for center of area
 * _this select 1 - radius to check
 * _this select 2 - maximum difference (optional, default 2)
 * 
 * result: 
 *    Returns true is some selected sample points are the same height,
 *    or false otherwise.
 */
 
private ["_pos", "_radius", "_min", "_max", "_temp", "_object", "_newPos","_x", "_y", "_maxSlope",
	"_result"];
 
_pos 		= _this select 0;
_radius 	= _this select 1;
_maxSlope = 2;
if (count _this > 2) then
{
	_maxSlope = _this select 2;
};
 
 _x = _pos select 0;
 _y = _pos select 1;
 
_object = createVehicle ["Baseball", [0,0,0], [], 0, "NONE"];
 _min = -1000;
 _max = 10000;
 
 {
	_newPos = [(_x select 0), (_x select 1)];
	_object setPos _newPos;
	_temp = getPosASL _object;
	if (_max < _temp) then 
	{
		_max = _temp;
	};
	if (_min > _temp) then
	{
		_min = _temp;
	};
} forEach [
	[_x, _y],
	[_x + _radius, 	_y],
	[_x, 			_y + _radius],
	[_x - _radius,	_y],
	[_x,			_y - _radius]
];

deleteVehicle _object;

server globalChat format ["_max = %1, _min = %2", _max, _min];
_result = false;
if (_min + _maxSlope < _max) then
{
	_result = true;
};

_result