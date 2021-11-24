Func_dc000: ; dc000 (37:4000)
	ld a, [wSubState]
	jumptable

    dw SlowFadeBGToWhite
    dw $401e
    dw DarkenBGToPal_Fast
    dw $4073
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
; 0xdc01e

	INCROM $dc01e, $dd858
