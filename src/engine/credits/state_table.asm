_CreditsStateTable::
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitCredits
	dw SlowFadeFromWhite
	dw ShowCredits
	dw Func_160190
	dw Func_16026c
	dw Func_1602ee
	dw Func_160318
	dw Func_160365
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
