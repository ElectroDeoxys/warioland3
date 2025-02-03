Func_b6d5:
	xor a
	ld [wc0c0], a
	ld a, [wRoomRightXLimit]
	dec a
	ld c, a
	ld a, [wCameraSCX + 1]
	add b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	adc $00
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	ld b, $60
	jr z, .asm_b6f8
	ld b, $40
.asm_b6f8
	ld a, [wCameraSCX + 0]
	cp c
	jr c, .asm_b70e
	ld a, [wCameraSCX + 1]
	cp b
	jr c, .asm_b70e
	ld a, b
	ld [wCameraSCX + 1], a
	ld a, $01
	ld [wc0c0], a
	ret
.asm_b70e
	ld a, [wRoomLeftXLimit]
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .asm_b722
	ld a, [wCamLeftSpacing]
	jr .asm_b725
.asm_b722
	ld a, [wCamRightSpacing]
.asm_b725
	sub $08
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	jr z, .asm_b733
	ld a, c
	add $20
	ld c, a
.asm_b733
	ld a, [wWarioXPos + 1]
	cp c
	ret nc
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	ld a, $00
	jr z, .asm_b743
	ld a, $20
.asm_b743
	ld [wCameraSCX + 1], a
	ld a, $02
	ld [wc0c0], a
	ret

Func_b74c:
	xor a
	ld [wc0bf], a
	ld a, [wRoomLeftXLimit]
	ld c, a
	ld a, [wCameraSCX + 1]
	sub b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	sbc $00
	ld [wCameraSCX + 0], a
	ld a, [wCameraSCX + 1]
	add $10
	ld l, a
	ld a, [wCameraSCX + 0]
	adc $00
	cp c
	jr nz, .asm_b790
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	ld b, $10
	jr z, .asm_b77c
	ld b, $30
.asm_b77c
	ld a, l
	cp b
	jr nc, .asm_b790
	ld a, c
	ld [wCameraSCX + 0], a
	ld a, b
	sub $10
	ld [wCameraSCX + 1], a
	ld a, $01
	ld [wc0bf], a
	ret
.asm_b790
	ld a, [wRoomRightXLimit]
	dec a
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .asm_b7a5
	ld a, [wCamLeftSpacing]
	jr .asm_b7a8
.asm_b7a5
	ld a, [wCamRightSpacing]
.asm_b7a8
	ld c, a
	ld a, $a8
	sub c
	ld c, a
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	jr z, .asm_b7bb
	ld a, c
	sub $20
	ld c, a
.asm_b7bb
	ld a, [wWarioXPos + 1]
	cp c
	ret c
	ld a, $02
	ld [wc0bf], a
	ld a, [wRoomRightXLimit]
	dec a
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	ld a, $60
	jr z, .asm_b7d7
	ld a, $40
.asm_b7d7
	ld [wCameraSCX + 1], a
	ret

Func_b7db:
	ld a, [wRoomLowerYLimit]
	dec a
	ld c, a

	; add offset to camera Y scroll
	ld a, [wCameraSCY + 1]
	add b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	adc 0
	ld [wCameraSCY + 0], a

	cp c
	jr c, .asm_b80d
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	ld b, $68
	jr z, .asm_b7fd
	ld b, $48
.asm_b7fd
	ld a, [wCameraSCY + 1]
	cp b
	jr c, .asm_b80d
	ld a, b
	ld [wCameraSCY + 1], a
	ld a, $01
	ld [wc0bd], a
	ret

.asm_b80d
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc

	; not CAM_TRANSITIONS
	ld a, [wRoomUpperYLimit]
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	jr c, .asm_b836
	ret nz
	ld a, [wca5e]
	sub $10
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	jr z, .asm_b831
	ld a, c
	add $20
	ld c, a
.asm_b831
	ld a, [wWarioYPos + 1]
	cp c
	ret nc
.asm_b836
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	ld a, $00
	jr z, .asm_b841
	ld a, $20
.asm_b841
	ld [wCameraSCY + 1], a
	ld a, [wRoomUpperYLimit]
	ld [wCameraSCY + 0], a
	ld a, $02
	ld [wc0bd], a
	ret

Func_b850:
	ld a, [wRoomUpperYLimit]
	ld c, a
	ld a, [wCameraSCY + 1]
	sub b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	sbc $00
	ld [wCameraSCY + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	ld b, $10
	jr z, .asm_b86e
	ld b, $30
.asm_b86e
	ld a, [wCameraSCY + 1]
	add $10
	ld l, a
	ld a, [wCameraSCY + 0]
	adc $00
	cp c
	jr c, .asm_b882
	jr nz, .asm_b892
	ld a, l
	cp b
	jr nc, .asm_b892
.asm_b882
	ld a, c
	ld [wCameraSCY + 0], a
	ld a, b
	sub $10
	ld [wCameraSCY + 1], a
	ld a, $01
	ld [wc0be], a
	ret
.asm_b892
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc
	ld a, [wRoomLowerYLimit]
	dec a
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	ret nz
	ld a, [wca5e]
	ld c, a
	ld a, $a0
	sub c
	ld c, a
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	jr z, .asm_b8ba
	ld a, c
	sub $20
	ld c, a
.asm_b8ba
	ld a, [wWarioYPos + 1]
	cp c
	ret c
	ld a, $02
	ld [wc0be], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	ld a, $68
	jr z, .asm_b8cf
	ld a, $48
.asm_b8cf
	ld [wCameraSCY + 1], a
	ret

SetWarioScreenPos:
	ld a, [wCameraConfigFlags]
	cp HIDDEN_FIGURE_CAMCONFIG
	jr z, .hidden_figure_camconfig
	ld a, [wSCY]
	ld b, a
	ld a, [wWarioYPos + 1]
	add OAM_Y_OFS
	sub b ; [wWarioYPos + 1] + $10 - wSCY
	ld [wWarioScreenYPos], a
	ld a, [wSCX]
	ld b, a
	ld a, [wWarioXPos + 1]
	add OAM_X_OFS
	sub b
	ld [wWarioScreenXPos], a
	ret

.hidden_figure_camconfig
	ld a, [wSCYShake]
	ld c, a
	ld a, [wc08a]
	add c
	ld b, a
	ld a, [wWarioYPos + 1]
	add OAM_Y_OFS
	sub b
	ld [wWarioScreenYPos], a
	ld a, [wc08c]
	ld b, a
	ld a, [wWarioXPos + 1]
	add OAM_X_OFS
	sub b
	ld [wWarioScreenXPos], a
	ret

Func_b915:
	ld a, [wc0c2]
	ld b, a
	and a
	jr z, .asm_b964
	xor a
	ld [wc0d4], a

	bit 7, b
	jr nz, .negative

; positive
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	cp [hl]
	jr nc, .asm_b92e
	; wca5e < wWarioScreenYPos
	inc b
.asm_b92e
	call Func_b7db
	ld a, [wc0bd]
	and a
	jr nz, .asm_b93c
	ld hl, wc0bb
	set 3, [hl]
.asm_b93c
	xor a
	ld [wc0c2], a
	ret

.negative
	ld a, b
	cpl
	inc a
	ld b, a ; = -b
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	cp [hl]
	jr c, .asm_b951
	jr z, .asm_b951
	; wca5e > wWarioScreenYPos
	inc b
.asm_b951
	call Func_b850
	ld a, [wc0be]
	and a
	jr nz, .asm_b95f
	ld hl, wc0bb
	set 2, [hl]
.asm_b95f
	xor a
	ld [wc0c2], a
	ret

.asm_b964
	ld a, [wWaterInteraction]
	and a
	ret nz ; is in water
	ld a, [wJumpVelIndex]
	and a
	ret nz ; is jumping

	; return if Wario state is WST_LADDER_SCRATCHING
	; or between WST_LADDER_CLIMBING and WST_LADDER_SLIDING
	ld a, [wWarioState]
	cp WST_LADDER_SCRATCHING
	ret z
	cp WST_LADDER_CLIMBING
	jr c, .not_in_ladder
	cp WST_LADDER_SLIDING + 1
	ret c

.not_in_ladder
	ld a, [wc0d4]
	inc a
	ld [wc0d4], a
	dec a
	ret z
	ld hl, wWarioScreenYPos
	ld a, [wca5e]
	sub [hl]
	jr nc, .asm_b98f
	cpl
	inc a
.asm_b98f
	ld b, a
	ld a, [wWarioSlopeInteraction]
	and a
	jr nz, .on_slope
	ld a, b
	cp $08
	ret c
	ld b, $07
.on_slope
	ld a, [wca5e]
	cp [hl]
	jr c, .asm_b92e
	ret z
	jp .asm_b951

Func_b9a6:
	ld a, [wc0c3]
	ld b, a
	and a
	jr z, .asm_ba13
	xor a
	ld [wc0d5], a
	bit 7, b
	jr nz, .asm_b9e2
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_b9c3
	ld a, [wCamLeftSpacing]
	jr .asm_b9c6
.asm_b9c3
	ld a, [wCamRightSpacing]
.asm_b9c6
	cp [hl]
	jr z, .asm_b9cf
	jr c, .asm_b9ce
	dec b
	jr .asm_b9cf
.asm_b9ce
	inc b
.asm_b9cf
	call Func_b6d5
	ld a, [wc0c0]
	and a
	jr nz, .asm_b9dd
	ld hl, wc0bb
	set 0, [hl]
.asm_b9dd
	xor a
	ld [wc0c3], a
	ret
.asm_b9e2
	ld a, b
	cpl
	inc a
	ld b, a
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_b9f4
	ld a, [wCamLeftSpacing]
	jr .asm_b9f7
.asm_b9f4
	ld a, [wCamRightSpacing]
.asm_b9f7
	cp [hl]
	jr z, .asm_ba00
	jr c, .asm_b9ff
	inc b
	jr .asm_ba00
.asm_b9ff
	dec b
.asm_ba00
	call Func_b74c
	ld a, [wc0bf]
	and a
	jr nz, .asm_ba0e
	ld hl, wc0bb
	set 1, [hl]
.asm_ba0e
	xor a
	ld [wc0c3], a
	ret
.asm_ba13
	ld a, [wTransformation]
	cp TRANSFORMATION_FLAT_WARIO
	jr nz, .asm_ba1f
	; flat Wario
	ld a, [wJumpVelTable]
	and a
	ret nz
.asm_ba1f
	ld a, [wc0d5]
	inc a
	ld [wc0d5], a
	dec a
	ret z
	ld b, $01
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_ba38
	ld a, [wCamLeftSpacing]
	jr .asm_ba3b
.asm_ba38
	ld a, [wCamRightSpacing]
.asm_ba3b
	cp [hl]
	jr c, .asm_b9cf
	ret z
	jp .asm_ba00
