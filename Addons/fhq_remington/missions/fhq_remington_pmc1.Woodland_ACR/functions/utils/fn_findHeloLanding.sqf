/*
 * Find a place for a helicopter insertion/extraction.
 *
 * Parameter
 * _this select 0 - position array for center of search
 * _this select 1 - radius to search in
 * 
 * result: 
 *    position array with coordinates for a helicopter landing, or nil
 *    if no suitable position was found within the area
 */
 
 private ["_pos", "_rad", "_newPos", "_found", "_isFlat", "_retry"];
 
 _pos = _this select 0;
 _rad = _this select 1;
 _found = False;
 _retry = 400;
 
 while {(not _found) and (_retry > 0)} do
 {
 
	_newPos = [_pos, random (_rad), random(360)] call BIS_fnc_relPos;
//
//	_mrk = createMarker [format ["mark%1", _retry], _newPos];
//	_mrk setMarkerShape "ICON";
//	_mrk setMarkerType "mil_dot";
//
	_isFlat = _newPos isFlatEmpty [30, 1, 0.4, 25, 0, False, objNull];
	if (count _isFlat > 0) then 
	{
		_found = True;
	}
	else
	{
		_retry = _retry - 1;
	};

};

if (_retry == 0) then
{
	_newPos = nil;
};

_newPos