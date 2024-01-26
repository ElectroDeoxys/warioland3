GetBlockPtr::
; y position
	; computes value, given 2-byte y coordinate in [hl]
	; transforms 2-byte value 0xXWYZ into 1-byte value 0xWY
	ld a, [hli] ; hi
	ld d, a
	ld a, [hli] ; lo
	swap a
	and $0f ; high nybble
	ld b, a
	ld a, d
	and $0f ; low nybble
	swap a
	add b

	ld b, BANK("SRAM1")
	add HIGH(STARTOF(SRAM))
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .got_sram_bank
	inc b
	sub $20
	cp HIGH(STARTOF(SRAM) + SIZEOF(SRAM))
	jr c, .got_sram_bank
	inc b
	sub $20
.got_sram_bank
	ld [wBlockPtr + 0], a
	ld a, b
	ld [wBlockPtrBank], a

; x position
	; computes value, given 2-byte x coordinate in [hl]
	; transforms 2-byte value 0xXWYZ into 1-byte value 0xWY
	ld a, [hli] ; hi
	ld d, a
	ld a, [hl] ; lo
	swap a
	and $0f ; high nybble
	ld l, a
	ld a, d
	and $0f ; low nybble
	swap a
	add l
	ld l, a
	ld [wBlockPtr + 1], a

	ld a, [wBlockPtr + 0]
	ld h, a
	ret

; hl = block ptr
GetBlockPtrPtrBGMapAddress::
	ld a, h
	sub HIGH(STARTOF(SRAM))
	ld e, a
	ld d, $00
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d ; *$40
	ld a, d
	and $03
	ld d, a
	ld a, l
	and $0f
	add a
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ret

DoPendingDMATransfer::
	ld a, [wIsDMATransferPending]
	and a
	jr nz, .dma_transfer

	xor a
	ld [rRAMB + $100], a
	ld hl, wSCYShake
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

; write tiles in wBGMapTileVRAM0Queue to the
; corresponding addresses in wBGMapAddressQueue
	ld hl, wBGMapAddressQueue
	ld bc, wBGMapTileVRAM0Queue
	jp wVBlankFunc + $10

.dma_transfer
	ld hl, wPendingDMASourceBank
	ld a, [hli]
	ld [rROMB0 + $100], a
	ld c, LOW(rHDMA1)
	ld a, [hli] ; wPendingDMASourcePtr
	ld [$ff00+c], a ; rHDMA1
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rHDMA2
	ld a, [hli] ; wPendingDMADestinationBank
	ldh [rVBK], a
	inc c
	ld a, [hli] ; wPendingDMADestinationPtr
	ld [$ff00+c], a ; rHDMA3
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rHDMA4
	inc c
	ld a, [hl] ; wPendingDMALength
	ld [$ff00+c], a ; rHDMA5

	xor a
	ld [wIsDMATransferPending], a
	ld hl, wSCYShake
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

	xor a
	ld [wBGMapTileQueueSize], a
	ld [wBGMapAddressQueueSize], a
	ret

Func_cab::
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wBGMapAddressQueue
	ld bc, wBGMapTileVRAM1Queue
	jp wVBlankFuncExtended

Func_cb8::
	xor a
	ld [wBGMapTileQueueSize], a
	ld [wBGMapAddressQueueSize], a
	ret

; input:
; - hl = hPos
; output:
; - l = x block
; - h = y block
; - b = ?
Func_cc0::
	ld a, [hli]
	ld d, a
	ld a, [hli]
	swap a
	and $0f
	ld c, a
	ld a, d
	and $0f
	swap a
	add c
	add HIGH(STARTOF(SRAM))
	ld c, a
	ld [wSpawnYBlock], a

	ld a, [hli]
	ld d, a
	ld a, [hl]
	swap a
	and $0f
	ld l, a
	ld a, d
	and $0f
	swap a
	add l
	srl a
	ld l, a
	ld a, $00
	adc $00
	xor $01
	ld [wccef], a
	ld b, a

	ld a, l
	add $b0
	ld l, a
	ld [wSpawnXBlock], a
	ld h, c
	ret

Func_cf8::
	push hl
	ld a, h
	sub HIGH(STARTOF(SRAM))
	ld h, a
	and $f0
	swap a
	ld d, a
	ld a, [wccec]
	dec a
	add a
	add d
	ldh [hYPosHi], a
	ld a, h
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc 0
	ldh [hYPosHi], a

	ld a, b
	xor $01
	add a
	add a
	add a
	add a ; *16
	add $08
	ld d, a
	ld a, l
	sub $b0
	add a
	ld l, a
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, l
	and $0f
	swap a
	add d
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc 0
	ldh [hXPosHi], a
	pop hl
	ret

Func_d3e::
	ld a, h
	sub HIGH(STARTOF(SRAM))
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, [wBlockPtrBank]
	dec a
	add a
	add b
	ldh [hYPosHi], a
	ld a, d
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	ld a, l
	sub $00
	ld e, a
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, e
	and $0f
	swap a
	add $08
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc $00
	ldh [hXPosHi], a
	ld a, l
	and $01
	xor $01
	ld b, a
	ld [wccef], a
	ret

Func_d81::
	ld a, l
	sub $b0
	add a
	ld l, a
	ld a, b
	xor $1
	add l
	ld l, a
	ret

Func_d8c::
	ld a, [wBlockPtrBank]
	ld [wccec], a
	ld b, $01
	ld a, l
	srl a
	jr nc, .asm_d9a
	dec b
.asm_d9a
	add $b0
	ld l, a
	ret

; draws Wario on screen unless he's invisible
DrawWario::
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr nz, .invincible
; show Wario if wInvisibleFrame
; has upper 4 bits set and bit 2 unset
	ld hl, wInvisibleFrame
	inc [hl]
	ld a, [hl]
	and %11110010
	cp %11110000
	jr z, .show_wario
	ret

.invincible
; show Wario if wInvisibleFrame is 0
	ld a, [wInvisibleFrame]
	and a
	ret nz

.show_wario
	ld a, [wOAMBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wOAMPtr + 0]
	ld h, a
	ld a, [wOAMPtr + 1]
	ld l, a
	ld a, [wWarioScreenYPos]
	ld [wCurSpriteYCoord], a
	ld a, [wWarioScreenXPos]
	ld [wCurSpriteXCoord], a
	ld a, [wca65]
	ld [wCurSpriteFrame], a
	ld a, [wca66]
	ld [wCurSpriteAttributes], a
	call AddSprite
	pop af
	bankswitch
	ret

; hl = OAM data pointer
; given an OAM pointer and a frame index in wCurSpriteFrame
; goes through each tile element and adds them to virtual OAM
AddSprite::
	ld a, [wCurSpriteFrame]
	ld d, $00
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXCoord
	ld a, [hld]
	ld c, a    ; wCurSpriteXCoord
	ld a, [hld]
	ld b, a    ; wCurSpriteYCoord
	ld l, [hl] ; wVirtualOAMByteSize
	ld h, HIGH(wVirtualOAM)
.loop
	ld a, l
	cp OAM_COUNT * SPRITEOAMSTRUCT_LENGTH
	ret nc
	ld a, [de]
	cp $80
	ret z ; finished

	ld a, [de] ; SPRITEOAMSTRUCT_YCOORD
	add b
	ld [hli], a
	inc de
	ld a, [de] ; SPRITEOAMSTRUCT_XCOORD
	add c
	ld [hli], a
	inc de
	ld a, [de] ; SPRITEOAMSTRUCT_TILE_ID
	ld [hli], a
	inc de
	push hl
	ld hl, wCurSpriteAttributes
	ld a, [de] ; SPRITEOAMSTRUCT_ATTRIBUTES
	xor [hl]
	pop hl
	ld [hli], a
	ld a, l
	ld [wVirtualOAMByteSize], a
	inc de
	jr .loop

Func_e2b::
	ld a, [wCurObjFlags]
	bit OBJFLAG_ON_SCREEN_F, a
	ret z
;	fallthrough

Func_e31::
	ld a, [wBlockPtrBank]
	dec a
	add a
	add a
	add a
	add a
	add a
	add h ; = h + (wBlockPtrBank - 1) * $20
	ld b, a
	ld c, l
	ld hl, wc18e
	ld a, [wc19e]
	ld e, a
	ld d, $00
	add hl, de
	ld a, b
	ld [hli], a
	ld [hl], c
	ld a, e
	add 2
	and $0f
	ld [wc19e], a
	ret

UpdateAnimation::
	ld a, [wFramesetPtr + 0]
	ld d, a
	ld a, [wFramesetPtr + 1]
	ld e, a

	xor a ; FALSE
	ld [wAnimationEnded], a
	ld hl, wFrameDuration
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc ; return if duration hasn't elapsed yet

	ld a, [hl] ; wAnimationFrame
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .finished

; next frame
	ld [wca65], a
	ld a, [hl] ; wAnimationFrame
	add 2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; wFrameDuration
	ret

.finished
	xor a
	ld [hld], a ; wAnimationFrame
	ld [hl], a ; wFrameDuration
	ld a, TRUE
	ld [wAnimationEnded], a
	ret

Func_e87::
	jp Init

LoadLevelLayoutAndObjects::
	ld d, $00
	ld a, [wLevel]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelHeaders
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(LevelHeaders)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jr z, Func_e87 ; null

	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 1], a
	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 0], a
	ld a, [hl]
	ld [wTempBank], a
	push hl
	call DecompressLevelLayout
	pop hl
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 1], a
	ld a, [hl]
	ld [wCompressedLevelLayoutPtr + 0], a
	pop af
	bankswitch

	push hl
	ld a, [wceef]
	and $3c
	jr nz, .skip_loading_objects
	call DecompressLevelObjectsMap
.skip_loading_objects
	pop hl
	ret

Func_edb::
	ld d, $00
	ld a, [wLevel]
	add a ; *2
	ld e, a
	rl d
	ld hl, LevelHeaders
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(LevelHeaders)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	inc a
	jp z, Func_e87 ; null

	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 1], a
	ld a, [hli]
	ld [wCompressedLevelLayoutPtr + 0], a
	ld a, [hl]
	ld [wTempBank], a
	pop af
	bankswitch
	call Func_f13
	ret

Func_f13::
	ld a, [wceef]
	and $3c
	ret nz
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCompressedLevelLayoutPtr + 0]
	ld d, a
	ld a, [wCompressedLevelLayoutPtr + 1]
	ld e, a
	call Func_f4c
	pop af
	bankswitch
	pop af
	sramswitch
	ret

Func_f4c::
	ld c, HIGH(STARTOF(SRAM))
	ld hl, s0a000
.asm_f51
	ld a, [de]
	and a
	ret z
	bit 7, a
	jr nz, .asm_f85
	ld b, a
	inc de
	ld a, [de]
	and $80
	ld [wRepeatByte], a
	inc de
.asm_f61
	ld a, [wRepeatByte]
	or [hl]
	ld [hli], a
	ld a, l
	cp c
	jr z, .asm_f6f
.asm_f6a
	dec b
	jr nz, .asm_f61
	jr .asm_f51
.asm_f6f
	ld l, $00
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_f83
	ld h, HIGH(STARTOF(SRAM))
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_f83
	jr .asm_f6a
.asm_f85
	and $7f
	ld b, a
	inc de
.asm_f89
	ld a, [de]
	and $80
	or [hl]
	ld [hli], a
	inc de
	ld a, l
	cp c
	jr z, .asm_f98
.asm_f93
	dec b
	jr nz, .asm_f89
	jr .asm_f51
.asm_f98
	ld l, $00
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_f93
	ld h, HIGH(STARTOF(SRAM))
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .asm_f93

InitAudio::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_InitAudio
	pop af
	ldh [rSVBK], a
	ret

; bc = sound ID
Func_fbc::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f06
	pop af
	ldh [rSVBK], a
	ret

; bc = sound ID
PlaySFX::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlaySFX
	pop af
	ldh [rSVBK], a
	ret

; unreferenced
Func_fd8:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f12
	pop af
	ldh [rSVBK], a
	ret

; bc = sound ID
Func_fe6::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f18
	pop af
	ldh [rSVBK], a
	ret

; bc = sound ID
Func_ff4::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f1e
	pop af
	ldh [rSVBK], a
	ret

Func_1002::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f24
	pop af
	ldh [rSVBK], a
	ret

; unreferenced
Func_1010:
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	call Func_3f2a
	pop af
	ldh [rSMBK], a
	ret

; unreferenced
Func_101e:
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	call Func_3f30
	pop af
	ldh [rSMBK], a
	ret

Func_102c::
	ldh [hffac], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	ldh a, [hffac]
	call Func_3f36
	pop af
	ldh [rSVBK], a
	ret

; unreferenced
Func_103e:
	ldh [hffac], a
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	ldh a, [hffac]
	call Func_3f3c
	pop af
	ldh [rSMBK], a
	ret

; unreferenced
Func_1050:
	ldh [hffac], a
	ldh a, [rSMBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSMBK], a
	ldh a, [hffac]
	call Func_3f42
	pop af
	ldh [rSMBK], a
	ret

; bc = sound ID
PlayNewMusic_SetNoise::
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlayNewMusic_SetNoise
	pop af
	ldh [rSVBK], a
	ret

PlayRecoverySFX::
	play_sfx SFX_RECOVERY
	ret

ClearTransformationValues::
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BLIND
	call z, .RestoreBlindPalettes

	xor a
	ld [wInvincibleCounter], a
	ld [wTransformation], a
	ld [wWarioTransformationProgress], a
	ld [wStingTouchState], a
	ld [wTouchState], a
	ld [wca94], a
	ld [wIsIntangible], a
	ld [wTransformationDuration + 0], a
	ld [wTransformationDuration + 1], a
	ld [wAutoMoveState], a
	ld [wInvisibleFrame], a
	ld [wSwimmingDirectionInput], a
	ret

; restores the palettes after
; recovering from Blind transformation
.RestoreBlindPalettes
	ld hl, wTempPals1
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ld b, 8
	ld c, LOW(rBCPD)

.wait_lcd_on_bg
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on_bg
.wait_lcd_off_bg
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off_bg

REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR

	dec b
	jr nz, .wait_lcd_on_bg

	ld hl, wTempPals2 palette 3
	ld a, OCPSF_AUTOINC | $18
	ldh [rOCPS], a
	ld b, 4
	ld c, LOW(rOCPD)

.wait_lcd_on_ob
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on_ob
.wait_lcd_off_ob
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off_ob

REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR

	dec b
	jr nz, .wait_lcd_on_ob
	ret

; unreferenced
Func_10fc:
	ld a, c
	ld b, $00
	ld hl, 0
	ld de, $9c
.loop_1
	cp 100
	jr c, .asm_110e
	add hl, de
	sub 100
	jr .loop_1
.asm_110e
	ld b, $00
	ld de, $6
.loop_2
	cp 10
	jr c, .asm_111c
	add hl, de
	sub 10
	jr .loop_2
.asm_111c
	add hl, bc
	ret

; unreferenced
Func_111e:
	push hl
	ld a, h
	ld hl, 0
	ld de, -$9c
.loop_1
	and a
	jr z, .asm_112d
	add hl, de
	dec a
	jr .loop_1
.asm_112d
	ld b, h
	ld c, l
	pop hl
	push hl
	ld a, l
	ld hl, $0
	ld de, -$6
.loop_2
	cp 16
	jr c, .asm_1141
	add hl, de
	sub 16
	jr .loop_2
.asm_1141
	add hl, bc
	pop de
	add hl, de
	ld c, l
	ret

UpdateFloor::
	call GetFloorForYPos
	ld a, c
	ld [wFloor], a
	ret

; returns in c:
; 6 if   $0 <= ypos <  $80
; 5 if  $80 <= ypos < $100
; 4 if $100 <= ypos < $180
; 3 if $180 <= ypos < $200
; 2 if $200 <= ypos < $280
; 1 if $280 <= ypos < $300
GetFloorForYPos::
	ld a, [wWarioYPos + 0]
	dec a
	jr z, .asm_115b ; == 1
	dec a
	jr z, .asm_115f ; == 2
	ld c, 5
	jr .asm_1161
.asm_115b
	ld c, 3
	jr .asm_1161
.asm_115f
	ld c, 1

.asm_1161
	ld a, [wWarioYPos + 1]
	cp $80
	ret nc
	; < $80
	inc c
	ret

HandleDownwardsFloorTransition::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .skip
	jr c, .skip
	jr StartDownwardsFloorTransition
.skip
	ret

; unreferenced?
Func_1180::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .skip
	jr c, StartUpwardsFloorTransition
	jr StartDownwardsFloorTransition
.skip
	ret

HandleUpwardsFloorTransition::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr c, .do_transition
	jr .skip
.do_transition
	jr StartUpwardsFloorTransition

.skip
	ret

; c = new floor
StartDownwardsFloorTransition::
	ld a, c
	ld [wFloor], a
	cp 5
	jr z, .asm_11ba
	ld a, $80
	jr .asm_11bc
.asm_11ba
	ld a, $68
.asm_11bc
	ld [wFloorTransitionTimer], a
	play_sfx SFX_0E1
	ld a, FLOOR_TRANSITION_UP
	ld [wFloorTransitionDir], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	xor a
	ld [wcac8], a
	ret

; c = new floor
StartUpwardsFloorTransition::
	ld a, c
	ld [wFloor], a
	play_sfx SFX_0E1
	ld a, FLOOR_TRANSITION_DOWN
	ld [wFloorTransitionDir], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	ld a, $80
	ld [wFloorTransitionTimer], a
	xor a
	ld [wcac8], a
	ret

TriggerRoomTransition::
	xor a
	ld [wGrabState], a
	ld [wRoomPalCycleDuration], a
	ld [wRoomAnimatedPalsEnabled], a
	ld [wWaterCurrent], a
	ld [wLastWaterCurrent], a
	ld [wCurWaterCurrent], a
	ld [wcac3], a
	ld [wIsBossBattle], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONF_3_F, a
	ret nz
	ld hl, wSubState
	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONF_1_F, a
	jr z, .asm_1246
	inc [hl] ; door transition
	farcall Func_8e06
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, h
	ld [w3d507 + 1], a
	ld a, l
	ld [w3d507 + 0], a
	pop af
	ldh [rSVBK], a
	ret

.asm_1246
	inc [hl]
	inc [hl]
	stop_music
	stop_sfx
	ret

AddXOffset::
	ld a, [wc0c3]
	add b
	ld [wc0c3], a
	ld a, [wWarioXPos + 1]
	add b
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc 0
	ld [wWarioXPos + 0], a
	ret

SubXOffset::
	ld a, [wc0c3]
	sub b
	ld [wc0c3], a
	ld a, [wWarioXPos + 1]
	sub b
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [wWarioXPos + 0], a
	ret

; b = y offset
AddYOffset::
	ld a, [wc0c2]
	add b
	ld [wc0c2], a
;	fallthrough

AddYOffset_Sprite::
	ld a, [wWarioYPos + 1]
	add b
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	adc 0
	ld [wWarioYPos + 0], a
	ret

; b = y offset
SubYOffset::
	ld a, [wc0c2]
	sub b
	ld [wc0c2], a
;	fallthrough

SubYOffset_Sprite::
	ld a, [wWarioYPos + 1]
	sub b
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [wWarioYPos + 0], a
	ret

; b = ground shake counter
DoGroundShake::
	ld a, [wGroundShakeCounter]
	and a
	ret nz
	ld a, b
	ld [wGroundShakeCounter], a
	xor a
	ld [wIsWarioGroundShaking], a
	ret

ClearParticles::
	ld hl, wParticles
	ld b, PARTICLE_STRUCT_LENGTH * NUM_PARTICLES + 2
	xor a
	call WriteAToHL_BTimes
	ret

SaveBackupVRAM::
	ldh a, [rSVBK]
	push af
	ld a, BANK("GFX RAM")
	ldh [rSVBK], a
	ld a, [wSCY]
	ld [w3d500], a
	ld a, [wSCX]
	ld [w3d501], a
	ld hl, wTempPals1
	ld de, w3d280
	ld b, 16 palettes
	call CopyHLToDE
	pop af
	ldh [rSVBK], a

	xor a ; VRAM0
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM4")
	ldh [rSVBK], a
	ld hl, v0Tiles0
	ld de, w4d000
	ld bc, v0Tiles2 - v0Tiles0
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM5")
	ldh [rSVBK], a
	ld hl, v0Tiles2
	ld de, w5d000
	ld bc, v0End - v0Tiles2
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM6")
	ldh [rSVBK], a
	ld hl, v1Tiles0
	ld de, w6d000
	ld bc, v1Tiles2 - v1Tiles0
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM7")
	ldh [rSVBK], a
	ld hl, v1Tiles2
	ld de, w7d000
	ld bc, v1End - v1Tiles2
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	xor a ; VRAM0
	ldh [rVBK], a
	ret

LoadBackupVRAM::
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [w3d500]
	ld [wSCY], a
	ld a, [w3d501]
	ld [wSCX], a
	ld hl, w3d280
	ld de, wTempPals1
	ld b, 16 palettes
	call CopyHLToDE
	pop af
	ldh [rSVBK], a
	xor a
	ldh [rVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM4")
	ldh [rSVBK], a
	ld hl, w4d000
	ld de, v0Tiles0
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM5")
	ldh [rSVBK], a
	ld hl, w5d000
	ld de, v0Tiles2
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM6")
	ldh [rSVBK], a
	ld hl, w6d000
	ld de, v1Tiles0
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a

	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM7")
	ldh [rSVBK], a
	ld hl, w7d000
	ld de, v1Tiles2
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	ldh [rSVBK], a
	xor a
	ldh [rVBK], a
	ret

ReturnToLevelFromGolf::
	call DisableLCD
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wTempAnimatedTilesFrameDuration]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [wTempAnimatedTilesGroup]
	ld [wAnimatedTilesGfx], a
	pop af
	ldh [rSVBK], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a
	call LoadBackupVRAM
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_FLAGS_MASK
	or ROOMTRANSITION_2
	ld [wRoomTransitionParam], a
	farcall Func_1f0969
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
;	fallthrough

ReturnToPendingLevelState::
	ld hl, wState
	ld [hl], ST_LEVEL
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret

ReturnToMapFromLevel::
	ld hl, wca3b
	set 7, [hl]
ReturnToMap::
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a
	farcall StartOverworldState
	ret

ReturnToPauseMenuFromActionHelp::
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	farcall _ReturnToPauseMenuFromActionHelp
	pop af
	ldh [rSVBK], a
	ret

UpdateObjAnim::
	xor a
	ld [wObjAnimWasReset], a
	ld a, [hld] ;
	ld e, a     ; frameset pointer
	ld a, [hld] ;
	ld d, a     ;
	ld a, [hl] ; duration
	sub 1
	ld [hld], a
	ret nc

	; new frame
	ld a, [hl] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset_anim
	dec l
	dec l
	ld [hli], a ; frame
	inc l
	ld a, [hl] ; frameset offset
	add $2
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a ; duration
	ret

.reset_anim
	xor a
	ld [hli], a ; frameset offset
	ld [hl], a ; duration
	ld a, TRUE
	ld [wObjAnimWasReset], a
	ret

ApplyJumpVelocity::
	ld a, [wJumpVelTable]
	dec a
	jr z, .knock_back ; JUMP_VEL_KNOCK_BACK
	dec a
	jr z, .normal_jump ; JUMP_VEL_NORMAL
	dec a
	jr z, .high_jump ; JUMP_VEL_HIGH_JUMP
	dec a
	jr z, .bouncy_jump ; JUMP_VEL_BOUNCY_JUMP
	dec a
	jr z, .bouncy_high_jump ; JUMP_VEL_BOUNCY_HIGH_JUMP
	ret

.bouncy_high_jump
	ld hl, JumpVelTable_BouncyHighJump
	jr .got_jump_table
.bouncy_jump
	ld hl, JumpVelTable_BouncyJump
	jr .got_jump_table
.high_jump
	ld hl, JumpVelTable_HighJump
	jr .got_jump_table
.normal_jump
	ld hl, JumpVelTable_Normal
	jr .got_jump_table
.knock_back
	ld hl, JumpVelTable_KnockBack

.got_jump_table
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	add hl, de
	bit 7, [hl]
	jr z, .falling

; rising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call SubYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	jr .done

.falling
	xor a
	ld [wDoFullJump], a
	ld b, [hl]
	call AddYOffset
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .done
	ld [hl], MAX_JUMP_VEL_INDEX
.done
	ret

TriggerDownwardsFloorTransition::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .done
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .done
	jr c, .done
	jp StartDownwardsFloorTransition
.done
	ret

TriggerFloorTransition::
	update_pos_y
TriggerFloorTransition_SkipUpdateYPos::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .done
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .done
	jr c, .upwards
	call StartDownwardsFloorTransition
	jr .done
.upwards
	call StartUpwardsFloorTransition
.done
	ret

ApplyWalkVelocity_Right::
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir left
	xor a
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

.dir_right
	ld a, [wSlopeInteraction]
	bit RIGHT_SLOPE_F, a
	jr z, ApplyWalkVelocity
;	fallthrough

ApplySlopedWalkVelocity::
	ld a, [wWalkVelIndex]
	cp $08
	jr c, ApplyWalkVelocity
	ld a, $04
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

ApplyWalkVelocity_Left::
	ld a, [wDirection]
	and a
	jr z, .dir_left
; dir right
	xor a
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

.dir_left
	ld a, [wSlopeInteraction]
	bit LEFT_SLOPE_F, a
	jr z, ApplyWalkVelocity
	jr ApplySlopedWalkVelocity

ApplyWalkVelocity::
	ld a, [wWalkVelIndex]
	ld e, a
	ld d, $00
	ld hl, WalkVelTable
	add hl, de
	ld b, [hl]
	ld hl, wWalkVelIndex
	ld a, [hl]
	cp $1b
	jr z, .cap
	inc [hl]
	ret
.cap
	and $fc
	ld [hl], a
	ret

InvalidWarioStateReset::
	jp Init

RecoverFromTransformation::
	call ClearTransformationValues
	ld a, $10
	ld [wInvincibleCounter], a
	jr ResetLevelMusicWarioPalsAndState

RecoverFromTransformation_WithoutInvincibility::
	call ClearTransformationValues
;	fallthrough

ResetLevelMusicWarioPalsAndState::
	call UpdateLevelMusic
	ld hl, WarioDefaultPal
	call SetWarioPal
	ld a, [wJumpVelTable]
	and a
	jr nz, .fall
	farcall SetState_Idling
	jp PlayRecoverySFX
.fall
	farcall StartFall
	jp PlayRecoverySFX

LoadWarioGfx::
	ld a, [wDMASourceBank]
	ld [wPendingDMASourceBank], a
	ld a, [wDMASourcePtr + 0]
	ld [wPendingDMASourcePtr + 0], a
	ld a, [wDMASourcePtr + 1]
	ld [wPendingDMASourcePtr + 1], a

	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, 127
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a
	ret

Func_15dc::
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_15ff
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .asm_15ff
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .asm_15ff
	cp TRANSITION_GAME_OVER
	jr z, .asm_15ff
	ld a, [wGameModeFlags]
	and MODE_GAME_CLEARED
	jr z, .asm_15ff
	ld a, [wNumCollectedTreasures]
	dec a
	jr z, SetPerfectState
.asm_15ff
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld a, ST_PAUSE_MENU
	ld [wState], a
	ld a, SST_PAUSE_18
	ld [wSubState], a
	ret

SetPerfectState::
	ld hl, wState
	ld [hl], ST_PERFECT
	xor a
	ld [wSubState], a
	ret

; loads a music ID to hMusicID, depending on wLevel
; and whether there's a new transformation music
UpdateLevelMusic::
	ld a, [wcac3]
	and a
	jr nz, .boss_music
	ld a, [wTransformation]
	and a
	jr nz, .transformation

	ld a, [wROMBank]
	push af
	ld a, BANK(LevelMusic)
	bankswitch
.level_music
	ld a, [wLevel]
	ld d, $00
	add a
	ld e, a
	rl d
	ld hl, LevelMusic
	add hl, de
	ld a, [hli]
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	pop af
	bankswitch
	ret

.boss_music
	dec a
	ld d, $00
	add a
	ld e, a
	ld hl, .BossMusicIDs
	add hl, de
	ld a, [hli]
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	ret

.transformation
	ld a, [wTransformation]
	and %11111
	ld d, $00
	add a ; *2
	ld e, a
	rl d
	ld a, [wROMBank]
	push af
	ld a, BANK(TransformationMusicIDs)
	bankswitch
	ld hl, TransformationMusicIDs
	add hl, de
	ld a, [hli]
	cp $ff ; is it null?
	jr z, .level_music
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	pop af
	bankswitch
	ret

.BossMusicIDs
	dw MUSIC_HIDDEN_FIGURE_BATTLE_1
	dw MUSIC_BOSS_BATTLE
	dw MUSIC_BOSS_DEFEAT

; set game state to Title
InitGameState::
	xor a ; ST_TITLE
	ld [wState], a
	ld [wSubState], a
	ret

; clears some SRAM stuff
ClearSaveData::
	xor a
	ld hl, sCheckVals
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, sBackupCheckVals
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a000
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a800
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0a400
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0ac00
	ld b, $8
	call WriteAToHL_BTimes

	ld a, $00
	ldh [hfffd], a
	jp Init

OpenActionHelp::
	ld hl, wState
	ld a, ST_ACTION_HELP
	ld [hli], a
	ld [hl], $00 ; wSubState
	ret

ReleaseOwl::
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
	ld b, PARTICLE_OWL
	farcall CreateParticle
	ret

; returns nz if standing on slippery ground
IsOnSlipperyGround::
	xor a
	ld [wIsOnSlipperyGround], a

	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a ; - wCollisionBoxLeft - 3
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc 0
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret nz

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
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret

Func_1762::
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1776
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1775
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1775
	ret

.asm_1776
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1782
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1782
	ret

; return nz if level has had all its
; Musical Coins collected already
CheckLevelMusicalCoinFlag::
	farcall _CheckLevelMusicalCoinFlag
	ld a, b
	and a
	ret

Func_1795::
	ld a, $02
	ld b, $40
	ld d, $0f
	ld e, $0f
	call Func_102c
	call Func_fbc
	ret

; returns nz if has all the levels
; with their corresponding Musical Coin flag set
CheckHasAllMusicalCoinFlags::
	ld hl, wMusicalCoinFlags
	ld c, 3
.loop_bytes
	ld b, 8
	ld a, [hli]
.loop_flags
	rrca
	jr nc, .false
	dec b
	jr nz, .loop_flags
	dec c
	jr nz, .loop_bytes
	; 1 bit still missing
	ld a, [hl]
	rrca
	jr nc, .false
	ld a, TRUE
	ret
.false
	xor a ; FALSE
	ret

Func_17be::
	ld a, [hli]
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wROMBank]
	push af
	ld a, BANK(OAM_aab5c)
	bankswitch
	ld hl, OAM_aab5c
	call AddSprite
	pop af
	bankswitch
	ret

Func_17ec::
	ld a, [hli]
	add OAM_Y_OFS
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add OAM_X_OFS
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wCreditsMusicBoxOAMBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wCreditsMusicBoxOAMPtr + 0]
	ld h, a
	ld a, [wCreditsMusicBoxOAMPtr + 1]
	ld l, a
	call AddSprite
	pop af
	bankswitch
	ret

EmptyOAMFrame::
	db $80

PalsWhite::
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31

PalsBlack::
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0
	rgb 0, 0, 0

JumpVelTable_Normal::
	db -4 ; $00
	db -4 ; $01
	db -3 ; $02
	db -3 ; $03
	db -3 ; $04
	db -3 ; $05
	db -2 ; $06
	db -2 ; $07
	db -2 ; $08
	db -2 ; $09
	db -1 ; $0a
	db -1 ; $0b
	db -1 ; $0c
	db -1 ; $0d
	db -1 ; $0e
	db -1 ; $0f
	db -1 ; $10
	db -1 ; $11
	db  0 ; $12
	db  0 ; $13
	db  0 ; $14
	db  0 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  1 ; $1a
	db  1 ; $1b
	db  2 ; $1c
	db  2 ; $1d
	db  2 ; $1e
	db  2 ; $1f
	db  2 ; $20
	db  2 ; $21
	db  3 ; $22
	db  3 ; $23
	db  3 ; $24
	db  3 ; $25
	db  4 ; $26
	db  4 ; $27

JumpVelTable_HighJump::
	db -4 ; $00
	db -4 ; $01
	db -4 ; $02
	db -4 ; $03
	db -4 ; $04
	db -4 ; $05
	db -3 ; $06
	db -3 ; $07
	db -3 ; $08
	db -3 ; $09
	db -2 ; $0a
	db -2 ; $0b
	db -2 ; $0c
	db -2 ; $0d
	db -1 ; $0e
	db -1 ; $0f
	db -1 ; $10
	db -1 ; $11
	db -1 ; $12
	db -1 ; $13
	db  0 ; $14
	db  0 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  1 ; $1a
	db  1 ; $1b
	db  2 ; $1c
	db  2 ; $1d
	db  2 ; $1e
	db  2 ; $1f
	db  2 ; $20
	db  2 ; $21
	db  3 ; $22
	db  3 ; $23
	db  3 ; $24
	db  3 ; $25
	db  4 ; $26
	db  4 ; $27

JumpVelTable_KnockBack::
	db -2 ; $00
	db -2 ; $01
	db -2 ; $02
	db -2 ; $03
	db -1 ; $04
	db -1 ; $05
	db -1 ; $06
	db -1 ; $07
	db -1 ; $08
	db -1 ; $09
	db -1 ; $0a
	db -1 ; $0b
	db -1 ; $0c
	db -1 ; $0d
	db -1 ; $0e
	db -1 ; $0f
	db  0 ; $10
	db  0 ; $11
	db  0 ; $12
	db  0 ; $13
	db  0 ; $14
	db  0 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  1 ; $1a
	db  1 ; $1b
	db  2 ; $1c
	db  2 ; $1d
	db  2 ; $1e
	db  2 ; $1f
	db  2 ; $20
	db  2 ; $21
	db  3 ; $22
	db  3 ; $23
	db  3 ; $24
	db  3 ; $25
	db  4 ; $26
	db  4 ; $27

JumpVelTable_BouncyJump::
	db -2 ; $00
	db -2 ; $01
	db -3 ; $02
	db -4 ; $03
	db -4 ; $04
	db -4 ; $05
	db -4 ; $06
	db -4 ; $07
	db -4 ; $08
	db -4 ; $09
	db -4 ; $0a
	db -4 ; $0b
	db -4 ; $0c
	db -4 ; $0d
	db -3 ; $0e
	db -3 ; $0f
	db -2 ; $10
	db -2 ; $11
	db -2 ; $12
	db -1 ; $13
	db -1 ; $14
	db -1 ; $15
	db  0 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  2 ; $1a
	db  2 ; $1b
	db  3 ; $1c
	db  3 ; $1d
	db  3 ; $1e
	db  3 ; $1f
	db  4 ; $20
	db  4 ; $21
	db  4 ; $22
	db  4 ; $23
	db  4 ; $24
	db  4 ; $25
	db  4 ; $26
	db  4 ; $27

JumpVelTable_BouncyHighJump::
	db -2 ; $00
	db -3 ; $01
	db -4 ; $02
	db -4 ; $03
	db -4 ; $04
	db -4 ; $05
	db -4 ; $06
	db -4 ; $07
	db -4 ; $08
	db -4 ; $09
	db -4 ; $0a
	db -4 ; $0b
	db -4 ; $0c
	db -4 ; $0d
	db -4 ; $0e
	db -4 ; $0f
	db -4 ; $10
	db -4 ; $11
	db -4 ; $12
	db -3 ; $13
	db -3 ; $14
	db -2 ; $15
	db -1 ; $16
	db  0 ; $17
	db  1 ; $18
	db  1 ; $19
	db  2 ; $1a
	db  2 ; $1b
	db  3 ; $1c
	db  3 ; $1d
	db  3 ; $1e
	db  3 ; $1f
	db  4 ; $20
	db  4 ; $21
	db  4 ; $22
	db  4 ; $23
	db  4 ; $24
	db  4 ; $25
	db  4 ; $26
	db  4 ; $27

WalkVelTable::
	db 0
	db 1
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 4
	db 4
	db 4
	db 4

; treasure IDs of each level
LevelTreasureIDs::
	; LEVEL_THE_TEMPLE
	db TREASURE_DUMMY ; grey
	db TREASURE_DUMMY ; red
	db TREASURE_DUMMY ; green
	db TREASURE_DUMMY ; blue

LevelTreasureIDs_WithoutTemple::
	; LEVEL_OUT_OF_THE_WOODS
	db AXE ; grey
	db JAR ; red
	db PRINCE_FROGS_GLOVES_T ; green
	db GOLD_MUSIC_BOX ; blue

	; LEVEL_THE_PEACEFUL_VILLAGE
	db BLUE_TABLET ; grey
	db BLUE_BOOK ; red
	db GOBLET ; green
	db DAY_OR_NIGHT_SPELL ; blue

	; LEVEL_THE_VAST_PLAIN
	db GREEN_TABLET ; grey
	db CRAYON_BLUE_T ; red
	db SKULL_RING_RED ; green
	db RED_GEM ; blue

	; LEVEL_BANK_OF_THE_WILD_RIVER
	db YELLOW_BOOK ; grey
	db MAGNIFYING_GLASS ; red
	db STATUE ; green
	db ROCKET ; blue

	; LEVEL_THE_TIDAL_COAST
	db SKY_KEY ; grey
	db FOOT_OF_STONE ; red
	db ELECTRIC_FAN_PROPELLER ; green
	db GREEN_GEM ; blue

	; LEVEL_SEA_TURTLE_ROCKS
	db GREEN_MUSIC_BOX ; grey
	db GOLDEN_RIGHT_EYE ; red
	db SUN_MEDALLION_TOP ; green
	db FULL_MOON_GONG ; blue

	; LEVEL_DESERT_RUINS
	db TOP_HALF_OF_SCROLL ; grey
	db BOTTOM_HALF_OF_SCROLL ; red
	db CRAYON_PINK_T ; green
	db SUN_MEDALLION_BOTTOM ; blue

	; LEVEL_THE_VOLCANOS_BASE
	db LEAD_OVERALLS_T ; grey
	db BLUE_GEM ; red
	db CROWN ; green
	db TUSK_BLUE ; blue

	; LEVEL_THE_POOL_OF_RAIN
	db GEAR_1 ; grey
	db SKULL_RING_BLUE ; red
	db ORNAMENTAL_FAN ; green
	db CRAYON_YELLOW_T ; blue

	; LEVEL_A_TOWN_IN_CHAOS
	db GEAR_2 ; grey
	db BLUE_MUSIC_BOX ; red
	db GOLDEN_LEFT_EYE ; green
	db SAPLING_OF_GROWTH ; blue

	; LEVEL_BENEATH_THE_WAVES
	db EXPLOSIVE_PLUNGER_BOX ; grey
	db CRAYON_RED_T ; red
	db RED_CHEMICAL ; green
	db CLUBS_CREST ; blue

	; LEVEL_THE_WEST_CRATER
	db RIGHT_GLASS_EYE ; grey
	db SABER ; red
	db CASTLE_BRICK ; green
	db SPADES_CREST ; blue

	; LEVEL_THE_GRASSLANDS
	db YELLOW_MUSIC_BOX ; grey
	db TRUCK_WHEEL ; red
	db TRIDENT ; green
	db FIGHTER_MANNEQUIN ; blue

	; LEVEL_THE_BIG_BRIDGE
	db POUCH ; grey
	db CRAYON_CYAN_T ; red
	db POCKET_PET ; green
	db LANTERN ; blue

	; LEVEL_TOWER_OF_REVIVAL
	db SWIMMING_FLIPPERS_T ; grey
	db GARLIC_T ; red
	db TREASURE_MAP ; green
	db MAGIC_WAND ; blue

	; LEVEL_THE_STEEP_CANYON
	db GRAB_GLOVE_T ; grey
	db TUSK_RED ; red
	db TELEPHONE ; green
	db BLUE_CHEMICAL ; blue

	; LEVEL_CAVE_OF_FLAMES
	db SCEPTER ; grey
	db MINICAR ; red
	db MAGIC_SEEDS ; green
	db SCISSORS ; blue

	; LEVEL_ABOVE_THE_CLOUDS
	db CRAYON_GREEN_T ; grey
	db FIRE_DRENCHER ; red
	db JACKHAMMER ; green
	db PICK_AXE ; blue

	; LEVEL_THE_STAGNANT_SWAMP
	db FLUTE ; grey
	db GREEN_FLOWER ; red
	db RED_MUSIC_BOX ; green
	db EYE_OF_THE_STORM ; blue

	; LEVEL_THE_FRIGID_SEA
	db HEAD_SMASH_HELMET_T ; grey
	db TEAPOT ; red
	db MAGICAL_FLAME ; green
	db UFO ; blue

	; LEVEL_CASTLE_OF_ILLUSIONS
	db SUPER_JUMP_SLAM_OVERALLS_T ; grey
	db TORCH ; red
	db GOLD_MAGIC ; green
	db RUST_SPRAY ; blue

	; LEVEL_THE_COLOSSAL_HOLE
	db LEFT_GLASS_EYE ; grey
	db AIR_PUMP ; red
	db HIGH_JUMP_BOOTS_T ; green
	db LOCOMOTIVE ; blue

	; LEVEL_THE_WARPED_VOID
	db MYSTERY_HANDLE ; grey
	db CRAYON_BROWN_T ; red
	db DEMONS_BLOOD ; green
	db HEART_CREST ; blue

	; LEVEL_THE_EAST_CRATER
	db SUPER_GRAB_GLOVES_T ; grey
	db DIAMONDS_CREST ; red
	db NIGHT_VISION_SCOPE ; green
	db EARTHEN_FIGURE ; blue

	; LEVEL_FOREST_OF_FEAR 
	db WARP_COMPACT ; grey
	db KEY_CARD_RED ; red
	db WARP_REMOVAL_APPARATUS ; green
	db KEY_CARD_BLUE ; blue

LoadBGPalettesFromWRAM::
	ld hl, wTempBGPals
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ld b, 8 palettes
	ld c, LOW(rBCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

LoadOBPalettesFromWRAM::
	ld hl, wTempOBPals
	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ld b, 8 palettes
	ld c, LOW(rOCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

; copies hl to wTempPals1
LoadPalsToTempPals1::
	ld de, wTempPals1
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret

; copies hl to wTempPals2
LoadPalsToTempPals2::
	ld de, wTempPals2
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret

; copies b bytes from hl to de
; given that e doesn't overflow
CopyHLToDE_Short::
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, CopyHLToDE_Short
	ret

; copies hl to wTempPals2
LoadObjPals::
	ld de, wTempPals2 palette 4
	ld b, 4 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret

EnableDoubleSpeed::
	ldh a, [rSPD]
	bit 7, a
	ret nz ; already in double speed

	ld a, KEY1F_PREPARE
	ldh [rSPD], a
	ldh a, [rIE]
	push af
	xor a
	ldh [rIE], a
	ld a, P1F_GET_NONE
	ldh [rP1], a
	stop

.wait
	ldh a, [rSPD]
	bit 7, a
	jr z, .wait

	xor a
	ldh [rP1], a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ret

; clear VRAM if hCGB != 0
ClearVRAM::
	ldh a, [hCGB]
	and a
	ret z

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld hl, STARTOF("VRAM1")
	ld bc, SIZEOF("VRAM1")
	call WriteAToHL_BCTimes

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, STARTOF("VRAM0")
	ld bc, SIZEOF("VRAM0")
	jp WriteAToHL_BCTimes

ClearWRAM::
	ld e, 1 ; WRAM1
.loop
	ld a, e
	ldh [rSVBK], a
	xor a
	ld hl, $d000
	ld bc, $1000
	call WriteAToHL_BCTimes
	inc e
	bit 3, e
	jr z, .loop
	xor a ; WRAM0
	ldh [rSVBK], a
	ret

; copies all BG pals to wTempBGPals
StoreBGPals::
	xor a
	ld e, a
	ld hl, wTempBGPals
	ld b, 8 palettes
	ld c, LOW(rBCPD)
.loop
	ld a, e
	ldh [rBCPS], a
	ld a, [$ff00+c]
	ld [hli], a
	inc e
	dec b
	jr nz, .loop
	ret

; copies all OB pals to wTempOBPals
StoreOBPals::
	xor a
	ld e, a
	ld hl, wTempOBPals
	ld b, 8 palettes
	ld c, LOW(rOCPD)
.loop
	ld a, e
	ldh [rOCPS], a
	ld a, [$ff00+c]
	ld [hli], a
	inc e
	dec b
	jr nz, .loop
	ret

; fills BG palette with just white
FillWhiteBGPal::
	ld hl, PalsWhite
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ld b, 8 palettes
	ld c, LOW(rBCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

; fills OB palette with just white
FillWhiteOBPal::
	ld hl, PalsWhite
	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ld b, 8 palettes
	ld c, LOW(rOCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

; unreferenced
Func_1ae2:
	ld hl, PalsWhite
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, PalsWhite
	ld b, 8 palettes
	call CopyHLToDE
	ret

; hl = palette to copy from Wario Palettes
SetWarioPal::
	ld a, h
	ld [wWarioPalsPtr + 0], a
	ld a, l
	ld [wWarioPalsPtr + 1], a
	ld a, [wROMBank]
	push af
	ld a, BANK("Wario Palettes")
	bankswitch
	push hl
	ld de, wTempPals2
	ld b, 2 palettes
	ld a, BANK("Wario Palettes")
	ldh [hCallFuncBank], a
	hcall CopyHLToDE_Short
	pop hl

	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ld b, 2
	ld c, LOW(rOCPD)

.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off

; apply OBJ palette
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR

	dec b
	jr nz, .wait_lcd_on
	pop af
	bankswitch
	ret

; loads the palette for the treasure
; that was collected in the level
LoadCollectedTreasurePal_Level::
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLevelTreasurePals)
	ldh [rSVBK], a
	ld hl, wLevelEndScreen
	ld a, [hl]
	and $7f
	dec a
	ld c, a
	ld b, $00
	ld hl, wLevelTreasurePals
	add hl, bc
	ld a, [hl]
	sub OBPAL_TREASURE_YELLOW
	add a
	add a
	add a ; *8
	ld e, a
	ld d, b
	ld hl, TreasurePals
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(TreasurePals)
	bankswitch
	push hl
	ld de, wTempPals2 palette 4
	ld a, c
	add a
	add a
	add a
	ld c, a
	add e
	ld e, a
	ld b, 1 palettes
	farcall BANK(TreasurePals), CopyHLToDE_Short ; unneeded farcall
	pop hl
	ld a, $20 | OCPSF_AUTOINC
	or c
	ldh [rOCPS], a
	ld c, LOW(rOCPD)
.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off
; apply OBJ palette
REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	pop af
	bankswitch
	pop af
	ldh [rSVBK], a
	ret

LoadCollectedTreasurePal_ClearScreen::
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLevelTreasurePals)
	ldh [rSVBK], a
	ld hl, wLevelEndScreen
	ld a, [hl]
	and $7f
	dec a
	ld c, a
	ld b, $00
	ld hl, wLevelTreasurePals
	add hl, bc
	ld a, [hl]
	sub OBPAL_TREASURE_YELLOW
	add a
	add a
	add a ; *8
	ld e, a
	ld d, b ; $00
	ld hl, TreasurePals
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(TreasurePals)
	bankswitch
	ld de, wTempPals2 palette 7
	ld b, 1 palettes
	farcall BANK(TreasurePals), CopyHLToDE_Short ; unneeded farcall
	pop af
	bankswitch
	pop af
	ldh [rSVBK], a
	ret

; b = number of pals
; c = OB palette number
; hl = palette source
; de = OB pals dest
CopyAndApplyOBPals::
	push bc
	push hl
	sla b
	sla b
	sla b ; *8
	call CopyHLToDE_Short
	pop hl
	pop bc
	ld a, c
	add a
	add a
	add a ; *8
	or OCPSF_AUTOINC
	ldh [rOCPS], a
	ld c, LOW(rOCPD)

.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off

REPT 1 palettes
	ld a, [hli]
	ld [$ff00+c], a
ENDR

	dec b
	jr nz, .wait_lcd_on
	ret

ApplyTempPals1ToBGPals::
	ld hl, wTempPals1
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ld b, 8 palettes
	ld c, LOW(rBCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret

ApplyTempPals2ToOBPals::
	ld hl, wTempPals2
	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ld b, 8 palettes
	ld c, LOW(rOCPD)
.loop
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
