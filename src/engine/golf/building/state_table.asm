_GolfBuildingStateTable::
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw Func_1c8586
	dw SlowFadeFromWhite
	dw Func_1c86dd
	dw FastFadeToWhite
	dw InitGolfHole
	dw SlowFadeFromWhite
	dw HandleGolfHole
	dw ReturnToMap
