class FHQ_InfoText
{
	idd = 10001;
	movingEnable = true;
	enableSimulation = false;

	class Objects
	{

	};

	class ControlsBackground
	{
		class FHQInfoBackground : FHQRscPicture
		{
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.63 * safezoneH;
		};
		class FHQInfoFrame: FHQRscFrame
		{
			idc = 1800;
			text = "Information";
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.63 * safezoneH;
		};
	};

	class Controls
	{
		class FHQExitButton: FHQRscButton
		{
			action = "closeDialog 0;";
			idc = 1600;
			text = "Close";
			x = 0.635417 * safezoneW + safezoneX;
			y = 0.788889 * safezoneH + safezoneY;
			w = 0.124896 * safezoneW;
			h = 0.056111 * safezoneH;
		};

		class FHQText: FHQRscStructuredText
		{
			idc = 1100;
			size = 0.038;
			align = "left";
			x = 0.245833 * safezoneW + safezoneX;
			y = 0.172222 * safezoneH + safezoneY;
			w = 0.509271 * safezoneW;
			h = 0.593148 * safezoneH;
		};
	};
};

