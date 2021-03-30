Func_1ec000: ; 1ec000 (7b:4000)
	ld a, [wWarioState]
	sub $b0
	jumptable

	dw $4124     ; ST_UNKNOWN_B0
	dw $4177     ; ST_UNKNOWN_B1
	dw $422b     ; ST_UNKNOWN_B2
	dw $4300     ; ST_UNKNOWN_B3
	dw Func_156d ; ST_UNKNOWN_B4
	dw Func_156d ; ST_UNKNOWN_B5
	dw Func_156d ; ST_UNKNOWN_B6
	dw Func_156d ; ST_UNKNOWN_B7
	dw $4339     ; ST_UNKNOWN_B8
	dw $43bc     ; ST_UNKNOWN_B9
	dw $4540     ; ST_UNKNOWN_BA
	dw $467d     ; ST_UNKNOWN_BB
	dw $46a8     ; ST_UNKNOWN_BC
	dw Func_156d ; ST_UNKNOWN_BD
	dw Func_156d ; ST_UNKNOWN_BE
	dw Func_156d ; ST_UNKNOWN_BF
	dw $4703     ; ST_UNKNOWN_C0
	dw Func_156d ; ST_UNKNOWN_C1
	dw Func_156d ; ST_UNKNOWN_C2
	dw Func_156d ; ST_UNKNOWN_C3
	dw $47eb     ; ST_UNKNOWN_C4
	dw $4884     ; ST_UNKNOWN_C5
	dw $490d     ; ST_UNKNOWN_C6
	dw $49b1     ; ST_UNKNOWN_C7
	dw $4a6e     ; ST_UNKNOWN_C8
	dw $4b9b     ; ST_UNKNOWN_C9
	dw $4bf1     ; ST_UNKNOWN_CA
	dw $4c7d     ; ST_UNKNOWN_CB
	dw $4d9c     ; ST_UNKNOWN_CC
	dw $4e65     ; ST_UNKNOWN_CD
	dw Func_156d ; ST_UNKNOWN_CE
	dw Func_156d ; ST_UNKNOWN_CF
	dw UpdateState_SplitHit         ; ST_SPLIT_HIT
	dw UpdateState_SplitKnockedBack ; ST_SPLIT_KNOCKED_BACK
	dw UpdateState_Splitting        ; ST_SPLITTING
	dw $504f     ; ST_UNKNOWN_D3
	dw $5136     ; ST_UNKNOWN_D4
	dw $51af     ; ST_UNKNOWN_D5
	dw $523f     ; ST_UNKNOWN_D6
	dw $52a3     ; ST_UNKNOWN_D7
	dw $531a     ; ST_UNKNOWN_D8
	dw Func_156d ; ST_UNKNOWN_D9
	dw Func_156d ; ST_UNKNOWN_DA
	dw Func_156d ; ST_UNKNOWN_DB
	dw UpdateState_BlindIdling   ; ST_BLIND_IDLING
	dw UpdateState_BlindWalking  ; ST_BLIND_WALKING
	dw UpdateState_BlindTurning  ; ST_BLIND_TURNING
	dw UpdateState_BlindAirborne ; ST_BLIND_AIRBORNE
	dw $56ee     ; ST_UNKNOWN_E0
	dw $57e5     ; ST_UNKNOWN_E1
	dw $5886     ; ST_UNKNOWN_E2
	dw Func_156d ; ST_UNKNOWN_E3
	dw $5972     ; ST_UNKNOWN_E4
	dw $5a16     ; ST_UNKNOWN_E5
	dw $5a1e     ; ST_UNKNOWN_E6
	dw Func_156d ; ST_UNKNOWN_E7
	dw $5aaa     ; ST_UNKNOWN_E8
	dw $5b47     ; ST_UNKNOWN_E9
	dw $5ba0     ; ST_UNKNOWN_EA
	dw $5c15     ; ST_UNKNOWN_EB
	dw $5cd0     ; ST_UNKNOWN_EC
	dw $5d7e     ; ST_UNKNOWN_ED
	dw $5e36     ; ST_UNKNOWN_EE
	dw Func_156d ; ST_UNKNOWN_EF
	dw Func_156d ; ST_UNKNOWN_F0
	dw Func_156d ; ST_UNKNOWN_F1
	dw Func_156d ; ST_UNKNOWN_F2
; 0x1ec08c

	INCROM $1ec08c, $1ecf3a

UpdateState_SplitHit: ; 1ecf3a (7b:4f3a)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z

	ld a, ST_SPLIT_KNOCKED_BACK
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ecf6c
	load_frameset_ptr Frameset_1ffd19
	jr .asm_1ecf76
.asm_1ecf6c
	load_frameset_ptr Frameset_1ffd13
.asm_1ecf76
	update_anim_2
	ret
; 0x1ecf86

UpdateState_SplitKnockedBack: ; 1ecf86 (7b:4f86)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	call Func_1488
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .play_sfx
	farcall Func_2b1a6
	call Func_1762
	jp Func_14de

.play_sfx
	load_sound SFX_44

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ecfef
	load_frameset_ptr Frameset_1ffccf
	jr .asm_1ecff9
.asm_1ecfef
	load_frameset_ptr Frameset_1ffc8e
.asm_1ecff9
	update_anim_2
;	fallthrough

SetState_Splitting: ; 1ed008 (7b:5008)
	call Func_14f6
	ld a, ST_SPLITTING
	ld [wWarioState], a
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ret
; 0x1ed018

UpdateState_Splitting: ; 1ed018 (7b:5018)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	jr nz, .asm_1ed09b

	farcall Func_198e0
	ld a, b
	and a
	ret nz

	ld a, ST_UNKNOWN_D3
	ld [wWarioState], a

	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ret

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	jr nz, .asm_1ed09b
	call Func_1488
	farcall Func_199e9
	ld a, b
	and a
	jp nz, SetState_Splitting
	jp Func_14de

.asm_1ed09b
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	jp Func_1570
; 0x1ed0a6

	INCROM $1ed0a6, $1ed331

SetState_BlindIdling: ; 1ed331 (7b:5331)
	ld a, ST_BLIND_IDLING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wca86], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca8b], a
	ld [wca9d], a
	ld [wca96], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wca8d], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	call Func_161a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld hl, Pals_c800
	call Func_1af6

	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_14000

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed3b3
	load_frameset_ptr Frameset_14252
	jr .asm_1ed3bd
.asm_1ed3b3
	load_frameset_ptr Frameset_1425f
.asm_1ed3bd
	update_anim_1
	ret
; 0x1ed3cd

UpdateState_BlindIdling: ; 1ed3cd (7b:53cd)
	update_anim_1
	call Func_1edf93
	ld a, [wWarioState]
	cp ST_BLIND_IDLING
	ret nz ; done if not blind idling any more

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1ed548
	ret
; 0x1ed3fa

SetState_BlindWalking: ; 1ed3fa (7b:53fa)
	xor a
	ld [wca86], a
	ld a, ST_BLIND_WALKING
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wJumpVelIndex], a
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
	load_oam_ptr OAM_1426c

	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr nz, .asm_1ed443
	bit D_RIGHT_F, a
	jr nz, .asm_1ed44f

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed44f
.asm_1ed443
	load_frameset_ptr Frameset_149b4
	jr .asm_1ed459
.asm_1ed44f
	load_frameset_ptr Frameset_149c5
.asm_1ed459
	update_anim_1
	ret
; 0x1ed469

UpdateState_BlindWalking: ; 1ed469 (7b:5469)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	update_anim_1

	farcall Func_19734
	ld a, [wWarioState]
	cp ST_BLIND_WALKING
	ret nz ; done if not blind walking any more

	ld a, b
	and a
	jp nz, Func_1570
	call Func_1edfa4
	ld a, [wWarioState]
	cp ST_BLIND_WALKING
	ret nz ; done if not blind walking any more

	farcall Func_198e0
	ld a, b
	and a
	jp z, Func_1ed548
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 0x1ed4d1

SetState_BlindTurning: ; 1ed4d1 (7b:54d1)
	ld a, ST_BLIND_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
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
	jr nz, .asm_1ed510
	load_frameset_ptr Frameset_14cbe
	jr .asm_1ed51a
.asm_1ed510
	load_frameset_ptr Frameset_14cc5
.asm_1ed51a
	update_anim_1
	ret
; 0x1ed52a

UpdateState_BlindTurning: ; 1ed52a (7b:552a)
	update_anim_1
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, Func_1ed558
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_BlindWalking
; 0x1ed548

Func_1ed548: ; 1ed548 (7b:5548)
	xor a
	ld [wJumpingUpwards], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a
	jr SetState_BlindAirborne
; 0x1ed558

Func_1ed558: ; 1ed558 (7b:5558)
	load_sound SFX_JUMP

	xor a
	ld [wJumpVelIndex], a
	ld [wca96], a
	ld a, TRUE
	ld [wJumpingUpwards], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
;	fallthrough

SetState_BlindAirborne: ; 1ed571 (7b:5571)
	xor a ; FALSE
	ld [wIsStandingOnSlope], a

	ld a, ST_BLIND_AIRBORNE
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca8b], a
	ld [wca89], a
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_1ed5c0
	load_frameset_ptr Frameset_15f94
	jr .asm_1ed5ca
.asm_1ed5c0
	load_frameset_ptr Frameset_15f97
.asm_1ed5ca
	update_anim_1

	ld a, [wcac9]
	and a
	ret z
	call UpdateState_BlindAirborne
	ret
; 0x1ed5e2

UpdateState_BlindAirborne: ; 1ed5e2 (7b:55e2)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wc0db]
	and a
	jp nz, Func_1570
	farcall Func_19734
	ld a, [wWarioState]
	cp ST_BLIND_AIRBORNE
	ret nz ; done if not blind airborne any more

	ld a, b
	and a
	jp nz, Func_1570
	call Func_1ee00f
	ld a, [wWarioState]
	cp ST_BLIND_AIRBORNE
	ret nz ; done if not blind airborne any more

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1ed644
	farcall Func_1996e
	ld a, b
	and a
	ret z
	ld a, [wWarioState]
	cp ST_BLIND_AIRBORNE
	ret nz ; done if not blind airborne any more
	jp Func_1ed548

.asm_1ed644
	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1ed65a
	jp Func_14de
.asm_1ed65a
	call Func_14f6
	jp SetState_BlindIdling
; 0x1ed660

	INCROM $1ed660, $1edf93

Func_1edf93: ; 1edf93 (7b:5f93)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ed558
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jp nz, SetState_BlindWalking
	ret
; 0x1edfa4

Func_1edfa4: ; 1edfa4 (7b:5fa4)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_1ed558
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1edfba
	bit D_LEFT_F, a
	jr nz, .asm_1edfe4
	jp SetState_BlindIdling

.asm_1edfba
	ld a, [wDirection]
	and a
	jr z, .asm_1edfdc
	farcall Func_1f11b
	ld a, [wca86]
	cp $10
	jr c, .asm_1edfdb
	ld a, $0c
	ld [wca86], a
.asm_1edfdb
	ret

.asm_1edfdc
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jp SetState_BlindTurning

.asm_1edfe4
	ld a, [wDirection]
	cp DIRECTION_LEFT
	jr nz, .asm_1ee007
	farcall Func_1f135
	ld a, [wca86]
	cp $10
	jr c, .asm_1ee006
	ld a, $0c
	ld [wca86], a
.asm_1ee006
	ret

.asm_1ee007
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jp SetState_BlindTurning
; 0x1ee00f

Func_1ee00f: ; 1ee00f (7b:600f)
	call Func_1488
	farcall Func_2b17a
	ld a, [wca86]
	cp $10
	jr c, .asm_1ee02d
	ld a, $0c
	ld [wca86], a
.asm_1ee02d
	ret
; 0x1ee02e

	INCROM $1ee02e, $1f0000

