if (!isServer) exitWith {/* Server only code */};

waitUntil {((getPosATL pmcChopper1) select 2) < 2};

{_x setCaptive false; doGetOut _x; [_x] allowGetIn false; } forEach units FHQ_playerGroup;

waitUntil {0 == ({_x in pmcChopper1} count units FHQ_playerGroup)};

pmcPilot1 kbTell [leader FHQ_playerGroup, "speech", "pilot_goodluck1"];

FHQ_ferryEnd = true; publicVariable "FHQ_ferryEnd";