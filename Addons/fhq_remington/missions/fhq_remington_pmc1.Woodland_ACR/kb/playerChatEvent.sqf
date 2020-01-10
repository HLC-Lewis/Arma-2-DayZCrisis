FHQ_handleSpeech = {
	_convMenu = [];

	_to = _this select 0;
	_from = _this select 1;
	_sentenceId = _this select 2;
    _topic = _this select 3;

	#define replycase(heard, sayTo, answer) 								\
		case heard:															\
	    {																	\
            if (isNil "_to") then {hint "Invalid recipicient";};			\
    		["TellTo", 														\
	        	_to, 														\
        		[_to, [sayTo, _topic, answer]]								\
        	] call FHQ_MP_specificEvent;									\
    	}
    
    
    format["%1 heard %2 from %3", name _to, _sentenceID, name _from] call FHQ_DebugConsole_DebugOut;

	if (_to == leader FHQ_playerGroup) then {
   		_pmcGuy = (units FHQ_playerGroup - [leader FHQ_playerGroup]) select 0;
		switch (_sentenceId) do {
			replycase("p2_intro1", leader FHQ_playerGroup, "p1_intro2");
			replycase("p1_intro2", comco, "briefing_start_token1");
            replycase("comco_brief1", comco, "p1_brief1");
            replycase("comco_brief2", comco, "briefing_goahead_token1");
            replycase("comco_brief3", leader FHQ_playerGroup, "p1_brief2");
            replycase("p1_brief2", comco, "p1_brief3");
            replycase("briefing_goahead_token2", _pmcGuy, "p1_brief4");
            replycase("p2_brief1", _pmcGuy, "p1_brief5");
            replycase("pilot_brief1", pmcPilot1, "p1_pilotbrief1");
            replycase("pilot_brief4", pmcPilot1, "p1_pilotbrief2");
            replycase("comco_reportback4", comco, "p1_reportback4");
            
            case "comco_reportback1": {
                /* This reply depends on the mission state */
                _reply = "p1_reportback2";
                if (FHQ_foundOperatives && FHQ_foundClient) then {_reply = "p1_reportback2";};
                if (FHQ_foundSuitcase) then {_reply = "p1_reportback5";};
                if (FHQ_foundOperatives && FHQ_foundClient && FHQ_foundSuitcase) then {_reply = "p1_reportback3"; };
                
               ["TellTo", _to, [_to, [comco, _topic, _reply]]] call FHQ_MP_specificEvent;
            };
		}; 
	};
    
	if (_to in units FHQ_playerGroup) then {
		switch (_sentenceId) do {
			replycase("p1_intro1", leader FHQ_playerGroup, "p2_intro1");
            replycase("p1_brief4", leader FHQ_playerGroup, "p2_brief1");
		};
	};

	if (_to == ComCo) then {
		switch (_sentenceId) do {
			replycase("briefing_start_token1", leader FHQ_playerGroup, "comco_brief1");
            replycase("p1_brief1", leader FHQ_playerGroup, "comco_brief2");
            replycase("briefing_goahead_token1", leader FHQ_playerGroup, "comco_brief3");
            replycase("p1_brief3", leader FHQ_playerGroup, "briefing_goahead_token2");
            replycase("p1_reportback1", leader FHQ_playerGroup, "comco_reportback1");
            replycase("p1_reportback2", leader FHQ_playerGroup, "comco_reportback2"); // Bodies only
            replycase("p1_reportback3", leader FHQ_playerGroup, "comco_reportback3"); // Bodies and suitcase
            replycase("p1_reportback5", leader FHQ_playerGroup, "comco_reportback4"); // Suitcase only
            replycase("p1_reportback4", leader FHQ_playerGroup, "comco_reportback5");
		};
        
        if (_sentenceID == "p1_reportback3") then {
            [] execVM "scripts\createExtraction.sqf";
        };
        
        if (_sentenceID == "briefing_start_token1") then {
            [] spawn {
            	["taskRetFake", "canceled"] call FHQ_TT_setTaskState;
            	sleep 1;
            	[
					FHQ_playerGroup,
    				["taskWaitPickup", "Wait for the Eagle 3-1 to pick you up",
		         	"Wait for pickup", "", pmcChopper1]
				] call FHQ_TT_addTasks;
            	sleep 1;
            	["taskWaitPickup", "assigned"] call FHQ_TT_setTaskState;
			};                
        };
	};
    
    if (_to == pmcPilot1) then {
		switch (_sentenceId) do {
			replycase("p1_pilotbrief1", pmcPilot1, "pilot_brief2");
            replycase("pilot_brief2", pmcPilot1, "pilot_brief3");
            replycase("pilot_brief3", leader FHQ_playerGroup, "pilot_brief4");
            replycase("p1_pilotbrief2", leader FHQ_playerGroup, "pilot_brief5");
		};
	};
    
	_convMenu;
}; 
