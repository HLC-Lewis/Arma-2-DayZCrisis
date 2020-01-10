// Control types
#define CT_STATIC	0
#define CT_STRUCTURED_TEXT 13

// Static styles
#define ST_LEFT	0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN	4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "EtelkaNarrowMediumPro"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0

class RscPicture
{
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER + ST_PICTURE;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "EtelkaNarrowMediumPro";
	sizeEx = 0.02;
};
class FHQ_Logo {
	idd = -1;
	movingEnable = 0;
	duration = 30;
	name = "FHQ_Logo";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		idc = 1200;
		text = "images\logo.paa";
		x = 0.788375 * safezoneW + safezoneX;
		y = 0.731306 * safezoneH + safezoneY;
		w = 0.199465 * safezoneW;
		h = 0.32161 * safezoneH;
	};
};

class FHQ_Logo2 {
	idd = -1;
	movingEnable = 0;
	duration = 30;
	name = "FHQ_Logo2";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		idc = 1200;
		text = "images\logo2.paa";
		x = 0.788375 * safezoneW + safezoneX;
		y = 0.731306 * safezoneH + safezoneY;
		w = 0.199465 * safezoneW;
		h = 0.32161 * safezoneH;
	};
};

class RscIntroDialog {
	onload = "uinamespace setvariable ['fhq_title',_this select 0];";
	idd = 888;
	movingEnable = false;
	moving = false;
	duration=10e10;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {IntroStructuredText};

	class IntroStructuredText {
		idc = 100;
		type = CT_STRUCTURED_TEXT; // defined constant
		style = ST_LEFT; // defined constant
		colorBackground[] = { 1, 1, 1, 0 };
		colorText[] = {1,1,1,1};
		x = safeZoneX;
		y = safeZoneY + safeZoneH - 0.35;
		w = 1;
		h = 0.2;
		size = 0.018;
		text = "<br/><br/><br/><br/>_<br/>";
		class Attributes {
			font = FontM;
			color = "#000000";
			align = "left";
			valign = "top";
			shadow = false;
			shadowColor = "#ff0000";
			size = "2";
		};
	};
};

class RscIntroDialog2 {
	onload = "uinamespace setvariable ['fhq_title',_this select 0];";
	idd = 889;
	movingEnable = false;
	moving = false;
	duration=10e10;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {IntroStructuredText};

	class IntroStructuredText {
		idc = 100;
		type = CT_STRUCTURED_TEXT; // defined constant
		style = ST_LEFT; // defined constant
		colorBackground[] = { 1, 1, 1, 0 };
		colorText[] = {1,1,1,1};
		x = 0.2;
		y = 0.2;
		w = 0.6;
		h = 0.6;
		size = 0.018;
		text = "";
		class Attributes {
			font = FontM;
			color = "#000000";
			align = "center";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1.6";
		};
	};
};

class RscTaskHintDlg {
	onload = "uinamespace setvariable ['fhq_title',_this select 0];";
	idd = 890;
	movingEnable = false;
	moving = false;
	duration=10e10;
	enableSimulation = true;
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {TaskHintStructuredText};

	class TaskHintStructuredText {
		idc = 100;
		type = CT_STRUCTURED_TEXT; // defined constant
		style = ST_LEFT; // defined constant
		colorBackground[] = { 0.38, 0.34, 0.31, 0.7 };
		colorText[] = {1,1,1,1};
		x = safeZoneX + safeZoneW; // - 0.3;
		y = safeZoneY + 0.3;
		w = 1;
		h = 0.0612;
		size = 0.018;
		text = "";
		class Attributes {
			font = FontM;
			color = "#555555";
			align = "left";
			valign = "top";
			shadow = false;
			shadowColor = "#ff0000";
			size = "2";
		};
	};
};
