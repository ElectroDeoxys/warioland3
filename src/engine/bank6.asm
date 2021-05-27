Func_18000: ; 18000 (6:4000)
	xor a
	ld [wc0dd], a
	ld a, [wFloorNum]
	sramswitch
	ld hl, wYCell
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, wPermissionMap
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 0x18020

Func_18020: ; 18020 (6:4020)
	xor a ; SRAM0
	sramswitch
	xor a
	ld [wc0d8], a
	ld [wc0d9], a
	ld [wc18d], a
	ret
; 0x18032

	INCROM $18032, $19734

Func_19734: ; 19734 (6:5734)
	ld a, $01
	ld [wc0d8], a
	ld a, [wDirection]
	and a
	jr z, Func_197b6
	jr Func_19746

Func_19741: ; 19741 (6:5741)
	ld a, $01
	ld [wc0d8], a
;	fallthrough

Func_19746: ; 19746 (6:5746)
	ld a, [wca8e]
	cp $42
	jr z, .asm_19774
	ld a, [wca72]
	sub $01
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $07
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_19799

.asm_19774
	ld a, [wca72]
	sub $01
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $01
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_19799
	ldh a, [hYPosLo]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jp z, Func_19832
	ld a, [wca89]
	and a
	jp nz, Func_19823
	ld a, b
	ret

Func_197b1: ; 197b1 (6:57b1)
	ld a, $01
	ld [wc0d8], a
;	fallthrough

Func_197b6: ; 197b6 (6:57b6)
	ld a, [wca8e]
	cp $42
	jr z, .asm_197e6
	ld a, [wca71]
	cpl
	inc a
	sub $01
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $07
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_1980d

.asm_197e6
	ld a, [wca71]
	cpl
	inc a
	sub $01
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $01
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_1980d
	ldh a, [hYPosLo]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jr z, Func_19832
	ld a, [wca89]
	and a
	jr nz, Func_19823
	ld a, b
	ret

Func_19823: ; 19823 (6:5823)
	ld a, $01
	ld [wc0d8], a
	call Func_19bd3
	ld a, $01
	ld [wc18d], a
	ld b, a
	ret

Func_19832: ; 19832 (6:5832)
	ld a, [wca8b]
	and a
	jp nz, .asm_198c1
	ld a, [wca6f]
	ld b, a
	ld a, [wYPosLo]
	add b
	add $02
	and $f0
	ld b, a
	ld a, [wc0dc]
	cp b
	jp z, .asm_198c1
	ld a, $01
	ld [wc0d8], a
	call Func_19bd3
	and $0f
	ret z
	ld a, [wJumpVelTable]
	and a
	jp nz, .asm_198c0
	ld a, [wca89]
	and a
	jr nz, .asm_198c0
	ld a, [wWaterInteraction]
	and a
	jr nz, .asm_198c0
	ld a, [wca8b]
	and a
	jr nz, .asm_198c0
	ld a, [wcac9]
	and a
	jr nz, .asm_198c0
	ld a, [wca8e]
	and a
	jr nz, .asm_198c0
	ld a, [wIsInSand]
	and a
	jr nz, .asm_198c0

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_198aa
	bit D_LEFT_F, a
	jr nz, .asm_19894
	ld a, [wDirection]
	and a
	jr nz, .asm_198aa
.asm_19894
	ld b, $02
	call SubXOffset
	farcall Func_1e855
	jr .asm_198c1
.asm_198aa
	ld b, $02
	call AddXOffset
	farcall Func_1e855
	jr .asm_198c1

.asm_198c0
	ret

.asm_198c1
	xor a
	ld [wc18d], a
	ld b, a
	ret
; 0x198c7

; resets wIsStandingOnSlope
; copies wYPosHi to hYPosHi
Func_198c7: ; 198c7 (6:58c7)
	xor a
	ld [wIsStandingOnSlope], a
	get_pos
	call Func_19b51
	ret
; 0x198e0

Func_198e0: ; 198e0 (6:58e0)
	ld a, $01
	ld [wced3], a
	call Func_198c7
	and a
	ret nz

	xor a
	ld [wced3], a

	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b8b
	and a
	ret nz
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b8b
	and a
	ret nz
	ld a, [wcac9]
	and a
	ret z
	ld b, a
	get_pos_y
	ld a, $01
	ret
; 0x19942

Func_19942: ; 19942 (6:5942)
	ld a, [wca8e]
	cp $07
	jr z, .asm_1994e
	ld a, $01
	ld [wc0d8], a
.asm_1994e
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19beb
	ret
; 0x1996e

Func_1996e: ; 1996e (6:596e)
	ld a, $01
	ld [wced2], a
	call Func_19942
	and a
	ret nz
	xor a
	ld [wced2], a
	ld a, [wca8e]
	cp $07
	jr z, .asm_19988
	ld a, $01
	ld [wc0d8], a
.asm_19988
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	and a
	ret nz
	ld a, [wca8e]
	cp $07
	jr z, .asm_199c0
	ld a, $01
	ld [wc0d8], a
.asm_199c0
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	ret
; 0x199e9

Func_199e9: ; 199e9 (6:59e9)
	call Func_19a53
	and a
	ret nz
	ld a, [wIsSmashAttacking]
	and a
	jr z, .asm_199f9
	ld a, $01
	ld [wc0d8], a
.asm_199f9
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19bfb
	and a
	ret nz
	ld a, [wcac9]
	and a
	jr z, .asm_19a22
	ld b, a
	ret
.asm_19a22
	ld a, [wIsSmashAttacking]
	and a
	jr z, .asm_19a2d
	ld a, $01
	ld [wc0d8], a
.asm_19a2d
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19bfb
	and a
	ret nz
	ld a, [wcac9]
	and a
	ret z
	ld b, a
	ret
; 0x19a53

Func_19a53: ; 19a53 (6:5a53)
	xor a
	ld [wIsStandingOnSlope], a
	ld a, [wIsSmashAttacking]
	and a
	jr z, .asm_19a62
	ld a, $01
	ld [wc0d8], a
.asm_19a62
	get_pos
	call Func_19b7b
	ret
; 0x19a77

Func_19a77: ; 19a77 (6:5a77)
	xor a
	ld [wc1ca], a
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b3a
	and a
	jr z, .asm_19aa2
	ld a, [wc1ca]
	and a
	ret z

.asm_19aa2
	xor a
	ld [wc1ca], a
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b3a
	and a
	jr z, .asm_19ac7
	ret
.asm_19ac7
	ld a, $01
	ld [wc1ca], a
	ret
; 0x19acd

Func_19acd: ; 19acd (6:5acd)
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a
; 0x19ae4

Func_19ae4: ; 19ae4 (6:5ae4)
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $1a
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

Func_19afb: ; 19afb (6:5afb)
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $18
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

Func_19b12: ; 19b12 (6:5b12)
	get_pos
	jr Func_19b3a

Func_19b25: ; 19b25 (6:5b25)
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $04
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
;	fallthrough

Func_19b3a: ; 19b3a (6:5b3a)
	xor a
	ld [wWaterInteraction], a
	ld [wLadderInteraction], a
	ld [wc0d7], a
	ld [wIsInSand], a
	ld [wIsNearFence], a
	ld [wc1c9], a
	call Func_19c0b
	ret
; 0x19b51

Func_19b51: ; 19b51 (6:5b51)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 0
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b61

	INCROM $19b61, $19b7b

Func_19b7b: ; 19b7b (6:5b7b)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 1
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b8b

Func_19b8b: ; 19b8b (6:5b8b)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 2
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b9b

Func_19b9b: ; 19b9b (6:5b9b)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 3
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bab

	INCROM $19bab, $19bc3

Func_19bc3: ; 19bc3 (6:5bc3)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 4
	ld [wc0d6], a
;	fallthrough

Func_19bce: ; 19bce (6:5bce)
	call Func_18000
	ld b, a
	ret
; 0x19bd3

Func_19bd3: ; 19bd3 (6:5bd3)
	ld hl, wYCell
	dec [hl]
	ld a, [hl]
	cp $a0 - 1
	jr nz, .asm_19be6
	ld a, [wFloorNum]
	dec a
	ld [wFloorNum], a
	ld a, $c0 - 1
	ld [hl], a

.asm_19be6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	jr Func_19bce
; 0x19beb

Func_19beb: ; 19beb (6:5beb)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 5
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bfb

Func_19bfb: ; 19bfb (6:5bfb)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 6
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19c0b

Func_19c0b: ; 19c0b (6:5c0b)
	ld hl, hPos
	call Func_bdb
	ld a, 1 << 7
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19c1b

Func_19c1b: ; 19c1b (6:5c1b)
	ld a, [wWarioState]
	sub $30
	jumptable

	dw UpdateState_Slipping              ; ST_SLIPPING
	dw UpdateState_CrouchSlipping        ; ST_CROUCH_SLIPPING
	dw UpdateState_DraggedDown           ; ST_DRAGGED_DOWN
	dw UpdateState_Teleporting           ; ST_TELEPORTING
	dw $60b4                             ; ST_UNKNOWN_34
	dw UpdateState_SandFalling           ; ST_SAND_FALLING
	dw UpdateState_SandJumping           ; ST_SAND_JUMPING
	dw UpdateState_SandIdling            ; ST_SAND_IDLING
	dw UpdateState_SandWalking           ; ST_SAND_WALKING
	dw UpdateState_SandTurning           ; ST_SAND_TURNING
	dw UpdateState_LadderClimbing        ; ST_LADDER_CLIMBING
	dw UpdateState_LadderIdling          ; ST_LADDER_IDLING
	dw UpdateState_LadderShakeSlipping   ; ST_LADDER_SHAKE_SLIDING
	dw UpdateState_GettingOffLadder      ; ST_GETTING_OFF_LADDER
	dw UpdateState_LadderSliding         ; ST_LADDER_SLIDING
	dw UpdateState_GrabSlipping          ; ST_GRAB_SLIPPING
	dw $689e                             ; ST_UNKNOWN_40
	dw $68ff                             ; ST_UNKNOWN_41
	dw $6980                             ; ST_UNKNOWN_42
	dw $69e9                             ; ST_UNKNOWN_43
	dw $6a5c                             ; ST_UNKNOWN_44
	dw $6ac9                             ; ST_UNKNOWN_45
	dw $6b44                             ; ST_UNKNOWN_46
	dw $68ff                             ; ST_UNKNOWN_47
	dw $6980                             ; ST_UNKNOWN_48
	dw $6bb1                             ; ST_UNKNOWN_49
	dw $6bf4                             ; ST_UNKNOWN_4A
	dw UpdateState_Sleeping              ; ST_SLEEPING
	dw UpdateState_LadderScratching      ; ST_LADDER_SCRATCHING
	dw UpdateState_FenceShakeSliding     ; ST_FENCE_SHAKE_SLIDING
	dw UpdateState_FenceMovingVertical   ; ST_FENCE_MOVING_VERTICAL
	dw UpdateState_FenceIdling           ; ST_FENCE_IDLING
	dw UpdateState_FenceMovingHorizontal ; ST_FENCE_MOVING_HORIZONTAL
	dw UpdateState_FenceSliding          ; ST_FENCE_SLIDING
	dw Func_156d                         ; ST_UNUSED_52
	dw Func_156d                         ; ST_UNUSED_53
	dw Func_156d                         ; ST_UNUSED_54
	dw Func_156d                         ; ST_UNUSED_55
	dw Func_156d                         ; ST_UNUSED_56
	dw Func_156d                         ; ST_UNUSED_57
	dw Func_156d                         ; ST_UNUSED_58
	dw Func_156d                         ; ST_UNUSED_59
	dw Func_156d                         ; ST_UNUSED_5A
	dw Func_156d                         ; ST_UNUSED_5B
	dw Func_156d                         ; ST_UNUSED_5C
	dw Func_156d                         ; ST_UNUSED_5D
	dw Func_156d                         ; ST_UNUSED_5E
	dw Func_156d                         ; ST_UNUSED_5F
; 0x19c81

SetState_Slipping: ; 19c81 (6:5c81)
	ld a, ST_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wca89], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14000

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	ld [wWarioStateCycles], a
	and a
	jr nz, .asm_19ccd
	load_frameset_ptr Frameset_14252
	jr .got_frameset
.asm_19ccd
	load_frameset_ptr Frameset_1425f
.got_frameset
	update_anim_1
	ret
; 0x19ce7

UpdateState_Slipping: ; 19ce7 (6:5ce7)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wWarioStateCycles]
	cp $04
	jp nc, .asm_19db6
	cp $02
	jr nc, .asm_19d62
	ld b, a

	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp z, .asm_19db6
	rlca
	rlca
	rlca
	and $01
	cp b
	jp nz, .asm_19db6
	xor $1
	add 2
	ld [wWarioStateCycles], a

	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14a82

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19d56
	load_frameset_ptr Frameset_14cbe
	jr .asm_19daf
.asm_19d56
	load_frameset_ptr Frameset_14cc5
	jr .asm_19daf

.asm_19d62
	ld b, a
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_19db6
	ld a, b
	add $02
	ld [wWarioStateCycles], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1426c

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19da3
	load_frameset_ptr Frameset_149b4
	jr .asm_19daf
.asm_19da3
	load_frameset_ptr Frameset_149c5
	jr .asm_19daf

.asm_19daf
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
.asm_19db6
	update_anim_1
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_19ddc
	farcall StartJump_FromInput
	ret

.asm_19ddc
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_19de6
	jp Func_19e89

.asm_19de6
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_SLIPPING
	ret nz ; done if not slipping any more

	ld a, b
	and a
	jr nz, .asm_19e0f
	farcall StartFall
	ret

.asm_19e0f
	update_pos_y
	farcall Func_19734
	ld a, [wWarioState]
	cp ST_SLIPPING
	ret nz ; done if not slipping any more

	ld a, b
	and a
	jr nz, .asm_19e67
	call IsOnSlipperyGround
	jr z, .asm_19e67
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	ld a, [hl]
	cp $08
	jr c, .asm_19e4d
	cp $0f
	jr c, .asm_19e57
	cp $15
	jr c, .asm_19e51
	jr z, .asm_19e67
	ret

.asm_19e4d
	ld b, $02
	jr .asm_19e59
.asm_19e51
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_19e57
	ld b, $01
.asm_19e59
	ld a, [wDirection]
	and a
	jr nz, .asm_19e63
	call SubXOffset
	ret

.asm_19e63
	call AddXOffset
	ret

.asm_19e67
	ld a, [wWarioStateCycles]
	and $01
	ld [wDirection], a
	farcall SetState_Idling
	ret
; 0x19e7f

SetState_CrouchSlipping: ; 19e7f (6:5e7f)
	xor a
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	ld [wWarioStateCycles], a
;	fallthrough

Func_19e89: ; 19e89 (6:5e89)
	ld a, ST_CROUCH_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wca89], a
	ld [wca9a], a
	inc a
	ld [wca8b], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1426c

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wWarioStateCycles]
	cp $01
	jr z, .asm_19ed7
	load_frameset_ptr Frameset_14a38
	jr .got_frameset
.asm_19ed7
	load_frameset_ptr Frameset_14a3b
.got_frameset
	update_anim_1
	ret
; 0x19ef1

UpdateState_CrouchSlipping: ; 19ef1 (6:5ef1)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_19f1e
	farcall Func_1ed3f
	ret

.asm_19f1e
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_CROUCH_SLIPPING
	ret nz ; done if not crouch slipping any more
	ld a, b
	and a
	jr nz, .asm_19f47
	farcall Func_1ed34
	ret

.asm_19f47
	update_pos_y
	farcall Func_19734
	ld a, [wWarioState]
	cp ST_CROUCH_SLIPPING
	ret nz ; done if not crouch slipping any more
	ld a, b
	and a
	jr nz, .asm_19f9e
	call IsOnSlipperyGround
	jr z, .asm_19f9e

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_19f84
	cp $0a
	jr c, .asm_19f8e
	cp $0e
	jr c, .asm_19f88
	jr nc, .asm_19f9e
	ret

.asm_19f84
	ld b, $02
	jr .asm_19f90
.asm_19f88
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_19f8e
	ld b, $01
.asm_19f90
	ld a, [wDirection]
	and a
	jr nz, .asm_19f9a
	call SubXOffset
	ret

.asm_19f9a
	call AddXOffset
	ret

.asm_19f9e
	ld a, [wWarioStateCycles]
	and $01
	ld [wDirection], a
	farcall Func_1e855
	ret
; 0x19fb6

	INCROM $19fb6, $1a046

UpdateState_DraggedDown: ; 1a046 (6:6046)
	update_anim_1
	ld a, [wca9b]
	and a
	ret nz
	ld a, [wLevel]
	cp LEVEL_HIDDEN_FIGURE_BATTLE
	jr z, .set_game_over
	farcall StartFall
	ret

.set_game_over
	ld a, LEVEL_END_GAME_OVER
	ld [wLevelEndScreen], a
	ret
; 0x1a077

UpdateState_Teleporting: ; 1a077 (6:6077)
	ld a, $01
	ld [wca8a], a
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, .play_sfx
	cp $b4
	ret c
	ld [hl], $00
	ld a, ST_STUNG
	ld [wWarioState], a
	ld a, $01
	ld [wca8c], a
	ld hl, wc0d7
	res 7, [hl]
	jp Func_11f6

.play_sfx
	load_sfx SFX_082
	ret
; 0x1a0b4

	INCROM $1a0b4, $1a0e8

SetState_SandFalling: ; 1a0e8 (6:60e8)
	xor a
	ld [wca9a], a
	ld a, ST_SAND_FALLING
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
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wca89], a
	ld [wca9d], a
	ld [wca6d], a
	ld [wca8b], a
	ld [wc0e0], a
	ld hl, Pals_c800
	call Func_1af6
;	fallthrough

Func_1a12a: ; 1a12a (6:612a)
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_15955
;	fallthrough

Func_1a14b: ; 1a14b (6:614b)
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a164
	load_frameset_ptr Frameset_15f94
	jr .asm_1a16e
.asm_1a164
	load_frameset_ptr Frameset_15f97
.asm_1a16e
	update_anim_1
	ret
; 0x1a17e

UpdateState_SandFalling: ; 1a17e (6:617e)
	call Func_1b2c0
	ld a, [wWarioState]
	cp ST_SAND_FALLING
	ret nz ; done if not falling in sand any more

	farcall Func_198e0
	ld a, b
	and a
	ret z

	update_pos_y
	jp SetState_SandIdling
; 0x1a1a7

SetState_SandJumping: ; 1a1a7 (6:61a7)
	load_sfx SFX_JUMP
	ld a, ST_SAND_JUMPING
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	inc a
	ld [wJumpVelTable], a
	jp Func_1a12a
; 0x1a1c5

UpdateState_SandJumping: ; 1a1c5 (6:61c5)
	farcall Func_19b25
	ld a, [wIsInSand]
	and a
	jr nz, .in_sand
; not in sand
	farcall Func_1c289
	ret

.in_sand
	call Func_1488
	farcall Func_2b17a
	ld a, [wca86]
	cp $04
	jr c, .asm_1a208
	ld a, $00
	ld [wca86], a
.asm_1a208
	ld a, [wca95]
	and a
	jr z, .asm_1a211
	call Func_1a14b

.asm_1a211
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jp z, SetState_SandFalling

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jp nc, SetState_SandFalling

; rising
	farcall Func_1996e
	ld a, b
	and a
	ret z
	jp SetState_SandFalling
; 0x1a236

SetState_SandIdling: ; 1a236 (6:6236)
	ld a, ST_SAND_IDLING
	ld [wWarioState], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14000
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a27c
	load_frameset_ptr Frameset_14252
	jr .asm_1a286
.asm_1a27c
	load_frameset_ptr Frameset_1425f
.asm_1a286
	update_anim_1
	ret
; 0x1a296

UpdateState_SandIdling: ; 1a296 (6:6296)
	call Func_1b322
	ret
; 0x1a29a

SetState_SandWalking: ; 1a29a (6:629a)
	xor a
	ld [wca86], a

	ld a, ST_SAND_WALKING
	ld [wWarioState], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jr .asm_1a2bc

.d_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_1a2bc
.d_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.asm_1a2bc
	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	farcall Func_1e6ea
	ret
; 0x1a2d6

UpdateState_SandWalking: ; 1a2d6 (6:62d6)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $24
	ld [wSFXLoopCounter], a
	load_sfx SFX_WALK

.skip_sfx
	update_anim_1
	call Func_1b333
	ld a, [wWarioState]
	cp ST_SAND_WALKING
	ret nz ; done if not walking in sand any more

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	farcall Func_198e0
	ld a, b
	and a
	jp z, SetState_SandFalling
	ret
; 0x1a330

SetState_SandTurning: ; 1a330 (6:6330)
	ld a, ST_SAND_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14a82

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1a37a
	load_frameset_ptr Frameset_14cbe
	jr .asm_1a384
.asm_1a37a
	load_frameset_ptr Frameset_14cc5
.asm_1a384
	update_anim_1
	ret
; 0x1a394

UpdateState_SandTurning: ; 1a394 (6:6394)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	update_anim_1
	ld a, [wAnimationHasFinished]
	and a
	ret z
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SandWalking
	jp SetState_SandIdling
; 0x1a3bb

SetState_LadderClimbing: ; 1a3bb (6:63bb)
	ld a, ST_LADDER_CLIMBING
	ld [wWarioState], a
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca99], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_155cc

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_158d6
	update_anim_1
	ret
; 0x1a436

UpdateState_LadderClimbing: ; 1a436 (6:6436)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 32
	ld [wSFXLoopCounter], a
	load_sfx SFX_CLIMB
.skip_sfx
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1a49a
	get_pos
	ld b, $04
	farcall Func_c9f3
.asm_1a49a
	call Func_1b3a0
	ret
; 0x1a49e

SetState_LadderIdling: ; 1a49e (6:649e)
	ld a, ST_LADDER_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wca99], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_155cc

	ld a, [wDirection]
	and a
	jr nz, .asm_1a511
	load_frameset_ptr Frameset_15900
.asm_1a501
	update_anim_1
	ret

.asm_1a511
	load_frameset_ptr Frameset_158fd
	jr .asm_1a501
; 0x1a51d

UpdateState_LadderIdling: ; 1a51d (6:651d)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a549
	farcall StartFall
	ret

.asm_1a549
	update_anim_1
	call Func_1b480
	ret
; 0x1a55c

UpdateState_LadderShakeSlipping: ; 1a55c (6:655c)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a588
	farcall StartFall
	ret
.asm_1a588
	update_anim_1

	ld b, $02
	call AddYOffset
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1a5b3
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1a5b3
	jr c, .asm_1a5b3
	call Func_11ae
.asm_1a5b3
	farcall Func_199e9
	ld a, b
	and a
	jr z, .asm_1a5e1
	update_pos_y
	farcall SetState_Idling
	ret

.asm_1a5e1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $40
	ret c
	ld [hl], $00
	jp SetState_LadderIdling
; 0x1a5ee

SetState_GettingOffLadder: ; 1a5ee (6:65ee)
	ld a, ST_GETTING_OFF_LADDER
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	inc a
	ld [wca99], a
	ld [wca8a], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1a611
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ret
.asm_1a611
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ret
; 0x1a617

UpdateState_GettingOffLadder: ; 1a617 (6:6617)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 32
	ld [wSFXLoopCounter], a
	load_sfx SFX_CLIMB
.skip_sfx

	ld a, [wDirection]
	and a
	jr nz, .asm_1a63b
	ld b, $01
	call SubXOffset
	jr .asm_1a640
.asm_1a63b
	ld b, $01
	call AddXOffset

.asm_1a640
	farcall Func_19b25
	ld a, [wLadderInteraction]
	and a
	ret nz
	xor a
	ld [wca99], a
	ld [wca8a], a
	farcall StartFall
	ret
; 0x1a66b

SetState_LadderSliding: ; 1a66b (6:666b)
	ld a, ST_LADDER_SLIDING
	ld [wWarioState], a
	load_sfx SFX_00C
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca99], a
	inc a
	ld [wJumpVelTable], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_LEAD_OVERALLS
	jr c, .asm_1a695
	ld a, TRUE
	ld [wIsSmashAttacking], a
.asm_1a695

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_15945
	update_anim_1
	ret
; 0x1a6b6

UpdateState_LadderSliding: ; 1a6b6 (6:66b6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a6e6
	xor a ; FALSE
	ld [wIsSmashAttacking], a
	farcall StartFall
	ret

.asm_1a6e6
	update_anim_1

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp nz, SetState_LadderClimbing

	ld b, $02
	call AddYOffset
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1a719
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1a719
	jr c, .asm_1a719
	call Func_11ae
.asm_1a719
	farcall Func_199e9

	ld a, b
	and a
	ret z
	update_pos_y
	ld a, [wIsSmashAttacking]
	and a
	jr z, .asm_1a753
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr c, .asm_1a763
	farcall Func_1c5fd
	ret

.asm_1a753
	farcall SetState_Idling
	ret

.asm_1a763
	farcall Func_1c66b
	ret
; 0x1a773

SetState_GrabSlipping: ; 1a773 (6:6773)
	ld a, ST_GRAB_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wca89], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1426c

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a7bc
	load_frameset_ptr Frameset_14a20
	jr .asm_1a7c6
.asm_1a7bc
	load_frameset_ptr Frameset_14a23
.asm_1a7c6
	update_anim_1
	ret
; 0x1a7d6

UpdateState_GrabSlipping: ; 1a7d6 (6:67d6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wca9a]
	and a
	jr nz, .asm_1a802
	farcall SetState_Idling
	ret

.asm_1a802
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_1a819
	farcall Func_1ede9
	ret

.asm_1a819
	farcall Func_198e0
	ld a, [wWarioState]
	cp ST_GRAB_SLIPPING
	ret nz ; done if not grab slipping any more
	ld a, b
	and a
	jr nz, .asm_1a842
	farcall Func_1edd3
	ret

.asm_1a842
	farcall Func_19734
	ld a, [wWarioState]
	cp ST_GRAB_SLIPPING
	ret nz ; done if not grab slipping any more
	ld a, b
	and a
	jr nz, .asm_1a88e
	call IsOnSlipperyGround
	jr z, .asm_1a88e

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $08
	jr c, .asm_1a874
	cp $0f
	jr c, .asm_1a87e
	cp $15
	jr c, .asm_1a878
	jr z, .asm_1a88e
	ret

.asm_1a874
	ld b, $02
	jr .asm_1a880
.asm_1a878
	ld a, [wGlobalCounter]
	and %1
	ret z
.asm_1a87e
	ld b, $01
.asm_1a880
	ld a, [wDirection]
	and a
	jr nz, .asm_1a88a
	call SubXOffset
	ret

.asm_1a88a
	call AddXOffset
	ret

.asm_1a88e
	farcall Func_1efe7
	ret
; 0x1a89e

	INCROM $1a89e, $1ac10

SetState_Sleeping: ; 1ac10 (6:6c10)
	ld a, ST_SLEEPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14000
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ac59
	load_frameset_ptr Frameset_1421c
	jr .got_frameset
.asm_1ac59
	load_frameset_ptr Frameset_14225
.got_frameset
	update_anim_1
	ret
; 0x1ac73

UpdateState_Sleeping: ; 1ac73 (6:6c73)
	update_anim_1

	ld a, [wWarioStateCounter]
	dec a
	jr z, .asm_1acd0
	dec a
	jp z, .asm_1ad0c
	ld a, [wAnimationHasFinished]
	and a
	ret z
	load_sfx SFX_036
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld hl, wWarioStateCounter
	inc [hl]

	ld a, [wDirection]
	and a
	jr nz, .asm_1acb6
	load_frameset_ptr Frameset_1422e
	jr .asm_1acc0
.asm_1acb6
	load_frameset_ptr Frameset_14237
.asm_1acc0
	update_anim_1
	ret

.asm_1acd0
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1acde
	load_sfx SFX_036
.asm_1acde
	ld a, [wJoypadDown]
	and a
	ret z
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [wDirection]
	and a
	jr nz, .asm_1ad00
	load_frameset_ptr Frameset_14240
	jr .asm_1acc0
.asm_1ad00
	load_frameset_ptr Frameset_14249
	jr .asm_1acc0

.asm_1ad0c
	ld a, [wAnimationHasFinished]
	and a
	ret z
	farcall SetState_Idling
	ret
; 0x1ad21

SetState_LadderScratching: ; 1ad21 (6:6d21)
	ld a, ST_LADDER_SCRATCHING
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
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca99], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ad63
	load_frameset_ptr Frameset_15903
	jr .asm_1ad6d
.asm_1ad63
	load_frameset_ptr Frameset_15924
.asm_1ad6d
	update_anim_1
	ret
; 0x1ad7d

UpdateState_LadderScratching: ; 1ad7d (6:6d7d)
	update_anim_1
	ld a, [wJoypadDown]
	and a
	jr nz, .asm_1ad97
	ld a, [wAnimationHasFinished]
	and a
	ret z
.asm_1ad97
	jp SetState_LadderIdling
; 0x1ad9a

SetState_FenceShakeSliding: ; 1ad9a (6:6d9a)
	ld a, ST_FENCE_SHAKE_SLIDING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld a, $03
	ld [wca9b], a

	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14a82

	ld a, [wDirection]
	and a
	jr nz, .asm_1ade1
	load_frameset_ptr Frameset_14d0b
	jr .asm_1adeb
.asm_1ade1
	load_frameset_ptr Frameset_14d10
.asm_1adeb
	update_anim_1
	ret
; 0x1adfb

UpdateState_FenceShakeSliding: ; 1adfb (6:6dfb)
	update_anim_1
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1ae3a
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1ae3a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_14d15
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
.asm_1ae3a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_1ae67
	call Func_1488
	farcall Func_199e9
	ld a, b
	and a
	ret z

	update_pos_y

	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

.asm_1ae67
	ret
; 0x1ae68

SetState_FenceMovingVertical: ; 1ae68 (6:6e68)
	ld a, ST_FENCE_MOVING_VERTICAL
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_155cc

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_158d6
	update_anim_1
	ret
; 0x1aed0

UpdateState_FenceMovingVertical:;1aed0 (6:6ed0)
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXLoopCounter], a
	load_sfx SFX_CLIMB
.skip_sfx
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1af1e

	get_pos

	ld b, $04
	farcall Func_c9f3
.asm_1af1e
	call Func_1b168
	ret
; 0x1af22

SetState_FenceIdling: ; 1af22 (6:6f22)
	ld a, ST_FENCE_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c], a
	ld a, $00
	ld [$ca7d], a
	call Func_15b0
	load_oam_ptr OAM_155cc

	ld a, [wDirection]
	and a
	jr nz, .asm_1af7e
	load_frameset_ptr Frameset_15900
	jr .asm_1af88
.asm_1af7e
	load_frameset_ptr Frameset_158fd
.asm_1af88
	update_anim_1
	ret
; 0x1af98

UpdateState_FenceIdling: ; 1af98 (6:6f98)
	update_anim_1
	call Func_1b21a
	ret
; 0x1afab

SetState_FenceMovingHorizontal: ; 1afab (6:6fab)
	ld a, ST_FENCE_MOVING_HORIZONTAL
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left

	ld a, [wDirection]
	and a
	jr nz, .d_right
.d_left
	load_frameset_ptr Frameset_158f2
	jr .asm_1afff
.d_right
	load_frameset_ptr Frameset_158e7
.asm_1afff
	update_anim_1
	ret
; 0x1b00f

UpdateState_FenceMovingHorizontal: ; 1b00f (6:700f)
	farcall Func_19afb
	ld a, [wIsNearFence]
	and a
	jr nz, .asm_1b034
	farcall StartFall
	ret

.asm_1b034
	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $20
	ld [wSFXLoopCounter], a
	load_sfx SFX_CLIMB
.skip_sfx
	update_anim_1
	call Func_1b24f
	ret
; 0x1b05e

SetState_FenceSliding: ; 1b05e (6:705e)
	ld a, ST_FENCE_SLIDING
	ld [wWarioState], a
	load_sfx SFX_00C

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca99], a
	inc a
	ld [wJumpVelTable], a

	ld a, [wPowerUpLevel]
	cp POWER_UP_LEAD_OVERALLS
	jr c, .asm_1b088
	ld a, TRUE
	ld [wIsSmashAttacking], a
.asm_1b088
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_15945
	update_anim_1
	ret
; 0x1b0a9

UpdateState_FenceSliding: ; 1b0a9 (6:70a9)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wIsNearFence]
	and a
	jr nz, .asm_1b0d9

	xor a ; FALSE
	ld [wIsSmashAttacking], a
	farcall StartFall
	ret

.asm_1b0d9
	update_anim_1
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_1b0f2
	jp SetState_FenceMovingVertical

.asm_1b0f2
	ld b, $02
	call AddYOffset
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1b10e
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1b10e
	jr c, .asm_1b10e
	call Func_11ae
.asm_1b10e
	farcall Func_199e9
	ld a, b
	and a
	ret z

	update_pos_y

	ld a, [wIsSmashAttacking]
	and a
	jr z, .asm_1b148

	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr c, .asm_1b158
	farcall Func_1c5fd
	ret

.asm_1b148
	farcall SetState_Idling
	ret

.asm_1b158
	farcall Func_1c66b
	ret
; 0x1b168

Func_1b168: ; 1b168 (6:7168)
	ld a, [wJoypadDown]
	and B_BUTTON | D_DOWN
	cp B_BUTTON | D_DOWN
	jp z, SetState_FenceSliding

	ld a, [wJumpingUpwards]
	and a
	jr nz, .asm_1b18f
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_1b18f
.asm_1b17f
	farcall StartJump_FromInput
	ret

.asm_1b18f
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1b17f

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	and D_RIGHT | D_LEFT
	jp nz, SetState_FenceMovingHorizontal
	jp SetState_FenceIdling

.d_up
	farcall Func_19ae4 ; unnecessary farcall
	ld a, [wIsNearFence]
	and a
	ret z
	ld b, $01
	call SubYOffset
	ret

.d_down
	ld b, $01
	call AddYOffset
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1b1ff
	farcall Func_19afb
	ld a, [wIsNearFence]
	and a
	ret nz
	farcall StartFall
	ret

.asm_1b1ff
	update_pos_y
	farcall SetState_Idling
	ret
; 0x1b21a

Func_1b21a: ; 1b21a (6:721a)
	ld a, [wJumpingUpwards]
	and a
	jr nz, .asm_1b237
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_1b237
.asm_1b227
	farcall StartJump_FromInput
	ret

.asm_1b237
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1b227
	ld a, [wJoypadDown]
	and D_UP | D_DOWN
	jp nz, SetState_FenceMovingVertical
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_FenceMovingHorizontal
	ret
; 0x1b24f

Func_1b24f: ; 1b24f (6:724f)
	ld a, [wJumpingUpwards]
	and a
	jr nz, .asm_1b26c
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_1b26c
.asm_1b25c
	farcall StartJump_FromInput
	ret

.asm_1b26c
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1b25c
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	and D_UP | D_DOWN
	jp nz, SetState_FenceMovingVertical
	jp SetState_FenceIdling

.d_right
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call AddXOffset
	ret

.d_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall Func_19734
	ld a, b
	and a
	ret nz
	ld b, $01
	call SubXOffset
	ret
; 0x1b2c0

Func_1b2c0: ; 1b2c0 (6:72c0)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	call Func_1b302

	farcall Func_19734
	ld a, b
	and a
	ret nz
	farcall Func_2b17a

	ld a, [wca86]
	cp $04
	jr c, .asm_1b2f8
	ld a, $00
	ld [wca86], a
.asm_1b2f8
	ld a, [wca95]
	and a
	jr z, .asm_1b301
	call Func_1a14b
.asm_1b301
	ret
; 0x1b302

Func_1b302: ; 1b302 (6:7302)
	farcall Func_198e0
	ld a, b
	and a
	ret nz

	ld b, $01
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jr z, .asm_1b31e
	inc b
.asm_1b31e
	call AddYOffset
	ret
; 0x1b322

Func_1b322: ; 1b322 (6:7322)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_SandWalking
	ret
; 0x1b333

Func_1b333: ; 1b333 (6:7333)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, SetState_SandJumping
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	jp SetState_SandIdling

.d_right
	; this is buggy, wDirection is already
	; switched by input handling in the Sand Idling state
	; as a result, Sand Turning state will never be reached
	ld a, [wDirection]
	and a
	jp z, SetState_SandTurning
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_151e
	call AddXOffset
.asm_1b36d
	ld a, [wca86]
	cp $04
	jr c, .asm_1b379
	ld a, $00
	ld [wca86], a
.asm_1b379
	ret

.d_left
	; this is buggy, wDirection is already
	; switched by input handling in the Sand Idling state
	; as a result, Sand Turning state will never be reached
	ld a, [wDirection]
	and a
	jp nz, SetState_SandTurning
	ld a, DIRECTION_LEFT
	ld [wDirection], a

	farcall Func_19734
	ld a, b
	and a
	ret nz
	call Func_153f
	call SubXOffset
	jr .asm_1b36d
; 0x1b3a0

Func_1b3a0: ; 1b3a0 (6:73a0)
	ld a, [wJoypadDown]
	and B_BUTTON | D_DOWN
	cp B_BUTTON | D_DOWN
	jp z, SetState_LadderSliding

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	jp SetState_LadderIdling

.d_up
	farcall Func_1996e
	ld a, [wced2]
	and a
	ret nz
	ld b, $01
	call SubYOffset
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1b3e6
	call Func_114e
	ld a, [wca78]
	sub c
	jr nc, .asm_1b3e6
	jp Func_11d6

.asm_1b3e6
	ld a, [wLadderInteraction]
	and a
	ret nz
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	ret nz
.asm_1b3ff
	farcall SetState_Idling
	ret

.d_down
	ld b, $01
	call AddYOffset
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1b42b
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1b42b
	jr c, .asm_1b42b
	jp Func_11ae

.asm_1b42b
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	jr z, .asm_1b45d
	farcall Func_198e0
	ld a, b
	and a
	ret z
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
	ret

.asm_1b45d
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1b3ff
	farcall StartFall
	ret
; 0x1b480

Func_1b480: ; 1b480 (6:7480)
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_1b48e
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, .asm_1b4a7

.asm_1b48e
	ld a, [wJoypadDown]
	and D_UP | D_DOWN
	jp nz, SetState_LadderClimbing
	ld hl, wWarioStateCounter
	ld a, [hl]
	add 1
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	cp $02
	ret c
	jp SetState_LadderScratching

.asm_1b4a7
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1b4d3
	ld a, $f0
	ld [wca71], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_1b4eb
.asm_1b4c6
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	jp SetState_GettingOffLadder

.asm_1b4d3
	ld a, $10
	ld [wca72], a
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_1b4c6
.asm_1b4eb
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ret
; 0x1b4f6
