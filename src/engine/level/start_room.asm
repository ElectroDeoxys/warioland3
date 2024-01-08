StartRoom_FromTransition:
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_MASK
	cp ROOMTRANSITION_GOLF
	jr nz, .not_golf

	; enter Golf minigame
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wAnimatedTilesFrameDuration]
	ld [wTempAnimatedTilesFrameDuration], a
	ld a, [wAnimatedTilesGfx]
	ld [wTempAnimatedTilesGroup], a
	pop af
	ldh [rSVBK], a
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld hl, wState
	ld [hl], ST_GOLF
	xor a
	ld [wSubState], a
	ret

.not_golf
	call DisableLCD
	farcall DespawnAllObjects

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall Func_61f2a
	pop af
	ldh [rSVBK], a

	ld a, $00
	sramswitch
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_MASK
	cp ROOMTRANSITION_TELEPORT
	jr nz, .not_teleport
	ld a, $01
	ld [wWarioYPos + 0], a
	xor a
	ld [wWarioXPos + 0], a
.not_teleport
	ld a, [wWarioYPos + 1]
	sub $10
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld [wWarioYPos + 0], a
	ld b, a
	swap b
	ld a, [wWarioXPos + 0]
	or b
	ld [wca6c], a

	; get next room ID from Wario's position
	ld hl, wWarioPos
	call GetNextInternalRoomID

	xor a
	ld [wFloorTransitionDir], a
	ld [wFloorTransitionTimer], a
	ld [wc0c2], a
	ld [wc0c3], a
	ld [wc0be], a
	ld [wc0bd], a
	ld [wGroundShakeCounter], a
	ld [wSCYShake], a
	ld a, [wInternalRoomID]
	ld [wTempInternalRoomID], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call LoadRoom
	pop af
	ldh [rSVBK], a

	call FillBGMap0_With7f
	call ClearVirtualOAM
	call ClearParticles
	call SetWarioPositionToSpawn
	call Func_8ad9
	call Func_8c12
	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONF_2_F, a
	jr z, .asm_854a
	call Func_edb
.asm_854a
	xor a
	ld [wRoomTransitionParam], a
	call Func_bc5e
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_8cd7
	pop af
	sramswitch
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_896f
	pop af
	sramswitch
	call SetWarioScreenPos

	ld a, [wWarioState]
	cp WST_ENTERING_DOOR
	jr nz, .asm_85a7
	xor a
	ld [wFrameDuration], a
	ld [wAnimationFrame], a

	ld a, HIGH(Frameset_14d18)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d18)
	ld [wFramesetPtr + 1], a
	ld a, BANK("Wario OAM 1")
	ldh [hCallFuncBank], a
	hcall UpdateAnimation

.asm_85a7
	call UpdateLevelMusic
	xor a ; FALSE
	ld [wc0da], a
	ld [wIsFloorTransition], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a
	call DrawWario
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a
	xor a
	ld [wIsIntangible], a
	ld a, $02
	ld [wSubState], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ret

Func_861c:
	call .Func_867f
	farcall UpdateParticles

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a

	call ClearUnusedVirtualOAM

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	di
	call Func_b681
	ei
	pop af
	sramswitch
	ret

.Func_867f:
	ld a, [wceda]
	and $0f
	add $10
	ld [wceda], a
	and $08
	ld [wcede], a
.loop
	ld a, [wceda]
	and $07
	dec a
	jr z, .asm_86c1
	dec a
	jr z, .asm_86d8
	dec a
	jr z, .asm_86ef
	ld a, [wcedc]
	inc a
	ld h, a
	ld [wYCell], a
	cp $c0
	ld a, [wcedb]
	jr nz, .asm_86b5
	ld a, $a0
	ld h, a
	ld [wYCell], a
	ld a, [wcedb]
	inc a
.asm_86b5
	ld [wFloorSRAMBank], a
	ld a, [wcedd]
	ld l, a
	ld [wXCell], a
	jr .asm_8712
.asm_86c1
	ld a, [wcedb]
	ld [wFloorSRAMBank], a
	ld a, [wcedc]
	ld h, a
	ld [wYCell], a
	ld a, [wcedd]
	inc a
	ld l, a
	ld [wXCell], a
	jr .asm_8712
.asm_86d8
	ld a, [wcedb]
	ld [wFloorSRAMBank], a
	ld a, [wcedd]
	dec a
	ld l, a
	ld [wXCell], a
	ld a, [wcedc]
	ld h, a
	ld [wYCell], a
	jr .asm_8712
.asm_86ef
	ld a, [wcedc]
	dec a
	ld h, a
	ld [wYCell], a
	cp $9f
	ld a, [wcedb]
	jr nz, .asm_8708
	ld a, $bf
	ld h, a
	ld [wYCell], a
	ld a, [wcedb]
	dec a
.asm_8708
	ld [wFloorSRAMBank], a
	ld a, [wcedd]
	ld l, a
	ld [wXCell], a
.asm_8712
	ld a, [wceda]
	and $f8
	ld [wceda], a
	farcall Func_18000
	ld a, [wceda]
	and $07
	jr nz, .asm_8733
	jp .asm_8739 ; can be jr
.asm_8733
	call Func_bb85
	jp .loop

.asm_8739
	xor a
	ld [wceda], a
	ld [wIsFloorTransition], a
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret

StartRoom_FromLevelStart:
	xor a ; FALSE
	ld [wIsBossBattle], a
	ld a, [wceef]
	and %00111100
	jp nz, .asm_87e2

	xor a
	ld [wInternalRoomID], a
	ld [wca6c], a
	ld [wTempInternalRoomID], a

	xor a
	ld [wLevelEndScreen], a
	ld [wNumMusicalCoins], a
	ld [wFloorTransitionDir], a
	ld [wFloorTransitionTimer], a
	ld [wc0c2], a
	ld [wc0c3], a
	ld [wc0be], a
	ld [wc0bd], a
	ld [wIsIntangible], a
	ld [wInvincibleCounter], a
	ld [wIsMinigameCleared], a
	ld [wIsRolling], a
	ld [wIsGettingOffLadder], a
	ld [wca66], a
	ld [wca6a], a
	ld [wLevelTime + 0], a
	ld [wLevelTime + 1], a
	ld [wLevelTime + 2], a
	ld [wcac3], a
	ld [wSwimVelIndex], a
	ld [wWaterSurfaceFloatingCounter], a
	call ClearTransformationValues
	; assumes ClearTransformationValues returns with a = 0
	ld [wInvisibleFrame], a
	ld [wcac8], a
	ld [wIsOnSteppableObject], a
	ld [wGroundShakeCounter], a
	ld [wSCYShake], a
	ld [wSwimmingDirectionInput], a
	ld [wAnimatedTilesFrameDuration], a
	ld [wRoomPalCycleDuration], a
	ld [wRoomAnimatedTilesEnabled], a
	ld [wRoomAnimatedPalsEnabled], a
	ld [wWaterCurrent], a
	ld [wLastWaterCurrent], a
	ld [wCurWaterCurrent], a

	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	farcall Func_61f10
	pop af
	ldh [rSVBK], a
	jr .load_layout

.asm_87e2
	ld a, [wTempInternalRoomID]
	ld [wInternalRoomID], a
	call LoadWarioGfx

.load_layout
	call LoadLevelLayoutAndObjects

	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call LoadRoom
	pop af
	ldh [rSVBK], a

	ld a, [wceef]
	and %00111100
	jr nz, .asm_883a
	call SetWarioPositionToSpawn
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

	farcall SetState_Idling

	ld hl, Pals_c800
	ld a, h
	ld [wWarioPalsPtr + 0], a
	ld a, l
	ld [wWarioPalsPtr + 1], a
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK(Pals_c800)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short
	jr .asm_8861

.asm_883a
	ld a, [wWarioPalsPtr + 0]
	ld h, a
	ld a, [wWarioPalsPtr + 1]
	ld l, a
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK(Pals_c800)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short

	ld hl, wcaa1
	ld de, wTempPals2 palette 4
	ld b, 4 palettes
	call CopyHLToDE

.asm_8861
	ld hl, Pals_d1fe
	ld de, wTempPals2 palette 2
	ld b, 1 palettes
	ld a, BANK(Pals_d1fe)
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short

	call Func_8ad9
	call Func_8c12
	call VBlank_b672
	call Func_b681

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_8cd7
	pop af
	sramswitch

	ld a, [wceef]
	and %00111100
	jr nz, .asm_88b7
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	call Func_896f
	pop af
	sramswitch

.asm_88b7
	ld a, [wLevel]
	cp THE_TEMPLE
	jr nz, .not_the_temple

	xor a
	ld a, [wCameraSCY + 1]
	ld [wc08a], a
	ld [wc089], a
	ld [wSCY], a
	ldh [rSCY], a
	ld a, [wCameraSCX + 1]
	ld [wc08c], a
	ld [wc08b], a
	ld [wSCX], a
	ldh [rSCX], a

.not_the_temple
	call SetWarioScreenPos
	xor a ; FALSE
	ld [wc0da], a

	ld a, [wceef]
	and %00111100
	jr nz, .asm_8917
	xor a ; FALSE
	ld [wIsFloorTransition], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a

	farcall UpdateObjects
	farcall UpdateObjects

	pop af
	ldh [rSVBK], a
	jr .asm_8935

.asm_8917
	ld a, TRUE
	ld [wIsFloorTransition], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall UpdateObjects
	pop af
	ldh [rSVBK], a

.asm_8935
	xor a ; FALSE
	ld [wIsFloorTransition], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_NoPriority
	pop af
	ldh [rSVBK], a

	call DrawWario
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall DrawObjects_WithPriority
	pop af
	ldh [rSVBK], a
	ret

Func_896f:
	ld de, wc0a5 + 1
	ld hl, hXPosLo
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hl], a
	call Func_cc0
	ld c, $01
	ld a, [wSpawnYCell]
	cp $c0
	jr c, .asm_8996
	inc c
	sub $20
	cp $c0
	jr c, .asm_8996
	inc c
	sub $20
.asm_8996
	ld h, a
	ld a, c
	ld [wccec], a
	sramswitch
	ld a, $01
	ld [wccef], a
	ld b, a
	ld d, $10
.asm_89a9
	ld e, $08
.asm_89ab
	ld a, [hl]
	and $f0
	swap a
	call nz, .Func_89e2
	ld a, b
	xor $01
	ld b, a
	ld a, [hl]
	and $0f
	call nz, .Func_89e2
	inc l
	ld a, b
	xor $01
	ld b, a
	dec e
	jr nz, .asm_89ab
	ld a, l
	sub $08
	ld l, a
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_89de
	ld h, $a0
	ld a, [wccec]
	inc a
	ld [wccec], a
	sramswitch
.asm_89de
	dec d
	jr nz, .asm_89a9
	ret

.Func_89e2:
	cp $0f
	ret nc
	ld c, a
	ld a, [wc0c7]
	dec a
	cp l
	ret c
	ld a, [wc0c6]
	cp l
	jr z, .asm_89f3
	ret nc

.asm_89f3
	ld a, [wccec]
	dec a
	jr nz, .asm_8a08
	ld a, [wc0c4]
	dec a
	cp h
	ret c
	ld a, [wc0c5]
	cp h
	jr z, .asm_8a19
	ret nc
	jr .asm_8a19

.asm_8a08
	ld a, [wc0c4]
	sub $20
	dec a
	cp h
	ret c
	ld a, [wc0c5]
	sub $20
	cp h
	jr z, .asm_8a19
	ret nc

.asm_8a19
	push de
	push bc
	call Func_cf8
	push hl
	call Func_d81
	ld d, h
	ld e, l
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall SpawnObject
	pop af
	ldh [rSVBK], a
	pop hl
	pop bc
	pop de
	ret

SetWarioPositionToSpawn:
	ld hl, hXPosLo
	xor a
	ld [hld], a ; hXPosLo
	ld a, [wSpawnPos]
	and $0f
	ld [hld], a ; hXPosHi
	xor a
	ld [hld], a ; hYPosLo
	ld a, [wSpawnPos]
	and $f0
	swap a
	ld [hl], a ; hYPosHi
	call Func_cc0

	ld c, $01
	ld a, [wSpawnYCell]
	cp $c0
	jr c, .asm_8a6c
	inc c
	sub $20
	cp $c0
	jr c, .asm_8a6c
	inc c
	sub $20
.asm_8a6c
	ld h, a
	ld a, c
	ld [wccec], a
	sramswitch

.asm_8a77
	ld e, $08
.asm_8a79
	ld a, [hl]
	and $f0
	swap a
	cp $0f
	jr nc, .asm_8ab0
	ld a, b
	xor $01
	ld b, a

	ld a, [hl]
	and $0f
	cp $0f
	jr nc, .asm_8ab0
	inc l
	ld a, b
	xor $01
	ld b, a

	dec e
	jr nz, .asm_8a79

	ld a, l
	sub $08
	ld l, a
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_8a77
	ld h, $a0
	ld a, [wccec]
	inc a
	ld [wccec], a
	sramswitch
	jr .asm_8a77

.asm_8ab0
	ld c, a
	call Func_cf8
	update_pos

	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip_floor_update
	ld a, [wceef]
	and %00111100
	jr nz, .skip_floor_update
	call UpdateFloor
.skip_floor_update
	ret

Func_8ad9:
	xor a
	ld [wc0b5], a
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_XSCROLL2 | CAM_TRANSITIONS
	jr z, .cam_xscroll_or_cam_yscroll
	cp CAM_YSCROLL
	jr nz, .else
.cam_xscroll_or_cam_yscroll
	ld a, [wWarioXPos + 0]
	ld [wCameraSCX + 0], a
	ld a, $30
	ld [wCameraSCX + 1], a
	jr .asm_8b69

.else
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir_left
	ld a, [wca60]
	sub 8
	ld b, a
	jr .asm_8b0b
.dir_right
	ld a, [wca5f]
	sub 8
	ld b, a
.asm_8b0b
	ld a, [wWarioXPos + 1]
	sub b
	ld [wCameraSCX + 1], a
	ld l, a
	ld a, [wWarioXPos + 0]
	sbc $00
	ld [wCameraSCX + 0], a
	ld h, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	jr z, .asm_8b27
	ld de, -$20
	add hl, de
.asm_8b27
	ld a, [wc0b8]
	ld b, a
	ld a, h
	bit 7, a
	jr nz, .asm_8b39
	cp b
	jr c, .asm_8b39
	jr nz, .asm_8b44
	; h > b
	ld a, l
	and a
	jr nz, .asm_8b44
.asm_8b39
	ld a, b
	ld [wCameraSCX + 0], a
	ld a, $01
	ld [wc0b5], a
	jr .asm_8b69
.asm_8b44
	ld hl, wCameraSCX
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, $a0
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	jr z, .asm_8b56
	ld e, $c0
.asm_8b56
	add hl, de
	ld a, [wc0b9]
	ld b, a
	ld a, h
	cp b
	jr c, .asm_8b69
	ld a, b
	dec a
	ld [wCameraSCX + 0], a
	ld a, $ff
	ld [wc0b5], a

.asm_8b69
	ld a, [wceef]
	and %00111100
	jr z, .asm_8b78
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret nc

.asm_8b78
	xor a
	ld [wcac8], a

	ld a, [wWarioYPos + 1]
	sub $60
	ld [wCameraSCY + 1], a
	ld l, a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld [wCameraSCY + 0], a
	ld h, a
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	jr z, .asm_8b99
	ld de, -$20
	add hl, de

.asm_8b99
	ld a, [wc0b7]
	ld b, a
	ld a, h
	bit 7, a
	jr nz, .asm_8bab
	cp b
	jr c, .asm_8bab
	jr nz, .asm_8bb5
	ld a, l
	and a
	jr nz, .asm_8bb5
.asm_8bab
	ld a, b
	ld [wCameraSCY + 0], a
	ld a, $01
	ld [wcac8], a
	ret
.asm_8bb5
	ld hl, wCameraSCY
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, $90
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	jr z, .asm_8bc7
	ld e, $b0
.asm_8bc7
	add hl, de
	ld a, [wc0b6]
	ld b, a
	ld a, h
	cp b
	jr c, .asm_8bdb
	ld a, b
	dec a
	ld [wCameraSCY + 0], a
	ld a, $ff
	ld [wcac8], a
	ret
.asm_8bdb
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	ret c
	ld a, [wWarioYPos + 1]
	cp $80
	jr nc, .asm_8c0c
	ld a, [wc0b7]
	ld b, a
	ld a, [wWarioYPos + 0]
	dec a
	ld [wCameraSCY + 0], a
	cp b
	jr c, .asm_8bab
	bit 7, a
	jr z, .asm_8c06

	xor a
	ld [wCameraSCY + 0], a
	ld a, $01
	ld [wcac8], a
	ret

.asm_8c06
	ld a, $e8
	ld [wCameraSCY + 1], a
	ret

.asm_8c0c
	ld a, $68
	ld [wCameraSCY + 1], a
	ret

Func_8c12:
	ld a, [wCameraSCY + 0]
	ld h, a
	ld a, [wCameraSCY + 1]
	ld l, a
	ld a, [wcac8]
	cp $01
	jr z, .asm_8c38
	cp $ff
	jr z, .asm_8c54

	ld a, l
	ldh [rSCY], a
	ld [wSCY], a
	sub $18
	ld [wc0a3 + 1], a
	ld a, h
	sbc $00
	ld [wc0a3 + 0], a
	jr .asm_8c70

.asm_8c38
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_UP_F, a
	ld a, $00
	jr z, .asm_8c43
	ld a, $20
.asm_8c43
	ld [wCameraSCY + 1], a
	ldh [rSCY], a
	ld [wSCY], a
	ld [wc0a3 + 1], a
	ld a, h
	ld [wc0a3 + 0], a
	jr .asm_8c70

.asm_8c54
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_DOWN_F, a
	ld a, $68
	jr z, .asm_8c5f
	ld a, $48
.asm_8c5f
	ld [wCameraSCY + 1], a
	ldh [rSCY], a
	ld [wSCY], a
	sub $20
	ld [wc0a3 + 1], a
	ld a, h
	ld [wc0a3 + 0], a
.asm_8c70
	ld a, [wCameraSCX + 0]
	ld h, a
	ld a, [wCameraSCX + 1]
	ld l, a
	ld a, [wc0b5]
	cp $01
	jr z, .asm_8c9f
	cp $ff
	jr z, .asm_8cba
	ld a, l
	ldh [rSCX], a
	ld [wSCX], a
	sub $10
	ld [wc0a5 + 1], a
	ld a, h
	sbc $00
	ld [wc0a5 + 0], a
	bit 7, a
	ret z
	xor a
	ld [wc0a5 + 1], a
	ld [wc0a5 + 0], a
	ret

.asm_8c9f
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_LEFT_F, a
	ld a, $00
	jr z, .asm_8caa
	ld a, $20
.asm_8caa
	ld [wCameraSCX + 1], a
	ldh [rSCX], a
	ld [wSCX], a
	ld [wc0a5 + 1], a
	ld a, h
	ld [wc0a5 + 0], a
	ret

.asm_8cba
	ld a, [wCameraConfigFlags]
	bit CAM_BORDER_RIGHT_F, a
	ld a, $60
	jr z, .asm_8cc5
	ld a, $40
.asm_8cc5
	ld [wCameraSCX + 1], a
	ldh [rSCX], a
	ld [wSCX], a
	sub $28
	ld [wc0a5 + 1], a
	ld a, h
	ld [wc0a5 + 0], a
	ret

Func_8cd7:
	ld hl, wc0a3
	ld de, wc0a7
	ld a, [hli] ; wc0a3
	ld [de], a  ; wc0a7
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli] ; wc0a5
	ld [de], a  ; wc0a9
	inc de
	ld a, [hl]
	ld [de], a

	ld a, $20
	ld [wc0a2], a
.asm_8ced
	call .Func_8d69
	ld a, [wccf0 + 0]
	ld d, a
	ld a, [wccf0 + 1]
	ld e, a
	ld hl, wce01
	ld b, $20
.asm_8cfd
	ld a, [hli]
	ld [de], a
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	cp $9c
	jr nz, .asm_8d0d
	ld d, $98
.asm_8d0d
	dec b
	jr nz, .asm_8cfd

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [wccf0 + 0]
	ld d, a
	ld a, [wccf0 + 1]
	ld e, a
	ld hl, wce35
	ld b, $20
.asm_8d21
	ld a, [hli]
	ld [de], a
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	cp $9c
	jr nz, .asm_8d31
	ld d, $98
.asm_8d31
	dec b
	jr nz, .asm_8d21

	xor a
	ldh [rVBK], a
	xor a
	ld [wce69], a
	ld [wce00], a
	ld a, [wc0a5 + 1]
	add $08
	ld [wc0a5 + 1], a
	ld a, [wc0a5 + 0]
	adc $00
	ld [wc0a5 + 0], a
	ld a, [wc0a2]
	dec a
	ld [wc0a2], a
	jr nz, .asm_8ced
	ld hl, wc0a7
	ld de, wc0a3
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
	ret

.Func_8d69:
	call Func_8e5b
	ld a, [wce69]
	ld b, a
	ld de, wce6a
	ld a, e
	add b
	ld e, a
	ld b, $20
.asm_8d78
	ld a, h
	ld [de], a
	inc e
	ld a, l
	ld [de], a
	inc e
	push de
	ld de, $20
	add hl, de
	pop de
	ld a, h
	and $fb
	ld h, a
	dec b
	jr nz, .asm_8d78
	ld a, [wce69]
	add $40
	ld [wce69], a
	ld hl, wc0a3
	call GetCell
	ld a, [wFloorSRAMBank]
	sramswitch
	ld a, [wc0a5 + 1]
	and $08
	jr z, .asm_8dd4

	push hl
	farcall Func_21f51
	pop hl

	ld a, [wFloorSRAMBank]
	sramswitch
	farcall Func_22012
	jr .asm_8dfd

.asm_8dd4
	push hl
	farcall Func_220fc
	pop hl

	ld a, [wFloorSRAMBank]
	sramswitch
	farcall Func_221bb
.asm_8dfd
	ld a, [wce00]
	add $20
	ld [wce00], a
	ret
