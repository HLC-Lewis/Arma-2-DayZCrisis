/*
 * Create a HTML ticker
 * 
 * _this select 0 .. _this select n :  strings per line
 * _this select n+1 (optional) : time to show the ticker (default 5 seconds)
 * 
 */ 
 
_textStrings = [];

for [{_i = 0}, {_i < count _this and typeName (_this select _i) == typeName "" }, {_i = _i + 1}] do {
    _textStrings = _textStrings + [format ["<t color='#ffffff'>%1</t>", _this select _i]];
};
 
_timeToDisplay = 5;
if (count _this > count _textStrings) then {
    _timeToDisplay = _this select (count _textStrings);
};

if (count _textStrings == 0) exitWith {};

disableSerialization;

100011 cutrsc ["RscIntroDialog", "plain"];

_time = time;
waitUntil {
	_xxx = uinamespace getvariable "fhq_title";
	!isNil ("_xxx") || (_time + 1 > time)
};

_display = uinamespace getvariable "fhq_title";
_line = 0;

_myText = "";

if (str (_display) != "no display") then 
{	
	_crs = 0;
    _time = time + _timeToDisplay;

	while {time < _time} do {
        _crs = 1 - _crs;
        _cursor = " ";
        if (_crs == 1) then {
            _cursor = "<t color='#ffff00'>_</t>";
        };
        if (_line < count _textStrings) then {
           	_myText = _myText + "<br/>";
            _myText = _myText + (_textStrings select _line);
            playSound "beep"; //"ClickNoise2";
            _line = _line + 1;
        } else {
          	sleep 0.2;
        };
		_text = parseText format ["%1<br/>%2", _myText, _cursor];
		_cntrl = _display displayCtrl 100;
		_cntrl ctrlSetStructuredText _text;
		_cntrl ctrlCommit 0;
        sleep 0.05;
        _timesToDisplay = _timesToDisplay + 1;
	};
    _eraseLine = 0;
    while {_eraseLine < _line} do {
        _myText = "";
        for [{_i = 0}, {_i < _line}, {_i = _i + 1}] do {
            if (_i < _eraseLine) then {
                _myText = _myText + " <br/>";
            } else {
                _myText = _myText + (_textStrings select _i) + "<br/>";
            };
        };
        _text = parseText  _myText;
		_cntrl = _display displayCtrl 100;
		_cntrl ctrlSetStructuredText _text;
		_cntrl ctrlCommit 0;
	    sleep 0.05;
        playSound "beep"; //"ClickNoise2";
        _eraseLine = _eraseLine + 1;
    };
    
	
};

100011 cutfadeout 0;