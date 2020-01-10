disableSerialization;
/*
 * Display a fancy taskhint
 * 
 * _this select 0: Type of event (line 1)
 * _this select 1: description of event (line 2)
 * _this select 2: color to be used (hex format)
 * _this select 3: Icon to display 
 */
 
private ["_text", "_desc", "_color", "_icon", "_string"];
_text = _this select 0;
_desc = _this select 1;
_color = _this select 2;
_icon = _this select 3;



/*
 * computes an acceleration/deceleration on interval [0..1]
 */
_accelFunc = {
    private ["_argX", "_y"];
    
    _argX = _this select 0;
	if (_argX <= 0.5) then {
        _y = 2*_argX*_argX;
    };
    if (_argX > 0.5) then {
        _y = 1 - 2*(_argX-1)*(_argX-1)
   	};
    _y
};

/*
 * _this select 0: string to display
 * _this select 1: time to display
 */
_ticker = {
    
    private ["_fac", "_now", "_delay", "_rep", "_cntrl", "_text", "_emptyText", "_sleep"];
    
    _myText = _this select 0;
    _sleep = _this select 1;

	_cntrl = _display displayCtrl 100;
    _text = parseText _myText;
    _emptyText = parseText "";
	
    
    playSound ["NotifyWoosh", true];
	_cntrl ctrlSetStructuredText _text;
	_cntrl ctrlCommit 0;
   	_p = ctrlPosition _cntrl;
    
    _now = time;
    while {(time - _now) < 1} do {
        _fac = time - _now;
        _fac = [_fac] call _accelFunc;
    	_cntrl ctrlSetPosition [ (_p select 0) - 0.5*_fac, _p select 1];
    	_cntrl ctrlCommit 0;
        //sleep 0.1;
    };
      
    sleep _sleep;
    
    _now = time;
    //playSound "border_out";
    while {(time - _now) < 1} do {
        _fac = 1 - (time - _now);
        if (_fac < 0) then {_fac = 0; };
        _fac = [_fac] call _accelFunc;
    	_cntrl ctrlSetPosition [ (_p select 0) - (0.5*_fac), _p select 1];
    	_cntrl ctrlCommit 0;
        //sleep 0.1;
    };
};
waitUntil { isNil "TaskHintActive" };
TaskHintActive = 1;
100011 cutrsc ["RscTaskHintDlg", "plain"];
sleep 1;
_time = time;
waitUntil {
	_xxx = uinamespace getvariable "fhq_title";
	!isNil ("_xxx") || (_time + 1 > time)
};

_display = uinamespace getvariable "fhq_title";


_string = format ["<t color='%3'>%1<br/><t size='1.4' font='Zeppelin33Italic'>%2</t></t>", _text, _desc, _color];
[_string, 5] call _ticker;

100011 cutfadeout 0;
TaskHintActive = nil;