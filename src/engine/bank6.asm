Func_18000: ; 18000 (6:4000)
	xor a
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
	xor a
	ld [wc0d8], a
	ld [wc0d9], a
	ld [wc18d], a
	ret
; 0x18032

Func_18032: ; 18032 (6:4032)
	xor a
	sramswitch
	xor a
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
	xor a
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, $10
	ld [wc18d], a
	ret
; 0x18078

Func_18078: ; 18078 (6:4078)
	xor a
	sramswitch
	xor a
	ld [wc0d8], a
	ld [wc0d9], a
	ld a, $01
	ld [wc18d], a
	ret
; 0x1808c

Func_1808c: ; 1808c (6:408c)
	xor a
	sramswitch
	xor a
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
	ld a, $01
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
	ld a, WATER_CURRENT_RIGHT
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x181d8

Func_181d8: ; 181d8 (6:41d8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, WATER_CURRENT_UP
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x181e8

Func_181e8: ; 181e8 (6:41e8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, WATER_CURRENT_LEFT
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x181f8

Func_181f8: ; 181f8 (6:41f8)
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, WATER_CURRENT_DOWN
	ld [wWaterCurrent], a
	jp Func_181ac
; 0x18208

Func_18208: ; 18208 (6:4208)
	ld a, $01
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
	ld a, $01
	ld [wc0dd], a
	jp Func_18032
; 0x18262

Func_18262: ; 18262 (6:4262)
	ld a, [wc0da]
	and a
	jp nz, Func_18020
	ld a, $01
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
	call Func_12b5
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
	ld a, $45
	ld [wc0d7], a
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
	ld a, $05
	ld [wc0d7], a
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
	ld a, $c1
	ld [wc0d7], a
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
	ld a, $c1
	ld [wc0d7], a
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
	ld a, $e2
	ld [wc0d7], a
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
	ld a, $e3
	ld [wc0d7], a
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
	ld a, $a2
	ld [wc0d7], a
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
	ld a, $a3
	ld [wc0d7], a
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
	ld a, $66
	ld [wc0d7], a
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
	ld a, $26
	ld [wc0d7], a
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
	ld a, $e8
	ld [wc0d7], a
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
	ld a, $44
	ld [wc0d7], a
	jp Func_18020
; 0x187c7

Func_187c7: ; 187c7 (6:47c7)
	ld a, [wc0da]
	and a
	jp z, Func_18020
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_18020
	ld a, $04
	ld [wc0d7], a
	jp Func_18020
; 0x187de

Func_187de: ; 187de (6:47de)
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, $44
	ld [wc0d7], a
	jp Func_181ac
; 0x187f5

Func_187f5: ; 187f5 (6:47f5)
	ld a, [wc0da]
	and a
	jp z, Func_181ac
	ld a, [wc0d6]
	bit 7, a
	jp z, Func_181ac
	ld a, $04
	ld [wc0d7], a
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
	ld a, $01
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
	ld a, $01
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
	ld a, $02
	ld [wTransformationDuration + 0], a
	ld a, $58
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
	cp POWER_UP_HEAD_SMASH_HELMET
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
	cp POWER_UP_GARLIC
	jp c, Func_18032
	jp Func_18020
.asm_18a8f
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
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
	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a
	ld b, $01
	farcall Func_c9f0
	ldh a, [rDIV]
	and %11
	jr nz, .asm_1967f
	ld a, [wcac2]
	and a
	jr nz, .asm_1967f
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	ld a, $64
	ld [wcac2], a
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
	ld bc, $4e5a
	farcall CreateObjectFromCurObjPos
	ld hl, hffa0
	ld de, wCurObjUnk01
	ld b, OBJ_UNK_07 - OBJ_UNK_01
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
.asm_1967f
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
	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a
	ld b, PARTICLE_DEBRIS
	farcall Func_c9f0

	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
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
	ld bc, $4e6d
	farcall CreateObjectFromCurObjPos
	ld hl, hffa0
	ld de, wCurObjUnk01
	ld b, OBJ_UNK_07 - OBJ_UNK_01
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
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
	ld a, $01
	ld [wc0da], a
	call Func_19741
	xor a
	ld [wc0da], a
	ret
; 0x19713

	INCROM $19713, $19734

; checks collision in side that Wario is facing
CheckFrontCollision: ; 19734 (6:5734)
	ld a, $01
	ld [wc0d8], a
	ld a, [wDirection]
	and a
	jr z, CheckBottomLeftCollision
	jr CheckBottomRightCollision

Func_19741: ; 19741 (6:5741)
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
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
	ld a, $01
	ld [wc0d8], a
.no_smash_attack_3
	get_pos
	call Func_19b7b
	ret
; 0x19a77

Func_19a77: ; 19a77 (6:5a77)
	xor a
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
	xor a
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
	ld [wc0d7], a
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

Func_19c1b: ; 19c1b (6:5c1b)
	ld a, [wWarioState]
	sub $30
	jumptable

	dw UpdateState_Slipping              ; WST_SLIPPING
	dw UpdateState_CrouchSlipping        ; WST_CROUCH_SLIPPING
	dw UpdateState_DraggedDown           ; WST_DRAGGED_DOWN
	dw UpdateState_Teleporting           ; WST_TELEPORTING
	dw UpdateState_WaterTeleporting      ; WST_WATER_TELEPORTING
	dw UpdateState_SandFalling           ; WST_SAND_FALLING
	dw UpdateState_SandJumping           ; WST_SAND_JUMPING
	dw UpdateState_SandIdling            ; WST_SAND_IDLING
	dw UpdateState_SandWalking           ; WST_SAND_WALKING
	dw UpdateState_SandTurning           ; WST_SAND_TURNING
	dw UpdateState_LadderClimbing        ; WST_LADDER_CLIMBING
	dw UpdateState_LadderIdling          ; WST_LADDER_IDLING
	dw UpdateState_LadderShakeSlipping   ; WST_LADDER_SHAKE_SLIDING
	dw UpdateState_GettingOffLadder      ; WST_GETTING_OFF_LADDER
	dw UpdateState_LadderSliding         ; WST_LADDER_SLIDING
	dw UpdateState_GrabSlipping          ; WST_GRAB_SLIPPING
	dw $689e                             ; WST_UNKNOWN_40
	dw $68ff                             ; WST_UNKNOWN_41
	dw $6980                             ; WST_UNKNOWN_42
	dw $69e9                             ; WST_UNKNOWN_43
	dw $6a5c                             ; WST_UNKNOWN_44
	dw $6ac9                             ; WST_UNKNOWN_45
	dw $6b44                             ; WST_UNKNOWN_46
	dw $68ff                             ; WST_UNKNOWN_47
	dw $6980                             ; WST_UNKNOWN_48
	dw $6bb1                             ; WST_UNKNOWN_49
	dw $6bf4                             ; WST_UNKNOWN_4A
	dw UpdateState_Sleeping              ; WST_SLEEPING
	dw UpdateState_LadderScratching      ; WST_LADDER_SCRATCHING
	dw UpdateState_FenceShakeSliding     ; WST_FENCE_SHAKE_SLIDING
	dw UpdateState_FenceMovingVertical   ; WST_FENCE_MOVING_VERTICAL
	dw UpdateState_FenceIdling           ; WST_FENCE_IDLING
	dw UpdateState_FenceMovingHorizontal ; WST_FENCE_MOVING_HORIZONTAL
	dw UpdateState_FenceSliding          ; WST_FENCE_SLIDING
	dw Func_156d                         ; WST_UNUSED_52
	dw Func_156d                         ; WST_UNUSED_53
	dw Func_156d                         ; WST_UNUSED_54
	dw Func_156d                         ; WST_UNUSED_55
	dw Func_156d                         ; WST_UNUSED_56
	dw Func_156d                         ; WST_UNUSED_57
	dw Func_156d                         ; WST_UNUSED_58
	dw Func_156d                         ; WST_UNUSED_59
	dw Func_156d                         ; WST_UNUSED_5A
	dw Func_156d                         ; WST_UNUSED_5B
	dw Func_156d                         ; WST_UNUSED_5C
	dw Func_156d                         ; WST_UNUSED_5D
	dw Func_156d                         ; WST_UNUSED_5E
	dw Func_156d                         ; WST_UNUSED_5F
; 0x19c81

SetState_Slipping: ; 19c81 (6:5c81)
	ld a, WST_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wAttackCounter], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	ld [wWarioStateCycles], a
	and a
	jr nz, .asm_19ccd
	load_frameset Frameset_14252
	jr .got_frameset
.asm_19ccd
	load_frameset Frameset_1425f
.got_frameset
	update_anim_1
	ret
; 0x19ce7

UpdateState_Slipping: ; 19ce7 (6:5ce7)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition

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

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19d56
	load_frameset Frameset_14cbe
	jr .asm_19daf
.asm_19d56
	load_frameset Frameset_14cc5
	jr .asm_19daf

.asm_19d62
	ld b, a
	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_19db6
	ld a, b
	add $02
	ld [wWarioStateCycles], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	ld a, [wWarioStateCycles]
	and $01
	jr nz, .asm_19da3
	load_frameset Frameset_149b4
	jr .asm_19daf
.asm_19da3
	load_frameset Frameset_149c5
	jr .asm_19daf

.asm_19daf
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
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
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_SLIPPING
	ret nz ; done if not slipping any more

	ld a, b
	and a
	jr nz, .asm_19e0f
	farcall StartFall
	ret

.asm_19e0f
	update_pos_y
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_SLIPPING
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
	ld a, WST_CROUCH_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wAttackCounter], a
	ld [wGrabState], a
	inc a
	ld [wIsCrouching], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wWarioStateCycles]
	cp $01
	jr z, .asm_19ed7
	load_frameset Frameset_14a38
	jr .got_frameset
.asm_19ed7
	load_frameset Frameset_14a3b
.got_frameset
	update_anim_1
	ret
; 0x19ef1

UpdateState_CrouchSlipping: ; 19ef1 (6:5ef1)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .asm_19f1e
	farcall StartCrouchJump
	ret

.asm_19f1e
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIPPING
	ret nz ; done if not crouch slipping any more
	ld a, b
	and a
	jr nz, .asm_19f47
	farcall StartCrouchFall
	ret

.asm_19f47
	update_pos_y
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_CROUCH_SLIPPING
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
	farcall CrouchOrSlideIfOnSlope
	ret
; 0x19fb6

SetState_DraggedDown: ; 19fb6 (6:5fb6)
	ld a, WST_DRAGGED_DOWN
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wAttackCounter], a
	ld [wGrabState], a
	ld [wJumpVelTable], a
	ld [wJumpVelIndex], a
	ld [wIsSmashAttacking], a
	ld [wIsCrouching], a
	ld [wIsRolling], a

	inc a
	ld [wAutoMoveState], a

	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a

	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a02c
	load_frameset Frameset_15f70
	jr .asm_1a036
.asm_1a02c
	load_frameset Frameset_15f7f
.asm_1a036
	update_anim_1
	ret
; 0x1a046

UpdateState_DraggedDown: ; 1a046 (6:6046)
	update_anim_1
	ld a, [wAutoMoveState]
	and a
	ret nz
	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, .set_game_over
	farcall StartFall
	ret

.set_game_over
	ld a, LVLEND_GAME_OVER
	ld [wLevelEndScreen], a
	ret
; 0x1a077

UpdateState_Teleporting: ; 1a077 (6:6077)
	ld a, TRUE
	ld [wIsIntangible], a
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, PlayTeleportingSFX
	cp $b4
	ret c
	ld [hl], $00
	ld a, WST_STUNG
	ld [wWarioState], a
	ld a, $01
	ld [wInvincibleCounter], a
	ld hl, wc0d7
	res 7, [hl]
	jp TriggerRoomTransition

PlayTeleportingSFX: ; 1a0ab (6:60ab)
	play_sfx SFX_082
	ret
; 0x1a0b4

UpdateState_WaterTeleporting: ; 1a0b4 (6:60b4)
	ld a, TRUE
	ld [wIsIntangible], a
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $11
	jr z, PlayTeleportingSFX
	cp $b4
	ret c
	ld [hl], $00
	ld a, WST_WATER_STUNG
	ld [wWarioState], a
	ld a, $01
	ld [wInvincibleCounter], a
	ld hl, wc0d7
	res 7, [hl]
	jp TriggerRoomTransition
; 0x1a0e8

SetState_SandFalling: ; 1a0e8 (6:60e8)
	xor a
	ld [wGrabState], a
	ld a, WST_SAND_FALLING
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
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wAttackCounter], a
	ld [wIsRolling], a
	ld [wSwimVelIndex], a
	ld [wIsCrouching], a
	ld [wc0e0], a
	ld hl, Pals_c800
	call SetWarioPal
;	fallthrough

Func_1a12a: ; 1a12a (6:612a)
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
;	fallthrough

Func_1a14b: ; 1a14b (6:614b)
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a164
	load_frameset Frameset_15f94
	jr .asm_1a16e
.asm_1a164
	load_frameset Frameset_15f97
.asm_1a16e
	update_anim_1
	ret
; 0x1a17e

UpdateState_SandFalling: ; 1a17e (6:617e)
	call Func_1b2c0
	ld a, [wWarioState]
	cp WST_SAND_FALLING
	ret nz ; done if not falling in sand any more

	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	update_pos_y
	jp SetState_SandIdling
; 0x1a1a7

SetState_SandJumping: ; 1a1a7 (6:61a7)
	play_sfx SFX_JUMP
	ld a, WST_SAND_JUMPING
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
	farcall StartJump_FromSand
	ret

.in_sand
	call ApplyJumpVelocity
	farcall Func_2b17a
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1a208
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1a208
	ld a, [wIsTurning]
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
	farcall CheckUpCollision
	ld a, b
	and a
	ret z
	jp SetState_SandFalling
; 0x1a236

SetState_SandIdling: ; 1a236 (6:6236)
	ld a, WST_SAND_IDLING
	ld [wWarioState], a

	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a27c
	load_frameset Frameset_14252
	jr .asm_1a286
.asm_1a27c
	load_frameset Frameset_1425f
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
	ld [wWalkVelIndex], a

	ld a, WST_SAND_WALKING
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
	play_sfx SFX_WALK

.skip_sfx
	update_anim_1
	call Func_1b333
	ld a, [wWarioState]
	cp WST_SAND_WALKING
	ret nz ; done if not walking in sand any more

	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition
	farcall CheckCentreCollision
	ld a, b
	and a
	jp z, SetState_SandFalling
	ret
; 0x1a330

SetState_SandTurning: ; 1a330 (6:6330)
	ld a, WST_SAND_TURNING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wDirection]
	xor $1 ; switch direction
	ld [wDirection], a
	and a
	jr nz, .asm_1a37a
	load_frameset Frameset_14cbe
	jr .asm_1a384
.asm_1a37a
	load_frameset Frameset_14cc5
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
	ld a, WST_LADDER_CLIMBING
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
	ld [wIsGettingOffLadder], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_158d6
	update_anim_1
	ret
; 0x1a436

UpdateState_LadderClimbing: ; 1a436 (6:6436)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition

	ld a, [wSFXLoopCounter]
	sub 1
	ld [wSFXLoopCounter], a
	jr nc, .skip_sfx
	ld a, 32
	ld [wSFXLoopCounter], a
	play_sfx SFX_CLIMB
.skip_sfx
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1a49a
	get_pos
	ld b, PARTICLE_DUST
	farcall CreateParticle
.asm_1a49a
	call HandleLadderInput
	ret
; 0x1a49e

SetState_LadderIdling: ; 1a49e (6:649e)
	ld a, WST_LADDER_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wIsGettingOffLadder], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	ld a, [wDirection]
	and a
	jr nz, .asm_1a511
	load_frameset Frameset_15900
.asm_1a501
	update_anim_1
	ret

.asm_1a511
	load_frameset Frameset_158fd
	jr .asm_1a501
; 0x1a51d

UpdateState_LadderIdling: ; 1a51d (6:651d)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition
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
	jp nz, TriggerRoomTransition
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a588
	farcall StartFall
	ret
.asm_1a588
	update_anim_1

	ld b, $02
	call AddYOffset
	ld a, [wCameraConfigFlags]
	and CAMCONFIG_SCROLLING_MASK
	cp CAMCONFIG_TRANSITIONS
	jr c, .asm_1a5b3
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1a5b3
	jr c, .asm_1a5b3
	call StartDownwardsFloorTransition
.asm_1a5b3
	farcall CheckAirborneCollision
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
	ld a, WST_GETTING_OFF_LADDER
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	inc a ; TRUE
	ld [wIsGettingOffLadder], a
	ld [wIsIntangible], a

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
	play_sfx SFX_CLIMB
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
	ld [wIsGettingOffLadder], a
	ld [wIsIntangible], a
	farcall StartFall
	ret
; 0x1a66b

SetState_LadderSliding: ; 1a66b (6:666b)
	ld a, WST_LADDER_SLIDING
	ld [wWarioState], a
	play_sfx SFX_SLIDE
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
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
	ld [wAnimationFrame], a
	load_frameset Frameset_15945
	update_anim_1
	ret
; 0x1a6b6

UpdateState_LadderSliding: ; 1a6b6 (6:66b6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition
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
	ld a, [wCameraConfigFlags]
	and CAMCONFIG_SCROLLING_MASK
	cp CAMCONFIG_TRANSITIONS
	jr c, .asm_1a719
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1a719
	jr c, .asm_1a719
	call StartDownwardsFloorTransition
.asm_1a719
	farcall CheckAirborneCollision

	ld a, b
	and a
	ret z
	update_pos_y
	ld a, [wIsSmashAttacking]
	and a
	jr z, .idle
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr c, .ground_pound
	farcall DoGroundShake
	ret
.idle
	farcall SetState_Idling
	ret
.ground_pound
	farcall DoGroundPound
	ret
; 0x1a773

SetState_GrabSlipping: ; 1a773 (6:6773)
	ld a, WST_GRAB_SLIPPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wAttackCounter], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a7bc
	load_frameset Frameset_14a20
	jr .asm_1a7c6
.asm_1a7bc
	load_frameset Frameset_14a23
.asm_1a7c6
	update_anim_1
	ret
; 0x1a7d6

UpdateState_GrabSlipping: ; 1a7d6 (6:67d6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition
	ld a, [wGrabState]
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
	farcall CheckCentreCollision
	ld a, [wWarioState]
	cp WST_GRAB_SLIPPING
	ret nz ; done if not grab slipping any more
	ld a, b
	and a
	jr nz, .asm_1a842
	farcall Func_1edd3
	ret

.asm_1a842
	farcall CheckFrontCollision
	ld a, [wWarioState]
	cp WST_GRAB_SLIPPING
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
	farcall SetState_GrabIdling
	ret
; 0x1a89e

	INCROM $1a89e, $1ac10

SetState_Sleeping: ; 1ac10 (6:6c10)
	ld a, WST_SLEEPING
	ld [wWarioState], a
	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14000
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ac59
	load_frameset Frameset_1421c
	jr .got_frameset
.asm_1ac59
	load_frameset Frameset_14225
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
	play_sfx SFX_SLEEP
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld hl, wWarioStateCounter
	inc [hl]

	ld a, [wDirection]
	and a
	jr nz, .asm_1acb6
	load_frameset Frameset_1422e
	jr .asm_1acc0
.asm_1acb6
	load_frameset Frameset_14237
.asm_1acc0
	update_anim_1
	ret

.asm_1acd0
	ld a, [wAnimationHasFinished]
	and a
	play_sfx nz, SFX_SLEEP
	ld a, [wJoypadDown]
	and a
	ret z
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [wDirection]
	and a
	jr nz, .asm_1ad00
	load_frameset Frameset_14240
	jr .asm_1acc0
.asm_1ad00
	load_frameset Frameset_14249
	jr .asm_1acc0

.asm_1ad0c
	ld a, [wAnimationHasFinished]
	and a
	ret z
	farcall SetState_Idling
	ret
; 0x1ad21

SetState_LadderScratching: ; 1ad21 (6:6d21)
	ld a, WST_LADDER_SCRATCHING
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
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ad63
	load_frameset Frameset_15903
	jr .asm_1ad6d
.asm_1ad63
	load_frameset Frameset_15924
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
	ld a, WST_FENCE_SHAKE_SLIDING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld a, $03
	ld [wAutoMoveState], a

	load_gfx WarioIdleGfx
	call LoadWarioGfx
	load_oam OAM_14a82

	ld a, [wDirection]
	and a
	jr nz, .asm_1ade1
	load_frameset Frameset_14d0b
	jr .asm_1adeb
.asm_1ade1
	load_frameset Frameset_14d10
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
	ld [wAnimationFrame], a
	load_frameset Frameset_14d15
	update_anim_1

	ld hl, wWarioStateCounter
	inc [hl]
.asm_1ae3a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_1ae67
	call ApplyJumpVelocity
	farcall CheckAirborneCollision
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
	ld a, WST_FENCE_MOVING_VERTICAL
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	load_frameset Frameset_158d6
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
	play_sfx SFX_CLIMB
.skip_sfx
	update_anim_1

	ld a, [wAnimationHasFinished]
	and a
	jr z, .asm_1af1e

	get_pos

	ld b, PARTICLE_DUST
	farcall CreateParticle
.asm_1af1e
	call Func_1b168
	ret
; 0x1af22

SetState_FenceIdling: ; 1af22 (6:6f22)
	ld a, WST_FENCE_IDLING
	ld [wWarioState], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a
	load_gfx WarioLadderGfx
	call LoadWarioGfx
	load_oam OAM_155cc

	ld a, [wDirection]
	and a
	jr nz, .asm_1af7e
	load_frameset Frameset_15900
	jr .asm_1af88
.asm_1af7e
	load_frameset Frameset_158fd
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
	ld a, WST_FENCE_MOVING_HORIZONTAL
	ld [wWarioState], a

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wCollisionBoxBottom], a
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ld a, -27
	ld [wCollisionBoxTop], a

	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left

	ld a, [wDirection]
	and a
	jr nz, .d_right
.d_left
	load_frameset Frameset_158f2
	jr .asm_1afff
.d_right
	load_frameset Frameset_158e7
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
	play_sfx SFX_CLIMB
.skip_sfx
	update_anim_1
	call Func_1b24f
	ret
; 0x1b05e

SetState_FenceSliding: ; 1b05e (6:705e)
	ld a, WST_FENCE_SLIDING
	ld [wWarioState], a
	play_sfx SFX_SLIDE

	xor a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsGettingOffLadder], a
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
	ld [wAnimationFrame], a
	load_frameset Frameset_15945
	update_anim_1
	ret
; 0x1b0a9

UpdateState_FenceSliding: ; 1b0a9 (6:70a9)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, TriggerRoomTransition
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
	ld a, [wCameraConfigFlags]
	and CAMCONFIG_SCROLLING_MASK
	cp CAMCONFIG_TRANSITIONS
	jr c, .asm_1b10e
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1b10e
	jr c, .asm_1b10e
	call StartDownwardsFloorTransition
.asm_1b10e
	farcall CheckAirborneCollision
	ld a, b
	and a
	ret z

	update_pos_y

	ld a, [wIsSmashAttacking]
	and a
	jr z, .idle
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr c, .ground_pound
	farcall DoGroundShake
	ret
.idle
	farcall SetState_Idling
	ret
.ground_pound
	farcall DoGroundPound
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
	farcall CheckCentreCollision
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
	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	ld b, $01
	call AddXOffset
	ret

.d_left
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	farcall CheckFrontCollision
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

	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	farcall Func_2b17a

	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1b2f8
	ld a, $00
	ld [wWalkVelIndex], a
.asm_1b2f8
	ld a, [wIsTurning]
	and a
	jr z, .asm_1b301
	call Func_1a14b
.asm_1b301
	ret
; 0x1b302

Func_1b302: ; 1b302 (6:7302)
	farcall CheckCentreCollision
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

	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Right
	call AddXOffset
.asm_1b36d
	ld a, [wWalkVelIndex]
	cp $04
	jr c, .asm_1b379
	ld a, $00
	ld [wWalkVelIndex], a
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

	farcall CheckFrontCollision
	ld a, b
	and a
	ret nz
	call ApplyWalkVelocity_Left
	call SubXOffset
	jr .asm_1b36d
; 0x1b3a0

HandleLadderInput: ; 1b3a0 (6:73a0)
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
	farcall CheckUpCollision
	ld a, [wced2]
	and a
	ret nz
	ld b, $01
	call SubYOffset
	ld a, [wCameraConfigFlags]
	and CAMCONFIG_SCROLLING_MASK
	cp CAMCONFIG_TRANSITIONS
	jr c, .asm_1b3e6
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr nc, .asm_1b3e6
	jp StartUpwardsFloorTransition

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
	ld a, [wCameraConfigFlags]
	and CAMCONFIG_SCROLLING_MASK
	cp CAMCONFIG_TRANSITIONS
	jr c, .asm_1b42b
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .asm_1b42b
	jr c, .asm_1b42b
	jp StartDownwardsFloorTransition

.asm_1b42b
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	jr z, .asm_1b45d
	farcall CheckCentreCollision
	ld a, b
	and a
	ret z
	ld a, [wXPosLo]
	and $f0
	add $08
	ld [wXPosLo], a
	ret

.asm_1b45d
	farcall CheckCentreCollision
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
	ld a, -16
	ld [wCollisionBoxLeft], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_1b4eb
.asm_1b4c6
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	jp SetState_GettingOffLadder

.asm_1b4d3
	ld a, 16
	ld [wCollisionBoxRight], a
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_1b4c6
.asm_1b4eb
	ld a, -9
	ld [wCollisionBoxLeft], a
	ld a, 9
	ld [wCollisionBoxRight], a
	ret
; 0x1b4f6
