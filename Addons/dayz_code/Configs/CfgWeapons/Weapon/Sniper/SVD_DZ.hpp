class SVD_DZ: SVD {
	scope = 2;
	model = "\ca\weapons\SVD_dragunov_proxy";
	dexterity = 1.57;
	modelOptics = "\ca\weapons\optika_snpiere";
	opticsPPEffects[] = {"OpticsCHAbera3","OpticsBlur3"};
	picture = "\CA\weapons\data\equip\w_SVD_ca.paa";
	UiPicture = "\CA\weapons\data\Ico\i_sniper_CA.paa";
	opticsFlare = 1;
	opticsDisablePeripherialVision = 1;
	opticsZoomInit = 0.0623;
	opticsZoomMin = 0.0623;
	opticsZoomMax = 0.0623;
	distanceZoomMin = 200;
	distanceZoomMax = 200;
	begin1[] = {"ca\sounds\weapons\rifles\sniper_single_05",1.77828,1,1200};
	soundBegin[] = {"begin1",1};
	reloadMagazineSound[] = {"ca\sounds\weapons\rifles\reload-m16-3",0.316228,1,30};
	recoil = "recoil_single_primary_7outof10";
	recoilProne = "recoil_single_primary_prone_6outof10";
	dispersion = 0.00025;
	minRange = 0;
	minRangeProbab = 0.1;
	midRange = 400;
	midRangeProbab = 0.7;
	maxRange = 800;
	maxRangeProbab = 0.05;
	autoFire = 0;
	value = 1000;
	aiRateOfFire = 9;
	aiRateOfFireDistance = 1300;
	magazines[] = {"10Rnd_762x54_SVD"};
	class Single_Sniper	{
		displayName = "$STR_DN_MODE_SEMIAUTO";
		multiplier = 1;
		artilleryCharge = 1;
		artilleryDispersion = 1;
		burst = 1;
		dispersion = 0.00045;
		begin1[] = {"ca\sounds\weapons\rifles\sniper_single_05",1.7782794,1,1000};
		soundBegin[] = {"begin1",1}; //EMPTY
		soundEnd[] = {}; //EMPTY
		soundLoop[] = {}; //EMPTY
		soundContinuous = 0;
		soundBurst = 1;
		reloadTime = 0.6;
		recoil = "recoil_single_primary_4outof10";
		recoilProne = "recoil_single_primary_prone_4outof10";
		ffCount = 1;
		ffMagnitude = 0.5;
		ffFrequency = 11;
		flash = "gunfire";
		flashSize = 0.1;
		autoFire = 0;
		useAction = 0;
		useActionTitle = "";
		showToPlayer = 1;
		minRange = 0;
		minRangeProbab = 0.3;
		midRange = 400;
		midRangeProbab = 0.7;
		maxRange = 800;
		maxRangeProbab = 0.05;
		aiRateOfFire = 10.0;
		aiRateOfFireDistance = 800;
	};
	modes[] = {"Single_Sniper"};
};
	
