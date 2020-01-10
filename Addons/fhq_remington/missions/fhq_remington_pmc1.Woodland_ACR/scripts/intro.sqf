if (isDedicated) exitWith {};

[] spawn 
{
//	waitUntil {!(isNil "BIS_fnc_init")};
    waitUntil {!(isNil "FHQ_preload_complete")};
    
	cutText ["", "BLACK FADED", 999];
//	_handle = ["...the Helicopter is a highly complex and remarkable machine which has become an indispensable means of transport and has proved invaluable in both civil and military contexts, as well as for para-military tasks such as policing, air-ambulance work and traffic control.", "Giorgio Apostolo"] execVM "library\quote.sqf";
//	waitUntil {scriptDone _handle};


	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 3;  
	cutText ["", "BLACK IN", 5];
	2 fadeSound 1;
	sleep 2;


	100012 cutRsc ["FHQ_Logo2", "PLAIN", 0.01];
	playSound ["PMC_ElectricBlast1", true];
	sleep 0.1;
	100012 cutRsc ["FHQ_Logo", "PLAIN"];//, 0.01];

	 _dateString = date call FHQ_fnc_date2String;
	 _timeString = [daytime, "", ""] call FHQ_fnc_time2FuzzyString;
     
	["""Just another boring day""",
 	"Bystricia",
	"ComCo Operatives Group Guardian",
	_dateString + " - " + _timeString, 8]	execVM "library\ticker.sqf";
     
	sleep 5;
	100012 cutRsc ["FHQ_Logo2", "PLAIN", 0.01];
	playSound ["PMC_ElectricBlast2", true];
	100012 cutfadeout 0;
	sleep 3;
};