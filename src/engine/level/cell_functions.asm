; processes the cell function of wCellPtrBank:wCellPtr
ProcessCell:
	xor a ; FALSE
	ld [wc0dd], a
	ld a, [wCellPtrBank]
	sramswitch
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, wCellFunctionTable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

CellFunc_Free:
	xor a ; SRAM0
	sramswitch
	xor a
	ld [wCellFuncBreakFlag], a ; FALSE
	ld [wCellFuncSpecialCollision], a
	ld [wUnused_c18d], a
	ret

CellFunc_Solid:
	xor a
	sramswitch
	xor a
	ld [wCellFuncBreakFlag], a ; FALSE
	ld [wCellFuncSpecialCollision], a
	ld a, [wCellFuncWarioFlag]
	and a
	jr z, .snap_y_pos
	ld a, [wSlopeInteraction]
	and a
	jr z, .snap_y_pos
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr z, .snap_y_pos
	xor a
	ld [wUnused_c18d], a
	ret

.snap_y_pos
	ldh a, [hYPosLo]
	and $f0
	ldh [hYPosLo], a
	ld a, $01
	ld [wUnused_c18d], a
	ret

Func_18064:
	xor a
	sramswitch
	xor a
	ld [wCellFuncBreakFlag], a ; FALSE
	ld [wCellFuncSpecialCollision], a
	ld a, $10
	ld [wUnused_c18d], a
	ret

; unreferenced
Func_18078:
	xor a
	sramswitch
	xor a
	ld [wCellFuncBreakFlag], a ; FALSE
	ld [wCellFuncSpecialCollision], a
	ld a, $01
	ld [wUnused_c18d], a
	ret

Func_1808c:
	xor a
	sramswitch
	xor a
	ld [wCellFuncBreakFlag], a ; FALSE
	ld [wCellFuncSpecialCollision], a
	xor a
	ld [wUnused_c18d], a
	ret

CellFunc_1809f:
	ld a, [wc0d6]
	bit COLLISION_DOWN_F, a
	jp z, CellFunc_Free
	ldh a, [hYPosLo]
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	jr RightSlopeCollision

CellFunc_180b5:
	ld a, [wCellFuncWarioFlag]
	and a
	jr z, .asm_180c3
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	jp z, CellFunc_Solid
.asm_180c3
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1
	jp z, CellFunc_Free
	ldh a, [hYPosLo]
	sub $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	sbc $00
	ldh [hYPosHi], a
	jr RightSlopeCollision

CellFunc_RightSlope:
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1
	jp z, CellFunc_Free
	ld a, [wc0d6] ; unnecessary
	bit COLLISION_UNK1_F, a
	jr z, RightSlopeCollision
	ldh a, [hYPosLo]
	and $0f
	ld b, a
	ldh a, [hXPosLo]
	and $0f
	add b
	cp $10
	jp c, CellFunc_Free
;	fallthrough

RightSlopeCollision:
	ldh a, [hXPosLo]
	and $0f
	ld c, a
	ld a, $10
	sub c
	ld c, a
	ldh a, [hYPosLo]
	and $f0
	add c
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc 0
	ldh [hYPosHi], a
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1
	jr z, .asm_18126
	ld a, [wCellFuncWarioFlag]
	and a
	jr nz, .set_slope_interaction
	ld a, $11
	ld [wc18c], a
	jr .asm_18126
.set_slope_interaction
	ld a, RIGHT_SLOPE
	ld [wSlopeInteraction], a
.asm_18126
	jp Func_18064

CellFunc_18129:
	ld a, [wc0d6]
	bit COLLISION_DOWN_F, a
	jp z, CellFunc_Free
	ldh a, [hYPosLo]
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc 0
	ldh [hYPosHi], a
	jr LeftSlopeCollision

CellFunc_1813f:
	ld a, [wCellFuncWarioFlag]
	and a
	jr z, .asm_1814d
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	jp z, CellFunc_Solid
.asm_1814d
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1
	jp z, CellFunc_Free
	ldh a, [hYPosLo]
	sub $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	sbc $00
	ldh [hYPosHi], a
	jr LeftSlopeCollision

CellFunc_LeftSlope:
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1
	jp z, CellFunc_Free
	bit COLLISION_UNK1_F, a
	jr z, LeftSlopeCollision
	ldh a, [hYPosLo]
	and $0f
	ld b, a
	ldh a, [hXPosLo]
	and $0f
	cp b
	jp nc, CellFunc_Free
;	fallthrough

LeftSlopeCollision:
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1
	jr z, .asm_181a9
	ldh a, [hXPosLo]
	and $0f
	inc a
	inc a
	ld c, a
	ldh a, [hYPosLo]
	and $f0
	add c
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc 0
	ldh [hYPosHi], a
	ld a, [wCellFuncWarioFlag]
	and a
	jr nz, .set_slope_interaction
	ld a, $12
	ld [wc18c], a
	jr .asm_181a9
.set_slope_interaction
	ld a, LEFT_SLOPE
	ld [wSlopeInteraction], a
.asm_181a9
	jp Func_18064

CellFunc_Water:
	ld a, TRUE
	ld [wc0dd], a
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, SUBMERSIBLE_WATER
	ld [wWaterInteraction], a
	jp CellFunc_Free

CellFunc_RightCurrent:
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, CURRENT_RIGHT
	ld [wWaterCurrent], a
	jp CellFunc_Water

CellFunc_UpCurrent:
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, CURRENT_UP
	ld [wWaterCurrent], a
	jp CellFunc_Water

CellFunc_LeftCurrent:
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, CURRENT_LEFT
	ld [wWaterCurrent], a
	jp CellFunc_Water

CellFunc_DownCurrent:
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, CURRENT_DOWN
	ld [wWaterCurrent], a
	jp CellFunc_Water

CellFunc_Floor:
	ld a, TRUE
	ld [wc1ca], a
	ld a, [wc0d6]
	bit COLLISION_DOWN_F, a
	jr nz, .asm_18228
	bit COLLISION_UNK2_F, a
	jr nz, .asm_18228
	and COLLISION_UNK3 | COLLISION_UNK4 | COLLISION_UNK5 | COLLISION_UNK7
	jp nz, CellFunc_Free
	ldh a, [hYPosLo]
	and $0f
	cp $05
	jr c, .asm_18228
	jp CellFunc_Free
.asm_18228
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wWarioState]
	cp WST_ZOMBIE_LANDING
	jp z, CellFunc_Free
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	jp z, CellFunc_Free
	jp CellFunc_Solid

CellFunc_WaterSurface:
	ld a, [wc0d6]
	bit COLLISION_UNK1_F, a
	jr nz, .asm_18257
	ldh a, [hYPosLo]
	and $0e
	jp nz, CellFunc_Water
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK2
	jr nz, .asm_1825a
	jp CellFunc_Water
.asm_18257
	jp CellFunc_Floor
.asm_1825a
	ld a, TRUE
	ld [wc0dd], a
	jp CellFunc_Solid

CellFunc_18262:
	ld a, [wCellFuncWarioFlag]
	and a
	jp nz, CellFunc_Free
	ld a, TRUE
	ld [wc1ca], a
	ld a, [wc0d6]
	bit COLLISION_DOWN_F, a
	jp nz, CellFunc_Solid
	bit COLLISION_UNK2_F, a
	jp nz, CellFunc_Solid
	and COLLISION_UNK3 | COLLISION_UNK4 | COLLISION_UNK5 | COLLISION_UNK7
	jp nz, CellFunc_Free
	ldh a, [hYPosLo]
	and $0f
	cp $05
	jp c, CellFunc_Solid
	jp CellFunc_Free

CellFunc_Switch:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	and COLLISION_UNK3 | COLLISION_UNK5
	jp z, CellFunc_Solid
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	ld [wSwitchState], a
	xor $8
	ld [hl], a
	call Func_e31
	ld a, [wSwitchStateUpdated]
	xor 1
	ld [wSwitchStateUpdated], a
	play_sfx SFX_SWITCH
	ld b, 16
	call DoGroundShake
	jp CellFunc_Solid

CellFunc_Ladder:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jr nz, .set_ladder_interaction
	jp CellFunc_Free
.set_ladder_interaction
	ld a, $01
	ld [wLadderInteraction], a
	jp Func_1808c

CellFunc_182dc:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	jr Func_182ec

CellFunc_LadderTop:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Floor
;	fallthrough

Func_182ec:
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jr nz, .asm_182f6
	jp CellFunc_Floor
.asm_182f6
	ld a, $02
	ld [wLadderInteraction], a
	jp Func_1808c

CellFunc_182fe:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, $01
	ld [wLadderInteraction], a
	ld a, ROOMTRANSITION_5 | ROOMTRANSITIONF_2
	ld [wRoomTransitionParam], a
	jp CellFunc_Free

Func_1831a:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, $01
	ld [wLadderInteraction], a
	ld a, ROOMTRANSITION_5
	ld [wRoomTransitionParam], a
	jp CellFunc_Free

CellFunc_NonSolidSpike:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wInvincibleCounter]
	and a
	jp nz, CellFunc_Free
	ld a, [wca94]
	cp $02
	jp z, CellFunc_Free
	ld a, [wWarioState]
	cp WST_STUNG
	jp z, CellFunc_Free
	cp WST_STUNG_RECOVERY
	jp z, CellFunc_Free

	; switch direction
	ld a, [wDirection]
	and a
	jr nz, .right
; left
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_1836b
.right
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.asm_1836b
	ld a, [wca94]
	and a
	jr nz, .asm_18383
	farcall SetState_Stung
	jp CellFunc_Free
.asm_18383
	cp $01
	jr z, .asm_1838a
	jp CellFunc_Free
.asm_1838a
	farcall Func_206eb
	jp CellFunc_Free

CellFunc_SolidSpike:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wInvincibleCounter]
	and a
	jp nz, CellFunc_Solid
	ld a, [wca94]
	cp $02
	jp z, CellFunc_Solid
	ld a, [wWarioState]
	cp WST_STUNG
	jp z, CellFunc_Solid
	cp WST_STUNG_RECOVERY
	jp z, CellFunc_Solid

	; switch direction
	ld a, [wDirection]
	and a
	jr nz, .right
; left
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_183d1
.right
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.asm_183d1
	ld a, [wca94]
	and a
	jr nz, .asm_183e9
	farcall SetState_Stung
	jp CellFunc_Solid
.asm_183e9
	cp $01
	jr z, .asm_183f0
	jp CellFunc_Solid
.asm_183f0
	farcall Func_206eb
	jp CellFunc_Solid

CellFunc_WaterSpike:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Water
	ld a, [wInvincibleCounter]
	and a
	jp nz, CellFunc_Water
	ld a, [wWarioState]
	cp WST_WATER_STUNG
	jp z, CellFunc_Water
	farcall SetState_WaterStung
	jp CellFunc_Water

CellFunc_DownPipe_Left:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid

	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_1843d
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Solid
.asm_1843d
	ld a, [wc0d6]
	and COLLISION_DOWN
	jp z, CellFunc_Solid
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, CellFunc_Solid
	ld a, [wWarioXPos + 1]
	and $f0
	add $18
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc $00
	ld [wWarioXPos + 0], a
	jr EnterPipeDown

CellFunc_DownPipe_Right:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid

	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_18474
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Solid
.asm_18474
	ld a, [wc0d6]
	and COLLISION_DOWN
	jp z, CellFunc_Solid
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, CellFunc_Solid
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a

EnterPipeDown:
	ld a, ROOMTRANSITION_1 | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
	play_sfx SFX_PIPE
	ld a, WST_PIPE_GOING_DOWN
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	ld [wIsSmashAttacking], a

	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_14a82)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14a82)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14a82)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_14cf6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cf6)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jp CellFunc_Solid

CellFunc_UpPipe_Left:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid

	ld a, [wWarioState]
	cp WST_AIRBORNE
	jr z, .asm_1850f
	cp WST_GRAB_AIRBORNE
	jp nz, CellFunc_Solid
.asm_1850f
	ld a, [wc0d6]
	and COLLISION_UNK5
	jp z, CellFunc_Solid
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp z, CellFunc_Solid
	ld a, [wWarioXPos + 1]
	and $f0
	add $18
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc $00
	ld [wWarioXPos + 0], a
	jr EnterPipeUp

CellFunc_UpPipe_Right:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid

	ld a, [wWarioState]
	cp WST_AIRBORNE
	jr z, .asm_18546
	cp WST_GRAB_AIRBORNE
	jp nz, CellFunc_Solid
.asm_18546
	ld a, [wc0d6]
	and COLLISION_UNK5
	jp z, CellFunc_Solid
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp z, CellFunc_Solid
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
;	fallthrough

EnterPipeUp:
	ld a, ROOMTRANSITION_1 | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
	play_sfx SFX_PIPE
	ld a, WST_PIPE_GOING_UP
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a

	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_14a82)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14a82)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14a82)
	ld [wOAMPtr + 1], a
	ld a, HIGH(Frameset_14cf6)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14cf6)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jp CellFunc_Solid

CellFunc_Door:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, CellFunc_Free
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .enter_door
	cp WST_SLIPPING
	jr z, .enter_door
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Free
.enter_door
	ld a, ROOMTRANSITION_2 | ROOMTRANSITIONF_1 | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
	jp EnterDoor

CellFunc_MinigameDoor:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, CellFunc_Free
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .enter_door
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Free
.enter_door
	ld a, ROOMTRANSITION_GOLF | ROOMTRANSITIONF_1 | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
	jr EnterDoor

; unreferenced
Func_18624:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, CellFunc_Free
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_18647
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Free
.asm_18647
	ld a, ROOMTRANSITION_2 | ROOMTRANSITIONF_1 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
	jr EnterDoor

; unreferenced
Func_1864e:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, CellFunc_Free
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_18671
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Free
.asm_18671
	ld a, ROOMTRANSITION_GOLF | ROOMTRANSITIONF_1 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
;	fallthrough

EnterDoor:
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
	play_sfx SFX_0E6

	ld a, WST_ENTERING_DOOR
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wIsCrouching], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, BANK(WarioIdleGfx)
	ld [wDMASourceBank], a
	ld a, HIGH(WarioIdleGfx)
	ld [wDMASourcePtr + 0], a
	ld a, LOW(WarioIdleGfx)
	ld [wDMASourcePtr + 1], a
	call LoadWarioGfx
	ld a, BANK(OAM_14a82)
	ld [wOAMBank], a
	ld a, HIGH(OAM_14a82)
	ld [wOAMPtr + 0], a
	ld a, LOW(OAM_14a82)
	ld [wOAMPtr + 1], a
	ld a, [wDirection]
	and a
	jr nz, .asm_186dd
	ld a, HIGH(Frameset_14d0b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d0b)
	ld [wFramesetPtr + 1], a
	jr .asm_186e7
.asm_186dd
	ld a, HIGH(Frameset_14d10)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d10)
	ld [wFramesetPtr + 1], a
.asm_186e7
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation
	jp CellFunc_Free

CellFunc_186f9:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Water
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_1870b
	and a
	jp nz, CellFunc_Water
.asm_1870b
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, SUBMERSIBLE_WATER
	ld [wWaterInteraction], a
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jr z, .asm_18724
	ld a, ROOMTRANSITION_6 | ROOMTRANSITIONF_1 | ROOMTRANSITIONF_2
	ld [wRoomTransitionParam], a
.asm_18724
	jp CellFunc_Free

CellFunc_18727:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Water
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_18739
	and a
	jp nz, CellFunc_Water
.asm_18739
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, SUBMERSIBLE_WATER
	ld [wWaterInteraction], a
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jr z, .asm_18752
	ld a, ROOMTRANSITION_6 | ROOMTRANSITIONF_1
	ld [wRoomTransitionParam], a
.asm_18752
	jp CellFunc_Free

Func_18755:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_18767
	and a
	jp nz, CellFunc_Free
.asm_18767
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jr z, .asm_1877b
	ld a, ROOMTRANSITION_8 | ROOMTRANSITIONF_1 | ROOMTRANSITIONF_2 | ROOMTRANSITIONF_3
	ld [wRoomTransitionParam], a
.asm_1877b
	jp CellFunc_Free

CellFunc_TreasureDoor:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, CellFunc_Free
	ld a, [wTransformation]
	and a
	jp nz, CellFunc_Free
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .enter_door
	cp WST_SLIPPING
	jr z, .enter_door
	cp WST_GRAB_IDLING
	jp nz, CellFunc_Free
.enter_door
	xor a
	ld [wGrabState], a
	ld a, LVLEND_NO_TREASURE
	ld [wLevelEndScreen], a
	jp CellFunc_Free

CellFunc_187b0:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, ROOMTRANSITION_4 | ROOMTRANSITIONF_2
	ld [wRoomTransitionParam], a
	jp CellFunc_Free

Func_187c7:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, ROOMTRANSITION_4
	ld [wRoomTransitionParam], a
	jp CellFunc_Free

CellFunc_187de:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Water
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, ROOMTRANSITION_4 | ROOMTRANSITIONF_2
	ld [wRoomTransitionParam], a
	jp CellFunc_Water

Func_187f5:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Water
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Water
	ld a, ROOMTRANSITION_4
	ld [wRoomTransitionParam], a
	jp CellFunc_Water

CellFunc_WalkthroughPipe:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jp nz, CellFunc_Free
	call RecoverFromTransformation_WithoutInvincibility
	jp CellFunc_Free

CellFunc_LightSource:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	jr z, .asm_1883a
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jp nz, CellFunc_Free
	call RecoverFromTransformation_WithoutInvincibility
	jp CellFunc_Free
.asm_1883a
	farcall SetState_ZombieRecovering
	jp CellFunc_Free

CellFunc_Sand:
	ld a, TRUE
	ld [wc0dd], a
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, TRUE
	ld [wIsInSand], a
	jp CellFunc_Free

CellFunc_18868:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jp nz, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Solid
	ld a, [wWarioXPos + 1]
	and $08
	jr nz, .asm_1889e
	ld a, [wCollisionBoxRight]
	ld b, a
	ld a, [wWarioXPos + 1]
	and $f0
	sub b
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	sbc $00
	ld [wWarioXPos + 0], a
	jp CellFunc_Solid
.asm_1889e
	ld a, [wCollisionBoxLeft]
	ld b, a
	ld a, $10
	sub b
	ld b, a
	ld a, [wWarioXPos + 1]
	and $f0
	add b
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc $00
	ld [wWarioXPos + 0], a
	jp CellFunc_Solid

CellFunc_188ba:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	jp CellFunc_Free

CellFunc_NonSubmersibleWater:
	ld a, TRUE
	ld [wc0dd], a
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jp z, CellFunc_Free
	ld a, NON_SUBMERSIBLE_WATER
	ld [wWaterInteraction], a
	jp CellFunc_Free

CellFunc_Fire:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	and COLLISION_DOWN | COLLISION_UNK1 | COLLISION_UNK2 | COLLISION_UNK6
	jp nz, CellFunc_Free
	ld a, [wInvincibleCounter]
	and a
	jp nz, CellFunc_Free
	ld a, [wTransformation]
	bit 6, a
	jp nz, CellFunc_Free
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
	farcall SetState_OnFire_ResetStateCounter
	ret

CellFunc_Fence:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jr nz, .set_near_fence
	jp CellFunc_Free
.set_near_fence
	ld a, TRUE
	ld [wIsNearFence], a
	jp Func_1808c

CellFunc_AirCurrent:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wc0d6]
	bit COLLISION_UNK7_F, a
	jr nz, .asm_1895e
	jp CellFunc_Free
.asm_1895e
	ld a, [wInvincibleCounter]
	and a
	jp nz, CellFunc_Free
	ld a, TRUE
	ld [wIsInAirCurrent], a
	ld a, [wTransformation]
	and a
	jp nz, CellFunc_Free
	ld a, TRANSFORMATION_FAN
	ld [wTransformation], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	farcall SetState_FanStart
	jp CellFunc_Free

CellFunc_SlipperySolid:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	and COLLISION_DOWN
	jp z, CellFunc_Solid
	ld a, TRUE
	ld [wIsOnSlipperyGround], a
	jp CellFunc_Solid

CellFunc_SlipperyFloor:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Floor
	ld a, [wc0d6]
	and COLLISION_DOWN
	jp z, CellFunc_Floor
	ld a, TRUE
	ld [wIsOnSlipperyGround], a
	jp CellFunc_Floor

CellFunc_CloudPlatform1:
	ld a, [wRoomPalCycleIndex]
	cp $07
	jr z, .solid
	cp $04
	jp nc, CellFunc_Free
.solid
	jp CellFunc_Floor

CellFunc_CloudPlatform2:
	ld a, [wRoomPalCycleIndex]
	cp $03
	jp c, CellFunc_Free
	jp CellFunc_Floor

CellFunc_SmallGap:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, CellFunc_Free
	jp CellFunc_Solid

CellFunc_189f1:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Free
	jp CellFunc_Floor

CellFunc_CrackedBlockWithColourCoin_78:
	ld b, $78
	jr CrackedBlockWithColourCoinCollision

CellFunc_CrackedBlockWithColourCoin_79:
	ld b, $79
	jr CrackedBlockWithColourCoinCollision

CellFunc_CrackedBlockWithColourCoin_7a:
	ld b, $7a
	jr CrackedBlockWithColourCoinCollision

CellFunc_CrackedBlockWithColourCoin_7b:
	ld b, $7b
	jr CrackedBlockWithColourCoinCollision

CellFunc_CrackedBlockWithColourCoin_7c:
	ld b, $7c
	jr CrackedBlockWithColourCoinCollision

; unreferenced
Func_18a0f:
	ld b, $7d
	jr CrackedBlockWithColourCoinCollision

CellFunc_CrackedBlockWithColourCoin_7e:
	ld b, $7e
	jr CrackedBlockWithColourCoinCollision

; unreferenced
Func_18a17:
	ld b, $7f
;	fallthrough

CrackedBlockWithColourCoinCollision:
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_18a36
	bit COLLISION_UNK5_F, a
	jr nz, .asm_18a45
	bit COLLISION_UNK3_F, a
	jr nz, .asm_18a45
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_18a5c
	jp CellFunc_Solid

.asm_18a36
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18a5c
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18a5c
	jp CellFunc_Solid

.asm_18a45
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18a5c
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18a5c
	jp CellFunc_Solid

.asm_18a5c
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlockWithColourCoin
	ld a, [wIsRolling]
	and a
	jp nz, CellFunc_Free
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, CellFunc_Free
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_18a8f
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	jp CellFunc_Free
.asm_18a8f
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
	jp CellFunc_Free

Func_18a9a:
	ld b, $79
	jr Func_18aa8
Func_18a9e:
	ld b, $7a
	jr Func_18aa8
Func_18aa2:
	ld b, $7b
	jr Func_18aa8
CellFunc_18aa6:
	ld b, $78
;	fallthrough

Func_18aa8:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18ad6
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $01
	jp c, CellFunc_Solid
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18ad6
	or $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32

Func_18ade:
	ld b, $79
	jr Func_18aec
Func_18ae2:
	ld b, $7a
	jr Func_18aec
Func_18ae6:
	ld b, $7b
	jr Func_18aec
CellFunc_18aea:
	ld b, $78
;	fallthrough
Func_18aec:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18b17
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $01
	jp c, CellFunc_Solid
	ld a, $03
	ld [wMultiCellBlockParam], a
.asm_18b17
	or $03
	ld [wMultiCellBlockParam], a
	jp Func_18f32

; unreferenced
Func_18b1f:
	ld b, $79
	jr Func_18b2d

CellFunc_18b23:
	ld b, $7a
	jr Func_18b2d

; unreferenced
Func_18b27:
	ld b, $7b
	jr Func_18b2d

CellFunc_18b2b:
	ld b, $78
;	fallthrough

Func_18b2d:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18b5b
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $01
	jp c, CellFunc_Solid
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18b5b
	or $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32

; unreferenced
Func_18b63:
	ld b, $79
	jr Func_18b71

CellFunc_18b67:
	ld b, $7a
	jr Func_18b71

; unreferenced
Func_18b6b:
	ld b, $7b
	jr Func_18b71

CellFunc_18b6f:
	ld b, $78
;	fallthrough

Func_18b71:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18b9f
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $01
	jp c, CellFunc_Solid
	ld a, $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18b9f
	or $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32

; unreferenced
Func_18ba7:
	ld b, $79
	jr Func_18bb5

; unreferenced
Func_18bab:
	ld b, $7a
	jr Func_18bb5

; unreferenced
Func_18baf:
	ld b, $7b
	jr Func_18bb5

CellFunc_18bb3:
	ld b, $78
;	fallthrough

Func_18bb5:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18be3
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $03
	jp nz, CellFunc_Solid
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18be3
	or $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32

; unreferenced
Func_18beb:
	ld b, $79
	jr Func_18bf9

; unreferenced
Func_18bef:
	ld b, $7a
	jr Func_18bf9

; unreferenced
Func_18bf3:
	ld b, $7b
	jr Func_18bf9

CellFunc_18bf7:
	ld b, $78
;	fallthrough

Func_18bf9:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18c24
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $03
	jp nz, CellFunc_Solid
	ld a, $03
	ld [wMultiCellBlockParam], a
.asm_18c24
	or $03
	ld [wMultiCellBlockParam], a
	jp Func_18f32

; unreferenced
Func_18c2c:
	ld b, $79
	jr Func_18c3a

CellFunc_18c30:
	ld b, $7a
	jr Func_18c3a

; unreferenced
Func_18c34:
	ld b, $7b
	jr Func_18c3a

CellFunc_18c38:
	ld b, $78
;	fallthrough

Func_18c3a:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18c68
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $03
	jp nz, CellFunc_Solid
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18c68
	or $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32

; unreferenced
Func_18c70:
	ld b, $79
	jr Func_18c7e

CellFunc_18c74:
	ld b, $7a
	jr Func_18c7e

; unreferenced
Func_18c78:
	ld b, $7b
	jr Func_18c7e

CellFunc_18c7c:
	ld b, $78
;	fallthrough

Func_18c7e:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18cac
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jp nz, CellFunc_Solid
	ld a, [wca8f]
	cp $03
	jp nz, CellFunc_Solid
	ld a, $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18cac
	or $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32

CellFunc_CrackedBlock_78:
	ld b, $78
	jr CrackedBlockCollision

CellFunc_CrackedBlock_79:
	ld b, $79
	jr CrackedBlockCollision

CellFunc_CrackedBlock_7a:
	ld b, $7a
	jr CrackedBlockCollision

CellFunc_CrackedBlock_7b:
	ld b, $7b
	jr CrackedBlockCollision

CellFunc_CrackedBlock_7c:
	ld b, $7c
	jr CrackedBlockCollision

CellFunc_CrackedBlock_7d:
	ld b, $7d
	jr CrackedBlockCollision

CellFunc_CrackedBlock_7e:
	ld b, $7e
	jr CrackedBlockCollision

CellFunc_CrackedBlock_7f:
	ld b, $7f
;	fallthrough

CrackedBlockCollision:
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_BREAK
	jp z, Func_19423
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_18cfc
	bit COLLISION_UNK5_F, a
	jr nz, .asm_18d0b
	bit COLLISION_UNK3_F, a
	jr nz, .asm_18d0b
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_18d22
	jp CellFunc_Solid
.asm_18cfc
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18d22
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18d22
	jp CellFunc_Solid
.asm_18d0b
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18d22
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18d22
	jp CellFunc_Solid
.asm_18d22
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	ld a, [wIsRolling]
	and a
	jp nz, CellFunc_Free
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, CellFunc_Free
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_18d55
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	jp CellFunc_Free
.asm_18d55
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
	jp CellFunc_Free

CellFunc_NonCrackedBlock_78:
	ld b, $78
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_79:
	ld b, $79
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_7a:
	ld b, $7a
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_7b:
	ld b, $7b
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_7c:
	ld b, $7c
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_7d:
	ld b, $7d
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_7e:
	ld b, $7e
	jr NonCrackedBlockCollision

CellFunc_NonCrackedBlock_7f:
	ld b, $7f
;	fallthrough

NonCrackedBlockCollision:
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_BREAK
	jp z, Func_19423
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .fat_wario
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_18dcb
	bit COLLISION_UNK5_F, a
	jr nz, .asm_18dda
	bit COLLISION_UNK3_F, a
	jr nz, .asm_18dda
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_18dc1
	jp CellFunc_Solid

.fat_wario
	ld a, [wc0d6]
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, Func_18df1
	jp CellFunc_Solid

.asm_18dc1
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, Func_18df1
	jp CellFunc_Solid

.asm_18dcb
	ld a, [wAttackCounter]
	and a
	jr nz, Func_18df1
	ld a, [wIsRolling]
	and a
	jr nz, Func_18df1
	jp CellFunc_Solid

.asm_18dda
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, Func_18df1
	ld a, [wSwimVelIndex]
	and a
	jr nz, Func_18df1
	jp CellFunc_Solid

Func_18df1:
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	ld a, [wIsRolling]
	and a
	jp nz, CellFunc_Free
	jp CellFunc_Solid

CellFunc_18e0e:
	ld b, $79
	jr Func_18e2c

; unreferenced
Func_18e12:
	ld b, $7a
	jr Func_18e2c

; unreferenced
Func_18e16:
	ld b, $7b
	jr Func_18e2c

CellFunc_18e1a:
	ld b, $7c
	jr Func_18e2c

; unreferenced
Func_18e1e:
	ld b, $7d
	jr Func_18e2c

; unreferenced
Func_18e22:
	ld b, $7e
	jr Func_18e2c

CellFunc_18e26:
	ld b, $7f
	jr Func_18e2c

CellFunc_18e2a:
	ld b, $78
;	fallthrough

Func_18e2c:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18e92
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_18e9a
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_18e64
	bit COLLISION_UNK5_F, a
	jr nz, .asm_18e73
	bit COLLISION_UNK3_F, a
	jr nz, .asm_18e73
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_18e8a
	jp CellFunc_Solid
.asm_18e64
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18e8a
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18e8a
	jp CellFunc_Solid
.asm_18e73
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18e8a
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18e8a
	jp CellFunc_Solid
.asm_18e8a
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_19086
.asm_18e92
	or $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18e9a
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32

CellFunc_18ea2:
	ld b, $79
	jr Func_18ec0

; unreferenced
Func_18ea6:
	ld b, $7a
	jr Func_18ec0

; unreferenced
Func_18eaa:
	ld b, $7b
	jr Func_18ec0

CellFunc_18eae:
	ld b, $7c
	jr Func_18ec0

; unreferenced
Func_18eb2:
	ld b, $7d
	jr Func_18ec0

; unreferenced
Func_18eb6:
	ld b, $7e
	jr Func_18ec0

; unreferenced
Func_18eba:
	ld b, $7f
	jr Func_18ec0

CellFunc_18ebe:
	ld b, $78
;	fallthrough

Func_18ec0:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18f26
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_18f2d
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_18ef8
	bit COLLISION_UNK5_F, a
	jr nz, .asm_18f07
	bit COLLISION_UNK3_F, a
	jr nz, .asm_18f07
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_18f1e
	jp CellFunc_Solid
.asm_18ef8
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18f1e
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18f1e
	jp CellFunc_Solid
.asm_18f07
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18f1e
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18f1e
	jp CellFunc_Solid
.asm_18f1e
	ld a, $03
	ld [wMultiCellBlockParam], a
	jp Func_19086
.asm_18f26
	or $03
	ld [wMultiCellBlockParam], a
	jr Func_18f32
.asm_18f2d
	ld a, $03
	ld [wMultiCellBlockParam], a
;	fallthrough

Func_18f32:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wCellPtr
	ld a, [hli]
	ld [wcedc + 0], a
	ld d, a
	ld a, [hl]
	ld [wcedc + 1], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	jp CellFunc_Free

CellFunc_18f5f:
	ld b, $79
	jr Func_18f7d

; unreferenced
Func_18f63:
	ld b, $7a
	jr Func_18f7d

; unreferenced
Func_18f67:
	ld b, $7b
	jr Func_18f7d

CellFunc_18f6b:
	ld b, $7c
	jr Func_18f7d

; unreferenced
Func_18f6f:
	ld b, $7d
	jr Func_18f7d

; unreferenced
Func_18f73:
	ld b, $7e
	jr Func_18f7d

; unreferenced
Func_18f77:
	ld b, $7f
	jr Func_18f7d

CellFunc_18f7b:
	ld b, $78
;	fallthrough

; same as Func_19011 but outputs $02 in wMultiCellBlockParam
Func_18f7d:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_18fe3
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_18feb
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_18fb5
	bit COLLISION_UNK5_F, a
	jr nz, .asm_18fc4
	bit COLLISION_UNK3_F, a
	jr nz, .asm_18fc4
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_18fdb
	jp CellFunc_Solid
.asm_18fb5
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18fdb
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18fdb
	jp CellFunc_Solid
.asm_18fc4
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18fdb
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18fdb
	jp CellFunc_Solid
.asm_18fdb
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_19086
.asm_18fe3
	or $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_18feb
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32

CellFunc_18ff3:
	ld b, $79
	jr Func_19011

; unreferenced
Func_18ff7:
	ld b, $7a
	jr Func_19011

; unreferenced
Func_18ffb:
	ld b, $7b
	jr Func_19011

CellFunc_18fff:
	ld b, $7c
	jr Func_19011

; unreferenced
Func_19003:
	ld b, $7d
	jr Func_19011

CellFunc_19007:
	ld b, $7e
	jr Func_19011

; unreferenced
Func_1900b:
	ld b, $7f
	jr Func_19011

CellFunc_1900f:
	ld b, $78
;	fallthrough

; same as Func_18f7d but outputs $04 in wMultiCellBlockParam
Func_19011:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_19076
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_1907e
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_19049
	bit COLLISION_UNK5_F, a
	jr nz, .asm_19058
	bit COLLISION_UNK3_F, a
	jr nz, .asm_19058
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_1906f
	jp CellFunc_Solid
.asm_19049
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_1906f
	ld a, [wIsRolling]
	and a
	jr nz, .asm_1906f
	jp CellFunc_Solid
.asm_19058
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1906f
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_1906f
	jp CellFunc_Solid
.asm_1906f
	ld a, $04
	ld [wMultiCellBlockParam], a
	jr Func_19086
.asm_19076
	or $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_1907e
	ld a, $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32

Func_19086:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wCellPtr
	ld a, [hli]
	ld [wcedc + 0], a
	ld d, a
	ld a, [hl]
	ld [wcedc + 1], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	ld a, [wIsRolling]
	and a
	jp nz, CellFunc_Free
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, CellFunc_Free
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_190d5
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	jp CellFunc_Free
.asm_190d5
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
	jp CellFunc_Free

; unreferenced
Func_190e0:
	ld b, $79
	jr Func_190fe

CellFunc_190e4:
	ld b, $7a
	jr Func_190fe

CellFunc_190e8:
	ld b, $7b
	jr Func_190fe

; unreferenced
Func_190ec:
	ld b, $7c
	jr Func_190fe

; unreferenced
Func_190f0:
	ld b, $7d
	jr Func_190fe

; unreferenced
Func_190f4:
	ld b, $7e
	jr Func_190fe

; unreferenced
Func_190f8:
	ld b, $7f
	jr Func_190fe

CellFunc_190fc:
	ld b, $78
;	fallthrough

Func_190fe:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Solid
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_19185
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_1918d
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_19145
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_1914f
	bit COLLISION_UNK5_F, a
	jr nz, .asm_1915e
	bit COLLISION_UNK3_F, a
	jr nz, .asm_1915e
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_19175
	jp CellFunc_Solid
.asm_19145
	ld a, [wc0d6]
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_1917d
	jp CellFunc_Solid
.asm_1914f
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_1917d
	ld a, [wIsRolling]
	and a
	jr nz, .asm_19175
	jp CellFunc_Solid
.asm_1915e
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1917d
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_1917d
	jp CellFunc_Solid
.asm_19175
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
.asm_1917d
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_193dc
.asm_19185
	or $01
	ld [wMultiCellBlockParam], a
	jp Func_19246
.asm_1918d
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_19246

; unreferenced
Func_19195:
	ld b, $79
	jr Func_191b3

CellFunc_19199:
	ld b, $7a
	jr Func_191b3

CellFunc_1919d:
	ld b, $7b
	jr Func_191b3

; unreferenced
Func_191a1:
	ld b, $7c
	jr Func_191b3

; unreferenced
Func_191a5:
	ld b, $7d
	jr Func_191b3

; unreferenced
Func_191a9:
	ld b, $7e
	jr Func_191b3

; unreferenced
Func_191ad:
	ld b, $7f
	jr Func_191b3

CellFunc_191b1:
	ld b, $78
;	fallthrough

Func_191b3:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Solid
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_1923a
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_19241
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_191fa
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_19204
	bit COLLISION_UNK5_F, a
	jr nz, .asm_19213
	bit COLLISION_UNK3_F, a
	jr nz, .asm_19213
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_1922a
	jp CellFunc_Solid
.asm_191fa
	ld a, [wc0d6]
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_19232
	jp CellFunc_Solid
.asm_19204
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_19232
	ld a, [wIsRolling]
	and a
	jr nz, .asm_19232
	jp CellFunc_Solid
.asm_19213
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_19232
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_19232
	jp CellFunc_Solid
.asm_1922a
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
.asm_19232
	ld a, $03
	ld [wMultiCellBlockParam], a
	jp Func_193dc
.asm_1923a
	or $03
	ld [wMultiCellBlockParam], a
	jr Func_19246
.asm_19241
	ld a, $03
	ld [wMultiCellBlockParam], a
;	fallthrough

Func_19246:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wCellPtr
	ld a, [hli]
	ld [wcedc + 0], a
	ld d, a
	ld a, [hl]
	ld [wcedc + 1], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	jp CellFunc_Free

; unreferenced
Func_19273:
	ld b, $79
	jr Func_19291

CellFunc_19277:
	ld b, $7a
	jr Func_19291

CellFunc_1927b:
	ld b, $7b
	jr Func_19291

; unreferenced
Func_1927f:
	ld b, $7c
	jr Func_19291

; unreferenced
Func_19283:
	ld b, $7d
	jr Func_19291

; unreferenced
Func_19287:
	ld b, $7e
	jr Func_19291

; unreferenced
Func_1928b:
	ld b, $7f
	jr Func_19291

CellFunc_1928f:
	ld b, $78
;	fallthrough

Func_19291:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Solid
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_19318
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_19320
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_192d8
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_192e2
	bit COLLISION_UNK5_F, a
	jr nz, .asm_192f1
	bit COLLISION_UNK3_F, a
	jr nz, .asm_192f1
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_19308
	jp CellFunc_Solid
.asm_192d8
	ld a, [wc0d6]
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_19310
	jp CellFunc_Solid
.asm_192e2
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_19310
	ld a, [wIsRolling]
	and a
	jr nz, .asm_19310
	jp CellFunc_Solid
.asm_192f1
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_19310
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_19310
	jp CellFunc_Solid
.asm_19308
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
.asm_19310
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_193dc
.asm_19318
	or $02
	ld [wMultiCellBlockParam], a
	jp Func_19246
.asm_19320
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_19246

; unreferenced
Func_19328:
	ld b, $79
	jr Func_19346

CellFunc_1932c:
	ld b, $7a
	jr Func_19346

CellFunc_19330:
	ld b, $7b
	jr Func_19346

; unreferenced
Func_19334:
	ld b, $7c
	jr Func_19346

; unreferenced
Func_19338:
	ld b, $7d
	jr Func_19346

; unreferenced
Func_1933c:
	ld b, $7e
	jr Func_19346

; unreferenced
Func_19340:
	ld b, $7f
	jr Func_19346

CellFunc_19344:
	ld b, $78
;	fallthrough

Func_19346:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Solid
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_193cc
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_ROBO_MOUSE_FREE
	jp z, CellFunc_Free
	cp COLLISION_ROBO_MOUSE_BREAK
	jr z, .asm_193d4
	ld a, [wCellFuncBreakFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_1938d
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, CellFunc_Solid
	ld a, [wc0d6]
	bit COLLISION_UNK4_F, a
	jr nz, .asm_19397
	bit COLLISION_UNK5_F, a
	jr nz, .asm_193a6
	bit COLLISION_UNK3_F, a
	jr nz, .asm_193a6
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_193bd
	jp CellFunc_Solid
.asm_1938d
	ld a, [wc0d6]
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .asm_193c5
	jp CellFunc_Solid
.asm_19397
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_193c5
	ld a, [wIsRolling]
	and a
	jr nz, .asm_193c5
	jp CellFunc_Solid
.asm_193a6
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, CellFunc_Solid
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_193c5
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_193c5
	jp CellFunc_Solid
.asm_193bd
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, CellFunc_Solid
.asm_193c5
	ld a, $04
	ld [wMultiCellBlockParam], a
	jr Func_193dc
.asm_193cc
	or $04
	ld [wMultiCellBlockParam], a
	jp Func_19246
.asm_193d4
	ld a, $04
	ld [wMultiCellBlockParam], a
	jp Func_19246

Func_193dc:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wCellPtr
	ld a, [hli]
	ld [wcedc + 0], a
	ld d, a
	ld a, [hl]
	ld [wcedc + 1], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	jp Func_18df1

CellFunc_EnemyBlock_78:
	ld b, $78
	jr EnemyBlockCollision

CellFunc_EnemyBlock_79:
	ld b, $79
	jr EnemyBlockCollision

CellFunc_EnemyBlock_7a:
	ld b, $7a
	jr EnemyBlockCollision

CellFunc_EnemyBlock_7b:
	ld b, $7b
	jr EnemyBlockCollision

CellFunc_EnemyBlock_7c:
	ld b, $7c
	jr EnemyBlockCollision

CellFunc_EnemyBlock_7d:
	ld b, $7d
	jr EnemyBlockCollision

CellFunc_EnemyBlock_7e:
	ld b, $7e
	jr EnemyBlockCollision

CellFunc_EnemyBlock_7f:
	ld b, $7f
;	fallthrough

EnemyBlockCollision:
	ld a, [wCellFuncSpecialCollision]
	cp COLLISION_THROWN_OBJ
	jr z, Func_19423
	jp CellFunc_Solid

Func_19423:
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e2b
	pop hl
	ld a, [wCurObjFlags]
	bit OBJFLAG_ON_SCREEN_F, a
	jr z, .not_on_screen
	call BreakBlock
	jp CellFunc_Free
.not_on_screen
	play_sfx SFX_BLOCK_BREAK
	jp CellFunc_Free

CellFunc_BonfireBlock_78:
	ld b, $78
	jr BonfireBlockCollision

CellFunc_BonfireBlock_79:
	ld b, $79
	jr BonfireBlockCollision

CellFunc_BonfireBlock_7a:
	ld b, $7a
	jr BonfireBlockCollision

CellFunc_BonfireBlock_7b:
	ld b, $7b
	jr BonfireBlockCollision

CellFunc_BonfireBlock_7c:
	ld b, $7c
	jr BonfireBlockCollision

CellFunc_BonfireBlock_7d:
	ld b, $7d
	jr BonfireBlockCollision

CellFunc_BonfireBlock_7e:
	ld b, $7e
	jr BonfireBlockCollision

; unreferenced
Func_19467:
	ld b, $7f
;	fallthrough

BonfireBlockCollision:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	jr nz, .dont_break
	ld a, [wca8f]
	cp $02
	jr nc, Func_19481
.dont_break
	jp CellFunc_Solid

Func_19481:
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	jp CellFunc_Free

CellFunc_DoughnutBlock_78:
	ld b, $78
	jr DoughnutBlockCollision

CellFunc_DoughnutBlock_79:
	ld b, $79
	jr DoughnutBlockCollision

CellFunc_DoughnutBlock_7a:
	ld b, $7a
	jr DoughnutBlockCollision

CellFunc_DoughnutBlock_7b:
	ld b, $7b
	jr DoughnutBlockCollision

; unreferenced
Func_194a7:
	ld b, $7c
	jr DoughnutBlockCollision

; unreferenced
Func_194ab:
	ld b, $7d
	jr DoughnutBlockCollision

; unreferenced
Func_194af:
	ld b, $7e
	jr DoughnutBlockCollision

; unreferenced
Func_194b3:
	ld b, $7f
;	fallthrough

DoughnutBlockCollision:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp nz, CellFunc_Solid
	ld a, [wc0d6]
	and COLLISION_UNK1 | COLLISION_UNK6
	jr nz, .break
	jp CellFunc_Solid
.break
	ld hl, wCellPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	and $80
	or b
	ld [hl], a
	push hl
	call Func_e31
	pop hl
	call BreakBlock
	jp CellFunc_Solid

; unreferenced
Func_194e4:
	ld b, $78
	jr Func_19502

; unreferenced
Func_194e8:
	ld b, $79
	jr Func_19502

; unreferenced
Func_194ec:
	ld b, $7a
	jr Func_19502

; unreferenced
Func_194f0:
	ld b, $7b
	jr Func_19502

; unreferenced
Func_194f4:
	ld b, $7c
	jr Func_19502

; unreferenced
Func_194f8:
	ld b, $7d
	jr Func_19502

; unreferenced
Func_194fc:
	ld b, $7e
	jr Func_19502

; unreferenced
Func_19500:
	ld b, $7f
;	fallthrough

Func_19502:
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jp z, Func_19481
	jp CellFunc_Solid

; unreferenced
Func_19514:
	ld b, $79
	jr Func_19522

CellFunc_19518:
	ld b, $7a
	jr Func_19522

; unreferenced
Func_1951c:
	ld b, $7b
	jr Func_19522

CellFunc_19520:
	ld b, $78
;	fallthrough

Func_19522:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_1954a
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_19542
	jp CellFunc_Solid
.asm_19542
	ld a, $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_1954a
	or $01
	ld [wMultiCellBlockParam], a
	jp Func_18f32

CellFunc_19552:
	ld b, $79
	jr Func_19560

CellFunc_19556:
	ld b, $7a
	jr Func_19560

; unreferenced
Func_1955a:
	ld b, $7b
	jr Func_19560

CellFunc_1955e:
	ld b, $78
;	fallthrough

Func_19560:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_19585
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_19580
	jp CellFunc_Solid
.asm_19580
	ld a, $03
	ld [wMultiCellBlockParam], a
.asm_19585
	or $03
	ld [wMultiCellBlockParam], a
	jp Func_18f32

CellFunc_1958d:
	ld b, $79
	jr Func_1959b

; unreferenced
Func_19591:
	ld b, $7a
	jr Func_1959b

; unreferenced
Func_19595:
	ld b, $7b
	jr Func_1959b

CellFunc_19599:
	ld b, $78
;	fallthrough

Func_1959b:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_195c3
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_195bb
	jp CellFunc_Solid
.asm_195bb
	ld a, $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_195c3
	or $02
	ld [wMultiCellBlockParam], a
	jp Func_18f32

CellFunc_YarnBlock_79:
	ld b, $79
	jr YarnBlockCollision

; unreferenced
Func_195cf:
	ld b, $7a
	jr YarnBlockCollision

; unreferenced
Func_195d3:
	ld b, $7b
	jr YarnBlockCollision

CellFunc_YarnBlock_78:
	ld b, $78
;	fallthrough

YarnBlockCollision:
	ld a, [wMultiCellBlockParam]
	and $07
	jp nz, CellFunc_Free
	ld a, [wMultiCellBlockParam]
	and $f8
	jr nz, .asm_19601
	ld a, [wCellFuncWarioFlag]
	and a
	jp z, CellFunc_Solid
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_195f9
	jp CellFunc_Solid
.asm_195f9
	ld a, $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32
.asm_19601
	or $04
	ld [wMultiCellBlockParam], a
	jp Func_18f32

BreakBlock:
	; temporarily store hPos
	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a

	ld b, PARTICLE_DEBRIS
	farcall CreateParticleInCell
	ldh a, [rDIV]
	and %11
	jr nz, .done
	ld a, [wCoinCooldown]
	and a
	jr nz, .done
	; everything okay, spawn coin
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld a, COIN_COOLDOWN
	ld [wCoinCooldown], a

	; backup CurObj
	ld hl, wCurObjUnk01
	ld de, hffa0
	ld b, OBJ_UNK_07 - OBJ_UNK_01
	call CopyHLToDE

	ld hl, wCurObjUnk01
	xor a
	ld [hli], a ; flags
	ld [hli], a ; unk01
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ldh a, [hXPosLo]
	ld [hli], a
	ldh a, [hXPosHi]
	ld [hli], a
	ld bc, ObjParams_Coin
	farcall _CreateObjectFromCurObjPos

	; restore CurObj
	ld hl, hffa0
	ld de, wCurObjUnk01
	ld b, OBJ_UNK_07 - OBJ_UNK_01
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

.done
	; restore hPos
	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a
	ret

BreakBlockWithColourCoin:
	; temporarily store hPos
	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a

	ld b, PARTICLE_DEBRIS
	farcall CreateParticleInCell
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a

	; backup CurObj
	ld hl, wCurObjUnk01
	ld de, hffa0
	ld b, OBJ_UNK_07 - OBJ_UNK_01
	call CopyHLToDE

	ld hl, wCurObjUnk01
	xor a
	ld [hli], a
	ld [hli], a
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hli], a
	ldh a, [hXPosLo]
	ld [hli], a
	ldh a, [hXPosHi]
	ld [hli], a
	ld bc, ObjParams_ColourCoin
	farcall _CreateObjectFromCurObjPos

	; restore CurObj
	ld hl, hffa0
	ld de, wCurObjUnk01
	ld b, OBJ_UNK_07 - OBJ_UNK_01
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	; restore hPos
	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a
	ret
