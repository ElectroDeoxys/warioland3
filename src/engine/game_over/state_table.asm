_GameOverStateTable:
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitGameOverScreen
	dw SlowFadeFromWhite
	dw UpdateGameOverScreen
	dw Func_db3e4
	dw FastFadeToWhite
	dw GameOverReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
