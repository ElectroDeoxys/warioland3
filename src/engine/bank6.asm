Func_18000: ; 18000 (6:4000)
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
; 0x18020

Func_18020: ; 18020 (6:4020)
	xor a ; SRAM0
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld [wc18d], a
	ret
; 0x18032

Func_18032: ; 18032 (6:4032)
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
; 0x18064

Func_18064: ; 18064 (6:4064)
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, $10
	ld [wc18d], a
	ret
; 0x18078

Func_18078: ; 18078 (6:4078)
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, $01
	ld [wc18d], a
	ret
; 0x1808c

Func_1808c: ; 1808c (6:408c)
	xor a
	sramswitch
	xor a ; FALSE
	ld [wc0d8], a
	ld [wc0d9], a
	xor a
	ld [wc18d], a
	ret
; 0x1809f

Func_1809f: ; 1809f (6:409f)
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
; 0x18129

Func_18129: ; 18129 (6:4129)
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
; 0x181ac

Func_181ac: ; 181ac (6:41ac)
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
; 0x181c8

Func_181c8: ; 181c8 (6:41c8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_RIGHT
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x181d8

Func_181d8: ; 181d8 (6:41d8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_UP
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x181e8

Func_181e8: ; 181e8 (6:41e8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_LEFT
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x181f8

Func_181f8: ; 181f8 (6:41f8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, CURRENT_DOWN
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x18208

Func_18208: ; 18208 (6:4208)
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
; 0x1823f

Func_1823f: ; 1823f (6:423f)
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
; 0x18262

Func_18262: ; 18262 (6:4262)
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
; 0x1828c

Func_1828c: ; 1828c (6:428c)
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
; 0x182c3

Func_182c3: ; 182c3 (6:42c3)
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
; 0x182dc

Func_182dc: ; 182dc (6:42dc)
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
; 0x182fe

Func_182fe: ; 182fe (6:42fe)
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
; 0x1831a

Func_1831a: ; 1831a (6:431a)
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
; 0x18336

Func_18336: ; 18336 (6:4336)
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
; 0x1839c

Func_1839c: ; 1839c (6:439c)
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
; 0x18402

Func_18402: ; 18402 (6:4402)
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
; 0x1842a

Func_1842a: ; 1842a (6:442a)
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
	ld a, [wXPosLo]
	and $f0
	add $18
	ld [wXPosLo], a
	ld a, [wXPosHi]
	adc $00
	ld [wXPosHi], a
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
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
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

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82
	load_frameset Frameset_14cf6
	update_anim_1
	jp Func_18032
; 0x184fc

Func_184fc: ; 184fc (6:44fc)
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
	ld a, [wXPosLo]
	and $f0
	add $18
	ld [wXPosLo], a
	ld a, [wXPosHi]
	adc $00
	ld [wXPosHi], a
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
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
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

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82
	load_frameset Frameset_14cf6
	update_anim_1
	jp Func_18032
; 0x185cb

Func_185cb: ; 185cb (6:45cb)
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
; 0x185fa

Func_185fa: ; 185fa (6:45fa)
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

Func_18624: ; 18624 (6:4624)
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

Func_1864e: ; 1864e (6:464e)
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
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
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

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82
	ld a, [wDirection]
	and a
	jr nz, .asm_186dd
	load_frameset Frameset_14d0b
	jr .asm_186e7
.asm_186dd
	load_frameset Frameset_14d10
.asm_186e7
	update_anim_1
	jp Func_18020
; 0x186f9

Func_186f9: ; 186f9 (6:46f9)
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
; 0x18727

Func_18727: ; 18727 (6:4727)
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
; 0x18755

Func_18755: ; 18755 (6:4755)
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
; 0x1877e

Func_1877e: ; 1877e (6:477e)
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
; 0x187b0

Func_187b0: ; 187b0 (6:47b0)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, ROOMTRANSITION_4 | ROOMTRANSITIONFLAG_2
	ld [wRoomTransitionParam], a
	jp Func_18020
; 0x187c7

Func_187c7: ; 187c7 (6:47c7)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, ROOMTRANSITION_4
	ld [wRoomTransitionParam], a
	jp Func_18020
; 0x187de

Func_187de: ; 187de (6:47de)
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, ROOMTRANSITION_4 | ROOMTRANSITIONFLAG_2
	ld [wRoomTransitionParam], a
	jp Func_181ac
; 0x187f5

Func_187f5: ; 187f5 (6:47f5)
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, ROOMTRANSITION_4
	ld [wRoomTransitionParam], a
	jp Func_181ac
; 0x1880c

Func_1880c: ; 1880c (6:480c)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jp nz, Func_18020
	call RecoverFromTransformation_WithoutInvincibility
	jp Func_18020
; 0x18821

Func_18821: ; 18821 (6:4821)
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
; 0x1884c

Func_1884c: ; 1884c (6:484c)
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
; 0x18868

Func_18868: ; 18868 (6:4868)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_VAMPIRE_WARIO
	jp nz, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18032
	ld a, [wXPosLo]
	and $08
	jr nz, .asm_1889e
	ld a, [wCollisionBoxRight]
	ld b, a
	ld a, [wXPosLo]
	and $f0
	sub b
	ld [wXPosLo], a
	ld a, [wXPosHi]
	sbc $00
	ld [wXPosHi], a
	jp Func_18032
.asm_1889e
	ld a, [wCollisionBoxLeft]
	ld b, a
	ld a, $10
	sub b
	ld b, a
	ld a, [wXPosLo]
	and $f0
	add b
	ld [wXPosLo], a
	ld a, [wXPosHi]
	adc $00
	ld [wXPosHi], a
	jp Func_18032
; 0x188ba

Func_188ba: ; 188ba (6:48ba)
	ld a, [wc0da]
	and a
	jp z, Func_18032
	jp Func_18020
; 0x188c4

Func_188c4: ; 188c4 (6:48c4)
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
; 0x188e0

Func_188e0: ; 188e0 (6:48e0)
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
; 0x18934

Func_18934: ; 18934 (6:4934)
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
; 0x1894d

Func_1894d: ; 1894d (6:494d)
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
	ld a, $01
	ld [wc1c9], a
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
	farcall SetState_Fan
	jp Func_18020
; 0x18997

Func_18997: ; 18997 (6:4997)
	ld a, [wc0da]
	and a
	jp z, Func_18032
	ld a, [wc0d6]
	and $01
	jp z, Func_18032
	ld a, TRUE
	ld [wIsOnSlipperyGround], a
	jp Func_18032
; 0x189ae

Func_189ae: ; 189ae (6:49ae)
	ld a, [wc0da]
	and a
	jp z, Func_18208
	ld a, [wc0d6]
	and $01
	jp z, Func_18208
	ld a, TRUE
	ld [wIsOnSlipperyGround], a
	jp Func_18208
; 0x189c5

Func_189c5: ; 189c5 (6:49c5)
	ld a, [wRoomPalCycleIndex]
	cp $07
	jr z, .asm_189d1
	cp $04
	jp nc, Func_18020
.asm_189d1
	jp Func_18208
; 0x189d4

Func_189d4: ; 189d4 (6:49d4)
	ld a, [wRoomPalCycleIndex]
	cp $03
	jp c, Func_18020
	jp Func_18208
; 0x189df

Func_189df: ; 189df (6:49df)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, Func_18020
	jp Func_18032
; 0x189f1

Func_189f1: ; 189f1 (6:49f1)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	jp Func_18208
; 0x189fb

Func_189fb: ; 189fb (6:49fb)
	ld b, $78
	jr Func_18a19
Func_189ff: ; 189ff (6:49ff)
	ld b, $79
	jr Func_18a19
Func_18a03: ; 18a03 (6:4a03)
	ld b, $7a
	jr Func_18a19
Func_18a07: ; 18a07 (6:4a07)
	ld b, $7b
	jr Func_18a19
Func_18a0b: ; 18a0b (6:4a0b)
	ld b, $7c
	jr Func_18a19
Func_18a0f: ; 18a0f (6:4a0f)
	ld b, $7d
	jr Func_18a19
Func_18a13: ; 18a13 (6:4a13)
	ld b, $7e
	jr Func_18a19
Func_18a17: ; 18a17 (6:4a17)
	ld b, $7f
;	fallthrough
Func_18a19: ; 18a19 (6:4a19)
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
; 0x18a9a

Func_18a9a: ; 18a9a (6:4a9a)
	ld b, $79
	jr Func_18aa8
Func_18a9e: ; 18a9e (6:4a9e)
	ld b, $7a
	jr Func_18aa8
Func_18aa2: ; 18aa2 (6:4aa2)
	ld b, $7b
	jr Func_18aa8
Func_18aa6: ; 18aa6 (6:4aa6)
	ld b, $78
;	fallthrough

Func_18aa8: ; 18aa8 (6:4aa8)
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
; 0x18ade

Func_18ade: ; 18ade (6:4ade)
	ld b, $79
	jr Func_18aec
Func_18ae2: ; 18ae2 (6:4ae2)
	ld b, $7a
	jr Func_18aec
Func_18ae6: ; 18ae6 (6:4ae6)
	ld b, $7b
	jr Func_18aec
Func_18aea: ; 18aea (6:4aea)
	ld b, $78
;	fallthrough
Func_18aec: ; 18aec (6:4aec)
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
; 0x18b1f

	INCROM $18b1f, $18f32

Func_18f32: ; 18f32 (6:4f32)
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
; 0x18f5f

	INCROM $18f5f, $19609

Func_19609: ; 19609 (6:5609)
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
; 0x19690

Func_19690: ; 19690 (6:5690)
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
; 0x19706

; unreferenced?
Func_19706: ; 19706 (6:5706)
	ld a, TRUE
	ld [wc0da], a
	call Func_19741
	xor a ; FALSE
	ld [wc0da], a
	ret
; 0x19713

	INCROM $19713, $19734

; checks collision in side that Wario is facing
CheckFrontCollision: ; 19734 (6:5734)
	ld a, TRUE
	ld [wc0d8], a
	ld a, [wDirection]
	and a
	jr z, CheckBottomLeftCollision
	jr CheckBottomRightCollision

Func_19741: ; 19741 (6:5741)
	ld a, TRUE
	ld [wc0d8], a
;	fallthrough

CheckBottomRightCollision: ; 19746 (6:5746)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .flat
	ld a, [wCollisionBoxRight]
	sub 1
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

Func_197b1: ; 197b1 (6:57b1)
	ld a, TRUE
	ld [wc0d8], a
;	fallthrough

CheckBottomLeftCollision: ; 197b6 (6:57b6)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .flat
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 1
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

Func_19823: ; 19823 (6:5823)
	ld a, TRUE
	ld [wc0d8], a
	call Func_19bd3
	ld a, $01
	ld [wc18d], a
	ld b, a
	ret

Func_19832: ; 19832 (6:5832)
	ld a, [wIsCrouching]
	and a
	jp nz, .asm_198c1
	ld a, [wCollisionBoxTop]
	ld b, a
	ld a, [wYPosLo]
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
; 0x198c7

; resets wIsStandingOnSlope
Func_198c7: ; 198c7 (6:58c7)
	xor a
	ld [wIsStandingOnSlope], a
	get_pos
	call Func_19b51
	ret
; 0x198e0

CheckCentreCollision: ; 198e0 (6:58e0)
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

; collision on right
	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a ; wCollisionBoxRight - 3
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

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, a
	get_pos_y
	ld a, $01
	ret
; 0x19942

Func_19942: ; 19942 (6:5942)
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

CheckUpCollision: ; 1996e (6:596e)
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
; 0x199e9

CheckAirborneCollision: ; 199e9 (6:59e9)
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
; 0x19a77

Func_19a77: ; 19a77 (6:5a77)
	xor a ; FALSE
	ld [wc1ca], a
	ld a, [wCollisionBoxLeft]
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
	xor a ; FALSE
	ld [wc1ca], a
	ld a, [wCollisionBoxRight]
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
	ld a, TRUE
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

; collision on centre
Func_19b12: ; 19b12 (6:5b12)
	get_pos
	jr Func_19b3a

; collision on top
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
	sub 4
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
	ld [wRoomTransitionParam], a
	ld [wIsInSand], a
	ld [wIsNearFence], a
	ld [wc1c9], a
	call Func_19c0b
	ret
; 0x19b51

Func_19b51:: ; 19b51 (6:5b51)
	ld hl, hPos
	call GetCell
	ld a, 1 << 0
	ld [wc0d6], a
;	fallthrough

Func_19b5c: ; 19b5c (6:5b5c)
	call Func_18000
	ld b, a
	ret
; 0x19b61

Func_19b61:: ; 19b61 (6:5b61)
	call DecrementXCell
	ld a, [hl]
	inc a
	ret z
	jr Func_19b5c
; 0x19b69

Func_19b69:: ; 19b69 (6:5b69)
	call IncrementXCell
	ld a, [hl]
	and a
	ret z
	jr Func_19b5c
; 0x19b71

DecrementXCell: ; 19b71 (6:5b71)
	ld hl, wXCell
	dec [hl]
	ret
; 0x19b76

IncrementXCell: ; 19b76 (6:5b76)
	ld hl, wXCell
	inc [hl]
	ret
; 0x19b7b

Func_19b7b:: ; 19b7b (6:5b7b)
	ld hl, hPos
	call GetCell
	ld a, 1 << 1
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b8b

Func_19b8b:: ; 19b8b (6:5b8b)
	ld hl, hPos
	call GetCell
	ld a, 1 << 2
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b9b

Func_19b9b:: ; 19b9b (6:5b9b)
	ld hl, hPos
	call GetCell
	ld a, 1 << 3
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bab

	INCROM $19bab, $19bc3

Func_19bc3:: ; 19bc3 (6:5bc3)
	ld hl, hPos
	call GetCell
	ld a, 1 << 4
	ld [wc0d6], a
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
; 0x19beb

Func_19beb: ; 19beb (6:5beb)
	ld hl, hPos
	call GetCell
	ld a, 1 << 5
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bfb

Func_19bfb: ; 19bfb (6:5bfb)
	ld hl, hPos
	call GetCell
	ld a, 1 << 6
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19c0b

Func_19c0b: ; 19c0b (6:5c0b)
	ld hl, hPos
	call GetCell
	ld a, 1 << 7
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19c1b
