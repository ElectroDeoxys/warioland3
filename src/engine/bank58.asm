
Func_160000: ; 160000 (58:4000)
	ld a, [wSubSequence]
	jumptable

    dw FastFadeToWhite
    dw $4028
    dw SlowFadeFromWhite
    dw $40d4
    dw $4190
    dw $426c
    dw $42ee
    dw $4318
    dw $4365
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
    dw DebugReset
; 0x160028

	INCROM $160028, $162f85