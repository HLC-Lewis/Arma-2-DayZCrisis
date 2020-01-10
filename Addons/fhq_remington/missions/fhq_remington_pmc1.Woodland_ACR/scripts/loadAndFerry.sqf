if (!isServer) exitWith {/* Server only code */};

//_handle = [pmcChopper1, units FHQ_playerGroup] execVM "library\waitAllIn.sqf";
//waitUntil {scriptDone _handle};

{
    waitUntil {vehicle _x == pmcChopper1};
} forEach units FHQ_playerGroup;

["taskWaitPickup", "succeeded"] call FHQ_TT_setTaskState;

_player = leader FHQ_playerGroup;

pmcPilot1 kbTell [leader FHQ_playerGroup, "speech", "pilot_brief1"];

FHQ_ferryStart = true; publicVariable "FHQ_ferryStart";

{ _x setCaptive true; } forEach (crew pmcChopper1); 

[
	FHQ_playerGroup,
    	["taskFindSUV", "Find the SUV and search for the three survivors",
	      "Search survivors", "", getPos targetCar],
        ["taskFindSuitcase", "The client was carrying a suitcase with vital data. Retrieve it so it can be returned to the client's company",
	      "Find suitcase", ""],
        ["taskExtract", "Extract via helo", "Extract", "", getMarkerPos "markExtract"] 
] call FHQ_TT_addTasks;
            
["taskFindSUV", "assigned"] call FHQ_TT_setTaskState;