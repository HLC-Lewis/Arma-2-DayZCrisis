/*
 * Create a unit vector from a given compass direction
 *
 * Parameter
 *	_this select 0 - direction
 * 
 * result: 
 * 	 	result 3D unit vector pointing in the given direction
 */
 
 private ["_dir", "_vector"];
 
 _dir = _this select 0;
 
 _vector = [sin(_dir), cos(_dir), 0];
 
 _vector