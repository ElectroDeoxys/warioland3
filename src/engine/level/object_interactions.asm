ProcessInteractions:
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
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	jr z, .is_visible
.next_obj
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld de, OBJ_STRUCT_LENGTH
	add hl, de
	jr .loop_objects

.is_visible
	push hl
	ld e, OBJ_UNK_1D
	ld d, $00
	add hl, de
	ld a, [hld]
	ld [wUnused_c1b8], a
	ld a, [hl] ; OBJ_ACTION
	pop hl
	and a
	jr nz, .next_obj

	ld e, OBJ_INTERACTION_TYPE
	ld d, $00
	add hl, de
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ld [wObjInteractionType], a
	ld a, [hli] ; OBJ_COLLBOX_TOP
	ld [wObjCollBoxTop], a
	ld a, [hli] ; OBJ_COLLBOX_BOTTOM
	ld [wObjCollBoxBottom], a
	ld a, [hli] ; OBJ_COLLBOX_LEFT
	ld [wObjCollBoxLeft], a
	ld a, [hli] ; OBJ_COLLBOX_RIGHT
	ld [wObjCollBoxRight], a
	ld a, [hli] ; OBJ_SCREEN_Y_POS
	ld [wObjScreenYPos], a
	ld a, [hl] ; OBJ_SCREEN_X_POS
	ld [wObjScreenXPos], a

	ld e, OBJ_SUBSTATE - OBJ_SCREEN_X_POS
	ld d, $00
	add hl, de
	ld a, [hl] ; OBJ_SUBSTATE
	bit OBJSUBFLAG_HDIR_F, a
	jr nz, .obj_facing_right
	ld a, DIRECTION_LEFT
	jr .got_obj_direction
.obj_facing_right
	ld a, DIRECTION_RIGHT
.got_obj_direction
	ld [wObjDirection], a

	xor a
	ld [wInteractionSide], a
	ld a, $ff
	ld [wc1c2], a
	ld [wc1c1], a
	ld [wc1c3], a
	ld [wc1c4], a

	ld e, $d0
	ld hl, wObjCollBoxTop
	ld a, [wObjScreenYPos]
	add [hl]
	sub e
	ld b, a
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
	ld hl, wObjCollBoxBottom
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

	ld hl, wObjCollBoxLeft
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
	ld hl, wObjCollBoxRight
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
	and INTERACTION_MASK
	jumptable

.table
	table_width 2, ProcessInteractions.table
	dw Func_20b6b                        ; OBJ_INTERACTION_00
	dw Func_20d1d                        ; OBJ_INTERACTION_01
	dw ObjInteraction_FrontSting         ; OBJ_INTERACTION_FRONT_STING
	dw ObjInteraction_BackSting          ; OBJ_INTERACTION_BACK_STING
	dw ObjInteraction_TopSting           ; OBJ_INTERACTION_TOP_STING
	dw ObjInteraction_FullSting          ; OBJ_INTERACTION_FULL_STING
	dw Func_20d81                        ; OBJ_INTERACTION_06
	dw Func_20d8c                        ; OBJ_INTERACTION_07
	dw Func_20deb                        ; OBJ_INTERACTION_08
	dw Func_20e39                        ; OBJ_INTERACTION_09
	dw Func_20e60                        ; OBJ_INTERACTION_0A
	dw Func_20e6a                        ; OBJ_INTERACTION_0B
	dw ObjInteraction_Walkable           ; OBJ_INTERACTION_WALKABLE
	dw ObjInteraction_MusicalCoin        ; OBJ_INTERACTION_MUSICAL_COIN
	dw ObjInteraction_Fire               ; OBJ_INTERACTION_FIRE
	dw ObjInteraction_Richtertoffen      ; OBJ_INTERACTION_RICHTERTOFFEN
	dw ObjInteraction_GreyKey            ; OBJ_INTERACTION_GREY_KEY
	dw ObjInteraction_RedKey             ; OBJ_INTERACTION_RED_KEY
	dw ObjInteraction_GreenKey           ; OBJ_INTERACTION_GREEN_KEY
	dw ObjInteraction_BlueKey            ; OBJ_INTERACTION_BLUE_KEY
	dw ObjInteraction_GreyTreasure       ; OBJ_INTERACTION_GREY_TREASURE
	dw ObjInteraction_RedTreasure        ; OBJ_INTERACTION_RED_TREASURE
	dw ObjInteraction_GreenTreasure      ; OBJ_INTERACTION_GREEN_TREASURE
	dw ObjInteraction_BlueTreasure       ; OBJ_INTERACTION_BLUE_TREASURE
	dw ObjInteraction_Omodonmeka         ; OBJ_INTERACTION_OMODONMEKA
	dw ObjInteraction_Silky              ; OBJ_INTERACTION_SILKY
	dw ObjInteraction_Food               ; OBJ_INTERACTION_FOOD
	dw ObjInteraction_RegularCoin        ; OBJ_INTERACTION_REGULAR_COIN
	dw ObjInteraction_Electric           ; OBJ_INTERACTION_ELECTRIC
	dw ObjInteraction_InvisibilityPotion ; OBJ_INTERACTION_INVISIBILITY_POTION
	dw ObjInteraction_Pneumo             ; OBJ_INTERACTION_PNEUMO
	dw ObjInteraction_ZombieHead         ; OBJ_INTERACTION_ZOMBIE_HEAD
	dw ObjInteraction_Bouncy             ; OBJ_INTERACTION_BOUNCY
	dw ObjInteraction_FireBot            ; OBJ_INTERACTION_FIRE_BOT
	dw ObjInteraction_Solid              ; OBJ_INTERACTION_SOLID
	dw ObjInteraction_Omodon             ; OBJ_INTERACTION_OMODON
	dw ObjInteraction_OrangeBird         ; OBJ_INTERACTION_ORANGE_BIRD
	dw ObjInteraction_Vampire            ; OBJ_INTERACTION_VAMPIRE
	dw ObjInteraction_Bubble             ; OBJ_INTERACTION_BUBBLE
	dw ObjInteraction_Ice                ; OBJ_INTERACTION_ICE
	dw ObjInteraction_Owl                ; OBJ_INTERACTION_OWL
	dw ObjInteraction_Rail               ; OBJ_INTERACTION_RAIL
	dw ObjInteraction_Haridama           ; OBJ_INTERACTION_HARIDAMA
	dw ObjInteraction_AnonsterWave       ; OBJ_INTERACTION_ANONSTER_WAVE
	dw ObjInteraction_AnonsterSilk       ; OBJ_INTERACTION_ANONSTER_SILK
	dw ObjInteraction_Snow               ; OBJ_INTERACTION_SNOW
	dw ObjInteraction_UnlitTorch         ; OBJ_INTERACTION_UNLIT_TORCH
	dw ObjInteraction_Stove              ; OBJ_INTERACTION_STOVE
	dw ObjInteraction_RoboMouse          ; OBJ_INTERACTION_ROBO_MOUSE
	dw Func_21af1                        ; OBJ_INTERACTION_31
	dw ObjInteraction_DollBoyHammer      ; OBJ_INTERACTION_DOLL_BOY_HAMMER
	dw ObjInteraction_RollingRock        ; OBJ_INTERACTION_ROLLING_ROCK
	dw ObjInteraction_Wormwould          ; OBJ_INTERACTION_WORMWOULD
	dw ObjInteraction_Beam               ; OBJ_INTERACTION_BEAM
	dw Func_21b78                        ; OBJ_INTERACTION_36
	dw ObjInteraction_YellowBellyArrow   ; OBJ_INTERACTION_YELLOW_BELLY_ARROW
	dw ObjInteraction_Teruteru           ; OBJ_INTERACTION_TERUTERU
	dw ObjInteraction_WaterDrop          ; OBJ_INTERACTION_WATER_DROP
	dw ObjInteraction_Pesce              ; OBJ_INTERACTION_PESCE
	dw Func_21c56                        ; OBJ_INTERACTION_3B
	dw ObjInteraction_Tadpole            ; OBJ_INTERACTION_TADPOLE
	dw ObjInteraction_Hebarii            ; OBJ_INTERACTION_HEBARII
	dw ObjInteraction_PrinceFroggy       ; OBJ_INTERACTION_PRINCE_FROGGY
	dw ObjInteraction_Hand               ; OBJ_INTERACTION_HAND
	dw ObjInteraction_WaterTeleporting   ; OBJ_INTERACTION_WATER_TELEPORTING
	dw ObjInteraction_Scowler            ; OBJ_INTERACTION_SCOWLER
	dw ObjInteraction_Ink                ; OBJ_INTERACTION_INK
	dw Func_207ed                        ; OBJ_INTERACTION_43
	dw ObjInteraction_Jamano             ; OBJ_INTERACTION_JAMANO
	dw ObjInteraction_Turtle             ; OBJ_INTERACTION_TURTLE
	dw Func_21d3b                        ; OBJ_INTERACTION_46
	dw Func_21d64                        ; OBJ_INTERACTION_47
	dw Func_21d6f                        ; OBJ_INTERACTION_48
	dw Func_21d88                        ; OBJ_INTERACTION_49
	dw ObjInteraction_ColourCoin         ; OBJ_INTERACTION_COLOUR_COIN
	dw ObjInteraction_MagicalSpiral      ; OBJ_INTERACTION_MAGICAL_SPIRAL
	dw ObjInteraction_BottomSting        ; OBJ_INTERACTION_BOTTOM_STING
	dw ObjInteraction_Shoot              ; OBJ_INTERACTION_SHOOT
	dw Func_21e9c                        ; OBJ_INTERACTION_GK_TORTOISE
	dw Func_21ea6                        ; OBJ_INTERACTION_4F
	dw Func_21ecd                        ; OBJ_INTERACTION_50
	dw Func_21f01                        ; OBJ_INTERACTION_51
	dw Func_21f28                        ; OBJ_INTERACTION_52
	dw ObjInteraction_None               ; OBJ_INTERACTION_UNUSED_1
	dw ObjInteraction_None               ; OBJ_INTERACTION_UNUSED_2
	dw ObjInteraction_None               ; OBJ_INTERACTION_UNUSED_3
	dw ObjInteraction_None               ; OBJ_INTERACTION_UNUSED_4
	dw ObjInteraction_None               ; OBJ_INTERACTION_UNUSED_5
	dw ObjInteraction_None               ; OBJ_INTERACTION_UNUSED_6
	assert_table_length NUM_OBJ_INTERACTIONS

ObjInteraction_None:
	ret

; clears the screen from objects
; when opening a treasure
TreasureClearObjects:
	ld hl, wObjects
	ld de, OBJ_STRUCT_LENGTH
.loop_objects
	ld a, h
	cp HIGH(wCurObj)
	ret z
	ld a, [hl] ; OBJ_FLAGS
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	cp OBJFLAG_ACTIVE
	jr z, .vanish_obj
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	jr z, .vanish_obj
.next_obj
	add hl, de
	jr .loop_objects
.vanish_obj
	ld a, [wObjPtr + 1]
	cp l
	jr z, .next_obj
	push hl
	ld c, OBJ_ACTION
	ld b, $00
	add hl, bc
	ld [hl], OBJACTION_VANISH_TREASURE
	pop hl
	jr .next_obj

Func_2022c:
	ld a, [wIsRolling]
	and a
	jp nz, AttackObject
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
;	fallthrough

Func_2023b:
	ld a, [wTouchState]
	and a
	jr z, .asm_20257
	cp TOUCH_BUMP
	jr z, .asm_20257
	cp TOUCH_VULNERABLE
	jp z, Func_20939 ; this causes an infinite loop!
	cp TOUCH_ATTACK
	jp z, AttackObject
	cp TOUCH_VANISH
	jp z, VanishObjectAndKnockBackIfZombie
	jp ProcessInteractions.next_obj

.asm_20257
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject

	ld b, OBJACTION_BUMP
	call SetObjAction

	ld a, [wInvincibleCounter]
	cp $01
	ret z ; is invincible
	ld a, [wTransformation]
	cp TRANSFORMATION_FLAT_WARIO
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

Func_2028a:
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

SetState_EnemyBumping:
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

	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a

	ld a, [wIsCrouching]
	and a
	jr nz, .crouching
	ld a, [wDirection]
	and a
	jr nz, .asm_20326
	ld a, HIGH(Frameset_14a71)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a71)
	ld [wFramesetPtr + 1], a
.asm_20316
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_20326
	ld a, HIGH(Frameset_14a6c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a6c)
	ld [wFramesetPtr + 1], a
	jr .asm_20316

.crouching
	ld a, [wDirection]
	and a
	jr nz, .asm_20344
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
	jr .asm_20316
.asm_20344
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .asm_20316

; routine called when an object is attacked
; whether by Wario's B attack, Fat Wario bump, rolling, etc.
AttackObject:
	play_sfx SFX_017
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20382

	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld hl, wWarioXPos + 1
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
	jr .spawn_stars

.asm_20382
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld hl, wWarioXPos + 1
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

.spawn_stars
	ld b, PARTICLE_STARS
	farcall CreateParticle

	ld b, OBJACTION_ATTACK
	call SetObjAction
	ld a, [wTransformation]
	cp TRANSFORMATION_FAT_WARIO
	jr z, .fat
	cp TRANSFORMATION_SNOWMAN_WARIO
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
	cp GARLIC
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
	ld a, [wWarioTransformationProgress]
	and a
	ret nz
	farcall SetState_SnowmanBumped
	ret

; routine called when Wario steps on an object
StepOnObject:
; no stun if Wario is invincible
	ld a, [wInvincibleCounter]
	cp $01
	ret z

	ld a, [wIsSmashAttacking]
	dec a
	jr nz, .no_smash_attack
; Wario is smash attacking
	ld a, [wTransformation]
	cp TRANSFORMATION_FAT_WARIO
	jp z, VanishObjectAndKnockBackIfZombie
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
	and GRAB_STATE_MASK
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
	cp HIGH_JUMP_BOOTS
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
	and GRAB_STATE_MASK
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
	ld b, OBJACTION_WOBBLE
	jp SetObjAction

.Transformed
	ld a, [wTransformation]
	cp TRANSFORMATION_HOT_WARIO
	jr nz, .not_hot_wario
	ld a, [wWarioTransformationProgress]
	cp 2
	jr nc, VanishObjectAndKnockBackIfZombie
.not_hot_wario

	ld a, [wTransformation]
	cp TRANSFORMATION_FAT_WARIO
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
	ld b, OBJACTION_WOBBLE
	call SetObjAction
	ld a, [wTransformation]
	cp TRANSFORMATION_FLAT_WARIO
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

VanishObjectAndKnockBackIfZombie:
	ld b, OBJACTION_VANISH_TOUCH
	call SetObjAction
	ld a, [wTransformation]
	cp TRANSFORMATION_ZOMBIE_WARIO
	ret nz
	farcall SetState_ZombieKnockBack
	ret

Func_20602:
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .invisible
	and a
	jr nz, VanishObjectAndKnockBackIfZombie ; has transformation except invisible
.invisible
	ld a, [wGrabState]
	and GRAB_STATE_MASK
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
	cp HIGH_JUMP_BOOTS
	jr c, .asm_20655
	xor a
	ld [wJumpVelIndex], a
.asm_20655
	ld b, OBJACTION_VANISH_TOUCH
;	fallthrough

SetObjAction:
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld e, OBJ_ACTION
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

Func_20670:
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20939

; if Wario is rolling, do attack
	ld a, [wPowerUpLevel]
	cp GARLIC
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
	jp z, VanishObjectAndKnockBackIfZombie
	jp ProcessInteractions.next_obj

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
	ld b, OBJACTION_06
	call SetObjAction
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wStingTouchState]
	cp TOUCH_VULNERABLE
	jr z, Func_206eb
	jr SetState_Stung

Func_206eb:
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, ReleaseOwl
	call ClearTransformationValues
	call UpdateLevelMusic
;	fallthrough

SetState_Stung:
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
	ldh [hYPosHiBackup], a
	ldh a, [hYPosLo]
	ldh [hYPosLoBackup], a
	ldh a, [hXPosHi]
	ldh [hXPosHiBackup], a
	ldh a, [hXPosLo]
	ldh [hXPosLoBackup], a

	farcall CheckUpCollision
	ld a, b
	and a
	jr nz, .asm_20780

	xor a
	ld [wIsCrouching], a
	ldh a, [hYPosHiBackup]
	ldh [hYPosHi], a
	ldh a, [hYPosLoBackup]
	ldh [hYPosLo], a
	ldh a, [hXPosHiBackup]
	ldh [hXPosHi], a
	ldh a, [hXPosLoBackup]
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

	ldh a, [hYPosHiBackup]
	ldh [hYPosHi], a
	ldh a, [hYPosLoBackup]
	ldh [hYPosLo], a
	ldh a, [hXPosHiBackup]
	ldh [hXPosHi], a
	ldh a, [hXPosLoBackup]
	ldh [hXPosLo], a

.asm_20799
	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_207d3
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
	jr .asm_207dd
.asm_207d3
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
.asm_207dd
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_207ed:
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
	ld b, OBJACTION_06
	call SetObjAction
;	fallthrough

SetState_WaterStung:
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
	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_2087f
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .asm_20889
.asm_2087f
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.asm_20889
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

Func_20899:
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
	ld b, OBJACTION_WOBBLE
	call SetObjAction
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	ret nz
	farcall StartDive
	ret

Func_208f2:
	jr .start

.Bump
	ld b, OBJACTION_BUMP
	call SetObjAction
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
	call .Bump
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	and a
	ret nz
	farcall StartDive
	ret

Func_2092d:
	ld b, OBJACTION_VANISH_TOUCH
	jp SetObjAction

Func_20932:
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
;	fallthrough

Func_20939:
	ld a, [wTouchState]
	and a
	jp nz, Func_2023b
	ld b, OBJACTION_06
	call SetObjAction
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	farcall DoJumpingBump
	ld a, BANK(WarioWalkGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioWalkGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioWalkGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, BANK(OAM_1426c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1426c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1426c)
	ld [wOAMPtr + 1], a
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
	ld a, HIGH(Frameset_14a79)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a79)
	ld [wFramesetPtr + 1], a
.asm_209a4
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_209b4
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, HIGH(Frameset_14a76)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a76)
	ld [wFramesetPtr + 1], a
	jr .asm_209a4

Func_209ca:
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
	jr z, .set_stepped_on
	cp $03
	jr c, .asm_209f1
	ld a, $02
.asm_209f1
	ld b, a
	call SubYOffset
.set_stepped_on
	ld b, OBJACTION_STEP_ON
	call SetObjAction
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
	farcall CrouchOrSlide
	jr .done

.set_grab_state
	farcall SetState_GrabIdling
.done
	jp ProcessInteractions.next_obj

Func_20a63:
	ld b, OBJACTION_07
	call SetObjAction
	ret

Func_20a69:
	ld b, OBJACTION_0D
	call SetObjAction
	ret

Func_20a6f:
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_20aa5
.asm_20a79
	ld a, [wDirection]
	and a
	jp z, ProcessInteractions.next_obj
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
	jp nz, ProcessInteractions.next_obj
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
	cp TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .ball_o_string
	cp TRANSFORMATION_HOT_WARIO
	jr z, .hot
	cp TRANSFORMATION_ICE_SKATIN
	jr z, .ice_skatin
	xor a
	ld [wWalkVelIndex], a
	ld a, [wIsRolling]
	and a
	jr nz, .asm_20aef
	ld a, [wAttackCounter]
	and a
	jp z, ProcessInteractions.next_obj

.asm_20aef
	farcall DoJumpingBump
	ret

.ball_o_string
	ld a, [wWarioTransformationProgress]
	cp 1
	ret nz
	farcall Func_28bd5
	ret

.hot
	ld a, [wWarioTransformationProgress]
	cp 1
	ret nz
	farcall Func_2afc5
	ret

.ice_skatin
	ld a, [wWarioState]
	cp WST_ICE_SKATIN_CRASH
	ret z
	farcall Func_1ec215
	ret

Func_20b41:
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
	jp z, VanishObjectAndKnockBackIfZombie
	jp Func_20a6f

.asm_20b5e
	ld a, [wTouchState]
	and a
	ret nz
	call Func_20939
	ld b, OBJACTION_12
	jp SetObjAction

Func_20b6b:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
	ld a, [wTouchState]
	and a
	jr z, .check_water
	cp TOUCH_ATTACK
	jp z, AttackObject
	cp TOUCH_VANISH
	jp z, VanishObjectAndKnockBackIfZombie
	cp TOUCH_PASS_THROUGH
	jp z, ProcessInteractions.next_obj
	jp .step_on_obj

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
	jp nz, .step_on_obj

	ld a, [wPowerUpLevel]
	cp GRAB_GLOVE
	jp c, .step_on_obj
	ld a, [wWarioState]
	cp WST_LADDER_SCRATCHING
	jp z, .step_on_obj
	cp WST_LADDER_CLIMBING
	jr c, .not_on_ladder
	cp WST_LADDER_SLIDING + 1
	jp c, .step_on_obj

.not_on_ladder
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
	jr .step_on_obj
.asm_20bdd
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, [wDirection]
	and a
	jr nz, .step_on_obj
.check_invincible_counter
	ld a, [wInvincibleCounter]
	cp 1
	ret z
	ld hl, wWarioXPos + 1
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
	jr .set_obj_pick_up
.heavy_obj
	ld a, [wPowerUpLevel]
	cp SUPER_GRAB_GLOVES
	jr c, .step_on_obj
	ld a, GRAB_PICK_UP | (1 << GRAB_HEAVY_F)
	ld [wGrabState], a

.set_obj_pick_up
	ld b, OBJACTION_PICK_UP
	call SetObjAction

	ld a, [wJumpVelTable]
	and a
	jr z, .set_wario_pick_up
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_20c31
	jr .step_on_obj
.asm_20c31
	farcall Func_1edd3
	ret

.step_on_obj
	jp StepOnObject

; unreachable
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

.set_wario_pick_up
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

	ld a, BANK(WarioThrowGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioThrowGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioThrowGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1606a)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1606a)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1606a)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_20cdb
	ld a, [wWarioSlopeInteraction]
	bit LEFT_SLOPE_F, a
	jr nz, .asm_20cf5
	ld a, [wGrabState]
	and (1 << GRAB_HEAVY_F)
	jr nz, .asm_20d05
	ld a, HIGH(Frameset_163ec)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_163ec)
	ld [wFramesetPtr + 1], a
.asm_20ccb
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret
.asm_20cdb
	ld a, [wWarioSlopeInteraction]
	bit RIGHT_SLOPE_F, a
	jr nz, .asm_20cf5
	ld a, [wGrabState]
	and (1 << GRAB_HEAVY_F)
	jr nz, .asm_20d11
	ld a, HIGH(Frameset_1640c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1640c)
	ld [wFramesetPtr + 1], a
	jr .asm_20ccb
.asm_20cf5
	farcall SetState_GrabIdling
	ret
.asm_20d05
	ld a, HIGH(Frameset_163f5)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_163f5)
	ld [wFramesetPtr + 1], a
	jr .asm_20ccb
.asm_20d11
	ld a, HIGH(Frameset_16415)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16415)
	ld [wFramesetPtr + 1], a
	jr .asm_20ccb

Func_20d1d:
	jp Func_2022c

ObjInteraction_FrontSting:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20d44
	ld a, [wObjDirection]
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

ObjInteraction_BackSting:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20d6b
	ld a, [wObjDirection]
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

ObjInteraction_TopSting:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20670
	bit INTERACTION_DOWN_F, a
	jp nz, StepOnObject
	jp Func_2022c

ObjInteraction_FullSting:
	jp Func_20670

Func_20d81:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	jp Func_208f2

Func_20d8c:
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
	jr nz, .dive
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
	jr .knock_back
.asm_20dbe
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

.knock_back
	farcall SetState_SwimKnockBack
	ret

.dive
	farcall StartDive
	ret

Func_20deb:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	ld a, [wObjDirection]
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

ObjInteraction_Haridama:
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20899
	bit INTERACTION_UP_F, a
	jp nz, Func_207ed

	ld a, [wObjDirection]
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

Func_20e39:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20e5d
	ld a, [wObjDirection]
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

Func_20e60:
	jp Func_20939

Func_20e63:
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
;	fallthrough

Func_20e6a:
	call Func_20939
	ld a, [wTouchState]
	and a
	ret nz
	ld b, OBJACTION_0A
	jp SetObjAction

ObjInteraction_Walkable:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21aac
	jp Func_20932

ObjInteraction_MusicalCoin:
	ld hl, wNumMusicalCoins
	ld a, [hl]
	cp NUM_LEVEL_MUSICAL_COINS
	jp nc, ProcessInteractions.next_obj
	inc [hl]
	play_sfx SFX_MUSICAL_COIN
	jp CollectMusicalCoin

ObjInteraction_Fire:
	ld b, OBJACTION_06
	call SetObjAction

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c

	ld a, TRANSFORMATION_HOT_WARIO
	ld [wTransformation], a
	ld a, 1
	ld [wWarioTransformationProgress], a
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

SetState_OnFire_ResetStateCounter:
	xor a
	ld [wWarioStateCounter], a
;	fallthrough

SetState_OnFire:
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

	ld hl, WarioOnFirePal
	call SetWarioPal

	ld a, BANK(WarioHotGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioHotGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioHotGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1673c)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1673c)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1673c)
	ld [wOAMPtr + 1], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_20f50
	ld a, HIGH(Frameset_16b38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b38)
	ld [wFramesetPtr + 1], a
	jr .asm_20f5a
.asm_20f50
	ld a, HIGH(Frameset_16b49)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_16b49)
	ld [wFramesetPtr + 1], a
.asm_20f5a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_Richtertoffen:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_20f78
	bit INTERACTION_DOWN_F, a
	jr nz, .try_flatten_wario
	jp Func_20932

.asm_20f78
	ld a, [wIsSmashAttacking]
	dec a
	jp z, Func_20602
	jp StepOnObject

.try_flatten_wario
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c
	ld a, -11
	ld [wCollisionBoxLeft], a
	ld a, 11
	ld [wCollisionBoxRight], a
	ld a, [wLadderInteraction]
	cp LADDER_UNDERNEATH
	jr z, .asm_20fdb
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20fdb
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20fdb
	ld b, OBJACTION_FLATTEN
	call SetObjAction
	farcall SetState_FlatAirborne
	ret

.asm_20fdb
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	jp StepOnObject

; unreferenced?
Func_20fe8:
	ld b, OBJACTION_06
	jp SetObjAction

ObjInteraction_GreyKey:
	ld hl, wKeyAndTreasureFlags
	set GREY_KEY_F, [hl]
	jr CollectKey

ObjInteraction_RedKey:
	ld hl, wKeyAndTreasureFlags
	set RED_KEY_F, [hl]
	jr CollectKey

ObjInteraction_GreenKey:
	ld hl, wKeyAndTreasureFlags
	set GREEN_KEY_F, [hl]
	jr CollectKey

ObjInteraction_BlueKey:
	ld hl, wKeyAndTreasureFlags
	set BLUE_KEY_F, [hl]
;	fallthrough

CollectKey:
	play_sfx SFX_KEY
	call Func_20a63
	ld a, ST_COLLECT_KEY
	ld [wState], a
	xor a
	ld [wTimer], a
	ret

ObjInteraction_GreyTreasure:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit GREY_KEY_F, [hl]
	jp z, Func_20a6f
	set GREY_TREASURE_F, [hl]
	ld a, LVLEND_GREY_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure

ObjInteraction_RedTreasure:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit RED_KEY_F, [hl]
	jp z, Func_20a6f
	set RED_TREASURE_F, [hl]
	ld a, LVLEND_RED_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure

ObjInteraction_GreenTreasure:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit GREEN_KEY_F, [hl]
	jp z, Func_20a6f
	set GREEN_TREASURE_F, [hl]
	ld a, LVLEND_GREEN_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure

ObjInteraction_BlueTreasure:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeyAndTreasureFlags
	bit BLUE_KEY_F, [hl]
	jp z, Func_20a6f
	set BLUE_TREASURE_F, [hl]
	ld a, LVLEND_BLUE_TREASURE
	ld [wLevelEndScreen], a
;	fallthrough

GetTreasure:
	stop_music
	call Func_20a63
	call TreasureClearObjects

	ld hl, wLevelEndScreen
	ld a, [hl]
	cp LVLEND_NO_TREASURE
	ret z
	set 7, [hl]
	ld a, TRUE
	ld [wResetDisabled], a
	xor a
	ld [wWalkVelIndex], a

	ld a, WST_GET_TREASURE_START
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
	ld hl, WarioDefaultPal
	call SetWarioPal
	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_14000)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14000)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14000)
	ld [wOAMPtr + 1], a

	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21130
	ld a, [wc1c3]
	ld b, a
	call SubXOffset
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ld a, HIGH(Frameset_1425f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1425f)
	ld [wFramesetPtr + 1], a
	jr .asm_21146
.asm_21130
	ld a, [wc1c4]
	ld b, a
	call AddXOffset
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ld a, HIGH(Frameset_14252)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14252)
	ld [wFramesetPtr + 1], a
.asm_21146
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_Omodonmeka:
	ld a, [wJumpVelTable]
	and a
	jp nz, Func_2022c

	ld b, OBJACTION_0C
	call SetObjAction

	ld a, [wTransformation]
	cp TRANSFORMATION_FLAT_WARIO
	jp z, SetState_FlatStretching
	and a
	jp nz, Func_2022c

	; pick Wario up
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

	ld a, BANK(WarioAirborneGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioAirborneGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioAirborneGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_15955)
	ld [wOAMBank], a
	ld a, HIGH(OAM_15955)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_15955)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_211e1
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .asm_211eb
.asm_211e1
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.asm_211eb
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

SetState_FlatStretching:
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

	ld a, HIGH(Frameset_17193)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17193)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_Silky:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_21267
	ld a, [wObjDirection]
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

Func_2126a:
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
	ld b, OBJACTION_06
	call SetObjAction

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2023b
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wObjScreenXPos]
	cp b
	jr c, .asm_212b3

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .set_ball_o_string
.asm_212b3
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

.set_ball_o_string
	play_sfx SFX_039

	ld a, TRANSFORMATION_BALL_O_STRING_WARIO
	ld [wTransformation], a
	xor a
	ld [wWarioTransformationProgress], a
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
	ld hl, WarioStringPal
	call SetWarioPal

	ld a, BANK(WarioStringGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioStringGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioStringGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_171c0)
	ld [wOAMBank], a
	ld a, HIGH(OAM_171c0)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_171c0)
	ld [wOAMPtr + 1], a

	ld a, HIGH(Frameset_17414)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17414)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_Food:
	ld a, [wIsCrouching]
	and a
	jp nz, Func_20a69
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_20a69
	cp TRANSFORMATION_FAT_WARIO
	jr nz, .set_fat_wario
	jp Func_20a69

.set_fat_wario
	call Func_20a63
	ld a, TRANSFORMATION_FAT_WARIO
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

	ld a, BANK(WarioFatGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioFatGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioFatGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_1742d)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1742d)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1742d)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_21419
	ld a, HIGH(Frameset_1789c)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1789c)
	ld [wFramesetPtr + 1], a
	jr .asm_21423
.asm_21419
	ld a, HIGH(Frameset_178c3)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_178c3)
	ld [wFramesetPtr + 1], a
.asm_21423
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_RegularCoin:
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

ObjInteraction_Electric:
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
	ld b, OBJACTION_06
	call SetObjAction

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz
	cp TRANSFORMATION_ELECTRIC
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

	ld a, TRANSFORMATION_ELECTRIC
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

	ld hl, WarioElectricPal
	call SetWarioPal

	ld a, BANK(WarioElectricGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioElectricGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioElectricGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx

	ld a, BANK(OAM_1790e)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1790e)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1790e)
	ld [wOAMPtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_2152e
	ld a, HIGH(Frameset_17b79)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17b79)
	ld [wFramesetPtr + 1], a
	jr .asm_21538
.asm_2152e
	ld a, HIGH(Frameset_17b76)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_17b76)
	ld [wFramesetPtr + 1], a
.asm_21538
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_InvisibilityPotion:
	call Func_20a63
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz
	cp TRANSFORMATION_INVISIBLE_WARIO
	ret z
	farcall SetState_TurningInvisible
	ret

ObjInteraction_Pneumo:
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, ObjInteraction_YellowBellyArrow
	jp Func_2022c

ObjInteraction_YellowBellyArrow:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c
	cp TRANSFORMATION_PUFFY_WARIO
	jp z, Func_2022c
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, ReleaseOwl
	ld b, OBJACTION_06
	call SetObjAction
	farcall SetState_PuffyInflating
	ret

ObjInteraction_ZombieHead:
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20a69
	ld a, [wTransformation]
	cp TRANSFORMATION_ZOMBIE_WARIO
	jp z, VanishObjectAndKnockBackIfZombie
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_20a69

	ld b, OBJACTION_06
	call SetObjAction

	play_sfx SFX_028

	ld a, TRANSFORMATION_ZOMBIE_WARIO
	ld [wTransformation], a
	ld a, TOUCH_VANISH
	ld [wTouchState], a
	ld a, TOUCH_VANISH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_ZombieIdling
	ret

ObjInteraction_Bouncy:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wObjDirection]
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

Func_2160a:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld b, OBJACTION_06
	call SetObjAction
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
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

ObjInteraction_FireBot:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wObjDirection]
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
	jp ObjInteraction_Fire

ObjInteraction_Solid:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jr nz, Func_2168b
	ld a, [wAttackCounter]
	and a
	jp nz, Func_217a9
	jp Func_20a6f

Func_2168b:
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
	cp TRANSFORMATION_FLAT_WARIO
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
	ld de, wWarioPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	cp TRANSFORMATION_FLAT_WARIO
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

ObjInteraction_Omodon:
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
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz
	ld b, OBJACTION_FLATTEN
	call SetObjAction
	farcall SetState_FlatAirborne
	ret

Func_217a9:
	farcall DoJumpingBump
	ret

ObjInteraction_OrangeBird:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_217db
	ld a, [wObjDirection]
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
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c
	cp TRANSFORMATION_CRAZY_WARIO
	jp z, Func_2022c

	ld b, OBJACTION_06
	call SetObjAction

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

ObjInteraction_Vampire:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz

	ld b, OBJACTION_06
	call SetObjAction

	ld a, TRANSFORMATION_VAMPIRE_WARIO
	ld [wTransformation], a
	farcall Func_19b25
	ld a, [wTransformation]
	cp TRANSFORMATION_VAMPIRE_WARIO
	ret nz
	farcall SetState_VampireTransforming
	ret

ObjInteraction_Bubble:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz

	ld b, OBJACTION_07
	call SetObjAction

	ld a, TRANSFORMATION_BUBBLE
	ld [wTransformation], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_BUMP
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	farcall Func_2ac7d
	ret

ObjInteraction_Ice:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
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
	ld b, OBJACTION_07
	call SetObjAction

	play_sfx SFX_028
	ld a, TRANSFORMATION_ICE_SKATIN
	ld [wTransformation], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_IceSkatinStart
	ret

ObjInteraction_Owl:
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_218f1
	jp Func_20939

.asm_218f1
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
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
	ld a, WST_GRABBING_OWL
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

	ld a, BANK(WarioHangGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioHangGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioHangGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fddb4)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fddb4)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fddb4)
	ld [wOAMPtr + 1], a
	ld a, [wObjDirection]
	ld [wDirection], a
	ld a, HIGH(Frameset_1fed53)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1fed53)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_Rail:
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	ret nz
	cp TRANSFORMATION_RAIL
	ret z

	ld b, OBJACTION_06
	call SetObjAction

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

	ld a, BANK(WarioHangGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioHangGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioHangGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_1fee05)
	ld [wOAMBank], a
	ld a, HIGH(OAM_1fee05)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_1fee05)
	ld [wOAMPtr + 1], a

	ld a, [wObjDirection]
	ld [wDirection], a
	ld a, HIGH(Frameset_1feec4)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1feec4)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 2")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	ret

ObjInteraction_AnonsterSilk:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
;	fallthrough

ObjInteraction_AnonsterWave:
	jp Func_2126a

ObjInteraction_Snow:
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20a69
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_20a69
	call Func_20a63

	ld a, TRANSFORMATION_SNOWMAN_WARIO
	ld [wTransformation], a

	xor a
	ld [wWarioTransformationProgress], a
	ld a, TOUCH_ATTACK
	ld [wTouchState], a
	ld a, TOUCH_ATTACK
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_TurningIntoSnowman
	ret

ObjInteraction_UnlitTorch:
	ld a, [wTransformation]
	cp TRANSFORMATION_HOT_WARIO
	ret nz
	ld b, OBJACTION_0E
	jp SetObjAction

ObjInteraction_Stove:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, Func_21aac
	bit INTERACTION_DOWN_F, a
	jp nz, Func_2168b

	ld a, [wAttackCounter]
	and a
	jr nz, Func_21abb
	jp Func_20a6f

Func_21aac:
	ld a, [wIsSmashAttacking]
	dec a
	jp nz, Func_209ca
; smash attack object
	call Func_20602
	ld b, OBJACTION_SMASH_ATTACK_WALKABLE
	jp SetObjAction

Func_21abb:
	ld b, OBJACTION_ATTACK
	call SetObjAction
	jp Func_20a6f

ObjInteraction_RoboMouse:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_21ae4

	ld a, [wObjDirection]
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
	jp ObjInteraction_Jamano

Func_21af1:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jp nz, StepOnObject
	ld a, [wAttackCounter]
	and a
	jp nz, Func_217a9
	jp Func_20a6f

ObjInteraction_DollBoyHammer:
	jp Func_2160a

ObjInteraction_RollingRock:
	ld b, OBJACTION_06
	call SetObjAction
	ld a, [wIsRolling]
	and a
	ret nz
	ld a, [wObjDirection]
	ld [wDirection], a
	farcall Func_1e174
	ret

ObjInteraction_Wormwould:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
;	fallthrough

Func_21b3a:
	call Func_20939
	ld b, OBJACTION_NONE
	jp SetObjAction

ObjInteraction_Beam:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c

	ld b, OBJACTION_06
	call SetObjAction

	ld a, TRANSFORMATION_SPLIT
	ld [wTransformation], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_SplitHit
	ret

Func_21b78:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr z, .asm_21b86
	ld a, [wIsSmashAttacking]
	and a
	jp nz, Func_20602
.asm_21b86
	jp Func_20939

ObjInteraction_Teruteru:
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jp z, Func_2022c
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c

	ld b, OBJACTION_06
	call SetObjAction

	ld a, TRANSFORMATION_BLIND
	ld [wTransformation], a

	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a

	farcall SetState_BlindIdling

	ld a, BCPSF_AUTOINC | palette 0
	ldh [rBCPS], a
	ld b, 4
	ld c, LOW(rBCPD)
.loop_zero_bg_pals
	wait_ppu_busy
	wait_ppu_free
	xor a
REPT 2 palettes
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_zero_bg_pals

	ld a, OCPSF_AUTOINC | palette 3
	ldh [rOCPS], a
	ld b, 2
	ld c, LOW(rOCPD)
.loop_zero_ob_pals
	wait_ppu_busy
	wait_ppu_free
	xor a
REPT 2 palettes
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .loop_zero_ob_pals
	ret

ObjInteraction_WaterDrop:
	ld b, OBJACTION_06
	call SetObjAction
	ld a, [wTransformation]
	and a
	jp z, ProcessInteractions.next_obj
	jp RecoverFromTransformation

ObjInteraction_Pesce:
	ld a, [wObjDirection]
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
	ld b, OBJACTION_11
	call SetObjAction
	farcall SetState_Swallowed
	ret

Func_21c56:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21aac
	jp Func_20b6b

ObjInteraction_Tadpole:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, StepOnObject
	ld a, [wObjDirection]
	and a
	jr nz, .asm_21c7a
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, ObjInteraction_RollingRock
	jp Func_20e6a
.asm_21c7a
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, ObjInteraction_RollingRock
	jp Func_20e6a

	ret ; stray ret

ObjInteraction_Hebarii:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20e6a
	ld a, [wAttackCounter]
	and a
	jp nz, AttackObject
	jp Func_20e6a

ObjInteraction_PrinceFroggy:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jp nz, Func_2168b
	jp Func_20b41

ObjInteraction_Hand:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	and a
	ret nz

	play_sfx SFX_FAT_WALK
	farcall SetState_DraggedDown
;	fallthrough

Func_21cc9:
	ld b, OBJACTION_13
	call SetObjAction
	ret

ObjInteraction_WaterTeleporting:
	ld a, ROOMTRANSITION_TELEPORT | ROOMTRANSITIONF_DOOR | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_DELAY
	ld [wRoomTransitionParam], a
	call SetState_WaterStung
	stop_sfx
	ld a, WST_WATER_TELEPORTING
	ld [wWarioState], a
	ld b, OBJACTION_TELEPORT
	jp SetObjAction

ObjInteraction_Scowler:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20899
	bit INTERACTION_DOWN_F, a
	jr nz, ObjInteraction_WaterTeleporting
	jp Func_208f2

ObjInteraction_Ink:
	ld b, OBJACTION_06
	jp SetObjAction

ObjInteraction_Jamano:
	ld a, ROOMTRANSITION_TELEPORT | ROOMTRANSITIONF_DOOR | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_DELAY
	ld [wRoomTransitionParam], a
	call Func_206eb
	stop_sfx
	ld a, WST_TELEPORTING
	ld [wWarioState], a
	ld b, OBJACTION_TELEPORT
	jp SetObjAction

ObjInteraction_Turtle:
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

Func_21d3b:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20e6a
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20e6a
	ld a, [wObjDirection]
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

Func_21d64:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20670
	jp Func_20e6a

Func_21d6f:
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

Func_21d88:
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	ld a, [wObjDirection]
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

Func_21dac:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c
	ld a, [wObjDirection]
	ld [wDirection], a
	farcall SetState_Launched
	ld b, OBJACTION_06
	jp SetObjAction

ObjInteraction_ColourCoin:
	play_sfx SFX_COLOUR_COIN
;	fallthrough

; adds 10 to coin count
CollectMusicalCoin:
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
	jp ProcessInteractions.next_obj

ObjInteraction_MagicalSpiral:
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c
	ld b, OBJACTION_06
	call SetObjAction

	ld a, TRANSFORMATION_MAGIC
	ld [wTransformation], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a
	farcall SetState_MagicRising
	ret

ObjInteraction_BottomSting:
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20670
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
	jp Func_2022c

ObjInteraction_Shoot:
	ld a, [wTransformation]
	cp TRANSFORMATION_BALL
	jr z, Func_21e8a
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .interaction_down
	bit INTERACTION_UP_F, a
	jp nz, StepOnObject
	jp Func_20e63

.interaction_down
	ld a, [wInvincibleCounter]
	and a
	ret nz ; skip if invincible
	ld a, [wTransformation]
	bit TRANSFORMATIONF_PERSISTENT_F, a
	jp nz, Func_2022c

	; turn Wario into ball form
	ld b, OBJACTION_06
	call SetObjAction
	ld a, TRANSFORMATION_BALL
	ld [wTransformation], a

	ld a, TOUCH_PASS_THROUGH
	ld [wTouchState], a
	ld a, TOUCH_PASS_THROUGH
	ld [wStingTouchState], a
	ld a, $02
	ld [wca94], a

	farcall SetState_BallStart
	ret

Func_21e8a:
	farcall SetState_BallShot
	jp Func_21cc9

Func_21e9c:
	ld a, [wTransformation]
	cp TRANSFORMATION_BALL
	jr z, Func_21e8a
	jp Func_20939

Func_21ea6:
	ld a, [wObjDirection]
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
	ld a, [wObjDirection]
	xor $1
	ld [wDirection], a
	jp Func_20a6f
.asm_21eca
	jp Func_21b3a

Func_21ecd:
	ld a, [wObjDirection]
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

Func_21f01:
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

Func_21f28:
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21d6f.asm_21d7e
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20e6a
	ld a, [wObjDirection]
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
