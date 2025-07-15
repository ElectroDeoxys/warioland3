_PerfectStateTable::
	ld a, [wSubState]
	jumptable

	dw SlowFadeBGToWhite
	dw InitPerfectScreen
	dw DarkenBGToPal_Fast
	dw UpdatePerfectScreen
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
