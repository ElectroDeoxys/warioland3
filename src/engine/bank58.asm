
_CreditsStateTable: ; 160000 (58:4000)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw Func_160028
	dw SlowFadeFromWhite
	dw Func_1600d4
	dw Func_160190
	dw Func_16026c
	dw Func_1602ee
	dw Func_160318
	dw Func_160365
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
; 0x160028

Func_160028: ; 160028 (58:4028)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearWholeVirtualOAM

	call LoadCreditsPals
	call LoadCreditsGfx
	call Func_16041f
	call VBlank_160439

	ld a, $04
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ld [wc084], a
	ldh [rWY], a
	ld [wcee4], a
	ld a, $07
	ldh [rWX], a

	ld a, HIGH(v0BGMap0 + $2e7)
	ld [wccf0 + 0], a
	ld a, LOW(v0BGMap0 + $2e7)
	ld [wccf0 + 1], a

	ld hl, wce6a
	ld a, $5d
	ld [hli], a
	ld a, $0f
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $e5
	ld [hl], a

	ld hl, $d515
	ld a, $5b
	ld [hli], a
	ld a, $18
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [$d51d], a
	ld a, $5c
	ld [hli], a
	ld a, $c4
	ld [hl], a
	ld a, $57
	ld [$d51e], a
	ld a, $e8
	ld [$d51f], a
	ld a, $58
	ld [$d521], a
	call UpdateObjAnim
	ld hl, $d515
	call Func_1604b1

	ld hl, $d523
	ld a, $5b
	ld [hli], a
	ld a, $18
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $af
	ld [hl], a
	call UpdateObjAnim
	ld hl, $d523
	call Func_1604b1
	call ClearVirtualOAM
	stop_music
	ld a, 120
	ld [wTimer], a
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1600d4

Func_1600d4: ; 1600d4 (58:40d4)
	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .asm_1600f8
	dec [hl]
	call z, .PlayCreditsMusic
	ld hl, $d515
	call Func_1604b1
	ld hl, $d523
	call Func_1604b1
	call ClearVirtualOAM
	ret

.PlayCreditsMusic
	play_music MUSIC_CREDITS
	ret

.asm_1600f8
	ld hl, $d51c
	call UpdateObjAnim
	ld hl, $d515
	call Func_1604b1
	ld hl, $d52a
	call UpdateObjAnim
	ld hl, $d523
	call Func_1604b1
	call ClearVirtualOAM
	ld a, [wc084]
	cp $0a
	jr z, .asm_160187
	and a
	jr z, .asm_160127
	cp $09
	jr z, .asm_160127
	ld a, [wGlobalCounter]
	and $01
	ret nz
.asm_160127
	ld hl, wSCY
	ld a, [hl]
	add $01
	ld [hli], a
	ld a, [hl] ; wc084
	adc $00
	ld [hld], a
	cp $01
	ret c
	cp $0a
	ret nc
	ld a, [hl] ; wSCY
	and $07
	ret nz
	ld hl, wce6a
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, wce01
.loop
	ld a, [hli]
	ld [de], a
	inc e
	cp $7f
	jr nz, .loop
	ld a, h
	ld [wce6a + 0], a
	ld a, l
	ld [wce6a + 1], a
	ld hl, wce6c
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, wce35
	ld b, $0d
.asm_16015f
	ld a, [hli]
	ld [de], a
	inc e
	dec b
	jr nz, .asm_16015f
	ld a, h
	ld [wce6c + 0], a
	ld a, l
	ld [wce6c + 1], a
	ld hl, wccf0
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld de, $20
	add hl, de
	ld a, h
	and $fb
	ld [wccf0 + 0], a
	ld a, l
	ld [wccf0 + 1], a
	ld a, $80
	ld [wcee4], a
	ret

.asm_160187
	xor a
	ld [$d51d], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x160190

Func_160190: ; 160190 (58:4190)
	ld a, [$d51d]
	and a
	jr nz, .asm_1601b7
	ld hl, $d516
	ld a, [hl]
	cp $38
	jr c, .asm_1601b0
	cp $50
	jr c, .asm_1601a9
	ld a, $01
	ld [$d51d], a
	jr .asm_1601b7
.asm_1601a9
	ld a, [wGlobalCounter]
	and $01
	jr nz, .asm_160216
.asm_1601b0
	inc [hl]
	ld hl, $d524
	inc [hl]
	jr .asm_1601e3
.asm_1601b7
	ld a, [wGlobalCounter]
	and $01
	jr nz, .asm_160216
	ld a, [$d520]
	and a
	jr z, .asm_1601e3
	xor a
	ld [$d520], a
	ld a, [$d51d]
	inc a
	ld [$d51d], a
	cp $03
	jr c, .asm_1601e3
	cp $04
	jr z, .asm_160226
	ld hl, $d519
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $ee
	ld [hl], a

.asm_1601e3
	ld hl, $d51c
	ld a, [$d521]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim

	ld a, [$d514]
	ld [$d520], a
	ld a, [$d51d]
	cp $03
	jr nz, .asm_160210
	ld a, [wGlobalCounter]
	and $03
	jr nz, .asm_160216
.asm_160210
	ld hl, $d52a
	call UpdateObjAnim
.asm_160216
	ld hl, $d515
	call Func_17ec
	ld hl, $d523
	call Func_1604b1
	call ClearVirtualOAM
	ret

.asm_160226
	ld hl, $d515
	ld a, $5b
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [$d51d], a
	ld a, $5c
	ld [hli], a
	ld a, $e8
	ld [hl], a
	ld a, $57
	ld [$d51e], a
	ld a, $e8
	ld [$d51f], a
	ld a, $58
	ld [$d521], a
	ld hl, $d523
	ld a, $e0
	ld [hli], a
	ld a, $4e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $e5
	ld [hl], a

	ld a, 16
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	jp .asm_1601e3
; 0x16026c

Func_16026c: ; 16026c (58:426c)
	ld hl, wTimer
	dec [hl]
	jr z, .asm_16029c
	ld a, [hl]
	cp $06
	jr nz, .asm_1602e4
	ld hl, $d515
	ld a, $5b
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $5c
	ld [hli], a
	ld a, $eb
	ld [hl], a
	ld a, $57
	ld [$d51e], a
	ld a, $e8
	ld [$d51f], a
	ld a, $58
	ld [$d521], a
	jr .asm_1602cb

.asm_16029c
	ld hl, $d515
	ld a, $50
	ld [hli], a
	ld a, $50
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $67
	ld [hli], a
	ld a, $ed
	ld [hl], a
	ld a, $64
	ld [$d51e], a
	ld a, $4a
	ld [$d51f], a
	ld a, $57
	ld [$d521], a
	call Func_1603be
	ld a, $82
	ld [wcee4], a
	ld hl, wSubState
	inc [hl]

.asm_1602cb
	ld hl, $d51c
	ld a, [$d521]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
.asm_1602e4
	ld hl, $d515
	call Func_17ec
	call ClearVirtualOAM
	ret
; 0x1602ee

Func_1602ee: ; 1602ee (58:42ee)
	ld hl, $d51c
	ld a, [$d521]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim
	ld hl, $d515
	call Func_17ec
	call ClearVirtualOAM
	call Func_1603cb
	ld hl, wSubState
	inc [hl]
	ret
; 0x160318

Func_160318: ; 160318 (58:4318)
	ld hl, $d51c
	ld a, [$d521]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim

	ld hl, $d515
	call Func_17ec
	ld hl, $d523
	ld a, [hl]
	cp $80
	jr z, .asm_160347
	ld a, [wGlobalCounter]
	and $01
	jr nz, .asm_160347
	dec [hl]
.asm_160347
	ld hl, $d52a
	call UpdateObjAnim
	ld hl, $d523
	call Func_1604b1
	call ClearVirtualOAM
	ld a, [wGlobalCounter]
	and $0f
	ret nz
	call SlowFadeInScreen
	ld a, 180
	ld [wTimer], a
	ret
; 0x160365

Func_160365: ; 160365 (58:4365)
	ld hl, $d51c
	ld a, [$d521]
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall UpdateObjAnim

	ld hl, $d515
	call Func_17ec
	ld hl, $d523
	ld a, [hl]
	cp $80
	jr z, .asm_16038d
	dec [hl]
.asm_16038d
	ld hl, $d52a
	call UpdateObjAnim
	ld hl, $d523
	call Func_1604b1
	call ClearVirtualOAM
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_PERFECT
	ret nz
	ld a, [wJoypadPressed]
	and a
	jp nz, SetPerfectState
	ld hl, wTimer
	dec [hl]
	ret nz
	jp SetPerfectState
; 0x1603b1

LoadCreditsPals: ; 1603b1 (58:43b1)
	ld hl, Pals_1604cc
	call LoadPalsToTempPals1
	ld hl, Pals_16050c
	call LoadPalsToTempPals2
	ret
; 0x1603be

Func_1603be: ; 1603be (58:43be)
	ld hl, Pals_16054c
	call LoadPalsToTempPals1
	ld hl, Pals_16058c
	call LoadPalsToTempPals2
	ret
; 0x1603cb

Func_1603cb: ; 1603cb (58:43cb)
	ld hl, Pals_1605cc
	call LoadPalsToTempPals1
	ld hl, Pals_16060c
	call LoadPalsToTempPals2
	ret
; 0x1603d8

LoadCreditsGfx: ; 1603d8 (58:43d8)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, PrologueGfx
	ld bc, v0Tiles0
	ld a, BANK(PrologueGfx)
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, MusicBoxGfx
	ld de, v1Tiles1
	ld bc, $30 tiles
	farcall BANK(MusicBoxGfx), CopyHLToDE_BC

	xor a
	ldh [rVBK], a
	ld hl, CreditsFontGfx
	ld bc, v0Tiles0
	call Decompress
	ld hl, CreditsMusicBoxGfx
	ld bc, v0Tiles0
	call Decompress
	ret
; 0x16041f

Func_16041f: ; 16041f (58:441f)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_16179c
	ld bc, v1BGMap1
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_161744
	ld bc, v0BGMap1
	call Decompress
	ret
; 0x160439

VBlank_160439: ; 160439 (58:4439)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, $6c
	call CopyHLToDE
	ret

.func
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [wcee4]
	bit 7, a
	jr z, .dma_transfer
	and $7f
	dec a
	jr z, .asm_160487 ; $01
	dec a
	jr z, .asm_160499 ; $02

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wccf0
	ld a, [hli]
	ld e, [hl]
	ld d, a
	ld hl, wce35
	ld b, $0d
	call CopyHLToDE

	xor a
	ldh [rVBK], a
	ld hl, wccf0
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, $7e
	ld b, $0d
	call WriteAToHL_BTimes
	ld a, $81
	ld [wcee4], a
	jr .dma_transfer

.asm_160487
	ld hl, wccf0
	ld a, [hli]
	ld e, [hl]
	ld d, a
	ld hl, wce01
.loop
	ld a, [hli]
	cp $7f
	jr z, .asm_1604a6
	ld [de], a
	inc e
	jr .loop

.asm_160499
	call ApplyTempPals1ToBGPals
	call ApplyTempPals2ToOBPals
	ld hl, rLCDC
	ld a, [hl]
	or LCDC_WINON | LCDC_WIN9C00
	ld [hl], a
.asm_1604a6
	ld hl, wcee4
	res 7, [hl]
.dma_transfer
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x1604b1

Func_1604b1: ; 1604b1 (58:44b1)
	ld a, [hli]
	add $10
	ld [wCurSprite], a
	ld a, [hli]
	add $08
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	ld [wCurSpriteFrame], a
	ld a, [hl]
	ld [wCurSpriteAttributes], a
	ld hl, OAM_1617e8
	call TryAddSprite
	ret
; 0x1604cc

Pals_1604cc: ; 1604cc (58:44cc)
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 30, 19
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 28,  0,  0
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 29, 21,  4
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 19, 16,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 19, 23
	rgb 27,  0,  6
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 22, 31, 20
	rgb  0, 21,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  2, 31, 31
	rgb  6,  6, 31
	rgb  0,  0,  0
; 0x16050c

Pals_16050c: ; 16050c (58:450c)
	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 21, 10,  2
	rgb 28, 23, 14

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 21, 10,  2
	rgb 15,  6,  0

	rgb  0,  0,  0
	rgb 27, 21, 14
	rgb 11,  3,  0
	rgb 23, 13,  6

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0
; 0x16054c

Pals_16054c: ; 16054c (58:454c)
	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 25, 17,  9
	rgb 21, 10,  2

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 21, 14,  6
	rgb 11,  3,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 21, 10,  2
	rgb 14,  3,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 25, 17,  9
	rgb 21, 10,  2

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 25, 17,  9
	rgb 11,  3,  0

	rgb  8,  3,  0
	rgb 31, 31, 31
	rgb 25, 17,  9
	rgb 17,  6,  2

	rgb  0,  0,  0
	rgb 17,  6,  2
	rgb 25, 17,  9
	rgb 11,  3,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 28, 23, 14
	rgb 21, 10,  2
; 0x16058c

Pals_16058c: ; 16058c (58:458c)
	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 17,  6,  2
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb  0,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 28, 23, 14
	rgb 16,  5,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 21, 10,  2
	rgb  0,  0,  0
; 0x1605cc

Pals_1605cc: ; 1605cc (58:45cc)
	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb  2, 31, 31
	rgb 31,  0,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31, 26,  2
	rgb 31,  0,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb 14,  0,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb  2, 31, 31
	rgb 25,  8, 31

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 12, 29,  0
	rgb  0,  9,  3

	rgb  0,  5, 31
	rgb 31, 31, 31
	rgb 12, 29,  0
	rgb 17,  3,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb 12, 29,  0
	rgb  0,  9,  3

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb  2, 31, 31
	rgb 31,  0,  0
; 0x16060c

Pals_16060c: ; 16060c (58:460c)
	rgb  0,  0,  0
	rgb 23, 23, 23
	rgb 15, 15, 15
	rgb 31, 31, 31

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 13, 18, 30
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 27,  2
	rgb 27,  0,  2
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 27,  0,  2
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  2, 12, 31
	rgb  0, 21,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 27,  1
	rgb 18,  8,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 27,  2
	rgb  0, 15, 21

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 20,  2, 31
	rgb  0,  0,  0
; 0x16064c

CreditsFontGfx:     INCBIN "gfx/credits_font.2bpp.lz"
CreditsMusicBoxGfx: INCBIN "gfx/credits_music_box.2bpp.lz"

BGMap_161744: INCBIN "gfx/bgmaps/map_161744.bin"
BGMap_16179c: INCBIN "gfx/bgmaps/map_16179c.bin"

OAM_1617e8: ; 1617e8 (58:57e8)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28

.frame_0
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $20, 2
	frame_oam -32,  -8, $22, 2
	frame_oam -32,   0, $24, 2
	frame_oam -32,   8, $26, 2
	db $80

.frame_1
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $28, 2
	frame_oam -32,  -8, $2a, 2
	frame_oam -32,   0, $2c, 2
	frame_oam -32,   8, $2e, 2
	db $80

.frame_2
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $30, 2
	frame_oam -32,  -8, $32, 2
	frame_oam -32,   0, $34, 2
	frame_oam -32,   8, $36, 2
	db $80

.frame_3
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $38, 2
	frame_oam -32,  -8, $3a, 2
	frame_oam -32,   0, $3c, 2
	frame_oam -32,   8, $3e, 2
	db $80

.frame_4
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $40, 2
	frame_oam -32,  -8, $42, 2
	frame_oam -32,   0, $44, 2
	frame_oam -32,   8, $46, 2
	db $80

.frame_5
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $48, 2
	frame_oam -32,  -8, $4a, 2
	frame_oam -32,   0, $4c, 2
	frame_oam -33,   8, $4e, 2
	db $80

.frame_6
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $50, 2
	frame_oam -32,  -8, $52, 2
	frame_oam -32,   0, $54, 2
	frame_oam -32,   8, $56, 2
	db $80

.frame_7
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $58, 2
	frame_oam -32,  -8, $5a, 2
	frame_oam -32,   0, $5c, 2
	frame_oam -32,   8, $5e, 2
	db $80

.frame_8
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $60, 2
	frame_oam -32,  -8, $62, 2
	frame_oam -32,   0, $64, 2
	frame_oam -32,   8, $66, 2
	db $80

.frame_9
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $68, 2
	frame_oam -32,  -8, $6a, 2
	frame_oam -32,   0, $6c, 2
	frame_oam -32,   8, $6e, 2
	db $80

.frame_10
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $70, 2
	frame_oam -32,  -8, $72, 2
	frame_oam -32,   0, $74, 2
	frame_oam -32,   8, $76, 2
	db $80

.frame_11
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $78, 2
	frame_oam -32,  -8, $7a, 2
	frame_oam -32,   0, $7c, 2
	frame_oam -32,   8, $7e, 2
	db $80

.frame_12
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $80, 2
	frame_oam -32,  -8, $82, 2
	frame_oam -32,   0, $84, 2
	frame_oam -32,   8, $86, 2
	db $80

.frame_13
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $88, 2
	frame_oam -32,  -8, $8a, 2
	frame_oam -32,   0, $8c, 2
	frame_oam -32,   8, $8e, 2
	db $80

.frame_14
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $90, 2
	frame_oam -32,  -8, $92, 2
	frame_oam -32,   0, $94, 2
	frame_oam -32,   8, $96, 2
	db $80

.frame_15
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $98, 2
	frame_oam -32,  -8, $9a, 2
	frame_oam -32,   0, $9c, 2
	frame_oam -32,   8, $9e, 2
	db $80

.frame_16
	frame_oam -24,  20, $14, 1
	db $80

.frame_17
	frame_oam -24,  20, $16, 1
	db $80

.frame_18
	frame_oam -24,  20, $18, 1
	db $80

.frame_19
	frame_oam -24,  20, $1a, 1
	db $80

.frame_20
	frame_oam -24,  20, $1c, 1
	db $80

.frame_21
	frame_oam -24,  20, $1e, 1
	db $80

.frame_22
	frame_oam -24,  20, $1c, 1 | Y_FLIP
	db $80

.frame_23
	frame_oam -24,  20, $1a, 1 | Y_FLIP
	db $80

.frame_24
	frame_oam -24,  20, $18, 1 | Y_FLIP
	db $80

.frame_25
	frame_oam -24,  20, $16, 1 | Y_FLIP
	db $80

.frame_26
	frame_oam -21, -25, $a0, 0
	frame_oam -21, -17, $a2, 0
	frame_oam -21,  -9, $a4, 0
	frame_oam -21,  -1, $a6, 0
	frame_oam -21,   7, $a8, 0
	frame_oam -21,  15, $aa, 0
	frame_oam -21,  23, $ac, 0
	frame_oam  -5, -25, $ae, 0
	frame_oam  -5, -17, $b0, 0
	frame_oam  -5,  -9, $b2, 0
	frame_oam  -5,  -1, $b4, 0
	frame_oam  -5,   7, $b6, 0
	frame_oam  -5,  15, $b8, 0
	frame_oam  -5,  23, $ba, 0
	db $80

.frame_27
	frame_oam -34, -24, $bc, 0
	frame_oam -18, -24, $be, 1
	frame_oam -39, -16, $c0, 0
	frame_oam -41,  -8, $c2, 0
	frame_oam -41,   0, $c4, 0
	frame_oam -41,   8, $c6, 0
	frame_oam -33,  16, $c8, 0
	frame_oam -15, -16, $ca, 0
	frame_oam -15,  -8, $cc, 0
	frame_oam -15,   0, $cc, 0 | X_FLIP
	frame_oam -25,   8, $ce, 0
	frame_oam  -9,   8, $d0, 0
	frame_oam -18,  16, $be, 1 | X_FLIP
	frame_oam -32, -20, $d4, 2
	frame_oam -32, -12, $d6, 2
	frame_oam -32,  -4, $d8, 2
	frame_oam -32,   4, $da, 2
	frame_oam -32,  12, $dc, 2
	frame_oam -48,  -8, $d2, 1
	frame_oam -48,   0, $d2, 1 | X_FLIP
	frame_oam -24,  22, $de, 1
	db $80

.frame_28
	frame_oam -38, -12, $02, 0
	frame_oam -48,  -4, $04, 1
	frame_oam -48,   4, $06, 0
	frame_oam -34, -20, $00, 1
	frame_oam -34,  12, $08, 1
	frame_oam -18, -20, $0a, 1
	frame_oam -16, -12, $0c, 0
	frame_oam -16,  -4, $0e, 0
	frame_oam -17,   4, $10, 0
	frame_oam -18,  12, $12, 1
	frame_oam -32, -16, $20, 2
	frame_oam -32,  -8, $22, 2
	frame_oam -32,   0, $24, 2
	frame_oam -32,   8, $26, 2
	frame_oam -24,  20, $14, 1
	db $80
; 0x161caf

	INCROM $161caf, $162f85