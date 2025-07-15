_ActionHelpStateTable::
	ld a, [wSubState]
	jumptable

	dw SlowFadeBGToWhite
	dw InitActionHelp
	dw DarkenBGToPal_Fast
	dw UpdateActionHelp
	dw SlowFadeBGToWhite
	dw ReturnToPauseMenuFromActionHelp
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
