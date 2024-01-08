_LevelStateTable:
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitLevel
	dw SlowFadeFromWhite
	dw UpdateLevel
	dw DoorTransition
	dw FastFadeToWhite
	dw StartRoom_FromTransition
	dw Func_861c ; SST_LEVEL_07

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
