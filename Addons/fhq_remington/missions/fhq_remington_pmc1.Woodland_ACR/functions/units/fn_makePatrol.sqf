/*
 * Create a random patrol at a certain radius and assigns it a random patrol route
 * via BIS_fnc_taskPatrol
 *
 * _this select 0: position or string (marker name)
 * _this select 1: # of people in group (0 = random)
 * _this select 2: maximum radius of placement
 * _this select 3: maximum distance between waypoints
 * _this select 4: side of group (optional)
 * _this select 5: array of group leader classes (optional)
 * _this select 6: array of subordinate classes (optional)
 *
 */
 
 private [
	"_pos", "_numDudes", "_maxPlacement", "_maxDist", "_leaderDudes", "_subDudes",
	"_grp", "_side", "_newPos", "_leader", "_leaderClass", "_subDude", "_subClass"
 ];
 
_pos = _this select 0;
if (typeName (_pos) == typeName "") then
{
	_pos = getMarkerPos (_this select 0);
};

_numDudes 		= _this select 1;
_maxPlacement 	= _this select 2;
_maxDist 		= _this select 3;

if ((count _this) > 4) then
{
	_side = _this select 4;
} 
else
{
	_side = EAST;
};

if ((count _this) > 5) then
{
	_leaderDudes = _this select 5;
}
else
{
	_leaderDudes = ["TK_Commander_EP1", "TK_Soldier_SL_EP1", "TK_Soldier_Officer_EP1"];
};

if ((count _this) >6) then
{
	_subDudes = _this select 6;
}
else
{
	_subDudes = [
		"TK_Soldier_AA_EP1", "TK_Soldier_AR_EP1", "TK_Soldier_B_EP1", "TK_Soldier_EP1",
		"TK_Soldier_GL_EP1", "TK_Soldier_Medic_EP1", "TK_Soldier_MG_EP1"
	];
};

// First, make a new position
_newPos = [_pos, 50, _maxPlacement, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

// Create the group. First select a leader, then n-1 subordinates
_grp = createGroup _side;
_leaderClass = _leaderDudes select (floor random (count _leaderDudes));
_leader = _leaderClass createUnit [ _newPos, _grp, "", 0.8, "CORPORAL"];

_numDudes = _numDudes - 1;
while {_numDudes > 0} do
{
	_subClass = _subDudes select (floor random (count _subDudes));
	_subDude = _subClass createUnit [_newPos, _grp];
	_numDudes = _numDudes - 1;
};

// Assign a patrol route
[_grp, _newPos, _maxDist] call BIS_fnc_taskPatrol;


// Return the new group
_grp
