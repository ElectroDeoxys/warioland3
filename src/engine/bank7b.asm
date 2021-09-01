Func_1ec000: ; 1ec000 (7b:4000)
	ld a, [wWarioState]
	sub $b0
	jumptable

	dw UpdateState_IceSkatinStart    ; ST_ICE_SKATIN_START
	dw UpdateState_IceSkatin         ; ST_ICE_SKATIN
	dw UpdateState_IceSkatinAirborne ; ST_ICE_SKATIN_AIRBORNE
	dw UpdateState_IceSkatinCrash    ; ST_ICE_SKATIN_CRASH
	dw Func_156d                     ; ST_UNUSED_B4
	dw Func_156d                     ; ST_UNUSED_B5
	dw Func_156d                     ; ST_UNUSED_B6
	dw Func_156d                     ; ST_UNUSED_B7
	dw $4339                         ; ST_UNKNOWN_B8
	dw $43bc                         ; ST_UNKNOWN_B9
	dw $4540                         ; ST_UNKNOWN_BA
	dw $467d                         ; ST_UNKNOWN_BB
	dw $46a8                         ; ST_UNKNOWN_BC
	dw Func_156d                     ; ST_UNUSED_BD
	dw Func_156d                     ; ST_UNUSED_BE
	dw Func_156d                     ; ST_UNUSED_BF
	dw UpdateState_HangingRail       ; ST_HANGING_RAIL
	dw Func_156d                     ; ST_UNUSED_C1
	dw Func_156d                     ; ST_UNUSED_C2
	dw Func_156d                     ; ST_UNUSED_C3
	dw $47eb                         ; ST_UNKNOWN_C4
	dw $4884                         ; ST_UNKNOWN_C5
	dw $490d                         ; ST_UNKNOWN_C6
	dw $49b1                         ; ST_UNKNOWN_C7
	dw $4a6e                         ; ST_UNKNOWN_C8
	dw $4b9b                         ; ST_UNKNOWN_C9
	dw $4bf1                         ; ST_UNKNOWN_CA
	dw $4c7d                         ; ST_UNKNOWN_CB
	dw $4d9c                         ; ST_UNKNOWN_CC
	dw $4e65                         ; ST_UNKNOWN_CD
	dw Func_156d                     ; ST_UNUSED_CE
	dw Func_156d                     ; ST_UNUSED_CF
	dw UpdateState_SplitHit          ; ST_SPLIT_HIT
	dw UpdateState_SplitKnockedBack  ; ST_SPLIT_KNOCKED_BACK
	dw UpdateState_Splitting         ; ST_SPLITTING
	dw $504f                         ; ST_UNKNOWN_D3
	dw $5136                         ; ST_UNKNOWN_D4
	dw $51af                         ; ST_UNKNOWN_D5
	dw $523f                         ; ST_UNKNOWN_D6
	dw $52a3                         ; ST_UNKNOWN_D7
	dw $531a                         ; ST_UNKNOWN_D8
	dw Func_156d                     ; ST_UNUSED_D9
	dw Func_156d                     ; ST_UNUSED_DA
	dw Func_156d                     ; ST_UNUSED_DB
	dw UpdateState_BlindIdling       ; ST_BLIND_IDLING
	dw UpdateState_BlindWalking      ; ST_BLIND_WALKING
	dw UpdateState_BlindTurning      ; ST_BLIND_TURNING
	dw UpdateState_BlindAirborne     ; ST_BLIND_AIRBORNE
	dw $56ee                         ; ST_UNKNOWN_E0
	dw $57e5                         ; ST_UNKNOWN_E1
	dw $5886                         ; ST_UNKNOWN_E2
	dw Func_156d                     ; ST_UNUSED_E3
	dw UpdateState_MagicRising       ; ST_MAGIC_RISING
	dw UpdateState_MagicStopping     ; ST_MAGIC_STOPPING
	dw $5a1e                         ; ST_UNKNOWN_E6
	dw Func_156d                     ; ST_UNUSED_E7
	dw $5aaa                         ; ST_UNKNOWN_E8
	dw UpdateState_BallBouncing      ; ST_BALL_BOUNCING
	dw UpdateState_BallAirborne      ; ST_BALL_AIRBORNE
	dw UpdateState_BallShot          ; ST_BALL_SHOT
	dw UpdateState_BallThrown        ; ST_BALL_THROWN
	dw UpdateState_BallSentUpwards   ; ST_BALL_SENT_UPWARDS
	dw UpdateState_BallTurning       ; ST_BALL_TURNING
	dw Func_156d                     ; ST_UNUSED_EF
	dw Func_156d                     ; ST_UNUSED_F0
	dw Func_156d                     ; ST_UNUSED_F1
	dw Func_156d                     ; ST_UNUSED_F2
; 0x1ec08c

	INCROM $1ec08c, $1ec124

UpdateState_IceSkatinStart: ; 1ec124 (7b:4124)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z

	xor a
	ld [wca86], a
;	fallthrough

SetState_IceSkatin: ; 1ec13c (7b:413c)
	ld a, ST_ICE_SKATIN
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ec15d
	load_frameset_ptr Frameset_1fdd97
	jr .asm_1ec167
.asm_1ec15d
	load_frameset_ptr Frameset_1fdd94
.asm_1ec167
	update_anim_2
	ret
; 0x1ec177

UpdateState_IceSkatin: ; 1ec177 (7b:4177)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	farcall Func_19734
	ld a, b
	and a
	jr nz, Func_1ec215

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $0c
	ld [wSFXLoopCounter], a
	load_sfx SFX_SLIDE
.skip_sfx
	update_anim_2

	ld a, [wDirection]
	and a
	jr nz, .asm_1ec1d4
	call Func_153f
	call SubXOffset
	jr .asm_1ec1da
.asm_1ec1d4
	call Func_151e
	call AddXOffset
.asm_1ec1da
	ld a, [wca86]
	cp $14
	jr c, .asm_1ec1e6
	ld a, $10
	ld [wca86], a
.asm_1ec1e6
	farcall Func_198e0
	ld a, b
	and a
	jr z, .asm_1ec205
	update_pos_y
	ret

.asm_1ec205
	ld a, ST_ICE_SKATIN_AIRBORNE
	ld [wWarioState], a
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ret
; 0x1ec215

Func_1ec215: ; 1ec215 (7b:4215)
	ld a, [wDirection]
	and a
	jr nz, .asm_1ec223
	ld b, $03
	call AddXOffset
	jp SetState_IceSkatinCrash
.asm_1ec223
	ld b, $03
	call SubXOffset
	jp SetState_IceSkatinCrash
; 0x1ec22b

UpdateState_IceSkatinAirborne: ; 1ec22b (7b:422b)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wWaterInteraction]
	and a
	jp nz, SetState_IceSkatinCrash

	farcall Func_19734
	ld a, b
	and a
	jr nz, Func_1ec215
	update_anim_2
	call Func_1488
	farcall Func_2b1a6
	ld a, [wca86]
	cp $14
	jr c, .asm_1ec288
	ld a, $10
	ld [wca86], a
.asm_1ec288
	ld a, [wWarioState]
	cp ST_ICE_SKATIN_AIRBORNE
	ret nz ; done if not ice skatin airborne any more

	farcall Func_199e9
	ld a, b
	and a
	jr nz, .asm_1ec2aa
	ld a, [wWarioState]
	cp ST_ICE_SKATIN_AIRBORNE
	ret nz ; done if not ice skatin airborne any more
	jp Func_14de

.asm_1ec2aa
	call Func_14f6
	ld a, [wWarioState]
	cp ST_ICE_SKATIN_AIRBORNE
	ret nz ; done if not ice skatin airborne any more

	ld a, $10
	ld [wca86], a
	jp SetState_IceSkatin
; 0x1ec2bb

SetState_IceSkatinCrash: ; 1ec2bb (7b:42bb)
	load_sfx SFX_02E

	ld a, ST_ICE_SKATIN_CRASH
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1ec2e6
	load_frameset_ptr Frameset_1fdda7
	jr .asm_1ec2f0
.asm_1ec2e6
	load_frameset_ptr Frameset_1fdd9a
.asm_1ec2f0
	update_anim_2
	ret
; 0x1ec300

UpdateState_IceSkatinCrash: ; 1ec300 (7b:4300)
	update_anim_2
	ld a, [wAnimationHasFinished]
	and a
	ret z
	get_pos
	ld b, $0c
	farcall Func_c9f3
	jp Func_1570
; 0x1ec339

	INCROM $1ec339, $1ec703

UpdateState_HangingRail: ; 1ec703 (7b:4703)
	ld a, [wWarioStateCounter]
	and a
	jr nz, .asm_1ec725
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1ec725
	ld a, $01
	ld [wWarioStateCounter], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1feeb4
.asm_1ec725
	update_anim_2

	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_1570.asm_157a
	bit A_BUTTON_F, a
	jp nz, Func_1ede4d
	ld a, [wca9b]
	and a
	jp z, Func_1ede69
	ret
; 0x1ec749

	INCROM $1ec749, $1ecbb2

SetState_UnknownCA: ; 1ecbb2 (7b:4bb2)
	ld a, ST_UNKNOWN_CA
	ld [wWarioState], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1ecbd7
	load_frameset_ptr Frameset_1ff628
	jr .asm_1ecbe1
.asm_1ecbd7
	load_frameset_ptr Frameset_1ff639
.asm_1ecbe1
	update_anim_2
	ret
; 0x1ecbf1

	INCROM $1ecbf1, $1ecf3a

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
	ld a, [wWaterInteraction]
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
	load_sfx SFX_044

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
	ld a, [wWaterInteraction]
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
	ld [wIsSmashAttacking], a
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
	call UpdateLevelMusic
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
	update_pos_y
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
	load_sfx SFX_JUMP

	xor a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
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
	ld a, [wWaterInteraction]
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

	INCROM $1ed660, $1ed972

UpdateState_MagicRising: ; 1ed972 (7b:5972)
	farcall Func_19b25
	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_1ed9d5

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, $0c
	ld [wSFXLoopCounter], a
	load_sfx SFX_07D
.skip_sfx

	ld a, $77
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation

	ld b, $01
	call SubYOffset
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1ed9d4
	call Func_114e
	ld a, [wca78]
	sub c
	jr nc, .asm_1ed9d4
	call Func_11d6
.asm_1ed9d4
	ret

.asm_1ed9d5
	get_pos
	ld b, $12
	farcall Func_c9f3

	ld a, ST_MAGIC_STOPPING
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, $77
	ldh [hCallFuncBank], a
	call_hram UpdateAnimation
	ret
; 0x1eda16

UpdateState_MagicStopping: ; 1eda16 (7b:5a16)
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $20
	ret c
	jp Func_1570
; 0x1eda21

	INCROM $1eda21, $1edaf8

Func_1edaf8: ; 1edaf8 (7b:5af8)
	ld a, [wDirection]
	and a
	jr nz, .asm_1edb12
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jp nz, SetState_BallTurning
	load_frameset_ptr Frameset_1dd230
	jr .asm_1edb24
.asm_1edb12
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jp nz, SetState_BallTurning
	load_frameset_ptr Frameset_1dd295

.asm_1edb24
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	ld a, ST_BALL_BOUNCING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	update_anim_3
	ret
; 0x1edb47

UpdateState_BallBouncing: ; 1edb47 (7b:5b47)
	update_anim_3
	ld a, [wAnimationHasFinished]
	and a
	ret z
;	fallthrough

SetState_BallAirborne: ; 1edb5b (7b:5b5b)
	load_sfx SFX_066
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a

	ld a, ST_BALL_AIRBORNE
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1edb86
	load_frameset_ptr Frameset_1dd2f3
	jr .asm_1edb90
.asm_1edb86
	load_frameset_ptr Frameset_1dd2f6
.asm_1edb90
	update_anim_3
	ret
; 0x1edba0

UpdateState_BallAirborne: ; 1edba0 (7b:5ba0)
	update_anim_3

	call Func_1ee02e
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	ret c
	farcall Func_199e9
	ld a, b
	and a
	ret z
	update_pos_y
	jp Func_1edaf8
; 0x1edbd8

	INCROM $1edbd8, $1edc15

UpdateState_BallShot: ; 1edc15 (7b:5c15)
	ld a, [wca9b]
	and a
	jr z, .asm_1edc91
	bit 7, a
	jr z, .asm_1edc71
	and $7f
	ld [wca9b], a
	dec a
	jr z, .asm_1edc5a
	dec a
	jr z, .asm_1edc2e
	dec a
	jr z, .asm_1edc41
	ret

.asm_1edc2e
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1dd2d1
	jr .asm_1edc71

.asm_1edc41
	ld hl, Pals_c9d0
	call Func_1af6

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1dd27a
	jr .asm_1edc71

.asm_1edc5a
	ld hl, Pals_c9c0
	call Func_1af6

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1dd26c

.asm_1edc71
	update_anim_3

	ld a, [wca9b]
	cp $02
	ret nz
	ld a, [wAnimationHasFinished]
	and a
	ret z
	ld a, $83
	ld [wca9b], a
	ret

.asm_1edc91
	ld a, DIRECTION_LEFT
	ld [wDirection], a

	ld a, ST_BALL_THROWN
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a

	ld a, $6
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_HIGH_JUMP
	ld [wJumpVelTable], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_1dd2ee
	update_anim_3
	ret
; 0x1edcd0

UpdateState_BallThrown: ; 1edcd0 (7b:5cd0)
	update_anim_3

	call Func_1488
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
; rising
	ld b, $03
	call SubXOffset
	ret

.falling
	ld b, $02
	call SubXOffset
	farcall Func_199e9
	ld a, b
	and a
	ret z
	update_pos_y

	xor a
	ld [wca8a], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	ld a, [wNumShootGoals]
	cp 3
	jr z, .asm_1edd3c
	pop af
	ldh [rSVBK], a
	farcall Func_206eb
	ret

.asm_1edd3c
	pop af
	ldh [rSVBK], a

	ld a, ST_BALL_SENT_UPWARDS
	ld [wWarioState], a
	load_sfx SFX_066

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wJumpVelIndex], a
	inc a
	ld [wca8a], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	load_frameset_ptr Frameset_1dd2ee
	update_anim_3
	ret
; 0x1edd7e

UpdateState_BallSentUpwards: ; 1edd7e (7b:5d7e)
	update_anim_3

	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .falling
; rising
	ld b, $03
	call SubYOffset
	farcall Func_1996e
	ld a, b
	and a
	jp z, Func_1197
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
	ld a, JUMP_VEL_NORMAL
	ld [wJumpVelTable], a
	ret

.falling
	call Func_1488
	farcall Func_199e9
	ld a, b
	and a
	ret z
	update_pos_y
	xor a
	ld [wca8a], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	farcall Func_206eb
	ret
; 0x1eddf2

SetState_BallTurning: ; 1eddf2 (7b:5df2)
	xor a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	ld a, ST_BALL_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1ede1c
	load_frameset_ptr Frameset_1dd28e
	jr .asm_1ede26
.asm_1ede1c
	load_frameset_ptr Frameset_1dd287
.asm_1ede26
	update_anim_3
	ret
; 0x1ede36

UpdateState_BallTurning: ; 1ede36 (7b:5e36)
	update_anim_3
	ld a, [wAnimationHasFinished]
	and a
	ret z
	jp SetState_BallAirborne
; 0x1ede4d

Func_1ede4d: ; 1ede4d (7b:5e4d)
	call Func_1079
	call UpdateLevelMusic
	ld hl, Pals_c800
	call Func_1af6
	farcall StartJump_FromInput
	ret
; 0x1ede69

Func_1ede69: ; 1ede69 (7b:5e69)
	call Func_1079
	call UpdateLevelMusic
	ld hl, Pals_c800
	call Func_1af6
	farcall Func_1e174
	ret
; 0x1ede85

	INCROM $1ede85, $1edf93

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

Func_1ee02e: ; 1ee02e (7b:602e)
	call Func_1488
	farcall Func_2b1a6
	ld a, [wca86]
	cp $08
	jr c, .asm_1ee04c
	ld a, $04
	ld [wca86], a
.asm_1ee04c
	ret
; 0x1ee04d
