
Func_160000: ; 160000 (58:4000)
	ld a, [wSubSequence]
	jumptable

    dw SubSeq_FastFadeToWhite
    dw $4028
    dw SubSeq_SlowFadeFromWhite
    dw $40d4
    dw $4190
    dw $426c
    dw $42ee
    dw $4318
    dw $4365
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
; 0x160028

	INCROM $160028, $162f85