Func_20000: ; 20000 (8:4000)
	ld a, [wIsIntangible]
	and a
	ret nz ; quit if Wario is intangible
	ld a, [wIsFloorTransition]
	and a
	ret nz ; quit if floor is transitioning
	ld a, [wAutoMoveState]
	and a
	ret nz ; quit if auto-moving
	xor a
	ld [wIsOnSteppableObject], a

	ld hl, wObjects
.loop_objects
	ld a, h
	cp HIGH(wObjects) + 1
	ret z
	ld [wObjPtr + 0], a
	ld a, l
	ld [wObjPtr + 1], a
	ld a, [hl] ; OBJ_FLAGS
	and OBJFLAG_UNK0 | OBJFLAG_UNK1
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr z, .asm_20036
.next_obj
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld de, OBJ_STRUCT_LENGTH
	add hl, de
	jr .loop_objects

.asm_20036
	push hl
	ld e, OBJ_UNK_1D
	ld d, $00
	add hl, de
	ld a, [hld]
	ld [wc1b8], a
	ld a, [hl] ; OBJ_UNK_1c
	pop hl
	and a
	jr nz, .next_obj

	ld e, OBJ_INTERACTION_TYPE
	ld d, $00
	add hl, de
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ld [wObjInteractionType], a
	ld a, [hli] ; OBJ_UNK_09
	ld [wc1ba], a
	ld a, [hli] ; OBJ_UNK_0A
	ld [wc1bb], a
	ld a, [hli] ; OBJ_UNK_0B
	ld [wc1bc], a
	ld a, [hli] ; OBJ_UNK_0C
	ld [wc1bd], a
	ld a, [hli] ; OBJ_SCREEN_Y_POS
	ld [wObjScreenYPos], a
	ld a, [hl] ; OBJ_SCREEN_X_POS
	ld [wObjScreenXPos], a

	ld e, OBJ_UNK_1A - OBJ_SCREEN_X_POS
	ld d, $00
	add hl, de
	ld a, [hl] ; OBJ_UNK_1A
	bit 7, a
	jr nz, .asm_20074
	ld a, DIRECTION_LEFT
	jr .asm_20076
.asm_20074
	ld a, DIRECTION_RIGHT
.asm_20076
	ld [wEnemyDirection], a

	xor a
	ld [wInteractionSide], a
	ld a, $ff
	ld [wc1c2], a
	ld [wc1c1], a
	ld [wc1c3], a
	ld [wc1c4], a

	ld e, $d0
	ld hl, wc1ba
	ld a, [wObjScreenYPos]
	add [hl]
	sub e
	ld b, a ; wc1ba + wObjScreenYPos - $d0
	ld hl, wCollisionBoxBottom
	ld a, [wWarioScreenYPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld c, a
	ld hl, wCollisionBoxTop
	ld a, [wWarioScreenYPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bb
	ld a, [wObjScreenYPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld d, a
	ld a, d
	sub c
	jr c, .asm_200c9
	jr z, .asm_200c5

	ld a, c
	ld [wc1c1], a
	jr .asm_200cd
.asm_200c5
	ld a, c
	ld [wc1c1], a
.asm_200c9
	ld a, d
	ld [wc1c2], a
.asm_200cd

	ld hl, wc1bc
	ld a, [wObjScreenXPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wCollisionBoxRight
	ld a, [wWarioScreenXPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld c, a
	ld hl, wCollisionBoxLeft
	ld a, [wWarioScreenXPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bd
	ld a, [wObjScreenXPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld d, a
	sub c
	jr c, .asm_20108
	jr z, .asm_20104

	ld a, c
	ld [wc1c3], a
	jr .asm_2010c
.asm_20104
	ld a, c
	ld [wc1c3], a
.asm_20108
	ld a, d
	ld [wc1c4], a
.asm_2010c

	ld hl, wInteractionSide
	ld a, INTERACTION_LEFT | INTERACTION_RIGHT | INTERACTION_UP | INTERACTION_DOWN
	ld [hl], a
	ld a, [wc1c4]
	ld b, a
	ld a, [wc1c3]
	ld c, a
	cp b
	jr z, .asm_20126
	jr c, .asm_20123
	res INTERACTION_RIGHT_F, [hl]
	jr .asm_20126
.asm_20123
	res INTERACTION_LEFT_F, [hl]
	ld b, c
.asm_20126
	ld a, [wc1c2]
	ld d, a
	ld a, [wc1c1]
	ld e, a
	cp d
	jr z, .asm_2013a
	jr c, .asm_20137
	res INTERACTION_UP_F, [hl]
	jr .asm_2013a
.asm_20137
	res INTERACTION_DOWN_F, [hl]
	ld d, e
.asm_2013a
	ld a, b
	cp d
	jr z, .do_interaction
	jr c, .asm_20146
	res INTERACTION_LEFT_F, [hl]
	res INTERACTION_RIGHT_F, [hl]
	jr .do_interaction
.asm_20146
	res INTERACTION_UP_F, [hl]
	res INTERACTION_DOWN_F, [hl]

.do_interaction
	ld a, [wObjInteractionType]
	and $ff ^ (HEAVY_OBJ)
	jumptable

	dw Func_20b6b                   ; OBJ_INTERACTION_00
	dw Func_20d1d                   ; OBJ_INTERACTION_01
	dw ObjInteraction_FrontSting    ; OBJ_INTERACTION_FRONT_STING
	dw ObjInteraction_BackSting     ; OBJ_INTERACTION_BACK_STING
	dw ObjInteraction_TopSting      ; OBJ_INTERACTION_TOP_STING
	dw ObjInteraction_FullSting     ; OBJ_INTERACTION_FULL_STING
	dw Func_20d81                   ; OBJ_INTERACTION_06
	dw Func_20d8c                   ; OBJ_INTERACTION_07
	dw Func_20deb                   ; OBJ_INTERACTION_08
	dw Func_20e39                   ; OBJ_INTERACTION_09
	dw Func_20e60                   ; OBJ_INTERACTION_0A
	dw Func_20e6a                   ; OBJ_INTERACTION_0B
	dw Func_20e77                   ; OBJ_INTERACTION_0C
	dw ObjInteraction_MusicalCoin   ; OBJ_INTERACTION_MUSICAL_COIN
	dw Func_20e97                   ; OBJ_INTERACTION_0E
	dw Func_20f6a                   ; OBJ_INTERACTION_0F
	dw ObjInteraction_GreyKey       ; OBJ_INTERACTION_GREY_KEY
	dw ObjInteraction_RedKey        ; OBJ_INTERACTION_RED_KEY
	dw ObjInteraction_GreenKey      ; OBJ_INTERACTION_GREEN_KEY
	dw ObjInteraction_BlueKey       ; OBJ_INTERACTION_BLUE_KEY
	dw ObjInteraction_GreyTreasure  ; OBJ_INTERACTION_GREY_TREASURE
	dw ObjInteraction_RedTreasure   ; OBJ_INTERACTION_RED_TREASURE
	dw ObjInteraction_GreenTreasure ; OBJ_INTERACTION_GREEN_TREASURE
	dw ObjInteraction_BlueTreasure  ; OBJ_INTERACTION_BLUE_TREASURE
	dw Func_21156                   ; OBJ_INTERACTION_18
	dw Func_21245                   ; OBJ_INTERACTION_19
	dw Func_21358                   ; OBJ_INTERACTION_1A
	dw ObjInteraction_RegularCoin   ; OBJ_INTERACTION_REGULAR_COIN
	dw Func_21455                   ; OBJ_INTERACTION_1C
	dw Func_21548                   ; OBJ_INTERACTION_1D
	dw Func_21569                   ; OBJ_INTERACTION_1E
	dw Func_215a2                   ; OBJ_INTERACTION_1F
	dw Func_215e7                   ; OBJ_INTERACTION_20
	dw Func_2164f                   ; OBJ_INTERACTION_21
	dw Func_21675                   ; OBJ_INTERACTION_22
	dw Func_21774                   ; OBJ_INTERACTION_23
	dw Func_217b9                   ; OBJ_INTERACTION_24
	dw Func_21819                   ; OBJ_INTERACTION_25
	dw ObjInteraction_Bubble        ; OBJ_INTERACTION_BUBBLE
	dw Func_21887                   ; OBJ_INTERACTION_27
	dw ObjInteraction_Owl           ; OBJ_INTERACTION_OWL
	dw ObjInteraction_Rail          ; OBJ_INTERACTION_RAIL
	dw Func_20e0f                   ; OBJ_INTERACTION_2A
	dw Func_21a4f                   ; OBJ_INTERACTION_2B
	dw Func_21a47                   ; OBJ_INTERACTION_2C
	dw Func_21a52                   ; OBJ_INTERACTION_2D
	dw Func_21a8c                   ; OBJ_INTERACTION_2E
	dw Func_21a97                   ; OBJ_INTERACTION_2F
	dw Func_21ac3                   ; OBJ_INTERACTION_30
	dw Func_21af1                   ; OBJ_INTERACTION_31
	dw Func_21b08                   ; OBJ_INTERACTION_32
	dw Func_21b0b                   ; OBJ_INTERACTION_33
	dw Func_21b2b                   ; OBJ_INTERACTION_34
	dw Func_21b42                   ; OBJ_INTERACTION_35
	dw Func_21b78                   ; OBJ_INTERACTION_36
	dw Func_21573                   ; OBJ_INTERACTION_37
	dw Func_21b89                   ; OBJ_INTERACTION_38
	dw Func_21c17                   ; OBJ_INTERACTION_39
	dw Func_21c26                   ; OBJ_INTERACTION_3A
	dw Func_21c56                   ; OBJ_INTERACTION_3B
	dw Func_21c61                   ; OBJ_INTERACTION_3C
	dw Func_21c86                   ; OBJ_INTERACTION_3D
	dw Func_21c98                   ; OBJ_INTERACTION_3E
	dw Func_21ca8                   ; OBJ_INTERACTION_3F
	dw ObjInteraction_WaterTeleporting ; OBJ_INTERACTION_WATER_TELEPORTING
	dw Func_21ce9                   ; OBJ_INTERACTION_41
	dw Func_21cf8                   ; OBJ_INTERACTION_42
	dw Func_207ed                   ; OBJ_INTERACTION_43
	dw Func_21cfd                   ; OBJ_INTERACTION_44
	dw Func_21d17                   ; OBJ_INTERACTION_45
	dw Func_21d3b                   ; OBJ_INTERACTION_46
	dw Func_21d64                   ; OBJ_INTERACTION_47
	dw Func_21d6f                   ; OBJ_INTERACTION_48
	dw Func_21d88                   ; OBJ_INTERACTION_49
	dw ObjInteraction_ColourCoin    ; OBJ_INTERACTION_COLOUR_COIN
	dw Func_21df8                   ; OBJ_INTERACTION_4B
	dw Func_21e2e                   ; OBJ_INTERACTION_4C
	dw Func_21e3e                   ; OBJ_INTERACTION_4D
	dw Func_21e9c                   ; OBJ_INTERACTION_4E
	dw Func_21ea6                   ; OBJ_INTERACTION_4F
	dw Func_21ecd                   ; OBJ_INTERACTION_50
	dw Func_21f01                   ; OBJ_INTERACTION_51
	dw Func_21f28                   ; OBJ_INTERACTION_52
	dw ObjInteraction_None          ; OBJ_INTERACTION_UNUSED_1
	dw ObjInteraction_None          ; OBJ_INTERACTION_UNUSED_2
	dw ObjInteraction_None          ; OBJ_INTERACTION_UNUSED_3
	dw ObjInteraction_None          ; OBJ_INTERACTION_UNUSED_4
	dw ObjInteraction_None          ; OBJ_INTERACTION_UNUSED_5
	dw ObjInteraction_None          ; OBJ_INTERACTION_UNUSED_6
; 0x20202

ObjInteraction_None: ; 20202 (8:4202)
	ret
; 0x20203

Func_20203: ; 20203 (8:4203)
	ld hl, wObjects
	ld de, OBJ_STRUCT_LENGTH
.loop_objects
	ld a, h
	cp HIGH(wCurObj)
	ret z
	ld a, [hl] ; OBJ_FLAGS
	and OBJFLAG_UNK0 | OBJFLAG_UNK1
	cp OBJFLAG_UNK0
	jr z, .asm_2021b
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr z, .asm_2021b
.next_obj
	add hl, de
	jr .loop_objects
.asm_2021b
	ld a, [wObjPtr + 1]
	cp l
	jr z, .next_obj
	push hl
	ld c, OBJ_UNK_1C
	ld b, $00
	add hl, bc
	ld [hl], $08
	pop hl
	jr .next_obj
; 0x2022c

Func_2022c: ; 2022c (8:422c)
	ld a, [wIsRolling]
	and a
	jp nz, AttackObject
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
;	fallthrough

Func_2023b: ; 2023b (8:423b)
	ld a, [wTouchState]
	and a
	jr z, .asm_20257
	cp TOUCH_BUMP
	jr z, .asm_20257
	cp TOUCH_VULNERABLE
	jp z, Func_20939
	cp TOUCH_ATTACK
	jp z, AttackObject
	cp TOUCH_VANISH
	jp z, Func_205e7
	jp Func_20000.next_obj

.asm_20257
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject

	ld b, $01
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	cp $01
	ret z ; is invincible
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, Func_2028a
	and a
	ret nz

	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20283
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .wario_bump
.asm_20283
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.wario_bump
	jr SetState_EnemyBumping
; 0x2028a

Func_2028a: ; 2028a (8:428a)
	ld a, [wJumpVelTable]
	and a
	ret z
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_202a0
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_202a5
.asm_202a0
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_202a5
	farcall SetState_FlatFalling
	ret
; 0x202b5

SetState_EnemyBumping: ; 202b5 (8:42b5)
	play_sfx SFX_BUMP
	ld a, $0e
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wJumpVelTable], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wGrabState], a

	ld a, WST_ENEMY_BUMPING
	ld [wWarioState], a

	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wIsCrouching]
	and a
	jr nz, .crouching
	ld a, [wDirection]
	and a
	jr nz, .asm_20326
	load_frameset Frameset_14a71
.asm_20316
	update_anim_1
	ret
.asm_20326
	load_frameset Frameset_14a6c
	jr .asm_20316

.crouching
	ld a, [wDirection]
	and a
	jr nz, .asm_20344
	load_frameset Frameset_14a3b
	jr .asm_20316
.asm_20344
	load_frameset Frameset_14a38
	jr .asm_20316
; 0x20350

; routine called when an object is attacked
; whether by Wario's B attack, Fat Wario bump, rolling, etc.
AttackObject: ; 20350 (8:4350)
	play_sfx SFX_017
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20382

	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add $08
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_203a0

.asm_20382
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

.asm_203a0
	ld b, PARTICLE_STARS
	farcall CreateParticle
	ld b, $02
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .fat
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jr z, .snowman
	and a
	ret nz

	ld a, [wIsRolling]
	and a
	jr z, .not_rolling
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	ret z
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	ret nc
	farcall DoJumpingBump_NoSFX
	ret

.not_rolling
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_203fc
	farcall DoJumpingBump_NoSFX
	ret

.asm_203fc
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_20412
	farcall SetState_Idling
	ret
.asm_20412
	farcall StartFall
	ret

.fat
	farcall SetState_FatBumping
	ret

.snowman
	ld a, [wca8f]
	and a
	ret nz
	farcall SetState_UnknownCA
	ret
; 0x20447

; routine called when Wario steps on an object
StepOnObject: ; 20447 (8:4447)
; no stun if Wario is invincible
	ld a, [wInvincibleCounter]
	cp $01
	ret z

	ld a, [wIsSmashAttacking]
	dec a
	jr nz, .no_smash_attack
; Wario is smash attacking
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, Func_205e7
	jp Func_20602

.no_smash_attack
	ld a, [wTransformation]
	and a
	jp nz, .Transformed

; not transformed
	xor a
	ld [wAttackCounter], a

; stepping on object while rolling is attacking
	ld a, [wIsRolling]
	and a
	jp nz, AttackObject

	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .on_left
; on right
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_2048c
.on_left
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_2048c
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_20506
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wObjScreenYPos]
	cp b
	jr c, .asm_20506

	ld a, [wGrabState]
	and $ff ^ (GRAB_FLAGS_MASK)
	cp GRAB_IDLE
	jr z, .grabbing
; clear grab state
	xor a
	ld [wGrabState], a

	ld a, [wIsCrouching]
	and a
	jr nz, .crouching_1
	ld a, [wJoypadDown]
	and a
	jp z, .no_input
	farcall StartJump_FromInput
	jr .asm_204e8

.crouching_1
	farcall StartCrouchJump
	jr .asm_204e8

.grabbing
	farcall Func_1ede9

.asm_204e8
	ld a,TRUE
	ld [wDoFullJump], a
	ld a, $0a
	ld [wJumpVelIndex], a

	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_20578
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	jr c, .asm_20578
	xor a ; full jump
	ld [wJumpVelIndex], a
	jr .asm_20578

.asm_20506
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wIsCrouching]
	and a
	jr nz, .crouching_2

	ld a, [wGrabState]
	and $ff ^ (GRAB_FLAGS_MASK)
	cp GRAB_IDLE
	jr z, .asm_20547
	xor a
	ld [wGrabState], a
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_20536
	farcall SetState_Idling
	jr .asm_20578

.asm_20536
	farcall StartFall
	jr .asm_20578

.asm_20547
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20578
	farcall Func_1edd3
	jr .asm_20578

.crouching_2
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20578
	farcall StartCrouchFall
	jr .asm_20578

.no_input
	call Func_20939
.asm_20578
	play_sfx SFX_014
	ld b, $04
	jp SetObjUnk1C

.Transformed
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	jr nz, .not_hot_wario
	ld a, [wca8f]
	cp $02
	jr nc, Func_205e7
.not_hot_wario

	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, AttackObject
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_205af
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_205b7
.asm_205af
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_205b7
	play_sfx SFX_014
	ld b, $04
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, Func_2028a
	cp TRANSFORMATION_BOUNCY_WARIO
	jr z, .asm_205d1
	ret
.asm_205d1
	ld a, [wTouchState]
	cp TOUCH_PASS_THROUGH
	ret z
	farcall Func_2a0b2
	ret
; 0x205e7

Func_205e7: ; 205e7 (8:45e7)
	ld b, $05
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	ret nz
	farcall SetState_ZombieKnockBack
	ret
; 0x20602

Func_20602: ; 20602 (8:4602)
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_2060c
	and a
	jr nz, Func_205e7
.asm_2060c
	ld a, [wGrabState]
	and $ff ^ (GRAB_FLAGS_MASK)
	cp GRAB_IDLE
	jr z, .asm_2062a
	xor a
	ld [wGrabState], a
	farcall StartJump_FromInput
	jr .asm_20639
.asm_2062a
	farcall Func_1ede9
.asm_20639
	ld a, TRUE
	ld [wDoFullJump], a
	ld a, $0a
	ld [wJumpVelIndex], a
	ld a, [wJoypadDown]
	bit A_BUTTON_F, a
	jr z, .asm_20655
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	jr c, .asm_20655
	xor a
	ld [wJumpVelIndex], a
.asm_20655
	ld b, $05
;	fallthrough

SetObjUnk1C: ; 20657 (8:4657)
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld e, OBJ_UNK_1C
	ld d, $00
	add hl, de
	ld [hl], b
	inc l
	ld a, [wInteractionSide]
	ld b, a
	ld a, [hl] ; OBJ_UNK_1D
	and $0f
	or b
	ld [hl], a
	ret
; 0x20670

Func_20670: ; 20670 (8:4670)
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20939

; if Wario is rolling, do attack
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .check_rolling
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr nz, .asm_2068c
.check_rolling
	ld a, [wIsRolling]
	and a
	jp nz, AttackObject

.asm_2068c
	ld a, [wStingTouchState]
	and a
	jr z, .asm_206a8
	cp TOUCH_VULNERABLE
	jr z, .asm_206a8
	cp TOUCH_BUMP
	jp z, Func_2023b
	cp TOUCH_ATTACK
	jp z, AttackObject
	cp TOUCH_VANISH
	jp z, Func_205e7
	jp Func_20000.next_obj

.asm_206a8
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_206bc
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_206c4
.asm_206bc
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_206c4
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_206d2
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_206d7
.asm_206d2
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.asm_206d7
	ld b, $06
	call SetObjUnk1C
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wStingTouchState]
	cp TOUCH_VULNERABLE
	jr z, Func_206eb
	jr SetState_Stung
; 0x206eb

Func_206eb: ; 206eb (8:46eb)
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, ReleaseOwl
	call ClearTransformationValues
	call UpdateLevelMusic
;	fallthrough

SetState_Stung: ; 206f9 (8:46f9)
	ld a, $01
	ld [wInvincibleCounter], a

	play_sfx SFX_STING

	ld a, WST_STUNG
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld a, $6
	ld [wJumpVelIndex], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, [wIsCrouching]
	and a
	jr z, .asm_20774
	ld a, -27
	ld [wCollisionBoxTop], a

	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a

	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_20780

	xor a
	ld [wIsCrouching], a
	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a

.asm_20774
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	jr .asm_20799

.asm_20780
	ld a, -15
	ld [wCollisionBoxTop], a
	xor a ; JUMP_VEL_NONE
	ld [wJumpVelTable], a

	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a

.asm_20799
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_207d3
	load_frameset Frameset_15f7f
	jr .asm_207dd
.asm_207d3
	load_frameset Frameset_15f70
.asm_207dd
	update_anim_1
	ret
; 0x207ed

Func_207ed: ; 207ed (8:47ed)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wStingTouchState]
	and a
	jr z, .asm_20808
	cp TOUCH_BUMP
	jp z, Func_208f2.start
	cp TOUCH_VANISH
	jp z, Func_2092d
	ret

.asm_20808
	ld b, $06
	call SetObjUnk1C
;	fallthrough

SetState_WaterStung: ; 2080d (8:480d)
	play_sfx SFX_STING
	ld a, $01
	ld [wInvincibleCounter], a
	ld a, WST_WATER_STUNG
	ld [wWarioState], a
	xor a
	ld [wSwimVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, TRUE
	ld [wIsIntangible], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -15
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_2087f
	load_frameset Frameset_15f70
	jr .asm_20889
.asm_2087f
	load_frameset Frameset_15f7f
.asm_20889
	update_anim_1
	ret
; 0x20899

Func_20899: ; 20899 (8:4899)
	ld a, [wStingTouchState]
	and a
	jr z, .asm_208a9
	cp TOUCH_BUMP
	jr z, .asm_208a9
	cp TOUCH_VANISH
	jp z, Func_2092d
	ret

.asm_208a9
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_208c2
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_208ca
.asm_208c2
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_208ca
	play_sfx SFX_014
	ld b, $04
	call SetObjUnk1C
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	ret nz
	farcall StartDive
	ret
; 0x208f2

Func_208f2: ; 208f2 (8:48f2)
	jr .start

.Func_208f4
	ld b, $01
	call SetObjUnk1C
	ret

.start
	ld a, [wStingTouchState]
	and a
	jr z, .asm_2090a
	cp TOUCH_BUMP
	jr z, .asm_2090a
	cp TOUCH_VANISH
	jp z, Func_2092d
	ret

.asm_2090a
	ld a, [wWaterInteraction]
	and a
	ret z
	call .Func_208f4
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	and a
	ret nz
	farcall StartDive
	ret
; 0x2092d

Func_2092d: ; 2092d (8:492d)
	ld b, $05
	jp SetObjUnk1C
; 0x20932

Func_20932: ; 20932 (8:4932)
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
;	fallthrough

Func_20939: ; 20939 (8:4939)
	ld a, [wTouchState]
	and a
	jp nz, Func_2023b
	ld b, $06
	call SetObjUnk1C
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	farcall DoJumpingBump
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_oam OAM_1426c
	xor a
	ld [wGrabState], a
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_209b4
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_14a79
.asm_209a4
	update_anim_1
	ret
.asm_209b4
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_14a76
	jr .asm_209a4
; 0x209ca

Func_209ca: ; 209ca (8:49ca)
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	jr nz, .asm_209d5
	; airborne
	xor a
	ld [wAttackCounter], a
.asm_209d5
	ld a, [wWaterInteraction]
	and a
	ret nz
	ld a, [wWarioState]
	cp WST_DIVING
	ret z
	ld a, TRUE
	ld [wIsOnSteppableObject], a
	ld a, [wc1c1]
	and a
	jr z, .asm_209f5
	cp $03
	jr c, .asm_209f1
	ld a, $02
.asm_209f1
	ld b, a
	call SubYOffset
.asm_209f5
	ld b, $09
	call SetObjUnk1C
	ld a, [wJumpVelTable]
	and a
	jr z, .done
	ld a, [wAttackCounter]
	and a
	jr nz, .done
	ld a, [wIsRolling]
	and a
	jr nz, .done
	call TriggerFloorTransition_SkipUpdateYPos
	ld a, [wInvincibleCounter]
	cp $01
	jr z, .done
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wGrabState]
	and a
	jr nz, .set_grab_state
	ld a, [wIsCrouching]
	and a
	jr nz, .crouching
	xor a
	ld [wWaterInteraction], a
	farcall SetState_Idling
	jr .done

.crouching
	xor a
	ld [wWaterInteraction], a
	farcall CrouchOrSlideIfOnSlope
	jr .done

.set_grab_state
	farcall SetState_GrabIdling
.done
	jp Func_20000.next_obj
; 0x20a63

Func_20a63: ; 20a63 (8:4a63)
	ld b, $07
	call SetObjUnk1C
	ret
; 0x20a69

Func_20a69: ; 20a69 (8:4a69)
	ld b, $0d
	call SetObjUnk1C
	ret
; 0x20a6f

Func_20a6f: ; 20a6f (8:4a6f)
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20aa5
.asm_20a79
	ld a, [wDirection]
	and a
	jp z, Func_20000.next_obj
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20acf
	ld a, [wc1c3]
	cp $ff
	jr z, .asm_20aa5
	ld b, a
	call SubXOffset
	jr .asm_20acf

.asm_20aa5
	ld a, [wDirection]
	and a
	jp nz, Func_20000.next_obj
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20acf
	ld a, [wc1c4]
	cp $ff
	jr z, .asm_20a79
	ld b, a
	call AddXOffset
.asm_20acf
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_20aff
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	jr z, .asm_20b15
	cp (1 << 6) | TRANSFORMATION_ICE_SKATIN
	jr z, .asm_20b2b
	xor a
	ld [wWalkVelIndex], a
	ld a, [wIsRolling]
	and a
	jr nz, .asm_20aef
	ld a, [wAttackCounter]
	and a
	jp z, Func_20000.next_obj

.asm_20aef
	farcall DoJumpingBump
	ret

.asm_20aff
	ld a, [wca8f]
	cp $01
	ret nz
	farcall Func_28bd5
	ret

.asm_20b15
	ld a, [wca8f]
	cp $01
	ret nz
	farcall Func_2afc5
	ret

.asm_20b2b
	ld a, [wWarioState]
	cp WST_ICE_SKATIN_CRASH
	ret z
	farcall Func_1ec215
	ret
; 0x20b41

Func_20b41: ; 20b41 (8:4b41)
	ld a, [wTouchState]
	and a
	jr z, .asm_20b5e
	cp TOUCH_BUMP
	jp z, Func_20a6f
	cp TOUCH_VULNERABLE
	jp z, Func_20a6f
	cp TOUCH_ATTACK
	jp z, AttackObject
	cp TOUCH_VANISH
	jp z, Func_205e7
	jp Func_20a6f

.asm_20b5e
	ld a, [wTouchState]
	and a
	ret nz
	call Func_20939
	ld b, $12
	jp SetObjUnk1C
; 0x20b6b

Func_20b6b: ; 20b6b (8:4b6b)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
	ld a, [wTouchState]
	and a
	jr z, .check_water
	cp TOUCH_ATTACK
	jp z, AttackObject
	cp TOUCH_VANISH
	jp z, Func_205e7
	cp TOUCH_PASS_THROUGH
	jp z, Func_20000.next_obj
	jp .asm_20c41

.check_water
	ld a, [wWarioState]
	cp WST_DIVING
	jr c, .not_in_water
	cp WST_TRYING_SUBMERGE + 1
	jp c, Func_20899

.not_in_water
	ld a, [wIsRolling]
	ld b, a
	ld a, [wAttackCounter]
	or b
	jp nz, AttackObject

	ld a, [wIsCrouching]
	ld b, a
	ld a, [wGrabState]
	or b
	jp nz, .asm_20c41

	ld a, [wPowerUpLevel]
	cp POWER_UP_GRAB_GLOVE
	jp c, .asm_20c41
	ld a, [wWarioState]
	cp WST_LADDER_SCRATCHING
	jp z, .asm_20c41
	cp WST_LADDER_CLIMBING
	jr c, .asm_20bc6
	cp WST_LADDER_SLIDING + 1
	jp c, .asm_20c41
.asm_20bc6
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20bdd
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld a, [wDirection]
	and a
	jr nz, .check_invincible_counter
	jr .asm_20c41
.asm_20bdd
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, [wDirection]
	and a
	jr nz, .asm_20c41
.check_invincible_counter
	ld a, [wInvincibleCounter]
	cp 1
	ret z
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr nz, .heavy_obj
	ld a, GRAB_PICK_UP
	ld [wGrabState], a
	jr .asm_20c1d
.heavy_obj
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_GRAB_GLOVES
	jr c, .asm_20c41
	ld a, GRAB_PICK_UP | (1 << GRAB_HEAVY_F)
	ld [wGrabState], a

.asm_20c1d
	ld b, $03
	call SetObjUnk1C

	ld a, [wJumpVelTable]
	and a
	jr z, .pick_up
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_20c31
	jr .asm_20c41
.asm_20c31
	farcall Func_1edd3
	ret

.asm_20c41
	jp StepOnObject
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20c56
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	jp Func_2023b

.asm_20c56
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	jp Func_2023b

.pick_up
	play_sfx SFX_GRAB

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, WST_PICKING_UP
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	load_gfx WarioThrowGfx
	call LoadWarioGfx
	load_oam OAM_1606a

	ld a, [wDirection]
	and a
	jr nz, .asm_20cdb
	ld a, [wIsStandingOnSlope]
	bit 1, a
	jr nz, .asm_20cf5
	ld a, [wGrabState]
	and (1 << GRAB_HEAVY_F)
	jr nz, .asm_20d05
	load_frameset Frameset_163ec
.asm_20ccb
	update_anim_1
	ret
.asm_20cdb
	ld a, [wIsStandingOnSlope]
	bit 0, a
	jr nz, .asm_20cf5
	ld a, [wGrabState]
	and (1 << GRAB_HEAVY_F)
	jr nz, .asm_20d11
	load_frameset Frameset_1640c
	jr .asm_20ccb
.asm_20cf5
	farcall SetState_GrabIdling
	ret
.asm_20d05
	load_frameset Frameset_163f5
	jr .asm_20ccb
.asm_20d11
	load_frameset Frameset_16415
	jr .asm_20ccb
; 0x20d1d

Func_20d1d: ; 20d1d (8:4d1d)
	jp Func_2022c
; 0x20d20

ObjInteraction_FrontSting: ; 20d20 (8:4d20)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20d44
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20d39
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d39
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d44
	jp StepOnObject
; 0x20d47

ObjInteraction_BackSting: ; 20d47 (8:4d47)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20d6b
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20d60
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d60
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d6b
	jp StepOnObject
; 0x20d6e

ObjInteraction_TopSting: ; 20d6e (8:4d6e)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20670
	bit INTERACTION_DOWN_F, a
	jp nz, StepOnObject
	jp Func_2022c
; 0x20d7e

ObjInteraction_FullSting: ; 20d7e (8:4d7e)
	jp Func_20670
; 0x20d81

Func_20d81: ; 20d81 (8:4d81)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	jp Func_208f2
; 0x20d8c

Func_20d8c: ; 20d8c (8:4d8c)
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_207ed

	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_20ddb
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20dbe
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_20dcb
.asm_20dbe
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

.asm_20dcb
	farcall SetState_SwimKnockBack
	ret

.asm_20ddb
	farcall StartDive
	ret
; 0x20deb

Func_20deb: ; 20deb (8:4deb)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_20e04
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_207ed
	jp Func_208f2
.asm_20e04
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_207ed
	jp Func_208f2
; 0x20e0f

Func_20e0f: ; 20e0f (8:4e0f)
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20899
	bit INTERACTION_UP_F, a
	jp nz, Func_207ed

	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20e2e
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_207ed
	jp Func_208f2
.asm_20e2e
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_207ed
	jp Func_208f2
; 0x20e39

Func_20e39: ; 20e39 (8:4e39)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20e5d
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20e52
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20939
	jp Func_2022c
.asm_20e52
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20939
	jp Func_2022c
.asm_20e5d
	jp StepOnObject
; 0x20e60

Func_20e60: ; 20e60 (8:4e60)
	jp Func_20939
; 0x20e63

Func_20e63: ; 20e63 (8:4e63)
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
;	fallthrough

Func_20e6a: ; 20e6a (8:4e6a)
	call Func_20939
	ld a, [wTouchState]
	and a
	ret nz
	ld b, $0a
	jp SetObjUnk1C
; 0x20e77

Func_20e77: ; 20e77 (8:4e77)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21aac
	jp Func_20932
; 0x20e82

ObjInteraction_MusicalCoin: ; 20e82 (8:4e82)
	ld hl, wNumMusicalCoins
	ld a, [hl]
	cp NUM_LEVEL_MUSICAL_COINS
	jp nc, Func_20000.next_obj
	inc [hl]
	play_sfx SFX_MUSICAL_COIN
	jp CollectMusicalCoin
; 0x20e97

Func_20e97: ; 20e97 (8:4e97)
	ld b, $06
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c

	ld a, (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	ld [wTransformation], a

	ld a, $01
	ld [wca8f], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	ld a, HIGH(HOT_WARIO_DURATION)
	ld [wTransformationDuration + 0], a
	ld a, LOW(HOT_WARIO_DURATION)
	ld [wTransformationDuration + 1], a

	call UpdateLevelMusic
;	fallthrough

SetState_OnFire_ResetStateCounter: ; 20ecf (8:4ecf)
	xor a
	ld [wWarioStateCounter], a
;	fallthrough

SetState_OnFire: ; 20ed3 (8:4ed3)
	ld a, WST_ON_FIRE
	ld [wWarioState], a

	xor a
	ld [wInvisibleFrame], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, [wWarioStateCounter]
	and a
	ret nz

	ld hl, Pals_c820
	call SetWarioPal

	load_gfx WarioHotGfx
	call LoadWarioGfx
	load_oam OAM_1673c

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_20f50
	load_frameset Frameset_16b38
	jr .asm_20f5a
.asm_20f50
	load_frameset Frameset_16b49
.asm_20f5a
	update_anim_1
	ret
; 0x20f6a

Func_20f6a: ; 20f6a (8:4f6a)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_20f78
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_20f82
	jp Func_20932

.asm_20f78
	ld a, [wIsSmashAttacking]
	dec a
	jp z, Func_20602
	jp StepOnObject
.asm_20f82
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a
	ld a, [wLadderInteraction]
	cp $02
	jr z, .asm_20fdb
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20fdb
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20fdb
	ld b, $0b
	call SetObjUnk1C
	farcall SetState_FlatAirborne
	ret

.asm_20fdb
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	jp StepOnObject
; 0x20fe8

; unreferenced?
Func_20fe8: ; 20fe8 (8:4fe8)
	ld b, $06
	jp SetObjUnk1C
; 0x20fed

ObjInteraction_GreyKey: ; 20fed (8:4fed)
	ld hl, wKeyAndTreasureFlags
	set GREY_KEY_F, [hl]
	jr CollectKey
; 0x20ff4

ObjInteraction_RedKey: ; 20ff4 (8:4ff4)
	ld hl, wKeyAndTreasureFlags
	set RED_KEY_F, [hl]
	jr CollectKey
; 0x20ffb

ObjInteraction_GreenKey: ; 20ffb (8:4ffb)
	ld hl, wKeyAndTreasureFlags
	set GREEN_KEY_F, [hl]
	jr CollectKey
; 0x21002

ObjInteraction_BlueKey: ; 21002 (8:5002)
	ld hl, wKeyAndTreasureFlags
	set BLUE_KEY_F, [hl]
;	fallthrough

CollectKey: ; 21007 (8:5007)
	play_sfx SFX_KEY
	call Func_20a63
	ld a, ST_COLLECT_KEY
	ld [wState], a
	xor a
	ld [wTimer], a
	ret
; 0x2101c

ObjInteraction_GreyTreasure: ; 2101c (8:501c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit GREY_KEY_F, [hl]
	jp z, Func_20a6f
	set 4, [hl]
	ld a, LVLEND_GREY_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2103c

ObjInteraction_RedTreasure: ; 2103c (8:503c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit RED_KEY_F, [hl]
	jp z, Func_20a6f
	set 5, [hl]
	ld a, LVLEND_RED_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2105c

ObjInteraction_GreenTreasure: ; 2105c (8:505c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit GREEN_KEY_F, [hl]
	jp z, Func_20a6f
	set 6, [hl]
	ld a, LVLEND_GREEN_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2107c

ObjInteraction_BlueTreasure: ; 2107c (8:507c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit BLUE_KEY_F, [hl]
	jp z, Func_20a6f
	set 7, [hl]
	ld a, LVLEND_BLUE_TREASURE
	ld [wLevelEndScreen], a
;	fallthrough

GetTreasure: ; 2109a (8:509a)
	stop_music
	call Func_20a63
	call Func_20203

	ld hl, wLevelEndScreen
	ld a, [hl]
	cp LVLEND_NO_TREASURE
	ret z
	set 7, [hl]
	ld a, TRUE
	ld [wResetDisabled], a
	xor a
	ld [wWalkVelIndex], a

	ld a, WST_UNKNOWN_40
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wJumpVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wIsCrouching], a
	ld [wAttackCounter], a

	inc a ; TRUE
	ld [wIsIntangible], a
	ld [wAutoMoveState], a

	ld a, [wJumpVelTable]
	and a
	jr z, .asm_210ea
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_210ea
	ld hl, Pals_c800
	call SetWarioPal
	load_gfx WarioIdleGfx
	call LoadWarioGfx

	load_oam OAM_14000

	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21130
	ld a, [wc1c3]
	ld b, a
	call SubXOffset
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_1425f
	jr .asm_21146
.asm_21130
	ld a, [wc1c4]
	ld b, a
	call AddXOffset
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_14252
.asm_21146
	update_anim_1
	ret
; 0x21156

Func_21156: ; 21156 (8:5156)
	ld a, [wJumpVelTable]
	and a
	jp nz, Func_2022c
	ld b, $0c
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, SetState_FlatStretching
	and a
	jp nz, Func_2022c

	ld a, $01
	ld [wAutoMoveState], a
	ld a, WST_PICKED_UP
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wIsSmashAttacking], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wGrabState], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	inc a
	ld [wJumpVelTable], a
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a

	load_gfx WarioAirborneGfx
	call LoadWarioGfx

	load_oam OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_211e1
	load_frameset Frameset_15f70
	jr .asm_211eb
.asm_211e1
	load_frameset Frameset_15f7f
.asm_211eb
	update_anim_1
	ret
; 0x211fb

SetState_FlatStretching: ; 211fb (8:51fb)
	ld a, $01
	ld [wAutoMoveState], a
	ld a, WST_FLAT_STRETCHING
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -8
	ld [wCollisionBoxTop], a
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_frameset Frameset_17193
	update_anim_1
	ret
; 0x21245

Func_21245: ; 21245 (8:5245)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_21267
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_2125d
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, Func_2126a
	jp Func_2022c

.asm_2125d
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, Func_2126a
	jp Func_2022c

.asm_21267
	jp StepOnObject
; 0x2126a

Func_2126a: ; 2126a (8:526a)
	ld a, [wIsCrouching]
	and a
	jr z, .asm_21290
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr z, .asm_21290
	ld a, -15
	ld [wCollisionBoxTop], a
	jp Func_2022c

.asm_21290
	ld b, $06
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2023b
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_212b3

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_212b8
.asm_212b3
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_212b8
	play_sfx SFX_039

	ld a, (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	ld [wTransformation], a
	xor a
	ld [wca8f], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	call UpdateLevelMusic

	ld a, WST_GETTING_WRAPPED_IN_STRING
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld hl, Pals_c860
	call SetWarioPal

	load_gfx WarioStringGfx
	call LoadWarioGfx

	load_oam OAM_171c0

	load_frameset Frameset_17414
	update_anim_1
	ret
; 0x21358

Func_21358: ; 21358 (8:5358)
	ld a, [wIsCrouching]
	and a
	jp nz, Func_20a69
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_20a69
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr nz, .asm_21373
	jp Func_20a69

.asm_21373
	call Func_20a63
	ld a, (1 << 7) | TRANSFORMATION_FAT_WARIO
	ld [wTransformation], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	ld a, HIGH(FAT_WARIO_DURATION)
	ld [wTransformationDuration + 0], a
	ld a, LOW(FAT_WARIO_DURATION)
	ld [wTransformationDuration + 1], a

	xor a
	ld [wInvisibleFrame], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a

	ld a, [wJumpVelTable]
	and a
	jr z, .asm_213bb
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_213bb
	play_sfx SFX_03A
	call UpdateLevelMusic

	ld a, WST_FAT_EATING
	ld [wWarioState], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_gfx WarioFatGfx
	call LoadWarioGfx

	load_oam OAM_1742d

	ld a, [wDirection]
	and a
	jr nz, .asm_21419
	load_frameset Frameset_1789c
	jr .asm_21423
.asm_21419
	load_frameset Frameset_178c3
.asm_21423
	update_anim_1
	ret
; 0x21433

ObjInteraction_RegularCoin: ; 21433 (8:5433)
	ld hl, wNumCoins + 1
	ld a, [hl]
	add $1
	daa
	ld [hld], a
	ld a, [hl]
	adc $00
	daa
	ld [hl], a
	and $f0
	jr z, .no_cap
	ld a, HIGH(MAX_NUM_COINS)
	ld [hli], a
	ld a, LOW(MAX_NUM_COINS)
	ld [hl], a
.no_cap
	play_sfx SFX_REGULAR_COIN
	jp Func_20a63
; 0x21455

Func_21455: ; 21455 (8:5455)
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_21469
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_21471

.asm_21469
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_21471
	ld b, $06
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	cp (1 << 7) | TRANSFORMATION_ELECTRIC
	ret z
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21492
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_21497
.asm_21492
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.asm_21497
	play_sfx SFX_040

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wInvisibleFrame], a

	ld a, WST_ELECTRIC_START
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	ld a, (1 << 7) | TRANSFORMATION_ELECTRIC
	ld [wTransformation], a
	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld hl, Pals_c870
	call SetWarioPal

	load_gfx WarioElectricGfx
	call LoadWarioGfx

	load_oam OAM_1790e

	ld a, [wDirection]
	and a
	jr nz, .asm_2152e
	load_frameset Frameset_17b79
	jr .asm_21538
.asm_2152e
	load_frameset Frameset_17b76
.asm_21538
	update_anim_1
	ret
; 0x21548

Func_21548: ; 21548 (8:5548)
	call Func_20a63
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	cp TRANSFORMATION_INVISIBLE_WARIO
	ret z
	farcall SetState_TurningInvisible
	ret
; 0x21569

Func_21569: ; 21569 (8:5569)
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, Func_21573
	jp Func_2022c
; 0x21573

Func_21573: ; 21573 (8:5573)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	cp TRANSFORMATION_PUFFY_WARIO
	jp z, Func_2022c
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, ReleaseOwl
	ld b, $06
	call SetObjUnk1C
	farcall SetState_PuffyInflating
	ret
; 0x215a2

Func_215a2: ; 215a2 (8:55a2)
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20a69
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	jp z, Func_205e7
	bit 6, a
	jp nz, Func_20a69

	ld b, $06
	call SetObjUnk1C

	play_sfx SFX_028

	ld a, (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	ld [wTransformation], a
	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_ZombieIdling
	ret
; 0x215e7

Func_215e7: ; 215e7 (8:55e7)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_21600
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, Func_2160a
	jp Func_2022c
.asm_21600
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, Func_2160a
	jp Func_2022c
; 0x2160a

Func_2160a: ; 2160a (8:560a)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld b, $06
	call SetObjUnk1C
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	cp TRANSFORMATION_BOUNCY_WARIO
	jp z, Func_2022c
	ld a, TRANSFORMATION_BOUNCY_WARIO
	ld [wTransformation], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a

	ld a, HIGH(BOUNCY_WARIO_DURATION)
	ld [wTransformationDuration + 0], a
	ld a, LOW(BOUNCY_WARIO_DURATION)
	ld [wTransformationDuration + 1], a

	farcall SetState_BouncyStart
	ret
; 0x2164f

Func_2164f: ; 2164f (8:564f)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_21668
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21672
	jp Func_2022c
.asm_21668
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21672
	jp Func_2022c
.asm_21672
	jp Func_20e97
; 0x21675

Func_21675: ; 21675 (8:5675)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jr nz, Func_2168b
	ld a, [wAttackCounter]
	and a
	jp nz, Func_217a9
	jp Func_20a6f
; 0x2168b

Func_2168b: ; 2168b (8:568b)
	ld a, [wWarioState]
	cp WST_FLAT_SQUISHED
	jr nz, .asm_216a2
	farcall SetState_FlatSquishedLifting
	ret

.asm_216a2
	ld a, [wc1c2]
	cp $10
	jr c, .asm_216ab
	ld a, $0c
.asm_216ab
	ld b, a
	call AddYOffset
	farcall Func_19b25
	ld a, [wWaterInteraction]
	and a
	jr z, .asm_216d4
	farcall DiveFromSurface_SkipSplash
	ret

.asm_216d4
	farcall CheckCentreCollision
	ld a, b
	and a
	jr nz, .asm_21710
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .asm_2173e
	and a
	ret nz
	ld a, [wIsCrouching]
	and a
	jr nz, .crouching
	xor a
	ld [wGrabState], a
	farcall StartFall
	ret

.asm_21710
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .asm_2175e
	and a
	ret nz
	xor a
	ld [wGrabState], a
	farcall SetState_Idling
	ret

.asm_2173e
	farcall SetState_FlatFalling
	ret

.crouching
	farcall StartCrouchFall
	ret

.asm_2175e
	ld a, [wWarioState]
	cp WST_FLAT_SQUISHED
	ret z
	farcall SetState_FlatIdling
	ret
; 0x21774

Func_21774: ; 21774 (8:5774)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_21789
	ld a, [wAttackCounter]
	and a
	jr nz, Func_217a9
	jp Func_20a6f
.asm_21789
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	ld b, $0b
	call SetObjUnk1C
	farcall SetState_FlatAirborne
	ret
; 0x217a9

Func_217a9: ; 217a9 (8:57a9)
	farcall DoJumpingBump
	ret
; 0x217b9

Func_217b9: ; 217b9 (8:57b9)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_217db
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_217d1
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_217de
	jp Func_2022c
.asm_217d1
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_217de
	jp Func_2022c
.asm_217db
	jp StepOnObject

.asm_217de
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	cp TRANSFORMATION_CRAZY_WARIO
	jp z, Func_2022c

	ld b, $06
	call SetObjUnk1C

	ld a, TRANSFORMATION_CRAZY_WARIO
	ld [wTransformation], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	farcall SetState_CrazySpinning
	ret
; 0x21819

Func_21819: ; 21819 (8:5819)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz

	ld b, $06
	call SetObjUnk1C

	ld a, (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	ld [wTransformation], a
	farcall Func_19b25
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	ret nz
	farcall SetState_VampireTransforming
	ret
; 0x21853

ObjInteraction_Bubble: ; 21853 (8:5853)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz

	ld b, $07
	call SetObjUnk1C

	ld a, (1 << 6) | TRANSFORMATION_BUBBLE
	ld [wTransformation], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	farcall Func_2ac7d
	ret
; 0x21887

Func_21887: ; 21887 (8:5887)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	ld a, [wIsCrouching]
	and a
	jr z, .asm_218b6
	ld a, -27
	ld [wCollisionBoxTop], a
	farcall CheckUpCollision
	ld a, b
	and a
	jr z, .asm_218b6
	ld a, -15
	ld [wCollisionBoxTop], a
	ret

.asm_218b6
	ld b, $07
	call SetObjUnk1C

	play_sfx SFX_028
	ld a, (1 << 6) | TRANSFORMATION_ICE_SKATIN
	ld [wTransformation], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_IceSkatinStart
	ret
; 0x218e7

ObjInteraction_Owl: ; 218e7 (8:58e7)
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_218f1
	jp Func_20939

.asm_218f1
	ld a, [wTransformation]
	bit 6, a
	ret nz
	cp TRANSFORMATION_OWL_WARIO
	ret z

	call Func_20a63

	play_sfx SFX_HANG_GRAB
	ld a, TRANSFORMATION_OWL_WARIO
	ld [wTransformation], a

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	ld a, $b8
	ld [wWarioState], a
	ld a, $ff
	ld [wCollisionBoxBottom], a
	ld a, $e5
	ld [wCollisionBoxTop], a
	ld a, $f7
	ld [wCollisionBoxLeft], a
	ld a, $09
	ld [wCollisionBoxRight], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_gfx WarioHangGfx
	call LoadWarioGfx
	load_oam OAM_1fddb4
	ld a, [wEnemyDirection]
	ld [wDirection], a
	load_frameset Frameset_1fed53
	update_anim_2
	ret
; 0x21999

ObjInteraction_Rail: ; 21999 (8:5999)
	ld a, [wTransformation]
	bit 6, a
	ret nz
	cp TRANSFORMATION_RAIL
	ret z

	ld b, $06
	call SetObjUnk1C

	play_sfx SFX_HANG_GRAB
	ld a, TRANSFORMATION_RAIL
	ld [wTransformation], a

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a

	ld a, WST_HANGING_RAIL
	ld [wWarioState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -27
	ld [wCollisionBoxTop], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsCrouching], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a

	inc a
	ld [wAutoMoveState], a

	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	load_gfx WarioHangGfx
	call LoadWarioGfx
	load_oam OAM_1fee05

	ld a, [wEnemyDirection]
	ld [wDirection], a
	load_frameset Frameset_1feec4
	update_anim_2
	ret
; 0x21a47

Func_21a47: ; 21a47 (8:5a47)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
;	fallthrough

Func_21a4f: ; 21a4f (8:5a4f)
	jp Func_2126a
; 0x21a52

Func_21a52: ; 21a52 (8:5a52)
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20a69
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_20a69
	call Func_20a63

	ld a, (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	ld [wTransformation], a

	xor a
	ld [wca8f], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_UnknownC4
	ret
; 0x21a8c

Func_21a8c: ; 21a8c (8:5a8c)
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	ret nz
	ld b, $0e
	jp SetObjUnk1C
; 0x21a97

Func_21a97: ; 21a97 (8:5a97)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, Func_21aac
	bit INTERACTION_DOWN_F, a
	jp nz, Func_2168b

	ld a, [wAttackCounter]
	and a
	jr nz, Func_21abb
	jp Func_20a6f

Func_21aac: ; 21aac (8:5aac)
	ld a, [wIsSmashAttacking]
	dec a
	jp nz, Func_209ca
	call Func_20602
	ld b, $0f
	jp SetObjUnk1C
; 0x21abb

Func_21abb: ; 21abb (8:5abb)
	ld b, $02
	call SetObjUnk1C
	jp Func_20a6f
; 0x21ac3

Func_21ac3: ; 21ac3 (8:5ac3)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_21ae4

	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_21ada
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21aee
	jp Func_20e6a
.asm_21ada
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21aee
	jp Func_20e6a

.asm_21ae4
	ld a, [wIsSmashAttacking]
	and a
	jp nz, Func_20602
	jp Func_20e6a
.asm_21aee
	jp Func_21cfd
; 0x21af1

Func_21af1: ; 21af1 (8:5af1)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jp nz, StepOnObject
	ld a, [wAttackCounter]
	and a
	jp nz, Func_217a9
	jp Func_20a6f
; 0x21b08

Func_21b08: ; 21b08 (8:5b08)
	jp Func_2160a
; 0x21b0b

Func_21b0b: ; 21b0b (8:5b0b)
	ld b, $06
	call SetObjUnk1C
	ld a, [wIsRolling]
	and a
	ret nz
	ld a, [wEnemyDirection]
	ld [wDirection], a
	farcall Func_1e174
	ret
; 0x21b2b

Func_21b2b: ; 21b2b (8:5b2b)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
;	fallthrough

Func_21b3a: ; 21b3a (8:5b3a)
	call Func_20939
	ld b, $00
	jp SetObjUnk1C
; 0x21b42

Func_21b42: ; 21b42 (8:5b42)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c

	ld b, $06
	call SetObjUnk1C

	ld a, (1 << 6) | TRANSFORMATION_SPLIT
	ld [wTransformation], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_SplitHit
	ret
; 0x21b78

Func_21b78: ; 21b78 (8:5b78)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr z, .asm_21b86
	ld a, [wIsSmashAttacking]
	and a
	jp nz, Func_20602
.asm_21b86
	jp Func_20939
; 0x21b89

Func_21b89: ; 21b89 (8:5b89)
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jp z, Func_2022c
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c

	ld b, $06
	call SetObjUnk1C

	ld a, (1 << 6) | TRANSFORMATION_BLIND
	ld [wTransformation], a

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a

	farcall SetState_BlindIdling

	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld b, 4
	ld c, LOW(rBGPD)
.wait_lcd_off_1
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_off_1
.wait_lcd_on_1
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_on_1

	xor a
REPT 2 palettes
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .wait_lcd_off_1

	ld a, (1 << rOBPI_AUTO_INCREMENT) | $18
	ldh [rOBPI], a
	ld b, 2
	ld c, LOW(rOBPD)
.wait_lcd_off_2
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr z, .wait_lcd_off_2
.wait_lcd_on_2
	ldh a, [rSTAT]
	and STAT_ON_LCD
	jr nz, .wait_lcd_on_2

	xor a
REPT 2 palettes
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .wait_lcd_off_2
	ret
; 0x21c17

Func_21c17: ; 21c17 (8:5c17)
	ld b, $06
	call SetObjUnk1C
	ld a, [wTransformation]
	and a
	jp z, Func_20000.next_obj
	jp RecoverFromTransformation
; 0x21c26

Func_21c26: ; 21c26 (8:5c26)
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_21c37
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21c41
	jp Func_207ed
.asm_21c37
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21c41
	jp Func_207ed
.asm_21c41
	ld b, $11
	call SetObjUnk1C
	farcall SetState_UnknownE0
	ret
; 0x21c56

Func_21c56: ; 21c56 (8:5c56)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21aac
	jp Func_20b6b
; 0x21c61

Func_21c61: ; 21c61 (8:5c61)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_21c7a
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_21b0b
	jp Func_20e6a
.asm_21c7a
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_21b0b
	jp Func_20e6a
; 0x21c85

	ret ; stray ret

Func_21c86: ; 21c86 (8:5c86)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20e6a
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
	jp Func_20e6a
; 0x21c98

Func_21c98: ; 21c98 (8:5c98)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jp nz, Func_2168b
	jp Func_20b41
; 0x21ca8

Func_21ca8: ; 21ca8 (8:5ca8)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	and a
	ret nz

	play_sfx SFX_FAT_WALK
	farcall SetState_DraggedDown
;	fallthrough

Func_21cc9: ; 21cc9 (8:5cc9)
	ld b, $13
	call SetObjUnk1C
	ret
; 0x21ccf

ObjInteraction_WaterTeleporting: ; 21ccf (8:5ccf)
	ld a, $e7
	ld [wc0d7], a
	call SetState_WaterStung
	stop_sfx
	ld a, WST_WATER_TELEPORTING
	ld [wWarioState], a
	ld b, $10
	jp SetObjUnk1C
; 0x21ce9

Func_21ce9: ; 21ce9 (8:5ce9)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20899
	bit INTERACTION_DOWN_F, a
	jr nz, ObjInteraction_WaterTeleporting
	jp Func_208f2
; 0x21cf8

Func_21cf8: ; 21cf8 (8:5cf8)
	ld b, $06
	jp SetObjUnk1C
; 0x21cfd

Func_21cfd: ; 21cfd (8:5cfd)
	ld a, $e7
	ld [wc0d7], a
	call Func_206eb
	stop_sfx
	ld a, WST_TELEPORTING
	ld [wWarioState], a
	ld b, $10
	jp SetObjUnk1C
; 0x21d17

Func_21d17: ; 21d17 (8:5d17)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wWaterInteraction]
	and a
	jp z, Func_21b3a
	farcall StartDive
	ret
; 0x21d3b

Func_21d3b: ; 21d3b (8:5d3b)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20e6a
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20e6a
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_21d59
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20670
	jp Func_20e6a
.asm_21d59
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20670
	jp Func_20e6a
; 0x21d64

Func_21d64: ; 21d64 (8:5d64)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20670
	jp Func_20e6a
; 0x21d6f

Func_21d6f: ; 21d6f (8:5d6f)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_21d7e
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20670
	jp Func_20e6a
.asm_21d7e
	ld a, [wIsSmashAttacking]
	and a
	jp nz, Func_20602
	jp Func_20e6a
; 0x21d88

Func_21d88: ; 21d88 (8:5d88)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_21da1
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_21dac
	jp Func_208f2
.asm_21da1
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_21dac
	jp Func_208f2
; 0x21dac

Func_21dac: ; 21dac (8:5dac)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld a, [wEnemyDirection]
	ld [wDirection], a
	farcall SetState_UnknownE1
	ld b, $06
	jp SetObjUnk1C
; 0x21dd3

ObjInteraction_ColourCoin: ; 21dd3 (8:5dd3)
	play_sfx SFX_COLOUR_COIN
;	fallthrough

; adds 10 to coin count
CollectMusicalCoin: ; 21ddb (8:5ddb)
	ld hl, wNumCoins + 1
	ld a, [hl]
	add $10
	daa
	ld [hld], a
	ld a, [hl]
	adc $00
	daa
	ld [hl], a
	and $f0
	jr z, .no_cap
	ld a, HIGH(MAX_NUM_COINS)
	ld [hli], a
	ld a, LOW(MAX_NUM_COINS)
	ld [hl], a
.no_cap
	call Func_20a63
	jp Func_20000.next_obj
; 0x21df8

Func_21df8: ; 21df8 (8:5df8)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld b, $06
	call SetObjUnk1C

	ld a, (1 << 6) | TRANSFORMATION_MAGIC
	ld [wTransformation], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_MagicRising
	ret
; 0x21e2e

Func_21e2e: ; 21e2e (8:5e2e)
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20670
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
	jp Func_2022c
; 0x21e3e

Func_21e3e: ; 21e3e (8:5e3e)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BALL
	jr z, Func_21e8a
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_21e54
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
	jp Func_20e63

.asm_21e54
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld b, $06
	call SetObjUnk1C
	ld a, (1 << 6) | TRANSFORMATION_BALL
	ld [wTransformation], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	farcall SetState_BallStart
	ret
; 0x21e8a

Func_21e8a: ; 21e8a (8:5e8a)
	farcall SetState_BallShot
	jp Func_21cc9
; 0x21e9c

Func_21e9c: ; 21e9c (8:5e9c)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BALL
	jr z, Func_21e8a
	jp Func_20939
; 0x21ea6

Func_21ea6: ; 21ea6 (8:5ea6)
	ld a, [wEnemyDirection]
	ld b, a
	and a
	jr nz, .asm_21eb6
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21ebf
	jr .asm_21eca
.asm_21eb6
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21ebf
	jr .asm_21eca
.asm_21ebf
	ld a, [wEnemyDirection]
	xor $1
	ld [wDirection], a
	jp Func_20a6f
.asm_21eca
	jp Func_21b3a
; 0x21ecd

Func_21ecd: ; 21ecd (8:5ecd)
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_21edd
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21ee7
	jp Func_20e6a
.asm_21edd
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21ee7
	jp Func_20e6a
.asm_21ee7
	play_sfx SFX_FAT_WALK
	farcall SetState_DraggedDown
	jp Func_21cc9
; 0x21f01

Func_21f01: ; 21f01 (8:5f01)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_21f0b
	jp Func_20d8c
.asm_21f0b
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	farcall SetState_SwimKnockBack
	ret
; 0x21f28

Func_21f28: ; 21f28 (8:5f28)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21d6f.asm_21d7e
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20e6a
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_21f46
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20670
	jp Func_20e6a
.asm_21f46
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20670
	jp Func_20e6a
; 0x21f51

Func_21f51: ; 21f51 (8:5f51)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jr nz, .asm_21fa3
	ld b, $10
.asm_21f69
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21f9f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21f9f
	dec b
	jr nz, .asm_21f69
	ret

.asm_21fa3
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21fd6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21fd6
	ld b, $10
.asm_21fd8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2200e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2200e
	dec b
	jr nz, .asm_21fd8
	ret
; 0x22012

Func_22012: ; 22012 (8:6012)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2208a
	ld b, $10
.asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22068
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22068
	dec b
	jr nz, .asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret
; 0x2208a

Func_2208a: ; 2208a (8:608a)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wce35
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl

	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220bd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220bd
	ld b, $10
.asm_220bf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220f5
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220f5
	dec b
	jr nz, .asm_220bf
	pop af
	ldh [rSVBK], a
	ret
; 0x220fc

Func_220fc: ; 220fc (8:60fc)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2214e
	ld b, $10
.asm_22115
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2214a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2214a
	dec b
	jr nz, .asm_22115
	ret
; 0x2214e

Func_2214e: ; 2214e (8:614e)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22180
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22180
	ld b, $10
.asm_22182
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_221b7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_221b7
	dec b
	jr nz, .asm_22182
	ret
; 0x221bb

Func_221bb: ; 221bb (8:61bb)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_22217
	ld b, $10
.asm_221db
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22210
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22210
	dec b
	jr nz, .asm_221db
	pop af
	ldh [rSVBK], a
	ret
; 0x22217

Func_22217: ; 22217 (8:6217)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22249
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22249
	ld b, $10
.asm_2224b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22280
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22280
	dec b
	jr nz, .asm_2224b
	pop af
	ldh [rSVBK], a
	ret
; 0x22287
