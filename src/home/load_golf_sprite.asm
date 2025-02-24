; hl = source
; wdc11 = destination
; w1dc13 = length - 1
Func_2c30::
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	ldh [rHDMA2], a
	ld a, [wdc11 + 0]
	ldh [rHDMA3], a
	ld a, [wdc11 + 1]
	ldh [rHDMA4], a
	ld a, [w1dc13]
	ldh [rHDMA5], a
	ret

Func_2c46::
	ld de, rBCPS
	ld c, 4
	jr .asm_2c52

	ld de, rOCPS
	ld c, 4

.asm_2c52
	ld a, $80
	ld [de], a
	inc e
.loop
REPT $10
	ld a, [hli]
	ld [de], a
ENDR
	dec c
	jr nz, .loop
	ret

; hl = golf object duration
; de = frameset
; outputs in c whether animation finished
UpdateGolfObjectAnimation::
	ld c, $00
	ld a, [hl] ; duration
	sub $1
	ld [hli], a
	ret nc ; not finished yet
	ld a, [hli] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .finished_animation
	inc bc
	ld [hld], a ; frame
	ld a, [hl]
	add $2
	ld [hld], a
	ld a, [bc]
	ld [hl], a ; duration
	ld c, FALSE
	ret

.finished_animation
	ld a, [hl] ; last frame
	ld [wGolfAnimLastFrame], a
	ld a, [de]
	ld [hld], a ; frame
	inc de
	ld a, $2
	ld [hld], a
	ld a, [de]
	ld [hl], a
	ld c, TRUE
	ret

; hl = golf object sprite
; wGolfOAMPtr = oam pointer
LoadGolfSprite::
	ld a, [hli]
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wGolfOAMPtr + 0]
	ld h, a
	ld a, [wGolfOAMPtr + 1]
	ld l, a
	call LoadSprite
	ret

; updates Golf Wario sprite, given its state
; and which direction it is facing
UpdateGolfWarioAnimation::
	ld hl, .OAMBanks
	ld a, [wGolfWarioState]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempBank], a

	ld a, [wGolfWarioDir]
	and a
	jr z, .dir_right
; dir left
	ld a, c
	add NUM_GOLF_WARIO_STATES
	ld c, a
.dir_right
	ld hl, .OAMTable
	ld b, $00
	sla c
	add hl, bc
	ld a, [hli]
	ld [wGolfOAMPtr + 1], a
	ld a, [hl]
	ld [wGolfOAMPtr + 0], a

	ld hl, .Framesets
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld hl, wGolfWarioDuration
	call UpdateGolfObjectAnimation
	ld a, c
	ld [wHasGolfWarioAnimationFinished], a
	pop af
	bankswitch

	ld a, [wHasGolfWarioAnimationFinished]
	and a
	call nz, HoldGolfWarioLastFrame
	ld a, [wGolfWarioCurrentFrame]
	ld [wGolfWarioFrame], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld hl, wGolfWarioSprite
	call LoadGolfSprite
	pop af
	bankswitch
	ret

.OAMBanks
	db BANK(OAM_14000)
	db BANK(OAM_1426c)
	db BANK(OAM_14d1b)
	db BANK(OAM_14d1b)
	db BANK(OAM_14d1b)
	db BANK(OAM_1cb0dd)
	db BANK(OAM_d49cc)
	db BANK(OAM_d49cc)
	db BANK(OAM_d49cc)
	db BANK(OAM_d49cc)
	db BANK(OAM_14a82)
	db BANK(OAM_1fc31b)

.OAMTable
	; facing right
	dw OAM_14000
	dw OAM_1426c
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_1cb0dd
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_14a82
	dw OAM_1fc31b

	; facing left
	dw OAM_14000
	dw OAM_1426c
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_1cb0dd
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_14a82
	dw OAM_1fc31b

.Framesets
	; facing right
	dw Frameset_1425f
	dw Frameset_149c5
	dw Frameset_151fd
	dw Frameset_2da4
	dw Frameset_2da7
	dw Frameset_1cb285
	dw Frameset_d4d1b
	dw Frameset_d4d5f
	dw Frameset_2db0
	dw Frameset_2db5
	dw Frameset_14cf6
	dw Frameset_1fc47c

	; facing left
	dw Frameset_14252
	dw Frameset_149b4
	dw Frameset_151e4
	dw Frameset_2daa
	dw Frameset_2dad
	dw Frameset_1cb2ac
	dw Frameset_d4d1b
	dw Frameset_d4d5f
	dw Frameset_2db0
	dw Frameset_2db5
	dw Frameset_14cf6
	dw Frameset_1fc473

Frameset_2da4:
	db $08,  1
	db $ff

Frameset_2da7:
	db $09, 15
	db $ff

Frameset_2daa:
	db $00,  1
	db $ff

Frameset_2dad:
	db $01, 15
	db $ff

Frameset_2db0:
	db $00, 15
	db $01, 15
	db $ff

Frameset_2db5:
	db $09,  8
	db $ff
