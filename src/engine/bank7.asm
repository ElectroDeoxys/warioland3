Func_1c000: ; 1c000 (7:4000)
	ld hl, wcac2
	ld a, [hl]
	and a
	jr z, .asm_1c008
	dec [hl]
.asm_1c008
	call Func_1f6dc
	call Func_1f64a
	ld a, [wWarioState]
	cp $30
	jr c, .asm_1c04d
	cp $60
	jr c, .asm_1c03d
	cp $b0
	jr c, .asm_1c02d
	farcall Func_1ec000
	ret

.asm_1c02d
	farcall Func_28000
	ret

.asm_1c03d
	farcall Func_19c1b
	ret

.asm_1c04d
	jumptable

	dw UpdateState_Idling ; ST_IDLING
	dw $41ab ; ST_WALKING
	dw $4244 ; ST_TURNING
	dw Func_156d ; ST_UNKNOWN_03
	dw $4369 ; ST_AIRBORNE
	dw $46ed ; ST_LANDING
	dw $47c3 ; ST_CROUCH_SLIDING
	dw $48df ; ST_ATTACKING
	dw $4bb9 ; ST_ATTACKING_AIRBORNE
	dw $4caf ; ST_ATTACK_KNOCK_BACK
	dw $4e42 ; ST_DIVING
	dw $4f53 ; ST_SUBMERGING
	dw $5008 ; ST_WATER_SURFACE_IDLING
	dw $50ba ; ST_WATER_SURFACE_MOVING
	dw $5297 ; ST_UNKNOWN_0E
	dw $5354 ; ST_UNKNOWN_0F
	dw $5395 ; ST_UNKNOWN_10
	dw $5455 ; ST_UNKNOWN_11
	dw $546d ; ST_CROUCHING
	dw $54a7 ; ST_CROUCH_WALKING
	dw $5522 ; ST_UNKNOWN_14
	dw $5627 ; ST_STUNG
	dw $5766 ; ST_UNKNOWN_16
	dw $57c1 ; ST_UNKNOWN_17
	dw $580d ; ST_UNKNOWN_18
	dw $585c ; ST_UNKNOWN_19
	dw $58f8 ; ST_UNKNOWN_1A
	dw Func_156d ; ST_UNKNOWN_1B
	dw Func_156d ; ST_UNKNOWN_1C
	dw Func_156d ; ST_UNKNOWN_1D
	dw $5916 ; ST_UNKNOWN_1E
	dw $5943 ; ST_UNKNOWN_1F
	dw $5995 ; ST_UNKNOWN_20
	dw $5a4f ; ST_UNKNOWN_21
	dw $5cfc ; ST_UNKNOWN_22
	dw $5d7f ; ST_UNKNOWN_23
	dw $5e88 ; ST_UNKNOWN_24
	dw $5eaa ; ST_UNKNOWN_25
	dw $5ecc ; ST_UNKNOWN_26
	dw $5fd4 ; ST_SLIDING
	dw $609d ; ST_ROLLING
	dw $61e9 ; ST_UNKNOWN_29
	dw $62c5 ; ST_UNKNOWN_2A
	dw $6347 ; ST_UNKNOWN_2B
	dw $63e8 ; ST_ENTERING_DOOR
	dw Func_156d ; ST_UNKNOWN_2D
	dw Func_156d ; ST_UNKNOWN_2E
	dw Func_156d ; ST_UNKNOWN_2F
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
; 1c0b6

UpdateState_Idling: ; 1c0b6 (7:40b6)
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	ld a, b
	and a
	jp z, Func_1c2ae

	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1c115

; pressing down, handle what state to change to
	farcall Func_19b12
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	ld a, [wLadderInteraction]
	cp $02
	jp nz, Func_1e855
	farcall SetState_LadderClimbing
	ret

.asm_1c115
	ld a, $05
	ldh [hCallFuncBank], a
	call_hram Func_e53

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr z, .skip_ladder
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .skip_ladder
	farcall SetState_LadderClimbing
	ret
.skip_ladder
	ld a, [wc1c8]
	and a
	jr z, .asm_1c174
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_1c174
	farcall Func_1ae68
	ret

.asm_1c174
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling
	call HandleInput_Idling
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz ; not idling

; still idling, increment idle counter
	ld a, [wcac9]
	and a
	ret nz
	ld a, [wIdleCounter]
	add 1
	ld [wIdleCounter], a
	ld a, [wIdleCycles]
	adc 0
	ld [wIdleCycles], a
; if the idle cycles reaches a certain value
; then change the state to sleeping
	cp NUM_SLEEPING_IDLE_CYCLES
	ret c
	farcall SetState_Sleeping
	ret
; 0x1c1ab

Func_1c1ab: ; 1c1ab (7:41ab)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1c1c2
	ld a, $24
	ld [wceed], a
	load_sound SFX_04
.asm_1c1c2
	ld a, $05
	ldh [hCallFuncBank], a
	call_hram Func_e53

	ld a, [wc1a8]
	and a
	jr z, .asm_1c1f9
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld b, $04
	farcall Func_c9f3
.asm_1c1f9
	call HandleInput_Walking
	ld a, [wWarioState]
	cp ST_WALKING
	ret nz ; return if not walking anymore
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWarioState]
	cp ST_WALKING
	ret nz ; return if not walking anymore
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_WALKING
	ret nz ; return if not walking anymore
	ld a, b
	and a
	jp z, Func_1c2ae
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x1c244

	INCROM $1c244, $1c2ae

Func_1c2ae: ; 1c2ae (7:42ae)
	xor a
	ld [wca77], a
	ld a, $18
	ld [wca75], a
	jr StartJump

StartJump_FromInput: ; 1c2b9 (7:42b9)
	load_sound SFX_01
	xor a
	ld [wca75], a
	ld [wca96], a
	ld a, $01
	ld [wca77], a
;	fallthrough

StartJump: ; 1c2cd (7:42cd)
	ld a, [wca3c]
	cp $07
	ld a, $02
	jr c, .asm_1c2df
	ld hl, wJoypadDown
	bit D_UP_F, [hl]
	jr z, .asm_1c2df
	ld a, $03
.asm_1c2df
	ld [wca74], a
	xor a
	ld [wc189], a
	ld a, ST_AIRBORNE
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca8b], a
	ld [wca89], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $59
	ld [wca7f + 0], a
	ld a, $55
	ld [wca7f + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1c345
	ld a, HIGH(Frameset_15f94)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f94)
	ld [wFramesetPtr + 1], a
	jr .asm_1c34f
.asm_1c345
	ld a, HIGH(Frameset_15f97)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f97)
	ld [wFramesetPtr + 1], a
.asm_1c34f
	ld a, BANK(Frameset_15f97)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ld a, [wcac9]
	and a
	ret z
	ld b, $02
	call Func_129e
	ret
; 0x1c369

	INCROM $1c369, $1def1

SetState_Sliding: ; 1def1 (7:5ef1)
	ld a, ST_SLIDING
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wca8b], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca86], a
	ld [wca9a], a
	ld a, $01
	ld [wca9d], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $09
	ld [wca7b], a
	ld a, $50
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $64
	ld [wca7f + 0], a
	ld a, $4a
	ld [wca7f + 1], a
	ld a, [wc189]
	bit 1, a
	jr nz, .asm_1df8b
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add $0c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $06
	farcall Func_c9f3

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, $67
	ld [wFramesetPtr + 0], a
	ld a, $08
	ld [wFramesetPtr + 1], a
	jr .asm_1dfc4
.asm_1df8b
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $05
	farcall Func_c9f3

	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, HIGH(Frameset_1671d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1671d)
	ld [wFramesetPtr + 1], a
.asm_1dfc4
	ld a, BANK(Frameset_1671d)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1dfd4

	INCROM $1dfd4, $1e68a

HandleInput_Idling: ; 1e68a (7:668a)
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right_1
	bit D_LEFT_F, a
	jr nz, .d_left_1
	ret

.d_right_1
	ld a, [wDirection]
	and a
	jr nz, .no_turning
	jp SetState_Turning
.d_left_1
	ld a, [wDirection]
	and a
	jr z, .no_turning
	jp SetState_Turning
.no_turning

; set walking state
	xor a
	ld [wca86], a
	ld a, ST_WALKING
	ld [wWarioState], a
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right_2
	bit D_LEFT_F, a
	jr nz, .d_left_2
	jr .ok
.d_right_2
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .ok
.d_left_2
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.ok
	xor a
	ld [wceed], a
	ld [wca75], a
	ld [wca74], a
	ld [wca96], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $42
	ld [wca7f + 0], a
	ld a, $6c
	ld [wca7f + 1], a

	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	ld a, HIGH(Frameset_149b4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149b4)
	ld [wFramesetPtr + 1], a
	jr .got_frameset
.dir_right
	ld a, HIGH(Frameset_149c5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_149c5)
	ld [wFramesetPtr + 1], a
.got_frameset
	ld a, BANK(Frameset_149c5)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1e73e

SetState_Turning: ; 1e73e (7:673e)
	ld a, ST_TURNING
	ld [wWarioState], a
	xor a
	ld [wca89], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca75], a
	ld [wca74], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $4a
	ld [wca7f + 0], a
	ld a, $82
	ld [wca7f + 1], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1e791
	ld a, HIGH(Frameset_14cbe)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cbe)
	ld [wFramesetPtr + 1], a
	jr .asm_1e79b
.asm_1e791
	ld a, HIGH(Frameset_14cc5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cc5)
	ld [wFramesetPtr + 1], a
.asm_1e79b
	ld a, BANK(Frameset_14cc5)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1e7ab

SetState_Attacking: ; 1e7ab (7:67ab)
	ld a, $30
	ld [wca89], a
	xor a
	ld [wceed], a
	ld a, ST_ATTACKING
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca75], a
	ld [wca74], a
	ld [wca8b], a
	ld a, $05
	ld [wca7e], a
	ld a, $4d
	ld [wca7f + 0], a
	ld a, $1b
	ld [wca7f + 1], a
	ld a, $04
	ld [wca7b], a
	ld a, $58
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, [wca3c]
	cp $05
	jr nc, .asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e81d
	ld a, HIGH(Frameset_151e4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_151e4)
	ld [wFramesetPtr + 1], a
	jr .asm_1e845
.asm_1e81d
	ld a, HIGH(Frameset_151fd)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_151fd)
	ld [wFramesetPtr + 1], a
	jr .asm_1e845
.asm_1e829
	ld a, [wDirection]
	and a
	jr nz, .asm_1e83b
	ld a, HIGH(Frameset_1521c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1521c)
	ld [wFramesetPtr + 1], a
	jr .asm_1e845
.asm_1e83b
	ld a, HIGH(Frameset_1522d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1522d)
	ld [wFramesetPtr + 1], a
.asm_1e845
	ld a, BANK(Frameset_1522d)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1e855

Func_1e855: ; 1e855 (7:6855)
	ld a, [wc189]
	and a
	jp nz, SetState_Sliding
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, ST_CROUCHING
	ld [wWarioState], a
	xor a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca86], a
	ld [wca74], a
	ld [wca75], a
	ld a, $01
	ld [wca8b], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_CrouchWalking

	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $42
	ld [wca7f + 0], a
	ld a, $6c
	ld [wca7f + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1e8d3
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .asm_1e8dd
.asm_1e8d3
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
.asm_1e8dd
	ld a, BANK(Frameset_14a3b)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1e8ed

HandleInput_Walking: ; 1e8ed (7:68ed)
	ld a, [wca77]
	and a
	jr nz, .skip_jump
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput
.skip_jump

	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetState_Attacking
	bit A_BUTTON_F, a
	jp nz, StartJump_FromInput

	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jr .asm_1e970

.d_right
	ld a, [wDirection]
	and a
	jp z, SetState_Turning
	ld a, $01
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e
	call Func_1259
.asm_1e93d
	ld a, [wca86]
	cp $10
	jr c, .asm_1e949
	ld a, $0c
	ld [wca86], a
.asm_1e949
	ret

.d_left
	ld a, [wDirection]
	and a
	jp nz, SetState_Turning
	ld a, $00
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e.asm_153f
	call Func_1270
	jr .asm_1e93d

.asm_1e970
	call Func_1700
	jr z, Func_1e99b
	farcall Func_19c81
	ret

.d_down
	call Func_1700
	jp z, Func_1e855
	farcall Func_19e7f
	ret

Func_1e99b: ; 1e99b (7:699b)
	xor a
	ld [wca86], a
	ld a, ST_IDLING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wca75], a
	ld [wca74], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca96], a
	ld [wca8b], a
	ld [wca89], a
	ld [wca9a], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a

	farcall Func_1996e
	ld a, [wWarioState]
	cp ST_IDLING
	ret nz
	ld a, b
	and a
	jp nz, Func_1e855
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $40
	ld [wca7f + 0], a
	ld a, $00
	ld [wca7f + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ea24
	ld a, HIGH(Frameset_14252)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14252)
	ld [wFramesetPtr + 1], a
	jr .asm_1ea2e
.asm_1ea24
	ld a, HIGH(Frameset_1425f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1425f)
	ld [wFramesetPtr + 1], a
.asm_1ea2e
	ld a, BANK(Frameset_1425f)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1ea3e

	INCROM $1ea3e, $1eb94

SetState_CrouchWalking: ; 1eb94 (7:6b94)
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, ST_CROUCH_WALKING
	ld [wWarioState], a
	ld a, $01
	ld [wca8b], a
	xor a
	ld [wceed], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca89], a
	ld [wca9a], a
	ld [wceed], a

	ld a, $05
	ld [wca7e], a
	ld a, $42
	ld [wca7f + 0], a
	ld a, $6c
	ld [wca7f + 1], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, [wDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_1ec0d
	ld a, HIGH(Frameset_14a26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a26)
	ld [wFramesetPtr + 1], a
.asm_1ebfd
	ld a, BANK(Frameset_14a26)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
.asm_1ec0d
	ld a, HIGH(Frameset_14a2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a2f)
	ld [wFramesetPtr + 1], a
	jr .asm_1ebfd
; 0x1ec19

	INCROM $1ec19, $1f64a

Func_1f64a: ; 1f64a (7:764a)
	ld a, [wca8c]
	and a
	ret z
	cp $16
	jr nc, .asm_1f68b
	cp $10
	jr nc, .asm_1f67c

	ld a, [wWarioState]
	cp ST_STUNG
	jr z, .asm_1f67b
	cp ST_UNKNOWN_16
	jr z, .asm_1f67b

	ld a, $10
	ld [wca8c], a
	ld a, [wca79 + 0]
	cp $48
	jr nz, .asm_1f67b
	ld a, [wca79 + 1]
	cp $10
	jr nz, .asm_1f67b

	ld hl, Pals_c800
	call Func_1af6
.asm_1f67b
	ret

.asm_1f67c
	ld a, [wc08f]
	and $03
	ret nz
	ld a, [wca8c]
	inc a
	ld [wca8c], a
	jr .asm_1f6b9

.asm_1f68b
	ld a, [wc08f]
	and $01
	ret nz
	ld a, [wca8c]
	inc a
	ld [wca8c], a
	cp $28
	jr c, .asm_1f6b9
	xor a
	ld [wca8c], a
	ld [wca8d], a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT | D_DOWN
	ret nz

	farcall Func_1996e
	ret

.asm_1f6b9
	ld a, [wca8d]
	xor $01
	ld [wca8d], a
	ret
; 0x1f6c2

	INCROM $1f6c2, $1f6dc

Func_1f6dc: ; 1f6dc (7:76dc)
	ld a, [wced4]
	and a
	ret nz

	ld hl, wca97
	ld a, [hl]
	and a
	jr z, .asm_1f726
	cp $10
	jr c, .asm_1f72b
	ld a, [wca99]
	and a
	jr nz, .asm_1f72b
	ld a, [wca98]
	and a
	jr nz, .asm_1f72b
	ld a, [wca74]
	and a
	jr nz, .asm_1f72b
	ld a, [wc0db]
	and a
	jr nz, .asm_1f72b
	ld a, [wca8e]
	and a
	jr nz, .asm_1f72b
	ld a, [wc0d7]
	and a
	jr nz, .asm_1f72b
	ld a, [wca8a]
	and a
	jr nz, .asm_1f72b
	ld a, [wcac9]
	and a
	jr nz, .asm_1f72b
	ld a, [wWarioState]
	cp ST_UNKNOWN_2B
	jr z, .asm_1f72b
	jr .asm_1f73c
	ret ; unnecessary

.asm_1f726
	xor a
	ld [wca98], a
	ret

.asm_1f72b
	dec [hl]
	ld a, [hl]
	and $02
	jr nz, .asm_1f736
	xor a
	ld [wc0bc], a
	ret

.asm_1f736
	ld a, $02
	ld [wc0bc], a
	ret

.asm_1f73c
	ld a, [wWarioState]
	cp ST_LADDER_CLIMBING
	jp z, Func_1f7e6
	cp ST_LADDER_IDLING
	jp z, Func_1f7e6
	cp ST_LADDER_SCRATCHING
	jp z, Func_1f7e6
	ld a, ST_UNKNOWN_2B
	ld [wWarioState], a
	xor a
	ld [wca75], a
	ld [wca74], a
	ld [wca89], a
	ld [wca9d], a
	ld [wca9a], a
	ld a, $f1
	ld [wca6f], a
	ld a, [wca8b]
	and a
	jr nz, .asm_1f77d
	ld a, $e5
	ld [wca6f], a
	ld a, $0a
	ld [wca75], a
	ld a, $01
	ld [wca74], a
.asm_1f77d
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a

	xor a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $59
	ld [wca7f + 0], a
	ld a, $55
	ld [wca7f + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1f7cc
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .asm_1f7d6
.asm_1f7cc
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.asm_1f7d6
	ld a, BANK(Frameset_15f7f)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1f7e6

Func_1f7e6: ; 1f7e6 (7:77e6)
	ld a, ST_UNKNOWN_3C
	ld [wWarioState], a
	load_sound SFX_0c
	xor a
	ld [wceed], a
	ld [wIdleCounter], a
	ld [wIdleCycles], a
	ld [wca99], a
	inc a
	ld [wca74], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, HIGH(Frameset_15948)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15948)
	ld [wFramesetPtr + 1], a
	ld a, BANK(Frameset_15948)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1f825

	INCROM $1f825, $20000
