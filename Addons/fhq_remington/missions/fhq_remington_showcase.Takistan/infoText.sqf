
_text = "Missing Info Text";
switch(_this select 3) do {
    case "info": {
        _text = "<t size=""1.8"">Welcome to the FHQ Remington Weapon pack.</t> <br/><br/>"
  			+ "The Rifle range is to the left. You will find a full box of ammo and rifles next to the range. Please return the rifles after you are finished with them, other visitors want to try them as well.<br/><br/>"
            + "To the left, we have a display of all weapons in the pack. Only the ""loud"" variants are on display; you will find silenced versions in the ammo crate<br/><br/>"
            + "<br/>Enjoy your stay!";
    };
    case "rsass": {
        _text = "<t size=""1.8"">RSASS</t><br/><br/>"
        + "The Remington Semi-Automatic Sniper System (RSASS) is a gas-operated rifle chambered for the "
        + "7.62x51 mm standard NATO round, fed from a 20 round detatchable box magazine. The rifle is "
        + "effective up to a range of around 800-1000 meters. This variant is also equipped with a 45 "
        + "degrees angled Docter red-dot sight for short range engagements.<br/><br/>"
        + "The rifle is available in four variants: With a Leupold fixed magnification daylight scope, "
        + "an AN/PVS-13 heavy thermal weapon sight, both with and without silencer.";
    };
    case "xm2010": {
        _text = "<t size=""1.8"">XM2010</t><br/><br/>"
        + "The XM2010 sniper rifle is a further development from the established M24 design. Chambered "
        + "for the .300 Winchester round, the bolt-action rifle is effective (and lethal) at ranges " 
        + "of up to 1200 meters. Magazines are only available in a five-round configuration. It won the "
        + "2010 US Army competition for the next-generation sniper rifle and is currently being deployed "
        + "for field-testing in Afghanistan.<br/><br/>"
        + "The rifle is available here in six variants: With a Leupold twin-zoom Mk 4 daylight scope, "
        + "with an optional clip-on AN/PVS-29 night vision sight, and a AN/PVS-13 heavy thermal weapon "
        + "sight. Both silenced and non-silenced versions are included.";
    };
    case "msr": {
        _text = "<t size=""1.8"">MSR</t><br/><br/>"
        + "The Modular Sniper Rifle is based on the RACS chassis system, but includes an interchangeable "
        + "bolt system and barrel that allows caliber changes in the field. From the various options "
        + "available, the rifles on display here have been fitted for the powerful .338 Lapua Magnum "
        + "cartrige for maximum damage capacity over 1400 meters and beyond. <br/><br/>" 
        + "Magazine sizes available are five, seven and ten rounds. Again, six versions are available "
        + "here - the daylight scoped version with a Leupold Mk 4, the night sniper version with the "
        + "AN/PVS-29, and the AN/PVS-13 variant with a long-range TWS sight. Again, both silenced and "
        + "non-silenced versions are included.";
    };
    case "info2": {
        _text = "<t size=""1.8"">Shooting Range</t><br/><br/>"
        + "No scoring is done here. Shoot for your own amusement and testing.<br/><br/>"
        + "A word about magazines:<br/>All magazines are available in eight variants, four of which are "
        + "suitable for silenced weapons. There is one base magazine and three tracer versions:<br/><br/>"
        + "<t size=""1.2"">Tracer</t><br/>A normal bright red tracer bullet that allows for accurate estimation of where the bullet "
        + "lands. Best viewed in low-light conditions, although they also work in daylight.<br/><br/>"
        + "<t size=""1.2"">Subdued Tracer</t><br/>This tracer variant works like the normal tracers, but the "
        + "glow will start one tenth of a second after firing. Essentially, this means the tracer will be invisible "
        + "until it has flows several meters, making the shooter's position more difficult to spot<br/><br/>"
        + "<t size=""1.2"">Dim Tracer</t><br/>Dim tracers are virtually invisible under any light condition, even "
        + "at night. They are, however, visible in night vision goggles or scopes. This tracer is ideal against "
        + "low-tech enemies that have no or limited night vision capacity.";
    };
	case "acr": {
		_text = "<t size=""1.8"">ACR</t><br/><br/>"
        + "The Remington Adaptive Combat Rifle (ACR) began its existence as the Magpul Marsada. Magpul eventually licensed the design " 
		+ "to Bushmaster and Remington, who now both produce the ACR. It is a gas-operated select-fire assault rifle with the unique "
		+ "ability to adapt to caliber. All rifles on display here are chambered for the high-power Remington 6.8 SPC cartridge.<br/><br/>"
		+ "Not all variants are on display here. There are four camo variants (Woodland, Black, Desert, and Winter). All rifles come with "
		+ "a LLM-01 combined laser/flashlight module and optional grenade launcher. There is a selection of iron sights, red dot, Holo, "
		+ "magnified Holo, RCO and HAMR scopes";
	};
};

disableSerialization;
_dlg = createDialog "FHQ_InfoText";
_display = findDisplay 10001;
(_display displayCtrl 1100) ctrlSetStructuredText (parseText _text);