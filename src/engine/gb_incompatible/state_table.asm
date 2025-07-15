GBIncompatibleStateTable::
	ld a, [wSubState]
	jumptable

	dw  FastFadeToWhite
	dw  GBIncompatible
	dw  SlowFadeFromWhite
	dw  ExitGBIncompatible

	dw  DebugReset
	dw  DebugReset
	dw  DebugReset
	dw  DebugReset
