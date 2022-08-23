GetCell:: ; bdb (0:bdb)
; y position
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

	ld b, $01
	add $a0
	cp $c0
	jr c, .asm_bfb
	inc b
	sub $20
	cp $c0
	jr c, .asm_bfb
	inc b
	sub $20
.asm_bfb
	ld [wYCell], a
	ld a, b
	ld [wFloorSRAMBank], a

; x position
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
	ld [wXCell], a

	ld a, [wYCell]
	ld h, a
	ret
; 0xc19

Func_c19:: ; c19 (0:c19)
	ld a, h
	sub $a0
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
	rl d
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
; 0xc4c

DoPendingDMATransfer:: ; c4c (0:c4c)
	ld a, [wIsDMATransferPending]
	and a
	jr nz, .dma_transfer

	xor a
	ld [rRAMB + $100], a
	ld hl, wc0bc
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

; copy wce01 to memory pointed by wce6a
	ld hl, wce6a
	ld bc, wce01
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
	ld hl, wc0bc
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

	xor a
	ld [wce00], a
	ld [wce69], a
	ret
; 0xcab

Func_cab:: ; cab (0:cab)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wce6a
	ld bc, wce35
	jp wc800
; 0xcb8

Func_cb8:: ; cb8 (0:cb8)
	xor a
	ld [wce00], a
	ld [wce69], a
	ret
; 0xcc0

; input:
; - hl = hPos
; output:
; - h = y cell
; - l = x cell
Func_cc0:: ; cc0 (0:cc0)
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
	add $a0
	ld c, a
	ld [wSpawnYCell], a

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
	ld [wSpawnXCell], a
	ld h, c
	ret
; 0xcf8

Func_cf8:: ; cf8 (0:cf8)
	push hl
	ld a, h
	sub $a0
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
; 0xd3e

Func_d3e:: ; d3e (0:d3e)
	ld a, h
	sub $a0
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, [wFloorSRAMBank]
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
; 0xd81

Func_d81:: ; d81 (0:d81)
	ld a, l
	sub $b0
	add a
	ld l, a
	ld a, b
	xor $1
	add l
	ld l, a
	ret
; 0xd8c

Func_d8c:: ; d8c (0:d8c)
	ld a, [wFloorSRAMBank]
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
; 0xd9e

; draws Wario on screen unless he's invisible
DrawWario:: ; d9e (0:d9e)
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
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0xdf4

; hl = sprite pointer
TryAddSprite:: ; df4 (0:df4)
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
	cp NUM_SPRITE_OAM_STRUCTS * SPRITEOAMSTRUCT_LENGTH
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
; 0xe2b

	INCROM $e2b, $e31

Func_e31:: ; e31 (0:e31)
	ld a, [wFloorSRAMBank]
	dec a
	add a
	add a
	add a
	add a
	add a ; *$20
	add h
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
	add $02
	and $0f
	ld [wc19e], a
	ret
; 0xe53

UpdateAnimation:: ; e53 (0:e53)
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
; 0xe87

Func_e87:: ; e87 (0:e87)
	jp Init
; 0xe8a

LoadLevelLayoutAndObjects:: ; e8a (0:e8a)
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
; 0xedb

Func_edb:: ; edb (0:edb)
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
; 0xf13

Func_f13:: ; f13 (0:f13)
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
; 0xf4c

Func_f4c:: ; f4c (0:f4c)
	ld c, $a0
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
	ld [wc09f], a
	inc de
.asm_f61
	ld a, [wc09f]
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
	ld h, $a0
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
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
	jr .asm_f93
; 0xfae

InitAudio:: ; fae (0:fae)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_InitAudio
	pop af
	ldh [rSVBK], a
	ret
; 0xfbc

; bc = sound ID
Func_fbc:: ; fbc (0:fbc)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f06
	pop af
	ldh [rSVBK], a
	ret
; 0xfca

; bc = sound ID
PlaySFX:: ; fca (0:fca)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlaySFX
	pop af
	ldh [rSVBK], a
	ret
; 0xfd8

	INCROM $fd8, $0fe6

; bc = sound ID
Func_fe6:: ; fe6 (0:fe6)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f18
	pop af
	ldh [rSVBK], a
	ret
; 0xff4

; bc = sound ID
Func_ff4:: ; ff4 (0:ff4)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f1e
	pop af
	ldh [rSVBK], a
	ret
; 0x1002

Func_1002:: ; 1002 (0:1002)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call Func_3f24
	pop af
	ldh [rSVBK], a
	ret
; 0x1010

	INCROM $1010, $102c

Func_102c:: ; 102c (0:102c)
	ldh [hffac], a
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ldh a, [hffac]
	call Func_3f36
	pop af
	ldh [rSVBK], a
	ret
; 0x103e

	INCROM $103e, $1062

; bc = sound ID
PlayNewMusic_SetNoise:: ; 1062 (0:1062)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call DoAudioFunc_PlayNewMusic_SetNoise
	pop af
	ldh [rSVBK], a
	ret
; 0x1070

PlayRecoverySFX:: ; 1070 (0:1070)
	play_sfx SFX_RECOVERY
	ret
; 0x1079

ClearTransformationValues:: ; 1079 (0:1079)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_BLIND
	call z, .RestoreBlindPalettes

	xor a
	ld [wInvincibleCounter], a
	ld [wTransformation], a
	ld [wca8f], a
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

	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
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

	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on_ob
	ret
; 0x10fc

	INCROM $10fc, $1146

Func_1146:: ; 1146 (0:1146)
	call GetFloorForYPos
	ld a, c
	ld [wFloor], a
	ret
; 0x114e

; returns in c:
; 6 if   $0 <= ypos <  $80
; 5 if  $80 <= ypos < $100
; 4 if $100 <= ypos < $180
; 3 if $180 <= ypos < $200
; 2 if $200 <= ypos < $280
; 1 if $280 <= ypos < $300
GetFloorForYPos:: ; 114e (0:114e)
	ld a, [wYPosHi]
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
	ld a, [wYPosLo]
	cp $80
	ret nc
	; < $80
	inc c
	ret
; 0x1169

HandleDownwardsFloorTransition:: ; 1169 (0:1169)
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
; 0x1180

; unreferenced?
Func_1180:: ; 1180 (0:1180)
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
; 0x1197

HandleUpwardsFloorTransition:: ; 1197 (0:1197)
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
; 0x11ae

; c = new floor
StartDownwardsFloorTransition:: ; 11ae (0:11ae)
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
; 0x11d6

; c = new floor
StartUpwardsFloorTransition:: ; 11d6 (0:11d6)
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
; 0x11f6

TriggerRoomTransition:: ; 11f6 (0:11f6)
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

	ld a, [wc0d7]
	bit 7, a
	ret nz
	ld hl, wSubState
	ld a, [wc0d7]
	bit 5, a
	jr z, .asm_1246
	inc [hl]
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
; 0x1259

AddXOffset:: ; 1259 (0:1259)
	ld a, [wc0c3]
	add b
	ld [wc0c3], a
	ld a, [wXPosLo]
	add b
	ld [wXPosLo], a
	ld a, [wXPosHi]
	adc 0
	ld [wXPosHi], a
	ret
; 0x1270

SubXOffset:: ; 1270 (0:1270)
	ld a, [wc0c3]
	sub b
	ld [wc0c3], a
	ld a, [wXPosLo]
	sub b
	ld [wXPosLo], a
	ld a, [wXPosHi]
	sbc 0
	ld [wXPosHi], a
	ret
; 0x1287

; b = y offset
AddYOffset:: ; 1287 (0:1287)
	ld a, [wc0c2]
	add b
	ld [wc0c2], a
;	fallthrough

AddYOffset_Sprite:: ; 128e (0:128e)
	ld a, [wYPosLo]
	add b
	ld [wYPosLo], a
	ld a, [wYPosHi]
	adc 0
	ld [wYPosHi], a
	ret
; 0x129e

; b = y offset
SubYOffset:: ; 129e (0:129e)
	ld a, [wc0c2]
	sub b
	ld [wc0c2], a
;	fallthrough

SubYOffset_Sprite:: ; 12a5 (0:12a5)
	ld a, [wYPosLo]
	sub b
	ld [wYPosLo], a
	ld a, [wYPosHi]
	sbc 0
	ld [wYPosHi], a
	ret
; 0x12b5

; b = ground shake counter
DoGroundShake:: ; 12b5 (0:12b5)
	ld a, [wGroundShakeCounter]
	and a
	ret nz
	ld a, b
	ld [wGroundShakeCounter], a
	xor a
	ld [wIsWarioGroundShaking], a
	ret
; 0x12c3

ClearParticles:: ; 12c3 (0:12c3)
	ld hl, wParticles
	ld b, PARTICLE_STRUCT_LENGTH * NUM_PARTICLES + 2
	xor a
	call WriteAToHL_BTimes
	ret
; 0x12cd

SaveBackupVRAM:: ; 12cd (0:12cd)
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
; 0x1351

LoadBackupVRAM:: ; 1351 (0:1351)
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
; 0x13d5

ReturnToLevelFromGolf:: ; 13d5 (0:13d5)
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
	ld a, [wc0d7]
	and $f0
	or $02
	ld [wc0d7], a
	farcall Func_1f0969
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
;	fallthrough

ReturnToPendingLevelState:: ; 141a (0:141a)
	ld hl, wState
	ld [hl], ST_LEVEL
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret
; 0x1426

ReturnToMapFromLevel:: ; 1426 (0:1426)
	ld hl, wca3b
	set 7, [hl]
ReturnToMap:: ; 142b (0:142b)
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a
	farcall StartOverworldState
	ret
; 0x1440

ReturnToPauseMenuFromActionHelp:: ; 1440 (0:1440)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	farcall _ReturnToPauseMenuFromActionHelp
	pop af
	ldh [rSVBK], a
	ret
; 0x145a

UpdateObjAnim:: ; 145a (0:145a)
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
; 0x1488

ApplyJumpVelocity:: ; 1488 (0:1488)
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
; 0x14de

TriggerDownwardsFloorTransition:: ; 14de (0:14de)
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
; 0x14f6

TriggerFloorTransition:: ; 14f6 (0:14f6)
	update_pos_y
TriggerFloorTransition_SkipUpdateYPos:: ; 1501 (0:1501)
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
; 0x151e

ApplyWalkVelocity_Right:: ; 151e (0:151e)
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir left
	xor a
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

.dir_right
	ld a, [wIsStandingOnSlope]
	bit 0, a
	jr z, ApplyWalkVelocity
;	fallthrough

ApplySlopedWalkVelocity:: ; 1531 (0:1531)
	ld a, [wWalkVelIndex]
	cp $08
	jr c, ApplyWalkVelocity
	ld a, $04
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity
; 0x153f

ApplyWalkVelocity_Left:: ; 153f (0:153f)
	ld a, [wDirection]
	and a
	jr z, .dir_left
; dir right
	xor a
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

.dir_left
	ld a, [wIsStandingOnSlope]
	bit 1, a
	jr z, ApplyWalkVelocity
	jr ApplySlopedWalkVelocity
; 0x1554

ApplyWalkVelocity:: ; 1554 (0:1554)
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
; 0x156d

Func_156d:: ; 156d (0:156d)
	jp Init
; 0x1570

RecoverFromTransformation:: ; 1570 (0:1570)
	call ClearTransformationValues
	ld a, $10
	ld [wInvincibleCounter], a
	jr ResetLevelMusicWarioPalsAndState
; 0x157a

RecoverFromTransformation_WithoutInvincibility:: ; 157a (0:157a)
	call ClearTransformationValues
;	fallthrough

ResetLevelMusicWarioPalsAndState:: ; 157d (0:157d)
	call UpdateLevelMusic
	ld hl, Pals_c800
	call SetWarioPal
	ld a, [wJumpVelTable]
	and a
	jr nz, .fall
	farcall SetState_Idling
	jp PlayRecoverySFX
.fall
	farcall StartFall
	jp PlayRecoverySFX
; 0x15b0

LoadWarioGfx:: ; 15b0 (0:15b0)
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
; 0x15dc

Func_15dc:: ; 15dc (0:15dc)
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
	and ($1 << MODE_GAME_CLEARED_F)
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
; 0x1610

SetPerfectState:: ; 1610 (0:1610)
	ld hl, wState
	ld [hl], ST_PERFECT
	xor a
	ld [wSubState], a
	ret
; 0x161a

; loads a music ID to hMusicID, depending on wLevel
; and whether there's a new transformation music
UpdateLevelMusic:: ; 161a (0:161a)
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
; 0x1690

; set game state to Title
InitGameState:: ; 1690 (0:1690)
	xor a ; ST_TITLE
	ld [wState], a
	ld [wSubState], a
	ret
; 0x1698

; clears some SRAM stuff
Func_1698:: ; 1698 (0:1698)
	xor a
	ld hl, s0a380
	ld b, $8
	call WriteAToHL_BTimes

	ld hl, s0ab80
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
; 0x16d0

OpenActionHelp:: ; 16d0 (0:16d0)
	ld hl, wState
	ld a, ST_ACTION_HELP
	ld [hli], a
	ld [hl], $00 ; wSubState
	ret
; 0x16d9

ReleaseOwl:: ; 16d9 (0:16d9)
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
	ld b, PARTICLE_OWL
	farcall CreateParticle
	ret
; 0x1700

; returns nz if standing on slippery ground
IsOnSlipperyGround:: ; 1700 (0:1700)
	xor a
	ld [wIsOnSlipperyGround], a

	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a ; - wCollisionBoxLeft - 3
	ld hl, wXPosLo
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
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret
; 0x1762

Func_1762:: ; 1762 (0:1762)
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
; 0x1783

; return nz if level has had all its
; Musical Coins collected already
CheckLevelMusicalCoinFlag:: ; 1783 (0:1783)
	farcall _CheckLevelMusicalCoinFlag
	ld a, b
	and a
	ret
; 0x1795

Func_1795:: ; 1795 (0:1795)
	ld a, $02
	ld b, $40
	ld d, $0f
	ld e, $0f
	call Func_102c
	call Func_fbc
	ret
; 0x17a4

; returns nz if has all the levels
; with their corresponding Musical Coin flag set
CheckHasAllMusicalCoinFlags:: ; 17a4 (0:17a4)
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
; 0x17be

Func_17be:: ; 17be (0:17be)
	ld a, [hli]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add $08
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
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x17ec

Func_17ec:: ; 17ec (0:17ec)
	ld a, [hli]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	add $08
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
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x1826

EmptyOAMFrame:: ; 1826 (0:1826)
	db $80

PalsWhite:: ; 1827 (0:1827)
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
; 0x1867

PalsBlack:: ; 1867 (0:1867)
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
; 0x18a7

JumpVelTable_Normal:: ; 18a7 (0:18a7)
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
; 0x18cf

JumpVelTable_HighJump:: ; 18cf (0:18cf)
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
; 0x18f7

JumpVelTable_KnockBack:: ; 18f7 (0:18f7)
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
; 0x191f

JumpVelTable_BouncyJump:: ; 191f (0:191f)
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
; 0x1947

JumpVelTable_BouncyHighJump:: ; 1947 (0:1947)
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
; 0x196f

WalkVelTable:: ; 196f (0:196f)
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
; 0x198b

; treasure IDs of each level
LevelTreasureIDs:: ; 198b (0:198b)
	; LEVEL_THE_TEMPLE
	db TREASURE_DUMMY ; grey
	db TREASURE_DUMMY ; red
	db TREASURE_DUMMY ; green
	db TREASURE_DUMMY ; blue

LevelTreasureIDs_WithoutTemple:: ; 198f (0:198f)
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
; 0x19f3

LoadBGPalettesFromWRAM:: ; 19f3 (0:19f3)
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
; 0x1a04

LoadOBPalettesFromWRAM:: ; 1a04 (0:1a04)
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
; 0x1a15

; copies hl to wTempPals1
LoadPalsToTempPals1:: ; 1a15 (0:1a15)
	ld de, wTempPals1
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1a21

; copies hl to wTempPals2
LoadPalsToTempPals2:: ; 1a21 (0:1a21)
	ld de, wTempPals2
	ld b, 8 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1a2d

; copies b bytes from hl to de
; given that e doesn't overflow
CopyHLToDE_Short:: ; 1a2d (0:1a2d)
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, CopyHLToDE_Short
	ret
; 0x1a34

; copies hl to wTempPals2
Func_1a34:: ; 1a34 (0:1a34)
	ld de, wTempPals2 palette 4
	ld b, 4 palettes
.loop
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .loop
	ret
; 0x1a40

EnableDoubleSpeed:: ; 1a40 (0:1a40)
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
; 0x1a64

; clear VRAM if hCGB != 0
ClearVRAM:: ; 1a64 (0:1a64)
	ldh a, [hCGB]
	and a
	ret z

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld hl, v1Tiles0
	ld bc, v1End - v1Tiles0
	call WriteAToHL_BCTimes

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, v0Tiles0
	ld bc, v0End - v0Tiles0
	jp WriteAToHL_BCTimes
; 0x1a82

ClearWRAM:: ; 1a82 (0:1a82)
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
; 0x1a9a

; copies all BG pals to wTempBGPals
StoreBGPals:: ; 1a9a (0:1a9a)
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
; 0x1aad

; copies all OB pals to wTempOBPals
StoreOBPals:: ; 1aad (0:1aad)
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
; 0x1ac0

; fills BG palette with just white
FillWhiteBGPal:: ; 1ac0 (0:1ac0)
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
; 0x1ad1

; fills OB palette with just white
FillWhiteOBPal:: ; 1ad1 (0:1ad1)
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
; 0x1ae2

	INCROM $1ae2, $1af6

; hl = palette to copy from Wario Palettes
SetWarioPal:: ; 1af6 (0:1af6)
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
REPT PALETTE_SIZE
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .wait_lcd_on
	pop af
	bankswitch
	ret
; 0x1b4f

; loads the palette for the treasure
; that was collected in the level
LoadCollectedTreasurePal_Level:: ; 1b4f (0:1b4f)
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
REPT PALETTE_SIZE
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	pop af
	bankswitch
	pop af
	ldh [rSVBK], a
	ret
; 0x1bc7

LoadCollectedTreasurePal_ClearScreen:: ; 1bc7 (0:1bc7)
	ldh a, [rSMBK]
	push af
	ld a, BANK(wLevelTreasurePals)
	ldh [rSMBK], a
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
	ldh [rSMBK], a
	ret
; 0x1c13

	INCROM $1c13, $1c4a

ApplyTempPals1ToBGPals:: ; 1c4a (0:1c4a)
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
; 0x1c5b

ApplyTempPals2ToOBPals:: ; 1c5b (0:1c5b)
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
; 0x1c6c

	INCROM $1c6c, $2800

LoadPermissionMap:: ; 2800 (0:2800)
	ld a, [wRoomPermissionMap]
	add a
	ld e, a
	ld d, $00
	ld hl, PermissionMapPointers
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(PermissionMapPointers)
	bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $ff
	jr z, .reset
	ld a, [wRoomPermissionMap]
	cp NUM_TILE_MAPS_GROUP_1 - 1
	jr nc, .group_2

; group_1
	ld de, wPermissionMap
	ld b, $00
	call CopyHLToDE
	pop af
	bankswitch
	ret

.group_2
	ld a, [wROMBank]
	push af
	ld a, BANK("Permission Maps 2")
	bankswitch
	ld de, wPermissionMap
	ld b, $00
	call CopyHLToDE
	pop af
	bankswitch
	pop af
	bankswitch
	ret

.reset
	jp Init
; 0x285c

Func_285c:: ; 285c (0:285c)
	ld a, $70
	ld [wca5e], a
	ld a, $58
	ld [wca5f], a
	sub $58
	cpl
	inc a
	add $58
	ld [wca60], a

	ld a, [wROMBank]
	push af
	ld a, BANK(PointerTable_c0319)
	bankswitch
	ld a, [wLevel]
	add a ; *2
	ld e, a
	ld d, $00
	rl d
	ld hl, PointerTable_c0319
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	debug_assert_not $ff
	pop af
	bankswitch

	ld a, [wLevel]
	cp THE_GRASSLANDS_NIGHT_1
	jr nc, .group_2
; group_1
	ld a, [wROMBank]
	push af
	ld a, $30
	bankswitch
	jr .got_bank
.group_2
	ld a, [wROMBank]
	push af
	ld a, $31
	bankswitch

.got_bank
	ld a, [wInternalRoomID]
	add a ; *2
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld e, a
	ld h, [hl]
	ld l, e
	ld a, h
	debug_assert_not $ff

	ld a, [hli]
	ld [wSpawnPos], a
	ld a, [hl]
	swap a
	and $0f
	ld [wc0b7], a
	ld a, [hli]
	and $0f
	ld [wc0b6], a
	ld a, [hl]
	swap a
	and $0f
	ld [wc0b8], a
	ld a, [hli]
	and $0f
	ld [wc0b9], a
	ld a, [hli]
	ld [wCameraConfigFlags], a

	ld a, [hli]
	ld [wEnemyGroup], a
	push hl
	ldh a, [rSVBK]
	push af
	ld a, BANK("WRAM1")
	ldh [rSVBK], a
	farcall LoadEnemyGroupData
	pop af
	ldh [rSVBK], a
	pop hl

	ld a, [hli]
	ld [wAnimatedTilesGroup], a
	push hl
	farcall InitRoomAnimatedTiles
	pop hl

	ld a, [hli]
	ld [wRoomPalCycle], a
	push hl
	farcall InitRoomAnimatedPals
	pop hl

	ld a, [hl]
	ld [wRoom], a
	farcall LoadRoom
	pop af
	bankswitch

	ld a, [wc0b6]
	add a
	add a
	add a
	add a ; *16
	add $a0
	jr nz, .asm_2963
	ld a, $ff
.asm_2963
	ld [wc0c4], a

	ld a, [wc0b7]
	add a
	add a
	add a
	add a ; *16
	add $a0
	ld [wc0c5], a

	ld a, [wc0b9]
	add a
	add a
	add a ; *8
	add $b0
	jr nz, .asm_297e
	ld a, $ff
.asm_297e
	ld [wc0c7], a

	ld a, [wc0b8]
	add a
	add a
	add a ; *8
	add $b0
	ld [wc0c6], a
	ret
; 0x298d

Func_298d:: ; 298d (0:298d)
	ld a, [wRoomPermissionMap]
	add a
	ld e, a
	ld d, $00
	ld hl, PointerTable_c090d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomPermissionMapBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, wc600
	ld bc, $200
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x29bf

LoadRoomTileMap:: ; 29bf (0:29bf)
	ld a, [wRoomTileMap]
	add a
	ld e, a
	ld d, $00
	ld hl, TileMapsPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc0d0]
	ld [wTempBank], a
	ld bc, w3d300
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x29e7

LoadRoomMainTiles:: ; 29e7 (0:29e7)
	ld a, [wRoomMainTiles]
	add a
	ld e, a
	ld d, $00
	ld hl, LevelMainTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomMainTilesBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x2a19

LoadRoomSpecialTiles:: ; 2a19 (0:2a19)
	ld a, $1 ; VRAM1
	ldh [rVBK], a
	ld a, [wRoomSpecialTiles]
	add a
	ld e, a
	ld d, $00
	ld hl, SpecialTilesPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wRoomSpecialTilesBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld de, v0Tiles2
	ld bc, $800
	call CopyHLToDE_BC
	pop af
	bankswitch
	xor a
	ldh [rVBK], a
	ret
; 0x2a52

LoadRoomPalettes:: ; 2a52 (0:2a52)
	ld a, [wRoomPalettes]
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, RoomPals
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPaletteBank]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall LoadPalsToTempPals1
	ret
; 0x2a77

UpdateRoomAnimatedPals:: ; 2a77 (0:2a77)
	ldh a, [rLY]
	cp $88
	jp nc, .done
	ld a, [wRoomPalCycleDuration]
	and a
	jp z, .done
	ld b, a
	ld a, [wRoomPalCycleCounter]
	inc a
	ld [wRoomPalCycleCounter], a
	cp b
	jp c, .done

	xor a
	ld [wRoomPalCycleCounter], a
	ld a, [wRoomPalCyclePtr + 0]
	ld h, a
	ld a, [wRoomPalCyclePtr + 1]
	ld l, a

	ld a, [wRoomPalCycleIndex]
	inc a
	cp ROOM_PAL_CYCLE_LENGTH
	jr c, .ok
	xor a ; reset to 0
.ok
	ld [wRoomPalCycleIndex], a

	ld e, a
	ld d, $00
	add hl, de
	ld a, [wROMBank]
	push af
	ld a, BANK(RoomPalCycles)
	bankswitch
	ld d, $00
	ld a, [hl]
	add a ; *2
	ld e, a
	rl d
	ld hl, RoomPals
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	bankswitch

	ld a, [wROMBank]
	push af
	ld a, BANK("Palettes")
	bankswitch
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ld b, 5
	ld c, LOW(rBCPD)
.wait_lcd_1
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_1
.wait_lcd_2
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_2

REPT 12
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	dec b
	jr nz, .wait_lcd_1

.wait_lcd_3
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_3
.wait_lcd_4
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_4

REPT 3
	ld a, [hli]
	ld [$ff00+c], a
ENDR
	ld a, [hl]
	ld [$ff00+c], a
	pop af
	bankswitch
.done
	ret
; 0x2b25

	INCROM $2b25, $2c00

FarCopyHLToDE_BC2:: ; 2c00 (0:2c00)
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x2c18

FarDecompress:: ; 2c18 (0:2c18)
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	call Decompress
	pop af
	bankswitch
	ret
; 0x2c30

; hl = source
; wdc11 = destination
Func_2c30:: ; 2c30 (0:2c30)
	ld a, h
	ldh [rHDMA1], a
	ld a, l
	ldh [rHDMA2], a
	ld a, [wdc11 + 0]
	ldh [rHDMA3], a
	ld a, [wdc11 + 1]
	ldh [rHDMA4], a
	ld a, [w1dc13]
	ldh [rHDMA5], a
	ret
; 0x2c46

Func_2c46:: ; 2c46 (0:2c46)
	ld de, rBCPS
	ld c, 4
	jr .asm_2c52

	ld de, rOCPS
	ld c, 4

.asm_2c52
	ld a, $80
	ld [de], a
	inc e
.loop
REPT $10
	ld a, [hli]
	ld [de], a
ENDR
	dec c
	jr nz, .loop
	ret
; 0x2c7a

; hl = golf object duration
; de = frameset
; outputs in c whether animation finished
UpdateGolfObjectAnimation:: ; 2c7a (0:2c7a)
	ld c, $00
	ld a, [hl] ; duration
	sub $1
	ld [hli], a
	ret nc ; not finished yet
	ld a, [hli] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .finished_animation
	inc bc
	ld [hld], a ; frame
	ld a, [hl]
	add $2
	ld [hld], a
	ld a, [bc]
	ld [hl], a ; duration
	ld c, FALSE
	ret

.finished_animation
	ld a, [hl] ; last frame
	ld [wGolfAnimLastFrame], a
	ld a, [de]
	ld [hld], a ; frame
	inc de
	ld a, $2
	ld [hld], a
	ld a, [de]
	ld [hl], a
	ld c, TRUE
	ret
; 0x2ca7

; hl = golf object sprite
; wGolfOAMPtr = oam pointer
AddGolfSprite:: ; 2ca7 (0:2ca7)
	ld a, [hli]
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld a, [wGolfOAMPtr + 0]
	ld h, a
	ld a, [wGolfOAMPtr + 1]
	ld l, a
	call TryAddSprite
	ret
; 0x2cc3

; updates Golf Wario sprite, given its state
; and which direction it is facing
UpdateGolfWarioAnimation:: ; 2cc3 (0:2cc3)
	ld hl, .OAMBanks
	ld a, [wGolfWarioState]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempBank], a

	ld a, [wGolfWarioDir]
	and a
	jr z, .dir_right
; dir left
	ld a, c
	add NUM_GOLF_WARIO_STATES
	ld c, a
.dir_right
	ld hl, .OAMTable
	ld b, $00
	sla c
	add hl, bc
	ld a, [hli]
	ld [wGolfOAMPtr + 1], a
	ld a, [hl]
	ld [wGolfOAMPtr + 0], a

	ld hl, .Framesets
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld hl, wGolfWarioDuration
	call UpdateGolfObjectAnimation
	ld a, c
	ld [wHasGolfWarioAnimationFinished], a
	pop af
	bankswitch

	ld a, [wHasGolfWarioAnimationFinished]
	and a
	call nz, HoldGolfWarioLastFrame
	ld a, [wGolfWarioCurrentFrame]
	ld [wGolfWarioFrame], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld hl, wGolfWarioSprite
	call AddGolfSprite
	pop af
	bankswitch
	ret

.OAMBanks
	db BANK(OAM_14000)
	db BANK(OAM_1426c)
	db BANK(OAM_14d1b)
	db BANK(OAM_14d1b)
	db BANK(OAM_14d1b)
	db BANK(OAM_1cb0dd)
	db BANK(OAM_d49cc)
	db BANK(OAM_d49cc)
	db BANK(OAM_d49cc)
	db BANK(OAM_d49cc)
	db BANK(OAM_14a82)
	db BANK(OAM_1fc31b)

.OAMTable
	; facing right
	dw OAM_14000
	dw OAM_1426c
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_1cb0dd
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_14a82
	dw OAM_1fc31b

	; facing left
	dw OAM_14000
	dw OAM_1426c
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_14d1b
	dw OAM_1cb0dd
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_d49cc
	dw OAM_14a82
	dw OAM_1fc31b

.Framesets
	; facing right
	dw Frameset_1425f
	dw Frameset_149c5
	dw Frameset_151fd
	dw Frameset_2da4
	dw Frameset_2da7
	dw Frameset_1cb285
	dw Frameset_d4d1b
	dw Frameset_d4d5f
	dw Frameset_2db0
	dw Frameset_2db5
	dw Frameset_14cf6
	dw Frameset_1fc47c

	; facing left
	dw Frameset_14252
	dw Frameset_149b4
	dw Frameset_151e4
	dw Frameset_2daa
	dw Frameset_2dad
	dw Frameset_1cb2ac
	dw Frameset_d4d1b
	dw Frameset_d4d5f
	dw Frameset_2db0
	dw Frameset_2db5
	dw Frameset_14cf6
	dw Frameset_1fc473
; 0x2da4

Frameset_2da4: ; 2da4 (00:2da4)
	db $08,  1
	db $ff
; 0x2da7

Frameset_2da7: ; 2da7 (00:2da7)
	db $09, 15
	db $ff
; 0x2daa

Frameset_2daa: ; 2daa (00:2daa)
	db $00,  1
	db $ff
; 0x2dad

Frameset_2dad: ; 2dad (00:2dad)
	db $01, 15
	db $ff
; 0x2db0

Frameset_2db0: ; 2db0 (00:2db0)
	db $00, 15
	db $01, 15
	db $ff
; 0x2db5

Frameset_2db5: ; 2db5 (00:2db5)
	db $09,  8
	db $ff
; 0x2db8

	INCROM $2db8, $3000

; given the obj struct in hl
; update its sprite with its current position
UpdateObjSprite:: ; 3000 (0:3000)
	ld a, [wROMBank]
	push af
	ld a, [hl] ; unk7
	swap a
	and %111
	or BANK("Objects OAM 1")
	bankswitch
	ld l, e
	ld a, [hli] ; screen y pos
	ld [wCurSpriteYCoord], a
	ld a, [hli] ; screen x pos
	ld [wCurSpriteXCoord], a
	ld a, [hli] ; frame
	ld [wCurSpriteFrame], a
	ld a, [hli] ; OAM ptr
	ld h, [hl]
	ld l, a
	ld a, [wCurSpriteFrame]
	ld d, $00
	add a ; *2
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXCoord
	ld a, [hld]
	ld c, a
	ld a, [hld] ; wCurSpriteYCoord
	ld b, a
	ld l, [hl] ; wVirtualOAMByteSize
	ld h, HIGH(wVirtualOAM)
.loop_sprites
	ld a, l
	cp LOW(wVirtualOAMEnd)
	jr nc, .done
	ld a, [de]
	cp $80
	jr z, .done
	ld a, [de]
	add b
	ld [hli], a ; SPRITEOAMSTRUCT_YCOORD
	inc de
	ld a, [de]
	add c
	ld [hli], a ; SPRITEOAMSTRUCT_XCOORD
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEOAMSTRUCT_TILE_ID
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEOAMSTRUCT_ATTRIBUTES
	ld a, l
	ld [wVirtualOAMByteSize], a
	inc de
	jr .loop_sprites
.done
	pop af
	bankswitch
	ret
; 0x305c

Func_305c:: ; 305c (0:305c)
	ld a, [wCurObjUnk18]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x3069

Func_3069:: ; 3069 (0:3069)
	ld a, [wCurObjUnk18]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
; 0x3076

Func_3076:: ; 3076 (0:3076)
	ld a, [wCurObjUnk18]
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x3083

	INCROM $3083, $30a4

MoveObjectDown_Fast:: ; 30a4 (0:30a4)
	ld hl, wCurObjYPos
	ld a, [hl]
	add 2
	ld [hli], a
	ret nc
	inc [hl]
	ret
; 0x30ae

	INCROM $30ae, $30b8

; moves current object right
; by 0.5 pixel per frame
MoveObjectRight_Slow:: ; 30b8 (0:30b8)
	ld a, [wGlobalCounter]
	rra
	ret c
;	fallthrough

; moves current object right
; at 1 pixel per frame
MoveObjectRight:: ; 30bd (0:30bd)
	ld hl, wCurObjXPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret
; 0x30c5

; moves current object left
; by 0.5 pixel per frame
MoveObjectLeft_Slow:: ; 30c5 (0:30c5)
	ld a, [wGlobalCounter]
	rra
	ret nc
;	fallthrough

; moves current object left
; at 1 pixel per frame
MoveObjectLeft:: ; 30ca (0:30ca)
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30d4

; moves current object down
; at 0.5 pixel per frame
MoveObjectDown_Slow:: ; 30d4 (0:30d4)
	ld a, [wGlobalCounter]
	rra
	ret c
;	fallthrough

; moves current object down
; at 1 pixel per frame
MoveObjectDown:: ; 30d9 (0:30d9)
	ld hl, wCurObjYPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret
; 0x30e1

	INCROM $30e1, $30e6

; moves current object up
; at 1 pixel per frame
MoveObjectUp:: ; 30e6 (0:30e6)
	ld hl, wCurObjYPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30f0

; input:
; - de = frameset pointer
SetObjectFramesetPtr:: ; 30f0 (0:30f0)
	ld hl, wCurObjFramesetPtr
	ld a, e
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ret
; 0x30fb

	INCROM $30fb, $3104

UpdateObjectFrame:: ; 3104 (0:3104)
	ld hl, wCurObjFrameDuration
	ld a, [hld]
	sub 1
	ret nc
	ld a, [wROMBank]
	push af
	ld a, BANK("Object Framesets")
	bankswitch
	dec l
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr nz, .asm_312a
	ld a, [de] ; first frame
.asm_312a
	ld [wCurObjFrame], a
	jr HomeJumpRet
; 0x312f

UpdateObjectAnimation:: ; 312f (0:312f)
	ld hl, wCurObjFrameDuration
	ld a, [hl]
	sub 1
	ld [hld], a
	ret nc
	ld a, [wROMBank]
	push af
	ld a, BANK("Object Framesets")
	bankswitch
	dec l
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset
	ld [wCurObjFrame], a
	ld a, [hl]
	add $2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; OBJ_FRAME_DURATION
	jr HomeJumpRet
.reset
	ld a, $2
	ld [hld], a ; OBJ_FRAMESET_OFFSET
	ld a, [de] ; first frame
	ld [wCurObjFrame], a
	inc de
	ld a, [de] ; first duration
	ld [hl], a ; OBJ_FRAME_DURATION
;	fallthrough

HomeJumpRet:: ; 316b (0:316b)
	pop af
	bankswitch
	ret
; 0x3173

Func_3173:: ; 3173 (0:3173)
	homejp Func_62e57
; 0x3182

VanishObject2:: ; 3182 (0:3182)
	homejp _VanishObject2
; 0x3191

Func_3191:: ; 3191 (0:3191)
	homejp Func_62e8f
; 0x31a0

Func_31a0:: ; 31a0 (0:31a0)
	homejp Func_62ea5
; 0x31af

Func_31af:: ; 31af (0:31af)
	homejp Func_62f76
; 0x31be

Func_31be:: ; 31be (0:31be)
	homejp Func_62f8c
; 0x31cd

Func_31cd:: ; 31cd (0:31cd)
	homejp Func_62eaa
; 0x31dc

Func_31dc:: ; 31dc (0:31dc)
	homejp Func_62ec0
; 0x31eb

Func_31eb:: ; 31eb (0:31eb)
	homejp Func_62f91
; 0x31fa

Func_31fa:: ; 31fa (0:31fa)
	homejp Func_62fa7
; 0x3209

Func_3209:: ; 3209 (0:3209)
	homejp Func_62e74
; 0x3218

Func_3218:: ; 3218 (0:3218)
	homejp Func_62e8a
; 0x3227

Func_3227:: ; 3227 (0:3227)
	homejp Func_62f5b
; 0x3236

Func_3236:: ; 3236 (0:3236)
	homejp Func_62f71
; 0x3245

Func_3245:: ; 3245 (0:3245)
	homejp Func_62c9f
; 0x3254

Func_3254:: ; 3254 (0:3254)
	homejp Func_62d7d
; 0x3263

Func_3263:: ; 3263 (0:3263)
	homejp Func_6303f
; 0x3272

Func_3272:: ; 3272 (0:3272)
	homejp Func_63050
; 0x3281

Func_3281:: ; 3281 (0:3281)
	homejp Func_6305f
; 0x3290

ObjState_Fall:: ; 3290 (0:3290)
	homejp _ObjState_Fall
; 0x329f

ObjState_StandingFall:: ; 329f (0:329f)
	homejp _ObjState_StandingFall
; 0x32ae

Func_32ae:: ; 32ae (0:32ae)
	homejp Func_62ae5
; 0x32bd

Func_32bd:: ; 32bd (0:32bd)
	homejp Func_62bce
; 0x32cc

Func_32cc:: ; 32cc (0:32cc)
	homejp Func_62ca8
; 0x32db

Func_32db:: ; 32db (0:32db)
	homejp Func_62d86
; 0x32ea

Func_32ea:: ; 32ea (0:32ea)
	homejp Func_628ea
; 0x32f9

Func_32f9:: ; 32f9 (0:32f9)
	homejp Func_629a6
; 0x3308

Func_3308:: ; 3308 (0:3308)
	homejp Func_62908
; 0x3317

Func_3317:: ; 3317 (0:3317)
	homejp Func_62898
; 0x3326

Func_3326:: ; 3326 (0:3326)
	homejp Func_62840
; 0x3335

Func_3335:: ; 3335 (0:3335)
	homejp Func_61f54
; 0x3344

Func_3344:: ; 3344 (0:3344)
	homejp Func_620a6
; 0x3353

Func_3353:: ; 3353 (0:3353)
	homejp Func_621fb
; 0x3362

Func_3362:: ; 3362 (0:3362)
	homejp Func_622bd
; 0x3371

Func_3371:: ; 3371 (0:3371)
	homejp Func_62926
; 0x3380

Func_3380:: ; 3380 (0:3380)
	homejp Func_62382
; 0x338f

Func_338f:: ; 338f (0:338f)
	homejp Func_6247b
; 0x339e

Func_339e:: ; 339e (0:339e)
	homejp Func_62574
; 0x33ad

Func_33ad:: ; 33ad (0:33ad)
	homejp Func_62605
; 0x33bc

ObjState_FullThrowLeft:: ; 33bc (0:33bc)
	homejp Func_626da
; 0x33cb

ObjState_FullThrowRight:: ; 33cb (0:33cb)
	homejp Func_62768
; 0x33da

ObjState_BumpLeft:: ; 33da (0:33da)
	homejp _ObjState_BumpLeft
; 0x33e9

ObjState_BumpRight:: ; 33e9 (0:33e9)
	homejp _ObjState_BumpRight
; 0x33f8

Func_33f8:: ; 33f8 (0:33f8)
	homejp Func_62892
; 0x3407

Func_3407:: ; 3407 (0:3407)
	homejp Func_6283a
; 0x3416

; bc = object creation data
CreateObjectAtRelativePos:: ; 3416 (0:3416)
	homecall _CreateObjectAtRelativePos
	ret
; 0x342d

; bc = object creation data
CreateObjectFromCurObjPos:: ; 342d (0:342d)
	homecall _CreateObjectFromCurObjPos
	ret
; 0x3444

Func_3444:: ; 3444 (0:3444)
	homecall Func_632ac
	ret
; 0x345b

	INCROM $345b, $3472

Func_3472:: ; 3472 (0:3472)
	homecall Func_631a1
	ret
; 0x3489

	INCROM $3489, $34b7

Func_34b7:: ; 34b7 (0:34b7)
	homecall Func_631e8
	ret
; 0x34ce

	INCROM $34ce, $34e5

VanishObject:: ; 34e5 (0:34e5)
	homecall _VanishObject
	ret
; 0x34fc

	INCROM $34fc, $3513

Func_3513:: ; 3513 (0:3513)
	homecall Func_19bc3
	ld a, b
	ret
; 0x352b

Func_352b:: ; 352b (0:352b)
	homecall Func_19b7b
	ld a, b
	ret
; 0x3543

Func_3543:: ; 3543 (0:3543)
	homecall Func_19b51
	ld a, b
	ret
; 0x355b

Func_355b:: ; 355b (0:355b)
	homecall Func_19b61
	ld a, b
	ret
; 0x3573

Func_3573:: ; 3573 (0:3573)
	homecall Func_19b69
	ld a, b
	ret
; 0x358b

Func_358b:: ; 358b (0:358b)
	homecall Func_19b9b
	ld a, b
	ret
; 0x35a3

Func_35a3:: ; 35a3 (0:35a3)
	homecall Func_19b8b
	ld a, b
	ret
; 0x35bb

	INCROM $35bb, $3a00

; b = sprite bank
; de = pointer to sprite
AddOWSpriteWithScroll:: ; 3a00 (0:3a00)
	ld a, [wSCY]
	ld c, a
	ld a, [hli] ; y coord
	sub c
	ld c, $10
	add c
	ld [wCurSpriteYCoord], a
	ld a, [wSCX]
	ld c, a
	ld a, [hli] ; x coord
	sub c
	ld c, $08
	add c
	ld [wCurSpriteXCoord], a
	ld a, [hli] ; tileID
	ld [wCurSpriteFrame], a
	ld a, [hl] ; attributes
	ld [wCurSpriteAttributes], a
	ld h, d
	ld l, e
;	fallthrough

AddOWSpriteWithScroll_GotParams:: ; 3a22 (0:3a22)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x3a38

; hl = OAM data
; b = sprite bank
; de = pointer to sprite
AddOWSprite:: ; 3a38 (0:3a38)
	ld a, [hli]
	ld c, $10
	add c
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld c, $08
	add c
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a

	ld h, d
	ld l, e
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call TryAddSprite
	pop af
	bankswitch
	ret
; 0x3a66

; hl = wSceneObjXDuration
; de = frameset pointer
; b = bank
UpdateOWAnimation:: ; 3a66 (0:3a66)
	xor a
	ld [wOWAnimationFinished], a

	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [hl] ; duration
	sub 1
	ld [hli], a
	jr nc, .done
	ld a, [hl] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .frameset_end
	ld d, a
	ld a, [hl]

.advance_frameset
	add $2
	ld [hld], a ; frameset offset
	inc bc
	ld a, [bc]
	dec a
	ld [hld], a ; duration
	dec l
	ld [hl], d ; frame

.done
	ld a, $f8
	and l
	ld l, a
	ld b, h
	add $6
	ld c, a
	pop af
	bankswitch
	ret

.frameset_end
	ld [wOWAnimationFinished], a
	ld b, d
	ld c, e
	ld a, [de]
	ld d, a
	xor a
	jr .advance_frameset
; 0x3aac

; returns TRUE in a and carry set if treasure
; in input a has already been collected
; if not collected returns z set
; a = * constant
IsTreasureCollected:: ; 3aac (0:3aac)
	ld hl, wTreasuresCollected
	ld e, a
	srl e
	srl e
	srl e ; / 8
	ld d, $00
	add hl, de ; hl = wTreasuresCollected + (a / 8)

	ld e, $01
	bit 2, a
	jr z, .low_nybble
	swap e ; = $10
.low_nybble

	and %11
	ld d, a
	ld a, e
	jr z, .check_obtained
	rla
	dec d
	jr z, .check_obtained
	rla
	dec d
	jr z, .check_obtained
	rla
.check_obtained
	ld d, a
	and [hl]
	ret z ; not obtained
	ld a, TRUE
	scf
	ret
; 0x3ad7

GetOWCoordInTilemap:: ; 3ad7 (0:3ad7)
	ld a, [hli]
	and %11111000
	rlca
	rlca
	ld c, a
	and $0f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	ld a, [hl]
	and %11111000
	rlca
	swap a
	add c
	ld l, a
	ld [wOWTilemapPtr + 0], a
	ld a, b
	add HIGH(wTilemap)
	ld h, a
	ld [wOWTilemapPtr + 1], a
	ret
; 0x3af7

; loads source address of tiles
; with the given level's name for HDMA transfer
; writes them to v0Tiles2 + $500
; b = map side constant (NORTH, ...)
; d = level index within that map side
LoadLevelName:: ; 3af7 (0:3af7)
	ld a, BANK(LevelNamesJPGfx)
	ld hl, wLanguage
	add [hl]
	ld [wHDMABank], a
	xor a
	ld [wHDMA], a
	ld hl, LevelNamesJPGfx ; aka LevelNamesENGfx
	ld c, $00
	ld a, b
	swap a ; *$10
	ld b, a
	add hl, bc
	ld a, d
	add a ; *2
	ld d, a
	ld e, $00
	add hl, de
	ld a, h
	ld [w2d0b5SourceHi], a
	ld a, l
	ld [w2d0b5SourceLo], a
	ld a, $15
	ld [w2d0b5DestHi], a
	xor a
	ld [w2d0b5DestLo], a
	ld a, $1f
	ld [w2d0b5Mode], a
	ret
; 0x3b2b

; copies c bytes from b:hl to de
CopyFarBytes:: ; 3b2b (0:3b2b)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld b, c
	call CopyHLToDE
	pop af
	bankswitch
	ret
; 0x3b42

; copies c * $100 bytes from bank b
; at address hl to de
CopyFarBytes_Long:: ; 3b42 (0:3b42)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld b, c
	ld c, $00
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x3b5b

LoadFarTiles:: ; 3b5b (0:3b5b)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld bc, $80 tiles
	ld de, v0Tiles2
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x3b77

LoadFarBGMap:: ; 3b77 (0:3b77)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld bc, 18 * BG_MAP_WIDTH
	ld de, v0BGMap0
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret
; 0x3b93

; sets scene obj's state and
; resets its animation data
; a = state
SetSceneObjState:: ; 3b93 (0:3b93)
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret
; 0x3b98

PlayOverworldMusic:: ; 3b98 (0:3b98)
	ld a, [w2d011]
	and a
	jr nz, .night
	play_music2 MUSIC_OVERWORLD_DAY
	ret
.night
	play_music2 MUSIC_OVERWORLD_NIGHT
	ret
; 0x3bb8

LoadFarPalsToTempPals1:: ; 3bb8 (0:3bb8)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals1
	pop af
	bankswitch
	ret
; 0x3bce

LoadFarPalsToTempPals2:: ; 3bce (0:3bce)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call LoadPalsToTempPals2
	pop af
	bankswitch
	ret
; 0x3be4

ApplyPalConfig:: ; 3be4 (0:3be4)
	ld c, [hl]
	xor a
	ld [hli], a
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
.loop
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .loop
	ret
; 0x3c03

Func_3c03:: ; 3c03 (0:3c03)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w2d0b5
	ld a, [hli]
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	xor a
	ld [wHDMABank], a
	ret
; 0x3c1f

; same as ApplyMovement but the x offsets are mirrored
; hl = OW obj
; de = relative positions
ApplyMovement_Mirrored:: ; 3c1f (0:3c1f)
	call Func_3c35
	sub e
	jr Func_3c29
; 0x3c25

; hl = OW obj
; de = relative positions
ApplyMovement:: ; 3c25 (0:3c25)
	call Func_3c35
	add e
;	fallthrough

Func_3c29:: ; 3c29 (0:3c29)
	ld [bc], a

	; reset if reached the end
	ld a, [hl]
	cp $80
	ret nz

	ld a, $07
	or c
	ld c, a
	xor a
	ld [bc], a ; unk7
	ret
; 0x3c35

Func_3c35: ; 3c35 (0:3c35)
	ld c, l
	ld b, h
	ld a, $07
	or l
	ld l, a
	ld a, [hl] ; unk7
	inc [hl]
	add a ; *2
	ld l, a
	ld a, $00
	adc $00
	ld h, a
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [bc] ; y coord
	add d
	ld [bc], a
	inc c
	ld a, [bc] ; x coord
	ret
; 0x3c4f

AddOffsetInPointerTable:: ; 3c4f (0:3c4f)
	add a ; *2
	ld e, a
	ld a, $00
	adc 0
	ld d, a
	add hl, de
	ret
; 0x3c58

; outputs in hl the pointer corresponding
; to the index given in register a
; from the pointer table given in hl
GetPointerFromTableHL:: ; 3c58 (0:3c58)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 0x3c5f

; same as GetPointerFromTableHL
; but outputs pointer to de
GetPointerFromTableDE:: ; 3c5f (0:3c5f)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 0x3c66

; outputs in hl the cth word
; contained in the ath table entry
; in the pointer table in hl
GetCthWordFromAthTable:: ; 3c66 (0:3c66)
	call AddOffsetInPointerTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	call AddOffsetInPointerTable
	ret
; 0x3c71

GetByteFromPointerInHL:: ; 3c71 (0:3c71)
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ret
; 0x3c76

Func_3c76:: ; 3c76 (0:3c76)
	xor a
	ld hl, w2d0c0
	ld bc, $10
	call WriteAToHL_BCTimes
	ret
; 0x3c81

	INCROM $3c81, $3f00
