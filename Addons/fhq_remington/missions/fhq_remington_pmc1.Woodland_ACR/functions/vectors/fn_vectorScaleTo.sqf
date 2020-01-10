/*
 * Scale the given 3D or 2D vector to a given length
 *
 * Parameter
 *	_this select 0 - vector of the form [a,b] or [a,b,c]
 *  _this select 1 - target size
 * 
 * result: 
 * 	 	result 3D vector. If the input is a 2D vector, this
 *      will have the third component zeroed.
 */

private ["_vector", "_length", "_factor", "_result"];

_vector = _this select 0;
_length = _this select 1;

_factor = _length / (_vector call BIS_fnc_magnitude);

/* TODO:
   Hm, not sure whether we'd need that extra variable. Shouldn't
   
   [_vector, _factor] call FHQ_fnc_vectorScale;
   
   be enough? Dunno.
*/

_result = [_vector, _factor] call FHQ_fnc_vectorScale;
_result