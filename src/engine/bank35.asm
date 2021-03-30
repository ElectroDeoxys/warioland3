Func_d4000: ; d4000 (35:4000)
	ld a, [wSubSequence]
	jumptable

	dw SubSeq_FastFadeToWhite
	dw $402a
	dw SubSeq_SlowFadeFromWhite
	dw $41bb
	dw SubSeq_SlowFadeBGToWhite
	dw $4261
	dw DarkenBGToPal_Fast
	dw $434c
	dw SubSeq_SlowFadeBGToWhite
	dw $43e6
	dw DarkenBGToPal_Fast
	dw $4472
	dw $4507
	dw $454c
	dw $45f0
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
; 0xd402a

	INCROM $d402a, $d65f2
