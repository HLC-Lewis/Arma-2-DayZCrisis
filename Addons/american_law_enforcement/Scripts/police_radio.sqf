private ["_car","_radioSounds","_radioSoundInfo","_soundPlay","_soundWait","_playing","_r"];
_car = _this select 0;
_playing = false;

_radioSounds = 
[
	["radioSound1", 15.5],
	["radioSound2", 21.5],
	["radioSound3", 11.5]
];

for [{_r=0},{_r < 1},{_r=_r}] do
{

	_radioSoundInfo = _radioSounds select (random(round(count _radioSounds - 1)));
	_soundPlay = _radioSoundInfo select 0;
	_soundWait = _radioSoundInfo select 1;
	
	{
		if (player == _x) then
		{
			_car say _soundPlay;
			//player groupChat "NEW RADIO SOUND";
		};
	} foreach crew _car;
	if(!alive _car)exitwith{};
	sleep _soundWait;
};