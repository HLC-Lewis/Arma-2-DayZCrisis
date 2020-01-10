/*
 * Show a quote on screen, with the Quote in the center and author in the middle
 * 
 * _this select 0: Quote
 * _this select 1: Author of quote
 * _this select 2: (optional) time to display (default 8)
 */
 
disableSerialization;

_quote = _this select 0;
_author = _this select 1;
_duration = 8;

if (count _this > 2) then {
	_duration = _this select 2;
};

disableSerialization;

100011 cutrsc ["RscIntroDialog2", "BLACK"]; sleep 1;

_time = time;
waitUntil {
	_xxx = uinamespace getvariable "fhq_title";
	!isNil ("_xxx") || (_time + 1 > time)
};

_display = uinamespace getvariable "fhq_title";    
if (str (_display) != "no display") then 
{
    _myText = format ["<t color='#ffffff'>%1</t><br/><br/><br/><t color='#ffffff'><t font='Zeppelin33Italic'><t align='right'>%2</t></t></t>",
    	_quote, _author];
    _text = parseText  _myText;
	_cntrl = _display displayCtrl 100;
	_cntrl ctrlSetStructuredText _text;
	_cntrl ctrlCommit 0;
    sleep _duration;
};


100011 cutfadeout 0;