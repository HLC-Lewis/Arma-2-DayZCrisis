#define LOCATION(x) functions\##x

#define ENTRY(name, file, desc) 	\
	class name						\
	{								\
		file = functions\##file;	\
		description = desc;			\
	};

class CfgFunctions
{
	class FHQ
	{
		class utils
		{
			class FindHeloLanding 
			{
				file = LOCATION(utils\fn_FindHeloLanding.sqf);
				description="Find a spot for a helo landing"; 
			};
			class SayTo
			{
				file = LOCATION(utils\fn_sayTo.sqf);
				description="Have someone say something to someone and wait until finished";
			};
			class IsFlat
			{
				file = LOCATION(utils\fn_isFlat.sqf);
				description="Check if a given area is (mostly) flat or not";
			};
			class Date2String
			{
				file = LOCATION(utils\fn_date2string.sqf);
				description = "Convert a date array into a string";
			};
			class Time2FuzzyString
			{
				file = LOCATION(utils\fn_time2fuzzy.sqf);
				description = "Convert hour into a 'fuzzy' string";
			};
			class AddBISFirstAid
			{
				file = LOCATION(utils\fn_addfirstaid.sqf);
				description = "Add BIS first aid modules for specified group";
			};
		};
		class vectors
		{
			class VectorScale
			{
				file = LOCATION(vectors\fn_vectorScale.sqf);
				description="Scale a vector by a factor";
			};
			class VectorScaleTo
			{
				file = LOCATION(vectors\fn_vectorScaleTo.sqf);
				description="Scale a vector to a certain length";
			};
			class VectorFromDirection
			{
				file = LOCATION(vectors\fn_vectorFromDirection.sqf);
				description="Return a vector from a given direction";
			};
		};
		class effects
		{
			class CreateSmoke
			{
				file = LOCATION(effects\fn_createSmoke.sqf);
				description="Creates a smoke plume (script by kylania)";
			};
			class TickerTitle
			{
				file = LOCATION(effects\fn_tickerTitle.sqf);
				description="Displays a teletext title effect";
			};
		};
		class units
		{
			class MakePatrol
			{
				file = LOCATION(units\fn_makePatrol.sqf);
				description="Create a random patrol at a random location with random waypoints";
			};
		};
		class helo
		{
			class InitHeloTaxi
			{
				file = LOCATION(helo\fn_initHeloTaxi.sqf);
				description = "Initialize helo taxi module";
			};
			class CallHelo
			{
				file = LOCATION(helo\fn_callHelo.sqf);
				description = "Set a course for the helo for pickup";
			};
			class CallHeloHere
			{
				file = LOCATION(helo\fn_callHeloHere.sqf);
				description = "Request pickup at current location";
			};
			class CancelHelo
			{
				file = LOCATION(helo\fn_cancelHelo.sqf);
				description = "Send the helo back to base";
			};
			class SetHeloCallback
			{
				file = LOCATION(helo\fn_setHeloCallback.sqf);
				description = "Set a callback for certain events for the helo taxi route";
			};
			class SetHeloFlyinHeight
			{
				file = LOCATION(helo\fn_setHeloFlyinHeight.sqf);
				description = "Set the fly in height for the helo";
			};
			class ShowHeloMarker
			{
				file = LOCATION(helo\fn_showHeloMarker.sqf);
				description = "Show or hide position of the helo";
			};
		};
	};
};
