_position = _this select 1;
_logic = _this select 0;
[_position, _logic, "load"] call FHQ_addWaypoint;
_logic setVariable ["FHQ_readyToMove", true, true];