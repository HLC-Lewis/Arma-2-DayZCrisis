/* Check presence of an object depending on current difficulty settings */

_object = _this select 0;
_difficulty = _this select 1;
_difficultyLevel = 0;

if (isMultiplayer) then
{
    _difficultyLevel = (paramsArray select 0);
}
else
{
    _difficultyLevel = 0;
    if (!cadetMode) then
    {
        _difficultyLevel = 1;
    };
};

if (toUpper(typename _difficulty) != "ARRAY") then
{
    /* Normal version, _difficulty is minimum level of spawning */
	if (_difficultyLevel < _difficulty) then
	{
        { if (_x != _object) then {deleteVehicle _x;};} forEach crew _object; 
		deleteVehicle _object;
	};
}
else
{
    /* _difficulty is an array, spawned when current difficulty in list */
	if (!(_difficultyLevel in _difficulty)) then
	{
        { if (_x != _object) then {deleteVehicle _x;};} forEach crew _object;
		deleteVehicle _object;
	};    
};

    	