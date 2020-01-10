
if (!isNil "pmcMan1_1" /*&& local pmcMan1_1*/) then { pmcMan1_1 call compile preprocessFileLineNumbers "scripts\loadout_tm.sqf"; };
if (!isNil "pmcMan1_2" /*&& local pmcMan1_2*/) then { pmcMan1_2 call compile preprocessFileLineNumbers "scripts\loadout_sn.sqf"; };
if (!isNil "pmcMan1_3" /*&& local pmcMan1_3*/) then { pmcMan1_3 call compile preprocessFileLineNumbers "scripts\loadout_me.sqf"; };
if (!isNil "pmcMan1_4" /*&& local pmcMan1_4*/) then { pmcMan1_4 call compile preprocessFileLineNumbers "scripts\loadout_op.sqf"; };
if (!isNil "pmcMan1_5" /*&& local pmcMan1_5*/) then { pmcMan1_5 call compile preprocessFileLineNumbers "scripts\loadout_op.sqf"; };
if (!isNil "pmcMan1_6" /*&& local pmcMan1_6*/) then { pmcMan1_6 call compile preprocessFileLineNumbers "scripts\loadout_en.sqf"; };
if (isServer) then {pmcAmmoCar1 call compile preprocessFileLineNumbers "scripts\loadout_car.sqf"; };