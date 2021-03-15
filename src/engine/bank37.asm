Func_dc000: ; dc000 (37:4000)
	ld a, [wSubSequence]
	jumptable

    dw SubSeq_SlowFadeBGToWhite
    dw $401e
    dw DarkenBGToPal_Fast
    dw $4073
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
; 0xdc01e

	INCROM $dc01e, $e0000
