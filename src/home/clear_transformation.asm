PlayRecoverySFX::
	play_sfx SFX_RECOVERY
	ret

ClearTransformationValues::
	ld a, [wTransformation]
	cp TRANSFORMATION_BLIND
	call z, .RestoreBlindPalettes

	xor a
	ld [wInvincibleCounter], a
	ld [wTransformation], a
	ld [wWarioTransformationProgress], a
	ld [wStingTouchState], a
	ld [wTouchState], a
	ld [wca94], a
	ld [wIsIntangible], a
	ld [wTransformationDuration + 0], a
	ld [wTransformationDuration + 1], a
	ld [wAutoMoveState], a
	ld [wInvisibleFrame], a
	ld [wSwimmingDirectionInput], a
	ret

; restores the palettes after
; recovering from Blind transformation
.RestoreBlindPalettes:
	ld hl, wTempPals1
	ld a, BGPI_AUTOINC | palette 0
	ldh [rBGPI], a
	ld b, 8
	ld c, LOW(rBGPD)

.loop_copy_bg_pals
	wait_not_hblank
	wait_hblank
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy_bg_pals

	ld hl, wTempPals2 palette 3
	ld a, OBPI_AUTOINC | palette 3
	ldh [rOBPI], a
	ld b, 4
	ld c, LOW(rOBPD)

.loop_copy_ob_pals
	wait_not_hblank
	wait_hblank
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_copy_ob_pals
	ret

; unreferenced
Func_10fc:
	ld a, c
	ld b, $00
	ld hl, 0
	ld de, $9c
.loop_1
	cp 100
	jr c, .asm_110e
	add hl, de
	sub 100
	jr .loop_1
.asm_110e
	ld b, $00
	ld de, $6
.loop_2
	cp 10
	jr c, .asm_111c
	add hl, de
	sub 10
	jr .loop_2
.asm_111c
	add hl, bc
	ret

; unreferenced
Func_111e:
	push hl
	ld a, h
	ld hl, 0
	ld de, -$9c
.loop_1
	and a
	jr z, .asm_112d
	add hl, de
	dec a
	jr .loop_1
.asm_112d
	ld b, h
	ld c, l
	pop hl
	push hl
	ld a, l
	ld hl, $0
	ld de, -$6
.loop_2
	cp 16
	jr c, .asm_1141
	add hl, de
	sub 16
	jr .loop_2
.asm_1141
	add hl, bc
	pop de
	add hl, de
	ld c, l
	ret
