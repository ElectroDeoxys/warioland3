Func_1c8000: ; 1c8000 (72:4000)
	ld a, [wSubSequence]
	jumptable

    dw SubSeq_FastFadeToWhite
    dw $4020
    dw SubSeq_SlowFadeFromWhite
    dw $4140
    dw SubSeq_FastFadeToWhite
    dw $4965
    dw SubSeq_SlowFadeFromWhite
    dw $4ca4
    dw SubSeq_FastFadeToWhite
    dw $13d5
    dw SubSeq_FastFadeToWhite
    dw $446c
    dw SubSeq_SlowFadeFromWhite
    dw $44f9
; 0x1c8020

	INCROM $1c8020, $1c8570

Func_1c8570: ; 1c8570 (72:4570)
	ld a, [wSubSequence]
	jumptable

    dw SubSeq_FastFadeToWhite
    dw $4586
    dw SubSeq_SlowFadeFromWhite
    dw $46dd
    dw SubSeq_FastFadeToWhite
    dw $4965
    dw SubSeq_SlowFadeFromWhite
    dw $4ca4
    dw Func_142b
; 0x1c8586

	INCROM $1c8586, $1cb5e4