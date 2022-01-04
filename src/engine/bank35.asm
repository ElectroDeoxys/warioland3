Func_d4000: ; d4000 (35:4000)
	ld a, [wSubState]
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

	INCROM $d402a, $d4876

; check if a bit is set in wca3e
; for the level in wOWLevel
Func_d4876:: ; d4876 (35:4876)
	ld hl, wca3e
	ld a, [wOWLevel]
	dec a
	ld c, a
	srl a
	srl a
	srl a ; /8
	ld e, a
	ld d, $00
	add hl, de
	ld a, c
	and %111
	ld c, a
	jr z, .asm_d4893
.loop_1
	rrc [hl]
	dec c
	jr nz, .loop_1
.asm_d4893
	ld c, a
	bit 0, [hl]
	jr nz, .asm_d489c
	ld b, FALSE
	jr .asm_d489e
.asm_d489c
	ld b, TRUE
.asm_d489e
	ld a, c
	and a
	ret z
.loop_2
	rlc [hl]
	dec a
	jr nz, .loop_2
	ret
; 0xd48a7

	INCROM $d48a7, $d65f2
