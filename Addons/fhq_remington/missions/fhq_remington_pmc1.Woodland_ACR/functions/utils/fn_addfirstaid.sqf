/* Add the appropriate BIS first aid modules for a given units array (passed as parameter) */

private ["_unit", "_unitArray"];

{
	_unit = _x createVehicleLocal [1, 1, 1];
    _unit synchronizeObjectsAdd (_this);
} foreach ["FirstAidSystem", "BattleFieldClearance", "AlternativeInjurySimulation"];