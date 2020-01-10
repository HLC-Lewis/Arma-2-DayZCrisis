if (!isServer) exitWith {/* Server only */};

FHQ_foundOperatives = true; publicVariable "FHQ_foundOperatives";

_pmcGuy = (units FHQ_playerGroup - [leader FHQ_playerGroup]) select 0;
["TellTo", leader FHQ_playerGroup, [leader FHQ_playerGroup, [_pmcGuy, "speech", "p1_foundops1"]]] call FHQ_MP_specificEvent;

"operatives" execVM "scripts\checkObjectives.sqf";