disableSerialization;

private ["_screens", "_loadScreen"];
_screens = 
[
	"ca\mp_armory\armory_mp\data\images\loading_armex_1_co", 
	"ca\mp_armory\armory_mp\data\images\loading_armex_2_co", 
	"ca\mp_armory\armory_mp\data\images\loading_armex_4_co", 
	"ca\mp_armory\armory_mp\data\images\loading_armex_5_co"
];
_loadScreen = _screens select (floor (random (count _screens)));

((_this select 0) displayctrl 105) ctrlSetText _loadScreen;