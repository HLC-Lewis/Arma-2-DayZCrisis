/*
 * Scale the given 3D or 2D vector by a given scale
 *
 * Parameter
 *	_this select 0 - vector of the form [a,b] or [a,b,c]
 *  _this select 1 - scale
 * 
 * result: 
 * 	 	result 3D vector. If the input is a 2D vector, this
 *      will have the third component zeroed.
 */

private ["_vector", "_scale", "_x", "_y", "_z"];

_vector = _this select 0;
_scale = _this select 1;

_x = (_vector select 0) * _scale;
_y = (_vector select 1) * _scale;
_z = 0;
if (count _vector == 3) then
{
	_z = (_vector select 2) * _scale;
};

[_x, _y, _z]