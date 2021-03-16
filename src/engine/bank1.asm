Func_4000: ; 4000 (1:4000)
	ld a, [wSequence]
	jumptable

	dw Func_402b
	dw Func_4686
	dw Func_46cc
	dw Func_46dc
	dw Func_46f6
	dw Func_4710
	dw Func_472a
	dw Func_474c
	dw Func_4766
	dw Func_4776
	dw Func_4790
	dw Func_47aa
	dw Func_47fd
	dw Func_4817
	dw Func_4831
	dw Func_4028
	dw Func_4028
	dw Func_4028
; 0x4028

Func_4028: ; 4028 (1:4028)
	jp Init
; 0x402b

Func_402b: ; 402b (1:402b)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call .jump
	pop af
	ldh [rSVBK], a
	ret

.jump
	ld a, [wSubSequence]
	jumptable

	dw SubSeq_FastFadeToWhite
	dw Func_405f
	dw SubSeq_SlowFadeFromWhite
	dw Func_41cf
	dw Func_42ed
	dw Func_43b5
	dw Func_44c3
	dw Func_4508
	dw SubSeq_SlowFadeBGToWhite
	dw Func_4640
	dw Func_4670
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
; 0x405f

Func_405f: ; 405f (1:405f)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM
	call LoadTitleScreenPals
	call LoadTitleScreenTiles
	call LoadTitleScreenTileMap
	call VBlank_49db

	ld a, $04
	ld [wTempSCY], a
	ldh [rSCY], a
	xor a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld a, [wceef]
	and a
	jr nz, .asm_40fc

	ld hl, wUnk
	ld a, $40
	ld [hli], a
	ld a, $d0
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_712c)
	ld [hli], a
	ld a, LOW(FrameData_712c)
	ld [hli], a
	xor a
	ld [hld], a
	ld [w3d522], a
	call Func_145a

	ld hl, wObj0
	ld a, $80
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_6ce6)
	ld [hli], a
	ld a, LOW(FrameData_6ce6)
	ld [hl], a
	call Func_145a

	ld hl, wObj3
	ld a, $10
	ld [hli], a
	ld a, $00
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_71a1)
	ld [hli], a
	ld a, LOW(FrameData_71a1)
	ld [hl], a
	call Func_145a

	ld hl, w3d547
	ld a, $08
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_71a4)
	ld [hli], a
	ld a, LOW(FrameData_71a4)
	ld [hl], a
	call Func_145a

	ld hl, wObj3
	call Func_4b93
	ld hl, w3d547
	call Func_4b93

	ld a, $00
	ld [w3d513], a
	jp .asm_41a8

.asm_40fc
	ld hl, wUnk
	ld a, $6c
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_7198)
	ld [hli], a
	ld a, LOW(FrameData_7198)
	ld [hli], a
	xor a
	ld [hld], a
	ld [w3d522], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0 + $184
	ld de, $20
	ld c, 2
.asm_4121
	push hl
	ld b, 11
.asm_4124
	ld a, [hl]
	or %10000000
	ld [hli], a
	dec b
	jr nz, .asm_4124
	pop hl
	add hl, de
	push hl
	ld b, 11
.asm_4130
	ld a, [hl]
	or %10000000
	ld [hli], a
	dec b
	jr nz, .asm_4130
	pop hl
	add hl, de
	add hl, de
	add hl, de
	dec c
	jr nz, .asm_4121

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_6b47
	ld de, v0BGMap0 + $1c4
	push de
	ld b, 12
	call CopyHLToDE
	pop de
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	ld b, 12
	call CopyHLToDE

	ld hl, wObj0
	ld a, $82
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_4178
	ld a, HIGH(FrameData_6ce9)
	ld [hli], a
	ld a, LOW(FrameData_6ce9)
	ld [hl], a
	jr .asm_417e
.asm_4178
	ld a, HIGH(FrameData_6d1e)
	ld [hli], a
	ld a, LOW(FrameData_6d1e)
	ld [hl], a
.asm_417e
	call Func_145a

	ld hl, wObj1
	ld a, $86
	ld [hli], a
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_4192
	ld a, $44
	jr .asm_4194
.asm_4192
	ld a, $40
.asm_4194
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_6d1b)
	ld [hli], a
	ld a, LOW(FrameData_6d1b)
	ld [hl], a
	call Func_145a

	ld a, $01
	ld [w3d513], a

.asm_41a8
	ld hl, wObj2
	ld a, $24
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_6d18)
	ld [hli], a
	ld a, LOW(FrameData_6d18)
	ld [hl], a
	call Func_145a

	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	xor a
	ld [wcee5], a
	ld [wc08f], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x41cf

Func_41cf: ; 41cf (1:41cf)
	ld a, [wceef]
	and a
	jp nz, Func_44f0
	call Func_4e5e
	call Func_4d45

	ld a, [wUnkUnknown]
	dec a
	jr z, .asm_420a ; 1
	dec a
	jr z, .asm_4235 ; 2
	dec a
	jr z, .asm_4250 ; 3
	dec a
	jr z, .asm_4266 ; 4
	dec a
	jp z, .asm_4294 ; 5

	; > 5
	ld hl, wcee5
	inc [hl]
	ld a, [hl]
	cp $b4
	jp c, Func_42cc
	ld [hl], $00
	ld a, $00
	ldh [hffb1], a
	ld a, $34
	ldh [hffb2], a
	ld hl, wUnkUnknown
	inc [hl]
	jp Func_42cc

.asm_420a
	ld hl, wUnkObjXCoord
	ld a, [hl]
	cp $48
	jr nc, .asm_4224
	cp $38
	jr nc, .asm_4225
	cp $30
	jr z, .asm_4229
	ld a, [wc08f]
	and %00000011
	jp nz, Func_42cc
	jr .asm_4225

.asm_4224
	dec [hl]
.asm_4225
	dec [hl]
	jp Func_42cc

.asm_4229
	ld a, $30
	ld [wcee5], a
	ld hl, wUnkUnknown
	inc [hl]
	jp Func_42cc

.asm_4235
	ld hl, wcee5
	dec [hl]
	jp nz, Func_42cc
	ld [hl], $03
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(FrameData_71a7)
	ld [hli], a
	ld a, LOW(FrameData_71a7)
	ld [hl], a
	ld hl, wUnkUnknown
	inc [hl]
	jr Func_42cc

.asm_4250
	ld a, [wc08f]
	and $07
	jr nz, Func_42cc
	ld hl, wUnk
	inc [hl]
	ld a, [hl]
	cp $46
	jr nz, Func_42cc
	ld hl, wUnkUnknown
	inc [hl]
	jr Func_42cc

.asm_4266
	ld a, [wc08f]
	and $07
	jr nz, Func_42cc
	ld hl, wUnk
	dec [hl]
	ld a, [hl]
	cp $40
	jr nz, Func_42cc
	ld hl, wcee5
	dec [hl]
	jr z, .asm_4282
	ld hl, wUnkUnknown
	dec [hl]
	jr Func_42cc

.asm_4282
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $2c
	ld [hl], a
	ld hl, wUnkUnknown
	inc [hl]
	jr Func_42cc

.asm_4294
	ld hl, wUnkObjXCoord
	ld a, [hl]
	cp $c0
	jr z, .asm_42aa
	cp $38
	jr nc, .asm_42a7
	ld a, [wc08f]
	and %00000011
	jr nz, Func_42cc
.asm_42a7
	inc [hl]
	jr Func_42cc

.asm_42aa
	ld hl, wUnk
	ld a, $10
	ld [hli], a
	ld a, $c0
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	; fallthrough

Func_42b8: ; 42b8 (1:42b8)
	ld a, $71
	ld [hli], a
	ld a, $3d
	ld [hli], a
	xor a
	ld [hl], a
	ld [w3d522], a
	ld a, $1c
	ld [wcee5], a
	ld hl, wSubSequence
	inc [hl]
	; fallthrough

Func_42cc: ; 42cc (1:42cc)
	call Func_4cbb
	; fallthrough

Func_42cf: ; 42cf (1:42cf)
	ld hl, wUnkObjEnd - 1
	call Func_145a
	ld hl, wUnk
	call Func_4b93
	ld hl, wObj3
	call Func_4b93
	ld hl, w3d547
	call Func_4b93
	call ClearVirtualOAM
	jp ScrollIntroBackground
; 0x42ed

Func_42ed: ; 42ed (1:42ed)
	call Func_4d45
	call Func_4eb1
	ld a, [wUnkUnknown]
	dec a
	jr z, .asm_4336
	dec a
	jr z, .asm_4357
	ld hl, wcee5
	ld a, [hl]
	and a
	jr z, .asm_4307
	dec [hl]
	jp .asm_4394

.asm_4307
	ld hl, wUnkObjXCoord
	ld a, [hl]
	cp $40
	jr z, .asm_432b
	cp $48
	jr nc, .asm_431d
	ld a, [wc08f]
	and %00000011
	jp nz, .asm_4394
	jr .asm_4325

.asm_431d
	ld a, [wc08f]
	and $01
	jp nz, .asm_4394
.asm_4325
	ld hl, wUnkObjXCoord
	dec [hl]
	jr .asm_4394

.asm_432b
	ld a, $30
	ld [wcee5], a
	ld hl, wUnkUnknown
	inc [hl]
	jr .asm_4394

.asm_4336
	ld hl, wcee5
	dec [hl]
	jr nz, .asm_4394
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $44
	ld [hli], a
	xor a
	ld [w3d522], a
	ld a, $e0
	ld [wcee5], a
	ld hl, wUnkUnknown
	inc [hl]
	jr .asm_4394

.asm_4357
	ld a, [wUnkObjUnknown2]
	cp $18
	jr nz, .asm_436c
	ld a, [wUnkObjUnknown3]
	and a
	jr nz, .asm_436c
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $23
	ldh [hSoundID + 1], a
.asm_436c
	ld hl, wcee5
	dec [hl]
	jr nz, .asm_4394
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $f9
	ldh [hSoundID + 1], a
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $65
	ld [hli], a
	xor a
	ld [hl], a
	ld [w3d522], a
	ld a, $30
	ld [wcee5], a
	ld hl, wSubSequence
	inc [hl]
.asm_4394
	call Func_4cbb
	ld hl, wUnkObjEnd - 1
	call Func_145a
	ld hl, wObj3
	; fallthrough

Func_43a0: ; 43a0 (1:43a0)
	call Func_4b93
	ld hl, wUnk
	call Func_4b93
	ld hl, w3d547
	call Func_4b93
	call ClearVirtualOAM
	jp ScrollIntroBackground
; 0x43b5

Func_43b5: ; 43b5 (1:43b5)
	call Func_4d45
	ld a, [wUnkUnknown]
	dec a
	jr z, Func_43e7
	dec a
	jr z, Func_440c
	dec a
	jr z, Func_442f
	dec a
	jp z, Func_445a
	; fallthrough

Func_43c8: ; 43c8 (1:43c8)
	ld a, [w3d520]
	and a
	jp z, Func_4497
	ld a, $02
	ldh [hSoundID + 0], a
	ld a, $19
	ldh [hSoundID + 1], a
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $72
	ld [hli], a
	inc [hl]
	jp Func_4497
; 0x43e7

Func_43e7: ; 43e7 (1:43e7)
	ld a, [wc08f]
	and %00000011
	jr nz, .asm_43f2
	ld hl, wUnkObjXCoord
	inc [hl]
.asm_43f2
	ld hl, wUnk
	inc [hl]
	ld a, [hl]
	cp $10
	jp c, Func_4497
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $7b
	ld [hli], a
	inc [hl]
	jp Func_4497
; 0x440c

Func_440c: ; 440c (1:440c)
	ld a, [wc08f]
	and %00000011
	jr nz, .asm_4417
	ld hl, wUnkObjXCoord
	inc [hl]

.asm_4417
	ld hl, wUnk
	inc [hl]
	ld a, [hl]
	cp $30
	jr c, Func_4497
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $84
	ld [hli], a
	inc [hl]
	jr Func_4497

Func_442f: ; 442f (1:442f)
	ld a, [wc08f]
	and %00000011
	jr nz, .asm_443a
	ld hl, wUnkObjXCoord
	inc [hl]
.asm_443a
	ld hl, wUnk
	inc [hl]
	ld a, [hl]
	cp $70
	jr c, Func_4497
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $61
	ldh [hSoundID + 1], a
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $8d
	ld [hli], a
	inc [hl]
	jr Func_4497

Func_445a: ; 445a (1:445a)
	ld a, [wc088]
	cp $e0
	jr z, .asm_4466
	ld hl, wUnkObjXCoord
	inc [hl]
	inc [hl]
.asm_4466
	ld a, [w3d520]
	and a
	jr z, Func_449c
	ld hl, wUnkObjUnknown2
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $71
	ld [hli], a
	ld a, $98
	ld [hli], a
	xor a
	ld [hld], a
	ld [wcee5], a

	ld hl, Pals_5002
	call StorePalsInTempPals1
	ld hl, Pals_5042
	call StorePalsInTempPals2

	ld a, $00
	ldh [hffb1], a
	ld a, $33
	ldh [hffb2], a
	ld hl, wSubSequence
	inc [hl]
	jr Func_449c

Func_4497: ; 4497 (1:4497)
	call Func_4cbb
	jr Func_449f

Func_449c: ; 449c (1:449c)
	call Func_4cd0
	; fallthrough

Func_449f: ; 449f (1:449f)
	ld hl, wUnkObjEnd - 1
	call Func_145a
	ld a, [w3d514]
	ld [w3d520], a
	ld hl, wObj3
	call Func_4b93
	ld hl, wUnk
	call Func_4b93
	ld hl, w3d547
	call Func_4b93
	call ClearVirtualOAM
	jp ScrollIntroBackground
; 0x44c3

Func_44c3: ; 44c3 (1:44c3)
	ld hl, wUnkObjEnd - 1
	call Func_145a
	ld hl, wUnk
	call Func_4b93
	call ClearVirtualOAM
	ld a, [wceef]
	and a
	jr nz, Func_44f0
	ld hl, wcee5
	ld a, [hl]
	cp $78
	jr nc, .asm_44e2
	inc [hl]
	ret
.asm_44e2
	ld a, [wc08f]
	and %00000011
	call z, LightenBGToPal
	ld a, [wSubSequence]
	cp $07
	ret nz

Func_44f0: ; 44f0 (1:44f0)
	ld a, $00
	ldh [hffb1], a
	ld a, $33
	ldh [hffb2], a
	ld a, $08
	ld [wcee6], a
	ld a, $44
	ld [wcee5], a
	ld hl, wSubSequence
	ld [hl], $07
	ret
; 0x4508

Func_4508: ; 4508 (1:4508)
	ld hl, $d51c
	call Func_145a
	ld hl, wUnk
	call Func_4b93
	ld hl, wObj2
	call Func_4b73
	call Func_4bb3
	ld hl, wObj0
	call Func_4b73
	ld a, [wceef]
	and a
	jr z, .asm_453e
	ld a, [wc08f]
	and $07
	jr nz, .asm_4538
	ld a, [$d52e]
	xor $03
	ld [$d52e], a
.asm_4538
	ld hl, wObj1
	call Func_4b73
.asm_453e
	call ClearVirtualOAM
	ld hl, w3d513
	bit 7, [hl]
	jr nz, .asm_4578
	ld a, [hl]
	cp $00
	jr z, .asm_455c
	cp $01
	jr z, .asm_455c
	ld a, $08
	ld [wcee6], a
	ld a, $44
	ld [wcee5], a
	ret
.asm_455c
	ld hl, wcee5
	ld a, [hl]
	sub $01
	ld [hli], a
	ld b, a
	ld a, [hl]
	sbc $00
	ld [hl], a
	or b
	ret nz
	xor a
	ld [hld], a
	ld [hl], a
	ld a, [wca3c]
	or $40
	ld [wca3c], a
	jp Func_16d0
.asm_4578
	ld hl, w3d513
	ld a, [hl]
	and $0f
	cp $00
	jr z, .asm_45d6
	cp $01
	jr z, .asm_45ed
	cp $02
	jr z, .asm_45b1
	cp $04
	jp z, Func_1698

	ld a, $86
	ld [wObj1YCoord], a
	ld a, $82
	ld [wObj0YCoord], a

	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_45aa
	ld a, $80
	ld [wcee4], a
	ld bc, $6ce9
	jr .asm_45ad
.asm_45aa
	ld bc, $6d1e
.asm_45ad
	ld a, $01
	jr .asm_45c5
.asm_45b1
	ld a, $81
	ld [wcee4], a
	ld a, $90
	ld [wObj1YCoord], a
	ld a, $78
	ld [wObj0YCoord], a
	ld bc, $6cec
	ld a, $03
.asm_45c5
	ld [w3d513], a
	ld hl, $d527
	xor a
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	call Func_145a
	ret
.asm_45d6
	ld a, $0e
	ld [wSequence], a
	xor a
	ld [wSubSequence], a
	ret
	ld a, $09
	ld [wca3c], a
	ld a, [wceef]
	and $03
	ld [wceef], a
.asm_45ed
	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_4607
	ld a, [wceef]
	and $3c
	jr nz, .asm_45fd
	jr Func_461e
.asm_45fd
	ld a, $02
	ld [wSequence], a
	xor a
	ld [wSubSequence], a
	ret
.asm_4607
	call DisableLCD
	call FillWhiteBGPal
	call FillWhiteOBPal
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubSequence
	inc [hl]
	ret

Func_4619: ; 4619 (1:4619)
	ld a, $ff
	ld [wcee3], a
	; fallthrough

Func_461e: ; 461e (1:461e)
	ld a, $01
	ld [wSequence], a
	xor a
	ld [wSubSequence], a
	ret
; 0x4628

Func_4628: ; 4628 (1:4628)
	xor a
	ld [wAnimatedTilesFrameDuration], a
	ld [wAnimatedTilesGroup], a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	xor a
	ld [$d50d], a
	ld hl, wca3b
	set 7, [hl]
	jr Func_461e
; 0x4640

Func_4640: ; 4640 (1:4640)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM
	call Func_496b
	call Func_1c4a
	call Func_4972
	call Func_49a1
	call VBlank_354
	xor a
	ld [wTempSCY], a
	ldh [rSCY], a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	xor a
	ld [wcee5], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x4670

Func_4670: ; 4670 (1:4670)
	call Func_4d7f
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	call DisableLCD
	call FillWhiteBGPal
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	jp Func_461e
; 0x4686

Func_4686: ; 4686 (1:4686)
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	farcall Func_80392
	pop af
	ldh [rSVBK], a

	ld hl, wSequence
	ld a, [hl]
	cp $02
	ret nz
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $e3
	ldh [hSoundID + 1], a
	call Func_4ae7
	ld a, [wLevel]
	cp $ff
	jr z, .asm_46bd
	cp LEVEL_HIDDEN_FIGURE_BATTLE
	jr z, .final_battle
	ret

.asm_46bd
	ld a, $0a
	ld [wSequence], a
	ret

.final_battle
	ld a, $ff
	ldh [hSoundID + 0], a
	ld a, $00
	ldh [hSoundID + 1], a
	ret
; 0x46cc

Func_46cc: ; 46cc (1:46cc)
	farcall Func_8000
	ret
; 0x46dc

Func_46dc: ; 46dc (1:46dc)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_d4000
	pop af
	ldh [rSVBK], a
	ret
; 0x46f6

Func_46f6: ; 46f6 (1:46f6)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_1f0000
	pop af
	ldh [rSVBK], a
	ret
; 0x4710

Func_4710: ; 4710 (1:4710)
	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	farcall Func_1c8000
	pop af
	ldh [rSVBK], a
	ret
; 0x472a

Func_472a: ; 472a (1:472a)
	ld a, [wSubSequence]
	jumptable

	dw Func_4732
	dw Func_473c
; 0x4732

Func_4732: ; 4732 (1:4732)
	ld a, [wc08f]
	and $03
	ret nz
	call SubSeq_FastFadeToWhite
	ret
; 0x473c

Func_473c: ; 473c (1:473c)
	farcall Func_4628
	ret
; 0x474c

Func_474c: ; 474c (1:474c)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_1f8000
	pop af
	ldh [rSVBK], a
	ret
; 0x4766

Func_4766: ; 4766 (1:4766)
	ld hl, wcee5
	inc [hl]
	ld a, [hl]
	cp $64
	ret c
	ld [hl], $00
	ld a, $02
	ld [wSequence], a
	ret
; 0x4776

Func_4776: ; 4776 (1:4776)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_160000
	pop af
	ldh [rSVBK], a
	ret
; 0x4790

Func_4790: ; 4790 (1:4790)
	ldh a, [rSVBK]
	push af
	ld a, 1 ; WRAM1
	ldh [rSVBK], a
	farcall Func_1c8570
	pop af
	ldh [rSVBK], a
	ret
; 0x47aa

Func_47aa: ; 47aa (1:47aa)
	ld a, [wSubSequence]
	jumptable

	dw  SubSeq_FastFadeToWhite
	dw  SubSeq_GBIncompatibleScreen
	dw  SubSeq_SlowFadeFromWhite
	dw  Func_47fc
	dw  Func_28d
	dw  Func_28d
	dw  Func_28d
	dw  Func_28d
; 0x47be

SubSeq_GBIncompatibleScreen: ; 47be (1:47be)
	call DisableLCD
	call ClearBGMap0
	call ClearWholeVirtualOAM

	farcall LoadGBIncompatibleScreenGfx
	farcall LoadGBIncompatibleScreenMap
	call VBlank_354

	xor a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld [wTempSCY], a
	ldh [rSCY], a
	ld a, $87
	ldh [rLCDC], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x47fc

Func_47fc: ; 47fc (1:47fc)
	ret
; 0x47fd

Func_47fd: ; 47fd (1:47fd)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_db277
	pop af
	ldh [rSVBK], a
	ret
; 0x4817

Func_4817: ; 4817 (1:4817)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall Func_dc000
	pop af
	ldh [rSVBK], a
	ret
; 0x4831

Func_4831: ; 4831 (1:4831)
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	call .asm_483f
	pop af
	ldh [rSVBK], a
	ret

.asm_483f
	ld a, [wSubSequence]
	jumptable

	dw SubSeq_FastFadeToWhite
	dw Func_4857
	dw SubSeq_SlowFadeFromWhite
	dw Func_48c9
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
	dw Func_28d
; 0x4857

Func_4857: ; 4857 (1:4857)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM

	farcall Func_1f0919
	farcall Func_1f08f7
	farcall Func_1f0926
	call VBlank_4ddf

	xor a
	ld [wTempSCY], a
	ldh [rSCY], a
	ld [wTempSCX], a
	ldh [rSCX], a
	ld a, $01
	ld [wca46], a
	ld hl, wObj0
	ld a, $46
	ld [hli], a
	ld a, $18
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $76
	ld [hli], a
	ld a, $b5
	ld [hl], a
	call Func_145a
	ld hl, wObj0
	call Func_4e3e
	call ClearVirtualOAM
	ld a, $87
	ldh [rLCDC], a
	ld hl, wSubSequence
	inc [hl]
	ret
; 0x48c9

Func_48c9: ; 48c9 (1:48c9)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, Func_4619
	bit D_DOWN_F, a
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	jr .asm_4907

.down
	ld a, [wca46]
	and a
	ret z
	ld a, $56
	ld [wObj0YCoord], a
	xor a
	jr .asm_48f7

.up
	ld a, [wca46]
	dec a
	ret z
	ld hl, wObj0
	ld a, $46
	ld [wObj0YCoord], a
	ld a, $01
.asm_48f7
	ld [wca46], a
	add $80
	ld [wcee4], a
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $e2
	ldh [hSoundID + 1], a
.asm_4907
	ld hl, wObj0End - 1
	call Func_145a
	ld hl, wObj0
	call Func_4e3e
	call ClearVirtualOAM
	ret
; 0x4917

LoadTitleScreenPals: ; 4917 (1:4917)
	ld a, [wceef]
	and a
	jr nz, .asm_492a
	ld hl, Pals_4f82
	call StorePalsInTempPals1
	ld hl, Pals_4fc2
	call StorePalsInTempPals2
	ret

.asm_492a
	ld hl, Pals_5002
	call StorePalsInTempPals1
	ld hl, Pals_5042
	call StorePalsInTempPals2
	ret
; 0x4937

LoadTitleScreenTiles: ; 4937 (1:4937)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, Data_635c
	ld bc, v1Tiles0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_5082
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x4951

LoadTitleScreenTileMap: ; 4951 (1:4951)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, Data_6ae7
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_697a
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x496b

Func_496b: ; 496b (1:496b)
	ld hl, Pal_71b0
	call StorePalsInTempPals1
	ret
; 0x4972

Func_4972: ; 4972 (1:4972)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	farcall Func_1f08f7

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, Data_b0f80
	ld de, v0Tiles2
	ld bc, $800
	ld a, BANK(Data_b0f80)
	ldh [hCallFuncBank], a
	call_hram CopyHLToDE_BC ; unnecessary hram call
	ret
; 0x49a1

Func_49a1: ; 49a1 (1:49a1)
	ld a, [wca46]
	and a
	jr nz, .asm_49c1

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, $7316
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, $71f0
	ld bc, v0BGMap0
	call Decompress
	ret

.asm_49c1
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, $74e8
	ld bc, v1BGMap0
	call Decompress

	xor a ; VRAM0
	ldh [rVBK], a
	ld hl, $73e6
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x49db

VBlank_49db: ; 49db (1:49db)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wROMBank]
	push af
	ld a, $01
	bankswitch
	ld a, [wcee4]
	bit 7, a
	jr z, .skip
	ld hl, Data_6b47
	xor a ; VRAM0
	ldh [rVBK], a
	ld de, v0BGMap0 + $1c4
	push de
	ld b, $0c
	call CopyHLToDE
	pop de
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $00
	ld d, a
	ld b, $0c
	call CopyHLToDE
	ld hl, wcee4
	res 7, [hl]
.skip
	pop af
	bankswitch
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x4a33

Func_4a33: ; 4a33 (1:4a33)
	ld bc, $ffe0
	ld de, $20
	ld a, [wca04]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wca05]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wca05]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ret
; 0x4a63

	INCROM $4a63, $4ae7

Func_4ae7: ; 4ae7 (1:4ae7)
	ldh a, [rSVBK]
	push af
	ld a, 2 ; WRAM2
	ldh [rSVBK], a
	ld a, [w2d00f]
	and a
	jr z, .asm_4b66
	cp $1a
	jr z, .asm_4b6a

	dec a
	add a
	add a
	add a ; *8
	ld [wLevel], a
	ld e, a
	ld d, $00
	ld hl, Data_4eba
	add hl, de

	ld a, [hli]
	push hl
	call Func_3aac
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call Func_3aac
	pop hl
	and c
	jr nz, .asm_4b49
	ld a, [hli]
	push hl
	call Func_3aac
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call Func_3aac
	pop hl
	and c
	jr nz, .asm_4b53
	ld a, [hli]
	push hl
	call Func_3aac
	pop hl
	ld c, a
	ld a, [hli]
	push hl
	call Func_3aac
	pop hl
	and c
	jr nz, .asm_4b5d

.asm_4b36
	ld a, [wca3b]
	and $01
	add a
	add a
	ld b, a
	ld a, [wLevel]
	or b
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret

.asm_4b49
	ld a, [wLevel]
	add $03
	ld [wLevel], a
	jr .asm_4b36

.asm_4b53
	ld a, [wLevel]
	add $02
	ld [wLevel], a
	jr .asm_4b36

.asm_4b5d
	ld a, [wLevel]
	inc a
	ld [wLevel], a
	jr .asm_4b36

.asm_4b66
	ld a, $c8
	jr .asm_4b6c

.asm_4b6a
	ld a, $ff

.asm_4b6c
	ld [wLevel], a
	pop af
	ldh [rSVBK], a
	ret
; 0x4b73

Func_4b73: ; 4b73 (1:4b73)
	ld a, [wTempSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wc098], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, Data_6b5f
	call TryAddSprite
	ret
; 0x4b93

Func_4b93: ; 4b93 (1:4b93)
	ld a, [wTempSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wc098], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, Data_6d21
	call TryAddSprite
	ret
; 0x4bb3

Func_4bb3: ; 4bb3 (1:4bb3)
	ld a, [w3d513]
	bit 4, a
	jp nz, .asm_4c58
	bit 5, a
	jp nz, .asm_4c81
	bit 6, a
	jp nz, .asm_4c96

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_4bdd
	bit D_DOWN_F, a
	jr nz, .asm_4c08
	bit D_UP_F, a
	jr nz, .asm_4c15
	bit D_RIGHT_F, a
	jr nz, .asm_4c39
	bit D_LEFT_F, a
	jr nz, .asm_4c29
	ret

.asm_4bdd
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $e3
	ldh [hSoundID + 1], a
	ld hl, w3d513
	ld a, [hl]
	and $0f
	cp $03
	jr z, .asm_4bfa
	cp $04
	jr z, .asm_4c01
	set 6, [hl]
	xor a
	ld [$d527], a
	ret
.asm_4bfa
	ld bc, $6cf2
	ld a, $23
	jr .asm_4c47
.asm_4c01
	ld bc, $6d05
	ld a, $24
	jr .asm_4c47

.asm_4c08
	ld a, [w3d513]
	cp $01
	ret nz
	ld a, $12
	ld [w3d513], a
	jr .asm_4c20

.asm_4c15
	ld a, [w3d513]
	cp $02
	ret nz
	ld a, $11
	ld [w3d513], a

.asm_4c20
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $e2
	ldh [hSoundID + 1], a
	ret

.asm_4c29
	ld a, [w3d513]
	cp $03
	ret nz
	call .asm_4c20
	ld bc, $6cef
	ld a, $04
	jr .asm_4c47

.asm_4c39
	ld a, [w3d513]
	cp $04
	ret nz
	call .asm_4c20
	ld bc, $6cec
	ld a, $03
.asm_4c47
	ld [w3d513], a
	ld hl, $d527
	xor a
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hl], a
	call Func_145a
	ret

.asm_4c58
	ld a, [w3d513]
	cp $12
	jr z, .asm_4c6e
	ld hl, wObj0
	inc [hl]
	ld a, [hl]
	cp $82
	ret nz
	ld a, $86
	ld [wObj1YCoord], a
	jr .asm_4c7b
.asm_4c6e
	ld hl, wObj0
	dec [hl]
	ld a, [hl]
	cp $74
	ret nz
	ld a, $76
	ld [wObj1YCoord], a
.asm_4c7b
	ld hl, w3d513
	res 4, [hl]
	ret

.asm_4c81
	ld hl, $d52a
	call Func_145a
	ld a, [w3d514]
	and a
	ret z

.asm_4c8c
	ld hl, w3d513
	set 7, [hl]
	xor a
	ld [$d527], a
	ret

.asm_4c96
	ld a, [wc08f]
	and $01
	ret nz
	ld hl, $d527
	ld a, [hl]
	cp $10
	jr z, .asm_4c8c
	inc [hl]
	and $03
	jr z, .asm_4cb2
	dec a
	jr z, .asm_4caf
	dec a
	jr z, .asm_4cb6
.asm_4caf
	xor a
	jr .asm_4cb8
.asm_4cb2
	ld a, $03
	jr .asm_4cb8
.asm_4cb6
	ld a, $01
.asm_4cb8
	dec l
	ld [hl], a
	ret
; 0x4cbb

Func_4cbb: ; 4cbb (1:4cbb)
	ld a, [wc08f]
	and %00000011
	jr nz, .asm_4cc6
	ld hl, wc086
	dec [hl]
.asm_4cc6
	ld hl, wc087
	dec [hl]
	ld hl, wc088
	dec [hl]
	dec [hl]
	ret
; 0x4cd0

Func_4cd0: ; 4cd0 (1:4cd0)
	ld a, [wc08f]
	and %00000011
	jr nz, .asm_4ce6
	ld hl, wc086
	ld a, [hl]
	and %00011111
	jr nz, .asm_4ce5
	ld a, [wTempSCX]
	ld [hl], a
	jr .asm_4ce6
.asm_4ce5
	dec [hl]

.asm_4ce6
	ld hl, wc087
	ld a, [hl]
	and %00011111
	jr nz, .asm_4cf4
	ld a, [wTempSCX]
	ld [hl], a
	jr .asm_4cf5

.asm_4cf4
	dec [hl]
.asm_4cf5
	ld hl, wc088
	ld a, [hl]
	cp $e0
	jr z, .asm_4cff
	jr .asm_4d04

.asm_4cff
	ld a, $e0
	ld [hl], a
	jr .asm_4d06
.asm_4d04
	dec [hl]
	dec [hl]
.asm_4d06
	ret
; 0x4d07

; pans the background of the intro airplane scene
; each horizontal layer scrolls at different speed
ScrollIntroBackground: ; 4d07 (1:4d07)
	ld a, [wceef]
	and a
	ret nz
.asm_4d0c
	ldh a, [rLY]
	cp $5b
	jr c, .asm_4d0c
	call WaitVBlank

	ld a, [wc086]
	ldh [rSCX], a
.asm_4d1a
	ldh a, [rLY]
	cp $63
	jr c, .asm_4d1a
	call WaitVBlank

	ld a, [wc087]
	ldh [rSCX], a
.asm_4d28
	ldh a, [rLY]
	cp $73
	jr c, .asm_4d28
	call WaitVBlank

	ld a, [wc088]
	ldh [rSCX], a
.asm_4d36
	ldh a, [rLY]
	cp $83
	jr c, .asm_4d36
	call WaitVBlank

	ld a, [wTempSCX]
	ldh [rSCX], a
	ret
; 0x4d45

Func_4d45: ; 4d45 (1:4d45)
	ld a, [wc08f]
	and $01
	jr z, .asm_4d66
	ld hl, w3d547 + $1
	ld a, [hl]
	cp $b0
	jr c, .asm_4d65
	ld a, [wSubSequence]
	cp $05
	jr nc, .asm_4d66
	cp $04
	jr c, .asm_4d65
	ld a, [wUnkUnknown]
	and a
	jr nz, .asm_4d66
.asm_4d65
	inc [hl]

.asm_4d66
	ld hl, wObj3XCoord
	ld a, [hl]
	cp $b0
	jr c, .asm_4d7d
	ld a, [wSubSequence]
	cp $05
	ret nc
	cp $04
	jr c, .asm_4d7d
	ld a, [wUnkUnknown]
	and a
	ret nz
.asm_4d7d
	inc [hl]
	ret
; 0x4d7f

Func_4d7f: ; 4d7f (1:4d7f)
	ld a, [wca46]
	and a
	ret nz
.asm_4d84
	ldh a, [rLY]
	cp $2f
	jr c, .asm_4d84
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4d93
	ldh a, [rLY]
	cp $38
	jr c, .asm_4d93
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4da2
	ldh a, [rLY]
	cp $41
	jr c, .asm_4da2
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4db1
	ldh a, [rLY]
	cp $5a
	jr c, .asm_4db1
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4dc0
	ldh a, [rLY]
	cp $63
	jr c, .asm_4dc0
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
.asm_4dcf
	ldh a, [rLY]
	cp $6c
	jr c, .asm_4dcf
	call WaitVBlank
	ldh a, [rSCY]
	add $07
	ldh [rSCY], a
	ret
; 0x4ddf

VBlank_4ddf: ; 4ddf (1:4ddf)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wcee4]
	bit 7, a
	jr z, .asm_4e2e
	and $7f
	dec a
	jr z, .asm_4e11
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, $98e5
	ld b, $0d
	ld a, $07
	call WriteAToHL_BTimes
	ld hl, $9925
	ld b, $0d
	ld a, $06
	call WriteAToHL_BTimes
	jr .asm_4e29
.asm_4e11
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, $98e5
	ld b, $0d
	ld a, $06
	call WriteAToHL_BTimes
	ld hl, $9925
	ld b, $0d
	ld a, $07
	call WriteAToHL_BTimes
.asm_4e29
	ld hl, wcee4
	res 7, [hl]
.asm_4e2e
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x4e3e

Func_4e3e: ; 4e3e (1:4e3e)
	ld a, [wTempSCY]
	ld b, a
	ld a, [hli]
	add $10
	sub b
	ld [wCurSpriteYOffset], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXOffset], a
	ld a, [hli]
	ld [wc098], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, $75c3
	call TryAddSprite
	ret
; 0x4e5e

Func_4e5e: ; 4e5e (1:4e5e)
	ld a, [wUnkObjXCoord]
	cp $a0
	jr nc, Func_4e99
	cp $70
	jr nc, Func_4e81

	ld a, [w3d522]
	sub $01
	ld [w3d522], a
	jr nc, .asm_4e80
	ld a, $0c
	ld [w3d522], a
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $f6
	ldh [hSoundID + 1], a
.asm_4e80
	ret

Func_4e81: ; 4e81 (1:4e81)
	ld a, [w3d522]
	sub $01
	ld [w3d522], a
	jr nc, .asm_4e98
	ld a, $0c
	ld [w3d522], a
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $f7
	ldh [hSoundID + 1], a
.asm_4e98
	ret

Func_4e99: ; 4e99 (1:4e99)
	ld a, [w3d522]
	sub $01
	ld [w3d522], a
	jr nc, .asm_4eb0
	ld a, $0c
	ld [w3d522], a
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $f8
	ldh [hSoundID + 1], a
.asm_4eb0
	ret
; 0x4eb1

Func_4eb1: ; 4eb1 (1:4eb1)
	ld a, [wUnkObjXCoord]
	cp $a0
	jr nc, Func_4e99
	jr Func_4e81
; 0x4eba

Data_4eba: ; 4eba (1:4eba)
	db $3b, $00, $49, $47, $0c, $00, $00, $00
	db $0d, $00, $3e, $00, $3e, $00, $00, $00
	db $27, $28, $48, $00, $0c, $00, $00, $00
	db $29, $00, $06, $00, $0a, $00, $00, $00
	db $2a, $00, $2e, $00, $0b, $00, $00, $00
	db $2b, $00, $0d, $00, $44, $00, $00, $00
	db $0d, $00, $0e, $00, $1f, $20, $00, $00
	db $3f, $00, $3e, $00, $3d, $00, $00, $00
	db $29, $00, $07, $00, $48, $00, $00, $00
	db $2c, $00, $09, $00, $0e, $00, $00, $00
	db $27, $28, $2a, $00, $06, $00, $00, $00
	db $2d, $00, $5d, $00, $0d, $00, $00, $00
	db $08, $00, $3e, $00, $48, $00, $00, $00
	db $44, $00, $0b, $00, $07, $00, $00, $00
	db $41, $40, $2e, $00, $42, $43, $00, $00
	db $2d, $00, $06, $00, $3f, $00, $00, $00
	db $2d, $00, $2f, $00, $08, $00, $00, $00
	db $4a, $00, $30, $00, $18, $00, $00, $00
	db $2f, $00, $08, $00, $3f, $00, $00, $00
	db $45, $46, $44, $00, $0b, $00, $00, $00
	db $31, $00, $09, $00, $45, $46, $00, $00
	db $2f, $00, $45, $46, $0a, $00, $00, $00
	db $33, $34, $32, $00, $32, $00, $00, $00
	db $36, $00, $35, $00, $5d, $00, $00, $00
	db $3a, $00, $39, $00, $09, $00, $00, $00
; 0x4f82

Pals_4f82: ; 4f82 (1:4f82)
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31
	rgb 16, 30, 31

	rgb 16, 30, 31
	rgb  8, 19, 31
	rgb  5, 14, 23
	rgb  8, 19, 31

	rgb 31, 31, 31
	rgb  8, 19, 31
	rgb  0,  8,  0
	rgb  0,  4,  0

	rgb  0,  4, 0
	rgb 10, 15, 0
	rgb  0,  8, 0
	rgb 14, 23, 0

Pals_4fc2: ; 4fc2 (1:4fc2)
	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb 31, 27,  2
	rgb 27,  0,  2
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 30, 23, 19
	rgb 31,  4, 11
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 21, 30, 31
	rgb 13, 18, 30

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  7,  0, 13

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 22,  0
	rgb 13,  7, 10

Pals_5002: ; 5002 (1:5002)
	rgb 16, 30, 31
	rgb 31, 31, 31
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 31, 25, 2
	rgb 29, 12, 7
	rgb 27,  0, 2
	rgb  0,  0, 0

	rgb 18,  3, 31
	rgb 31, 25,  2
	rgb 27,  0,  2
	rgb  0,  0,  0

	rgb 29, 12,  7
	rgb 31, 25,  2
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 31, 31, 19
	rgb 31, 25,  2
	rgb 18,  3, 31
	rgb  0,  0,  0

	rgb 16, 30, 31
	rgb  8, 19, 31
	rgb  5, 14, 23
	rgb  8, 19, 31

	rgb 31, 31, 31
	rgb  8, 19, 31
	rgb  0,  8,  0
	rgb  0,  4,  0

	rgb  0,  4, 0
	rgb 10, 15, 0
	rgb  0,  8, 0
	rgb 14, 23, 0

Pals_5042: ; 5042 (1:5042)
	rgb  0, 20, 15
	rgb  0,  0,  0
	rgb 31, 27,  2
	rgb 30,  0, 14

	rgb 16, 30, 31
	rgb  0,  0,  0
	rgb 10,  0, 18
	rgb  4, 15, 31

	rgb  0, 20, 15
	rgb  0,  0,  0
	rgb 27,  0,  2
	rgb 31, 31, 31

	rgb  0, 20, 15
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb  0,  0,  0

	rgb  0, 20, 15
	rgb 21, 21, 21
	rgb  0,  0,  0
	rgb 31, 31, 31

	rgb  0, 20, 15
	rgb 31, 31, 31
	rgb 21, 30, 31
	rgb 13, 18, 30

	rgb  0,  0,  0
	rgb 21, 30, 31
	rgb 27, 30, 31
	rgb  0,  0,  0

	rgb 21, 30, 31
	rgb 31, 31, 31
	rgb 31, 22,  0
	rgb 13,  7, 10
; 0x5082

Data_5082: ; 5082 (1:5082)
	INCROM $5082, $635c

Data_635c: ; 635c (1:635c)
	INCROM $635c, $697a

Data_697a: ; 697a (1:697a)
	INCROM $697a, $6ae7

Data_6ae7: ; 6ae7 (1:6ae7)
	INCROM $6ae7, $6b47

Data_6b47: ; 6b47 (1:6b47)
	db $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c, $7c
	db $10, $11, $12, $1f, $10, $11, $12, $1f, $10, $11, $12, $1f
; 0x6b5f

Data_6b5f: ; 6b5f (1:6b5f)
	dw .data_6b71
	dw .data_6b8a
	dw .data_6bbf
	dw .data_6bf4
	dw .data_6c29
	dw .data_6c5e
	dw .data_6c93
	dw .data_6ca4
	dw .data_6ca9

.data_6b71
	db $f0, $ea, $00, $00
	db $f0, $f2, $02, $00
	db $f0, $fa, $04, $00
	db $f0, $02, $06, $00
	db $f0, $0a, $08, $00
	db $f0, $12, $0a, $00
	db $80

.data_6b8a
	db $eb, $e8, $0c, $00
	db $eb, $f0, $0e, $00
	db $eb, $f8, $10, $00
	db $eb, $00, $12, $00
	db $eb, $08, $14, $00
	db $eb, $10, $16, $00
	db $00, $e4, $18, $00
	db $00, $ec, $1a, $00
	db $00, $f4, $1c, $00
	db $00, $fc, $1e, $00
	db $00, $05, $20, $00
	db $00, $0d, $22, $00
	db $00, $15, $24, $00
	db $80

.data_6bbf
	db $00, $06, $3c, $00
	db $00, $10, $48, $00
	db $00, $18, $4a, $00
	db $00, $e0, $42, $01
	db $00, $e8, $44, $01
	db $00, $f0, $46, $01
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6bf4
	db $00, $d6, $3c, $00
	db $00, $10, $48, $01
	db $00, $18, $4a, $01
	db $00, $e0, $42, $00
	db $00, $e8, $44, $00
	db $00, $f0, $46, $00
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6c29
	db $00, $06, $3e, $00
	db $00, $10, $48, $02
	db $00, $18, $4a, $02
	db $00, $e0, $42, $01
	db $00, $e8, $44, $01
	db $00, $f0, $46, $01
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6c5e
	db $00, $d6, $3e, $00
	db $00, $e0, $42, $02
	db $00, $e8, $44, $02
	db $00, $f0, $46, $02
	db $00, $10, $48, $01
	db $00, $18, $4a, $01
	db $f0, $e5, $52, $04
	db $f0, $ed, $54, $04
	db $f0, $f5, $56, $04
	db $f0, $fd, $58, $04
	db $f0, $05, $5a, $04
	db $f0, $0d, $5c, $04
	db $f0, $15, $5e, $04
	db $80

.data_6c93
	db $00, $02, $4e, $02
	db $1c, $c8, $4c, $02
	db $ec, $15, $50, $02
	db $00, $fa, $60, $02
	db $80

.data_6ca4
	db $f0, $e8, $40, $02
	db $80

.data_6ca9
	db $00, $05, $20, $00
	db $00, $0d, $22, $00
	db $00, $15, $24, $00
	db $00, $e4, $18, $00
	db $00, $ec, $1a, $00
	db $00, $f4, $1c, $00
	db $00, $fc, $1e, $00
	db $eb, $e0, $2c, $00
	db $eb, $e8, $2e, $00
	db $eb, $f8, $30, $00
	db $eb, $00, $32, $00
	db $eb, $08, $34, $00
	db $eb, $10, $36, $00
	db $eb, $18, $38, $00
	db $ee, $f0, $0a, $00
	db $80
; 0x6ce6

FrameData_6ce6: ; 6ce6 (1:6ce6)
	db 0, 4
	db $ff

FrameData_6ce9: ; 6ce9 (1:6ce9)
	db 1, 4
	db $ff

FrameData_6cec: ; 6cec (1:6cec)
	db 2, 4
	db $ff

FrameData_6cef: ; 6cef (1:6cef)
	db 3, 4
	db $ff

FrameData_6cf2: ; 6cf2 (1:6cf2)
	db 4, 30
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db 2,  3
	db 4,  3
	db $ff

FrameData_6d05: ; 6d05 (1:6d05)
	db 5, 30
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db 3,  3
	db 5,  3
	db $ff

FrameData_6d18: ; 6d18 (1:6d18)
	db 6, 4
	db $ff

FrameData_6d1b: ; 6d1b (1:6d1b)
	db 7, 4
	db $ff

FrameData_6d1e: ; 6d1e (1:6d1e)
	db 8, 4
	db $ff

Data_6d21: ; 6d21 (1:6d21)
	dw .data_6d73
	dw .data_6da8
	dw .data_6ddd
	dw .data_6e12
	dw .data_6e47
	dw .data_6e7c
	dw .data_6eb1
	dw .data_6ee6
	dw .data_6f1b
	dw .data_6f24
	dw .data_6f2d
	dw .data_6f36
	dw .data_6f3f
	dw .data_6f48
	dw .data_6f59
	dw .data_6f6e
	dw .data_6f83
	dw .data_6f8c
	dw .data_6f9d
	dw .data_6fb2
	dw .data_6fc7
	dw .data_6fdc
	dw .data_6fed
	dw .data_7002
	dw .data_7017
	dw .data_702c
	dw .data_703d
	dw .data_7052
	dw .data_7067
	dw .data_707c
	dw .data_7085
	dw .data_7092
	dw .data_709f
	dw .data_70b0
	dw .data_70c5
	dw .data_70d6
	dw .data_70e7
	dw .data_70fc
	dw .data_710d
	dw .data_7116
	dw .data_7123

.data_6d73
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $00, $00, $16, $0e
	db $10, $00, $18, $4e
	db $80

.data_6da8
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $10, $00, $16, $4e
	db $00, $00, $18, $0e
	db $80

.data_6ddd
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $00, $00, $1a, $0e
	db $10, $00, $1c, $4e
	db $80

.data_6e12
	db $00, $1b, $12, $0e
	db $00, $23, $14, $0e
	db $00, $08, $00, $0b
	db $00, $10, $02, $0b
	db $00, $18, $04, $0b
	db $00, $28, $08, $0b
	db $10, $08, $0a, $0b
	db $10, $10, $0c, $0b
	db $10, $18, $0e, $0b
	db $10, $28, $10, $0b
	db $07, $20, $06, $0b
	db $10, $00, $1a, $4e
	db $00, $00, $1c, $0e
	db $80

.data_6e47
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $01, $00, $16, $0e
	db $11, $00, $18, $4e
	db $80

.data_6e7c
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $11, $00, $16, $4e
	db $01, $00, $18, $0e
	db $80

.data_6eb1
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $01, $00, $1a, $0e
	db $11, $00, $1c, $4e
	db $80

.data_6ee6
	db $01, $1b, $12, $0e
	db $01, $23, $14, $0e
	db $01, $08, $00, $0b
	db $01, $10, $02, $0b
	db $01, $18, $04, $0b
	db $01, $28, $08, $0b
	db $11, $08, $0a, $0b
	db $11, $10, $0c, $0b
	db $11, $18, $0e, $0b
	db $11, $28, $10, $0b
	db $08, $20, $06, $0b
	db $11, $00, $1a, $4e
	db $01, $00, $1c, $0e
	db $80

.data_6f1b
	db $00, $00, $20, $0c
	db $00, $08, $1e, $0c
	db $80

.data_6f24
	db $00, $00, $22, $0c
	db $00, $08, $1e, $0c
	db $80

.data_6f2d
	db $00, $00, $24, $0c
	db $00, $08, $1e, $0c
	db $80

.data_6f36
	db $01, $00, $26, $0c
	db $01, $08, $28, $0c
	db $80

.data_6f3f
	db $02, $00, $2a, $0c
	db $02, $08, $2c, $0c
	db $80

.data_6f48
	db $fc, $08, $38, $0f
	db $fc, $10, $3a, $0f
	db $01, $08, $1e, $0c
	db $01, $00, $22, $0c
	db $80

.data_6f59
	db $fa, $08, $3c, $0f
	db $fa, $10, $3e, $0f
	db $fa, $18, $40, $0f
	db $01, $00, $24, $0c
	db $01, $08, $1e, $0c
	db $80

.data_6f6e
	db $f8, $09, $42, $0f
	db $f8, $17, $44, $0f
	db $05, $15, $46, $0f
	db $00, $00, $2a, $0c
	db $00, $08, $2c, $0c
	db $80

.data_6f83
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6f8c
	db $f6, $0a, $30, $0f
	db $fc, $12, $36, $0f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6f9d
	db $f6, $0a, $2e, $0f
	db $f7, $10, $34, $6f
	db $f2, $1a, $36, $4f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6fb2
	db $f6, $0a, $30, $0f
	db $f1, $14, $32, $0f
	db $f3, $1f, $36, $0f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6fc7
	db $f6, $0a, $2e, $0f
	db $f0, $21, $36, $0f
	db $f4, $12, $32, $0f
	db $00, $00, $48, $0c
	db $00, $08, $4a, $0c
	db $80

.data_6fdc
	db $f6, $0a, $30, $0f
	db $fc, $12, $36, $0f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_6fed
	db $f6, $0a, $2e, $0b
	db $f4, $10, $34, $6f
	db $ee, $19, $36, $4f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_7002
	db $f6, $0a, $30, $0f
	db $ee, $13, $32, $0f
	db $eb, $1d, $36, $0f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_7017
	db $f6, $0a, $2e, $0f
	db $e8, $20, $36, $0f
	db $ef, $12, $32, $0f
	db $00, $00, $4c, $0c
	db $00, $08, $4e, $0c
	db $80

.data_702c
	db $f6, $09, $30, $0f
	db $fc, $11, $36, $0f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_703d
	db $f6, $09, $2e, $0f
	db $f4, $0f, $34, $6f
	db $ee, $18, $36, $4f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_7052
	db $f6, $09, $30, $0f
	db $ee, $12, $32, $0f
	db $eb, $1c, $36, $0f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_7067
	db $f6, $09, $2e, $0f
	db $e8, $1f, $36, $0f
	db $ef, $11, $32, $0f
	db $01, $09, $4c, $2c
	db $01, $01, $4e, $2c
	db $80

.data_707c
	db $00, $00, $3c, $0f
	db $00, $08, $3e, $0f
	db $80

.data_7085
	db $f0, $02, $60, $0f
	db $00, $02, $62, $0f
	db $fd, $0a, $64, $0f
	db $80

.data_7092
	db $f0, $02, $66, $0f
	db $00, $02, $68, $0f
	db $fa, $0a, $6a, $0f
	db $80

.data_709f
	db $f8, $0a, $70, $0f
	db $08, $06, $74, $0f
	db $00, $0e, $76, $0f
	db $f8, $fe, $72, $0f
	db $80

.data_70b0
	db $ec, $0b, $70, $6f
	db $f7, $0a, $6e, $6f
	db $f8, $fe, $6c, $0f
	db $01, $0f, $6c, $6f
	db $08, $05, $70, $0f
	db $80

.data_70c5
	db $f8, $06, $6e, $0f
	db $f3, $0e, $70, $0f
	db $08, $06, $74, $0f
	db $ed, $18, $36, $0f
	db $80

.data_70d6
	db $e5, $1e, $36, $4f
	db $e7, $13, $32, $0f
	db $ed, $0b, $6e, $0f
	db $01, $06, $70, $0f
	db $80

.data_70e7
	db $08, $06, $74, $0f
	db $e4, $1c, $32, $2f
	db $e7, $0e, $6c, $4f
	db $e2, $14, $44, $0f
	db $fe, $09, $76, $0f
	db $80

.data_70fc
	db $f8, $09, $70, $6f
	db $f3, $11, $34, $0f
	db $db, $18, $36, $4f
	db $e2, $24, $36, $4f
	db $80

.data_710d
	db $02, $00, $26, $0c
	db $02, $08, $28, $0c
	db $80

.data_7116
	db $00, $00, $56, $0d
	db $00, $08, $58, $0d
	db $00, $10, $5a, $0d
	db $80

.data_7123
	db $00, $00, $5c, $0d
	db $00, $08, $5e, $0d
	db $80
; 0x712c

FrameData_712c: ; 712c (1:712c)
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db 4, 2
	db 5, 2
	db 6, 2
	db 7, 2
	db $ff

FrameData_713d: ; 713d (1:713d)
	db  8, 3
	db  9, 3
	db 10, 3
	db $ff

FrameData_7144: ; 7144 (1:7144)
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db  8, 3
	db  9, 3
	db 10, 3
	db 11, 4
	db 12, 7
	db 38, 5
	db 11, 4
	db $ff

FrameData_7165: ; 7165 (1:7165)
	db 13,  6
	db 14,  6
	db 13,  6
	db 14,  6
	db 15,  6
	db 16, 40
	db $ff

FrameData_7172: ; 7172 (1:7172)
	db 17, 2
	db 18, 2
	db 19, 2
	db 20, 2
	db $ff

FrameData_717b: ; 717b (1:717b)
	db 21, 2
	db 22, 2
	db 23, 2
	db 24, 2
	db $ff

FrameData_7184: ; 7184 (1:7184)
	db 25, 2
	db 26, 2
	db 27, 2
	db 28, 2
	db $ff

FrameData_718d: ; 718d (1:718d)
	db 29, 9
	db 30, 9
	db 31, 9
	db 32, 9
	db 33, 9
	db $ff

FrameData_7198: ; 7198 (1:7198)
	db 34, 9
	db 35, 9
	db 36, 9
	db 37, 9
	db $ff

FrameData_71a1: ; 71a1 (1:71a1)
	db 39, 4
	db $ff

FrameData_71a4: ; 71a4 (1:71a4)
	db 40, 4
	db $ff

FrameData_71a7: ; 71a7 (1:71a7)
	db 0, 2
	db 1, 2
	db 2, 2
	db 3, 2
	db $ff
; 0x71b0

Pal_71b0: ; 71b0 (1:71b0)
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  7,  0

	rgb 31, 25, 9
	rgb 21, 15, 4
	rgb 13,  8, 1
	rgb 0,   0, 0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0
; 0x71f0

	INCROM $71f0, $8000
