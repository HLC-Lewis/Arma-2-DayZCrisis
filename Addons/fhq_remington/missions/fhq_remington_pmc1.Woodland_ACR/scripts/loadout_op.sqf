private ["_unit", "_backpack"];

/* Replace _this below with the unit to assign the loadout to, or call with unit as parameter */
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
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR_T";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR_T";
    _unit addMagazine "FHQ_rem_30Rnd_680x43_ACR_T";
    _unit addMagazine "18Rnd_9x19_Phantom";
    _unit addMagazine "18Rnd_9x19_Phantom";
    _unit addMagazine "18Rnd_9x19_Phantom";
    _unit addMagazine "18Rnd_9x19_Phantom";
    _unit addMagazine "1Rnd_HE_M203";
    _unit addMagazine "1Rnd_HE_M203";
    _unit addMagazine "1Rnd_HE_M203";
    _unit addMagazine "1Rnd_Smoke_M203";

    /* Weapons */
    _unit addWeapon "FHQ_ACR_WDL_HAMR_GL_F";
    _unit addWeapon "CZ_75_SP_01_PHANTOM";
    _unit addWeapon "ItemMap";
    _unit addWeapon "ItemCompass";
    _unit addWeapon "ItemWatch";
    _unit addWeapon "ItemRadio";

    /* Backpack */
    _unit addBackpack "CZ_Backpack_EP1";
    _backpack = unitBackPack _unit;
    clearMagazineCargoGlobal _backpack;
    clearWeaponCargoGlobal _backpack;

    _backpack addMagazineCargoGlobal ["1Rnd_HE_M203", 5];
    _backpack addMagazineCargoGlobal ["FHQ_rem_30Rnd_680x43_ACR", 4];
    _backpack addMagazineCargoGlobal ["FHQ_rem_30Rnd_680x43_ACR_T", 4];
    _backpack addMagazineCargoGlobal ["SmokeShell", 1];
};
