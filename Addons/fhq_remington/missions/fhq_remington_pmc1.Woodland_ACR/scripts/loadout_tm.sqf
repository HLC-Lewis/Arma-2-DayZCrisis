private ["_unit", "_backpack"];

/* Replace _this below with the unit to assign the loadout to, or call with unit as parameter */
_unit = _this;

if (!isNull _unit) then {
    removeAllWeapons _unit;
    removeAllItems _unit;
    removeBackpack _unit;

    /* Magazines */
    _unit addMagazine "SmokeShellRed";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "HandGrenade_East";
    _unit addMagazine "HandGrenade_East";
    _unit addMagazine "SmokeShell";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR_T";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR_T";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR_T";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";
    _unit addMagazine "15Rnd_9x19_M9";

    /* Weapons */
    _unit addWeapon "FHQ_ACR_WDL_HAMR_F";
    _unit addWeapon "LRTV_ACR";
    _unit addWeapon "CZ_75_P_07_DUTY";
    _unit addWeapon "ItemMap";
    _unit addWeapon "ItemCompass";
    _unit addWeapon "ItemWatch";
    _unit addWeapon "ItemRadio";
    _unit addWeapon "ItemGPS";
};
