_car = _this select 0;

for [{_i=0}, {_i < 1}, {_i=_i}] do
{
	waitUntil {_car animationPhase "policeSirens" >= 0.5};
	_car say "police_Siren";

	if(!alive _car)exitwith{};
	Sleep 30.25;
};