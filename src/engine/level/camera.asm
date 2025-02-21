; input:
; - b = offset for x scroll
ScrollCameraRight:
	xor a
	ld [wScrollRightEdge], a
	ld a, [wRoomRightXLimit]
	dec a
	ld c, a ; wRoomRightXLimit - 1

	; add to camera x scroll
	ld a, [wCameraSCX + 1]
	add b
	ld [wCameraSCX + 1], a
	ld a, [wCameraSCX + 0]
	adc $00
	ld [wCameraSCX + 0], a

	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	; scroll window ranges between [SCRN_VX - SCRN_X, SCRN_VX]
	ld b, SCRN_VX - SCRN_X
	jr z, .check_scroll_limit
	; scroll window ranges between [SCRN_VX - (SCRN_X + $20), SCRN_VX - $20]
	ld b, SCRN_VX - (SCRN_X + CAMERA_BORDER_RIGHT_W)
.check_scroll_limit
	ld a, [wCameraSCX + 0]
	cp c
	jr c, .not_on_limit
	ld a, [wCameraSCX + 1]
	cp b
	jr c, .not_on_limit
	; set x scroll to maximum allowed
	ld a, b
	ld [wCameraSCX + 1], a
	ld a, $1
	ld [wScrollRightEdge], a
	ret

.not_on_limit
	ld a, [wRoomLeftXLimit]
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir left
	ld a, [wCamLeftSpacing]
	jr .got_cam_spacing
.dir_right
	ld a, [wCamRightSpacing]
.got_cam_spacing
	sub 8
	ld c, a ; cam spacing - 8
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	jr z, .check_wario_x
	ld a, c
	add CAMERA_BORDER_LEFT_W
	ld c, a
.check_wario_x
	ld a, [wWarioXPos + 1]
	cp c
	ret nc ; no adjustment needed
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	; scroll window ranges between [0, SCRN_X]
	ld a, 0
	jr z, .got_left_scroll_adjustment
	; scroll window ranges between [$20, SCRN_X + $20]
	ld a, CAMERA_BORDER_LEFT_W
.got_left_scroll_adjustment
	ld [wCameraSCX + 1], a
	ld a, $2
	ld [wScrollRightEdge], a
	ret

; input:
; - b = offset for x scroll
ScrollCameraLeft:
	xor a
	ld [wScrollLeftEdge], a
	ld a, [wRoomLeftXLimit]
	ld c, a ; wRoomLeftXLimit

	; sub to camera x scroll
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
	jr nz, .not_on_limit
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	; scroll window ranges between [0, SCRN_X]
	ld b, $10
	jr z, .check_scroll_limit
	; scroll window ranges between [$20, SCRN_X + $20]
	ld b, CAMERA_BORDER_LEFT_W + $10
.check_scroll_limit
	ld a, l
	cp b
	jr nc, .not_on_limit
	ld a, c
	ld [wCameraSCX + 0], a
	ld a, b
	sub $10
	ld [wCameraSCX + 1], a
	ld a, $1
	ld [wScrollLeftEdge], a
	ret

.not_on_limit
	ld a, [wRoomRightXLimit]
	dec a
	ld c, a
	ld a, [wWarioXPos + 0]
	cp c
	ret nz
	ld a, [wDirection]
	and a
	jr nz, .dir_right
	ld a, [wCamLeftSpacing]
	jr .got_cam_spacing
.dir_right
	ld a, [wCamRightSpacing]
.got_cam_spacing
	ld c, a
	ld a, SCRN_X + 8
	sub c
	ld c, a ; (SCRN_X + 8) - cam spacing
	xor a
	sub c
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	jr z, .check_wario_x
	ld a, c
	sub CAMERA_BORDER_RIGHT_W
	ld c, a
.check_wario_x
	ld a, [wWarioXPos + 1]
	cp c
	ret c ; no adjustment needed
	ld a, $2
	ld [wScrollLeftEdge], a
	ld a, [wRoomRightXLimit]
	dec a
	ld [wCameraSCX + 0], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	; scroll window ranges between [SCRN_VX - SCRN_X, SCRN_VX]
	ld a, SCRN_VX - SCRN_X
	jr z, .got_right_scroll_adjustment
	; scroll window ranges between [SCRN_VX - (SCRN_X + $20), SCRN_VX - $20]
	ld a, SCRN_VX - (SCRN_X + CAMERA_BORDER_RIGHT_W)
.got_right_scroll_adjustment
	ld [wCameraSCX + 1], a
	ret

; input:
; - b = offset for y scroll
ScrollCameraDown:
	ld a, [wRoomLowerYLimit]
	dec a
	ld c, a ; wRoomLowerYLimit - 1

	; add to camera y scroll
	ld a, [wCameraSCY + 1]
	add b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	adc 0
	ld [wCameraSCY + 0], a

	cp c
	jr c, .not_on_limit
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	; scroll window ranges between [SCRN_VY - (SCRN_Y + 8), SCRN_VY - 8]
	ld b, SCRN_VY - (SCRN_Y + 8)
	jr z, .check_scroll_limit
	; scroll window ranges between [SCRN_VY - (SCRN_Y + $28), SCRN_VY - $28]
	ld b, SCRN_VY - (SCRN_Y + CAMERA_BORDER_LOWER_H + 8)
.check_scroll_limit
	ld a, [wCameraSCY + 1]
	cp b
	jr c, .not_on_limit
	; set y scroll to maximum allowed
	ld a, b
	ld [wCameraSCY + 1], a
	ld a, $1
	ld [wScrollDownEdge], a
	ret

.not_on_limit
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc ; = CAM_TRANSITIONS

	; not CAM_TRANSITIONS
	ld a, [wRoomUpperYLimit]
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	jr c, .asm_b836
	ret nz
	ld a, [wPrevWarioScreenYPos]
	sub $10
	ld c, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	jr z, .check_wario_y
	ld a, c
	add CAMERA_BORDER_UPPER_H
	ld c, a
.check_wario_y
	ld a, [wWarioYPos + 1]
	cp c
	ret nc ; no adjustment needed
.asm_b836
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	; scroll window ranges between [0, SCRN_Y]
	ld a, 0
	jr z, .got_upper_scroll_adjustment
	; scroll window ranges between [$20, $20 + SCRN_Y]
	ld a, CAMERA_BORDER_UPPER_H
.got_upper_scroll_adjustment
	ld [wCameraSCY + 1], a
	ld a, [wRoomUpperYLimit]
	ld [wCameraSCY + 0], a
	ld a, $2
	ld [wScrollDownEdge], a
	ret

; input:
; - b = offset for y scroll
ScrollCameraUp:
	ld a, [wRoomUpperYLimit]
	ld c, a ; wRoomUpperYLimit

	; sub to camera y scroll
	ld a, [wCameraSCY + 1]
	sub b
	ld [wCameraSCY + 1], a
	ld a, [wCameraSCY + 0]
	sbc $00
	ld [wCameraSCY + 0], a

	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	; scroll window ranges between [0, SCRN_Y]
	ld b, $10
	jr z, .asm_b86e
	; scroll window ranges between [$20, $20 + SCRN_Y]
	ld b, CAMERA_BORDER_UPPER_H + $10
.asm_b86e
	ld a, [wCameraSCY + 1]
	add $10
	ld l, a
	ld a, [wCameraSCY + 0]
	adc $00
	cp c
	jr c, .set_scroll_to_upper_edge
	jr nz, .not_on_limit
	ld a, l
	cp b
	jr nc, .not_on_limit
.set_scroll_to_upper_edge
	ld a, c
	ld [wCameraSCY + 0], a
	ld a, b
	sub $10
	ld [wCameraSCY + 1], a
	ld a, $1
	ld [wScrollUpEdge], a
	ret

.not_on_limit
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc ; = CAM_TRANSITIONS

	; not CAM_TRANSITIONS
	ld a, [wRoomLowerYLimit]
	dec a
	ld c, a
	ld a, [wWarioYPos + 0]
	cp c
	ret nz
	ld a, [wPrevWarioScreenYPos]
	ld c, a
	ld a, SCRN_Y + $10
	sub c
	ld c, a
	xor a
	sub c
	ld c, a ; -((SCRN_Y + $10) - wPrevWarioScreenYPos)
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	jr z, .asm_b8ba
	ld a, c
	sub CAMERA_BORDER_LOWER_H
	ld c, a
.asm_b8ba
	ld a, [wWarioYPos + 1]
	cp c
	ret c
	ld a, $2
	ld [wScrollUpEdge], a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	; scroll window ranges between [SCRN_VY - (SCRN_Y + 8), SCRN_VY - 8]
	ld a, SCRN_VY - (SCRN_Y + 8)
	jr z, .asm_b8cf
	; scroll window ranges between [SCRN_VY - (SCRN_Y + $28), SCRN_VY - $28]
	ld a, SCRN_VY - (SCRN_Y + CAMERA_BORDER_LOWER_H + 8)
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

LevelScroll_Vertical:
	ld a, [wCameraYDelta]
	ld b, a
	and a
	jr z, .no_y_offset

; there was an offset in Wario's Y coordinate
	xor a
	ld [wc0d4], a
	bit 7, b
	jr nz, .up_movement

; down movement
	ld hl, wWarioScreenYPos
	ld a, [wPrevWarioScreenYPos]
	cp [hl]
	jr nc, .scroll_down
	; wWarioScreenYPos > wPrevWarioScreenYPos
	; below last Wario's screen Y position
	inc b
.scroll_down
	call ScrollCameraDown
	ld a, [wScrollDownEdge]
	and a
	jr nz, .asm_b93c
	ld hl, wc0bb
	set 3, [hl]
.asm_b93c
	xor a
	ld [wCameraYDelta], a
	ret

.up_movement
	ld a, b
	cpl
	inc a
	ld b, a
	; b is now abs(wCameraYDelta)

	ld hl, wWarioScreenYPos
	ld a, [wPrevWarioScreenYPos]
	cp [hl]
	jr c, .scroll_up
	jr z, .scroll_up
	; wPrevWarioScreenYPos > wWarioScreenYPos
	inc b
.scroll_up
	call ScrollCameraUp
	ld a, [wScrollUpEdge]
	and a
	jr nz, .edge_reached_u
	ld hl, wc0bb
	set 2, [hl]
.edge_reached_u
	xor a
	ld [wCameraYDelta], a
	ret

.no_y_offset
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
	ret z ; return if wc0d4 == 1

	ld hl, wWarioScreenYPos
	ld a, [wPrevWarioScreenYPos]
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
	cp 8
	ret c ; offset < 8
	ld b, 7
.on_slope
	ld a, [wPrevWarioScreenYPos]
	cp [hl]
	jr c, .scroll_down
	ret z
	jp .scroll_up

LevelScroll_Horizontal:
	ld a, [wCameraXDelta]
	ld b, a
	and a
	jr z, .no_x_offset

; there was an offset in Wario's X coordinate
	xor a
	ld [wc0d5], a
	bit 7, b
	jr nz, .left_movement

; right movement
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .dir_right_r
	; left direction
	ld a, [wCamLeftSpacing]
	jr .got_cam_spacing_r
.dir_right_r
	; right direction
	ld a, [wCamRightSpacing]
.got_cam_spacing_r
	cp [hl]
	jr z, .scroll_right
	jr c, .asm_b9ce
	; x pos < cam spacing
	dec b
	jr .scroll_right
.asm_b9ce
	; x pos > cam spacing
	inc b
.scroll_right
	call ScrollCameraRight
	ld a, [wScrollRightEdge]
	and a
	jr nz, .edge_reached_r
	ld hl, wc0bb
	set 0, [hl]
.edge_reached_r
	xor a
	ld [wCameraXDelta], a
	ret

.left_movement
	ld a, b
	cpl
	inc a
	ld b, a
	; b is now abs(wCameraXDelta)

	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .dir_right_l
	; left direction
	ld a, [wCamLeftSpacing]
	jr .got_cam_spacing_l
.dir_right_l
	; right direction
	ld a, [wCamRightSpacing]
.got_cam_spacing_l
	cp [hl]
	jr z, .scroll_left
	jr c, .asm_b9ff
	; x pos < cam spacing
	inc b
	jr .scroll_left
.asm_b9ff
	; x pos > cam spacing
	dec b
.scroll_left
	call ScrollCameraLeft
	ld a, [wScrollLeftEdge]
	and a
	jr nz, .edge_reached_l
	ld hl, wc0bb
	set 1, [hl]
.edge_reached_l
	xor a
	ld [wCameraXDelta], a
	ret

.no_x_offset
	ld a, [wTransformation]
	cp TRANSFORMATION_FLAT_WARIO
	jr nz, .not_flat
	; flat Wario
	ld a, [wJumpVelTable]
	and a
	ret nz ; is jumping
.not_flat
	ld a, [wc0d5]
	inc a
	ld [wc0d5], a
	dec a
	ret z ; return if wc0d5 == 1

	ld b, 1
	ld hl, wWarioScreenXPos
	ld a, [wDirection]
	and a
	jr nz, .asm_ba38
	ld a, [wCamLeftSpacing]
	jr .asm_ba3b
.asm_ba38
	ld a, [wCamRightSpacing]
.asm_ba3b
	cp [hl] ; wWarioScreenXPos
	jr c, .scroll_right
	ret z
	jp .scroll_left
