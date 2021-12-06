Data_80000: ; 80000 (20:4000)
	dw Data_80008
	dw Data_8001a
	dw Data_8002a
	dw Data_8003a
; 0x80008

Data_80008: ; 80008 (20:4008)
	db $ff, $ff
	db $00, $01
	db $01, $02
	db $07, $03
	db $03, $04
	db $04, $05
	db $05, $06
	db $03, $0e
	db $0f, $02
; 0x8001a

Data_8001a: ; 8001a (20:401a)
	db $ff, $ff
	db $00, $01
	db $01, $02
	db $02, $03
	db $01, $05
	db $02, $04
	db $03, $0e
	db $0f, $00
; 0x8002a

Data_8002a: ; 8002a (20:402a)
	db $ff, $ff
	db $00, $01
	db $01, $02
	db $01, $03
	db $01, $04
	db $02, $05
	db $02, $0e
	db $0f, $00
; 0x8003a

Data_8003a: ; 8003a (20:403a)
	db $ff, $ff
	db $00, $01
	db $00, $02
	db $01, $03
	db $06, $04
	db $03, $06
	db $02, $05
	db $06, $0e
	db $0f, $00
; 0x8004c

Data_8004c: ; 8004c (20:404c)
	dw Data_80054
	dw Data_80066
	dw Data_80076
	dw Data_80086
; 0x80054

Data_80054: ; 80054 (20:4054)
	dw $4098
	dw $409a
	dw $409f
	dw $40a4
	dw $40a9
	dw $40ae
	dw $40b3
	dw $40b8
	dw $40bd
; 0x80066

Data_80066: ; 80066 (20:4066)
	dw $40c2
	dw $40c4
	dw $40c9
	dw $40ce
	dw $40d3
	dw $40d8
	dw $40dd
	dw $40e2
; 0x80076

Data_80076: ; 80076 (20:4076)
	dw $40e7
	dw $40e9
	dw $40ee
	dw $40f3
	dw $40f8
	dw $40fd
	dw $4102
	dw $4107
; 0x80086

Data_80086: ; 80086 (20:4086)
	dw $410c
	dw $410e
	dw $4113
	dw $4118
	dw $411d
	dw $4122
	dw $4127
	dw $412c
	dw $4131
; 0x80098

	INCROM $80098, $80136

Data_80136: ; 80136 (20:4136)
	dw Data_8013e 
	dw Data_8017e 
	dw Data_801be 
	dw Data_801fe
; 0x8013e

Data_8013e: ; 8013e (20:413e)
	db $28, $38
	db $08, $08
	db $28, $18
	db $08, $fc
	db $50, $18
	db $04, $fc
	db $40, $50
	db $04, $04
	db $50, $40
	db $04, $04
	db $60, $58
	db $04, $04
	db $60, $88
	db $04, $04
	db $40, $18
	db $04, $fc
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $38, $98
	db $00, $00
	db $50, $00
	db $04, $00
; 0x8017e

Data_8017e: ; 8017e (20:417e)
	db $50, $10
	db $08, $0c
	db $38, $38
	db $08, $0c
	db $50, $48
	db $04, $0c
	db $40, $78
	db $08, $fc
	db $70, $48
	db $04, $0c
	db $10, $48
	db $0c, $0c
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $28, $98
	db $ff, $00
	db $50, $00
	db $08, $00
; 0x801be

Data_801be: ; 801be (20:41be)
	db $40, $10
	db $04, $04
	db $40, $30
	db $04, $0c
	db $40, $68
	db $04, $0c
	db $58, $50
	db $04, $04
	db $18, $40
	db $08, $0c
	db $10, $88
	db $0c, $04
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $40, $98
	db $04, $00
	db $40, $00
	db $04, $00
; 0x801fe

Data_801fe: ; 801fe (20:41fe)
	db $50, $10
	db $08, $0c
	db $68, $58
	db $04, $0c
	db $38, $38
	db $04, $0c
	db $48, $58
	db $08, $0c
	db $58, $80
	db $04, $0c
	db $10, $38
	db $0c, $0c
	db $38, $80
	db $04, $0c
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $ff, $ff
	db $00, $00
	db $38, $98
	db $04, $00
	db $50, $00
	db $08, $00
; 0x8023e

	INCROM $8023e, $80366

; gets from wTreasuresCollected the flags
; related to the crayon treasures
; and saves it in wCrayonFlags
GetCrayonFlags: ; 80366 (20:4366)
	ld hl, wTreasuresCollected + (TREASURE_CRAYON_YELLOW / 8)
	ld a, [hld]
	ld c, [hl]
	sla c
	rla
	sla c
	rla
	res 7, a
	ld [wCrayonFlags], a
	ret
; 0x80377

	INCROM $80377, $8038a

Func_8038a: ; 8038a (20:438a)
	ld hl, wca3b
	ld a, $10
	xor [hl]
	ld [hl], a
	ret
; 0x80392

Func_80392: ; 80392 (20:4392)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw Func_803f9
	dw SlowFadeFromWhite
	dw Func_804ec
	dw FastFadeToWhite
	dw Func_804f7           ; SST_OVERWORLD_05
	dw SlowFadeFromWhite
	dw Func_80540
	dw FadeBGToWhite_Normal
	dw Func_8055f           ; SST_OVERWORLD_09
	dw DarkenBGToPal_Normal
	dw $45d7
	dw FadeBGToWhite_Normal
	dw $4dc0
	dw DarkenBGToPal_Normal
	dw $4dd0
	dw FadeBGToWhite_Normal
	dw Func_80d6c           ; SST_OVERWORLD_11
	dw DarkenBGToPal_Normal
	dw $4d7c
	dw FadeBGToWhite_Normal
	dw $4db1
	dw FadeBGToWhite_Normal
	dw $4df3
	dw DarkenBGToPal_Normal
	dw $4e03
	dw FadeBGToWhite_Normal
	dw $4e13
	dw DarkenBGToPal_Normal
	dw $4e23
	dw $4e33
	dw FadeBGToWhite_Normal
	dw $4e45                ; SST_OVERWORLD_20
	dw DarkenBGToPal_Normal
	dw $4e55
	dw FastFadeToWhite
	dw $4e65
	dw SlowFadeFromWhite
	dw $4e75
	dw $4e85
; 0x803e6

Func_803e6: ; 803e6 (20:43e6)
	ld a, [wcee3]
	and a
	ret z
	ld a, [w2d050]
	and a
	ret nz
	ld a, [w2d01d]
	cp $0e
	ret nc
	jp Func_15dc
; 0x803f9

Func_803f9: ; 803f9 (20:43f9)
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	stop_music2

	ld a, [wcee3]
	ld [w2d01b], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	ld a, [w2d01b]
	inc a
	jr nz, .skip_set_first_treasure_flag
; w2d01b == $ff
	ld hl, wTreasuresCollected
	set 0, [hl]
.skip_set_first_treasure_flag

	call GetCrayonFlags

	ld a, [w2d050]
	cp $04
	jr z, .asm_8043c
	ld a, [wOWLevel]
	cp LEVEL_GOLF_BUILDING
	jp nc, .asm_804b9

	ld b, a
	call Func_81278
	ld a, b
	ld [w2d012], a
	ld a, d
	ld [w2d01d], a
.asm_8043c
	call Func_80b29

	ld a, [w2d01b]
	and a
	jr z, .asm_8048a
	cp $f0
	jr z, .asm_8048a
	cp $f1
	jr z, .asm_804a9
	cp $f2
	jr z, .asm_804a9
	cp $f3
	jr z, .asm_804b5
	inc a
	jr nz, .asm_8045f

; w2d01b == $ff
	ld a, CUTSCENE_01
	ld [w2d025], a
	jr .asm_80466
.asm_8045f
	call Func_8197e
	jr nz, .asm_80466
	jr .asm_8048a
.asm_80466
	call .Func_804c9
	farcall Func_9c005
	ld a, [w2d01e]
	and a
	jr z, .asm_80480
	jr .asm_804a0
.asm_80480
	ld a, [w2d025]
	call Func_81b0d
	jr z, .asm_8048a
	jr .asm_80497
.asm_8048a
	xor a ; CUTSCENE_00
	ld [w2d025], a
	ld a, SST_OVERWORLD_09
	ld [wSubState], a
	call Func_803e6
	ret

.asm_80497
	call .Func_804d4
	ld a, SST_OVERWORLD_05
	ld [wSubState], a
	ret

.asm_804a0
	call .Func_804d4
	ld a, SST_OVERWORLD_11
	ld [wSubState], a
	ret

.asm_804a9
	ld a, $f0
	ld [w2d00d], a
	ld a, CUTSCENE_5A
	ld [w2d025], a
	jr .asm_80480
.asm_804b5
	call Func_803e6
	ret

.asm_804b9
	xor a
	ld [w2d012], a
	ld [w2d01d], a
	ld a, SST_OVERWORLD_20
	ld [wSubState], a
	call Func_803e6
	ret

.Func_804c9
	ld a, [w2d050]
	and a
	ret nz
	ld a, $f0
	ld [w2d00d], a
	ret

.Func_804d4
	ld a, [w2d050]
	and a
	ret nz
	ld a, [w2d028]
	cp $04
	ret z
	ld a, [w2d01b]
	cp $f1
	ret z
	cp $f2
	ret z
	ld [w2d00d], a
	ret
; 0x804ec

; waits for A button input
Func_804ec: ; 804ec (20:44ec)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wSubState
	inc [hl]
	ret
; 0x804f7

Func_804f7: ; 804f7 (20:44f7)
	call DisableLCD
	stop_music2

	call Func_80b29
	call VBlank_80cb1
	call ClearWholeVirtualOAM

	xor a
	ld [w2d011], a
	ld a, [w2d015]
	ld [w2d018], a
	ld a, [w2d017]
	ld [w2d019], a
	ld a, [w2d028]
	ld [w2d029], a
	ld a, [w2d026 + 0]
	ld [w2d02a + 0], a
	ld a, [w2d026 + 1]
	ld [w2d02a + 1], a
	ld a, [w2d016]
	ld [wMapSide], a
	jumptable

	dw Func_80851
	dw Func_8091e
	dw Func_80930
	dw Func_8094e
; 0x80540

Func_80540: ; 80540 (20:4540)
	call Func_818ad
	call Func_82bb8
	call Func_82bda
	farcall Func_b4a37
	call Func_8202c
	call ClearVirtualOAM
	ret
; 0x8055f

Func_8055f: ; 8055f (20:455f)
	call DisableLCD
	call FillBGMap0_With7f

	stop_music2

	ld a, $02
	ldh [rSVBK], a
	call ClearWholeVirtualOAM
	call VBlank_80bf9

	call Func_80b29
	call Func_8184d

	ld a, [wca3b]
	ld b, a
	bit 7, a
	jr nz, .asm_8059b
	ld hl, wca3b
	ld a, [hl]
	swap a
	and $0f
	ld [w2d011], a
	srl [hl]
	rra
	rl [hl]
	jr .asm_805be
.asm_8059b
	call Func_8038a
	ld a, b
	res 7, a
	res 4, a
	ld [w2d011], a

	ld a, [wcee3]
	and a
	jr nz, .asm_805be
	ld a, [w2d011]
	xor $1
	ld [w2d011], a
	ld hl, wca3b
	srl [hl]
	rra
	rl [hl]
	res 7, [hl]
.asm_805be
	ld a, [w2d011]
	ld [w2d07c], a
	xor a
	ld [w2d07d], a
	ld a, [w2d012]
	ld [wMapSide], a
	jumptable

	dw Func_805e1 ; MAP_NORTH
	dw Func_805fd ; MAP_WEST
	dw Func_8060f ; MAP_SOUTH
	dw Func_80621 ; MAP_EAST
; 0x805d7

	INCROM $805d7, $805e1

Func_805e1: ; 805e1 (20:45e1)
	call Func_80aa5
	call LoadOverworld1Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	ld bc, BGMap_85bef
	ld d, BANK(BGMap_85bef)
	ld hl, BGMap_85d79
	ld e, BANK(BGMap_85d79)
	call LoadBGMapsToWRAM
	jp Func_8065e
; 0x805fd

Func_805fd: ; 805fd (20:45fd)
	call Func_80aa5
	call LoadOverworld2Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80ae7
	jp Func_8065e
; 0x8060f

Func_8060f: ; 8060f (20:460f)
	call Func_80aa5
	call LoadOverworld5Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80af5
	jp Func_8065e
; 0x80621

Func_80621: ; 80621 (20:4621)
	ld a, CUTSCENE_1B
	call Func_819c6
	ld [w2d020], a
	ld a, [w2d020] ; unnecessary
	and a
	jr nz, .asm_8063b
	ld a, $01
	ld [w2d011], a
	ld hl, wca3b
	set 0, [hl]
	res 7, [hl]
.asm_8063b
	ld a, [wcee3]
	cp $34
	call z, Func_80655
	call Func_80aa5
	call LoadOverworld6Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80b1b
	jp Func_8065e
; 0x80655

Func_80655: ; 80655 (20:4655)
	ld a, TREASURE_KEY_CARD_RED
	call IsTreasureCollected
	jp z, Func_803f9.Func_804c9
	ret
; 0x8065e

Func_8065e: ; 8065e (20:465e)
	ld a, [wca3d]
	ld c, a
	and $1
	bit 1, c
	jr z, .asm_80669
	xor a
.asm_80669
	ld [w2d01f], a
	call Func_80b54

	ld a, BANK(BGMap_85b91)
	ld [wTempBank], a
	ld hl, BGMap_85b91
	ld bc, v0BGMap0 tile $3a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_85bc4)
	ld [wTempBank], a
	ld hl, BGMap_85bc4
	ld bc, v1BGMap0 tile $3a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a

	ld a, [w2d050]
	and a
	ld a, $ec
	jr nz, .asm_806b6
	ld a, $04
.asm_806b6
	ldh [rSCY], a
	ld [wTempSCY], a
	xor a
	ldh [rSCX], a
	ld [wTempSCX], a
	xor a
	ld [wNumOAMSprites], a

	ld a, [wMapSide] ; a gets overwritten
	call Func_81dce
	call Func_812c0
	call Func_80bd9
	call WriteBGMapFromWRAM

	call Func_8212c
	ld a, [w2d01d]
	ld [w2d067], a
	ld [w2d068], a
	xor a
	ld [w2d073], a

	ld a, $01
	call Func_820af
	farcall Func_b4a3d
	call Func_82041
	farcall Func_b4aa9
	call Func_80bc9

	ld a, [wca3d]
	bit 1, a
	jr nz, .asm_80753
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
	jr .asm_80790

.asm_80753
	ld a, BANK(BGMap_868f5)
	ld [wTempBank], a
	ld hl, BGMap_868f5
	ld bc, v0BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_86929)
	ld [wTempBank], a
	ld hl, BGMap_86929
	ld bc, v0BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a

.asm_80790
	xor a
	ld [w2d095], a
	ldh [rWX], a
	ld a, $90
	ld [w2d094], a
	ldh [rWY], a
	xor a
	ld [w2d091], a

	ld a, TREASURE_MAGNIFYING_GLASS
	call IsTreasureCollected
	ld [wHasMagnifyingGlass], a

	xor a
	ld hl, w2d054
	ld [hl], a
	set 2, [hl]
	call Func_8178b
	call Func_817a3
	call Func_817d7
	call Func_8182b

	ld hl, v0BGMap0 tile $3c
	ld de, wBGMap1 tile $2a
	ld b, 4 tiles
	call CopyHLToDE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0 tile $3c
	ld de, wBGMap1 tile $26
	ld b, 4 tiles
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld a, [w2d050]
	cp $04
	jr nz, .asm_80809
	call Func_822b4
	ld hl, wBGMap1 tile $2a
	ld de, v0BGMap0 tile $3c
	ld b, 4 tiles
	call CopyHLToDE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wBGMap1 tile $26
	ld de, v1BGMap0 tile $3c
	ld b, 4 tiles
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld a, [w2d02c]
	ld [wcee3], a
	call PlayOverworldMusic

.asm_80809
	call LoadLevelNameIfValid
	ld a, [w2d01d]
	cp $0e
	ld b, $01
	jr c, .asm_80821
	xor a
	ld hl, wTempPals1 palette 7 color 1
	ld bc, $6
	call WriteAToHL_BCTimes
	ld b, $00
.asm_80821
	ld a, b
	ld [w2d0e0], a
	farcall DrawCoinCount
	call Func_82012
	ld a, [w2d050]
	and a
	call z, Func_828b3
	xor a
	ld [w2d073], a
	ld [w2d055], a
	ld [w2d013], a
	ld a, LCDC_ON | LCDC_WIN9C00 | LCDC_WINON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x80851

Func_80851: ; 80851 (20:4851)
	call Func_80ab5
	call LoadOverworldCommonGfx
	call LoadOverworld1Gfx
	ld a, [w2d025]
	cp CUTSCENE_35
	call nz, LoadOverworldGlowGfx

	ld bc, BGMap_85bef
	ld d, BANK(BGMap_85bef)
	ld hl, BGMap_85d79
	ld e, BANK(BGMap_85d79)
	call LoadBGMapsToWRAM
;	fallthrough

Func_8086f: ; 8086f (20:486f)
	call Func_80b54

	ld a, [wMapSide] ; a gets overwritten
	call Func_81dce
	call WriteBGMapFromWRAM

	ld a, $04
	ldh [rSCY], a
	ld [wTempSCY], a
	xor a
	ldh [rSCX], a
	ld [wTempSCX], a
	ld a, [w2d018]
	ld [w2d015], a
	ld a, [w2d019]
	ld [w2d017], a
	ld a, [w2d029]
	ld [w2d028], a
	ld a, [wMapSide]
	ld [w2d016], a
	ld a, [w2d02a + 0]
	ld [w2d026 + 0], a
	ld a, [w2d02a + 1]
	ld [w2d026 + 1], a

	farcall Func_b4a37
	call Func_80bc9

	xor a
	ld hl, wTempPals1 palette 7 color 1
	ld bc, $6
	call WriteAToHL_BCTimes

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, $24
	ld a, [wLanguage]
	add b
	ld b, a
	ld c, $00
	ld hl, LevelNamesNorthJPGfx + (7 * $200)
	ld de, v1Tiles2 + $500
	call CopyFarBytes
	ld b, $24
	ld a, [wLanguage]
	add b
	ld b, a
	ld c, $00
	ld hl, LevelNamesNorthJPGfx + (7 * $200)
	ld de, v1Tiles2 + $600
	call CopyFarBytes
	xor a
	ldh [rVBK], a

	xor a
	ld [w2d0e0], a
	call Func_82012
	xor a
	ld [w2d073], a
	ld [w2d055], a
	ld [w2d013], a

	ld a, [wMapSide]
	and a
	jr nz, .no_window_display
	ld a, [w2d025]
	cp CUTSCENE_2F
	jr nz, .no_window_display
	ld a, LCDC_ON | LCDC_WIN9C00 | LCDC_WINON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
	jr .apply_lcd
.no_window_display
	ld a, LCDC_ON | LCDC_OBJ16 | LCDC_OBJON | LCDC_BGON
.apply_lcd
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret
; 0x8091e

Func_8091e: ; 8091e (20:491e)
	call Func_80ab5
	call LoadOverworld2Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80ae7
	jp Func_8086f
; 0x80930

Func_80930: ; 80930 (20:4930)
	ld a, [w2d025]
	cp CUTSCENE_57
	jr nz, .asm_8093c
	ld a, $01
	ld [w2d011], a
.asm_8093c
	call Func_80ab5
	call LoadOverworld5Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80af5
	jp Func_8086f
; 0x8094e

Func_8094e: ; 8094e (20:494e)
	ld a, CUTSCENE_1B
	call Func_819c6
	ld [w2d020], a
	ld a, [w2d020] ; unnecessary
	and a
	jr nz, .asm_80961
	ld a, $01
	ld [w2d011], a
.asm_80961
	call Func_80ab5
	call LoadOverworld6Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldGlowGfx
	call Func_80b1b
	jp Func_8086f
; 0x80973

LoadBGMapsToWRAM: ; 80973 (20:4973)
	push bc
	ld a, d
	ld [w2dfff], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, e
	ld [wTempBank], a
	ld bc, wBGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	pop hl

	ld a, [w2dfff]
	ld [wTempBank], a
	ld bc, w3d500
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x809b1

LoadOverworldCommonGfx: ; 809b1 (20:49b1)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(OverworldCommonGfx)
	ld [wTempBank], a
	ld hl, OverworldCommonGfx
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(OverworldNumbersGfx)
	ld [wTempBank], a
	ld hl, OverworldNumbersGfx
	ld bc, v1Tiles0 + $600
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	ret
; 0x809f6

LoadOverworld1Gfx: ; 809f6 (20:49f6)
	ld a, BANK(Overworld1Gfx)
	ld [wTempBank], a
	ld hl, Overworld1Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x80a12

LoadOverworld2Gfx: ; 80a12 (20:4a12)
	ld a, BANK(Overworld2Gfx)
	ld [wTempBank], a
	ld hl, Overworld2Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x80a2e

LoadOverworld5Gfx: ; 80a2e (20:4a2e)
	ld a, BANK(Overworld5Gfx)
	ld [wTempBank], a
	ld hl, Overworld5Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x80a4a

LoadOverworld6Gfx: ; 80a4a (20:4a4a)
	ld a, BANK(Overworld6Gfx)
	ld [wTempBank], a
	ld hl, Overworld6Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x80a66

LoadOverworldArrowsGfx: ; 80a66 (20:4a66)
	ld a, BANK(OverworldArrowsGfx)
	ld [wTempBank], a
	ld hl, OverworldArrowsGfx
	ld bc, v0Tiles1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x80a82

LoadOverworldGlowGfx: ; 80a82 (20:4a82)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a,BANK(OverworldGlowGfx)
	ld [wTempBank], a
	ld hl, OverworldGlowGfx
	ld bc, v1Tiles0 + $200
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	ret
; 0x80aa5

Func_80aa5: ; 80aa5 (20:4aa5)
	farcall Func_85475
	ret
; 0x80ab5

Func_80ab5: ; 80ab5 (20:4ab5)
	call Func_80ac8
	farcall Func_8540a
	ret
; 0x80ac8

Func_80ac8: ; 80ac8 (20:4ac8)
	xor a
	ld [w2dfff], a
	ld a, [w2d028]
	cp $01
	ret nz
	ld hl, w2d016
	ld a, [hli]
	ld c, [hl] ; w2d017
	ld hl, Data_80000
	call GetCthEntryFromAthTable
	ld a, [hl]
	cp $0e
	ret c
	ld a, TRUE
	ld [w2dfff], a
	ret
; 0x80ae7

Func_80ae7: ; 80ae7 (20:4ae7)
	ld bc, BGMap_85f07
	ld d, BANK(BGMap_85f07)
	ld hl, BGMap_860ff
	ld e, BANK(BGMap_860ff)
	call LoadBGMapsToWRAM
	ret
; 0x80af5

Func_80af5: ; 80af5 (20:4af5)
	ld bc, BGMap_86292
	ld d, BANK(BGMap_86292)
	ld hl, BGMap_86417
	ld e, BANK(BGMap_86417)
	call LoadBGMapsToWRAM
	ld a, CUTSCENE_19
	call Func_819c6
	ret z
	ld hl, Data_8561f
	farcall Func_854ee
	ret
; 0x80b1b

Func_80b1b: ; 80b1b (20:4b1b)
	ld bc, BGMap_86546
	ld d, BANK(BGMap_86546)
	ld hl, BGMap_86700
	ld e, BANK(BGMap_86700)
	call LoadBGMapsToWRAM
	ret
; 0x80b29

; clears w2d060 onwards
; seems like level-related stuff
Func_80b29: ; 80b29 (20:4b29)
	ld hl, w2d060
	ld bc, $7a0
	xor a
	call WriteAToHL_BCTimes
	ret
; 0x80b34

; copies from wBGMap2 to v0BGMap0
; and from wBGMap1 to v1BGMap0
WriteBGMapFromWRAM: ; 80b34 (20:4b34)
	ld hl, wBGMap2
	ld de, v0BGMap0
	ld bc, $260
	call CopyHLToDE_BC
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wBGMap1
	ld de, v1BGMap0
	ld bc, $260
	call CopyHLToDE_BC
	xor a
	ldh [rVBK], a
	ret
; 0x80b54

Func_80b54: ; 80b54 (20:4b54)
	ld a, $1e
	ld [w2d032], a
	ld a, $04
	ld [w2d035], a
	ld a, $24
	ld [w2d038], a
	ld [w2d03b], a
	ld a, $0e
	ld [w2d03e], a
	ld a, $14
	ld [w2d041], a

	xor a
	ld [w2d031], a
	ld [w2d030], a
	ld [w2d049], a
	ld [w2d033], a
	ld [w2d036], a
	ld [w2d039], a
	ld [w2d03c], a
	ld [w2d03f], a
	ld [w2d042], a
	ld [w2d034], a
	ld [w2d037], a
	ld [w2d03a], a
	ld [w2d03d], a
	ld [w2d040], a
	ld [w2d043], a

	ld a, $10
	ld [w2d046], a

	xor a
	ld [w2d044], a
	ld [w2d047], a
	ld [w2d048], a

	ld a, [wMapSide]
	cp MAP_WEST
	jr z, .asm_80bbd
	cp MAP_SOUTH
	jr z, .asm_80bc3
	cp MAP_EAST
	jr z, .asm_80bbd
	ret
.asm_80bbd
	ld a, $01
	ld [w2d030], a
	ret
.asm_80bc3
	ld a, $04
	ld [w2d03b], a
	ret
; 0x80bc9

Func_80bc9: ; 80bc9 (20:4bc9)
	farcall Func_1d8bf7
	ret
; 0x80bd9

Func_80bd9: ; 80bd9 (20:4bd9)
	ld hl, wBGMap1 tile $1c
	res 7, [hl]
	ld de, 30 tiles
	ld c, $04
.loop_outer
	ld hl, wBGMap1
	add hl, de
	ld b, $03
.loop_inner
	res 7, [hl]
	inc hl
	dec b
	jr nz, .loop_inner
	dec c
	ret z
	ld hl, $20
	add hl, de
	ld e, l
	ld d, h
	jr .loop_outer
; 0x80bf9

VBlank_80bf9: ; 80bf9 (20:4bf9)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, $02
	ldh [rSVBK], a
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a
	ld a, [w2d094]
	ldh [rWY], a
	ld a, [w2d095]
	add $07
	ldh [rWX], a

	ld b, BANK(Func_1d8c2c)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_1d8c2c
	pop af
	bankswitch

	ld hl, w2d0d0
	ld a, [hl]
	and a
	jr z, .asm_80c5b
	ld c, a
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
.asm_80c48
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
	jr nz, .asm_80c48

.asm_80c5b
	ld a, [w2d079]
	ld b, a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld hl, wHDMA
	ld a, [hl]
	and a
	jr z, .asm_80c84
	ld b, [hl]
	xor a
	ld [hli], a
	ld a, b
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

.asm_80c84
	ld hl, w2d0b5
	ld a, [hl]
	and a
	jr z, .asm_80ca2
	ld b, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	xor a
	ld [hli], a
	ld a, b
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
.asm_80ca2
	pop af
	bankswitch
	xor a
	ldh [rVBK], a

	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x80cb1

VBlank_80cb1: ; 80cb1 (20:4cb1)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, $02
	ldh [rSVBK], a
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
	ldh [rSCX], a

	ld a, [w2d060]
	and a
	jr z, .asm_80cff
	ld c, LOW(rHDMA1)
	ld a, HIGH(wBGMap2)
	ld [$ff00+c], a
	inc c
	xor a ; LOW(wBGMap2)
	ld [$ff00+c], a
	inc c
	ld a, $18
	ld [$ff00+c], a
	inc c
	xor a
	ld [$ff00+c], a
	inc c
	ld a, $1d
	ld [$ff00+c], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld c, LOW(rHDMA1)
	ld a, HIGH(wBGMap1)
	ld [$ff00+c], a
	inc c
	xor a ; LOW(wBGMap1)
	ld [$ff00+c], a
	inc c
	ld a, $18
	ld [$ff00+c], a
	inc c
	xor a
	ld [$ff00+c], a
	inc c
	ld a, $1d
	ld [$ff00+c], a
	xor a
	ld [w2d060], a

.asm_80cff
	ld a, [w2d079]
	and a
	jr z, .asm_80d1b
	ld b, a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_3c03
	pop af
	bankswitch

.asm_80d1b
	xor a
	ldh [rVBK], a
	ld b, BANK(Func_1d8c2c)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	call Func_1d8c2c
	pop af
	bankswitch

	ld b, BANK(Func_854cc)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [w2d0d0]
	and a
	call nz, Func_854cc
	ld a, [w2d0d6]
	and a
	call nz, Func_854c7
	pop af
	bankswitch

	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x80d5c

	INCROM $80d5c, $80d6c

Func_80d6c: ; 80d6c (20:4d6c)
	farcall Func_9c021
	ret
; 0x80d7c

	INCROM $80d7c, $80fc8

LoadLevelNameIfValid: ; 80fc8 (20:4fc8)
	ld a, [w2d012]
	ld b, a
	ld a, [w2d01d]
	ld d, a
	cp $08
	ret nc
	jp LoadLevelName
; 0x80fd6

	INCROM $80fd6, $810f0

Func_810f0: ; 810f0 (20:50f0)
	add a ; *2
	ld c, a
	ld a, [wMapSide]
	ld hl, Data_80136
	call GetCthEntryFromAthTable
	ret
; 0x810fc

	INCROM $810fc, $81278

; input:
; - b = ???
; output:
; - d = ???
; - c = ???
Func_81278: ; 81278 (20:5278)
; loop until a larger value than b is found
	ld hl, Data_812ac
	ld c, $ff
.loop
	ld e, [hl]
	inc hl
	inc c
	ld a, [hl]
	dec a
	cp b
	jr c, .loop
; next calculate the difference
; from the previous entry in list
	ld a, b
	sub e
	ld d, a ; difference
	ld b, c ; list index
	ret
; 0x8128a

	INCROM $8128a, $812ac

Data_812ac: ; 812ac (20:52ac)
	db LEVEL_THE_TEMPLE         ; MAP_NORTH
	db LEVEL_DESERT_RUINS       ; MAP_WEST
	db LEVEL_THE_GRASSLANDS     ; MAP_SOUTH
	db LEVEL_THE_STAGNANT_SWAMP ; MAP_EAST
; 0x812b0

	INCROM $812b0, $812c0

Func_812c0: ; 812c0 (20:52c0)
	ld a, [w2d01f]
	and a
	ret z
	ld a, [wOWLevel]
	ld [w2dffd], a
	ld a, [wMapSide]
	ld c, a
	ld b, $00
	ld hl, Data_812ac
	add hl, bc
	ld a, [hl]
	ld [wOWLevel], a

	ld a, [w2d012]
	ld b, $06
	dec a
	jr z, .asm_812ed
	ld b, $06
	dec a
	jr z, .asm_812ed
	ld b, $07
	dec a
	jr z, .asm_812ed
	ld b, $07
.asm_812ed
	ld a, b
	ld [w2dfff], a
	xor a
	ld [w2dffe], a
	ld a, [wOWLevel]
	and a
	jr z, .asm_81314
.asm_812fb
	farcall Func_4a63
	ld a, [wKeys]
	and $f0
	xor $f0
	call nz, Func_8132a
.asm_81314
	ld a, [wOWLevel]
	inc a
	ld [wOWLevel], a
	ld hl, w2dffe
	inc [hl]
	ld a, [hli]
	cp [hl]
	jr nz, .asm_812fb
	ld a, [w2dffd]
	ld [wOWLevel], a
	ret
; 0x8132a

Func_8132a: ; 8132a (20:532a)
	ld a, [w2dffe]
	call Func_810f0
	ld a, [hli]
	ld [w2d06b], a
	ld a, [hl]
	ld [w2d06c], a
	ld hl, w2d06b
	call Func_3ad7
	ld [hl], $7b
	dec h
	dec h
	dec h
	ld [hl], $0d
	ret
; 0x81346

	INCROM $81346, $8178b

Func_8178b: ; 8178b (20:578b)
	ld a, TREASURE_DAY_OR_NIGHT_SPELL
	call IsTreasureCollected
	ret z
	ld a, [wMapSide]
	cp MAP_EAST
	jr nz, .asm_8179d
	ld a, [w2d020]
	and a
	ret z
.asm_8179d
	ld hl, w2d054
	set 0, [hl]
	ret
; 0x817a3

Func_817a3: ; 817a3 (20:57a3)
	ld a, [w2d00d]
	cp $f0
	ret z
	and a
	ret z
	ld hl, w2d054
	set 1, [hl]
	ret
; 0x817b1

	INCROM $817b1, $817d7

Func_817d7: ; 817d7 (20:57d7)
	call Func_817e3
	call Func_81818
	ld hl, w2d054
	or [hl]
	ld [hl], a
	ret
; 0x817e3

Func_817e3: ; 817e3 (20:57e3)
	ld a, CUTSCENE_03
	call Func_819ac
	rlca
	rlca
	rlca
	ld hl, w2d07a
	or [hl]
	ld [hl], a
	ld a, CUTSCENE_07
	call Func_819ac
	rlca
	rlca
	ld hl, w2d07a
	or [hl]
	ld [hl], a
	ld a, CUTSCENE_0C
	call Func_819ac
	rlca
	ld hl, w2d07a
	or [hl]
	ld [hl], a
	ld a, CUTSCENE_37
	call Func_819ac
	ld hl, w2d07a
	or [hl]
	ld [hl], a
	and $01
	swap a
	or [hl]
	ld [hl], a
	ret
; 0x81818

Func_81818: ; 81818 (20:5818)
	ld a, [w2d07a]
	ld b, a
	ld a, [wMapSide]
.loop
	sub 1
	jr c, .done
	sla b
	jr .loop
.done
	ld a, b
	and $18
	ret
; 0x8182b

Func_8182b: ; 8182b (20:582b)
	ld a, [w2d050]
	and a
	ret z
	ld a, [w2d053]
	and $18
	ret z
	ld c, a
	call Func_81818
	and c
	ret nz
	ld hl, w2d053
	bit 3, [hl]
	jr nz, .asm_81848
	res 4, [hl]
	set 3, [hl]
	ret
.asm_81848
	res 3, [hl]
	set 4, [hl]
	ret
; 0x8184d

Func_8184d: ; 8184d (20:584d)
	ld a, [w2d00e]
	call IsTreasureCollected
	ld hl, w2d00e
	jr nz, .collected
	ld a, [wcee3]
	and a
	ret z
	cp $f0
	ret z
	cp $f1
	ret z
	cp $f2
	ret z
	cp $f3
	ret z
	inc a
	jr z, .asm_8186d
	dec a
.asm_8186d
	cp [hl]
	ret nz
.collected

	ld b, [hl]
	call GetCutsceneWithTreasure
; loop until a treasure
; that hasn't been collected
; is found in the table
.next_treasure
	ld a, [hl]
	cp TREASURE_INVALID
	jr z, .check_end
	push hl
	call IsTreasureCollected
	pop hl
	jr z, .not_collected
.check_end
	ld a, [hli]
	cp $ed
	jr z, .all_collected
	jr .next_treasure
.not_collected
	ld a, [hl]
	ld [w2d00e], a
	ret
.all_collected
	ld a, $ed
	ld [w2d00e], a
	ret
; 0x81891

; input:
; - b = TREASURE_* constant
; output:
; - c = CUTSCENE_* constant
GetCutsceneWithTreasure: ; 81891 (20:5891)
	ld c, 0
	ld hl, CutsceneTreasures
.loop
	ld a, [hli]
	cp $ed
	jr z, .not_found
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	inc c
	jr .loop
.found
	ret
.not_found
	ld c, 0
	ret
; 0x818ad

Func_818ad: ; 818ad (20:58ad)
	farcall UpdateCommonOWAnimations
	farcall Func_b791e
	ld a, [w2d050]
	and a
	jr z, .asm_818d9
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_81931
.asm_818d9
	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable
; 0x818e1

	INCROM $818e1, $81931

Func_81931: ; 81931 (20:5931)
	stop_sfx
	ld a, [w2d025]
	ld b, a
	xor a
	ld [w2d01b], a
	ld [w2d025], a
	ld [w2d028], a
	ld [w2d029], a
	ld a, CUTSCENE_5A
	cp b
	jr z, .asm_81957
	ld hl, wSubState
	inc [hl]
	call Func_803e6
	ret
.asm_81957
	ld a, SST_OVERWORLD_23
	ld [wSubState], a
	ret
; 0x8195d

	INCROM $8195d, $8197e

Func_8197e: ; 8197e (20:597e)
	ld a, [w2d01b]
	ld b, a
	xor a
	ld c, a ; CUTSCENE_00
	ld [w2d025], a

	ld hl, CutsceneTreasures
.loop
	ld a, [hli]
	cp $ed
	jr z, .asm_819a7
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	ld a, [hli]
	cp b
	jr z, .found
	inc c
	jr .loop

.found
	ld a, c
	ld [w2d025], a
	call Func_819ac
	jr z, .asm_819a7
	ret

.asm_819a7
	xor a ; CUTSCENE_00
	ld [w2d025], a
	ret
; 0x819ac

; input:
; - a = CUTSCENE_* constant
Func_819ac: ; 819ac (20:59ac)
	call LoadCutsceneTreasures
	ld c, TRUE
	ld a, [w2dffd]
	call Func_819cb
	ret c
	ld a, [w2dffe]
	call Func_819cb
	ret c
	ld a, [w2dfff]
	call Func_819cb
	ret
; 0x819c6

; input:
; - a = CUTSCENE_* constant
Func_819c6: ; 819c6 (20:59c6)
	call Func_819ac
	and c
	ret
; 0x819cb

; returns carry if treasure in a
; is different from w2d01b
; and has been collected
Func_819cb: ; 819cb (20:59cb)
	cp TREASURE_INVALID
	jr z, .no_carry
	ld hl, w2d01b
	cp [hl]
	jr z, .equal
	call IsTreasureCollected
	jr nz, .no_carry
	xor a
	scf
	ret
.equal
	ld c, FALSE
.no_carry
	ld a, $01
	and a
	ret
; 0x819e3

; input:
; - a = CUTSCENE_* constant
LoadCutsceneTreasures: ; 819e3 (20:59e3)
	ld c, a
	add a
	add c ; *3
	ld e, a
	ld d, $00
	rl d
	ld hl, CutsceneTreasures
	add hl, de
	ld de, w2dfff
	ld a, [hli]
	ld [de], a ; w2dfff
	ld a, [hli]
	dec e
	ld [de], a ; w2dffe
	ld a, [hl]
	dec e
	ld [de], a ; w2dffd
	ret
; 0x819fb

CutsceneTreasures: ; 819fb (20:59fb)
; CUTSCENE_00
	db TREASURE_INVALID
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_01
	db TREASURE_NONE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_02
	db TREASURE_AXE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_03
	db TREASURE_BLUE_TABLET
	db TREASURE_GREEN_TABLET
	db TREASURE_INVALID

; CUTSCENE_04
	db TREASURE_TOP_HALF_OF_SCROLL
	db TREASURE_BOTTOM_HALF_OF_SCROLL
	db TREASURE_INVALID

; CUTSCENE_05
	db TREASURE_LEAD_OVERALLS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_06
	db TREASURE_JAR
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_07
	db TREASURE_GEAR_1
	db TREASURE_GEAR_2
	db TREASURE_INVALID

; CUTSCENE_08
	db TREASURE_YELLOW_MUSIC_BOX
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_09
	db TREASURE_POUCH
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_0A
	db TREASURE_SKULL_RING_RED
	db TREASURE_SKULL_RING_BLUE
	db TREASURE_INVALID

; CUTSCENE_0B
	db TREASURE_SWIMMING_FLIPPERS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_0C
	db TREASURE_ORNAMENTAL_FAN
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_0D
	db TREASURE_FLUTE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_0E
	db TREASURE_BLUE_BOOK
	db TREASURE_TRIDENT
	db TREASURE_INVALID

; CUTSCENE_0F
	db TREASURE_HEAD_SMASH_HELMET
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_10
	db TREASURE_BLUE_MUSIC_BOX
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_11
	db TREASURE_YELLOW_BOOK
	db TREASURE_SKY_KEY
	db TREASURE_INVALID

; CUTSCENE_12
	db TREASURE_GRAB_GLOVE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_13
	db TREASURE_FOOT_OF_STONE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_14
	db TREASURE_TUSK_BLUE
	db TREASURE_TUSK_RED
	db TREASURE_GREEN_FLOWER

; CUTSCENE_15
	db TREASURE_RIGHT_GLASS_EYE
	db TREASURE_LEFT_GLASS_EYE
	db TREASURE_INVALID

; CUTSCENE_16
	db TREASURE_SUPER_SMASH
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_17
	db TREASURE_GREEN_MUSIC_BOX
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_18
	db TREASURE_SCEPTER
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_19
	db TREASURE_LANTERN
	db TREASURE_MAGICAL_FLAME
	db TREASURE_INVALID

; CUTSCENE_1A
	db TREASURE_SUPER_JUMP_SLAM_OVERALLS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_1B
	db TREASURE_SUN_MEDALLION_TOP
	db TREASURE_SUN_MEDALLION_BOTTOM
	db TREASURE_INVALID

; CUTSCENE_1C
	db TREASURE_HIGH_JUMP_BOOTS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_1D
	db TREASURE_RED_MUSIC_BOX
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_1E
	db TREASURE_EXPLOSIVE_PLUNGER_BOX
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_1F
	db TREASURE_MAGIC_SEEDS
	db TREASURE_EYE_OF_THE_STORM
	db TREASURE_INVALID

; CUTSCENE_20
	db TREASURE_PRINCE_FROGS_GLOVE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_21
	db TREASURE_STATUE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_22
	db TREASURE_TREASURE_MAP
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_23
	db TREASURE_SUPER_GRAB_GLOVES
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_24
	db TREASURE_GOLD_MAGIC
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_25
	db TREASURE_GOLD_MUSIC_BOX
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_26
	db TREASURE_CRAYON_BLUE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_27
	db TREASURE_TRUCK_WHEEL
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_28
	db TREASURE_BLUE_GEM
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_29
	db TREASURE_CRAYON_CYAN
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_2A
	db TREASURE_GOBLET
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_2B
	db TREASURE_CROWN
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_2C
	db TREASURE_CRAYON_PINK
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_2D
	db TREASURE_TEAPOT
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_2E
	db TREASURE_POCKET_PET
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_2F
	db TREASURE_MAGNIFYING_GLASS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_30
	db TREASURE_AIR_PUMP
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_31
	db TREASURE_ROCKET
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_32
	db TREASURE_CRAYON_YELLOW
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_33
	db TREASURE_INVALID
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_34
	db TREASURE_SABER
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_35
	db TREASURE_DAY_OR_NIGHT_SPELL
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_36
	db TREASURE_UFO
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_37
	db TREASURE_TORCH
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_38
	db TREASURE_WARP_COMPACT
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_39
	db TREASURE_MYSTERY_HANDLE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_3A
	db TREASURE_WARP_REMOVAL_APPARATUS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_3B
	db TREASURE_CRAYON_BROWN
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_3C
	db TREASURE_DEMONS_BLOOD
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_3D
	db TREASURE_KEY_CARD_RED
	db TREASURE_KEY_CARD_BLUE
	db TREASURE_INVALID

; CUTSCENE_3E
	db TREASURE_HEART_CREST
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_3F
	db TREASURE_MINICAR
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_40
	db TREASURE_LOCOMOTIVE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_41
	db TREASURE_TELEPHONE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_42
	db TREASURE_CRAYON_RED
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_43
	db TREASURE_ELECTRIC_FAN_PROPELLER
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_44
	db TREASURE_SAPLING_OF_GROWTH
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_45
	db TREASURE_GREEN_GEM
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_46
	db TREASURE_INVALID
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_47
	db TREASURE_INVALID
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_48
	db TREASURE_FIGHTER_MANNEQUIN
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_49
	db TREASURE_GOLDEN_LEFT_EYE
	db TREASURE_GOLDEN_RIGHT_EYE
	db TREASURE_INVALID

; CUTSCENE_4A
	db TREASURE_MAGIC_WAND
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_4B
	db TREASURE_CRAYON_GREEN
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_4C
	db TREASURE_FIRE_DRENCHER
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_4D
	db TREASURE_DIAMONDS_CREST
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_4E
	db TREASURE_CASTLE_BRICK
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_4F
	db TREASURE_RUST_SPRAY
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_50
	db TREASURE_SPADES_CREST
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_51
	db TREASURE_RED_CHEMICAL
	db TREASURE_BLUE_CHEMICAL
	db TREASURE_INVALID

; CUTSCENE_52
	db TREASURE_RED_GEM
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_53
	db TREASURE_CLUBS_CREST
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_54
	db TREASURE_SCISSORS
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_55
	db TREASURE_JACKHAMMER
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_56
	db TREASURE_NIGHT_VISION_SCOPE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_57
	db TREASURE_FULL_MOON_GONG
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_58
	db TREASURE_PICK_AXE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_59
	db TREASURE_EARTHEN_FIGURE
	db TREASURE_INVALID
	db TREASURE_INVALID

; CUTSCENE_5A
	db TREASURE_INVALID
	db TREASURE_INVALID
	db TREASURE_INVALID

	db $ed
; 0x81b0d

; input:
; - a = CUTSCENE_* constant
Func_81b0d: ; 81b0d (20:5b0d)
	ld hl, Data_81b2b
	call GetPointerFromTableHL
;	fallthrough

Func_81b13: ; 81b13 (20:5b13)
	ld a, [hli]
	ld [w2d028], a
	cp $80
	ret z ; finished
	ld a, [hli]
	ld [w2d016], a
	ld a, [hli]
	ld [w2d017], a
	ld a, l
	ld [w2d026 + 0], a
	ld a, h
	ld [w2d026 + 1], a
	ret
; 0x81b2b

Data_81b2b: ; 81b2b (20:5b2b)
	dw Data_81be1 ; CUTSCENE_00
	dw Data_81be2 ; CUTSCENE_01
	dw Data_81be6 ; CUTSCENE_02
	dw Data_81bf0 ; CUTSCENE_03
	dw Data_81bfa ; CUTSCENE_04
	dw Data_81c01 ; CUTSCENE_05
	dw Data_81c08 ; CUTSCENE_06
	dw Data_81c12 ; CUTSCENE_07
	dw Data_81c1c ; CUTSCENE_08
	dw Data_81c23 ; CUTSCENE_09
	dw Data_81c30 ; CUTSCENE_0A
	dw Data_81c37 ; CUTSCENE_0B
	dw Data_81c3e ; CUTSCENE_0C
	dw Data_81c48 ; CUTSCENE_0D
	dw Data_81c52 ; CUTSCENE_0E
	dw Data_81c59 ; CUTSCENE_0F
	dw Data_81c60 ; CUTSCENE_10
	dw Data_81c6a ; CUTSCENE_11
	dw Data_81c71 ; CUTSCENE_12
	dw Data_81c7b ; CUTSCENE_13
	dw Data_81c85 ; CUTSCENE_14
	dw Data_81c92 ; CUTSCENE_15
	dw Data_81c96 ; CUTSCENE_16
	dw Data_81ca3 ; CUTSCENE_17
	dw Data_81caa ; CUTSCENE_18
	dw Data_81cb4 ; CUTSCENE_19
	dw Data_81cbb ; CUTSCENE_1A
	dw Data_81cc8 ; CUTSCENE_1B
	dw Data_81cd5 ; CUTSCENE_1C
	dw Data_81cdf ; CUTSCENE_1D
	dw Data_81ce6 ; CUTSCENE_1E
	dw Data_81ced ; CUTSCENE_1F
	dw Data_81cf1 ; CUTSCENE_20
	dw Data_81cfb ; CUTSCENE_21
	dw Data_81d02 ; CUTSCENE_22
	dw Data_81d06 ; CUTSCENE_23
	dw Data_81d10 ; CUTSCENE_24
	dw Data_81d14 ; CUTSCENE_25
	dw Data_81d1b ; CUTSCENE_26
	dw Data_81d1f ; CUTSCENE_27
	dw Data_81d23 ; CUTSCENE_28
	dw Data_81d24 ; CUTSCENE_29
	dw Data_81d28 ; CUTSCENE_2A
	dw Data_81d29 ; CUTSCENE_2B
	dw Data_81d2a ; CUTSCENE_2C
	dw Data_81d2e ; CUTSCENE_2D
	dw Data_81d2f ; CUTSCENE_2E
	dw Data_81d30 ; CUTSCENE_2F
	dw Data_81d34 ; CUTSCENE_30
	dw Data_81d3b ; CUTSCENE_31
	dw Data_81d3c ; CUTSCENE_32
	dw Data_81d40 ; CUTSCENE_33
	dw Data_81d41 ; CUTSCENE_34
	dw Data_81d42 ; CUTSCENE_35
	dw Data_81d46 ; CUTSCENE_36
	dw Data_81d47 ; CUTSCENE_37
	dw Data_81d54 ; CUTSCENE_38
	dw Data_81d5b ; CUTSCENE_39
	dw Data_81d5f ; CUTSCENE_3A
	dw Data_81d63 ; CUTSCENE_3B
	dw Data_81d67 ; CUTSCENE_3C
	dw Data_81d6b ; CUTSCENE_3D
	dw Data_81d6f ; CUTSCENE_3E
	dw Data_81d70 ; CUTSCENE_3F
	dw Data_81d71 ; CUTSCENE_40
	dw Data_81d72 ; CUTSCENE_41
	dw Data_81d73 ; CUTSCENE_42
	dw Data_81d77 ; CUTSCENE_43
	dw Data_81d7b ; CUTSCENE_44
	dw Data_81d82 ; CUTSCENE_45
	dw Data_81d83 ; CUTSCENE_46
	dw Data_81d84 ; CUTSCENE_47
	dw Data_81d85 ; CUTSCENE_48
	dw Data_81d86 ; CUTSCENE_49
	dw Data_81d8a ; CUTSCENE_4A
	dw Data_81d8e ; CUTSCENE_4B
	dw Data_81d92 ; CUTSCENE_4C
	dw Data_81d99 ; CUTSCENE_4D
	dw Data_81d9a ; CUTSCENE_4E
	dw Data_81d9e ; CUTSCENE_4F
	dw Data_81da8 ; CUTSCENE_50
	dw Data_81da9 ; CUTSCENE_51
	dw Data_81db0 ; CUTSCENE_52
	dw Data_81db1 ; CUTSCENE_53
	dw Data_81db2 ; CUTSCENE_54
	dw Data_81db6 ; CUTSCENE_55
	dw Data_81dba ; CUTSCENE_56
	dw Data_81dbe ; CUTSCENE_57
	dw Data_81dc5 ; CUTSCENE_58
	dw Data_81dc9 ; CUTSCENE_59
	dw Data_81dca ; CUTSCENE_5A
; 0x81be1

Data_81be1: ; 81be1 (21:5be1)
	db $80

Data_81be2: ; 81be2 (21:5be2)
	db $01, MAP_NORTH, $01
	db $80

Data_81be6: ; 81be6 (21:5be6)
	db $02, MAP_NORTH, $01
	db $01, MAP_NORTH, $02
	db $01, MAP_NORTH, $03
	db $80

Data_81bf0: ; 81bf0 (21:5bf0)
	db $02, MAP_NORTH, $02
	db $01, MAP_NORTH, $07
	db $01, MAP_WEST, $07
	db $80

Data_81bfa: ; 81bfa (21:5bfa)
	db $02, MAP_WEST, $02
	db $01, MAP_WEST, $01
	db $80

Data_81c01: ; 81c01 (21:5c01)
	db $03, MAP_NORTH, $01
	db $03, MAP_NORTH, $03
	db $80

Data_81c08: ; 81c08 (21:5c08)
	db $02, MAP_WEST, $01
	db $01, MAP_WEST, $02
	db $01, MAP_WEST, $03
	db $80

Data_81c12: ; 81c12 (21:5c12)
	db $02, MAP_WEST, $03
	db $01, MAP_WEST, $06
	db $01, MAP_SOUTH, $07
	db $80

Data_81c1c: ; 81c1c (21:5c1c)
	db $02, MAP_SOUTH, $03
	db $01, MAP_SOUTH, $01
	db $80

Data_81c23: ; 81c23 (21:5c23)
	db $02, MAP_SOUTH, $01
	db $02, MAP_NORTH, $04
	db $02, MAP_WEST, $04
	db $02, MAP_SOUTH, $02
	db $80

Data_81c30: ; 81c30 (21:5c30)
	db $02, MAP_SOUTH, $05
	db $01, MAP_SOUTH, $02
	db $80

Data_81c37: ; 81c37 (21:5c37)
	db $03, MAP_WEST, $03
	db $03, MAP_SOUTH, $02
	db $80

Data_81c3e: ; 81c3e (21:5c3e)
	db $02, MAP_SOUTH, $06
	db $01, MAP_SOUTH, $06
	db $01, MAP_EAST, $08
	db $80

Data_81c48: ; 81c48 (21:5c48)
	db $02, MAP_SOUTH, $07
	db $02, MAP_WEST, $05
	db $02, MAP_NORTH, $05
	db $80

Data_81c52: ; 81c52 (21:5c52)
	db $02, MAP_EAST, $01
	db $01, MAP_EAST, $01
	db $80

Data_81c59: ; 81c59 (21:5c59)
	db $03, MAP_WEST, $04
	db $03, MAP_WEST, $01
	db $80

Data_81c60: ; 81c60 (21:5c60)
	db $02, MAP_NORTH, $07
	db $01, MAP_NORTH, $04
	db $01, MAP_NORTH, $05
	db $80

Data_81c6a: ; 81c6a (21:5c6a)
	db $02, MAP_SOUTH, $04
	db $01, MAP_SOUTH, $03
	db $80

Data_81c71: ; 81c71 (21:5c71)
	db $03, MAP_NORTH, $05
	db $03, MAP_EAST, $02
	db $03, MAP_SOUTH, $02
	db $80

Data_81c7b: ; 81c7b (21:5c7b)
	db $02, MAP_WEST, $06
	db $02, MAP_SOUTH, $08
	db $02, MAP_EAST, $02
	db $80

Data_81c85: ; 81c85 (21:5c85)
	db $02, MAP_WEST, $07
	db $02, MAP_EAST, $05
	db $01, MAP_WEST, $04
	db $01, MAP_EAST, $03
	db $80

Data_81c92: ; 81c92 (21:5c92)
	db $03, MAP_SOUTH, $03
	db $80

Data_81c96: ; 81c96 (21:5c96)
	db $02, MAP_NORTH, $03
	db $03, MAP_NORTH, $04
	db $03, MAP_EAST, $04
	db $01, MAP_NORTH, $06
	db $80

Data_81ca3: ; 81ca3 (21:5ca3)
	db $02, MAP_SOUTH, $09
	db $01, MAP_SOUTH, $04
	db $80

Data_81caa: ; 81caa (21:5caa)
	db $03, MAP_SOUTH, $02
	db $03, MAP_EAST, $02
	db $03, MAP_NORTH, $06
	db $80

Data_81cb4: ; 81cb4 (21:5cb4)
	db $02, MAP_EAST, $03
	db $01, MAP_EAST, $02
	db $80

Data_81cbb: ; 81cbb (21:5cbb)
	db $03, MAP_NORTH, $06
	db $03, MAP_WEST, $06
	db $03, MAP_WEST, $01
	db $03, MAP_NORTH, $02
	db $80

Data_81cc8: ; 81cc8 (21:5cc8)
	db $02, MAP_EAST, $09
	db $03, MAP_EAST, $04
	db $03, MAP_EAST, $02
	db $03, MAP_EAST, $03
	db $80

Data_81cd5: ; 81cd5 (21:5cd5)
	db $03, MAP_SOUTH, $01
	db $03, MAP_EAST, $01
	db $03, MAP_SOUTH, $05
	db $80

Data_81cdf: ; 81cdf (21:5cdf)
	db $02, MAP_WEST, $08
	db $01, MAP_WEST, $05
	db $80

Data_81ce6: ; 81ce6 (21:5ce6)
	db $02, MAP_SOUTH, $0a
	db $02, MAP_EAST, $04
	db $80

Data_81ced: ; 81ced (21:5ced)
	db $02, MAP_NORTH, $06
	db $80

Data_81cf1: ; 81cf1 (21:5cf1)
	db $03, MAP_NORTH, $04
	db $03, MAP_SOUTH, $04
	db $03, MAP_WEST, $05
	db $80

Data_81cfb: ; 81cfb (21:5cfb)
	db $03, MAP_SOUTH, $03
	db $03, MAP_NORTH, $05
	db $80

Data_81d02: ; 81d02 (21:5d02)
	db $01, MAP_EAST, $06
	db $80

Data_81d06: ; 81d06 (21:5d06)
	db $03, MAP_WEST, $04
	db $03, MAP_EAST, $03
	db $03, MAP_EAST, $07
	db $80

Data_81d10: ; 81d10 (21:5d10)
	db $03, MAP_NORTH, $01
	db $80

Data_81d14: ; 81d14 (21:5d14)
	db $02, MAP_NORTH, $08
	db $03, MAP_NORTH, $00
	db $80

Data_81d1b: ; 81d1b (21:5d1b)
	db $04, MAP_NORTH, $09
	db $80

Data_81d1f: ; 81d1f (21:5d1f)
	db $03, MAP_WEST, $02
	db $80

Data_81d23: ; 81d23 (21:5d23)
	db $80

Data_81d24: ; 81d24 (21:5d24)
	db $04, MAP_NORTH, $0a
	db $80

Data_81d28: ; 81d28 (21:5d28)
	db $80

Data_81d29: ; 81d29 (21:5d29)
	db $80

Data_81d2a: ; 81d2a (21:5d2a)
	db $04, MAP_NORTH, $0b
	db $80

Data_81d2e: ; 81d2e (21:5d2e)
	db $80

Data_81d2f: ; 81d2f (21:5d2f)
	db $80

Data_81d30: ; 81d30 (21:5d30)
	db $04, MAP_NORTH, $10
	db $80

Data_81d34: ; 81d34 (21:5d34)
	db $03, MAP_NORTH, $04
	db $03, MAP_WEST, $03
	db $80

Data_81d3b: ; 81d3b (21:5d3b)
	db $80

Data_81d3c: ; 81d3c (21:5d3c)
	db $04, MAP_NORTH, $0c
	db $80

Data_81d40: ; 81d40 (21:5d40)
	db $80

Data_81d41: ; 81d41 (21:5d41)
	db $80

Data_81d42: ; 81d42 (21:5d42)
	db $04, MAP_NORTH, $11
	db $80

Data_81d46: ; 81d46 (21:5d46)
	db $80

Data_81d47: ; 81d47 (21:5d47)
	db $02, MAP_EAST, $06
	db $01, MAP_EAST, $05
	db $01, MAP_EAST, $07
	db $01, MAP_NORTH, $08
	db $80

Data_81d54: ; 81d54 (21:5d54)
	db $02, MAP_EAST, $07
	db $01, MAP_EAST, $04
	db $80

Data_81d5b: ; 81d5b (21:5d5b)
	db $02, MAP_EAST, $08
	db $80

Data_81d5f: ; 81d5f (21:5d5f)
	db $03, MAP_EAST, $05
	db $80

Data_81d63: ; 81d63 (21:5d63)
	db $04, MAP_NORTH, $0d
	db $80

Data_81d67: ; 81d67 (21:5d67)
	db $03, MAP_EAST, $07
	db $80

Data_81d6b: ; 81d6b (21:5d6b)
	db $03, MAP_EAST, $05
	db $80

Data_81d6f: ; 81d6f (21:5d6f)
	db $80

Data_81d70: ; 81d70 (21:5d70)
	db $80

Data_81d71: ; 81d71 (21:5d71)
	db $80

Data_81d72: ; 81d72 (21:5d72)
	db $80

Data_81d73: ; 81d73 (21:5d73)
	db $04, MAP_NORTH, $0e
	db $80

Data_81d77: ; 81d77 (21:5d77)
	db $03, MAP_WEST, $04
	db $80

Data_81d7b: ; 81d7b (21:5d7b)
	db $03, MAP_NORTH, $05
	db $03, MAP_WEST, $05
	db $80

Data_81d82: ; 81d82 (21:5d82)
	db $80

Data_81d83: ; 81d83 (21:5d83)
	db $80

Data_81d84: ; 81d84 (21:5d84)
	db $80

Data_81d85: ; 81d85 (21:5d85)
	db $80

Data_81d86: ; 81d86 (21:5d86)
	db $03, MAP_SOUTH, $03
	db $80

Data_81d8a: ; 81d8a (21:5d8a)
	db $01, MAP_SOUTH, $05
	db $80

Data_81d8e: ; 81d8e (21:5d8e)
	db $04, MAP_NORTH, $0f
	db $80

Data_81d92: ; 81d92 (21:5d92)
	db $03, MAP_WEST, $06
	db $03, MAP_EAST, $06
	db $80

Data_81d99: ; 81d99 (21:5d99)
	db $80

Data_81d9a: ; 81d9a (21:5d9a)
	db $03, MAP_EAST, $03
	db $80

Data_81d9e: ; 81d9e (21:5d9e)
	db $03, MAP_WEST, $06
	db $03, MAP_SOUTH, $04
	db $03, MAP_SOUTH, $05
	db $80

Data_81da8: ; 81da8 (21:5da8)
	db $80

Data_81da9: ; 81da9 (21:5da9)
	db $03, MAP_NORTH, $03
	db $03, MAP_WEST, $05
	db $80

Data_81db0: ; 81db0 (21:5db0)
	db $80

Data_81db1: ; 81db1 (21:5db1)
	db $80

Data_81db2: ; 81db2 (21:5db2)
	db $03, MAP_SOUTH, $06
	db $80

Data_81db6: ; 81db6 (21:5db6)
	db $03, MAP_EAST, $06
	db $80

Data_81dba: ; 81dba (21:5dba)
	db $03, MAP_NORTH, $06
	db $80

Data_81dbe: ; 81dbe (21:5dbe)
	db $02, MAP_SOUTH, $0b
	db $03, MAP_SOUTH, $06
	db $80

Data_81dc5: ; 81dc5 (21:5dc5)
	db $03, MAP_EAST, $06
	db $80

Data_81dc9: ; 81dc9 (21:5dc9)
	db $80

Data_81dca: ; 81dca (21:5dca)
	db $02, MAP_NORTH, $12
	db $80

; 0x81dce

Func_81dce: ; 81dce (20:5dce)
	ld a, CUTSCENE_01
	ld [wCutscene], a
	ld a, [w2d01b]
	ld c, a
	dec c
	and a
	jr z, .asm_81de1
	cp $ff
	jr nz, .asm_81de5
	ld c, $00
.asm_81de1
	ld a, c
	ld [w2d01b], a

.asm_81de5
	xor a
	ld [w2d078], a
	ld a, [wCutscene]
	call Func_819ac
	ld [w2d065], a
	and a
	jr z, .asm_81dfd
	dec c
	jr z, .asm_81dfd
	ld a, $80
	ld [w2d065], a
.asm_81dfd
	call Func_81e16
	ld a, [wCutscene]
	inc a
	cp NUM_CUTSCENES + 1
	jr z, .asm_81e0d
	ld [wCutscene], a
	jr .asm_81de5
.asm_81e0d
	ld a, [w2d01b]
	inc a
	ret nz
	ld [w2d01b], a
	ret
; 0x81e16

Func_81e16: ; 81e16 (20:5e16)
	ld a, [wCutscene]
	call Func_81b0d
	ret z
.loop
	ld a, [w2d016]
	ld b, a
	ld a, [wMapSide]
	cp b
	jr nz, .same_side
	call Func_81e36
.same_side
	ld hl, w2d026
	call GetByteFromPointerInHL
	call Func_81b13
	ret z
	jr .loop
; 0x81e36

Func_81e36: ; 81e36 (20:5e36)
	ld a, [w2d028]
	jumptable

	dw Func_81e44
	dw Func_81e57
	dw Func_81e47
	dw Func_82c09
	dw Func_81e47
; 0x81e44

Func_81e44: ; 81e44 (20:5e44)
.loop
	nop
	jr .loop
; 0x81e47

Func_81e47: ; 81e47 (20:5e47)
	farcall Func_b4004
	ret
; 0x81e57

Func_81e57: ; 81e57 (20:5e57)
	ld a, [w2d065]
	add a
	ret z
	xor a
	ld [w2d072], a
	call Func_81f4b
	call Func_81f94
.loop
	call Func_81e88
	ld hl, w2d072
	inc [hl]
	ld a, [w2d074]
	cp [hl]
	jr nz, .loop

	xor a
	ld [w2d072], a
	xor a
	ld [w2d082], a
	ld [w2d083], a
	ld [w2d081], a
	ld [w2d080], a
	ld [w2d071], a
	ret
; 0x81e88

Func_81e88: ; 81e88 (20:5e88)
	call Func_82ada
	jr z, .asm_81ebe
	ld a, [w2d073]
	ld hl, w2d081
	call Func_82b45
	ld a, [w2d073]
	call Func_81fb9
	call Func_81fd8
	ld a, $01
	ld [w2d07f], a
	push hl
	call Func_81feb
	pop hl
	ld a, [w2d080]
	ld [hl], a
	dec h
	dec h
	dec h
	ld a, [w2d081]
	ld [hl], a
	xor a
	ld [w2d07f], a
	ld a, [w2d067]
	cp $0e
	ret z
.asm_81ebe
	ld a, [w2d06e]
	ld [w2d06c], a
	ld a, [w2d06d]
	ld [w2d06b], a
	ld a, [w2d075]
	ld [w2d073], a
	ld a, [w2d073]
	ld hl, w2d081
	call Func_82b45
	ld a, [w2d073]
	call Func_81fb9
	call Func_81fd8
	ld a, $01
	ld [w2d07f], a
	push hl
	call Func_81feb
	pop hl
	ld a, [w2d080]
	ld [hl], a
	dec h
	dec h
	dec h
	ld a, [w2d081]
	ld [hl], a
	xor a
	ld [w2d07f], a
	ld hl, w2d081
	call Func_82b3e
	ld hl, w2d06d
	call Func_3ad7
	ld a, $01
	ld [w2d07f], a
	push hl
	call Func_81feb
	pop hl
	ld a, [w2d080]
	ld [hl], a
	dec h
	dec h
	dec h
	ld a, [w2d081]
	ld [hl], a
	xor a
	ld [w2d07f], a
	ret
; 0x81f21

	INCROM $81f21, $81f4b

Func_81f4b: ; 81f4b (20:5f4b)
	ld hl, w2d016
	ld a, [hli]
	ld c, [hl]
	ld hl, Data_80000
	call GetCthEntryFromAthTable
	ld a, [hli]
	ld [w2d066], a
	ld a, [hl]
	ld [w2d067], a
	ld hl, w2d016
	ld a, [hli]
	ld c, [hl]
	ld hl, Data_8004c
	call GetCthEntryFromAthTable
	ld a, [hli]
	ld [w2d063 + 0], a
	ld a, [hl]
	ld [w2d063 + 1], a
	ld a, [w2d066]
	call Func_810f0
	ld a, [hli]
	ld [w2d069], a
	ld [w2d06b], a
	ld a, [hl]
	ld [w2d06a], a
	ld [w2d06c], a
	ld a, [w2d067]
	call Func_810f0
	ld a, [hli]
	ld [w2d06d], a
	ld a, [hl]
	ld [w2d06e], a
	ret
; 0x81f94

Func_81f94: ; 81f94 (20:5f94)
	ld a, [w2d063 + 0]
	ld l, a
	ld a, [w2d063 + 1]
	ld h, a
	ld a, [w2d071]
	call AddOffsetInPointerTable
	ld a, [hli]
	ld [w2d073], a
	ld a, [hli]
	ld [w2d074], a
	ld a, [hli]
	ld [w2d075], a
	cp $ff
	ld a, [hl]
	jr nz, .asm_81fb4
	xor a
.asm_81fb4
	ld [w2d076], a
	ret

	ret ; stray ret
; 0x81fb9

Func_81fb9: ; 81fb9 (20:5fb9)
	ld b, a
	ld a, $08
	ld hl, w2d06c
	bit 4, b
	jr nz, .asm_81fd5
	bit 5, b
	jr nz, .asm_81fd3
	ld hl, w2d06b
	bit 6, b
	jr nz, .asm_81fd3
	bit 7, b
	jr nz, .asm_81fd5
	ret
.asm_81fd3
	cpl
	inc a
.asm_81fd5
	add [hl]
	ld [hl], a
	ret
; 0x81fd8

Func_81fd8: ; 81fd8 (20:5fd8)
	ld a, [w2d082]
	ld [w2d086], a
	ld a, [w2d083]
	ld [w2d087], a
	ld hl, w2d06b
	call Func_3ad7
	ret
; 0x81feb

Func_81feb: ; 81feb (20:5feb)
	ld a, [w2d07f]
	and a
	ret z
	ld a, [w2d083]
	ld h, a
	ld a, [w2d082]
	ld l, a
	ld a, [hl]
	call Func_8200f
	ld a, [w2d081]
	and $f8
	or c
	or $08
	ld [w2d081], a
	ld a, [w2d07f]
	dec a
	ret z
.asm_8200c
	nop
	jr .asm_8200c
; 0x8200f

Func_8200f: ; 8200f (20:600f)
	ld c, $07
	ret
; 0x82012

Func_82012: ; 82012 (20:6012)
	ld a, [wMapSide]
	ld c, a
	ld hl, .data
	ld de, w2d110
	ld b, 2
	call CopyHLToDE
	ld a, c
	ld [de], a
	ret

.data
	db $14, $14
; 0x82026

	INCROM $82026, $8202c

Func_8202c: ; 8202c (20:602c)
	ld hl, w2d110
	ld de, $6580
	ld b, $2a
	call AddOWSpriteWithScroll
	ret
; 0x82038

PlaySFX12A: ; 82038 (20:6038)
	play_sfx SFX_12A
	ret
; 0x82041

Func_82041: ; 82041 (20:6041)
	ld a, [w2d01d]
	ld c, a
	ld a, [w2d068]
	cp c
	jr z, .asm_82064
	ld hl, w2d10d
	ld a, [hl]
	and a
	call z, PlaySFX12A
	inc [hl]
	ld a, [w2d10e]
	rlca
	ld c, $24
	jr nc, .asm_82060
	srl c
	srl c
.asm_82060
	ld a, [hl]
	cp c
	jr c, .asm_82068
.asm_82064
	xor a
	ld [w2d10d], a
.asm_82068
	ld a, [w2d10c]
	ld b, a
	ld a, [w2d073]
	cp b
	jr z, .asm_8208d
	ld [w2d10c], a
	ld c, $04
	bit 6, a
	jr nz, .asm_82089
	ld c, $03
	bit 4, a
	jr nz, .asm_82089
	ld c, $02
	bit 5, a
	jr nz, .asm_82089
	ld c, $01
.asm_82089
	ld a, c
	call Func_820af
.asm_8208d
	ld a, [w2d106]
	and a
	ret z
	ld hl, w2d109
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, w2d104
	ld b, $2a
	call UpdateOWAnimation
	ld hl, w2d107
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, w2d100
	ld b, $2a
	call AddOWSpriteWithScroll
	ret
; 0x820af

Func_820af: ; 820af (20:60af)
	ld [w2d106], a
	and a
	ret z
	ld bc, $6329
	cp $05
	jr c, .ok
	ld bc, $60cf
.ok
	dec a
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, .framesets
	add hl, de
	ld de, w2d109
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hl]
	ld [de], a
	ld hl, w2d107
	ld [hl], c
	inc l
	ld [hl], b
	ld hl, w2d104
	xor a
	ld [hli], a
	ld [hl], a
	ret

.framesets
	dw Frameset_aa405
	dw Frameset_aa416
	dw Frameset_aa427
	dw Frameset_aa438
	dw Frameset_aa25e
; 0x820e6

	INCROM $820e6, $8212c

Func_8212c: ; 8212c (20:612c)
	ld a, [w2d01d]
	ld [w2d066], a
	call Func_810f0
	ld a, [hli]
	ld [w2d069], a
	ld b, a
	ld a, [hli]
	ld [w2d06a], a
	ld c, a
	ld a, [hli]
	add b
	ld [w2d06b], a
	ld [w2d100], a
	ld a, [hl]
	add c
	ld [w2d06c], a
	ld [w2d101], a
	ret
; 0x82150

	INCROM $82150, $822b4

Func_822b4: ; 822b4 (20:62b4)
	call Func_82490
	call Func_82654
	xor a
	ld [w2d140], a
	ld [w2d148], a
	ld a, $1c
	ld [w2d149], a
	call Func_824ea
	ld hl, Pals_84a20
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84a20)
	call CopyFarBytes
	ret
; 0x822d7

	INCROM $822d7, $82490

Func_82490: ; 82490 (20:6490)
	ld a, [w2d053]
	ld c, $00
	bit 0, a
	jr nz, .asm_824d4
	inc c
	bit 1, a
	jr nz, .asm_824ab
	inc c
	bit 2, a
	jr nz, .asm_824ab
	inc c
	bit 3, a
	jr nz, .asm_824ab
	inc c
	bit 4, a
.asm_824ab
	ld a, c
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, .data
	add hl, de
	ld a, [hli]
	ld [w2d141], a
	ld a, [hl]
	ld hl, w2d146
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a ; w2d144

	ld c, $00
	ld a, [w2d053]
	and $18
	jr z, .asm_824cb
	ld c, $0b
.asm_824cb
	ld a, c
	ld hl, w2d14e
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a ; w2d14c
	ret

.asm_824d4
	ld a, [w2d011]
	and a
	jr z, .asm_824ab
	ld c, $05
	jr .asm_824ab

.data
	db $60, $07
	db $50, $03
	db $40, $01
	db $2c, $0d
	db $0c, $09
	db $60, $05
; 0x824ea

Func_824ea: ; 824ea (20:64ea)
	call Func_824f1
	call Func_8250a
	ret
; 0x824f1

Func_824f1: ; 824f1 (20:64f1)
	xor a
	ld [wOWAnimationFinished], a
	ld a, [w2d146]
	ld hl, w2d144
	call Func_82521
	ld b, $2a
	ld de, $5fe2
	ld hl, w2d140
	call AddOWSpriteWithScroll
	ret
; 0x8250a

Func_8250a: ; 8250a (20:650a)
	ld a, [w2d14e]
	and a
	ret z
	ld hl, w2d14c
	call Func_82521
	ld b, $2a
	ld de, $5fe2
	ld hl, w2d148
	call AddOWSpriteWithScroll
	ret
; 0x82521

Func_82521: ; 82521 (20:6521)
	push hl
	jumptable
; 0x82523

	INCROM $82523, $82654

Func_82654: ; 82654 (20:6654)
	ld a, [w2d054]
	ld b, a
	ld hl, $66c6
	ld de, wBGMap1 + $26b
	call Func_82698
	ld hl, $66ce
	ld de, wBGMap1 + $269
	call Func_82698
	ld hl, $66d6
	ld de, wBGMap1 + $267
	call Func_82698
	ld a, [w2d053]
	ld b, a
	ld hl, $66de
	ld de, wBGMap1 + $26b
	call Func_82693
	ld hl, $66de
	ld de, wBGMap1 + $269
	call Func_82693
	ld hl, $66e6
	ld de, wBGMap1 + $267
	call Func_82693
	ret
; 0x82693

Func_82693: ; 82693 (20:6693)
	srl b
	ret nc
	jr Func_8269f

Func_82698: ; 82698 (20:6698)
	srl b
	jr c, Func_8269f
	ld hl, $66be
;	fallthrough

Func_8269f: ; 8269f (20:669f)
; loops twice, once for de + $40
; and then for the original de
	push de
	ld a, e
	add $40
	ld e, a
	ld a, $00
	adc d
	ld d, a
	ld c, 2
.loop
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	dec e
	ld a, e
	add $20
	ld e, a
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	dec c
	ret z
	pop de
	jr .loop
; 0x826be

	INCROM $826be, $828b3

Func_828b3: ; 828b3 (20:68b3)
	ld a, [wca3d]
	bit 1, a
	jp nz, Func_82997

	ld a, [wLevelTreasure1Unk]
	ld c, a
	ld e, $00
	ld a, [w2d0fa]
	bit 0, a
	jr nz, .asm_828cc
	ld e, $09
	ld c, $00
.asm_828cc
	ld d, $20
	call Func_8291e

	ld a, [wLevelTreasure2Unk]
	ld c, a
	ld e, $01
	ld a, [w2d0fa]
	bit 1, a
	jr nz, .asm_828e2
	ld e, $09
	ld c, $00
.asm_828e2
	ld d, $3c
	call Func_8291e

	ld a, [wLevelTreasure3Unk]
	ld c, a
	ld e, $02
	ld a, [w2d0fa]
	bit 2, a
	jr nz, .asm_828f8
	ld e, $09
	ld c, $00
.asm_828f8
	ld d, $58
	call Func_8291e

	ld a, [wLevelTreasure4Unk]
	ld c, a
	ld e, $03
	ld a, [w2d0fa]
	bit 3, a
	jr nz, .asm_8290e
	ld e, $09
	ld c, $00
.asm_8290e
	ld d, $74
	call Func_8291e
	call Func_8295b
	call Func_8293f
	ret
; 0x8291a

Func_8291a: ; 8291a (20:691a)
	ld b, $20
	jr Func_82920

Func_8291e: ; 8291e (20:691e)
	ld b, $24
;	fallthrough

Func_82920: ; 82920 (20:6920)
	ld a, [w2d094]
	add b
	ld [wCurSpriteYCoord], a
	ld a, [w2d095]
	add d
	ld [wCurSpriteXCoord], a
	ld a, e
	ld [wCurSpriteTileID], a
	ld a, c
	ld [wCurSpriteAttributes], a
	ld hl, $60cf
	ld b, $2a
	call AddOWSpriteWithScroll_GotParams
	ret
; 0x8293f

Func_8293f: ; 8293f (20:693f)
	ld a, [w2d0fa]
	bit 7, a
	ret z
	ld hl, w2d116
	ld de, Frameset_aa2fb
	ld b, $2a
	call UpdateOWAnimation
	ld d, $90
	ld hl, w2d114
	ld a, [hli]
	ld e, a
	ld c, $00
	jr Func_8291e
; 0x8295b

Func_8295b: ; 8295b (20:695b)
	ld a, [wHasMagnifyingGlass]
	and a
	ret z
	ld b, $04
	ld a, [wOWLevel]
	add a ; *2
	jr nz, .asm_8296c
	ld b, $06
	jr .asm_82975
.asm_8296c
	ld a, [w2d0fa]
	bit 4, a
	jr z, .asm_82975
	ld b, $05
.asm_82975
	ld a, b
	ld [wCurSpriteTileID], a
	ld a, [w2d094]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [w2d095]
	add $10
	ld [wCurSpriteXCoord], a
	ld a, $00
	ld [wCurSpriteAttributes], a
	ld hl, $6580
	ld b, $2a
	call AddOWSpriteWithScroll_GotParams
	ret
; 0x82997

Func_82997: ; 82997 (20:6997)
	call Func_829a1
	call Func_8295b
	call Func_8293f
	ret
; 0x829a1

Func_829a1: ; 829a1 (20:69a1)
	ld a, [w2d0ee]
	and $f0
	swap a
	add $1e
	ld e, a
	ld c, $00
	ld d, $50
	call Func_8291a
	ld a, [w2d0ee]
	and $0f
	add $1e
	ld e, a
	ld c, $00
	ld d, $58
	call Func_8291a
	ld a, [w2d0ef]
	and $f0
	swap a
	add $1e
	ld e, a
	ld c, $00
	ld d, $68
	call Func_8291a
	ld a, [w2d0ef]
	and $0f
	add $1e
	ld e, a
	ld c, $00
	ld d, $70
	call Func_8291a
	ret
; 0x829e2

	INCROM $829e2, $82ada

Func_82ada: ; 82ada (20:6ada)
	ld a, [w2d066]
	cp $0f
	ret z
	ld c, a
	ld a, [w2d016]
	and a
	ret nz
	ld a, $07
	cp c
	ret
; 0x82aea

	INCROM $82aea, $82b3e

Func_82b3e: ; 82b3e (20:6b3e)
	ld b, a
	xor a
	ld [hld], a
	ld a, $00
	ld [hl], a
	ret
; 0x82b45

Func_82b45: ; 82b45 (20:6b45)
	ld b, a
	xor a
	ld [hl], a
	bit 4, b
	jr nz, .asm_82b5b
	bit 5, b
	jr nz, .asm_82b59
	bit 6, b
	jr nz, .asm_82b62
	bit 7, b
	jr nz, .asm_82b60
	ret
.asm_82b59
	set 5, [hl]
.asm_82b5b
	dec l
	ld a, $02
	ld [hl], a
	ret
.asm_82b60
	set 6, [hl]
.asm_82b62
	dec l
	ld a, $01
	ld [hl], a
	ret
; 0x82b67

	INCROM $82b67, $82bb8

Func_82bb8: ; 82bb8 (20:6bb8)
	ld a, [w2d028]
	cp $01
	ret nz
	ld a, [w2d184 + $2]
	and a
	ret z
	ld de, Frameset_aa544
	ld hl, w2d184
	ld b, $2a
	call UpdateOWAnimation
	ld hl, w2d180
	ld de, $6445
	ld b, $2a
	call AddOWSpriteWithScroll
	ret
; 0x82bda

Func_82bda: ; 82bda (20:6bda)
	ld a, [w2d028]
	cp $03
	ret nz
	ld a, [w2d184 + $2]
	and a
	ret z
	ld hl, w2d184
	ld de, Frameset_aa555
	ld b, $2a
	call UpdateOWAnimation
	ld a, [wOWAnimationFinished]
	cp $ff
	jr z, .asm_82c03
	ld hl, w2d180
	ld de, $6445
	ld b, $2a
	call AddOWSpriteWithScroll
	ret
.asm_82c03
	ld hl, w2d184 + $2
	xor a
	ld [hl], a
	ret
; 0x82c09

Func_82c09: ; 82c09 (20:6c09)
	ld a, [w2d065]
	cp $80
	ret nz
	ld hl, Pals_848e0
	ld de, wTempPals2 palette 4
	ld c, 2 palettes
	ld b, BANK(Pals_848e0)
	call CopyFarBytes
	ret
; 0x82c1d

	INCROM $82c1d, $82cb8
