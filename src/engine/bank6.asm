Func_18000:
	xor a ; FALSE
	ld [wc0dd], a
	ld a, [wFloorSRAMBank]
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

Func_18020:
	xor a ; SRAM0
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld [wc18d], a
	ret

Func_18032:
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, [wc0da]
	and a
	jr z, .asm_18058
	ld a, [wIsStandingOnSlope]
	and a
	jr z, .asm_18058
	ld a, [wc0d6]
	bit 4, a
	jr z, .asm_18058
	xor a
	ld [wc18d], a
	ret
.asm_18058
	ldh a, [hYPosLo]
	and $f0
	ldh [hYPosLo], a
	ld a, $01
	ld [wc18d], a
	ret

Func_18064:
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, $10
	ld [wc18d], a
	ret

Func_18078:
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, $01
	ld [wc18d], a
	ret

Func_1808c:
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	xor a
	ld [wc18d], a
	ret

Func_1809f:
	ld a, [wc0d6]
	bit 0, a
	jp z, Func_18020
	ldh a, [hYPosLo]
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	jr .asm_180f7
	ld a, [wc0da]
	and a
	jr z, .asm_180c3
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	jp z, Func_18032
.asm_180c3
	ld a, [wc0d6]
	and $03
	jp z, Func_18020
	ldh a, [hYPosLo]
	sub $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	sbc $00
	ldh [hYPosHi], a
	jr .asm_180f7
	ld a, [wc0d6]
	and $03
	jp z, Func_18020
	ld a, [wc0d6]
	bit 1, a
	jr z, .asm_180f7
	ldh a, [hYPosLo]
	and $0f
	ld b, a
	ldh a, [hXPosLo]
	and $0f
	add b
	cp $10
	jp c, Func_18020
.asm_180f7
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
	adc $00
	ldh [hYPosHi], a
	ld a, [wc0d6]
	and $03
	jr z, .asm_18126
	ld a, [wc0da]
	and a
	jr nz, .asm_18121
	ld a, $11
	ld [wc18c], a
	jr .asm_18126
.asm_18121
	ld a, $11
	ld [wIsStandingOnSlope], a
.asm_18126
	jp Func_18064

Func_18129:
	ld a, [wc0d6]
	bit 0, a
	jp z, Func_18020
	ldh a, [hYPosLo]
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	jr .asm_1817c
	ld a, [wc0da]
	and a
	jr z, .asm_1814d
	ld a, [wWarioState]
	cp WST_ATTACKING_AIRBORNE
	jp z, Func_18032
.asm_1814d
	ld a, [wc0d6]
	and $03
	jp z, Func_18020
	ldh a, [hYPosLo]
	sub $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	sbc $00
	ldh [hYPosHi], a
	jr .asm_1817c
	ld a, [wc0d6]
	and $03
	jp z, Func_18020
	bit 1, a
	jr z, .asm_1817c
	ldh a, [hYPosLo]
	and $0f
	ld b, a
	ldh a, [hXPosLo]
	and $0f
	cp b
	jp nc, Func_18020
.asm_1817c
	ld a, [wc0d6]
	and $03
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
	adc $00
	ldh [hYPosHi], a
	ld a, [wc0da]
	and a
	jr nz, .asm_181a4
	ld a, $12
	ld [wc18c], a
	jr .asm_181a9
.asm_181a4
	ld a, $12
	ld [wIsStandingOnSlope], a
.asm_181a9
	jp Func_18064

Func_181ac:
	ld a, TRUE
	ld [wc0dd], a
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, $01
	ld [wWaterInteraction], a
	jp Func_18020

Func_181c8:
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_RIGHT
	ld [wWaterCurrent], a
	jp Func_181ac

Func_181d8:
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_UP
	ld [wWaterCurrent], a
	jp Func_181ac

Func_181e8:
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_LEFT
	ld [wWaterCurrent], a
	jp Func_181ac

Func_181f8:
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_DOWN
	ld [wWaterCurrent], a
	jp Func_181ac

Func_18208:
	ld a, TRUE
	ld [wc1ca], a
	ld a, [wc0d6]
	bit 0, a
	jr nz, .asm_18228
	bit 2, a
	jr nz, .asm_18228
	and $b8
	jp nz, Func_18020
	ldh a, [hYPosLo]
	and $0f
	cp $05
	jr c, .asm_18228
	jp Func_18020
.asm_18228
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wWarioState]
	cp WST_ZOMBIE_LANDING
	jp z, Func_18020
	cp WST_ZOMBIE_SLIPPING_THROUGH_FLOOR
	jp z, Func_18020
	jp Func_18032

Func_1823f:
	ld a, [wc0d6]
	bit 1, a
	jr nz, .asm_18257
	ldh a, [hYPosLo]
	and $0e
	jp nz, Func_181ac
	ld a, [wc0d6]
	and $05
	jr nz, .asm_1825a
	jp Func_181ac
.asm_18257
	jp Func_18208
.asm_1825a
	ld a, TRUE
	ld [wc0dd], a
	jp Func_18032

Func_18262:
	ld a, [wc0da]
	and a
	jp nz, Func_18020
	ld a, TRUE
	ld [wc1ca], a
	ld a, [wc0d6]
	bit 0, a
	jp nz, Func_18032
	bit 2, a
	jp nz, Func_18032
	and $b8
	jp nz, Func_18020
	ldh a, [hYPosLo]
	and $0f
	cp $05
	jp c, Func_18032
	jp Func_18020

Func_1828c:
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	and $28
	jp z, Func_18032
	ld hl, wYCell
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	ld [wca6b], a
	xor $08
	ld [hl], a
	call Func_e31
	ld a, [wca6a]
	xor $01
	ld [wca6a], a
	play_sfx SFX_02F
	ld b, $10
	call DoGroundShake
	jp Func_18032

Func_182c3:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jr nz, .asm_182d4
	jp Func_18020
.asm_182d4
	ld a, $01
	ld [wLadderInteraction], a
	jp Func_1808c

Func_182dc:
	ld a, [wc0da]
	and a
	jp z, Func_18032
	jr .asm_182ec
	ld a, [wc0da]
	and a
	jp z, Func_18208
.asm_182ec
	ld a, [wc0d6]
	bit 7, a
	jr nz, .asm_182f6
	jp Func_18208
.asm_182f6
	ld a, $02
	ld [wLadderInteraction], a
	jp Func_1808c

Func_182fe:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, $01
	ld [wLadderInteraction], a
	ld a, ROOMTRANSITION_5 | ROOMTRANSITIONFLAG_2
	ld [wRoomTransitionParam], a
	jp Func_18020

Func_1831a:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, $01
	ld [wLadderInteraction], a
	ld a, ROOMTRANSITION_5
	ld [wRoomTransitionParam], a
	jp Func_18020

Func_18336:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_18020
	ld a, [wca94]
	cp $02
	jp z, Func_18020
	ld a, [wWarioState]
	cp WST_STUNG
	jp z, Func_18020
	cp WST_STUNG_RECOVERY
	jp z, Func_18020
	ld a, [wDirection]
	and a
	jr nz, .asm_18366
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_1836b
.asm_18366
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.asm_1836b
	ld a, [wca94]
	and a
	jr nz, .asm_18383
	farcall SetState_Stung
	jp Func_18020
.asm_18383
	cp $01
	jr z, .asm_1838a
	jp Func_18020
.asm_1838a
	farcall Func_206eb
	jp Func_18020

Func_1839c:
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_18032
	ld a, [wca94]
	cp $02
	jp z, Func_18032
	ld a, [wWarioState]
	cp WST_STUNG
	jp z, Func_18032
	cp WST_STUNG_RECOVERY
	jp z, Func_18032
	ld a, [wDirection]
	and a
	jr nz, .asm_183cc
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_183d1
.asm_183cc
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.asm_183d1
	ld a, [wca94]
	and a
	jr nz, .asm_183e9
	farcall SetState_Stung
	jp Func_18032
.asm_183e9
	cp $01
	jr z, .asm_183f0
	jp Func_18032
.asm_183f0
	farcall Func_206eb
	jp Func_18032

Func_18402:
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_181ac
	ld a, [wWarioState]
	cp WST_WATER_STUNG
	jp z, Func_181ac
	farcall SetState_WaterStung
	jp Func_181ac

Func_1842a:
	ld a, [wc0da]
	and a
	jp z, Func_18032

	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_1843d
	cp WST_GRAB_IDLING
	jp nz, Func_18032
.asm_1843d
	ld a, [wc0d6]
	and $01
	jp z, Func_18032
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, Func_18032
	ld a, [wWarioXPos + 1]
	and $f0
	add $18
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc $00
	ld [wWarioXPos + 0], a
	jr .asm_1848e
	ld a, [wc0da]
	and a
	jp z, Func_18032

	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_18474
	cp WST_GRAB_IDLING
	jp nz, Func_18032
.asm_18474
	ld a, [wc0d6]
	and $01
	jp z, Func_18032
	ld a, [wJoypadDown]
	bit D_DOWN_F, a
	jp z, Func_18032
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
.asm_1848e
	ld a, ROOMTRANSITION_1 | ROOMTRANSITIONFLAG_2 | ROOMTRANSITIONFLAG_3
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
	jp Func_18032

Func_184fc:
	ld a, [wc0da]
	and a
	jp z, Func_18032

	ld a, [wWarioState]
	cp WST_AIRBORNE
	jr z, .asm_1850f
	cp WST_GRAB_AIRBORNE
	jp nz, Func_18032
.asm_1850f
	ld a, [wc0d6]
	and $20
	jp z, Func_18032
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp z, Func_18032
	ld a, [wWarioXPos + 1]
	and $f0
	add $18
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc $00
	ld [wWarioXPos + 0], a
	jr .asm_18560
	ld a, [wc0da]
	and a
	jp z, Func_18032

	ld a, [wWarioState]
	cp WST_AIRBORNE
	jr z, .asm_18546
	cp WST_GRAB_AIRBORNE
	jp nz, Func_18032
.asm_18546
	ld a, [wc0d6]
	and $20
	jp z, Func_18032
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp z, Func_18032
	ld a, [wWarioXPos + 1]
	and $f0
	add $08
	ld [wWarioXPos + 1], a
.asm_18560
	ld a, ROOMTRANSITION_1 | ROOMTRANSITIONFLAG_2 | ROOMTRANSITIONFLAG_3
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
	jp Func_18032

Func_185cb:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, Func_18020
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_185f2
	cp WST_SLIPPING
	jr z, .asm_185f2
	cp WST_GRAB_IDLING
	jp nz, Func_18020
.asm_185f2
	ld a, ROOMTRANSITION_2 | ROOMTRANSITIONFLAG_1 | ROOMTRANSITIONFLAG_2 | ROOMTRANSITIONFLAG_3
	ld [wRoomTransitionParam], a
	jp Func_18676

Func_185fa:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, Func_18020
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_1861d
	cp WST_GRAB_IDLING
	jp nz, Func_18020
.asm_1861d
	ld a, ROOMTRANSITION_3 | ROOMTRANSITIONFLAG_1 | ROOMTRANSITIONFLAG_2 | ROOMTRANSITIONFLAG_3
	ld [wRoomTransitionParam], a
	jr Func_18676

Func_18624:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, Func_18020
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_18647
	cp WST_GRAB_IDLING
	jp nz, Func_18020
.asm_18647
	ld a, ROOMTRANSITION_2 | ROOMTRANSITIONFLAG_1 | ROOMTRANSITIONFLAG_3
	ld [wRoomTransitionParam], a
	jr Func_18676

Func_1864e:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, Func_18020
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_18671
	cp WST_GRAB_IDLING
	jp nz, Func_18020
.asm_18671
	ld a, ROOMTRANSITION_3 | ROOMTRANSITIONFLAG_1 | ROOMTRANSITIONFLAG_3
	ld [wRoomTransitionParam], a
;	fallthrough

Func_18676: 
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
	jp Func_18020

Func_186f9:
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_1870b
	and a
	jp nz, Func_181ac
.asm_1870b
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, $01
	ld [wWaterInteraction], a
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jr z, .asm_18724
	ld a, ROOMTRANSITION_6 | ROOMTRANSITIONFLAG_1 | ROOMTRANSITIONFLAG_2
	ld [wRoomTransitionParam], a
.asm_18724
	jp Func_18020

Func_18727:
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_18739
	and a
	jp nz, Func_181ac
.asm_18739
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, $01
	ld [wWaterInteraction], a
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jr z, .asm_18752
	ld a, ROOMTRANSITION_6 | ROOMTRANSITIONFLAG_1
	ld [wRoomTransitionParam], a
.asm_18752
	jp Func_18020

Func_18755:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_18767
	and a
	jp nz, Func_18020
.asm_18767
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jr z, .asm_1877b
	ld a, ROOMTRANSITION_8 | ROOMTRANSITIONFLAG_1 | ROOMTRANSITIONFLAG_2 | ROOMTRANSITIONFLAG_3
	ld [wRoomTransitionParam], a
.asm_1877b
	jp Func_18020

Func_1877e:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	jp z, Func_18020
	ld a, [wTransformation]
	and a
	jp nz, Func_18020
	ld a, [wWarioState]
	cp WST_IDLING
	jr z, .asm_187a4
	cp WST_SLIPPING
	jr z, .asm_187a4
	cp WST_GRAB_IDLING
	jp nz, Func_18020
.asm_187a4
	xor a
	ld [wGrabState], a
	ld a, LVLEND_NO_TREASURE
	ld [wLevelEndScreen], a
	jp Func_18020

Func_187b0:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, ROOMTRANSITION_4 | ROOMTRANSITIONFLAG_2
	ld [wRoomTransitionParam], a
	jp Func_18020

Func_187c7:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, ROOMTRANSITION_4
	ld [wRoomTransitionParam], a
	jp Func_18020

Func_187de:
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, ROOMTRANSITION_4 | ROOMTRANSITIONFLAG_2
	ld [wRoomTransitionParam], a
	jp Func_181ac

Func_187f5:
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, ROOMTRANSITION_4
	ld [wRoomTransitionParam], a
	jp Func_181ac

Func_1880c:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jp nz, Func_18020
	call RecoverFromTransformation_WithoutInvincibility
	jp Func_18020

Func_18821:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	jr z, .asm_1883a
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jp nz, Func_18020
	call RecoverFromTransformation_WithoutInvincibility
	jp Func_18020
.asm_1883a
	farcall SetState_ZombieRecovering
	jp Func_18020

Func_1884c:
	ld a, TRUE
	ld [wc0dd], a
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, TRUE
	ld [wIsInSand], a
	jp Func_18020

Func_18868:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jp nz, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18032
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
	jp Func_18032
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
	jp Func_18032

Func_188ba:
	ld a, [wc0da]
	and a
	jp z, Func_18032
	jp Func_18020

Func_188c4:
	ld a, TRUE
	ld [wc0dd], a
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, $02
	ld [wWaterInteraction], a
	jp Func_18020

Func_188e0:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	and $47
	jp nz, Func_18020
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_18020
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_18020
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

Func_18934:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jr nz, .asm_18945
	jp Func_18020
.asm_18945
	ld a, TRUE
	ld [wIsNearFence], a
	jp Func_1808c

Func_1894d:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jr nz, .asm_1895e
	jp Func_18020
.asm_1895e
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_18020
	ld a, TRUE
	ld [wIsInAirCurrent], a
	ld a, [wTransformation]
	and a
	jp nz, Func_18020
	ld a, TRANSFORMATION_FAN
	ld [wTransformation], a
	ld a, TOUCH_BUMP
	ld [wTouchState], a
	ld a, TOUCH_VULNERABLE
	ld [wStingTouchState], a
	ld a, $01
	ld [wca94], a
	farcall SetState_FanStart
	jp Func_18020

Func_18997:
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	and $01
	jp z, Func_18032
	ld a, TRUE
	ld [wIsOnSlipperyGround], a
	jp Func_18032

Func_189ae:
	ld a, [wc0da]
	and a
	jp z, Func_18208
	ld a, [wc0d6]
	and $01
	jp z, Func_18208
	ld a, TRUE
	ld [wIsOnSlipperyGround], a
	jp Func_18208

Func_189c5:
	ld a, [wRoomPalCycleIndex]
	cp $07
	jr z, .asm_189d1
	cp $04
	jp nc, Func_18020
.asm_189d1
	jp Func_18208

Func_189d4:
	ld a, [wRoomPalCycleIndex]
	cp $03
	jp c, Func_18020
	jp Func_18208

Func_189df:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, Func_18020
	jp Func_18032

Func_189f1:
	ld a, [wc0da]
	and a
	jp z, Func_18020
	jp Func_18208

Func_189fb:
	ld b, $78
	jr Func_18a19
Func_189ff:
	ld b, $79
	jr Func_18a19
Func_18a03:
	ld b, $7a
	jr Func_18a19
Func_18a07:
	ld b, $7b
	jr Func_18a19
Func_18a0b:
	ld b, $7c
	jr Func_18a19
Func_18a0f:
	ld b, $7d
	jr Func_18a19
Func_18a13:
	ld b, $7e
	jr Func_18a19
Func_18a17:
	ld b, $7f
;	fallthrough
Func_18a19:
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_18a36
	bit 5, a
	jr nz, .asm_18a45
	bit 3, a
	jr nz, .asm_18a45
	and $42
	jr nz, .asm_18a5c
	jp Func_18032

.asm_18a36
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18a5c
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18a5c
	jp Func_18032

.asm_18a45
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18a5c
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18a5c
	jp Func_18032
.asm_18a5c
	ld hl, wYCell
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
	call Func_19690
	ld a, [wIsRolling]
	and a
	jp nz, Func_18020
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, Func_18020
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_18a8f
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	jp Func_18020
.asm_18a8f
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
	jp Func_18020

Func_18a9a:
	ld b, $79
	jr Func_18aa8
Func_18a9e:
	ld b, $7a
	jr Func_18aa8
Func_18aa2:
	ld b, $7b
	jr Func_18aa8
Func_18aa6:
	ld b, $78
;	fallthrough

Func_18aa8:
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18ad6
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $01
	jp c, Func_18032
	ld a, $01
	ld [wceda], a
	jp Func_18f32
.asm_18ad6
	or $01
	ld [wceda], a
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
Func_18aea:
	ld b, $78
;	fallthrough
Func_18aec:
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18b17
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $01
	jp c, Func_18032
	ld a, $03
	ld [wceda], a
.asm_18b17
	or $03
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18b1f:
	ld b, $79
	jr .asm_18b2d
	ld b, $7a
	jr .asm_18b2d
	ld b, $7b
	jr .asm_18b2d
	ld b, $78
.asm_18b2d
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18b5b
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $01
	jp c, Func_18032
	ld a, $02
	ld [wceda], a
	jp Func_18f32
.asm_18b5b
	or $02
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18b63:
	ld b, $79
	jr .asm_18b71
	ld b, $7a
	jr .asm_18b71
	ld b, $7b
	jr .asm_18b71
	ld b, $78
.asm_18b71
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18b9f
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $01
	jp c, Func_18032
	ld a, $04
	ld [wceda], a
	jp Func_18f32
.asm_18b9f
	or $04
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18ba7:
	ld b, $79
	jr .asm_18bb5
	ld b, $7a
	jr .asm_18bb5
	ld b, $7b
	jr .asm_18bb5
	ld b, $78
.asm_18bb5
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18be3
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $03
	jp nz, Func_18032
	ld a, $01
	ld [wceda], a
	jp Func_18f32
.asm_18be3
	or $01
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18beb:
	ld b, $79
	jr .asm_18bf9
	ld b, $7a
	jr .asm_18bf9
	ld b, $7b
	jr .asm_18bf9
	ld b, $78
.asm_18bf9
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18c24
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $03
	jp nz, Func_18032
	ld a, $03
	ld [wceda], a
.asm_18c24
	or $03
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18c2c:
	ld b, $79
	jr .asm_18c3a
	ld b, $7a
	jr .asm_18c3a
	ld b, $7b
	jr .asm_18c3a
	ld b, $78
.asm_18c3a
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18c68
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $03
	jp nz, Func_18032
	ld a, $02
	ld [wceda], a
	jp Func_18f32
.asm_18c68
	or $02
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18c70:
	ld b, $79
	jr .asm_18c7e
	ld b, $7a
	jr .asm_18c7e
	ld b, $7b
	jr .asm_18c7e
	ld b, $78
.asm_18c7e
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18cac
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 4) | (1 << 6)
	jp nz, Func_18032
	ld a, [wca8f]
	cp $03
	jp nz, Func_18032
	ld a, $04
	ld [wceda], a
	jp Func_18f32
.asm_18cac
	or $04
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18cb4:
	ld b, $78
	jr .asm_18cd2
	ld b, $79
	jr .asm_18cd2
	ld b, $7a
	jr .asm_18cd2
	ld b, $7b
	jr .asm_18cd2
	ld b, $7c
	jr .asm_18cd2
	ld b, $7d
	jr .asm_18cd2
	ld b, $7e
	jr .asm_18cd2
	ld b, $7f
.asm_18cd2
	ld a, [wc0d9]
	cp $02
	jp z, Func_19423
	cp $03
	jp z, Func_18020
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_18cfc
	bit 5, a
	jr nz, .asm_18d0b
	bit 3, a
	jr nz, .asm_18d0b
	and $42
	jr nz, .asm_18d22
	jp Func_18032
.asm_18cfc
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18d22
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18d22
	jp Func_18032
.asm_18d0b
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18d22
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18d22
	jp Func_18032
.asm_18d22
	ld hl, wYCell
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
	call Func_19609
	ld a, [wIsRolling]
	and a
	jp nz, Func_18020
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, Func_18020
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_18d55
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	jp Func_18020
.asm_18d55
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
	jp Func_18020

; unreferenced
Func_18d60:
	ld b, $78
	jr .asm_18d7e
	ld b, $79
	jr .asm_18d7e
	ld b, $7a
	jr .asm_18d7e
	ld b, $7b
	jr .asm_18d7e
	ld b, $7c
	jr .asm_18d7e
	ld b, $7d
	jr .asm_18d7e
	ld b, $7e
	jr .asm_18d7e
	ld b, $7f
.asm_18d7e
	ld a, [wc0d9]
	cp $02
	jp z, Func_19423
	cp $03
	jp z, Func_18020
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_18db7
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_18dcb
	bit 5, a
	jr nz, .asm_18dda
	bit 3, a
	jr nz, .asm_18dda
	and $42
	jr nz, .asm_18dc1
	jp Func_18032
.asm_18db7
	ld a, [wc0d6]
	and $42
	jr nz, Func_18df1
	jp Func_18032
.asm_18dc1
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jr nc, Func_18df1
	jp Func_18032
.asm_18dcb
	ld a, [wAttackCounter]
	and a
	jr nz, Func_18df1
	ld a, [wIsRolling]
	and a
	jr nz, Func_18df1
	jp Func_18032
.asm_18dda
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, Func_18df1
	ld a, [wSwimVelIndex]
	and a
	jr nz, Func_18df1
	jp Func_18032

Func_18df1:
	ld hl, wYCell
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
	call Func_19609
	ld a, [wIsRolling]
	and a
	jp nz, Func_18020
	jp Func_18032

; unreferenced
Func_18e0e:
	ld b, $79
	jr .asm_18e2c
	ld b, $7a
	jr .asm_18e2c
	ld b, $7b
	jr .asm_18e2c
	ld b, $7c
	jr .asm_18e2c
	ld b, $7d
	jr .asm_18e2c
	ld b, $7e
	jr .asm_18e2c
	ld b, $7f
	jr .asm_18e2c
	ld b, $78
.asm_18e2c
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18e92
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_18e9a
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_18e64
	bit 5, a
	jr nz, .asm_18e73
	bit 3, a
	jr nz, .asm_18e73
	and $42
	jr nz, .asm_18e8a
	jp Func_18032
.asm_18e64
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18e8a
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18e8a
	jp Func_18032
.asm_18e73
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18e8a
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18e8a
	jp Func_18032
.asm_18e8a
	ld a, $01
	ld [wceda], a
	jp Func_19086
.asm_18e92
	or $01
	ld [wceda], a
	jp Func_18f32
.asm_18e9a
	ld a, $01
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18ea2:
	ld b, $79
	jr .asm_18ec0
	ld b, $7a
	jr .asm_18ec0
	ld b, $7b
	jr .asm_18ec0
	ld b, $7c
	jr .asm_18ec0
	ld b, $7d
	jr .asm_18ec0
	ld b, $7e
	jr .asm_18ec0
	ld b, $7f
	jr .asm_18ec0
	ld b, $78
.asm_18ec0
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18f26
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_18f2d
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_18ef8
	bit 5, a
	jr nz, .asm_18f07
	bit 3, a
	jr nz, .asm_18f07
	and $42
	jr nz, .asm_18f1e
	jp Func_18032
.asm_18ef8
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18f1e
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18f1e
	jp Func_18032
.asm_18f07
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18f1e
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18f1e
	jp Func_18032
.asm_18f1e
	ld a, $03
	ld [wceda], a
	jp Func_19086
.asm_18f26
	or $03
	ld [wceda], a
	jr Func_18f32
.asm_18f2d
	ld a, $03
	ld [wceda], a
;	fallthrough

Func_18f32:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wYCell
	ld a, [hli]
	ld [wcedc], a
	ld d, a
	ld a, [hl]
	ld [wcedd], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld hl, wYCell
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
	call Func_19609
	jp Func_18020

; unreferenced
Func_18f5f:
	ld b, $79
	jr .asm_18f7d
	ld b, $7a
	jr .asm_18f7d
	ld b, $7b
	jr .asm_18f7d
	ld b, $7c
	jr .asm_18f7d
	ld b, $7d
	jr .asm_18f7d
	ld b, $7e
	jr .asm_18f7d
	ld b, $7f
	jr .asm_18f7d
	ld b, $78
.asm_18f7d
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_18fe3
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_18feb
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_18fb5
	bit 5, a
	jr nz, .asm_18fc4
	bit 3, a
	jr nz, .asm_18fc4
	and $42
	jr nz, .asm_18fdb
	jp Func_18032
.asm_18fb5
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_18fdb
	ld a, [wIsRolling]
	and a
	jr nz, .asm_18fdb
	jp Func_18032
.asm_18fc4
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_18fdb
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_18fdb
	jp Func_18032
.asm_18fdb
	ld a, $02
	ld [wceda], a
	jp Func_19086
.asm_18fe3
	or $02
	ld [wceda], a
	jp Func_18f32
.asm_18feb
	ld a, $02
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_18ff3:
	ld b, $79
	jr .asm_19011
	ld b, $7a
	jr .asm_19011
	ld b, $7b
	jr .asm_19011
	ld b, $7c
	jr .asm_19011
	ld b, $7d
	jr .asm_19011
	ld b, $7e
	jr .asm_19011
	ld b, $7f
	jr .asm_19011
	ld b, $78
.asm_19011
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_19076
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_1907e
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_19049
	bit 5, a
	jr nz, .asm_19058
	bit 3, a
	jr nz, .asm_19058
	and $42
	jr nz, .asm_1906f
	jp Func_18032
.asm_19049
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_1906f
	ld a, [wIsRolling]
	and a
	jr nz, .asm_1906f
	jp Func_18032
.asm_19058
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1906f
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_1906f
	jp Func_18032
.asm_1906f
	ld a, $04
	ld [wceda], a
	jr Func_19086
.asm_19076
	or $04
	ld [wceda], a
	jp Func_18f32
.asm_1907e
	ld a, $04
	ld [wceda], a
	jp Func_18f32

Func_19086:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wYCell
	ld a, [hli]
	ld [wcedc], a
	ld d, a
	ld a, [hl]
	ld [wcedd], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	ld hl, wYCell
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
	call Func_19609
	ld a, [wIsRolling]
	and a
	jp nz, Func_18020
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, Func_18020
	ld a, [wIsSmashAttacking]
	and a
	jr nz, .asm_190d5
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	jp Func_18020
.asm_190d5
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
	jp Func_18020

; unreferenced
Func_190e0:
	ld b, $79
	jr .asm_190fe
	ld b, $7a
	jr .asm_190fe
	ld b, $7b
	jr .asm_190fe
	ld b, $7c
	jr .asm_190fe
	ld b, $7d
	jr .asm_190fe
	ld b, $7e
	jr .asm_190fe
	ld b, $7f
	jr .asm_190fe
	ld b, $78
.asm_190fe
	ld a, [wceda]
	and $07
	jp nz, Func_18032
	ld a, [wceda]
	and $f8
	jr nz, .asm_19185
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_1918d
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_19145
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_1914f
	bit 5, a
	jr nz, .asm_1915e
	bit 3, a
	jr nz, .asm_1915e
	and $42
	jr nz, .asm_19175
	jp Func_18032
.asm_19145
	ld a, [wc0d6]
	and $42
	jr nz, .asm_1917d
	jp Func_18032
.asm_1914f
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_1917d
	ld a, [wIsRolling]
	and a
	jr nz, .asm_19175
	jp Func_18032
.asm_1915e
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_1917d
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_1917d
	jp Func_18032
.asm_19175
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
.asm_1917d
	ld a, $01
	ld [wceda], a
	jp Func_193dc
.asm_19185
	or $01
	ld [wceda], a
	jp Func_19246
.asm_1918d
	ld a, $01
	ld [wceda], a
	jp Func_19246

; unreferenced
Func_19195:
	ld b, $79
	jr .asm_191b3
	ld b, $7a
	jr .asm_191b3
	ld b, $7b
	jr .asm_191b3
	ld b, $7c
	jr .asm_191b3
	ld b, $7d
	jr .asm_191b3
	ld b, $7e
	jr .asm_191b3
	ld b, $7f
	jr .asm_191b3
	ld b, $78
.asm_191b3
	ld a, [wceda]
	and $07
	jp nz, Func_18032
	ld a, [wceda]
	and $f8
	jr nz, .asm_1923a
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_19241
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_191fa
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_19204
	bit 5, a
	jr nz, .asm_19213
	bit 3, a
	jr nz, .asm_19213
	and $42
	jr nz, .asm_1922a
	jp Func_18032
.asm_191fa
	ld a, [wc0d6]
	and $42
	jr nz, .asm_19232
	jp Func_18032
.asm_19204
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_19232
	ld a, [wIsRolling]
	and a
	jr nz, .asm_19232
	jp Func_18032
.asm_19213
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_19232
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_19232
	jp Func_18032
.asm_1922a
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
.asm_19232
	ld a, $03
	ld [wceda], a
	jp Func_193dc
.asm_1923a
	or $03
	ld [wceda], a
	jr Func_19246
.asm_19241
	ld a, $03
	ld [wceda], a
;	fallthrough

Func_19246:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wYCell
	ld a, [hli]
	ld [wcedc], a
	ld d, a
	ld a, [hl]
	ld [wcedd], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld hl, wYCell
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
	call Func_19609
	jp Func_18020

; unreferenced
Func_19273:
	ld b, $79
	jr .asm_19291
	ld b, $7a
	jr .asm_19291
	ld b, $7b
	jr .asm_19291
	ld b, $7c
	jr .asm_19291
	ld b, $7d
	jr .asm_19291
	ld b, $7e
	jr .asm_19291
	ld b, $7f
	jr .asm_19291
	ld b, $78
.asm_19291
	ld a, [wceda]
	and $07
	jp nz, Func_18032
	ld a, [wceda]
	and $f8
	jr nz, .asm_19318
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_19320
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_192d8
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_192e2
	bit 5, a
	jr nz, .asm_192f1
	bit 3, a
	jr nz, .asm_192f1
	and $42
	jr nz, .asm_19308
	jp Func_18032
.asm_192d8
	ld a, [wc0d6]
	and $42
	jr nz, .asm_19310
	jp Func_18032
.asm_192e2
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_19310
	ld a, [wIsRolling]
	and a
	jr nz, .asm_19310
	jp Func_18032
.asm_192f1
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_19310
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_19310
	jp Func_18032
.asm_19308
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
.asm_19310
	ld a, $02
	ld [wceda], a
	jp Func_193dc
.asm_19318
	or $02
	ld [wceda], a
	jp Func_19246
.asm_19320
	ld a, $02
	ld [wceda], a
	jp Func_19246

; unreferenced
Func_19328:
	ld b, $79
	jr .asm_19346
	ld b, $7a
	jr .asm_19346
	ld b, $7b
	jr .asm_19346
	ld b, $7c
	jr .asm_19346
	ld b, $7d
	jr .asm_19346
	ld b, $7e
	jr .asm_19346
	ld b, $7f
	jr .asm_19346
	ld b, $78
.asm_19346
	ld a, [wceda]
	and $07
	jp nz, Func_18032
	ld a, [wceda]
	and $f8
	jr nz, .asm_193cc
	ld a, [wc0d9]
	cp $03
	jp z, Func_18020
	cp $02
	jr z, .asm_193d4
	ld a, [wc0d8]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .asm_1938d
	ld a, [wPowerUpLevel]
	cp GARLIC
	jp c, Func_18032
	ld a, [wc0d6]
	bit 4, a
	jr nz, .asm_19397
	bit 5, a
	jr nz, .asm_193a6
	bit 3, a
	jr nz, .asm_193a6
	and $42
	jr nz, .asm_193bd
	jp Func_18032
.asm_1938d
	ld a, [wc0d6]
	and $42
	jr nz, .asm_193c5
	jp Func_18032
.asm_19397
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_193c5
	ld a, [wIsRolling]
	and a
	jr nz, .asm_193c5
	jp Func_18032
.asm_193a6
	ld a, [wPowerUpLevel]
	cp HEAD_SMASH_HELMET
	jp c, Func_18032
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_193c5
	ld a, [wSwimVelIndex]
	and a
	jr nz, .asm_193c5
	jp Func_18032
.asm_193bd
	ld a, [wPowerUpLevel]
	cp SUPER_JUMP_SLAM_OVERALLS
	jp c, Func_18032
.asm_193c5
	ld a, $04
	ld [wceda], a
	jr Func_193dc
.asm_193cc
	or $04
	ld [wceda], a
	jp Func_19246
.asm_193d4
	ld a, $04
	ld [wceda], a
	jp Func_19246

Func_193dc:
	ld a, [wSRAMBank]
	ld [wcedb], a
	ld hl, wYCell
	ld a, [hli]
	ld [wcedc], a
	ld d, a
	ld a, [hl]
	ld [wcedd], a
	ld e, a
	ld a, [de]
	ld [wcedf], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	jp Func_18df1

; unreferenced
Func_193fb:
	ld b, $78
	jr .asm_19419
	ld b, $79
	jr .asm_19419
	ld b, $7a
	jr .asm_19419
	ld b, $7b
	jr .asm_19419
	ld b, $7c
	jr .asm_19419
	ld b, $7d
	jr .asm_19419
	ld b, $7e
	jr .asm_19419
	ld b, $7f
.asm_19419
	ld a, [wc0d9]
	cp $01
	jr z, Func_19423
	jp Func_18032

Func_19423:
	ld hl, wYCell
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
	jr z, .asm_19440
	call Func_19609
	jp Func_18020
.asm_19440
	play_sfx SFX_BLOCK_BREAK
	jp Func_18020

; unreferenced
Func_1944b:
	ld b, $78
	jr .asm_19469
	ld b, $79
	jr .asm_19469
	ld b, $7a
	jr .asm_19469
	ld b, $7b
	jr .asm_19469
	ld b, $7c
	jr .asm_19469
	ld b, $7d
	jr .asm_19469
	ld b, $7e
	jr .asm_19469
	ld b, $7f
.asm_19469
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	jr nz, .asm_1947e
	ld a, [wca8f]
	cp $02
	jr nc, Func_19481
.asm_1947e
	jp Func_18032

Func_19481:
	ld hl, wYCell
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
	call Func_19609
	jp Func_18020

; unreferenced
Func_19497:
	ld b, $78
	jr .asm_194b5
	ld b, $79
	jr .asm_194b5
	ld b, $7a
	jr .asm_194b5
	ld b, $7b
	jr .asm_194b5
	ld b, $7c
	jr .asm_194b5
	ld b, $7d
	jr .asm_194b5
	ld b, $7e
	jr .asm_194b5
	ld b, $7f
.asm_194b5
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp nz, Func_18032
	ld a, [wc0d6]
	and $42
	jr nz, .asm_194ce
	jp Func_18032
.asm_194ce
	ld hl, wYCell
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
	call Func_19609
	jp Func_18032

; unreferenced
Func_194e4:
	ld b, $78
	jr .asm_19502
	ld b, $79
	jr .asm_19502
	ld b, $7a
	jr .asm_19502
	ld b, $7b
	jr .asm_19502
	ld b, $7c
	jr .asm_19502
	ld b, $7d
	jr .asm_19502
	ld b, $7e
	jr .asm_19502
	ld b, $7f
.asm_19502
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jp z, Func_19481
	jp Func_18032

; unreferenced
Func_19514:
	ld b, $79
	jr .asm_19522
	ld b, $7a
	jr .asm_19522
	ld b, $7b
	jr .asm_19522
	ld b, $78
.asm_19522
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_1954a
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_19542
	jp Func_18032
.asm_19542
	ld a, $01
	ld [wceda], a
	jp Func_18f32
.asm_1954a
	or $01
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_19552:
	ld b, $79
	jr .asm_19560
	ld b, $7a
	jr .asm_19560
	ld b, $7b
	jr .asm_19560
	ld b, $78
.asm_19560
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_19585
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_19580
	jp Func_18032
.asm_19580
	ld a, $03
	ld [wceda], a
.asm_19585
	or $03
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_1958d:
	ld b, $79
	jr .asm_1959b
	ld b, $7a
	jr .asm_1959b
	ld b, $7b
	jr .asm_1959b
	ld b, $78
.asm_1959b
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_195c3
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_195bb
	jp Func_18032
.asm_195bb
	ld a, $02
	ld [wceda], a
	jp Func_18f32
.asm_195c3
	or $02
	ld [wceda], a
	jp Func_18f32

; unreferenced
Func_195cb:
	ld b, $79
	jr .asm_195d9
	ld b, $7a
	jr .asm_195d9
	ld b, $7b
	jr .asm_195d9
	ld b, $78
.asm_195d9
	ld a, [wceda]
	and $07
	jp nz, Func_18020
	ld a, [wceda]
	and $f8
	jr nz, .asm_19601
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_195f9
	jp Func_18032
.asm_195f9
	ld a, $04
	ld [wceda], a
	jp Func_18f32
.asm_19601
	or $04
	ld [wceda], a
	jp Func_18f32

Func_19609:
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

Func_19690:
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

Func_19706:
	ld a, TRUE
	ld [wc0da], a
	call Func_19741
	xor a ; FALSE
	ld [wc0da], a
	ret

Func_19713:
	ld a, TRUE
	ld [wc0da], a
	call Func_197b1
	xor a ; FALSE
	ld [wc0da], a
	ret

Func_19720:
	ld a, TRUE
	ld [wc0da], a
	call CheckAirborneCollision
	xor a
	ld [wc0da], a
	ld a, b
	and a
	jp nz, TriggerFloorTransition
	jp TriggerDownwardsFloorTransition

; checks collision in side that Wario is facing
CheckFrontCollision:
	ld a, TRUE
	ld [wc0d8], a
	ld a, [wDirection]
	and a
	jr z, CheckBottomLeftCollision
	jr CheckBottomRightCollision

Func_19741:
	ld a, TRUE
	ld [wc0d8], a
;	fallthrough

CheckBottomRightCollision:
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .flat
	ld a, [wCollisionBoxRight]
	sub 1
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 7
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .got_collision_coords

.flat
	ld a, [wCollisionBoxRight]
	sub 1
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 1
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

.got_collision_coords
	ldh a, [hYPosLo]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jp z, Func_19832
	ld a, [wAttackCounter]
	and a
	jp nz, Func_19823
	ld a, b
	ret

Func_197b1:
	ld a, TRUE
	ld [wc0d8], a
;	fallthrough

CheckBottomLeftCollision:
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .flat
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 1
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 7
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .got_collision_coords

.flat
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 1
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 1
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

.got_collision_coords
	ldh a, [hYPosLo]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jr z, Func_19832
	ld a, [wAttackCounter]
	and a
	jr nz, Func_19823
	ld a, b
	ret

Func_19823:
	ld a, TRUE
	ld [wc0d8], a
	call Func_19bd3
	ld a, $01
	ld [wc18d], a
	ld b, a
	ret

Func_19832:
	ld a, [wIsCrouching]
	and a
	jp nz, .asm_198c1
	ld a, [wCollisionBoxTop]
	ld b, a
	ld a, [wWarioYPos + 1]
	add b
	add 2
	and $f0
	ld b, a
	ld a, [wc0dc]
	cp b
	jp z, .asm_198c1
	ld a, TRUE
	ld [wc0d8], a
	call Func_19bd3
	and $0f
	ret z
	ld a, [wJumpVelTable]
	and a
	jp nz, .done
	ld a, [wAttackCounter]
	and a
	jr nz, .done
	ld a, [wWaterInteraction]
	and a
	jr nz, .done
	ld a, [wIsCrouching]
	and a
	jr nz, .done
	ld a, [wIsOnSteppableObject]
	and a
	jr nz, .done
	ld a, [wTransformation]
	and a
	jr nz, .done
	ld a, [wIsInSand]
	and a
	jr nz, .done

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .add_offset
	bit D_LEFT_F, a
	jr nz, .sub_offset
	ld a, [wDirection]
	and a
	jr nz, .add_offset
.sub_offset
	ld b, 2
	call SubXOffset
	farcall CrouchOrSlideIfOnSlope
	jr .asm_198c1
.add_offset
	ld b, 2
	call AddXOffset
	farcall CrouchOrSlideIfOnSlope
	jr .asm_198c1

.done
	ret

.asm_198c1
	xor a
	ld [wc18d], a
	ld b, a
	ret

; resets wIsStandingOnSlope
Func_198c7:
	xor a
	ld [wIsStandingOnSlope], a
	get_pos
	call Func_19b51
	ret

CheckCentreCollision:
; collision in centre
	ld a, $01
	ld [wced3], a
	call Func_198c7
	and a
	ret nz
	xor a
	ld [wced3], a

; collision on left
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a ; -wCollisionBoxLeft - 3
	ld hl, wWarioXPos + 1
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

; collision on right
	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a ; wCollisionBoxRight - 3
	ld hl, wWarioXPos + 1
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

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, a
	get_pos_y
	ld a, $01
	ret

Func_19942:
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_1994e
	ld a, TRUE
	ld [wc0d8], a
.asm_1994e
	ld a, [wCollisionBoxTop]
	cpl
	inc a
	add 2
	ld c, a
	ld hl, wWarioXPos + 1
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

CheckUpCollision:
	ld a, $01
	ld [wced2], a
	call Func_19942
	and a
	ret nz
	xor a
	ld [wced2], a
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_19988
	ld a, TRUE
	ld [wc0d8], a
.asm_19988
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxTop]
	cpl
	inc a
	add 2
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

	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_199c0
	ld a, TRUE
	ld [wc0d8], a
.asm_199c0
	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxTop]
	cpl
	inc a
	add 2
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

CheckAirborneCollision:
	call .Func_19a53
	and a
	ret nz

	ld a, [wIsSmashAttacking]
	and a
	jr z, .no_smash_attack_1
	ld a, TRUE
	ld [wc0d8], a
.no_smash_attack_1
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a
	ld hl, wWarioXPos + 1
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
	ld a, [wIsOnSteppableObject]
	and a
	jr z, .asm_19a22
	ld b, a
	ret

.asm_19a22
	ld a, [wIsSmashAttacking]
	and a
	jr z, .no_smash_attack_2
	ld a, TRUE
	ld [wc0d8], a
.no_smash_attack_2
	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a
	ld hl, wWarioXPos + 1
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
	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, a
	ret

.Func_19a53
	xor a
	ld [wIsStandingOnSlope], a
	ld a, [wIsSmashAttacking]
	and a
	jr z, .no_smash_attack_3
	ld a, TRUE
	ld [wc0d8], a
.no_smash_attack_3
	get_pos
	call Func_19b7b
	ret

Func_19a77:
	xor a ; FALSE
	ld [wc1ca], a
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wWarioXPos + 1
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
	xor a ; FALSE
	ld [wc1ca], a
	ld a, [wCollisionBoxRight]
	sub $03
	ld c, a
	ld hl, wWarioXPos + 1
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
	ld a, TRUE
	ld [wc1ca], a
	ret

Func_19acd:
	ld hl, wWarioXPos + 1
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

Func_19ae4:
	ld hl, wWarioXPos + 1
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

Func_19afb:
	ld hl, wWarioXPos + 1
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

; collision on centre
Func_19b12:
	get_pos
	jr Func_19b3a

; collision on top
Func_19b25:
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub 4
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
;	fallthrough

Func_19b3a:
	xor a
	ld [wWaterInteraction], a
	ld [wLadderInteraction], a
	ld [wRoomTransitionParam], a
	ld [wIsInSand], a
	ld [wIsNearFence], a
	ld [wIsInAirCurrent], a
	call Func_19c0b
	ret

Func_19b51::
	ld hl, hPos
	call GetCell
	ld a, 1 << 0
	ld [wc0d6], a
;	fallthrough

Func_19b5c:
	call Func_18000
	ld b, a
	ret

Func_19b61::
	call DecrementXCell
	ld a, [hl]
	inc a
	ret z
	jr Func_19b5c

Func_19b69::
	call IncrementXCell
	ld a, [hl]
	and a
	ret z
	jr Func_19b5c

DecrementXCell:
	ld hl, wXCell
	dec [hl]
	ret

IncrementXCell:
	ld hl, wXCell
	inc [hl]
	ret

Func_19b7b::
	ld hl, hPos
	call GetCell
	ld a, 1 << 1
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret

Func_19b8b::
	ld hl, hPos
	call GetCell
	ld a, 1 << 2
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret

Func_19b9b::
	ld hl, hPos
	call GetCell
	ld a, 1 << 3
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret

; unreferenced
Func_19bab:
	ld hl, wXCell
	dec [hl]
	ld a, [hld]
	ld h, [hl]
	ld l, a
	call Func_18000
	ld b, a
	ret

; unreferenced
Func_19bb7:
	ld hl, wXCell
	inc [hl]
	ld a, [hld]
	ld h, [hl]
	ld l, a
	call Func_18000
	ld b, a
	ret

Func_19bc3::
	ld hl, hPos
	call GetCell
	ld a, 1 << 4
	ld [wc0d6], a
Func_19bce:
	call Func_18000
	ld b, a
	ret

Func_19bd3:
	ld hl, wYCell
	dec [hl]
	ld a, [hl]
	cp $a0 - 1
	jr nz, .asm_19be6
	ld a, [wFloorSRAMBank]
	dec a
	ld [wFloorSRAMBank], a
	ld a, $c0 - 1
	ld [hl], a

.asm_19be6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	jr Func_19bce

Func_19beb:
	ld hl, hPos
	call GetCell
	ld a, 1 << 5
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret

Func_19bfb:
	ld hl, hPos
	call GetCell
	ld a, 1 << 6
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret

Func_19c0b:
	ld hl, hPos
	call GetCell
	ld a, 1 << 7
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
