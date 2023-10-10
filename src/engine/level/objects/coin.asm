x = 1

; \1 = movement update state
; \2 = duration
; \3 = y movement table
MACRO move_coin
.Move{u:x}Start:
	ld hl, wCurObjState
	ld a, \1
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, \2
	ld [wCurObjStateDuration], a
.Move{u:x}:
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(\3)
	add LOW(\3)
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .continue_movement_{u:x}
	dec c
	ld a, [bc]
	jr .got_y_vel_{u:x}
.continue_movement_{u:x}
	inc [hl]
.got_y_vel_{u:x}
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative_{u:x}
	add c
	ld [hli], a
	jr nc, :+
	inc [hl]
	jr :+
.negative_{u:x}
	add c
	ld [hli], a
	jr c, :+
	dec [hl]
:

x = x + 1
ENDM

CoinFunc:
	ld a, [wGlobalCounter]
	dec a
	and %111111
	jr nz, .regular_coin
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_COLOUR_COIN
	ld [hli], a

.ColourCoin:
	play_sfx SFX_08E
	ld a, 8
	jr .got_frame
.regular_coin
	ld a, 0 ; can be xor a

.got_frame
	ld [wCurObjFrame], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]

.Update
	ld hl, wCurObjFrameDuration
	ld a, 2
	ld [hli], a
	ld a, [hl] ; state duration
	and a
	jr z, .animate
	ld a, [wGlobalCounter]
	rra
	ret c
.animate
	ld hl, wCurObjVar1
	ld a, [hl]
	cp 150
	jr c, .not_slow
; slow
	ld b, 4
	jr .got_animation_speed
.not_slow
	inc a
	ld [hl], a
	cp 100
	jr c, .not_medium_slow
; medium slow
	ld b, 3
	jr .got_animation_speed
.not_medium_slow
	cp 50
	jr c, .fast
; medium fast
	ld b, 2
	jr .got_animation_speed
.fast
	ld b, 1
.got_animation_speed
	ld l, OBJ_FRAMESET_PTR
	dec [hl]
	jr nz, .state_table
	ld a, b
	ld [hli], a
	dec [hl] ; OBJ_FRAMESET_PTR + 1
	jr nz, .next_frame
	ld b, 8
	ld [hl], b ; OBJ_FRAMESET_PTR + 1
	ld l, OBJ_FRAME
	ld a, [hl]
	sub 7
	ld [hl], a
	jr .state_table
.next_frame
	ld l, OBJ_FRAME
	inc [hl]

.state_table
	ld a, [wCurObjState]
	jumptable

	dw .Move2Start ; $00
	dw .Move5Start ; $01
	dw .Move2 ; $02
	dw .Move5 ; $03
	dw .Move3Start ; $04
	dw .Move6Start ; $05
	dw .Move3 ; $06
	dw .Move6 ; $07
	dw .Move1Start ; $08
	dw .Move4Start ; $09
	dw .Move1 ; $0a
	dw .Move4 ; $0b
	dw .FallLeftStart ; $0c
	dw .FallRightStart ; $0d
	dw .FallLeft ; $0e
	dw .FallRight ; $0f
	dw .State10 ; $10
	dw .State11 ; $11
	dw .State12 ; $12
	dw .State13 ; $13
	dw .State14 ; $14
	dw .State15 ; $15
	dw .State16 ; $16
	dw .State17 ; $17
	dw .State18 ; $18
	dw .Init ; $19
	dw .StartMovement ; $1a

.Init:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, $1a
	ld [hl], a ; OBJ_STATE
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

.StartMovement:
	ld c, $2a
	ld a, [wWarioScreenXPos]
	add c
	ld b, a
	ld a, [wCurObjScreenXPos]
	add c
	sub b
	jr c, .on_left
; on right
	ld a, $07
	ld [wCurObjState], a
	ret
.on_left
	ld a, $06
	ld [wCurObjState], a
	ret

	; move left
	move_coin $0a, 6, Data_60300
	jp .asm_63502
	move_coin $02, 4, Data_602c0
	jr .asm_63502
	move_coin $06, 5, Data_602e0
.asm_63502
	call MoveObjectLeftByVar2
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 4
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .set_fall_right
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $0c
	ld [wCurObjState], a
	ret
.set_fall_right
	ld a, $0d
	ld [wCurObjState], a
	ret

	; move right
	move_coin $0b, 6, Data_60300
	jp .asm_635db
	move_coin $03, 4, Data_602c0
	jr .asm_635db
	move_coin $07, 5, Data_602e0
.asm_635db
	call MoveObjectRightByVar2
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 3
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .set_fall_left
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $0d
	ld [wCurObjState], a
	ret
.set_fall_left
	ld a, $0c
	ld [wCurObjState], a
	ret

.FallLeftStart:
	ld hl, wCurObjState
	ld a, $0e
	ld [hld], a
	dec l
	xor a
	ld [hld], a
.FallLeft:
	call MoveObjectLeftByVar2
	ld l, OBJ_VAR_3
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_6362a
	dec c
	ld a, [bc]
	jr .asm_6362b
.asm_6362a
	inc [hl]
.asm_6362b
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_6363b
	add c
	ld [hli], a
	jr nc, .asm_63640
	inc [hl]
	jr .asm_63640
.asm_6363b
	add c
	ld [hli], a
	jr c, .asm_63640
	dec [hl]
.asm_63640
	ld l, OBJ_Y_POS
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .asm_63680
	ld a, [wc0dd]
	and a
	jr z, .asm_6365d
	ld [wCurObjFramesetOffset], a
.asm_6365d
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 4
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	ret z
	ld a, $0d
	ld [wCurObjState], a
	ret
.asm_63680
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jr z, .asm_63690
	dec [hl]
.asm_63690
	ldh a, [hffa0]
	cp 2
	jr c, .asm_636a4
	cp 3
	jr c, .asm_636aa
	cp 4
	jr c, .asm_636b0
	ld a, $08
	ld [wCurObjState], a
	ret
.asm_636a4
	ld a, $10
	ld [wCurObjState], a
	ret
.asm_636aa
	ld a, $00
	ld [wCurObjState], a
	ret
.asm_636b0
	ld a, $04
	ld [wCurObjState], a
	ret

.FallRightStart:
	ld hl, wCurObjState
	ld a, $0f
	ld [hld], a
	dec l
	xor a
	ld [hld], a
.FallRight:
	call MoveObjectRightByVar2
	ld l, OBJ_VAR_3
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_636d3
	dec c
	ld a, [bc]
	jr .asm_636d4
.asm_636d3
	inc [hl]
.asm_636d4
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_636e4
	add c
	ld [hli], a
	jr nc, .asm_636e9
	inc [hl]
	jr .asm_636e9
.asm_636e4
	add c
	ld [hli], a
	jr c, .asm_636e9
	dec [hl]
.asm_636e9
	ld l, OBJ_Y_POS
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .asm_63729
	ld a, [wc0dd]
	and a
	jr z, .asm_63706
	ld [wCurObjFramesetOffset], a
.asm_63706
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 3
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	ret z
	ld a, $0c
	ld [wCurObjState], a
	ret
.asm_63729
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_VAR_2
	ld a, [hl]
	and a
	jr z, .asm_63739
	dec [hl]
.asm_63739
	ldh a, [hffa0]
	cp 2
	jr c, .asm_6374d
	cp 3
	jr c, .asm_63753
	cp 4
	jr c, .asm_63759
	ld a, $09
	ld [wCurObjState], a
	ret
.asm_6374d
	ld a, $11
	ld [wCurObjState], a
	ret
.asm_63753
	ld a, $01
	ld [wCurObjState], a
	ret
.asm_63759
	ld a, $05
	ld [wCurObjState], a
	ret

.State10:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jr nz, .asm_6376c
	ld a, $12
	ld [wCurObjState], a
	ret
.asm_6376c
	ld a, [wGlobalCounter]
	and %11111
	jr nz, .asm_63774
	dec [hl]
.asm_63774
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	sub 4
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_637dd
	call MoveObjectLeftByVar2
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	cp $10
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ret z
	ld hl, wCurObjXPos
	ld a, [hli]
	sub 4
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	ret nz
	ld hl, wCurObjXPos
	ld a, [hli]
	add 3
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	ret nz
	ld a, $0c
	ld [wCurObjState], a
	ret
.asm_637dd
	ld a, $11
	ld [wCurObjState], a
	ret

.State11:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jr nz, .asm_637f0
	ld a, $12
	ld [wCurObjState], a
	ret
.asm_637f0
	ld a, [wGlobalCounter]
	and %11111
	jr nz, .asm_637f8
	dec [hl]
.asm_637f8
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	add 3
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_63861
	call MoveObjectRightByVar2
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	cp $10
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ret z
	ld hl, wCurObjXPos
	ld a, [hli]
	add 3
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	ret nz
	ld hl, wCurObjXPos
	ld a, [hli]
	sub 4
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	ret nz
	ld a, $0d
	ld [wCurObjState], a
	ret
.asm_63861
	ld a, $10
	ld [wCurObjState], a
	ret

.State12:
	ld a, $13
	ld [wCurObjState], a
	ld a, [wCurObjFramesetOffset]
	and a
	jr nz, .asm_63878
	ld a, 100
	ld [wCurObjStateDuration], a
	ret
.asm_63878
	ld a, 50
	ld [wCurObjStateDuration], a
	ret

.State13:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_6389e
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	ret nz
	ld a, $14
	ld [wCurObjState], a
	ret
.asm_6389e
	ld a, $16
	ld [wCurObjState], a
	ret

.State16:
	ld a, $17
	ld [wCurObjState], a
	ld a, [wCurObjFramesetOffset]
	and a
	jr nz, .asm_638b5
	ld a, 100
	ld [wCurObjStateDuration], a
	ret
.asm_638b5
	ld a, 50
	ld [wCurObjStateDuration], a
	ret

.State17:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .State18
	dec a
	ld [hl], a
	and $03
	ld l, OBJ_FLAGS
	ld a, [hl]
	jr nz, .asm_638d1
	res OBJFLAG_ON_SCREEN_F, a
	set OBJFLAG_INVISIBLE_F, a
	ld [hl], a
	ret
.asm_638d1
	res OBJFLAG_INVISIBLE_F, a
	ld [hl], a
	ret
.State18
	xor a
	ld [wCurObjFlags], a
	ret

.State14:
	ld hl, wCurObjState
	ld a, $15
	ld [hld], a
	dec l
	xor a
	ld [hld], a
.State15:
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, $40
	add $40
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_638f5
	dec c
	ld a, [bc]
	jr .asm_638f6
.asm_638f5
	inc [hl]
.asm_638f6
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_63906
	add c
	ld [hli], a
	jr nc, .asm_6390b
	inc [hl]
	jr .asm_6390b
.asm_63906
	add c
	ld [hli], a
	jr c, .asm_6390b
	dec [hl]
.asm_6390b
	ld l, OBJ_Y_POS
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr z, .asm_6392d
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, $12
	ld [wCurObjState], a
.asm_6392d
	ld a, [wc0dd]
	and a
	ret z
	ld [wCurObjFramesetOffset], a
	ret
