/*
 *
 * 		_this select 0 - Line 1 of text
 * 		_this select 1 - Line 2 of text
 * 		_this select 2 - Line 3 of text
 * 		_this select 3 - Line 4 of text
 *  	_this select 4 - [optional] delay between letters (default 0.005)
 * 		_this select 5 - [optional] delay between lines (default 0.3)
 * 		_this select 6 - [optional] time until fadeout (default 6)
 *      _this select 7 - [optional] if present, line number of a continously updated timer
 */
 

private ["_delay", "_lineDelay", "_fadeOut", "_timerLine", "_control", "_cursor", "_lastTime", 
	"_line1", "_line2", "_line3", "_line4", "_timePrefix", "_formatNumber", "_formatTime",
	"_updateTimeLine", "_strLen", "_strRep", "_strLeft", "_ticker", "_display", "_now"];

_line1 = _this select 0;
_line2 = _this select 1;
_line3 = _this select 2;
_line4 = _this select 3;

_timePrefix = "";

_delay = 0.005;
if (count _this > 4) then
{
	_delay = _this select 4;
};

_lineDelay = 0.3;
if (count _this > 5) then
{
	_lineDelay = _this select 5;
};

_fadeOut = 6;
if (count _this > 6) then
{
	_fadeOut = _this select 6;
};

_timerLine = -1;
if (count _this > 7) then
{
	_timerLine = _this select 7;
	_timePrefix = _this select (_timerLine - 1);
};

// ----------------------------------------------------------------------------------------------
// SUBROUTINES
// ----------------------------------------------------------------------------------------------

// Format a number with a leading zero if needed
// call as [number] call _formatNumber
_formatNumber = {
	private ["_res"];
	if (_this select 0 < 10) then
	{
		_res = format ["0%1", _this select 0];
	}
	else
	{
		_res = format ["%1", _this select 0];
	};
	
	_res
};

// Format the current time to HH:MM:SS
_formatTime = {
	private ["_dateStamp", "_text", "_num", "_time"];
	
	_text = "";
	_dateStamp = date;
	
	_text = [_dateStamp select 3] call _formatNumber;
	
	_num = [_dateStamp select 4] call _formatNumber;
	_text = _text + ":" + _num + ":";
	_time = (floor time) mod 60;
	_num =  [_time] call _formatNumber;
	_text = _timePrefix + _text + _num;
	_text
};

// Update the time line's text
_updateTimeLine = {
	private ["_time", "_control"];
	_time = [] call _formatTime;
	_control = _display displayCtrl 180 + _timerLine;
	
	_control ctrlSetText _time;
	_control ctrlCommit 0;
};

// Get the length of a string
// call as [string} call _strLen:
_strLen = {
	private ["_res"];
	
	_res = count toarray (_this select 0);
	
	_res;
};

// Create a string with n spaces
// call as [n] call _strRep;
_strRep = {
	private ["_res", "_i"];
	_res = "";
	for [{_i=0},{_i < _this select 0},{_i = _i + 1}] do
	{
		_res = _res + " ";
	};
	_res;
};

// Get a prefix of n characters off a string
// call with [string, n] call _strLeft;
_strLeft = {
	private ["_prefix", "_array", "_n", "_i", "_len"];
	_array = toarray (_this select 0);
	_n = _this select 1;
	_len = count _array;
	if (_len < _n) then
	{
		_n = len; 
	};
	_prefix = "";
	for [{_i=0}, {_i < _n}, {_i = _i + 1}] do
	{
		_prefix = _prefix + tostring [_array select _i];
	};
	_prefix;
};

// Ticker-tape a given line of text
// Call with [control #, text, line number, timer line]
_ticker = {
	private ["_control", "_text", "_lineNo", "_timerLine", "_len", "_i", "_tmp"];
	_control 	= _this select 0;
	_text    	= _this select 1;
	_lineNo  	= _this select 2;
	_timerLine  = _this select 3;
	
	sleep _lineDelay;
	
	if (_timerLine == _lineNo) then
	{
		_text = [] call _formatTime;
	};
	
	_len = [_text] call _strLen;
	
	for [{_i = 1}, {_i < _len}, {_i = _i + 1}] do
	{
		_tmp = [_text, _i] call _strLeft;
		playsound "counter";
		_control ctrlSetText _tmp + "_";
		_control ctrlCommit 0;
		sleep _delay;
		if (_timerLine < _lineNo and _timerLine != -1) then
		{
			[] call _updateTimeLine;
		};
		if (_timerLine == _lineNo) then
		{
			_text = [] call _formatTime;
		};
	};
	
	_control ctrlSetText _text;	
	_control ctrlCommit 0;
};

// ----------------------------------------------------------------------------------------------

disableSerialization;
/*
// Make sure we don't have another one running
_display = uinamespace getvariable "fhq_title";
if (!isNil ("_display")) then
{
	if (_display != "no display") exitWith {};
};*/

100011 cutrsc ["RscFHQTitle", "plain"];

// Adjust the controls for the interface size
_display = uinamespace getvariable "fhq_title";
{
	_control = _display displayCtrl _x;
	_control ctrlSetPosition [
		((ctrlPosition _control select 0)) + safeZoneX, 
		//(safeZoneH/2) - (_forEachIndex * 0.06),
		0.3 - (_forEachIndex * 0.06),
		(ctrlPosition _control select 2), 
		(ctrlPosition _control select 3)];

	_control ctrlCommit 0
}
forEach [185, 184,183, 182, 181];

// Display phase, ticker the text on screen
_control = _display displayCtrl 181;
[_control, _line1, 1, _timerLine] call _ticker;
_control = _display displayCtrl 182;
[_control, _line2, 2, _timerLine] call _ticker;
_control = _display displayCtrl 183;
[_control, _line3, 3, _timerLine] call _ticker;
_control = _display displayCtrl 184;
[_control, _line4, 4, _timerLine] call _ticker;

// Blinking phase.
_now = time;
_control = _display displayCtrl 185;
_cursor = "_";
_lastTime = _now;
while {_now + _fadeOut > time} do
{
	if (_lastTime + 0.5 < time) then
	{
		_lastTime = time;
		_control ctrlSetText _cursor;
		_control ctrlCommit 0;
		if (_cursor == "_") then
		{
			_cursor = " ";
			playsound "counter";
		}
		else
		{
			_cursor = "_";
		};
	};
	if (_timerLine != -1) then
	{
		[] call _updateTimeLine;
	};
	sleep 0.01;
};
// Delete the cursor after we're done
_control ctrlSetText " ";
_control ctrlCommit 0;

// Clear phase. Have the cursor overwrite the text

{
	_control = _display displayCtrl _x;
	_control ctrlSetText "";
	playsound "counter";
	sleep 0.01;
} forEach [181,182,183,184];

// Fade out
100011 cutfadeout 0;