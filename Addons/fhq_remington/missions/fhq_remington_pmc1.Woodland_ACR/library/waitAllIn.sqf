/* Wait until all units are in a vehicle.
 * called like
 * [westHelo1, units FHQ_playerGroup] execVM "scrips\waitAllIn.sqf";
 */
 
_vehicle = _this select 0;
_group = _this select 1;

waitUntil {
    ({alive _x} count _group) 
    ==
    ({_x in _vehicle} count _group)
};