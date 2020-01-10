class CVPI_UnmarkedG_Patrol;
class CPD_U_DZ: CVPI_UnmarkedG_Patrol 
{
	displayname = "CPD_U_DZ";
	typicalCargo[] = {};
	class TransportMagazines{};
	class TransportWeapons{};
	transportMaxWeapons = 5;
	transportMaxMagazines = 40;
	transportmaxbackpacks = 2;
	class EventHandlers {
		init = "handel = [_this select 0,""Main""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""tail_head""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""Liberty""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""Avengers""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""tail_flash""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""Vector""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""Federals""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0,""directional""] execVM ""\American_Law_Enforcement\scripts\police_lightbar.sqf""; handel = [_this select 0] execVM ""\American_Law_Enforcement\scripts\police_sirens.sqf""";
	};
};