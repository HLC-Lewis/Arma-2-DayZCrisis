FHQ_ferryEnd = true; publicVariable "FHQ_ferryEnd";

hint "debug 1";

["taskWaitPickup", "canceled"] call FHQ_TT_setTaskState;

[
	FHQ_playerGroup,
    	["taskFindSUV", "Find the SUV and search for the three survivors",
	      "Search survivors", "", getPos targetCar],
        ["taskFindSuitcase", "The client was carrying a suitcase with vital data. Retrieve it so it can be returned to the client's company",
	      "Find suitcase", ""],
        ["taskExtract", "Extract via helo", "Extract", "", getMarkerPos "markExtract"] 
] call FHQ_TT_addTasks;
            
["taskFindSUV", "assigned"] call FHQ_TT_setTaskState;