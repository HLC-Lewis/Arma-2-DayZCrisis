if (!isServer) exitWith {/* Server only */};

FHQ_foundSuitcase = true; publicVariable "FHQ_foundSuitcase";

_pmcGuy = (units FHQ_playerGroup - [leader FHQ_playerGroup]) select 0;
["TellTo", leader FHQ_playerGroup, [leader FHQ_playerGroup, [_pmcGuy, "speech", "p1_foundsuitcase1"]]] call FHQ_MP_specificEvent;

"suitcase" execVM "scripts\checkObjectives.sqf";