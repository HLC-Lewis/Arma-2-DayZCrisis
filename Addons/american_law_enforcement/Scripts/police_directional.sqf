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
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
 
			
			waitUntil {_v animationPhase "policedirectional" > 0};
			
			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
			_v setObjectTexture [7, "\American_Law_Enforcement\effects\lens_bright.paa"];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, ""];
			_v setObjectTexture [10, ""];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, ""];

			sleep 0.05;
			
			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, "\American_Law_Enforcement\effects\lens_bright4.paa"];
			_v setObjectTexture [9, ""];
			_v setObjectTexture [10, ""];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, ""];


			sleep 0.10;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, "\American_Law_Enforcement\effects\lens_bright4.paa""];
			_v setObjectTexture [10, ""];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, ""];



			sleep 0.15;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, ""];
			_v setObjectTexture [10, "\American_Law_Enforcement\effects\lens_bright4.paa""];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, ""];


			sleep 0.20;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, ""];
			_v setObjectTexture [10, ""];
			_v setObjectTexture [11, "\American_Law_Enforcement\effects\lens_bright4.paa""];
			_v setObjectTexture [12, ""];


			sleep 0.25;

			_v setObjectTexture [0, ""];
			_v setObjectTexture [1, ""];
			_v setObjectTexture [2, ""];
			_v setObjectTexture [3, ""];
			_v setObjectTexture [4, ""];
			_v setObjectTexture [5, ""];
			_v setObjectTexture [6, ""];
			_v setObjectTexture [7, ""];
			_v setObjectTexture [8, ""];
			_v setObjectTexture [9, ""];
			_v setObjectTexture [10, ""];
			_v setObjectTexture [11, ""];
			_v setObjectTexture [12, "\American_Law_Enforcement\effects\lens_bright.paa""];


			sleep 0.30;
		};
	};	
};