Func_1f8000: ; 1f8000 (7e:4000)
	ld a, [wSubSequence]
	jumptable

    dw SlowFadeBGToWhite
    dw $4022
    dw DarkenBGToPal_Fast
    dw $4194
    dw SlowFadeBGToWhite
    dw $1440
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
    dw Func_28d
; 0x1f8022

	INCROM $1f8022, $1fbde3
