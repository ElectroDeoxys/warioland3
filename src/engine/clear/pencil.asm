AddPencilSprite:
	ld a, [wSCY]
	ld b, a
	ld a, [hli]
	add OAM_Y_OFS
	sub b
	ld [wCurSprite], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_d65e1
	call AddSprite
	ret

; returns TRUE in a if done movement
DoPencilMovement:
	ld a, [wAllMusicalCoinsLevel]
	cp NUM_LEVELS - 5
	jr nc, .row_4
	cp NUM_LEVELS - 10
	jr nc, .row_3
	cp NUM_LEVELS - 15
	jr nc, .row_2
	cp NUM_LEVELS - 20
	jr nc, .row_1
; row 0
	ld b, a
	ld d, $48
	jr .got_y
.row_1
	sub 5
	ld b, a
	ld d, $50
	jr .got_y
.row_2
	sub 10
	ld b, a
	ld d, $58
	jr .got_y
.row_3
	sub 15
	ld b, a
	ld d, $60
	jr .got_y
.row_4
	sub 20
	ld b, a
	ld d, $68
.got_y
	ld hl, wMenuObj1YCoord
	ld a, [hl] ; y
	cp d
	jr z, .check_column
	; move down
	inc [hl]
	xor a
	ret

.check_column
	dec b
	jr z, .col_1
	dec b
	jr z, .col_2
	dec b
	jr z, .col_3
	dec b
	jr z, .col_4
; col 0
	ld e, $40
	jr .got_x
.col_1
	ld e, $48
	jr .got_x
.col_2
	ld e, $50
	jr .got_x
.col_3
	ld e, $58
	jr .got_x
.col_4
	ld e, $60
.got_x
	ld hl, wMenuObj1XCoord
	ld a, [hl]
	cp e
	jr z, .done_movement
	; move left
	dec [hl]
	xor a
	ret
.done_movement
	ld a, TRUE
	ret

DoPencilScribbling:
	ld a, [wTimer]
	ld e, a
	ld d, $00
	ld hl, PencilScribbleXOffsets
	add hl, de
	ld a, [wMenuObj1YCoord]
	add [hl]
	ld [wMenuObj1YCoord], a
	ld hl, PencilScribbleYOffsets
	add hl, de
	ld a, [wMenuObj1XCoord]
	add [hl]
	ld [wMenuObj1XCoord], a
	ret
