/* Set a callback. First parameter is logic, second the callback name, third is the code to execute */
_logic = _this select 0;
_name = _this select 1;
_code = _this select 2;
    
_varName = "FHQ_" + _name + "Cb";
_logic setVariable [_varName, _code, true];