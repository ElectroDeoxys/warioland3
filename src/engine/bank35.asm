Func_d4000: ; d4000 (35:4000)
	ld a, [wSubSequence]
	jumptable

	dw FastFadeToWhite
	dw $402a
	dw SlowFadeFromWhite
	dw $41bb
	dw SlowFadeBGToWhite
	dw $4261
	dw DarkenBGToPal_Fast
	dw $434c
	dw SlowFadeBGToWhite
	dw $43e6
	dw DarkenBGToPal_Fast
	dw $4472
	dw $4507
	dw $454c
	dw $45f0
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0xd402a

	INCROM $d402a, $d65f2
