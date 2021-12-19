Func_b4000: ; b4000 (2d:4000)
	ret
; 0xb4001

Func_b4001: ; b4001 (2d:4001)
	debug_nop
; 0xb4004

Func_b4004: ; b4004 (2d:4004)
	ld a, [w2d065]
	ld c, a
	ld a, [w2d016]
	jumptable

	dw Func_b4014 ; MAP_NORTH
	dw Func_b4309 ; MAP_WEST
	dw Func_b449b ; MAP_SOUTH
	dw Func_b4688 ; MAP_EAST
; 0xb4014

Func_b4014: ; b4014 (2d:4014)
	ld a, [w2d017]
	jumptable

	dw Func_b4001
	dw Func_b403e
	dw Func_b408e
	dw Func_b409c
	dw Func_b40c0
	dw Func_b40d9
	dw Func_b40ff
	dw Func_b4140
	dw Func_b4140
	dw Func_b4141
	dw Func_b4162
	dw Func_b4166
	dw Func_b416a
	dw Func_b416e
	dw Func_b4172
	dw Func_b4176
	dw Func_b417a
	dw Func_b4247
	dw Func_b42e7
; 0xb403e

Func_b403e: ; b403e (2d:403e)
	dec c
	jr z, .asm_b404f
	ld hl, wOWObj8
	ld de, .data
	call InitOWObjParams
	jr .asm_b404f

.data
	db $44, $30, $01

.asm_b404f
	call Func_b4055
	jp Func_b4082
; 0xb4055

Func_b4055: ; b4055 (2d:4055)
	ld a, [w2d025]
	and a
	ret nz
	ld hl, wOWObj15
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj14
	ld de, .data_2
	call InitOWObjParams

	ld a, [w2d011]
	and a
	ret z
	ld a, $18
	ld [wOWObj15Unk6], a
	ld a, $1a
	ld [wOWObj14Unk6], a
	ret

.data_1
	db $56, $1c, $19
.data_2
	db $36, $50, $1b
; 0xb4082

Func_b4082: ; b4082 (2d:4082)
	ld hl, wOWObj13
	ld de, .data
	jp InitOWObjParams

.data
	db $84, $82, $00
; 0xb408e

Func_b408e: ; b408e (2d:408e)
	dec c
	ret z
	ld hl, wOWObj10
	ld de, .data
	jp InitOWObjParams

.data
	db $40, $80, $03
; 0xb409c

Func_b409c: ; b409c (2d:409c)
	ld a, TREASURE_GREEN_MUSIC_BOX
	call IsTreasureCollected
	ret nz
	ld a, [w2d025]
	and a
	jr nz, .asm_b40b4
	ld a, [wNextMapSide]
	and a
	jr nz, .asm_b40b4
	ld a, [wMapSideLevelIndex]
	cp OWNORTH_SEA_TURTLE_ROCKS
	ret z
.asm_b40b4
	ld hl, wOWObj3
	ld de, .data
	jp InitOWObjParams

.data
	db $66, $74, $05
; 0xb40c0

Func_b40c0: ; b40c0 (2d:40c0)
	ld a, c
	and a
	ret z
	ld hl, wOWObj4
	ld de, .data_2
	cp $80
	jr nz, .asm_b40d0
	ld de, .data_1
.asm_b40d0
	jp InitOWObjParams

.data_1
	db $00, $68, $07
.data_2
	db $4c, $66, $0b
; 0xb40d9

Func_b40d9: ; b40d9 (2d:40d9)
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b40f0
	ld hl, wOWObj1
	ld de, .data_1
	call InitOWObjParams
	call .asm_b40f0
	xor a
	ld [wOWObj2Unk6], a
	ret

.asm_b40f0
	ld hl, wOWObj2
	ld de, .data_2
	jp InitOWObjParams

.data_1
	db $51, $a0, $0f
.data_2
	db $59, $2d, $1d
; 0xb40ff

Func_b40ff: ; b40ff (2d:40ff)
	ld a, c
	and a
	ret z
	sla c
	jr c, .asm_b4128
	ld a, $01
	ld [w2d12c], a
	ld hl, wOWObj6
	ld de, .data_1
	call InitOWObjParams
	ld a, $04
	ld [w2d12e], a
	ld hl, wOWObj7
	ld de, .data_2
	jp InitOWObjParams

.data_1
	db $48, $14, $11
.data_2
	db $38, $0f, $10

.asm_b4128
	ld hl, wOWObj6
	ld de, .data_3
	call InitOWObjParams
	ld hl, wOWObj7
	ld de, .data_4
	jp InitOWObjParams

.data_3
	db $38, $15, $14
.data_4
	db $41, $19, $14
; 0xb4140

Func_b4140: ; b4140 (2d:4140)
	ret
; 0xb4141

Func_b4141: ; b4141 (2d:4141)
	ld b, $00
;	fallthrough

Func_b4143: ; b4143 (2d:4143)
	sla c
	ret nc
	ld hl, wOWObj5
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj5Attributes
	ld [hl], b
	ld hl, wOWObj1
	ld de, .data_2
	jp InitOWObjParams

.data_1
	db $00, $70, $1f
.data_2
	db $00, $70, $21
; 0xb4162

Func_b4162: ; b4162 (2d:4162)
	ld b, $00
	jr Func_b4143
; 0xb4166

Func_b4166: ; b4166 (2d:4166)
	ld b, $02
	jr Func_b4143
; 0xb416a

Func_b416a: ; b416a (2d:416a)
	ld b, $03
	jr Func_b4143
; 0xb416e

Func_b416e: ; b416e (2d:416e)
	ld b, $03
	jr Func_b4143
; 0xb4172

Func_b4172: ; b4172 (2d:4172)
	ld b, $02
	jr Func_b4143
; 0xb4176

Func_b4176: ; b4176 (2d:4176)
	ld b, $01
	jr Func_b4143
; 0xb417a

Func_b417a: ; b417a (2d:417a)
	ld a, $80
	cp c
	ret nz

	ld hl, wOWObj1
	ld de, .data_1
	call InitOWObjParams

	ld hl, wOWObj5
	ld de, .data_2
	call InitOWObjParams

	ld hl, wOWObj8
	ld de, .data_3
	call InitOWObjParams

	ld hl, wOWObj9
	ld de, .data_4
	call InitOWObjParams

	ld hl, wOWObj10
	ld de, .data_5
	call InitOWObjParams

	ld hl, wOWObj5Attributes
	set 2, [hl]
	ld hl, wOWObj8Attributes
	set 2, [hl]
	ld hl, wOWObj9Attributes
	set 2, [hl]
	ld hl, wOWObj10Attributes
	set 2, [hl]

	farcall Func_80bd9
	farcall VBlank_80bf9

	ld a, BANK(BGMap_86868)
	ld [wTempBank], a
	ld hl, BGMap_86868
	ld bc, v0BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_868b2)
	ld [wTempBank], a
	ld hl, BGMap_868b2
	ld bc, v1BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a

	xor a
	ld [wWX], a
	ldh [rWX], a
	ld a, $90
	ld [wWY], a
	ldh [rWY], a
	xor a ; BOTBAR_CLOSED
	ld [wBottomBarAction], a

	ld hl, Treasure000Gfx
	ld de, v0Tiles1 tile $10
	ld c, 4 tiles
	ld b, BANK(Treasure000Gfx)
	jp CopyFarBytes

.data_1
	db $a0, $08, $22
.data_2
	db $a8, $18, $24
.data_3
	db $a8, $34, $24
.data_4
	db $a8, $50, $24
.data_5
	db $a8, $6c, $24
; 0xb4247

Func_b4247: ; b4247 (2d:4247)
	ld a, $80
	cp c
	ret nz

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_85eda)
	ld [wTempBank], a
	ld hl, BGMap_85eda
	ld bc, v1BGMap0 tile $3a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a

	ld a, BANK(BGMap_85ea7)
	ld [wTempBank], a
	ld hl, BGMap_85ea7
	ld bc, v0BGMap0 tile $3a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, v0BGMap0 tile $3c
	ld de, wTilemap tile $2a
	ld b, 4 tiles
	call CopyHLToDE

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0 tile $3c
	ld de, wTilemap tile $26
	ld b, 4 tiles
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld hl, Pals_84a20
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84a20)
	call CopyFarBytes

	ld hl, wOWObj5
	ld de, .data
	call InitOWObjParams

	farcall VBlank_80bf9
	farcall DrawCoinCount

	xor a
	ld [wOWObj6Unk6], a
	ld [wOWObj7Unk6], a
	ld [wOWObj2Unk6], a
	ret

.data
	db $00, $60, $00
; 0xb42e7

Func_b42e7: ; b42e7 (2d:42e7)
	ld a, [wcee3]
	cp $f1
	jr z, .continue
	cp $f2
	jr z, .continue
	ret
.continue
	xor a
	ld hl, wOWObj1
	ld bc, 15 * 8
	call WriteAToHL_BCTimes
	ld hl, wOWObj1
	ld de, .data
	jp InitOWObjParams
.data
	db $28, $50, 00
; 0xb4309

Func_b4309: ; b4309 (2d:4309)
	ld a, [w2d017]
	jumptable

	dw Func_b4001
	dw Func_b431f
	dw Func_b4351
	dw Func_b435f
	dw Func_b438f
	dw Func_b43a8
	dw Func_b43dd
	dw Func_b4448
	dw Func_b4474
; 0xb431f

Func_b431f: ; b431f (2d:431f)
	ld a, c
	cp $80
	jr z, .asm_b4339
	and a
	ret z
	ld hl, Data_8550b
	farcall Func_854ee
	ret
.asm_b4339
	ld hl, wOWObj15
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj14
	ld de, .data_2
	jp InitOWObjParams

.data_1
	db $56, $5c, $00
.data_2
	db $3a, $5c, $03
; 0xb4351

Func_b4351: ; b4351 (2d:4351)
	dec c
	ret z
	ld hl, wOWObj1
	ld de, .data
	jp InitOWObjParams
.data
	db $44, $28, $02
; 0xb435f

Func_b435f: ; b435f (2d:435f)
	ld hl, wOWObj8
	ld de, .data_1
	call InitOWObjParams
	ld a, [w2d065]
	add a
	ret z
	ld a, [w2d025]
	and a
	ret nz
	ld hl, wOWObj7
	ld de, .data_2
	call InitOWObjParams
	ld a, [w2d011]
	and a
	ld a, $06
	jr z, .asm_b4385
	ld a, $08
.asm_b4385
	ld [wOWObj8Unk6], a
	ret

.data_1
	db $3b, $80, $09
.data_2
	db $3b, $80, $00
; 0xb438f

Func_b438f: ; b438f (2d:438f)
	ld a, c
	and a
	ret z
	ld hl, wOWObj4
	ld de, .data_2
	cp $80
	jr nz, .asm_b439f
	ld de, .data_1
.asm_b439f
	jp InitOWObjParams

.data_1
	db $00, $68, $0a
.data_2
	db $5b, $60, $0e
; 0xb43a8

Func_b43a8: ; b43a8 (2d:43a8)
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b43ce
	ld hl, wOWObj1
	ld de, .data_1
	call InitOWObjParams
	call .asm_b43ce
	xor a
	ld [wOWObj5Unk6], a
	ld hl, wTilemap + $b0
	res 7, [hl]
	ld hl, wTilemap + $d0
	res 7, [hl]
	ld hl, wTilemap + $e0
	res 7, [hl]
	ret
.asm_b43ce
	ld hl, wOWObj5
	ld de, .data_2
	jp InitOWObjParams

.data_1
	db $32, $a0, $12
.data_2
	db $3a, $2e, $13
; 0xb43dd

Func_b43dd: ; b43dd (2d:43dd)
	ld a, c
	and a
	ret z
	dec a
	jr nz, .asm_b43e9
	ld hl, Data_85549
	jp Func_b586d
.asm_b43e9
	ld hl, wOWObj11
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj12
	ld de, .data_2
	call InitOWObjParams
	ld hl, wOWObj13
	ld de, .data_3
	call InitOWObjParams
	ld hl, wOWObj14
	ld de, .data_4
	call InitOWObjParams
	ld hl, wOWObj15
	ld de, .data_5
	call InitOWObjParams
	ld hl, wOWObj10
	ld de, .data_6
	call InitOWObjParams

	ld hl, .pal
	ld de, wTempPals2 palette 2
	ld b, 1 palettes
	call CopyHLToDE

	jp LoadOverworldRocksGfx

.data_1
	db $10, $54, $18
.data_2
	db $3c, $4b, $00
.data_3
	db $3c, $51, $00
.data_4
	db $3c, $57, $00
.data_5
	db $3c, $5d, $00
.data_6
	db $52, $5c, $00

	db $00 ; unused

.pal
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 25,  8, 31
	rgb  5,  5,  7
; 0xb4448

Func_b4448: ; b4448 (2d:4448)
	ld a, c
	and a
	ret z
	sla a
	jr c, .asm_b4455
.asm_b444f
	ld hl, Data_85536
	jp Func_b586d
.asm_b4455
	ld a, [w2d017]
	ld b, a
	ld a, [w2d019]
	cp b
	jr nz, .asm_b444f
	ld hl, wOWObj11
	ld de, Func_b43dd.data_1
	call InitOWObjParams
	ld hl, wOWObj10
	ld de, Func_b43dd.data_6
	call InitOWObjParams
	jp LoadOverworld4Gfx
; 0xb4474

Func_b4474: ; b4474 (2d:4474)
	ld a, c
	and a
	ret z
	call LoadOverworld3Gfx
	ld hl, wOWObj6
	ld de, .data
	call InitOWObjParams
	ld a, [w2d065]
	add a
	jr z, .asm_b448f
	ld hl, Data_8556e
	jp Func_b586d
.asm_b448f
	xor a
	ld [wOWObj6Unk6], a
	ld hl, wOWObj6
	inc [hl]
	ret

.data
	db $78, $3c, $23
; 0xb449b

Func_b449b: ; b449b (2d:449b)
	ld a, [w2d017]
	jumptable

	dw Func_b4001
	dw Func_b44b7
	dw Func_b44e7
	dw Func_b4509
	dw Func_b4520
	dw Func_b4567
	dw Func_b45c8
	dw Func_b45f5
	dw Func_b461b
	dw Func_b4637
	dw Func_b4653
	dw Func_b4665
; 0xb44b7

Func_b44b7: ; b44b7 (2d:44b7)
	ld a, $80
	cp c
	ret nz
	ld a, [w2d017]
	ld hl, w2d019
	cp [hl]
	ret nz
	ld hl, wOWObj2
	ld de, .data_2
	call InitOWObjParams
	ld hl, wOWObj3
	ld de, .data_3
	call InitOWObjParams
	ld hl, wOWObj4
	ld de, .data_1
	jp InitOWObjParams

.data_1
	db $38, $4c, $00
.data_2
	db $38, $44, $00
.data_3
	db $38, $54, $00
; 0xb44e7

Func_b44e7: ; b44e7 (2d:44e7)
	ld a, c
	and a
	ret z
	ld hl, wOWObj4
	ld de, .data_2
	cp $80
	jr nz, .asm_b4500
	ld a, [w2d017]
	ld b, a
	ld a, [w2d019]
	cp b
	ret nz
	ld de, .data_1
.asm_b4500
	jp InitOWObjParams

.data_1
	db $00, $16, $05
.data_2
	db $56, $1a, $01
; 0xb4509

Func_b4509: ; b4509 (2d:4509)
	ld hl, wOWObj6
	ld de, .data
	call InitOWObjParams
	ld a, [w2d065]
	dec a
	ret nz
	ld hl, wOWObj6Unk6
	inc [hl]
	inc [hl]
	ret

.data
	db $3d, $31, $07
; 0xb4520

Func_b4520: ; b4520 (2d:4520)
	ld a, $80
	cp c
	jr z, .asm_b4542
	dec c
	ret nz
	ld hl, Data_855b2
	farcall Func_854ee
.asm_b4539
	ld hl, wOWObj5
	ld de, .data_3
	jp InitOWObjParams
.asm_b4542
	ld hl, wOWObj2
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj10
	ld de, .data_2
	call InitOWObjParams
	call .asm_b4539
	xor a
	ld [wOWObj5Unk6], a
	jp LoadOverworldThunderGfx

.data_1
	db $48, $38, $00
.data_2
	db $3d, $2f, $00
.data_3
	db $68, $44, $0a
; 0xb4567

Func_b4567: ; b4567 (2d:4567)
	ld a, c
	dec a
	jr z, .asm_b459a
	sla c
	ret nc

	ld hl, wOWObj2
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj3
	ld de, .data_2
	call InitOWObjParams

	ld b, 3
	ld de, $1f
	ld hl, wTilemap + $12e
.loop
	set 7, [hl]
	inc hl
	set 7, [hl]
	add hl, de
	dec b
	jr nz, .loop
	jp LoadOverworldTowerGfx

.data_1
	db $49, $78, $00
.data_2
	db $50, $78, $0c

.asm_b459a
	ld hl, Data_85579
	farcall Func_854ee
	ld a, [w2d025]
	and a
	ret nz
	ld hl, wOWObj15
	ld de, .data_3
	call InitOWObjParams
	ld a, [w2d011]
	and a
	ret z
	ld a, $1e
	ld [wOWObj15Unk6], a
	ret

.data_3
	db $29, $78, $1f
; 0xb45c8

Func_b45c8: ; b45c8 (2d:45c8)
	ld a, c
	and a
	jr z, .asm_b45e3
	dec a
	ret z
	ld hl, wOWObj1
	ld de, .data_2
	call InitOWObjParams
	ld hl, wOWObj8
	ld de, .data_3
	call InitOWObjParams
	call LoadOverworldFanGfx
.asm_b45e3
	ld hl, wOWObj9
	ld de, .data_1
	jp InitOWObjParams

.data_1
	db $4d, $8a, $10
.data_2
	db $5c, $82, $00
.data_3
	db $64, $78, $19
; 0xb45f5

Func_b45f5: ; b45f5 (2d:45f5)
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b460c
	ld hl, wOWObj1
	ld de, .data_1
	call InitOWObjParams
	call .asm_b460c
	xor a
	ld [wOWObj7Unk6], a
	ret
.asm_b460c
	ld hl, wOWObj7
	ld de, .data_2
	jp InitOWObjParams

.data_1
	db $37, $a0, $16
.data_2
	db $3f, $10, $1d
; 0xb461b

Func_b461b: ; b461b (2d:461b)
	ld a, c
	and a
	ret z
	sla c
	jr c, .asm_b4628
	ld hl, Data_855f9
	jp Func_b586d
.asm_b4628
	ld hl, wOWObj2
	ld de, .data
	call InitOWObjParams
	jp LoadOverworldThunderGfx

.data
	db $5f, $3d, $00
; 0xb4637

Func_b4637: ; b4637 (2d:4637)
	ld a, c
	and a
	ret z
	sla c
	jr c, .asm_b4644
	ld hl, Data_8560e
	jp Func_b586d
.asm_b4644
	ld hl, wOWObj2
	ld de, .data
	call InitOWObjParams
	jp LoadOverworldThunderGfx

.data
	db $20, $48, $00
; 0xb4653

Func_b4653: ; b4653 (2d:4653)
	sla c
	ret nc
	ld hl, wOWObj2
	ld de, .data
	call InitOWObjParams
	jp LoadOverworldExplosion1Gfx

.data
	db $20, $44, $00
; 0xb4665

Func_b4665: ; b4665 (2d:4665)
	xor a
	cp c
	ret z
	ld hl, wOWObj14
	ld de, .data
	call InitOWObjParams
	ld a, $80
	cp c
	ret z
	ld a, [w2d011]
	and a
	ret z
	ld a, $80
	ld [wOWObj14XCoord], a
	ld a, $15
	ld [wOWObj14YCoord], a
	ret

.data
	db $25, $70, $20
; 0xb4688

Func_b4688: ; b4688 (2d:4688)
	ld a, [w2d017]
	jumptable

	dw Func_b4001
	dw Func_b46a0
	dw Func_b46d9
	dw Func_b4712
	dw Func_b4771
	dw Func_b4792
	dw Func_b47f7
	dw Func_b481b
	dw Func_b4832
	dw Func_b4873
; 0xb46a0

Func_b46a0: ; b46a0 (2d:46a0)
	ld a, c
	add a
	call z, Func_b4874
	ld a, $80
	cp c
	jr z, .asm_b46cd
	dec c
	ret nz

	xor a
	ld [w2d03e], a
	ld [w2d046], a

	ld hl, BGMap_857f7
	ld de, wAttrmap + $14f
	ld c, $91
	ld b, BANK(BGMap_857f7)
	call CopyFarBytes
	ld hl, BGMap_85897
	ld de, wTilemap + $14f
	ld c, $91
	ld b, BANK(BGMap_85897)
	jp CopyFarBytes

.asm_b46cd
	ld hl, wOWObj1
	ld de, .data
	jp InitOWObjParams

.data
	db $64, $e8, $01
; 0xb46d9

Func_b46d9: ; b46d9 (2d:46d9)
	ld a, c
	and a
	jr z, .asm_b46e7
	cp $80
	jr z, .asm_b46f0
	ld hl, Data_8563e
	jp Func_b586d
.asm_b46e7
	ld hl, wOWObj6
	ld de, .data_1
	jp InitOWObjParams

.asm_b46f0
	call .asm_b46e7
	ld hl, wOWObj15
	ld de, .data_2
	call InitOWObjParams

	ld hl, wTilemap + $143
	ld b, $4
	call SetBGMapBytesPriority
	ld hl, wTilemap + $163
	ld b, $4
	jp SetBGMapBytesPriority

.data_1
	db $55, $28, $02
.data_2
	db $10, $5c, $07
; 0xb4712

Func_b4712: ; b4712 (2d:4712)
	ld a, c
	and a
	ret z
	call .Func_b4757
	ld a, $80
	cp c
	jr z, .asm_b4741

	ld hl, Data_85af4
	call Func_b586d
	ld hl, Data_85afd
	call Func_b586d
	ld hl, Data_85b0a
	call Func_b586d
	ld hl, Data_85b1b
	call Func_b586d
	ld hl, Data_85b2c
	call Func_b586d
	ld hl, Data_85b3d
	jp Func_b586d

.asm_b4741
	ld hl, wOWObj1
	ld de, .data_1
	call InitOWObjParams
	xor a
	ld [wOWObj7Unk6], a
	jp LoadOverworldExplosion2Gfx

.data_1
	db $3f, $1c, $00

.data_2
	db $28, $28, $12

.Func_b4757
	ld a, [w2d029]
	cp $01
	ret z
	ld hl, wOWObj7
	ld de, .data_2
	call InitOWObjParams
	ld a, [w2d011]
	and a
	ret nz
	ld a, $13
	ld [wOWObj7Unk6], a
	ret
; 0xb4771

Func_b4771: ; b4771 (2d:4771)
	sla c
	ret nc
	ld hl, wOWObj2
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj1
	ld de, .data_2
	call InitOWObjParams
	call LoadOverworldExplosion3Gfx
	jp LoadOverworldSmokeGfx

.data_1
	db $54, $22, $00
.data_2
	db $4C, $48, $00
; 0xb4792

Func_b4792: ; b4792 (2d:4792)
	ld a, c
	and a
	ret z
	sla c
	jr nc, .asm_b47dc
	ld a, [w2d017]
	ld b, a
	ld a, [w2d019]
	cp b
	jr nz, .asm_b47dc

	ld hl, wOWObj10
	ld de, .data_1
	call InitOWObjParams
	ld hl, wOWObj12
	ld de, .data_3
	call InitOWObjParams
	ld hl, wOWObj13
	ld de, .data_4
	call InitOWObjParams
	ld hl, wOWObj14
	ld de, .data_5
	call InitOWObjParams
	ld hl, wOWObj15
	ld de, .data_6
	call InitOWObjParams
	ld hl, wOWObj11
	ld de, .data_7
	call InitOWObjParams

	call LoadOverworldFireGfx

.asm_b47dc
	ld hl, Data_85b48
	jp Func_b586d

.data_1
	db $54, $78, $09
.data_2 ; unused
	db $3a, $70, $09
.data_3
	db $58, $44, $0c
.data_4
	db $44, $3c, $0c
.data_5
	db $3d, $45, $0f
.data_6
	db $3e, $74, $0f
.data_7
	db $10, $5c, $1e
; 0xb47f7

Func_b47f7: ; b47f7 (2d:47f7)
	ld a, c
	dec c
	ret z
	and a
	jr z, .asm_b480c
	call .asm_b480c
	ld hl, wOWObj1
	ld de, .data_2
	call InitOWObjParams
	jp LoadOverworldTorchGfx
.asm_b480c
	ld hl, wOWObj9
	ld de, .data_1
	jp InitOWObjParams

.data_1
	db $45, $87, $17
.data_2
	db $45, $87, $00
; 0xb481b

Func_b481b: ; b481b (2d:481b)
	ld a, c
	and a
	ret z
	ld hl, wOWObj5
	ld de, .data
	call InitOWObjParams
	sla c
	ret nc
	xor a
	ld [wOWObj5Unk6], a
	ret

.data
	db $60, $88, $19
; 0xb4832

Func_b4832: ; b4832 (2d:4832)
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b4864
	call .asm_b4864
	ld a, [wOWObj8]
	add $08
	ld [wOWObj8], a
	ld hl, wOWObj2
	ld de, .data_2
	call InitOWObjParams
	ld hl, wTilemap + $ee
	ld b, $3
	call SetBGMapBytesPriority
	ld hl, wTilemap + $10e
	ld b, $3
	call SetBGMapBytesPriority
	ld hl, wTilemap + $12e
	ld b, $2
	jp SetBGMapBytesPriority

.asm_b4864
	ld hl, wOWObj8
	ld de, .data_1
	jp InitOWObjParams

.data_1
	db $37, $7c, $1c
.data_2
	db $40, $7c, $21
; 0xb4873

Func_b4873: ; b4873 (2d:4873)
	ret
; 0xb4874

Func_b4874: ; b4874 (2d:4874)
	ld hl, .pal
	ld de, wTempPals1 palette 4
	ld b, 1 palettes
	jp CopyHLToDE

.pal
	rgb 16, 14, 23
	rgb  0, 10, 18
	rgb  0,  0,  0
	rgb  3,  0,  3
; 0xb4887

; sets the ???
; of OWObj in hl, with params in de
InitOWObjParams: ; b4887 (2d:4887)
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc l
	inc l
	xor a
	ld [hli], a
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret
; 0xb4895

	INCROM $b4895, $b48a7

; sets the priority bit of b bytes
; starting from hl in BGMap
SetBGMapBytesPriority: ; b48a7 (2d:48a7)
.loop
	set 7, [hl]
	inc hl
	dec b
	jr nz, .loop
	ret
; 0xb48ae

LoadOverworld3Gfx: ; b48ae (2d:48ae)
	ld a, BANK(Overworld3Gfx)
	ld [wTempBank], a
	ld hl, Overworld3Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb48ca

LoadOverworld4Gfx: ; b48ca (2d:48ca)
	ld a, BANK(Overworld4Gfx)
	ld [wTempBank], a
	ld hl, Overworld4Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb48e6

LoadOverworldRocksGfx: ; b48e6 (2d:48e6)
	ld a, BANK(OverworldRocksGfx)
	ld [wTempBank], a
	ld hl, OverworldRocksGfx
	ld bc, v0Tiles0 tile $58
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb4902

LoadOverworldTowerGfx: ; b4902 (2d:4902)
	ld a, BANK(OverworldTowerGfx)
	ld [wTempBank], a
	ld hl, OverworldTowerGfx
	ld bc, v0Tiles0 tile $60
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb491e

LoadOverworldFanGfx: ; b491e (2d:491e)
	ld a, BANK(OverworldFanGfx)
	ld [wTempBank], a
	ld hl, OverworldFanGfx
	ld bc, v0Tiles0 tile $60
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb493a

LoadOverworldExplosion1Gfx: ; b493a (2d:493a)
	ld a, BANK(OverworldExplosion1Gfx)
	ld [wTempBank], a
	ld hl, OverworldExplosion1Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb4956

LoadOverworldThunderGfx: ; b4956 (2d:4956)
	ld a, BANK(OverworldThunderGfx)
	ld [wTempBank], a
	ld hl, OverworldThunderGfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb4972

LoadOverworldExplosion2Gfx: ; b4972 (2d:4972)
	ld a, BANK(OverworldExplosion2Gfx)
	ld [wTempBank], a
	ld hl, OverworldExplosion2Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb498e

LoadOverworldTorchGfx: ; b498e (2d:498e)
	ld a, BANK(OverworldTorchGfx)
	ld [wTempBank], a
	ld hl, OverworldTorchGfx
	ld bc, v0Tiles0 tile $40
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb49aa

LoadOverworldFireGfx: ; b49aa (2d:49aa)
	ld a, BANK(OverworldFireGfx)
	ld [wTempBank], a
	ld hl, OverworldFireGfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb49c6

LoadOverworldExplosion3Gfx: ; b49c6 (2d:49c6)
	ld a, BANK(OverworldExplosion3Gfx)
	ld [wTempBank], a
	ld hl, OverworldExplosion3Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb49e2

LoadOverworldSmokeGfx: ; b49e2 (2d:49e2)
	ld a, BANK(OverworldSmokeGfx)
	ld [wTempBank], a
	ld hl, OverworldSmokeGfx
	ld bc, v0Tiles0 tile $32
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0xb49fe

UpdateCurOWOjAnimation: ; b49fe (2d:49fe)
	ld b, $2a
	ld a, [wCurOWObj + 0]
	ld l, a
	set 2, l
	ld a, [wCurOWObj + 1]
	ld h, a
	jp UpdateOWAnimation
; 0xb4a0d

Func_b4a0d: ; b4a0d (2d:4a0d)
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	set 2, l
	xor a
	ld [hli], a ; duration
	ld [hli], a ; frameset offset
	ld a, b
	ld [hl], a ; unk6
	ld b, h
	ld c, l
	ret
; 0xb4a1d

AddCurOWObjSpriteWithScroll: ; b4a1d (2d:4a1d)
	ld b, $2a
	ld a, [wCurOWObj + 0]
	ld l, a
	ld a, [wCurOWObj + 1]
	ld h, a
	jp AddOWSpriteWithScroll
; 0xb4a2a

AddCurOWObjSprite: ; b4a2a (2d:4a2a)
	ld b, $2a
	ld a, [wCurOWObj + 0]
	ld l, a
	ld a, [wCurOWObj + 1]
	ld h, a
	jp AddOWSprite
; 0xb4a37

Func_b4a37: ; b4a37 (2d:4a37)
	call Func_b4a3d
	jp Func_b4aa9
; 0xb4a3d

Func_b4a3d: ; b4a3d (2d:4a3d)
	ld a, [wCurMapSide]
	jumptable

	dw .North ; MAP_NORTH
	dw .West  ; MAP_WEST
	dw .South ; MAP_SOUTH
	dw .East  ; MAP_EAST

.North
	ld bc, wOWObj1Unk6
	call Func_b4fa2
	ld bc, wOWObj2Unk6
	call Func_b4fa2
	ld bc, wOWObj3Unk6
	call Func_b4fa2
	ld bc, wOWObj4Unk6
	jp Func_b4fa2

.West
	ld bc, wOWObj1Unk6
	call Func_b4dfb
	ld bc, wOWObj2Unk6
	call Func_b4dfb
	ld bc, wOWObj3Unk6
	call Func_b4dfb
	ld bc, wOWObj4Unk6
	jp Func_b4dfb

.South
	ld bc, wOWObj1Unk6
	call Func_b4cc2
	ld bc, wOWObj2Unk6
	call Func_b4cc2
	ld bc, wOWObj3Unk6
	call Func_b4cc2
	ld bc, wOWObj4Unk6
	jp Func_b4cc2

.East
	ld bc, wOWObj1Unk6
	call Func_b4b99
	ld bc, wOWObj2Unk6
	call Func_b4b99
	ld bc, wOWObj3Unk6
	call Func_b4b99
	ld bc, wOWObj4Unk6
	jp Func_b4b99
; 0xb4aa9

Func_b4aa9: ; b4aa9 (2d:4aa9)
	ld a, [wCurMapSide]
	jumptable

	dw .North ; MAP_NORTH
	dw .West  ; MAP_WEST
	dw .South ; MAP_SOUTH
	dw .East  ; MAP_EAST

.North
	ld bc, wOWObj5Unk6
	call Func_b4fa2
	ld bc, wOWObj6Unk6
	call Func_b4fa2
	ld bc, wOWObj7Unk6
	call Func_b4fa2
	ld bc, wOWObj8Unk6
	call Func_b4fa2
	ld bc, wOWObj9Unk6
	call Func_b4fa2
	ld bc, wOWObj10Unk6
	call Func_b4fa2
	ld bc, wOWObj13Unk6
	call Func_b4fa2
	ld bc, wOWObj14Unk6
	call Func_b4fa2
	ld bc, wOWObj15Unk6
	jp Func_b4fa2

.West
	ld bc, wOWObj5Unk6
	call Func_b4dfb
	ld bc, wOWObj6Unk6
	call Func_b4dfb
	ld bc, wOWObj7Unk6
	call Func_b4dfb
	ld bc, wOWObj8Unk6
	call Func_b4dfb
	ld bc, wOWObj10Unk6
	call Func_b4dfb
	ld bc, wOWObj11Unk6
	call Func_b4dfb
	ld bc, wOWObj12Unk6
	call Func_b4dfb
	ld bc, wOWObj13Unk6
	call Func_b4dfb
	ld bc, wOWObj14Unk6
	call Func_b4dfb
	ld bc, wOWObj15Unk6
	jp Func_b4dfb

.South
	ld bc, wOWObj5Unk6
	call Func_b4cc2
	ld bc, wOWObj6Unk6
	call Func_b4cc2
	ld bc, wOWObj7Unk6
	call Func_b4cc2
	ld bc, wOWObj8Unk6
	call Func_b4cc2
	ld bc, wOWObj9Unk6
	call Func_b4cc2
	ld bc, wOWObj10Unk6
	call Func_b4cc2
	ld bc, wOWObj14Unk6
	call Func_b4cc2
	ld bc, wOWObj15Unk6
	jp Func_b4cc2

.East
	ld bc, wOWObj5Unk6
	call Func_b4b99
	ld bc, wOWObj6Unk6
	call Func_b4b99
	ld bc, wOWObj7Unk6
	call Func_b4b99
	ld bc, wOWObj8Unk6
	call Func_b4b99
	ld bc, wOWObj9Unk6
	call Func_b4b99
	ld bc, wOWObj10Unk6
	call Func_b4b99
	ld bc, wOWObj11Unk6
	call Func_b4b99
	ld bc, wOWObj12Unk6
	call Func_b4b99
	ld bc, wOWObj13Unk6
	call Func_b4b99
	ld bc, wOWObj14Unk6
	call Func_b4b99
	ld bc, wOWObj15Unk6
	jp Func_b4b99
; 0xb4b99

Func_b4b99: ; b4b99 (2d:4b99)
	ld a, c
	and $f8
	ld hl, wCurOWObj
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4ba2: ; b4ba2 (2d:4ba2)
	jumptable

	dw Func_b4000
	dw Func_b4be9
	dw Func_b4bee
	dw Func_b4bf3
	dw Func_b4bf8
	dw Func_b4bfd
	dw Func_b4c02
	dw Func_b4c07
	dw Func_b4c0c
	dw Func_b4c16
	dw Func_b4c1b
	dw Func_b4c25
	dw Func_b4c2a
	dw Func_b4c2f
	dw Func_b4c39
	dw Func_b4c3e
	dw Func_b4c43
	dw Func_b4c48
	dw Func_b4c4d
	dw Func_b4c52
	dw Func_b4c6d
	dw Func_b4c72
	dw Func_b4c77
	dw Func_b4c7c
	dw Func_b4c81
	dw Func_b4c86
	dw Func_b4c8b
	dw Func_b4c95
	dw Func_b4c9f
	dw Func_b4ca4
	dw Func_b4cae
	dw Func_b4cb3
	dw Func_b4cb8
	dw Func_b4cbd
	dw Func_b4c11
; 0xb4be9

Func_b4be9: ; b4be9 (2d:4be9)
	ld de, Frameset_a9e61
	jr Func_b4c57

Func_b4bee: ; b4bee (2d:4bee)
	ld de, Frameset_a9e72
	jr Func_b4c57

Func_b4bf3: ; b4bf3 (2d:4bf3)
	ld de, Frameset_a9e75
	jr Func_b4c57

Func_b4bf8: ; b4bf8 (2d:4bf8)
	ld de, Frameset_a9e94
	jr Func_b4c57

Func_b4bfd: ; b4bfd (2d:4bfd)
	ld de, Frameset_a9e7a
	jr Func_b4c60

Func_b4c02: ; b4c02 (2d:4c02)
	ld de, Frameset_a9e8c
	jr Func_b4c57

Func_b4c07: ; b4c07 (2d:4c07)
	ld de, Frameset_a9e91
	jr Func_b4c57

Func_b4c0c: ; b4c0c (2d:4c0c)
	ld de, Frameset_a9fd0
	jr Func_b4c60

Func_b4c11: ; b4c11 (2d:4c11)
	ld de, Frameset_a9e99
	jr Func_b4c60

Func_b4c16: ; b4c16 (2d:4c16)
	ld de, Frameset_a9ed3
	jr Func_b4c57

Func_b4c1b: ; b4c1b (2d:4c1b)
	ld de, Frameset_a9eea
	call UpdateCurOWOjAnimation
	ld b, $0b
	jr Func_b4c65

Func_b4c25: ; b4c25 (2d:4c25)
	ld de, Frameset_a9ef1
	jr Func_b4c57

Func_b4c2a: ; b4c2a (2d:4c2a)
	ld de, Frameset_a9ee3
	jr Func_b4c57

Func_b4c2f: ; b4c2f (2d:4c2f)
	ld de, Frameset_a9ef6
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b4c65

Func_b4c39: ; b4c39 (2d:4c39)
	ld de, Frameset_a9efd
	jr Func_b4c57

Func_b4c3e: ; b4c3e (2d:4c3e)
	ld de, Frameset_a9ee0
	jr Func_b4c57

Func_b4c43: ; b4c43 (2d:4c43)
	ld de, Frameset_a9f02
	jr Func_b4c57

Func_b4c48: ; b4c48 (2d:4c48)
	ld de, Frameset_a9f0d
	jr Func_b4c57

Func_b4c4d: ; b4c4d (2d:4c4d)
	ld de, Frameset_a9ecd
	jr Func_b4c57

Func_b4c52: ; b4c52 (2d:4c52)
	ld de, Frameset_a9ed0
	jr Func_b4c57

Func_b4c57: ; b4c57 (2d:4c57)
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4c5a: ; b4c5a (2d:4c5a)
	ld de, $580c
	jp AddCurOWObjSpriteWithScroll

Func_b4c60: ; b4c60 (2d:4c60)
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4c65: ; b4c65 (2d:4c65)
	call Func_b4a0d
	jp z, Func_b4ba2
	jr Func_b4c5a
; 0xb4c6d

Func_b4c6d: ; b4c6d (2d:4c6d)
	ld de, Frameset_a9eaa
	jr Func_b4c57
; 0xb4c72

Func_b4c72: ; b4c72 (2d:4c72)
	ld de, Frameset_a9eb3
	jr Func_b4c57
; 0xb4c77

Func_b4c77: ; b4c77 (2d:4c77)
	ld de, Frameset_a9ebc
	jr Func_b4c57
; 0xb4c7c

Func_b4c7c: ; b4c7c (2d:4c7c)
	ld de, Frameset_a9ec5
	jr Func_b4c57
; 0xb4c81

Func_b4c81: ; b4c81 (2d:4c81)
	ld de, Frameset_a9ec8
	jr Func_b4c60
; 0xb4c86

Func_b4c86: ; b4c86 (2d:4c86)
	ld de, Frameset_a9f36
	jr Func_b4c57
; 0xb4c8b

Func_b4c8b: ; b4c8b (2d:4c8b)
	ld de, Frameset_a9f47
	call UpdateCurOWOjAnimation
	ld b, $1b
	jr Func_b4c65
; 0xb4c95

Func_b4c95: ; b4c95 (2d:4c95)
	ld de, Frameset_a9f76
	call UpdateCurOWOjAnimation
	ld b, $19
	jr Func_b4c65
; 0xb4c9f

Func_b4c9f: ; b4c9f (2d:4c9f)
	ld de, Frameset_a9fa7
	jr Func_b4c57
; 0xb4ca4

Func_b4ca4: ; b4ca4 (2d:4ca4)
	ld de, Frameset_a9faa
	call UpdateCurOWOjAnimation
	ld b, $1c
	jr Func_b4c65
; 0xb4cae

Func_b4cae: ; b4cae (2d:4cae)
	ld de, Frameset_a9fc9
	jr Func_b4c57
; 0xb4cb3

Func_b4cb3: ; b4cb3 (2d:4cb3)
	ld de, Frameset_a9fbb
	jr Func_b4c57
; 0xb4cb8

Func_b4cb8: ; b4cb8 (2d:4cb8)
	ld de, Frameset_a9fc2
	jr Func_b4c57
; 0xb4cbd

Func_b4cbd: ; b4cbd (2d:4cbd)
	ld de, Frameset_a9fdf
	jr Func_b4c57
; 0xb4cc2

Func_b4cc2: ; b4cc2 (2d:4cc2)
	ld a, c
	and $f8
	ld hl, wCurOWObj
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4ccb: ; b4ccb (2d:4ccb)
	jumptable

	dw Func_b4000
	dw Func_b4d0e
	dw Func_b4d14
	dw Func_b4d1f
	dw Func_b4d25
	dw Func_b4d2b
	dw Func_b4d31
	dw Func_b4d3c
	dw Func_b4d41
	dw Func_b4d4b
	dw Func_b4d50
	dw Func_b4d55
	dw Func_b4d5a
	dw Func_b4d5f
	dw Func_b4d64
	dw Func_b4d69
	dw Func_b4d6e
	dw Func_b4d73
	dw Func_b4d78
	dw Func_b4d7d
	dw Func_b4d87
	dw Func_b4d91
	dw Func_b4d96
	dw Func_b4d9b
	dw Func_b4db6
	dw Func_b4dbb
	dw Func_b4dc0
	dw Func_b4ddd
	dw Func_b4de2
	dw Func_b4de7
	dw Func_b4df1
	dw Func_b4000
	dw Func_b4df6
; 0xb4d0e

Func_b4d0e: ; b4d0e (2d:4d0e)
	ld de, Frameset_a96c0
	jp Func_b4da0
; 0xb4d14

Func_b4d14: ; b4d14 (2d:4d14)
	ld de, Frameset_a968d
	call UpdateCurOWOjAnimation
	ld b, $01
	jp Func_b4dae
; 0xb4d1f

Func_b4d1f: ; b4d1f (2d:4d1f)
	ld de, Frameset_a967d
	jp Func_b4da0
; 0xb4d25

Func_b4d25: ; b4d25 (2d:4d25)
	ld de, Frameset_a9680
	jp Func_b4da0
; 0xb4d2b

Func_b4d2b: ; b4d2b (2d:4d2b)
	ld de, Frameset_a9674
	jp Func_b4da0
; 0xb4d31

Func_b4d31: ; b4d31 (2d:4d31)
	ld de, Frameset_a9680
	call UpdateCurOWOjAnimation
	ld b, $03
	jp Func_b4dae
; 0xb4d3c

Func_b4d3c: ; b4d3c (2d:4d3c)
	ld de, Frameset_a96af
	jr Func_b4da0

Func_b4d41: ; b4d41 (2d:4d41)
	ld de, Frameset_a96b2
	call UpdateCurOWOjAnimation
	ld b, $09
	jr Func_b4dae

Func_b4d4b: ; b4d4b (2d:4d4b)
	ld de, Frameset_a96bd
	jr Func_b4da0

Func_b4d50: ; b4d50 (2d:4d50)
	ld de, Frameset_a96d1
	jr Func_b4da0

Func_b4d55: ; b4d55 (2d:4d55)
	ld de, Frameset_a969a
	jr Func_b4da0

Func_b4d5a: ; b4d5a (2d:4d5a)
	ld de, Frameset_a96a3
	jr Func_b4da0

Func_b4d5f: ; b4d5f (2d:4d5f)
	ld de, Frameset_a96a6
	jr Func_b4da0

Func_b4d64: ; b4d64 (2d:4d64)
	ld de, Frameset_a96a9
	jr Func_b4da0

Func_b4d69: ; b4d69 (2d:4d69)
	ld de, Frameset_a96ac
	jr Func_b4da0

Func_b4d6e: ; b4d6e (2d:4d6e)
	ld de, Frameset_a96d8
	jr Func_b4da0

Func_b4d73: ; b4d73 (2d:4d73)
	ld de, Frameset_a96e1
	jr Func_b4da9

Func_b4d78: ; b4d78 (2d:4d78)
	ld de, Frameset_a96ea
	jr Func_b4da9

Func_b4d7d: ; b4d7d (2d:4d7d)
	ld de, Frameset_a96ef
	call UpdateCurOWOjAnimation
	ld b, $15
	jr Func_b4dae

Func_b4d87: ; b4d87 (2d:4d87)
	ld de, Frameset_a974a
	call UpdateCurOWOjAnimation
	ld b, $15
	jr Func_b4dae

Func_b4d91: ; b4d91 (2d:4d91)
	ld de, Frameset_a979f
	jr Func_b4da0

Func_b4d96: ; b4d96 (2d:4d96)
	ld de, Frameset_a97a2
	jr Func_b4da0

Func_b4d9b: ; b4d9b (2d:4d9b)
	ld de, Frameset_a97ad
	jr Func_b4da9

Func_b4da0: ; b4da0 (2d:4da0)
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4da3: ; b4da3 (2d:4da3)
	ld de, $5161
	jp AddCurOWObjSpriteWithScroll
;	fallthrough

Func_b4da9: ; b4da9 (2d:4da9)
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4dae: ; b4dae (2d:4dae)
	call Func_b4a0d
	jp z, Func_b4ccb
	jr Func_b4da3
; 0xb4db6

Func_b4db6: ; b4db6 (2d:4db6)
	ld de, Frameset_a97e1
	jr Func_b4da0
; 0xb4dbb

Func_b4dbb: ; b4dbb (2d:4dbb)
	ld de, Frameset_a97ec
	jr Func_b4da0
; 0xb4dc0

Func_b4dc0: ; b4dc0 (2d:4dc0)
	ld de, Frameset_a97d4
	call UpdateCurOWOjAnimation
	ld a, [wOWAnimationFinished]
	cp $ff
	call z, Func_b4dd4
	ld de, $5161
	jp AddCurOWObjSpriteWithScroll
; 0xb4dd4

Func_b4dd4: ; b4dd4 (2d:4dd4)
	play_sfx SFX_12F
	ret
; 0xb4ddd

Func_b4ddd: ; b4ddd (2d:4ddd)
	ld de, Frameset_a97c5
	jr Func_b4da9
; 0xb4de2

Func_b4de2: ; b4de2 (2d:4de2)
	ld de, Frameset_a97ef
	jr Func_b4da9
; 0xb4de7

Func_b4de7: ; b4de7 (2d:4de7)
	ld de, Frameset_a97b2
	call UpdateCurOWOjAnimation
	ld b, $15
	jr Func_b4dae
; 0xb4df1

Func_b4df1: ; b4df1 (2d:4df1)
	ld de, Frameset_a97fe
	jr Func_b4da0
; 0xb4df6

Func_b4df6: ; b4df6 (2d:4df6)
	ld de, Frameset_a9803
	jr Func_b4da0
; 0xb4dfb

Func_b4dfb: ; b4dfb (2d:4dfb)
	ld a, c
	and $f8
	ld hl, wCurOWObj
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4e04: ; b4e04 (2d:4e04)
	jumptable

	dw Func_b4000
	dw Func_b4e77
	dw Func_b4e7c
	dw Func_b4e81
	dw Func_b4e86
	dw Func_b4e8b
	dw Func_b4ea4
	dw Func_b4ea9
	dw Func_b4ebd
	dw Func_b4e8b
	dw Func_b4ec2
	dw Func_b4ec8
	dw Func_b4ed2
	dw Func_b4ed8
	dw Func_b4ee3
	dw Func_b4ee9
	dw Func_b4ef4
	dw Func_b4eff
	dw Func_b4f05
	dw Func_b4f0b
	dw Func_b4f16
	dw Func_b4f1c
	dw Func_b4f22
	dw Func_b4f28
	dw Func_b4f2e
	dw Func_b4f34
	dw Func_b4f3a
	dw Func_b4f40
	dw Func_b4f46
	dw Func_b4f4c
	dw Func_b4f52
	dw Func_b4f82
	dw Func_b4f8a
	dw Func_b4f90
	dw Func_b4f96
	dw Func_b4f9c
; 0xb4e4d

Func_b4e4d: ; b4e4d (2d:4e4d)
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4e50: ; b4e50 (2d:4e50)
	ld de, $484a
	jp AddCurOWObjSpriteWithScroll
; 0xb4e56

Func_b4e56: ; b4e56 (2d:4e56)
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4e5b: ; b4e5b (2d:4e5b)
	call Func_b4a0d
	jr z, Func_b4e04
	jr Func_b4e50
; 0xb4e62

Func_b4e62: ; b4e62 (2d:4e62)
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4e65: ; b4e65 (2d:4e65)
	ld de, $4f57
	jp AddCurOWObjSpriteWithScroll
; 0xb4e6b

	INCROM $b4e6b, $b4e70

Func_b4e70: ; b4e70 (2d:4e70)
	call Func_b4a0d
	jr z, Func_b4e04
	jr Func_b4e65
; 0xb4e77

Func_b4e77: ; b4e77 (2d:4e77)
	ld de, Frameset_a8de9
	jr Func_b4e56
; 0xb4e7c

Func_b4e7c: ; b4e7c (2d:4e7c)
	ld de, Frameset_a8de2
	jr Func_b4e4d
; 0xb4e81

Func_b4e81: ; b4e81 (2d:4e81)
	ld de, Frameset_a8dd1
	jr Func_b4e4d
; 0xb4e86

Func_b4e86: ; b4e86 (2d:4e86)
	ld de, Frameset_a8e1e
	jr Func_b4e56
; 0xb4e8b

Func_b4e8b: ; b4e8b (2d:4e8b)
	push bc
	ld de, Frameset_a8e29
	call UpdateCurOWOjAnimation
	pop hl
	ld a, [w2d011]
	and a
	ld b, $00
	jr z, .asm_b4e9d
	ld b, $06
.asm_b4e9d
	set 0, l
	res 2, l
	ld [hl], b
	jr Func_b4e50
; 0xb4ea4

Func_b4ea4: ; b4ea4 (2d:4ea4)
	ld de, Frameset_a8e2c
	jr Func_b4e4d
; 0xb4ea9

Func_b4ea9: ; b4ea9 (2d:4ea9)
	ld de, Frameset_a8e5d
	call Func_b4e56
	ld a, [wOWObj7Unk6]
	and a
	ret nz
	ld [wOWObj8Duration], a
	ld a, $08
	ld [wOWObj8Unk6], a
	ret
; 0xb4ebd

Func_b4ebd: ; b4ebd (2d:4ebd)
	ld de, Frameset_a8e6c
	jr Func_b4e4d
; 0xb4ec2

Func_b4ec2: ; b4ec2 (2d:4ec2)
	ld de, Frameset_a8df8
	jp Func_b4e4d
; 0xb4ec8

Func_b4ec8: ; b4ec8 (2d:4ec8)
	ld de, Frameset_a8e04
	call UpdateCurOWOjAnimation
	ld b, $0c
	jr Func_b4e5b
; 0xb4ed2

Func_b4ed2: ; b4ed2 (2d:4ed2)
	ld de, Frameset_a8e01
	jp Func_b4e4d
; 0xb4ed8

Func_b4ed8: ; b4ed8 (2d:4ed8)
	ld de, Frameset_a8e11
	call UpdateCurOWOjAnimation
	ld b, $0e
	jp Func_b4e5b
; 0xb4ee3

Func_b4ee3: ; b4ee3 (2d:4ee3)
	ld de, Frameset_a8f17
	jp Func_b4e4d
; 0xb4ee9

Func_b4ee9: ; b4ee9 (2d:4ee9)
	ld de, Frameset_a9090
	call UpdateCurOWOjAnimation
	ld b, $11
	jp Func_b4e70
; 0xb4ef4

Func_b4ef4: ; b4ef4 (2d:4ef4)
	ld de, Frameset_a90eb
	call UpdateCurOWOjAnimation
	ld b, $11
	jp Func_b4e70
; 0xb4eff

Func_b4eff: ; b4eff (2d:4eff)
	ld de, Frameset_a9140
	jp Func_b4e62
; 0xb4f05

Func_b4f05: ; b4f05 (2d:4f05)
	ld de, Frameset_a9143
	jp Func_b4e62
; 0xb4f0b

Func_b4f0b: ; b4f0b (2d:4f0b)
	ld de, Frameset_a914e
	call UpdateCurOWOjAnimation
	ld b, $11
	jp Func_b4e70
; 0xb4f16

Func_b4f16: ; b4f16 (2d:4f16)
	ld de, Frameset_a8e9d
	jp Func_b4e56
; 0xb4f1c

Func_b4f1c: ; b4f1c (2d:4f1c)
	ld de, Frameset_a8eac
	jp Func_b4e56
; 0xb4f22

Func_b4f22: ; b4f22 (2d:4f22)
	ld de, Frameset_a8eb7
	jp Func_b4e56
; 0xb4f28

Func_b4f28: ; b4f28 (2d:4f28)
	ld de, Frameset_a8ec2
	jp Func_b4e4d
; 0xb4f2e

Func_b4f2e: ; b4f2e (2d:4f2e)
	ld de, Frameset_a8ec7
	jp Func_b4e4d
; 0xb4f34

Func_b4f34: ; b4f34 (2d:4f34)
	ld de, Frameset_a8eca
	jp Func_b4e4d
; 0xb4f3a

Func_b4f3a: ; b4f3a (2d:4f3a)
	ld de, Frameset_a8eca
	jp Func_b4e56
; 0xb4f40

Func_b4f40: ; b4f40 (2d:4f40)
	ld de, Frameset_a8ed3
	jp Func_b4e4d
; 0xb4f46

Func_b4f46: ; b4f46 (2d:4f46)
	ld de, Frameset_a8eda
	jp Func_b4e4d
; 0xb4f4c

Func_b4f4c: ; b4f4c (2d:4f4c)
	ld de, Frameset_a8ee1
	jp Func_b4e4d
; 0xb4f52

Func_b4f52: ; b4f52 (2d:4f52)
	ld de, Frameset_a8ee8
	call Func_b4e4d
;	fallthrough

Func_b4f58: ; b4f58 (2d:4f58)
	ld hl, wTempPals1 palette 5
	ld a, [wOWObj11TileID]
	cp $57
	jr z, .asm_b4f6b
	ld a, [wOWObj11Unk6]
	and a
	jr z, .asm_b4f6b
	ld hl, .pal
.asm_b4f6b
	ld de, wTempBGPals palette 5
	ld b, 1 palettes
	call CopyHLToDE
	ld hl, w2d0d0
	ld a, $68
	ld [hl], a
	ret

.pal
	rgb 12, 29,  0
	rgb 31, 31, 31
	rgb 31, 26,  2
	rgb 31,  0, 10
; 0xb4f82

Func_b4f82: ; b4f82 (2d:4f82)
	ld de, Frameset_a8ee8
	call Func_b4e56
	jr Func_b4f58
; 0xb4f8a

Func_b4f8a: ; b4f8a (2d:4f8a)
	ld de, Frameset_a8f28
	jp Func_b4e4d
; 0xb4f90

Func_b4f90: ; b4f90 (2d:4f90)
	ld de, Frameset_a8f31
	jp Func_b4e4d
; 0xb4f96

Func_b4f96: ; b4f96 (2d:4f96)
	ld de, Frameset_a8f47
	jp Func_b4e4d
; 0xb4f9c

Func_b4f9c: ; b4f9c (2d:4f9c)
	ld de, Frameset_a8f3a
	jp Func_b4e4d
; 0xb4fa2

Func_b4fa2: ; b4fa2 (2d:4fa2)
	ld a, c
	and $f8
	ld hl, wCurOWObj
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4fab: ; b4fab (2d:4fab)
	jumptable

	dw Func_b4000
	dw Func_b5004
	dw Func_b5009
	dw Func_b500e
	dw Func_b5013
	dw Func_b5018
	dw Func_b501d
	dw Func_b5022
	dw Func_b5027
	dw Func_b5031
	dw Func_b5036
	dw Func_b5040
	dw Func_b5045
	dw Func_b504f
	dw Func_b5059
	dw Func_b505e
	dw Func_b5063
	dw Func_b5068
	dw Func_b506d
	dw Func_b4000
	dw Func_b5072
	dw Func_b5077
	dw Func_b5093
	dw Func_b509d
	dw Func_b50a7
	dw Func_b4000
	dw Func_b50ac
	dw Func_b4000
	dw Func_b50b1
	dw Func_b50b6
	dw Func_b50c0
	dw Func_b50ca
	dw Func_b50cf
	dw Func_b50d4
	dw Func_b50d9
	dw Func_b50de
	dw Func_b50ea
	dw Func_b50f6
	dw Func_b50fb
	dw Func_b5105
	dw Func_b510a
	dw Func_b512a
	dw Func_b5130
	dw Func_b5136
; 0xb5004

Func_b5004: ; b5004 (2d:5004)
	ld de, Frameset_a85cd
	jr Func_b507c

Func_b5009: ; b5009 (2d:5009)
	ld de, Frameset_a8590
	jr Func_b5085

Func_b500e: ; b500e (2d:500e)
	ld de, Frameset_a85d0
	jr Func_b507c

Func_b5013: ; b5013 (2d:5013)
	ld de, Frameset_a85d3
	jr Func_b5085

Func_b5018: ; b5018 (2d:5018)
	ld de, Frameset_a862a
	jr Func_b507c

Func_b501d: ; b501d (2d:501d)
	ld de, Frameset_a8653
	jr Func_b5085

Func_b5022: ; b5022 (2d:5022)
	ld de, Frameset_a862d
	jr Func_b507c

Func_b5027: ; b5027 (2d:5027)
	ld de, Frameset_a8639
	call UpdateCurOWOjAnimation
	ld b, $09
	jr Func_b508a

Func_b5031: ; b5031 (2d:5031)
	ld de, Frameset_a8636
	jr Func_b507c

Func_b5036: ; b5036 (2d:5036)
	ld de, Frameset_a8646
	call UpdateCurOWOjAnimation
	ld b, $0b
	jr Func_b508a

Func_b5040: ; b5040 (2d:5040)
	ld de, Frameset_a866e
	jr Func_b507c

Func_b5045: ; b5045 (2d:5045)
	ld de, Frameset_a867f
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b508a

Func_b504f: ; b504f (2d:504f)
	ld de, Frameset_a86da
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b508a

Func_b5059: ; b5059 (2d:5059)
	ld de, Frameset_a872f
	jr Func_b507c

Func_b505e: ; b505e (2d:505e)
	ld de, Frameset_a8732
	jr Func_b507c

Func_b5063: ; b5063 (2d:5063)
	ld de, Frameset_a8750
	jr Func_b507c

Func_b5068: ; b5068 (2d:5068)
	ld de, Frameset_a8761
	jr Func_b507c

Func_b506d: ; b506d (2d:506d)
	ld de, Frameset_a879a
	jr Func_b507c

Func_b5072: ; b5072 (2d:5072)
	ld de, Frameset_a8764
	jr Func_b507c

Func_b5077: ; b5077 (2d:5077)
	ld de, Frameset_a876f
	jr Func_b507c
; 0xb507c

Func_b507c: ; b507c (2d:507c)
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b507f: ; b507f (2d:507f)
	ld de, $4000
	jp AddCurOWObjSpriteWithScroll
; 0xb5085

Func_b5085: ; b5085 (2d:5085)
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b508a: ; b508a (2d:508a)
	call Func_b4a0d
	jp z, Func_b4fab
	jp Func_b507f
; 0xb5093

Func_b5093: ; b5093 (2d:5093)
	ld de, Frameset_a8782
	call UpdateCurOWOjAnimation
	ld b, $18
	jr Func_b508a
; 0xb509d

Func_b509d: ; b509d (2d:509d)
	ld de, Frameset_a8793
	call UpdateCurOWOjAnimation
	ld b, $19
	jr Func_b508a
; 0xb50a7

Func_b50a7: ; b50a7 (2d:50a7)
	ld de, Frameset_a877a
	jr Func_b507c
; 0xb50ac

Func_b50ac: ; b50ac (2d:50ac)
	ld de, Frameset_a877d
	jr Func_b507c
; 0xb50b1

Func_b50b1: ; b50b1 (2d:50b1)
	ld de, Frameset_a879f
	jr Func_b5085
; 0xb50b6

Func_b50b6: ; b50b6 (2d:50b6)
	ld de, Frameset_a873d
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b508a
; 0xb50c0

Func_b50c0: ; b50c0 (2d:50c0)
	ld de, Frameset_a87d2
	call UpdateCurOWOjAnimation
	ld b, $20
	jr Func_b508a
; 0xb50ca

Func_b50ca: ; b50ca (2d:50ca)
	ld de, Frameset_a87d9
	jr Func_b507c
; 0xb50cf

Func_b50cf: ; b50cf (2d:50cf)
	ld de, Frameset_a87dc
	jr Func_b507c
; 0xb50d4

Func_b50d4: ; b50d4 (2d:50d4)
	ld de, Frameset_a87df
	jr Func_b507c
; 0xb50d9

Func_b50d9: ; b50d9 (2d:50d9)
	ld de, Frameset_aa5f5
	jr Func_b50e1

Func_b50de: ; b50de (2d:50de)
	ld de, Frameset_aa5f8
;	fallthrough

Func_b50e1: ; b50e1 (2d:50e1)
	call UpdateCurOWOjAnimation
	ld de, $6580
	jp AddCurOWObjSpriteWithScroll
; 0xb50ea

Func_b50ea: ; b50ea (2d:50ea)
	ld de, Frameset_aa252
	call UpdateCurOWOjAnimation
	ld de, $60cf
	jp AddCurOWObjSpriteWithScroll
; 0xb50f6

Func_b50f6: ; b50f6 (2d:50f6)
	ld de, Frameset_aa0a3
	jr Func_b5114

Func_b50fb: ; b50fb (2d:50fb)
	ld de, Frameset_aa0c1
	call UpdateCurOWOjAnimation
	ld b, $27
	jr Func_b5114.asm_b5122

Func_b5105: ; b5105 (2d:5105)
	ld de, Frameset_aa09d
	jr Func_b5114

Func_b510a: ; b510a (2d:510a)
	ld de, Frameset_aa0bc
	call UpdateCurOWOjAnimation
	ld b, $25
	jr Func_b5114.asm_b5122

Func_b5114: ; b5114 (2d:5114)
	call UpdateCurOWOjAnimation
.asm_b5117
	ld de, $5fe2
	jp AddCurOWObjSpriteWithScroll
	call UpdateCurOWOjAnimation
	ld b, $00
.asm_b5122
	call Func_b4a0d
	jp z, Func_b4fab
	jr .asm_b5117
; 0xb512a

Func_b512a: ; b512a (2d:512a)
	ld de, Frameset_a87e8
	jp Func_b507c
; 0xb5130

Func_b5130: ; b5130 (2d:5130)
	ld de, Frameset_a87f1
	jp Func_b507c
; 0xb5136

Func_b5136: ; b5136 (2d:5136)
	ld de, Frameset_a883b
	call UpdateCurOWOjAnimation
	ld b, $00
	call Func_b4a0d
	jp z, Func_b4fab
	ld de, $47fa
	jp AddCurOWObjSprite
; 0xb514a

	INCROM $b514a, $b586d

Func_b586d: ; b586d (2d:586d)
	farcall Func_854ee
	ret
; 0xb587d

	INCROM $b587d, $b5b4e

Func_b5b4e: ; b5b4e (2d:5b4e)
	ld de, Data_b6337
	ld hl, wOWObj1
	call Func_3c25
	ret nz
	ld a, [w2d025]
	and a
	ret nz
	ld a, [wTopBarState]
	and a
	ret nz
	play_sfx SFX_11D
	ret
; 0xb5b6b

	INCROM $b5b6b, $b6337

Data_b6337: ; b6337 (2d:6337)
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db -1,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db -1,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  1,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  1,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db $80
; 0xb6478

	INCROM $b6478, $b791d

Func_b791d: ; b791d (2d:791d)
	ret
; 0xb791e

Func_b791e: ; b791e (2d:791e)
	ld a, [wCurMapSide]
	jumptable

	dw .North ; MAP_NORTH
	dw .West  ; MAP_WEST
	dw .South ; MAP_SOUTH
	dw .East  ; MAP_EAST

.North
	ld bc, wOWObj2Unk6
	call Func_b7984
	ld bc, wOWObj3Unk6
	call Func_b7984
	ld bc, wOWObj6Unk6
	call Func_b7984
	ld bc, wOWObj7Unk6
	call Func_b7984
	ld bc, wOWObj14Unk6
	call Func_b7984
	ld bc, wOWObj15Unk6
	jp Func_b7984

.West
	ld bc, wOWObj1Unk6
	call Func_b7a6d
	ld bc, wOWObj7Unk6
	call Func_b7a6d
	ld bc, wOWObj8Unk6
	call Func_b7a6d
	ld bc, wOWObj5Unk6
	jp Func_b7a6d

.South
	ld bc, wOWObj7Unk6
	call Func_b7c18
	ld bc, wOWObj14Unk6
	call Func_b7c18
	ld bc, wOWObj15Unk6
	jp Func_b7c18

.East
	ld bc, wOWObj5Unk6
	call Func_b7b61
	ld bc, wOWObj7Unk6
	jp Func_b7b61
; 0xb7984

Func_b7984: ; b7984 (2d:7984)
	ld a, [bc]
	jumptable

	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b79de
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7a32
	dw Func_b791d
; 0xb79a6

	INCROM $b79a6, $b79de

Func_b79de: ; b79de (2d:79de)
	ld a, [w2d025]
	and a
	ret nz
	ld a, [w2d067]
	cp $06
	ret nz
	ld a, $06
	ld hl, wOWObj3Unk6
	call Func_3b93
	play_sfx SFX_005
	ret
; 0xb79fa

	INCROM $b79fa, $b7a32

Func_b7a32: ; b7a32 (2d:7a32)
	call Func_b7a5a
	ld hl, w2d125
	jr z, .asm_b7a3f
	inc [hl]
	ld a, [hl]
	cp $78
	ret c

.asm_b7a3f
	xor a
	ld [hl], a
	ld [w2d124], a
	call Func_b7a5a
	ld b, $1d
	jr nz, .asm_b7a52
	ld a, $01
	ld [w2d124], a
	ld b, $0d
.asm_b7a52
	ld a, b
	ld hl, wOWObj2Unk6
	call Func_3b93
	ret
; 0xb7a5a

Func_b7a5a: ; b7a5a (2d:7a5a)
	ld a, [w2d025]
	and a
	ret nz
	ld a, [w2d124]
	and a
	ret nz
	ld a, [wMapSideLevelIndex]
	cp $02
	ret z
	cp $07
	ret
; 0xb7a6d

Func_b7a6d: ; b7a6d (2d:7a6d)
	ld a, [bc]
	jumptable

	dw Func_b791d
	dw Func_b791d
	dw Func_b7ab7
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7ac0
	dw Func_b791d
	dw Func_b7afb
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7b26
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
; 0xb7ab7

Func_b7ab7: ; b7ab7 (2d:7ab7)
	ld a, [w2d025]
	cp $04
	ret z
	jp Func_b5b4e
; 0xb7ac0

Func_b7ac0: ; b7ac0 (2d:7ac0)
	ld a, [w2d025]
	and a
	ret nz
	ld hl, wOWObj8Unk7
	ld a, [hl]
	and a
	jr nz, .asm_b7ad7
	ld a, [wOWObj7Unk6]
	and a
	ret nz
	ld a, [w2d055]
	and a
	ret nz
	inc [hl]
.asm_b7ad7
	ld a, [w2d011]
	and a
	jr nz, .asm_b7af0
	ld a, [w2d055]
	cp $02
	ret nz
	ld a, $07
.asm_b7ae5
	ld hl, wOWObj7Unk6
	call Func_3b93
	xor a
	ld [wOWObj8Unk7], a
	ret
.asm_b7af0
	ld a, $08
	ld [wOWObj8Unk6], a
	xor a
	ld [wOWObj8Duration], a
	jr .asm_b7ae5
; 0xb7afb

Func_b7afb: ; b7afb (2d:7afb)
	ld a, [w2d025]
	and a
	ret nz
	ld hl, wOWObj8Unk7
	ld a, [hl]
	and a
	jr nz, .asm_b7b0d
	ld a, [w2d055]
	and a
	ret nz
	inc [hl]
.asm_b7b0d
	ld a, [w2d011]
	and a
	jr z, .asm_b7b19
	ld a, [w2d055]
	cp $02
	ret nz
.asm_b7b19
	ld a, $06
	ld [wOWObj8Unk6], a
	xor a
	ld [wOWObj8Duration], a
	ld [wOWObj8Unk7], a
	ret
; 0xb7b26

Func_b7b26: ; b7b26 (2d:7b26)
	call Func_b7b4e
	ld hl, w2d12b
	jr z, .asm_b7b33
	inc [hl]
	ld a, [hl]
	cp $78
	ret c
.asm_b7b33
	xor a
	ld [hl], a
	ld [w2d12a], a
	call Func_b7b4e
	ld b, $13
	jr nz, .asm_b7b46
	ld a, $01
	ld [w2d12a], a
	ld b, $10
.asm_b7b46
	ld a, b
	ld hl, wOWObj5Unk6
	call Func_3b93
	ret
; 0xb7b4e

Func_b7b4e: ; b7b4e (2d:7b4e)
	ld a, [w2d025]
	and a
	ret nz
	ld a, [w2d12a]
	and a
	ret nz
	ld a, [wMapSideLevelIndex]
	cp $01
	ret z
	cp $02
	ret
; 0xb7b61

Func_b7b61: ; b7b61 (2d:7b61)
	ld a, [bc]
	jumptable

	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7ba9
	dw Func_b7bc9
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7c05
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
; 0xb7ba9

Func_b7ba9: ; b7ba9 (2d:7ba9)
	call Func_b7be9
	ret nz
	ld a, [w2d011]
	and a
	jr z, .asm_b7bc2
	ld a, [w2d055]
	cp $02
	ret nz
.asm_b7bb9
	ld a, $13
	ld hl, wOWObj7Unk6
	call Func_3b93
	ret
.asm_b7bc2
	ld a, [w2d055]
	and a
	ret nz
	jr .asm_b7bb9
; 0xb7bc9

Func_b7bc9: ; b7bc9 (2d:7bc9)
	call Func_b7be9
	ret nz
	ld a, [w2d011]
	and a
	jr nz, .asm_b7be2
	ld a, [w2d055]
	cp $02
	ret nz
.asm_b7bd9
	ld a, $12
	ld hl, wOWObj7Unk6
	call Func_3b93
	ret
.asm_b7be2
	ld a, [w2d055]
	and a
	ret nz
	jr .asm_b7bd9
; 0xb7be9

Func_b7be9: ; b7be9 (2d:7be9)
	ld a, [w2d028]
	cp $01
	jr z, .asm_b7bf9
	cp $03
	jr z, .asm_b7bf9
	ld a, [w2d025]
	and a
	ret
.asm_b7bf9
	ld a, $00
	ld hl, wOWObj7Unk6
	call Func_3b93
	ld a, $01
	and a
	ret
; 0xb7c05

Func_b7c05: ; b7c05 (2d:7c05)
	ld a, [w2d025]
	and a
	ret nz
	ld hl, w2d12b
	inc [hl]
	ret nz
	ld a, $1a
	ld hl, wOWObj5Unk6
	call Func_3b93
	ret
; 0xb7c18

Func_b7c18: ; b7c18 (2d:7c18)
	ld a, [bc]
	jumptable

	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7c5c
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b7c97
	dw Func_b7ca5
	dw Func_b7cb3
; 0xb7c5c

Func_b7c5c: ; b7c5c (2d:7c5c)
	call Func_b7c84
	ld hl, w2d12f
	jr z, .asm_b7c69
	inc [hl]
	ld a, [hl]
	cp $78
	ret c
.asm_b7c69
	xor a
	ld [hl], a
	ld [w2d12e], a
	call Func_b7c84
	ld b, $1d
	jr nz, .asm_b7c7c
	ld a, $01
	ld [w2d12e], a
	ld b, $14
.asm_b7c7c
	ld a, b
	ld hl, wOWObj7Unk6
	call Func_3b93
	ret
; 0xb7c84

Func_b7c84: ; b7c84 (2d:7c84)
	ld a, [w2d025]
	and a
	ret nz
	ld a, [w2d12e]
	and a
	ret nz
	ld a, [wMapSideLevelIndex]
	cp $00
	ret z
	cp $01
	ret
; 0xb7c97

Func_b7c97: ; b7c97 (2d:7c97)
	ld a, [w2d011]
	and a
	ret nz
	ld a, $1f
	ld hl, wOWObj15Unk6
	call Func_3b93
	ret
; 0xb7ca5

Func_b7ca5: ; b7ca5 (2d:7ca5)
	ld a, [w2d011]
	and a
	ret z
	ld a, $1e
	ld hl, wOWObj15Unk6
	call Func_3b93
	ret
; 0xb7cb3

Func_b7cb3: ; b7cb3 (2d:7cb3)
	ld a, [w2d025]
	and a
	ret nz
	ld a, [w2d07c]
	and a
	jr z, .asm_b7ce7
	jr .asm_b7cc0 ; unnecessary jump
.asm_b7cc0
	ld a, [wOWObj14XCoord]
	cp $80
	ret z
	ld a, [w2d07d]
	and a
	call z, .Func_b7cda
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wOWObj14YCoord
	dec [hl]
	inc l
	inc [hl]
	ret

.Func_b7cda
	ld hl, w2d07d
	inc [hl]
	ld hl, wOWObj14YCoord
	ld [hl], $25
	inc l
	ld [hl], $70
	ret

.asm_b7ce7
	ld a, [wOWObj14XCoord]
	cp $70
	ret z
	ld a, [w2d07d]
	and a
	call z, .Func_b7d0d
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wOWObj14YCoord
	dec [hl]
	inc l
	inc [hl]
	ld a, [hl]
	cp $88
	ret nz
	ld hl, wOWObj14YCoord
	ld [hl], $25
	inc l
	ld [hl], $70
	ret

.Func_b7d0d
	ld hl, w2d07d
	inc [hl]
	ret
; 0xb7d12
