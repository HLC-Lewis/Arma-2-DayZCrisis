/* Show a marker on the helo to indicate where it is
 * Parameters:
 * select 0: logic
 * select 1: String, marker type
 * select 2: boolean, show or hide marker
 */
 
_logic = _this select 0;
_type = _this select 1;
_show = _this select 2;
_helo = _logic getVariable "FHQ_helo";

if (!_show) then
{
   	_helo setVariable ["FHQ_showMarker", false, true];
}
else
{
    [_helo, _type] spawn
    {
        _helo = _this select 0;
        _type = _this select 1;
        if (_type == "") then
        {
            _type = "n_air";
            
            if (side _helo == WEST) then
            {
            	_type = "b_air";
            };
             
        	if (side _helo == EAST) then
            {
                _type = "o_air";
            };
        };
        
        _mrk = createMarker [name (driver helo) + "_marker", getPos _helo];
        _mrk setMarkerShape "ICON";
        _mrk setMarkerType _type;
        
        _helo setVariable ["FHQ_showMarker", true, true];
        while {_helo getVariable "FHQ_showMarker"} do
        {
            sleep 2.0;
            _mrk setMarkerPos (getPos _helo);
        };
        
        deleteMarker _mrk;
	};
};
     		