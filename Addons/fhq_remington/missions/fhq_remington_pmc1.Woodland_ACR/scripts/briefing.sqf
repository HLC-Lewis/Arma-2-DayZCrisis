
[
	FHQ_playerGroup, 
		["Mission", "Guard the workers from terrorist attacks"],
		["Situation", "Recently, the separatist movement FTS has been giving a lot of trouble to the local "
        			+ "dock workers, accusing them of helping the government to suppress the people. Blah blah yadda yadda. "
                    + "The usual bullshit. Truth is they are after the shipments. Anything that can be sold on the black market."
                    + "<br/><br/>"
                    + "Since the army is fighting in the north, the problem was played down by the government. Luckily for the "
                    + "workers, the union stepped in and hired Combat Control, Inc for security. So now, we are protecting the workers (more likely, the goods)."
                    + "<br/><br/>"
                    + "This day was just another day, same boring routine. Luckily, it's almost over"],
		["Execution", "Just wait until the busses are off.. then we can finally get back. If that car arrives to pick us up."],
        ["Credits", "Mission by Varanon<br/>" 
        		  + "Remington ACR and additional scripting by Alwarren<br/>"
                  + "UPSMON by Monsada"]
] call FHQ_TT_addBriefing;

[
	FHQ_playerGroup,
    	["taskRetFake", "Return to the company headquarter",
         "Return to the HQ", "", getMarkerPos "markHQ", "assigned"]
] call FHQ_TT_addTasks;