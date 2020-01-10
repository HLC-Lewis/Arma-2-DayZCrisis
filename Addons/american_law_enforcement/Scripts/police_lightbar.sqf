private ["_v", "_light", "_lPos", "_RedLight", "_BlueLight", "_avLightBlue", "_avLightRed", "_avRedLight", "_avBlueLight", "_LightAmb", "_ambLight", "_typeLights", "_duration", "_blue", "_blueDark", "_blueAm", "_red", "_amber", "_white", "_perm", "_lightRed", "_lightBlue"];
//Author: DaChevs - May 23, 2009
//Special Thanks to ArMaTeC

//0 : "Rb1"
//1 : "lb1"
//2 : "rb2"
//3 : "lb2"
//4 : "rb3"
//5 : "lb3"
//6 : "avr"
//7 : "avb"
//directionals: 10 - 17

_v 		    = _this select 0;
_typeLights = _this select 1;
_duration   = 0.2;
_blue 	    = [0.49,0.67,0.95];
_blueDark   = [0,0,1.0];
_blueAm	    = [0,0,0.5];
_red	    = [0.77,0.05,0.23];
_amber	    = [1,0.45098,0.141176];
_white 	    = [1,1,1,1];
_perm 	    = 999999;

_lightRed =
{
	_RedLight = "#lightpoint" createVehicle (getPos _v); 
	_RedLight setLightBrightness 0.01; 
	_RedLight setLightAmbient [ 0.5, 0, 0 ]; 
	_RedLight setLightColor _red; 
	_RedLight lightAttachObject [_v, [-2, 0, 1.2]];
};

_lightBlue =
{
	_BlueLight = "#lightpoint" createVehicle (getPos _v); 
	_BlueLight setLightBrightness 0.01; 
	_BlueLight setLightAmbient [ 0, 0, 0.5 ]; 
	_BlueLight setLightColor _blueDark; 
	_BlueLight lightAttachObject [_v, [2, 0, 1.2 ]];
};

_avLightRed =
{
	_lpos = _v modelToWorld [0,+1,+0.5];
	_avRedLight = "#lightpoint" createVehicle _lpos; 
	_avRedLight setLightBrightness 0.006; 
	_avRedLight setLightAmbient _red; 
	_avRedLight setLightColor _red; 
	_avRedLight lightAttachObject [_v, [0,+0.95,+0.1]];
};

_avLightBlue = 
{
	_lpos = _v modelToWorld [0,+1,0];
	_avBlueLight = "#lightpoint" createVehicle _lpos; 
	_avBlueLight setLightBrightness 0.006; 
	_avBlueLight setLightAmbient _blueAm; 
	_avBlueLight setLightColor _blueDark; 
	_avBlueLight lightAttachObject [_v, [0,+0.95,+0.5]];
};

_LightAmb = 
{
	_ambLight = "#lightpoint" createVehicle (getPos _v); 
	_ambLight setLightBrightness 0.01; 
	_ambLight setLightAmbient [ 0.78, 0.78, 0.15 ]; 
	_ambLight setLightColor _amber; 
	_ambLight lightAttachObject [_v, [-2, 0, 1.2]];
};

switch (_typeLights) do
{
	case "Main":
	{
		while {alive _v} do
		{
			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
\
 
			
			waitUntil {_v animationPhase "policeLightbar" > 0};
			
			_v setObjectTexture [23, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [24, ""];
			_v setObjectTexture [25, ""];
			_v setObjectTexture [26, ""];
			_v setObjectTexture [27, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_bulb5 = "#lightpoint" createVehicle (getPos _v); 
			_bulb5 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb5 setLightAmbient [0,0,1.0]; 
			_bulb5 setLightColor [0,0,1.0]; 
			_bulb5 lightAttachObject [_v, [-.5, 0, 0.0 ]];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, ""];
			_v setObjectTexture [30, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [31, ""];
			_v setObjectTexture [32, ""];
			_v setObjectTexture [33, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [34, ""];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];

			sleep 0.05;
			
			_v setObjectTexture [23, ""];
			_v setObjectTexture [24, ""];
			_v setObjectTexture [25, ""];
			_v setObjectTexture [26, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [27, ""];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, ""];
			_v setObjectTexture [30, ""];
			_v setObjectTexture [31, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [32, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [33, ""];
			_v setObjectTexture [34, ""];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];
		 	deleteVehicle _bulb5;


			sleep 0.05;

			_v setObjectTexture [23, ""];
			_v setObjectTexture [24, ""];
			_v setObjectTexture [25, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [26, ""];
			_v setObjectTexture [27, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [28, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [29, ""];
			_v setObjectTexture [30, ""];
			_v setObjectTexture [31, ""];
			_v setObjectTexture [32, ""];
			_v setObjectTexture [33, ""];
			_bulb11 = "#lightpoint" createVehicle (getPos _v); 
			_bulb11 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb11 setLightAmbient [0.77,0.05,0.23]; 
			_bulb11 setLightColor [0.77,0.05,0.23]; 
			_bulb11 lightAttachObject [_v, [.5, 0, 0.0 ]];
			_v setObjectTexture [34, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];




			sleep 0.05;

			_v setObjectTexture [23, ""];
			_v setObjectTexture [24, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [25, ""];
			_v setObjectTexture [26, ""];
			_v setObjectTexture [27, ""];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [30, ""];
			_v setObjectTexture [31, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [32, ""];
			_v setObjectTexture [33, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [34, ""];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];
		 	deleteVehicle _bulb11;




			sleep 0.05;

			_v setObjectTexture [23, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [24, ""];
			_v setObjectTexture [25, ""];
			_v setObjectTexture [26, ""];
			_v setObjectTexture [27, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_bulb5 = "#lightpoint" createVehicle (getPos _v); 
			_bulb5 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb5 setLightAmbient [0,0,1.0]; 
			_bulb5 setLightColor [0,0,1.0];
			_bulb5 lightAttachObject [_v, [-.5, 0, 0.0 ]];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, ""];
			_v setObjectTexture [30, ""];
			_v setObjectTexture [31, ""];
			_v setObjectTexture [32, ""];
			_v setObjectTexture [33, ""];
			_v setObjectTexture [34, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];



			sleep 0.05;

			_v setObjectTexture [23, ""];
			_v setObjectTexture [24, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [25, ""];
			_v setObjectTexture [26, ""];
			_v setObjectTexture [27, ""];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, ""];
			_v setObjectTexture [30, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [31, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [32, ""];
			_v setObjectTexture [33, ""];
			_v setObjectTexture [34, ""];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];
		 	deleteVehicle _bulb5;

			sleep 0.05;

			_v setObjectTexture [23, ""];
			_v setObjectTexture [24, ""];
			_v setObjectTexture [25, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [26, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [27, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [30, ""];
			_v setObjectTexture [31, ""];
			_v setObjectTexture [32, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [33, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_bulb11 = "#lightpoint" createVehicle (getPos _v); 
			_bulb11 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb11 setLightAmbient [0.77,0.05,0.23]; 
			_bulb11 setLightColor [0.77,0.05,0.23]; 
			_bulb11 lightAttachObject [_v, [.5, 0, 0.0 ]];
			_v setObjectTexture [34, ""];
			_v setObjectTexture [5, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [6, "\American_Law_Enforcement\effects\lens_bright4.paa"];

			sleep 0.05;

			_v setObjectTexture [23, ""];
			_v setObjectTexture [24, ""];
			_v setObjectTexture [25, ""];
			_v setObjectTexture [26, ""];
			_v setObjectTexture [27, ""];
			_v setObjectTexture [28, ""];
			_v setObjectTexture [29, ""];
			_v setObjectTexture [30, ""];
			_v setObjectTexture [31, ""];
			_v setObjectTexture [32, ""];
			_v setObjectTexture [33, ""];
			_v setObjectTexture [34, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
		 	deleteVehicle _bulb11;


			sleep 0.05;
		};
	};

	case "Avengers":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [13, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [15, ""];

			sleep 0.03;

			_v setObjectTexture [13, ""];
			_v setObjectTexture [15, ""];


			sleep 0.03;

			_v setObjectTexture [13, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [15, ""];

			sleep 0.03;

			_v setObjectTexture [13, ""];
			_v setObjectTexture [15, "\American_Law_Enforcement\effects\lens_bright.paa"];

			sleep 0.03;

			_v setObjectTexture [13, ""];
			_v setObjectTexture [15, ""];


			sleep 0.03;

			_v setObjectTexture [13, ""];
			_v setObjectTexture [15, "\American_Law_Enforcement\effects\lens_bright.paa"];


			sleep 0.03;

			_v setObjectTexture [13, ""];
			_v setObjectTexture [15, ""];


			sleep 0.03;




		};
	};

	case "tail_head":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [37, "\American_Law_Enforcement\data\cessna_redlight.paa"];
			_v setObjectTexture [38, "\American_Law_Enforcement\data\car_light_flare2.paa"];

			sleep 0.02;
			
			_v setObjectTexture [37, ""];			
			_v setObjectTexture [38, ""];


			sleep 1.03;

			_v setObjectTexture [37, "\American_Law_Enforcement\data\cessna_redlight.paa"];
			_v setObjectTexture [38, "\American_Law_Enforcement\data\car_light_flare2.paa"];

			sleep 0.02;
			
			_v setObjectTexture [37, ""];			
			_v setObjectTexture [38, ""];

			sleep 0.02;
			_v setObjectTexture [37, "\American_Law_Enforcement\data\cessna_redlight.paa"];
			_v setObjectTexture [38, "\American_Law_Enforcement\data\car_light_flare2.paa"];

			sleep 0.02;
			_v setObjectTexture [37, ""];			
			_v setObjectTexture [38, ""];

			sleep 1.02;


		};
	};

	case "Liberty":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [21, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [22, ""];

			sleep 0.03;

			_v setObjectTexture [21, ""];
			_v setObjectTexture [22, ""];


			sleep 0.03;

			_v setObjectTexture [21, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [22, ""];

			sleep 0.03;

			_v setObjectTexture [21, ""];
			_v setObjectTexture [22, ""];;

			sleep 0.03;

			_v setObjectTexture [21, ""];
			_v setObjectTexture [22, "\American_Law_Enforcement\effects\lens_bright.paa"];


			sleep 0.03;

			_v setObjectTexture [21, ""];
			_v setObjectTexture [22, ""];


			sleep 0.03;


			_v setObjectTexture [21, ""];
			_v setObjectTexture [22, "\American_Law_Enforcement\effects\lens_bright.paa"];


			sleep 0.03;

			_v setObjectTexture [21, ""];
			_v setObjectTexture [22, ""];


			sleep 0.03;


		};
	};

	case "tail_flash":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [19, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [20, ""];

			sleep 0.02;

			_v setObjectTexture [19, ""];
			_v setObjectTexture [20, "\American_Law_Enforcement\effects\lens_bright3.paa"];


			sleep 0.02;

			_v setObjectTexture [19, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [20, ""];

			sleep 0.02;

			_v setObjectTexture [19, ""];
			_v setObjectTexture [20, "\American_Law_Enforcement\effects\lens_bright3.paa"];

			sleep 0.02;

			_v setObjectTexture [19, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [20, ""];


			sleep 0.02;

			_v setObjectTexture [19, ""];
			_v setObjectTexture [20, "\American_Law_Enforcement\effects\lens_bright3.paa"];


			sleep 0.02;


			_v setObjectTexture [19, "\American_Law_Enforcement\effects\lens_bright3.paa"];
			_v setObjectTexture [20, ""];


			sleep 0.02;

			_v setObjectTexture [19, ""];
			_v setObjectTexture [20, ""];


			sleep 0.02;


		};
	};
	

	case "Vector":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [0, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_bulb5 = "#lightpoint" createVehicle (getPos _v); 
			_bulb5 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb5 setLightAmbient [0,0,1.0]; 
			_bulb5 setLightColor [0,0,1.0]; 
			_bulb5 lightAttachObject [_v, [-.5, 0, 0.0 ]];

			sleep 0.05;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
		 	deleteVehicle _bulb5;


			sleep 0.05;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [2, ""];
			_bulb11 = "#lightpoint" createVehicle (getPos _v); 
			_bulb11 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb11 setLightAmbient [0.77,0.05,0.23]; 
			_bulb11 setLightColor [0.77,0.05,0.23]; 
			_bulb11 lightAttachObject [_v, [.5, 0, 0.0 ]];

			sleep 0.05;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
		 	deleteVehicle _bulb11;

			sleep 0.05;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_bulb5 = "#lightpoint" createVehicle (getPos _v); 
			_bulb5 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb5 setLightAmbient [0,0,1.0]; 
			_bulb5 setLightColor [0,0,1.0]; 
			_bulb5 lightAttachObject [_v, [-.5, 0, 0.0 ]];


			sleep 0.05;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
		 	deleteVehicle _bulb5;


			sleep 0.05;


			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_bulb11 = "#lightpoint" createVehicle (getPos _v); 
			_bulb11 setLightBrightness 0.03; 
			_duration   = 0.2;
			_bulb11 setLightAmbient [0.77,0.05,0.23]; 
			_bulb11 setLightColor [0.77,0.05,0.23]; 
			_bulb11 lightAttachObject [_v, [.5, 0, 0.0 ]];


			sleep 0.05;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
		 	deleteVehicle _bulb11;


			sleep 0.05;


		};
	};

	case "Federals":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [14, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [16, ""];

			sleep 0.03;

			_v setObjectTexture [14, ""];
			_v setObjectTexture [16, ""];


			sleep 0.03;

			_v setObjectTexture [14, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [16, ""];

			sleep 0.03;

			_v setObjectTexture [14, ""];
			_v setObjectTexture [16, "\American_Law_Enforcement\effects\lens_bright.paa"];

			sleep 0.03;

			_v setObjectTexture [14, ""];
			_v setObjectTexture [16, ""];


			sleep 0.03;

			_v setObjectTexture [14, ""];
			_v setObjectTexture [16, "\American_Law_Enforcement\effects\lens_bright.paa"];


			sleep 0.03;

			_v setObjectTexture [14, "\American_Law_Enforcement\effects\lens_bright2.paa"];
			_v setObjectTexture [16, ""];


			sleep 0.03;

			_v setObjectTexture [14, ""];
			_v setObjectTexture [16, ""];


			sleep 0.03;


		};
	};

	case "directional":
	{
		while {true} do
		{
			waitUntil {_v animationPhase "policeLightbar" > 0};

			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [10, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, ""];

			sleep 0.18;

			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [9, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [10, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [11, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [12, ""];


			sleep 0.18;

			_v setObjectTexture [7, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [8, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [9, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [10, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [11, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [12, "\American_Law_Enforcement\effects\lens_bright.paa"];

			sleep 0.18;

			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, ""];
			_v setObjectTexture [10, ""];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, ""];

			sleep 0.18;




		};
	};	
};