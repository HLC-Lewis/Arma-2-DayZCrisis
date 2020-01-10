if (!isServer) exitWith {/* Server only */};

FHQ_foundClient = true; publicVariable "FHQ_foundClient";

_pmcGuy = (units FHQ_playerGroup - [leader FHQ_playerGroup]) select 0;
["TellTo", leader FHQ_playerGroup, [leader FHQ_playerGroup, [_pmcGuy, "speech", "p1_foundclient1"]]] call FHQ_MP_specificEvent;

"client" execVM "scripts\checkObjectives.sqf";