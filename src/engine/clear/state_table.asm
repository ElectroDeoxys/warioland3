_ClearScreenStateTable:
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitClearScreen
	dw SlowFadeFromWhite
	dw UpdateClearScreen

	dw SlowFadeBGToWhite ; SST_CLEAR_TIME_ATTACK
	dw InitTimeAttackClearScreen
	dw DarkenBGToPal_Fast
	dw Func_d434c

	dw SlowFadeBGToWhite ; SST_CLEAR_MUSICAL_COINS
	dw InitMusicalCoinScreen
	dw DarkenBGToPal_Fast
	dw Func_d4472
	dw Func_d4507
	dw Func_d454c
	dw ExitClearScreen ; SST_CLEAR_EXIT
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
