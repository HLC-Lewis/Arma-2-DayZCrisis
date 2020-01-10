private ["_unit", "_backpack"];

/* Replace player below with the unit to assign the loadout to */
_unit = _this;

if (!isNull _unit) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeBackpack _unit;

    /* Magazines */
    _unit addMagazine "SmokeShellRed";
    _unit addMagazine "HandGrenade_East";
    _unit addMagazine "HandGrenade_East";
    _unit addMagazine "SmokeShell";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_NT";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_NT";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_NT";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_NT";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_NT";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_T";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_T";
    _unit addMagazine "FHQ_rem_20Rnd_762x51_PMAG_T";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";

    /* Weapons */
    _unit addWeapon "Binocular_Vector";
    _unit addWeapon "ItemMap";
    _unit addWeapon "ItemCompass";
    _unit addWeapon "ItemWatch";
    _unit addWeapon "ItemRadio";
    _unit addWeapon "FHQ_RSASS_TAN";
    _unit addWeapon "CZ_75_P_07_DUTY";
};
