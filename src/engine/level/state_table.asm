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

	dw ProcessMultiCellBlock ; SST_LEVEL_MULTI_CELL_BLOCK

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
