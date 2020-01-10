if (!isServer) exitWith {/* Server only */};

if (_this == "suitcase") then {
    ["taskFindSuitcase", "succeeded", "taskFindSUV", "taskExtract"] call FHQ_TT_markTaskAndNext;
};

if (_this == "client" || _this == "operatives") then {
    if (FHQ_foundClient && FHQ_foundOperatives) then {
    	["taskFindSUV", "succeeded", "taskFindSuitcase", "taskExtract"] call FHQ_TT_markTaskAndNext;
    };
}; 


if (FHQ_foundClient && FHQ_foundOperatives && FHQ_foundSuitcase) then {    
   	["TellTo", leader FHQ_playerGroup, [leader FHQ_playerGroup, [ComCo, "speech", "p1_reportback1"]]] call FHQ_MP_specificEvent;
};
