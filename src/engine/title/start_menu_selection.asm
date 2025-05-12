HandleStartMenuSelection:
	ld a, [wStartMenuSelection]
	bit STARTMENUF_SCROLLING_F, a
	jp nz, .MoveVertical
	bit STARTMENUF_ANIM1_F, a
	jp nz, .UpdateAnim1
	bit STARTMENUF_ANIM2_F, a
	jp nz, .UpdateAnim2

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.a_btn
	play_sfx SFX_SELECTION
	ld hl, wStartMenuSelection
	ld a, [hl]
	and $f
	cp STARTMENU_CLEAR_DATA_NO
	jr z, .clear_data_no
	cp STARTMENU_CLEAR_DATA_YES
	jr z, .clea_data_yes
	set STARTMENUF_ANIM2_F, [hl]
	xor a
	ld [wMenuObj1FramesetOffset], a
	ret
.clear_data_no
	ld bc, Frameset_6cf2
	ld a, $23
	jr .update_obj
.clea_data_yes
	ld bc, Frameset_6d05
	ld a, $24
	jr .update_obj

.d_down
	ld a, [wStartMenuSelection]
	cp STARTMENU_CONTINUE
	ret nz
	ld a, STARTMENU_CLEAR_DATA | STARTMENUF_SCROLLING
	ld [wStartMenuSelection], a
	jr .play_scrolling_sfx

.d_up
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA
	ret nz
	ld a, STARTMENU_CONTINUE | STARTMENUF_SCROLLING
	ld [wStartMenuSelection], a

.play_scrolling_sfx
	play_sfx SFX_0E2
	ret

.d_left
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA_NO
	ret nz
	call .play_scrolling_sfx
	ld bc, Frameset_6cef
	ld a, STARTMENU_CLEAR_DATA_YES
	jr .update_obj

.d_right
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA_YES
	ret nz
	call .play_scrolling_sfx
	ld bc, Frameset_6cec
	ld a, STARTMENU_CLEAR_DATA_NO

.update_obj
	ld [wStartMenuSelection], a
	ld hl, wMenuObj1FramesetOffset
	xor a
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	call UpdateObjAnim
	ret

.MoveVertical:
	ld a, [wStartMenuSelection]
	cp STARTMENU_CLEAR_DATA | STARTMENUF_SCROLLING
	jr z, .move_up

; move down
	ld hl, wMenuObj1YCoord
	inc [hl]
	ld a, [hl]
	cp 130
	ret nz
	ld a, 134
	ld [wMenuObj2YCoord], a
	jr .reset_move_vertical_flag

.move_up
	ld hl, wMenuObj1YCoord
	dec [hl]
	ld a, [hl]
	cp 116
	ret nz
	ld a, 118
	ld [wMenuObj2YCoord], a

.reset_move_vertical_flag
	ld hl, wStartMenuSelection
	res STARTMENUF_SCROLLING_F, [hl]
	ret

.UpdateAnim1:
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld a, [wObjAnimWasReset]
	and a
	ret z

.set_select_flag
	ld hl, wStartMenuSelection
	set STARTMENUF_SELECT_F, [hl]
	xor a
	ld [wMenuObj1FramesetOffset], a
	ret

.UpdateAnim2:
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld hl, wMenuObj1FramesetOffset
	ld a, [hl]
	cp $10
	jr z, .set_select_flag
	inc [hl]
	and $03
	jr z, .asm_4cb2
	dec a
	jr z, .asm_4caf
	dec a
	jr z, .asm_4cb6
.asm_4caf
	xor a
	jr .asm_4cb8
.asm_4cb2
	ld a, $03
	jr .asm_4cb8
.asm_4cb6
	ld a, $01
.asm_4cb8
	dec l
	ld [hl], a
	ret
