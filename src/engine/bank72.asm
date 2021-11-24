Func_1c8000: ; 1c8000 (72:4000)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw $4020
	dw SlowFadeFromWhite
	dw $4140
	dw FastFadeToWhite
	dw $4965
	dw SlowFadeFromWhite
	dw $4ca4
	dw FastFadeToWhite
	dw $13d5
	dw FastFadeToWhite
	dw $446c
	dw SlowFadeFromWhite
	dw $44f9
; 0x1c8020

	INCROM $1c8020, $1c8570

Func_1c8570: ; 1c8570 (72:4570)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw $4586
	dw SlowFadeFromWhite
	dw $46dd
	dw FastFadeToWhite
	dw $4965
	dw SlowFadeFromWhite
	dw $4ca4
	dw Func_142b
; 0x1c8586

	INCROM $1c8586, $1cb5e4