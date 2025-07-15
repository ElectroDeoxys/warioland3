_PauseMenuStateTable::
	ld a, [wSubState]
	jumptable

	dw SlowFadeBGToWhite
	dw InitPauseMenu
	dw DarkenBGToPal_Fast
	dw UpdatePauseMenu

	dw SlowFadeBGToWhite
	dw ExitPauseMenu
	dw DarkenBGToPal_Fast
	dw ReturnToPendingLevelState

	dw SlowFadeBGToWhite ; SST_PAUSE_MENU_SAVE
	dw InitSaveScreen
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw SaveLevel
	dw DarkenBGToPal_Fast
	dw HandleSaveCompleteBox
	dw ResetAfterPauseMenuSave

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

	dw SlowFadeBGToWhite ; SST_PAUSE_18
	dw InitSaveScreenAndBackupVRAM
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw Save
	dw DarkenBGToPal_Fast
	dw HandleSaveCompleteBox
	dw SlowFadeBGToWhite
	dw TransitionAfterSave

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset

	dw SlowFadeBGToWhite
	dw InitSaveScreenAndBackupVRAM
	dw DarkenBGToPal_Fast
	dw FillSaveScreenBar
	dw SlowFadeBGToWhite
	dw Save
	dw DarkenBGToPal_Fast
	dw HandleSaveCompleteBox
	dw SlowFadeBGToWhite
	dw ResetAfterSave

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
