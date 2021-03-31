; loads a room's permission map, tilemap
; foreground and background tiles and its palettes
LoadRoom: ; c0000 (30:4000)
	ld d, $00
	ld a, [wCurRoom]
	add a
	ld e, a
	rl d
	ld hl, PointerTable_c04c5
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	cp $ff
	jr nz, .ok
	jp Init

.ok
	ld a, [hli]
	ld [wPermissionMapID], a
	ld a, [hli]
	ld [wRoomTileMap], a
	ld a, [hli]
	ld [wRoomMainTiles], a
	ld a, [hli]
	ld [wRoomSpecialTiles], a
	ld a, [hl]
	ld [wRoomPalettes], a

; divide wPermissionMapID by 6
	ld b, 0
	ld a, [wPermissionMapID]
.loop
	sub $6
	jr c, .div_done
	inc b
	jr .loop
.div_done
	ld a, $38
	add b
	ld [wc0cf], a
	call Func_298d
	call LoadPermissionMap
	ld a, [wc0cf]
	ld [wc0d0], a
	call LoadRoomTileMap

	ld a, [wRoomMainTiles]
	srl a
	srl a
	srl a ; /8
	add BANK("Room Main Tiles 1")
	ld [wRoomMainTilesBank], a
	call LoadRoomMainTiles

	ld a, [wRoomSpecialTiles]
	srl a
	srl a
	srl a ; /8
	add BANK("Room Special Tiles 1")
	ld [wRoomSpecialTilesBank], a
	call LoadRoomSpecialTiles

	ld a, BANK("Palettes")
	ld [wPaletteBank], a
	call LoadRoomPalettes
	ret
; 0xc0078

InitRoomAnimatedTiles: ; c0078 (30:4078)
	ld hl, Data_c0ce5
	ld d, $00
	ld a, [wc1ab]
	add a
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [hl]
	ld [wAnimatedTilesGroup], a
	xor a
	ld [wAnimatedTilesFrame], a
	ld [wAnimatedTilesFrameCount], a
	ret
; 0xc0095

Func_c0095: ; c0095 (30:4095)
	ld hl, PointerTable_c0c51
	ld d, $00
	ld a, [wc1b0]
	add a
	ld e, a
	rl d
	add hl, de
	ld a, [hli]
	ld [wc1b2 + 1], a
	ld a, [hld]
	ld [wc1b2 + 0], a
	ld l, [hl]
	ld h, a
	ld de, $8
	add hl, de
	ld a, [hl]
	ld [wc1b1], a
	srl a
	ld [wc1b5], a
	xor a
	ld [wc1b4], a
	ret
; 0xc00be

PointerTable_c00be: ; c00be (30:40be)
	dw .data_c026a
	dw .data_c026a
	dw .data_c026a
	dw .data_c026a
	dw .data_c026a
	dw .data_c026a
	dw .data_c026a
	dw .data_c026a
	dw .data_c026f
	dw .data_c026f
	dw .data_c026f
	dw .data_c026f
	dw .data_c0314
	dw .data_c026f
	dw .data_c026f
	dw .data_c026f
	dw .data_c0274
	dw .data_c0274
	dw .data_c02ec
	dw .data_c02ec
	dw .data_c0274
	dw .data_c0274
	dw .data_c02ec
	dw .data_c02ec
	dw .data_c0279
	dw .data_c0279
	dw .data_c0279
	dw .data_c0279
	dw .data_c0279
	dw .data_c0279
	dw .data_c0279
	dw .data_c0279
	dw .data_c027e
	dw .data_c027e
	dw .data_c027e
	dw .data_c027e
	dw .data_c0300
	dw .data_c0300
	dw .data_c0300
	dw .data_c0300
	dw .data_c0283
	dw .data_c0283
	dw .data_c0283
	dw .data_c0283
	dw .data_c0283
	dw .data_c0283
	dw .data_c0283
	dw .data_c0283
	dw .data_c0288
	dw .data_c0288
	dw .data_c0288
	dw .data_c0288
	dw .data_c0288
	dw .data_c0288
	dw .data_c0288
	dw .data_c0288
	dw .data_c028d
	dw .data_c028d
	dw .data_c028d
	dw .data_c02f1
	dw .data_c028d
	dw .data_c028d
	dw .data_c028d
	dw .data_c02f1
	dw .data_c0292
	dw .data_c02f6
	dw .data_c02f6
	dw .data_c02f6
	dw .data_c0292
	dw .data_c02f6
	dw .data_c02f6
	dw .data_c02f6
	dw .data_c0297
	dw .data_c0297
	dw .data_c0297
	dw .data_c0297
	dw .data_c0297
	dw .data_c0297
	dw .data_c0297
	dw .data_c0297
	dw .data_c029c
	dw .data_c029c
	dw .data_c029c
	dw .data_c029c
	dw .data_c029c
	dw .data_c029c
	dw .data_c029c
	dw .data_c029c
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a1
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02a6
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02ab
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b0
	dw .data_c02b5
	dw .data_c030f
	dw .data_c030f
	dw .data_c030f
	dw .data_c02b5
	dw .data_c030f
	dw .data_c030f
	dw .data_c030f
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02ba
	dw .data_c02bf
	dw .data_c02bf
	dw .data_c02bf
	dw .data_c02bf
	dw .data_c02bf
	dw .data_c02bf
	dw .data_c02bf
	dw .data_c030a
	dw .data_c02c4
	dw .data_c0305
	dw .data_c0305
	dw .data_c0305
	dw .data_c02c4
	dw .data_c0305
	dw .data_c0305
	dw .data_c0305
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02c9
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02ce
	dw .data_c02d3
	dw .data_c02d3
	dw .data_c02d3
	dw .data_c02d3
	dw .data_c02fb
	dw .data_c02fb
	dw .data_c02fb
	dw .data_c02fb
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02d8
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02dd
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e2
	dw .data_c02e7
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

.data_c026a
	db $00, $40, $38, $4c, $69
.data_c026f
	db $10, $58, $38, $d3, $6a
.data_c0274
	db $00, $40, $39, $8a, $6a
.data_c0279
	db $84, $58, $3f, $4b, $6a
.data_c027e
	db $00, $40, $3a, $e6, $61
.data_c0283
	db $a0, $4e, $3a, $63, $63
.data_c0288
	db $00, $40, $3b, $f5, $6a
.data_c028d
	db $ab, $57, $3b, $43, $6c
.data_c0292
	db $00, $40, $3c, $20, $68
.data_c0297
	db $9d, $52, $3c, $47, $69
.data_c029c
	db $00, $40, $3d, $13, $65
.data_c02a1
	db $33, $55, $3d, $7c, $66
.data_c02a6
	db $00, $40, $3e, $8d, $62
.data_c02ab
	db $ba, $53, $3e, $e6, $63
.data_c02b0
	db $00, $40, $3f, $ff, $68
.data_c02b5
	db $89, $52, $39, $bd, $6b
.data_c02ba
	db $00, $40, $40, $f4, $69
.data_c02bf
	db $1e, $53, $40, $43, $6b
.data_c02c4
	db $00, $40, $41, $c8, $5f
.data_c02c9
	db $dd, $51, $41, $da, $60
.data_c02ce
	db $00, $40, $42, $5e, $6c
.data_c02d3
	db $dd, $5a, $42, $5e, $6d
.data_c02d8
	db $00, $40, $43, $3a, $62
.data_c02dd
	db $04, $55, $43, $32, $63
.data_c02e2
	db $00, $40, $44, $64, $54
.data_c02e7
	db $9a, $53, $44, $60, $55
.data_c02ec
	db $00, $40, $45, $13, $67
.data_c02f1
	db $e3, $53, $45, $4a, $68
.data_c02f6
	db $00, $40, $46, $b2, $65
.data_c02fb
	db $61, $53, $46, $d9, $66
.data_c0300
	db $00, $40, $47, $6e, $62
.data_c0305
	db $69, $50, $47, $e7, $63
.data_c030a
	db $00, $40, $48, $d5, $6e
.data_c030f
	db $de, $56, $48, $23, $70
.data_c0314
	db $00, $40, $49, $3d, $51
; 0xc0319

PointerTable_c0319: ; c0319 (30:4319)
	dw Data_c0d1f ; 00
	dw Data_c0d1f ; 01
	dw Data_c0e03 ; 02
	dw Data_c0ee7 ; 03
	dw Data_c0fcb ; 04
	dw Data_c0fcb ; 05
	dw Data_c10af ; 06
	dw Data_c1193 ; 07
	dw Data_c1277 ; 08
	dw Data_c135b ; 09
	dw Data_c135b ; 0a
	dw Data_c135b ; 0b
	dw Data_c143f ; 0c
	dw Data_c1523 ; 0d
	dw Data_c1523 ; 0e
	dw Data_c1523 ; 0f
	dw Data_c1607 ; 10
	dw Data_c1607 ; 11
	dw Data_c1607 ; 12
	dw Data_c16c3 ; 13
	dw Data_c177f ; 14
	dw Data_c177f ; 15
	dw Data_c177f ; 16
	dw Data_c183b ; 17
	dw Data_c18f7 ; 18
	dw Data_c18f7 ; 19
	dw Data_c18f7 ; 1a
	dw Data_c19d3 ; 1b
	dw Data_c1aaf ; 1c
	dw Data_c1aaf ; 1d
	dw Data_c1aaf ; 1e
	dw Data_c1b8b ; 1f
	dw Data_c1c67 ; 20
	dw Data_c1c67 ; 21
	dw Data_c1d2b ; 22
	dw Data_c1def ; 23
	dw Data_c1eb3 ; 24
	dw Data_c1eb3 ; 25
	dw Data_c1f77 ; 26
	dw Data_c203b ; 27
	dw Data_c20ff ; 28
	dw Data_c21c3 ; 29
	dw Data_c21c3 ; 2a
	dw Data_c2287 ; 2b
	dw Data_c234b ; 2c
	dw Data_c240f ; 2d
	dw Data_c240f ; 2e
	dw Data_c24d3 ; 2f
	dw Data_c2597 ; 30
	dw Data_c2597 ; 31
	dw Data_c2597 ; 32
	dw Data_c2597 ; 33
	dw Data_c267b ; 34
	dw Data_c267b ; 35
	dw Data_c267b ; 36
	dw Data_c267b ; 37
	dw Data_c275f ; 38
	dw Data_c275f ; 39
	dw Data_c283b ; 3a
	dw Data_c283b ; 3b
	dw Data_c2917 ; 3c
	dw Data_c2917 ; 3d
	dw Data_c29f3 ; 3e
	dw Data_c29f3 ; 3f
	dw Data_c2acf ; 40
	dw Data_c2acf ; 41
	dw Data_c2acf ; 42
	dw Data_c2b8b ; 43
	dw Data_c2c47 ; 44
	dw Data_c2c47 ; 45
	dw Data_c2c47 ; 46
	dw Data_c2d03 ; 47
	dw Data_c2dbf ; 48
	dw Data_c2dbf ; 49
	dw Data_c2dbf ; 4a
	dw Data_c2eab ; 4b
	dw Data_c2f97 ; 4c
	dw Data_c2f97 ; 4d
	dw Data_c2f97 ; 4e
	dw Data_c3083 ; 4f
	dw Data_c316f ; 50
	dw Data_c316f ; 51
	dw Data_c325b ; 52
	dw Data_c3347 ; 53
	dw Data_c3433 ; 54
	dw Data_c3433 ; 55
	dw Data_c351f ; 56
	dw Data_c360b ; 57
	dw Data_c36f7 ; 58
	dw Data_c36f7 ; 59
	dw Data_c3783 ; 5a
	dw Data_c380f ; 5b
	dw Data_c389b ; 5c
	dw Data_c389b ; 5d
	dw Data_c3927 ; 5e
	dw Data_c39b3 ; 5f
	dw Data_c3a3f ; 60
	dw Data_c3b2b ; 61
	dw Data_c3c17 ; 62
	dw Data_c3c17 ; 63
	dw Data_c4000 ; 64
	dw Data_c40ec ; 65
	dw Data_c41d8 ; 66
	dw Data_c41d8 ; 67
	dw Data_c42c4 ; 68
	dw Data_c42c4 ; 69
	dw Data_c42c4 ; 6a
	dw Data_c4360 ; 6b
	dw Data_c43fc ; 6c
	dw Data_c43fc ; 6d
	dw Data_c43fc ; 6e
	dw Data_c4498 ; 6f
	dw Data_c4534 ; 70
	dw Data_c45e8 ; 71
	dw Data_c469c ; 72
	dw Data_c4750 ; 73
	dw Data_c4804 ; 74
	dw Data_c48b8 ; 75
	dw Data_c496c ; 76
	dw Data_c4a20 ; 77
	dw Data_c4ad4 ; 78
	dw Data_c4ad4 ; 79
	dw Data_c4ad4 ; 7a
	dw Data_c4b80 ; 7b
	dw Data_c4c2c ; 7c
	dw Data_c4c2c ; 7d
	dw Data_c4c2c ; 7e
	dw Data_c4cd8 ; 7f
	dw Data_c4d84 ; 80
	dw Data_c4d84 ; 81
	dw Data_c4e58 ; 82
	dw Data_c4f2c ; 83
	dw Data_c4d84 ; 84
	dw Data_c4d84 ; 85
	dw Data_c4e58 ; 86
	dw Data_c4f2c ; 87
	dw Data_c5000 ; 88
	dw Data_c5000 ; 89
	dw Data_c50c4 ; 8a
	dw Data_c50c4 ; 8b
	dw Data_c5188 ; 8c
	dw Data_c5188 ; 8d
	dw Data_c524c ; 8e
	dw Data_c524c ; 8f
	dw Data_c5310 ; 90
	dw Data_c5310 ; 91
	dw Data_c5310 ; 92
	dw Data_c53c4 ; 93
	dw Data_c5478 ; 94
	dw Data_c5478 ; 95
	dw Data_c5478 ; 96
	dw Data_c552c ; 97
	dw Data_c55e0 ; 98
	dw Data_c55e0 ; 99
	dw Data_c56ac ; 9a
	dw Data_c56ac ; 9b
	dw Data_c5778 ; 9c
	dw Data_c5778 ; 9d
	dw Data_c5844 ; 9e
	dw Data_c5844 ; 9f
	dw Data_c5910 ; a0
	dw Data_c5910 ; a1
	dw Data_c5910 ; a2
	dw Data_c59f4 ; a3
	dw Data_c5ad8 ; a4
	dw Data_c5ad8 ; a5
	dw Data_c5ad8 ; a6
	dw Data_c5bbc ; a7
	dw Data_c5ca0 ; a8
	dw Data_c5ca0 ; a9
	dw Data_c5ca0 ; aa
	dw Data_c5d5c ; ab
	dw Data_c5e18 ; ac
	dw Data_c5e18 ; ad
	dw Data_c5e18 ; ae
	dw Data_c5ed4 ; af
	dw Data_c5f90 ; b0
	dw Data_c605c ; b1
	dw Data_c605c ; b2
	dw Data_c6128 ; b3
	dw Data_c5f90 ; b4
	dw Data_c605c ; b5
	dw Data_c605c ; b6
	dw Data_c6128 ; b7
	dw Data_c61f4 ; b8
	dw Data_c6298 ; b9
	dw Data_c633c ; ba
	dw Data_c63e0 ; bb
	dw Data_c6484 ; bc
	dw Data_c6528 ; bd
	dw Data_c65cc ; be
	dw Data_c6670 ; bf
	dw Data_c6714 ; c0
	dw Data_c6714 ; c1
	dw Data_c67a8 ; c2
	dw Data_c683c ; c3
	dw Data_c68d0 ; c4
	dw Data_c68d0 ; c5
	dw Data_c6964 ; c6
	dw Data_c69f8 ; c7
	dw Data_c6a8c ; c8
	dw NULL      ; c9
	dw NULL      ; ca
	dw NULL      ; cb
	dw NULL      ; cc
	dw NULL      ; cd
	dw NULL      ; ce
	dw NULL      ; cf
	dw NULL      ; d0
	dw NULL      ; d1
	dw NULL      ; d2
	dw NULL      ; d3
	dw NULL      ; d4
	dw NULL      ; d5
; 0xc04c5

PointerTable_c04c5: ; c04c5 (30:44c5)
	dw NULL
	dw .data_c060b
	dw .data_c0610
	dw .data_c0615
	dw .data_c061a
	dw .data_c061f
	dw .data_c0624
	dw .data_c0629
	dw .data_c062e
	dw .data_c0633
	dw .data_c0638
	dw .data_c063d
	dw .data_c0642
	dw .data_c0647
	dw .data_c064c
	dw .data_c0651
	dw .data_c0656
	dw .data_c065b
	dw .data_c0660
	dw .data_c0665
	dw .data_c066a
	dw .data_c066f
	dw .data_c0674
	dw .data_c0679
	dw .data_c067e
	dw .data_c0683
	dw .data_c0688
	dw .data_c068d
	dw .data_c0692
	dw .data_c0697
	dw .data_c069c
	dw .data_c06a1
	dw .data_c06a6
	dw .data_c06ab
	dw .data_c06b0
	dw .data_c06b5
	dw .data_c06ba
	dw .data_c06bf
	dw .data_c06c4
	dw .data_c06c9
	dw .data_c06ce
	dw .data_c06d3
	dw .data_c06d8
	dw .data_c06dd
	dw .data_c06e2
	dw .data_c06e7
	dw .data_c06ec
	dw .data_c06f1
	dw .data_c06f6
	dw .data_c06fb
	dw .data_c0700
	dw .data_c0705
	dw .data_c070a
	dw .data_c070f
	dw .data_c0714
	dw .data_c0719
	dw .data_c071e
	dw .data_c0723
	dw .data_c0728
	dw .data_c072d
	dw .data_c0732
	dw .data_c0737
	dw .data_c073c
	dw .data_c0741
	dw .data_c0746
	dw .data_c074b
	dw .data_c0750
	dw .data_c0755
	dw .data_c075a
	dw .data_c075f
	dw .data_c0764
	dw .data_c0769
	dw .data_c076e
	dw .data_c0773
	dw .data_c0778
	dw .data_c077d
	dw .data_c0782
	dw .data_c0787
	dw .data_c078c
	dw .data_c0791
	dw .data_c0796
	dw .data_c079b
	dw .data_c07a0
	dw .data_c07a5
	dw .data_c07aa
	dw .data_c07af
	dw .data_c07b4
	dw .data_c07b9
	dw .data_c07be
	dw .data_c07c3
	dw .data_c07c8
	dw .data_c07cd
	dw .data_c07d2
	dw .data_c07d7
	dw .data_c07dc
	dw .data_c07e1
	dw .data_c07e6
	dw .data_c07eb
	dw .data_c07f0
	dw .data_c07f5
	dw .data_c07fa
	dw .data_c07ff
	dw .data_c0804
	dw .data_c0809
	dw .data_c080e
	dw .data_c0813
	dw .data_c0818
	dw .data_c081d
	dw .data_c0822
	dw .data_c0827
	dw .data_c082c
	dw .data_c0831
	dw .data_c0836
	dw .data_c083b
	dw .data_c0840
	dw .data_c0845
	dw .data_c084a
	dw .data_c084f
	dw .data_c0854
	dw .data_c0859
	dw .data_c085e
	dw .data_c0863
	dw .data_c0868
	dw .data_c086d
	dw .data_c0872
	dw .data_c0877
	dw .data_c087c
	dw .data_c0881
	dw .data_c0886
	dw .data_c088b
	dw .data_c0890
	dw .data_c0895
	dw .data_c089a
	dw .data_c089f
	dw .data_c08a4
	dw .data_c08a9
	dw .data_c08ae
	dw .data_c08b3
	dw .data_c08b8
	dw .data_c08bd
	dw .data_c08c2
	dw .data_c08c7
	dw .data_c08cc
	dw .data_c08d1
	dw .data_c08d6
	dw .data_c08db
	dw .data_c08e0
	dw .data_c08e5
	dw .data_c08ea
	dw .data_c08ef
	dw .data_c08f4
	dw .data_c08f9
	dw .data_c08fe
	dw .data_c0903
	dw .data_c0908
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

.data_c060b
	db $00, $00, $00, $00, $00

.data_c0610
	db $00, $00, $00, $00, $01

.data_c0615
	db $01, $01, $00, $00, $00

.data_c061a
	db $01, $01, $00, $00, $01

.data_c061f
	db $02, $02, $01, $01, $02

.data_c0624
	db $03, $03, $02, $02, $04

.data_c0629
	db $03, $03, $02, $02, $05

.data_c062e
	db $04, $04, $02, $02, $04

.data_c0633
	db $04, $04, $02, $02, $05

.data_c0638
	db $05, $05, $03, $03, $06

.data_c063d
	db $05, $05, $03, $03, $07

.data_c0642
	db $06, $06, $04, $03, $08

.data_c0647
	db $0a, $0a, $04, $03, $0d

.data_c064c
	db $09, $09, $26, $03, $09

.data_c0651
	db $07, $07, $05, $03, $0b

.data_c0656
	db $08, $08, $06, $03, $0c

.data_c065b
	db $09, $09, $26, $03, $0a

.data_c0660
	db $3b, $3b, $07, $03, $0e

.data_c0665
	db $0c, $0c, $08, $03, $0f

.data_c066a
	db $0d, $0d, $09, $01, $10

.data_c066f
	db $42, $42, $0a, $01, $11

.data_c0674
	db $3d, $3d, $0b, $01, $12

.data_c0679
	db $10, $10, $0c, $04, $13

.data_c067e
	db $11, $11, $0c, $04, $14

.data_c0683
	db $12, $12, $0d, $01, $15

.data_c0688
	db $09, $09, $26, $03, $16

.data_c068d
	db $13, $13, $0e, $01, $17

.data_c0692
	db $13, $13, $0e, $01, $18

.data_c0697
	db $34, $34, $0f, $05, $19

.data_c069c
	db $32, $32, $0f, $05, $1a

.data_c06a1
	db $15, $15, $10, $08, $1b

.data_c06a6
	db $16, $16, $11, $01, $1c

.data_c06ab
	db $16, $16, $11, $01, $1d

.data_c06b0
	db $17, $17, $12, $01, $1e

.data_c06b5
	db $36, $36, $13, $01, $1f

.data_c06ba
	db $37, $37, $14, $01, $4a

.data_c06bf
	db $1a, $1a, $15, $01, $21

.data_c06c4
	db $38, $38, $16, $01, $22

.data_c06c9
	db $1c, $1c, $17, $01, $23

.data_c06ce
	db $1d, $1d, $18, $01, $24

.data_c06d3
	db $1e, $1e, $19, $07, $25

.data_c06d8
	db $1f, $1f, $0c, $04, $26

.data_c06dd
	db $3f, $3f, $1a, $01, $27

.data_c06e2
	db $21, $21, $1b, $01, $28

.data_c06e7
	db $22, $22, $1c, $01, $29

.data_c06ec
	db $44, $44, $19, $07, $2a

.data_c06f1
	db $24, $24, $1d, $01, $2b

.data_c06f6
	db $51, $51, $1d, $01, $2c

.data_c06fb
	db $1b, $1b, $16, $01, $2d

.data_c0700
	db $0f, $0f, $0b, $01, $2e

.data_c0705
	db $25, $25, $1e, $01, $2f

.data_c070a
	db $26, $26, $1f, $01, $30

.data_c070f
	db $27, $27, $20, $01, $31

.data_c0714
	db $28, $28, $21, $01, $32

.data_c0719
	db $17, $17, $12, $01, $33

.data_c071e
	db $29, $29, $22, $01, $34

.data_c0723
	db $2a, $2a, $23, $01, $35

.data_c0728
	db $35, $35, $24, $01, $36

.data_c072d
	db $2c, $2c, $25, $01, $37

.data_c0732
	db $08, $08, $06, $03, $38

.data_c0737
	db $08, $08, $06, $03, $39

.data_c073c
	db $2d, $2d, $0c, $04, $3a

.data_c0741
	db $15, $15, $10, $08, $3b

.data_c0746
	db $16, $16, $11, $01, $3c

.data_c074b
	db $16, $16, $11, $01, $3d

.data_c0750
	db $3e, $3e, $0b, $01, $51

.data_c0755
	db $2e, $2e, $06, $03, $0c

.data_c075a
	db $2e, $2e, $06, $03, $38

.data_c075f
	db $24, $24, $1d, $01, $3f

.data_c0764
	db $24, $24, $1d, $01, $40

.data_c0769
	db $33, $33, $16, $01, $41

.data_c076e
	db $2f, $2f, $1a, $06, $27

.data_c0773
	db $18, $18, $13, $01, $42

.data_c0778
	db $30, $30, $06, $03, $0c

.data_c077d
	db $58, $58, $06, $03, $38

.data_c0782
	db $31, $31, $19, $07, $43

.data_c0787
	db $25, $25, $1e, $01, $44

.data_c078c
	db $25, $25, $1e, $01, $45

.data_c0791
	db $25, $25, $1e, $01, $46

.data_c0796
	db $55, $55, $0e, $01, $47

.data_c079b
	db $34, $34, $0f, $05, $48

.data_c07a0
	db $14, $14, $0f, $05, $19

.data_c07a5
	db $14, $14, $0f, $05, $48

.data_c07aa
	db $15, $15, $10, $08, $3b

.data_c07af
	db $16, $16, $11, $01, $3c

.data_c07b4
	db $16, $16, $11, $01, $3d

.data_c07b9
	db $2b, $2b, $24, $01, $36

.data_c07be
	db $18, $18, $13, $01, $1f

.data_c07c3
	db $36, $36, $13, $01, $49

.data_c07c8
	db $18, $18, $13, $01, $49

.data_c07cd
	db $19, $19, $14, $01, $20

.data_c07d2
	db $37, $37, $14, $01, $4b

.data_c07d7
	db $19, $19, $14, $01, $4c

.data_c07dc
	db $1b, $1b, $16, $01, $22

.data_c07e1
	db $39, $39, $16, $01, $41

.data_c07e6
	db $3a, $3a, $16, $01, $41

.data_c07eb
	db $38, $38, $16, $01, $4d

.data_c07f0
	db $1b, $1b, $16, $01, $4d

.data_c07f5
	db $33, $33, $16, $01, $4e

.data_c07fa
	db $39, $39, $16, $01, $4e

.data_c07ff
	db $3a, $3a, $16, $01, $4e

.data_c0804
	db $0b, $0b, $07, $03, $0e

.data_c0809
	db $3b, $3b, $07, $03, $4f

.data_c080e
	db $0b, $0b, $07, $03, $4f

.data_c0813
	db $3c, $3c, $0b, $01, $2e

.data_c0818
	db $0f, $0f, $0b, $01, $12

.data_c081d
	db $0f, $0f, $0b, $01, $3e

.data_c0822
	db $3d, $3d, $0b, $01, $50

.data_c0827
	db $0f, $0f, $0b, $01, $50

.data_c082c
	db $20, $20, $1a, $01, $27

.data_c0831
	db $40, $40, $1a, $01, $52

.data_c0836
	db $41, $41, $1a, $01, $52

.data_c083b
	db $43, $43, $0a, $01, $11

.data_c0840
	db $0e, $0e, $0a, $01, $11

.data_c0845
	db $0d, $0d, $09, $01, $53

.data_c084a
	db $1e, $1e, $19, $07, $54

.data_c084f
	db $23, $23, $19, $07, $2a

.data_c0854
	db $45, $45, $18, $01, $5a

.data_c0859
	db $46, $46, $27, $01, $5d

.data_c085e
	db $27, $27, $20, $01, $5e

.data_c0863
	db $47, $47, $20, $01, $31

.data_c0868
	db $48, $48, $20, $01, $31

.data_c086d
	db $49, $49, $12, $01, $1e

.data_c0872
	db $4a, $4a, $12, $01, $1e

.data_c0877
	db $17, $17, $12, $01, $61

.data_c087c
	db $49, $49, $12, $01, $61

.data_c0881
	db $4a, $4a, $12, $01, $61

.data_c0886
	db $4b, $4b, $1c, $01, $29

.data_c088b
	db $22, $22, $1c, $01, $62

.data_c0890
	db $4b, $4b, $1c, $01, $62

.data_c0895
	db $4c, $4c, $1b, $01, $28

.data_c089a
	db $4d, $4d, $1b, $01, $63

.data_c089f
	db $4e, $4e, $1b, $01, $63

.data_c08a4
	db $2a, $2a, $23, $01, $64

.data_c08a9
	db $4f, $4f, $18, $01, $24

.data_c08ae
	db $56, $56, $18, $01, $65

.data_c08b3
	db $57, $57, $18, $01, $65

.data_c08b8
	db $45, $45, $18, $01, $68

.data_c08bd
	db $50, $50, $1f, $01, $30

.data_c08c2
	db $26, $26, $1f, $01, $6b

.data_c08c7
	db $50, $50, $1f, $01, $6b

.data_c08cc
	db $51, $51, $1d, $01, $6c

.data_c08d1
	db $24, $24, $1d, $01, $6d

.data_c08d6
	db $51, $51, $1d, $01, $6e

.data_c08db
	db $51, $51, $1d, $01, $3f

.data_c08e0
	db $24, $24, $1d, $01, $6f

.data_c08e5
	db $51, $51, $1d, $01, $6f

.data_c08ea
	db $51, $51, $1d, $01, $40

.data_c08ef
	db $52, $52, $1e, $01, $2f

.data_c08f4
	db $53, $53, $1e, $01, $2f

.data_c08f9
	db $54, $54, $17, $01, $70

.data_c08fe
	db $1c, $1c, $17, $01, $71

.data_c0903
	db $54, $54, $17, $01, $72

.data_c0908
	db $13, $13, $0e, $01, $75

PointerTable_c090d: ; c090d (30:490d)
	dw $6c0b
	dw $6eef
	dw $71cc
	dw $74b4
	dw $7739
	dw $79be
	dw $6cf7
	dw $6fe5
	dw $7281
	dw $758f
	dw $7886
	dw $7b99
	dw $643f
	dw $66d1
	dw $6973
	dw $6c1d
	dw $6ecd
	dw $71c3
	dw $6d97
	dw $7038
	dw $732c
	dw $7664
	dw $7943
	dw $7be2
	dw $6ab7
	dw $6d75
	dw $706a
	dw $730d
	dw $75fa
	dw $78d7
	dw $6759
	dw $6a29
	dw $6d24
	dw $700f
	dw $72d5
	dw $7603
	dw $64fe
	dw $67e2
	dw $6a74
	dw $6d9f
	dw $7048
	dw $72f0
	dw $6b90
	dw $6e1d
	dw $709f
	dw $72e5
	dw $7598
	dw $78a4
	dw $6c8e
	dw $6fb0
	dw $725c
	dw $758e
	dw $786d
	dw $7b9c
	dw $61f4
	dw $64ae
	dw $67a3
	dw $6a79
	dw $6d5c
	dw $703d
	dw $6e4f
	dw $70f8
	dw $73ac
	dw $793d
	dw $7c28
	dw $765c
	dw $6436
	dw $66de
	dw $6988
	dw $6c3b
	dw $6f3b
	dw $7192
	dw $55a5
	dw $584a
	dw $5b7f
	dw $5eb0
	dw $61dd
	dw $64a3
	dw $699e
	dw $6c52
	dw $6f8d
	dw $72b2
	dw $7599
	dw $781c
	dw $67c8
	dw $6aa5
	dw $6d9c
	dw $70e2
	dw $7424
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

TileMapsPointers: ; c09d1 (30:49d1)
	dw $6e0b
	dw $70ef
	dw $73cc
	dw $76b4
	dw $7939
	dw $7bbe
	dw $6ef7
	dw $71e5
	dw $7481
	dw $778f
	dw $7a86
	dw $7d99
	dw $663f
	dw $68d1
	dw $6b73
	dw $6e1d
	dw $70cd
	dw $73c3
	dw $6f97
	dw $7238
	dw $752c
	dw $7864
	dw $7b43
	dw $7de2
	dw $6cb7
	dw $6f75
	dw $726a
	dw $750d
	dw $77fa
	dw $7ad7
	dw $6959
	dw $6c29
	dw $6f24
	dw $720f
	dw $74d5
	dw $7803
	dw $66fe
	dw $69e2
	dw $6c74
	dw $6f9f
	dw $7248
	dw $74f0
	dw $6d90
	dw $701d
	dw $729f
	dw $74e5
	dw $7798
	dw $7aa4
	dw $6e8e
	dw $71b0
	dw $745c
	dw $778e
	dw $7a6d
	dw $7d9c
	dw $63f4
	dw $66ae
	dw $69a3
	dw $6c79
	dw $6f5c
	dw $723d
	dw $704f
	dw $72f8
	dw $75ac
	dw $7b3d
	dw $7e28
	dw $785c
	dw $6636
	dw $68de
	dw $6b88
	dw $6e3b
	dw $713b
	dw $7392
	dw $57a5
	dw $5a4a
	dw $5d7f
	dw $60b0
	dw $63dd
	dw $66a3
	dw $6b9e
	dw $6e52
	dw $718d
	dw $74b2
	dw $7799
	dw $7a1c
	dw $69c8
	dw $6ca5
	dw $6f9c
	dw $72e2
	dw $7624
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

ForegroundTilesPointers: ; c0a95 (30:4a95)
	dw ForegroundTiles0
	dw ForegroundTiles1
	dw ForegroundTiles2
	dw ForegroundTiles3
	dw ForegroundTiles4
	dw ForegroundTiles5
	dw ForegroundTiles6
	dw ForegroundTiles7
	dw ForegroundTiles8
	dw ForegroundTiles9
	dw ForegroundTiles10
	dw ForegroundTiles11
	dw ForegroundTiles12
	dw ForegroundTiles13
	dw ForegroundTiles14
	dw ForegroundTiles15
	dw ForegroundTiles16
	dw ForegroundTiles17
	dw ForegroundTiles18
	dw ForegroundTiles19
	dw ForegroundTiles20
	dw ForegroundTiles21
	dw ForegroundTiles22
	dw ForegroundTiles23
	dw ForegroundTiles24
	dw ForegroundTiles25
	dw ForegroundTiles26
	dw ForegroundTiles27
	dw ForegroundTiles28
	dw ForegroundTiles29
	dw ForegroundTiles30
	dw ForegroundTiles31
	dw ForegroundTiles32
	dw ForegroundTiles33
	dw ForegroundTiles34
	dw ForegroundTiles35
	dw ForegroundTiles36
	dw ForegroundTiles37
	dw ForegroundTiles38
	dw ForegroundTiles39
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

BackgroundTilesPointers: ; c0af7 (30:4af7)
	dw BackgroundTiles0
	dw BackgroundTiles1
	dw BackgroundTiles2
	dw BackgroundTiles3
	dw BackgroundTiles4
	dw BackgroundTiles5
	dw BackgroundTiles6
	dw BackgroundTiles7
	dw BackgroundTiles8
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL

PalPointers: ; c0b1b (30:4b1b)
	dw Pals_cc000
	dw Pals_cc040
	dw Pals_cc080
	dw Pals_cc0c0
	dw Pals_cc100
	dw Pals_cc140
	dw Pals_cc180
	dw Pals_cc1c0
	dw Pals_cc200
	dw Pals_cc240
	dw Pals_cc280
	dw Pals_cc2c0
	dw Pals_cc300
	dw Pals_cc340
	dw Pals_cc380
	dw Pals_cc3c0
	dw Pals_cc400
	dw Pals_cc440
	dw Pals_cc480
	dw Pals_cc4c0
	dw Pals_cc500
	dw Pals_cc540
	dw Pals_cc580
	dw Pals_cc5c0
	dw Pals_cc600
	dw Pals_cc640
	dw Pals_cc680
	dw Pals_cc6c0
	dw Pals_cc700
	dw Pals_cc740
	dw Pals_cc780
	dw Pals_cc7c0
	dw Pals_cc800
	dw Pals_cc840
	dw Pals_cc880
	dw Pals_cc8c0
	dw Pals_cc900
	dw Pals_cc940
	dw Pals_cc980
	dw Pals_cc9c0
	dw Pals_cca00
	dw Pals_cca40
	dw Pals_cca80
	dw Pals_ccac0
	dw Pals_ccb00
	dw Pals_ccb40
	dw Pals_ccb80
	dw Pals_ccbc0
	dw Pals_ccc00
	dw Pals_ccc40
	dw Pals_ccc80
	dw Pals_cccc0
	dw Pals_ccd00
	dw Pals_ccd40
	dw Pals_ccd80
	dw Pals_ccdc0
	dw Pals_cce00
	dw Pals_cce40
	dw Pals_cce80
	dw Pals_ccec0
	dw Pals_ccf00
	dw Pals_ccf40
	dw Pals_ccf80
	dw Pals_ccfc0
	dw Pals_cd000
	dw Pals_cd040
	dw Pals_cd080
	dw Pals_cd0c0
	dw Pals_cd100
	dw Pals_cd140
	dw Pals_cd180
	dw Pals_cd1c0
	dw Pals_cd200
	dw Pals_cd240
	dw Pals_cd280
	dw Pals_cd2c0
	dw Pals_cd300
	dw Pals_cd340
	dw Pals_cd380
	dw Pals_cd3c0
	dw Pals_cd400
	dw Pals_cd440
	dw Pals_cd480
	dw Pals_cd4c0
	dw Pals_cd500
	dw Pals_cd540
	dw Pals_cd580
	dw Pals_cd5c0
	dw Pals_cd600
	dw Pals_cd640
	dw Pals_cd680
	dw Pals_cd6c0
	dw Pals_cd700
	dw Pals_cd740
	dw Pals_cd780
	dw Pals_cd7c0
	dw Pals_cd800
	dw Pals_cd840
	dw Pals_cd880
	dw Pals_cd8c0
	dw Pals_cd900
	dw Pals_cd940
	dw Pals_cd980
	dw Pals_cd9c0
	dw Pals_cda00
	dw Pals_cda40
	dw Pals_cda80
	dw Pals_cdac0
	dw Pals_cdb00
	dw Pals_cdb40
	dw Pals_cdb80
	dw Pals_cdbc0
	dw Pals_cdc00
	dw Pals_cdc40
	dw Pals_cdc80
	dw Pals_cdcc0
	dw Pals_cdd00
	dw Pals_cdd40
	dw Pals_cdd80
	dw Pals_cddc0
	dw Pals_cde00
	dw Pals_cde40
	dw Pals_cde80
	dw Pals_cdec0
	dw Pals_cdf00
	dw Pals_cdf40
	dw Pals_cdf80
	dw Pals_cdfc0
	dw Pals_ce000
	dw Pals_ce040
	dw Pals_ce080
	dw Pals_ce0c0
	dw Pals_ce100
	dw Pals_ce140
	dw Pals_ce180
	dw Pals_ce1c0
	dw Pals_ce200
	dw Pals_ce240
	dw Pals_ce280
	dw Pals_ce2c0
	dw Pals_ce300
	dw Pals_ce340
	dw Pals_ce380
	dw Pals_ce3c0
	dw Pals_ce400
	dw Pals_ce440
; 0xc0c3f

rept $12
	db $ff
endr

PointerTable_c0c51: ; c0c51 (30:4c51)
	dw .data_c0c79
	dw .data_c0c82
	dw .data_c0c8b
	dw .data_c0c94
	dw .data_c0c9d
	dw .data_c0ca6
	dw .data_c0caf
	dw .data_c0cb8
	dw .data_c0cc1
	dw .data_c0cca
	dw .data_c0cd3
	dw .data_c0cdc
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79
	dw .data_c0c79

.data_c0c79
	db $00, $00, $00, $00, $00, $00, $00, $00, $00

.data_c0c82
	db $02, $02, $02, $03, $73, $74, $73, $03, $0b

.data_c0c8b
	db $31, $31, $55, $56, $57, $57, $56, $55, $0d

.data_c0c94
	db $24, $24, $24, $58, $59, $59, $59, $58, $16

.data_c0c9d
	db $5a, $5a, $5a, $5b, $5c, $5c, $5c, $5b, $16

.data_c0ca6
	db $57, $57, $5e, $5f, $60, $60, $5f, $5e, $0d

.data_c0caf
	db $65, $65, $65, $66, $67, $67, $67, $66, $16

.data_c0cb8
	db $68, $68, $68, $69, $6a, $6a, $6a, $69, $16

.data_c0cc1
	db $2f, $76, $77, $78, $79, $7a, $7b, $7c, $10

.data_c0cca
	db $44, $7d, $7e, $7f, $80, $81, $82, $83, $10

.data_c0cd3
	db $45, $84, $85, $86, $87, $88, $89, $8a, $10

.data_c0cdc
	db $46, $8b, $8c, $8d, $8e, $8f, $90, $91, $10

Data_c0ce5: ; c0ce5 (30:4ce5)
	db $00, $00
	db $02, $00
	db $0b, $01
	db $06, $02
	db $05, $03
	db $0b, $04
	db $06, $05
	db $06, $06
	db $09, $07
	db $06, $08
	db $06, $09
	db $06, $0a
	db $03, $0b
	db $02, $0c
	db $0b, $0d
	db $08, $0e
	db $06, $0f
	db $06, $10
	db $06, $11
	db $05, $12
	db $09, $13

	ds $10

Data_c0d1f: ; c0d1f (30:4d1f)
	dw .data_c0d5b
	dw NULL
	dw .data_c0d63
	dw .data_c0d6b
	dw .data_c0d73
	dw .data_c0d7b
	dw .data_c0d83
	dw NULL
	dw NULL
	dw NULL
	dw .data_c0d8b
	dw .data_c0d93
	dw .data_c0d9b
	dw .data_c0da3
	dw .data_c0dab
	dw .data_c0db3
	dw .data_c0dbb
	dw .data_c0dc3
	dw .data_c0dcb
	dw .data_c0dd3
	dw NULL
	dw .data_c0ddb
	dw NULL
	dw .data_c0de3
	dw NULL
	dw NULL
	dw .data_c0deb
	dw .data_c0df3
	dw NULL
	dw .data_c0dfb

.data_c0d5b
	db $20, $23, $02, $18, $0a, $01, $00, $01

.data_c0d63
	db $16, $02, $67, $08, $07, $01, $00, $0a

.data_c0d6b
	db $19, $03, $7a, $38, $09, $01, $00, $01

.data_c0d73
	db $22, $03, $23, $08, $07, $01, $00, $0a

.data_c0d7b
	db $10, $12, $01, $21, $14, $01, $00, $01

.data_c0d83
	db $01, $01, $12, $18, $24, $01, $00, $0a

.data_c0d8b
	db $05, $01, $36, $28, $01, $01, $00, $01

.data_c0d93
	db $06, $02, $67, $08, $07, $01, $00, $0a

.data_c0d9b
	db $04, $01, $36, $28, $01, $01, $00, $01

.data_c0da3
	db $27, $03, $7a, $38, $09, $01, $00, $01

.data_c0dab
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c0db3
	db $29, $03, $7a, $38, $09, $01, $00, $01

.data_c0dbb
	db $02, $03, $23, $08, $07, $01, $00, $0a

.data_c0dc3
	db $21, $23, $02, $18, $0a, $01, $00, $01

.data_c0dcb
	db $23, $23, $37, $01, $03, $03, $00, $06

.data_c0dd3
	db $03, $01, $36, $28, $01, $01, $00, $01

.data_c0ddb
	db $17, $03, $7a, $38, $09, $01, $00, $01

.data_c0de3
	db $18, $03, $7a, $38, $09, $01, $00, $01

.data_c0deb
	db $12, $12, $23, $81, $07, $01, $00, $0a

.data_c0df3
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c0dfb
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c0e03: ; c0e03 (30:4e03)
	dw .data_c0e3f
	dw NULL
	dw .data_c0e47
	dw .data_c0e4f
	dw .data_c0e57
	dw .data_c0e5f
	dw .data_c0e67
	dw NULL
	dw NULL
	dw NULL
	dw .data_c0e6f
	dw .data_c0e77
	dw .data_c0e7f
	dw .data_c0e87
	dw .data_c0e8f
	dw .data_c0e97
	dw .data_c0e9f
	dw .data_c0ea7
	dw .data_c0eaf
	dw .data_c0eb7
	dw NULL
	dw .data_c0ebf
	dw NULL
	dw .data_c0ec7
	dw NULL
	dw NULL
	dw .data_c0ecf
	dw .data_c0ed7
	dw NULL
	dw .data_c0edf

.data_c0e3f
	db $20, $23, $02, $18, $0a, $01, $00, $01

.data_c0e47
	db $16, $02, $67, $08, $07, $01, $00, $0a

.data_c0e4f
	db $19, $03, $7a, $38, $09, $01, $00, $01

.data_c0e57
	db $22, $03, $23, $08, $07, $01, $00, $0a

.data_c0e5f
	db $10, $12, $01, $21, $14, $01, $00, $01

.data_c0e67
	db $01, $01, $12, $08, $07, $01, $00, $0a

.data_c0e6f
	db $05, $01, $36, $28, $01, $01, $00, $01

.data_c0e77
	db $06, $02, $67, $08, $24, $01, $00, $0a

.data_c0e7f
	db $04, $01, $36, $28, $01, $01, $00, $01

.data_c0e87
	db $27, $03, $7a, $38, $09, $01, $00, $01

.data_c0e8f
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c0e97
	db $29, $03, $7a, $38, $09, $01, $00, $01

.data_c0e9f
	db $02, $03, $23, $08, $07, $01, $00, $0a

.data_c0ea7
	db $21, $23, $02, $18, $0a, $01, $00, $01

.data_c0eaf
	db $23, $23, $37, $01, $05, $03, $00, $08

.data_c0eb7
	db $03, $01, $36, $28, $01, $01, $00, $01

.data_c0ebf
	db $17, $03, $7a, $38, $09, $01, $00, $01

.data_c0ec7
	db $18, $03, $7a, $38, $09, $01, $00, $01

.data_c0ecf
	db $12, $12, $23, $81, $07, $01, $00, $0a

.data_c0ed7
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c0edf
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c0ee7: ; c0ee7 (30:4ee7)
	dw .data_c0f23
	dw NULL
	dw .data_c0f2b
	dw .data_c0f33
	dw .data_c0f3b
	dw .data_c0f43
	dw .data_c0f4b
	dw NULL
	dw NULL
	dw NULL
	dw .data_c0f53
	dw .data_c0f5b
	dw .data_c0f63
	dw .data_c0f6b
	dw .data_c0f73
	dw .data_c0f7b
	dw .data_c0f83
	dw .data_c0f8b
	dw .data_c0f93
	dw .data_c0f9b
	dw NULL
	dw .data_c0fa3
	dw NULL
	dw .data_c0fab
	dw NULL
	dw NULL
	dw .data_c0fb3
	dw .data_c0fbb
	dw NULL
	dw .data_c0fc3

.data_c0f23
	db $20, $23, $02, $18, $0a, $01, $00, $03

.data_c0f2b
	db $16, $02, $67, $08, $72, $01, $00, $0a

.data_c0f33
	db $19, $03, $7a, $38, $09, $01, $00, $03

.data_c0f3b
	db $22, $03, $23, $08, $72, $01, $00, $0a

.data_c0f43
	db $10, $12, $01, $21, $14, $01, $00, $03

.data_c0f4b
	db $01, $01, $12, $18, $24, $01, $00, $0a

.data_c0f53
	db $05, $01, $36, $28, $01, $01, $00, $03

.data_c0f5b
	db $06, $02, $67, $08, $72, $01, $00, $0a

.data_c0f63
	db $04, $01, $36, $28, $01, $01, $00, $03

.data_c0f6b
	db $27, $03, $7a, $38, $09, $01, $00, $03

.data_c0f73
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c0f7b
	db $29, $03, $7a, $38, $09, $01, $00, $03

.data_c0f83
	db $02, $03, $23, $08, $72, $01, $00, $0a

.data_c0f8b
	db $21, $23, $02, $18, $0a, $01, $00, $03

.data_c0f93
	db $23, $23, $37, $01, $05, $03, $00, $08

.data_c0f9b
	db $03, $01, $36, $28, $01, $01, $00, $03

.data_c0fa3
	db $17, $03, $7a, $38, $09, $01, $00, $03

.data_c0fab
	db $18, $03, $7a, $38, $09, $01, $00, $03

.data_c0fb3
	db $12, $12, $23, $81, $72, $01, $00, $0a

.data_c0fbb
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c0fc3
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c0fcb: ; c0fcb (30:4fcb)
	dw .data_c1007
	dw NULL
	dw .data_c100f
	dw .data_c1017
	dw .data_c101f
	dw .data_c1027
	dw .data_c102f
	dw NULL
	dw NULL
	dw NULL
	dw .data_c1037
	dw .data_c103f
	dw .data_c1047
	dw .data_c104f
	dw .data_c1057
	dw .data_c105f
	dw .data_c1067
	dw .data_c106f
	dw .data_c1077
	dw .data_c107f
	dw NULL
	dw .data_c1087
	dw NULL
	dw .data_c108f
	dw NULL
	dw NULL
	dw .data_c1097
	dw .data_c109f
	dw NULL
	dw .data_c10a7

.data_c1007
	db $20, $23, $02, $18, $0a, $01, $00, $02

.data_c100f
	db $16, $02, $67, $08, $07, $01, $00, $0b

.data_c1017
	db $19, $03, $7a, $38, $09, $01, $00, $02

.data_c101f
	db $22, $03, $23, $08, $07, $01, $00, $02

.data_c1027
	db $10, $12, $01, $21, $14, $01, $00, $02

.data_c102f
	db $01, $01, $12, $08, $24, $01, $00, $0b

.data_c1037
	db $05, $01, $36, $28, $01, $01, $00, $02

.data_c103f
	db $06, $02, $67, $08, $07, $01, $00, $0b

.data_c1047
	db $04, $01, $36, $28, $01, $01, $00, $02

.data_c104f
	db $27, $03, $7a, $38, $09, $01, $00, $02

.data_c1057
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c105f
	db $29, $03, $7a, $38, $09, $01, $00, $02

.data_c1067
	db $02, $03, $23, $08, $07, $01, $00, $0b

.data_c106f
	db $21, $23, $02, $18, $0a, $01, $00, $02

.data_c1077
	db $23, $23, $37, $01, $04, $03, $00, $07

.data_c107f
	db $03, $01, $36, $28, $01, $01, $00, $02

.data_c1087
	db $17, $03, $7a, $38, $09, $01, $00, $02

.data_c108f
	db $18, $03, $7a, $38, $09, $01, $00, $02

.data_c1097
	db $12, $12, $23, $81, $07, $01, $00, $0b

.data_c109f
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c10a7
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c10af: ; c10af (30:50af)
	dw .data_c10eb
	dw NULL
	dw .data_c10f3
	dw .data_c10fb
	dw .data_c1103
	dw .data_c110b
	dw .data_c1113
	dw NULL
	dw NULL
	dw NULL
	dw .data_c111b
	dw .data_c1123
	dw .data_c112b
	dw .data_c1133
	dw .data_c113b
	dw .data_c1143
	dw .data_c114b
	dw .data_c1153
	dw .data_c115b
	dw .data_c1163
	dw NULL
	dw .data_c116b
	dw NULL
	dw .data_c1173
	dw NULL
	dw NULL
	dw .data_c117b
	dw .data_c1183
	dw NULL
	dw .data_c118b

.data_c10eb
	db $20, $23, $02, $18, $0a, $01, $00, $02

.data_c10f3
	db $16, $02, $67, $08, $07, $01, $00, $0b

.data_c10fb
	db $19, $03, $7a, $38, $09, $01, $00, $02

.data_c1103
	db $22, $03, $23, $08, $07, $01, $00, $02

.data_c110b
	db $10, $12, $01, $21, $14, $01, $00, $02

.data_c1113
	db $01, $01, $12, $08, $24, $01, $00, $0b

.data_c111b
	db $05, $01, $36, $28, $01, $01, $00, $02

.data_c1123
	db $06, $02, $67, $08, $07, $01, $00, $0b

.data_c112b
	db $04, $01, $36, $28, $01, $01, $00, $02

.data_c1133
	db $27, $03, $7a, $38, $09, $01, $00, $02

.data_c113b
	db $14, $12, $36, $08, $02, $02, $01, $05

.data_c1143
	db $29, $03, $7a, $38, $09, $01, $00, $02

.data_c114b
	db $02, $03, $23, $08, $07, $01, $00, $0b

.data_c1153
	db $21, $23, $02, $18, $0a, $01, $00, $02

.data_c115b
	db $23, $23, $37, $01, $06, $03, $00, $09

.data_c1163
	db $03, $01, $36, $28, $01, $01, $00, $02

.data_c116b
	db $17, $03, $7a, $38, $09, $01, $00, $02

.data_c1173
	db $18, $03, $7a, $38, $09, $01, $00, $02

.data_c117b
	db $12, $12, $23, $81, $07, $01, $00, $0b

.data_c1183
	db $13, $12, $36, $08, $02, $02, $01, $05

.data_c118b
	db $15, $12, $36, $08, $02, $02, $01, $05


Data_c1193: ; c1193 (30:5193)
	dw $51cf
	dw NULL
	dw $51d7
	dw $51df
	dw $51e7
	dw $51ef
	dw $51f7
	dw NULL
	dw NULL
	dw NULL
	dw $51ff
	dw $5207
	dw $520f
	dw $5217
	dw $521f
	dw $5227
	dw $522f
	dw $5237
	dw $523f
	dw $5247
	dw NULL
	dw $524f
	dw NULL
	dw $5257
	dw NULL
	dw NULL
	dw $525f
	dw $5267
	dw NULL
	dw $526f
	db $20, $23, $02, $18, $0a, $01, $00, $04, $16, $02, $67, $08, $72, $01, $00, $0b, $19, $03, $7a, $38, $09, $01, $00, $04, $22, $03, $23, $08, $72, $01, $00, $0b, $10, $12, $01, $21, $14, $01, $00, $04, $01, $01, $12, $18, $24, $01, $00, $0b, $05, $01, $36, $28, $01, $01, $00, $04, $06, $02, $67, $08, $72, $01, $00, $0b, $04, $01, $36, $28, $01, $01, $00, $04, $27, $03, $7a, $38, $09, $01, $00, $04, $14, $12, $36, $08, $02, $02, $01, $05, $29, $03, $7a, $38, $09, $01, $00, $04, $02, $03, $23, $08, $72, $01, $00, $0b, $21, $23, $02, $18, $0a, $01, $00, $04, $23, $23, $37, $01, $06, $03, $00, $09, $03, $01, $36, $28, $01, $01, $00, $04, $17, $03, $7a, $38, $09, $01, $00, $04, $18, $03, $7a, $38, $09, $01, $00, $04, $12, $12, $23, $81, $72, $01, $00, $0b, $13, $12, $36, $08, $02, $02, $01, $05, $15, $12, $36, $08, $02, $02, $01, $05

Data_c1277: ; c1277 (30:5277)
	dw $52b3
	dw $52bb
	dw $52c3
	dw $52cb
	dw $52d3
	dw $52db
	dw $52e3
	dw NULL
	dw $52eb
	dw $52f3
	dw $52fb
	dw NULL
	dw $5303
	dw $530b
	dw $5313
	dw $531b
	dw $5323
	dw $532b
	dw NULL
	dw $5333
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $533b
	dw $5343
	dw $534b
	dw $5353
	dw NULL
	db $11, $02, $15, $01, $35, $00, $00, $0c, $05, $02, $56, $08, $0b, $00, $00, $0e, $06, $02, $67, $08, $3a, $00, $00, $0e, $26, $23, $67, $28, $35, $03, $00, $0e, $19, $02, $8a, $08, $0f, $00, $00, $0e, $01, $02, $15, $01, $35, $00, $00, $0c, $02, $02, $15, $01, $35, $00, $00, $0c, $27, $23, $78, $08, $23, $03, $00, $0e, $28, $23, $8a, $11, $57, $0b, $00, $0e, $15, $02, $56, $08, $0b, $00, $00, $0e, $16, $02, $67, $08, $3a, $00, $00, $0e, $18, $02, $8a, $08, $0f, $00, $00, $0e, $17, $12, $78, $01, $0d, $03, $00, $0e, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $35, $00, $00, $0c, $14, $02, $15, $01, $35, $00, $00, $0c, $04, $02, $15, $01, $35, $00, $00, $0c, $13, $02, $15, $01, $35, $00, $00, $0c, $03, $02, $15, $01, $35, $00, $00, $0c, $08, $02, $8a, $08, $0f, $00, $00, $0e, $09, $02, $8a, $08, $0f, $00, $00, $0e

Data_c135b: ; c135b (30:535b)
	dw $5397
	dw $539f
	dw $53a7
	dw $53af
	dw $53b7
	dw $53bf
	dw $53c7
	dw NULL
	dw $53cf
	dw $53d7
	dw $53df
	dw NULL
	dw $53e7
	dw $53ef
	dw $53f7
	dw $53ff
	dw $5407
	dw $540f
	dw NULL
	dw $5417
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $541f
	dw $5427
	dw $542f
	dw $5437
	dw NULL
	db $11, $02, $15, $01, $08, $00, $00, $0c, $05, $02, $56, $08, $0b, $00, $00, $0e, $06, $02, $67, $08, $3a, $00, $00, $0e, $26, $23, $67, $28, $08, $03, $00, $0e, $19, $02, $8a, $08, $0f, $00, $00, $0e, $01, $02, $15, $01, $08, $00, $00, $0c, $02, $02, $15, $01, $08, $00, $00, $0c, $27, $23, $78, $08, $23, $03, $00, $0e, $28, $23, $8a, $11, $57, $0b, $00, $0e, $15, $02, $56, $08, $0b, $00, $00, $0e, $16, $02, $67, $08, $3a, $00, $00, $0e, $18, $02, $8a, $08, $0f, $00, $00, $0e, $17, $12, $78, $01, $0d, $03, $00, $0e, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $08, $00, $00, $0c, $14, $02, $15, $01, $08, $00, $00, $0c, $04, $02, $15, $01, $08, $00, $00, $0c, $13, $02, $15, $01, $08, $00, $00, $0c, $03, $02, $15, $01, $08, $00, $00, $0c, $08, $02, $8a, $08, $0f, $00, $00, $0e, $09, $02, $8a, $08, $0f, $00, $00, $0e

Data_c143f: ; c143f (30:543f)
	dw $547b
	dw $5483
	dw $548b
	dw $5493
	dw $549b
	dw $54a3
	dw $54ab
	dw NULL
	dw $54b3
	dw $54bb
	dw $54c3
	dw NULL
	dw $54cb
	dw $54d3
	dw $54db
	dw $54e3
	dw $54eb
	dw $54f3
	dw NULL
	dw $54fb
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5503
	dw $550b
	dw $5513
	dw $551b
	dw NULL
	db $11, $02, $15, $01, $36, $00, $00, $0d, $05, $02, $56, $08, $0b, $00, $00, $11, $06, $02, $67, $08, $3a, $00, $00, $11, $26, $23, $67, $28, $36, $03, $00, $11, $19, $02, $8a, $08, $0f, $00, $00, $11, $01, $02, $15, $01, $36, $00, $00, $0d, $02, $02, $15, $01, $36, $00, $00, $0d, $27, $23, $78, $08, $23, $03, $00, $1a, $28, $23, $8a, $11, $57, $0b, $00, $1a, $15, $02, $56, $08, $0b, $00, $00, $11, $16, $02, $67, $08, $3a, $00, $00, $11, $18, $02, $8a, $08, $0f, $00, $00, $11, $17, $12, $78, $01, $0d, $03, $00, $11, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $36, $00, $00, $0d, $14, $02, $15, $01, $36, $00, $00, $0d, $04, $02, $15, $01, $36, $00, $00, $0d, $13, $02, $15, $01, $36, $00, $00, $0d, $03, $02, $15, $01, $36, $00, $00, $0d, $08, $02, $8a, $08, $0f, $00, $00, $11, $09, $02, $8a, $08, $0f, $00, $00, $11

Data_c1523: ; c1523 (30:5523)
	dw $555f
	dw $5567
	dw $556f
	dw $5577
	dw $557f
	dw $5587
	dw $558f
	dw NULL
	dw $5597
	dw $559f
	dw $55a7
	dw NULL
	dw $55af
	dw $55b7
	dw $55bf
	dw $55c7
	dw $55cf
	dw $55d7
	dw NULL
	dw $55df
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $55e7
	dw $55ef
	dw $55f7
	dw $55ff
	dw NULL
	db $11, $02, $15, $01, $11, $00, $00, $0d, $05, $02, $56, $08, $0b, $00, $00, $11, $06, $02, $67, $08, $3a, $00, $00, $11, $26, $23, $67, $28, $11, $03, $00, $11, $19, $02, $8a, $08, $0f, $00, $00, $11, $01, $02, $15, $01, $11, $00, $00, $0d, $02, $02, $15, $01, $11, $00, $00, $0d, $27, $23, $78, $08, $23, $03, $00, $1a, $28, $23, $8a, $11, $57, $0b, $00, $1a, $15, $02, $56, $08, $0b, $00, $00, $11, $16, $02, $67, $08, $3a, $00, $00, $11, $18, $02, $8a, $08, $0f, $00, $00, $11, $17, $12, $78, $01, $0d, $03, $00, $11, $20, $23, $06, $08, $1c, $04, $00, $0f, $12, $02, $15, $01, $11, $00, $00, $0d, $14, $02, $15, $01, $11, $00, $00, $0d, $04, $02, $15, $01, $11, $00, $00, $0d, $13, $02, $15, $01, $11, $00, $00, $0d, $03, $02, $15, $01, $11, $00, $00, $0d, $08, $02, $8a, $08, $0f, $00, $00, $11, $09, $02, $8a, $08, $0f, $00, $00, $11

Data_c1607: ; c1607 (30:5607)
	dw $5643
	dw NULL
	dw NULL
	dw $564b
	dw NULL
	dw NULL
	dw NULL
	dw $5653
	dw NULL
	dw $565b
	dw $5663
	dw $566b
	dw NULL
	dw NULL
	dw $5673
	dw $567b
	dw $5683
	dw $5683
	dw $5683
	dw $5683
	dw $568b
	dw $568b
	dw $5693
	dw $569b
	dw NULL
	dw $56a3
	dw $56ab
	dw $56b3
	dw NULL
	dw $56bb
	db $01, $02, $16, $18, $0c, $03, $00, $43, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $15, $00, $00, $4a, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $15, $00, $00, $4a, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $43, $06, $02, $6a, $81, $15, $00, $00, $4a, $11, $02, $16, $18, $0c, $03, $00, $43, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $43, $15, $02, $16, $18, $0c, $03, $00, $43, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c16c3: ; c16c3 (30:56c3)
	dw $56ff
	dw NULL
	dw NULL
	dw $5707
	dw NULL
	dw NULL
	dw NULL
	dw $570f
	dw NULL
	dw $5717
	dw $571f
	dw $5727
	dw NULL
	dw NULL
	dw $572f
	dw $5737
	dw $573f
	dw $573f
	dw $573f
	dw $573f
	dw $5747
	dw $5747
	dw $574f
	dw $5757
	dw NULL
	dw $575f
	dw $5767
	dw $576f
	dw NULL
	dw $5777
	db $01, $02, $16, $18, $0c, $03, $00, $10, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $15, $00, $00, $4a, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $15, $00, $00, $4a, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $10, $06, $02, $6a, $81, $15, $00, $00, $4a, $11, $02, $16, $18, $0c, $03, $00, $10, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $10, $15, $02, $16, $18, $0c, $03, $00, $10, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c177f: ; c177f (30:577f)
	dw $57bb
	dw NULL
	dw NULL
	dw $57c3
	dw NULL
	dw NULL
	dw NULL
	dw $57cb
	dw NULL
	dw $57d3
	dw $57db
	dw $57e3
	dw NULL
	dw NULL
	dw $57eb
	dw $57f3
	dw $57fb
	dw $57fb
	dw $57fb
	dw $57fb
	dw $5803
	dw $5803
	dw $580b
	dw $5813
	dw NULL
	dw $581b
	dw $5823
	dw $582b
	dw NULL
	dw $5833
	db $01, $02, $16, $18, $0c, $03, $00, $44, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $38, $00, $00, $4b, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $38, $00, $00, $4b, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $44, $06, $02, $6a, $81, $38, $00, $00, $4b, $11, $02, $16, $18, $0c, $03, $00, $44, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $44, $15, $02, $16, $18, $0c, $03, $00, $44, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c183b: ; c183b (30:583b)
	dw $5877
	dw NULL
	dw NULL
	dw $587f
	dw NULL
	dw NULL
	dw NULL
	dw $5887
	dw NULL
	dw $588f
	dw $5897
	dw $589f
	dw NULL
	dw NULL
	dw $58a7
	dw $58af
	dw $58b7
	dw $58b7
	dw $58b7
	dw $58b7
	dw $58bf
	dw $58bf
	dw $58c7
	dw $58cf
	dw NULL
	dw $58d7
	dw $58df
	dw $58e7
	dw NULL
	dw $58ef
	db $01, $02, $16, $18, $0c, $03, $00, $3c, $20, $23, $02, $08, $13, $00, $00, $19, $07, $02, $6a, $81, $38, $00, $00, $4b, $10, $12, $01, $01, $16, $03, $00, $19, $09, $02, $6a, $81, $38, $00, $00, $4b, $22, $23, $25, $08, $0e, $03, $00, $19, $25, $23, $56, $01, $18, $03, $00, $19, $26, $23, $69, $21, $30, $0b, $00, $3d, $04, $02, $16, $18, $0c, $03, $00, $3c, $06, $02, $6a, $81, $38, $00, $00, $4b, $11, $02, $16, $18, $0c, $03, $00, $3c, $23, $23, $25, $08, $0e, $03, $00, $19, $13, $02, $16, $18, $0c, $03, $00, $3c, $15, $02, $16, $18, $0c, $03, $00, $3c, $29, $23, $9a, $01, $28, $0b, $00, $19, $27, $23, $69, $21, $30, $0b, $00, $3d

Data_c18f7: ; c18f7 (30:58f7)
	dw $5933
	dw $593b
	dw NULL
	dw $5943
	dw $594b
	dw $5953
	dw NULL
	dw $595b
	dw $5963
	dw $596b
	dw $5973
	dw NULL
	dw NULL
	dw NULL
	dw $597b
	dw $5983
	dw $598b
	dw NULL
	dw $5993
	dw $599b
	dw $59a3
	dw $59ab
	dw $59b3
	dw $59bb
	dw $59c3
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $59cb
	db $02, $01, $19, $11, $58, $06, $00, $12, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $12, $16, $12, $58, $11, $03, $0d, $00, $12, $08, $01, $19, $11, $58, $06, $00, $12, $15, $12, $58, $11, $03, $0d, $00, $12, $14, $12, $05, $21, $03, $06, $00, $12, $09, $02, $9a, $38, $45, $0d, $00, $12, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $12, $03, $01, $19, $11, $58, $06, $00, $12, $04, $01, $19, $11, $58, $06, $00, $12, $07, $01, $19, $11, $58, $06, $00, $12, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $12, $05, $01, $19, $11, $58, $06, $00, $12

Data_c19d3: ; c19d3 (30:59d3)
	dw $5a0f
	dw $5a17
	dw NULL
	dw $5a1f
	dw $5a27
	dw $5a2f
	dw NULL
	dw $5a37
	dw $5a3f
	dw $5a47
	dw $5a4f
	dw NULL
	dw NULL
	dw NULL
	dw $5a57
	dw $5a5f
	dw $5a67
	dw NULL
	dw $5a6f
	dw $5a77
	dw $5a7f
	dw $5a87
	dw $5a8f
	dw $5a97
	dw $5a9f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5aa7
	db $02, $01, $19, $11, $58, $06, $00, $66, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $66, $16, $12, $58, $11, $03, $0d, $00, $66, $08, $01, $19, $11, $58, $06, $00, $66, $15, $12, $58, $11, $03, $0d, $00, $66, $14, $12, $05, $21, $03, $06, $00, $66, $09, $02, $9a, $38, $45, $0d, $00, $66, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $66, $03, $01, $19, $11, $58, $06, $00, $66, $04, $01, $19, $11, $58, $06, $00, $66, $07, $01, $19, $11, $58, $06, $00, $66, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $66, $05, $01, $19, $11, $58, $06, $00, $66

Data_c1aaf: ; c1aaf (30:5aaf)
	dw $5aeb
	dw $5af3
	dw NULL
	dw $5afb
	dw $5b03
	dw $5b0b
	dw NULL
	dw $5b13
	dw $5b1b
	dw $5b23
	dw $5b2b
	dw NULL
	dw NULL
	dw NULL
	dw $5b33
	dw $5b3b
	dw $5b43
	dw NULL
	dw $5b4b
	dw $5b53
	dw $5b5b
	dw $5b63
	dw $5b6b
	dw $5b73
	dw $5b7b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5b83
	db $02, $01, $19, $11, $58, $06, $00, $67, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $67, $16, $12, $58, $11, $03, $0d, $00, $67, $08, $01, $19, $11, $58, $06, $00, $67, $15, $12, $58, $11, $03, $0d, $00, $67, $14, $12, $05, $21, $03, $06, $00, $67, $09, $02, $9a, $38, $45, $0d, $00, $67, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $67, $03, $01, $19, $11, $58, $06, $00, $67, $04, $01, $19, $11, $58, $06, $00, $67, $07, $01, $19, $11, $58, $06, $00, $67, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $67, $05, $01, $19, $11, $58, $06, $00, $67

Data_c1b8b: ; c1b8b (30:5b8b)
	dw $5bc7
	dw $5bcf
	dw NULL
	dw $5bd7
	dw $5bdf
	dw $5be7
	dw NULL
	dw $5bef
	dw $5bf7
	dw $5bff
	dw $5c07
	dw NULL
	dw NULL
	dw NULL
	dw $5c0f
	dw $5c17
	dw $5c1f
	dw NULL
	dw $5c27
	dw $5c2f
	dw $5c37
	dw $5c3f
	dw $5c47
	dw $5c4f
	dw $5c57
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $5c5f
	db $02, $01, $19, $11, $58, $06, $00, $68, $24, $23, $36, $21, $4a, $13, $00, $13, $20, $23, $01, $08, $02, $13, $00, $13, $21, $23, $12, $08, $01, $13, $00, $13, $29, $23, $9a, $01, $6a, $13, $00, $13, $22, $23, $23, $08, $02, $13, $00, $13, $10, $12, $05, $21, $03, $06, $00, $68, $16, $12, $58, $11, $03, $0d, $00, $68, $08, $01, $19, $11, $58, $06, $00, $68, $15, $12, $58, $11, $03, $0d, $00, $68, $14, $12, $05, $21, $03, $06, $00, $68, $09, $02, $9a, $38, $45, $0d, $00, $68, $23, $23, $36, $21, $4a, $13, $00, $13, $17, $12, $58, $11, $03, $0d, $00, $68, $03, $01, $19, $11, $58, $06, $00, $68, $04, $01, $19, $11, $58, $06, $00, $68, $07, $01, $19, $11, $58, $06, $00, $68, $18, $13, $89, $11, $8b, $13, $00, $13, $01, $01, $19, $11, $58, $06, $00, $68, $05, $01, $19, $11, $58, $06, $00, $68

Data_c1c67: ; c1c67 (30:5c67)
	dw $5ca3
	dw NULL
	dw NULL
	dw NULL
	dw $5cab
	dw NULL
	dw NULL
	dw $5cb3
	dw NULL
	dw $5cbb
	dw $5cc3
	dw NULL
	dw $5ccb
	dw $5cd3
	dw $5cdb
	dw NULL
	dw NULL
	dw $5ce3
	dw NULL
	dw NULL
	dw $5ceb
	dw $5cf3
	dw NULL
	dw $5cfb
	dw NULL
	dw $5d03
	dw $5d0b
	dw $5d13
	dw $5d1b
	dw $5d23
	db $11, $02, $16, $01, $12, $06, $00, $14, $27, $23, $78, $28, $5b, $07, $00, $15, $12, $02, $16, $01, $12, $06, $00, $14, $13, $02, $16, $01, $12, $06, $00, $14, $29, $03, $9a, $01, $5d, $07, $00, $15, $07, $02, $69, $01, $59, $07, $00, $15, $09, $03, $9a, $01, $5d, $07, $00, $15, $20, $23, $04, $01, $03, $04, $00, $15, $28, $23, $89, $01, $5c, $07, $00, $15, $14, $02, $16, $01, $12, $06, $00, $14, $26, $23, $47, $01, $81, $04, $00, $15, $24, $23, $47, $01, $81, $04, $00, $15, $22, $23, $04, $01, $03, $04, $00, $15, $21, $23, $04, $01, $03, $04, $00, $15, $04, $02, $16, $01, $12, $06, $00, $14, $17, $02, $69, $01, $59, $07, $00, $15, $10, $12, $01, $01, $0e, $07, $00, $15

Data_c1d2b: ; c1d2b (30:5d2b)
	dw $5d67
	dw NULL
	dw NULL
	dw NULL
	dw $5d6f
	dw NULL
	dw NULL
	dw $5d77
	dw NULL
	dw $5d7f
	dw $5d87
	dw NULL
	dw $5d8f
	dw $5d97
	dw $5d9f
	dw NULL
	dw NULL
	dw $5da7
	dw NULL
	dw NULL
	dw $5daf
	dw $5db7
	dw NULL
	dw $5dbf
	dw NULL
	dw $5dc7
	dw $5dcf
	dw $5dd7
	dw $5ddf
	dw $5de7
	db $11, $02, $16, $01, $12, $06, $00, $14, $27, $23, $78, $28, $5b, $07, $00, $71, $12, $02, $16, $01, $12, $06, $00, $14, $13, $02, $16, $01, $12, $06, $00, $14, $29, $03, $9a, $01, $5d, $07, $00, $71, $07, $02, $69, $01, $59, $07, $00, $71, $09, $03, $9a, $01, $5d, $07, $00, $71, $20, $23, $04, $01, $03, $04, $00, $71, $28, $23, $89, $01, $5c, $07, $00, $71, $14, $02, $16, $01, $12, $06, $00, $14, $26, $23, $47, $01, $81, $04, $00, $71, $24, $23, $47, $01, $81, $04, $00, $71, $22, $23, $04, $01, $03, $04, $00, $71, $21, $23, $04, $01, $03, $04, $00, $71, $04, $02, $16, $01, $12, $06, $00, $14, $17, $02, $69, $01, $59, $07, $00, $71, $10, $12, $01, $01, $0e, $07, $00, $71

Data_c1def: ; c1def (30:5def)
	dw $5e2b
	dw NULL
	dw NULL
	dw NULL
	dw $5e33
	dw NULL
	dw NULL
	dw $5e3b
	dw NULL
	dw $5e43
	dw $5e4b
	dw NULL
	dw $5e53
	dw $5e5b
	dw $5e63
	dw NULL
	dw NULL
	dw $5e6b
	dw NULL
	dw NULL
	dw $5e73
	dw $5e7b
	dw NULL
	dw $5e83
	dw NULL
	dw $5e8b
	dw $5e93
	dw $5e9b
	dw $5ea3
	dw $5eab
	db $11, $02, $16, $01, $12, $06, $00, $14, $27, $23, $78, $28, $5b, $07, $00, $72, $12, $02, $16, $01, $12, $06, $00, $14, $13, $02, $16, $01, $12, $06, $00, $14, $29, $03, $9a, $01, $5d, $07, $00, $72, $07, $02, $69, $01, $5a, $07, $00, $72, $09, $03, $9a, $01, $5d, $07, $00, $72, $20, $23, $04, $01, $03, $04, $00, $72, $28, $23, $89, $01, $5c, $07, $00, $72, $14, $02, $16, $01, $12, $06, $00, $14, $26, $23, $47, $01, $81, $04, $00, $72, $24, $23, $47, $01, $81, $04, $00, $72, $22, $23, $04, $01, $03, $04, $00, $72, $21, $23, $04, $01, $03, $04, $00, $72, $04, $02, $16, $01, $12, $06, $00, $14, $17, $02, $69, $01, $5a, $07, $00, $72, $10, $12, $01, $01, $0e, $07, $00, $72

Data_c1eb3: ; c1eb3 (30:5eb3)
	dw $5eef
	dw NULL
	dw NULL
	dw NULL
	dw $5ef7
	dw NULL
	dw NULL
	dw $5eff
	dw NULL
	dw $5f07
	dw $5f0f
	dw NULL
	dw $5f17
	dw $5f1f
	dw $5f27
	dw NULL
	dw NULL
	dw $5f2f
	dw NULL
	dw NULL
	dw $5f37
	dw $5f3f
	dw NULL
	dw $5f47
	dw NULL
	dw $5f4f
	dw $5f57
	dw $5f5f
	dw $5f67
	dw $5f6f
	db $11, $02, $16, $01, $12, $06, $00, $73, $27, $23, $78, $28, $5b, $07, $00, $15, $12, $02, $16, $01, $12, $06, $00, $73, $13, $02, $16, $01, $12, $06, $00, $73, $29, $03, $9a, $01, $5d, $07, $00, $15, $07, $02, $69, $01, $59, $07, $00, $15, $09, $03, $9a, $01, $5d, $07, $00, $15, $20, $23, $04, $01, $03, $04, $00, $15, $28, $23, $89, $01, $5c, $07, $00, $15, $14, $02, $16, $01, $12, $06, $00, $73, $26, $23, $47, $01, $81, $04, $00, $15, $24, $23, $47, $01, $81, $04, $00, $15, $22, $23, $04, $01, $03, $04, $00, $15, $21, $23, $04, $01, $03, $04, $00, $15, $04, $02, $16, $01, $12, $06, $00, $73, $17, $02, $69, $01, $59, $07, $00, $15, $10, $12, $01, $01, $0e, $07, $00, $15

Data_c1f77: ; c1f77 (30:5f77)
	dw $5fb3
	dw NULL
	dw NULL
	dw NULL
	dw $5fbb
	dw NULL
	dw NULL
	dw $5fc3
	dw NULL
	dw $5fcb
	dw $5fd3
	dw NULL
	dw $5fdb
	dw $5fe3
	dw $5feb
	dw NULL
	dw NULL
	dw $5ff3
	dw NULL
	dw NULL
	dw $5ffb
	dw $6003
	dw NULL
	dw $600b
	dw NULL
	dw $6013
	dw $601b
	dw $6023
	dw $602b
	dw $6033
	db $11, $02, $16, $01, $12, $06, $00, $73, $27, $23, $78, $28, $5b, $07, $00, $71, $12, $02, $16, $01, $12, $06, $00, $73, $13, $02, $16, $01, $12, $06, $00, $73, $29, $03, $9a, $01, $5d, $07, $00, $71, $07, $02, $69, $01, $59, $07, $00, $71, $09, $03, $9a, $01, $5d, $07, $00, $71, $20, $23, $04, $01, $03, $04, $00, $71, $28, $23, $89, $01, $5c, $07, $00, $71, $14, $02, $16, $01, $12, $06, $00, $73, $26, $23, $47, $01, $81, $04, $00, $71, $24, $23, $47, $01, $81, $04, $00, $71, $22, $23, $04, $01, $03, $04, $00, $71, $21, $23, $04, $01, $03, $04, $00, $71, $04, $02, $16, $01, $12, $06, $00, $73, $17, $02, $69, $01, $59, $07, $00, $71, $10, $12, $01, $01, $0e, $07, $00, $71

Data_c203b: ; c203b (30:603b)
	dw $6077
	dw NULL
	dw NULL
	dw NULL
	dw $607f
	dw NULL
	dw NULL
	dw $6087
	dw NULL
	dw $608f
	dw $6097
	dw NULL
	dw $609f
	dw $60a7
	dw $60af
	dw NULL
	dw NULL
	dw $60b7
	dw NULL
	dw NULL
	dw $60bf
	dw $60c7
	dw NULL
	dw $60cf
	dw NULL
	dw $60d7
	dw $60df
	dw $60e7
	dw $60ef
	dw $60f7
	db $11, $02, $16, $01, $12, $06, $00, $73, $27, $23, $78, $28, $5b, $07, $00, $72, $12, $02, $16, $01, $12, $06, $00, $73, $13, $02, $16, $01, $12, $06, $00, $73, $29, $03, $9a, $01, $5d, $07, $00, $72, $07, $02, $69, $01, $5a, $07, $00, $72, $09, $03, $9a, $01, $5d, $07, $00, $72, $20, $23, $04, $01, $03, $04, $00, $72, $28, $23, $89, $01, $5c, $07, $00, $72, $14, $02, $16, $01, $12, $06, $00, $73, $26, $23, $47, $01, $81, $04, $00, $72, $24, $23, $47, $01, $81, $04, $00, $72, $22, $23, $04, $01, $03, $04, $00, $72, $21, $23, $04, $01, $03, $04, $00, $72, $04, $02, $16, $01, $12, $06, $00, $73, $17, $02, $69, $01, $5a, $07, $00, $72, $10, $12, $01, $01, $0e, $07, $00, $72

Data_c20ff: ; c20ff (30:60ff)
	dw $613b
	dw NULL
	dw NULL
	dw $6143
	dw NULL
	dw $614b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6153
	dw $615b
	dw NULL
	dw $6163
	dw NULL
	dw $6153
	dw $616b
	dw NULL
	dw NULL
	dw NULL
	dw $6173
	dw $617b
	dw $6183
	dw $618b
	dw $6193
	dw $619b
	dw $61a3
	dw $61ab
	dw $61b3
	dw $61bb
	db $02, $02, $15, $41, $7f, $11, $00, $16, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $16, $01, $02, $15, $41, $7f, $11, $00, $16, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $16, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $16, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c21c3: ; c21c3 (30:61c3)
	dw $61ff
	dw NULL
	dw NULL
	dw $6207
	dw NULL
	dw $620f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6217
	dw $621f
	dw NULL
	dw $6227
	dw NULL
	dw $6217
	dw $622f
	dw NULL
	dw NULL
	dw NULL
	dw $6237
	dw $623f
	dw $6247
	dw $624f
	dw $6257
	dw $625f
	dw $6267
	dw $626f
	dw $6277
	dw $627f
	db $02, $02, $15, $41, $7f, $11, $00, $6a, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6a, $01, $02, $15, $41, $7f, $11, $00, $6a, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $6a, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6a, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c2287: ; c2287 (30:6287)
	dw $62c3
	dw NULL
	dw NULL
	dw $62cb
	dw NULL
	dw $62d3
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $62db
	dw $62e3
	dw NULL
	dw $62eb
	dw NULL
	dw $62db
	dw $62f3
	dw NULL
	dw NULL
	dw NULL
	dw $62fb
	dw $6303
	dw $630b
	dw $6313
	dw $631b
	dw $6323
	dw $632b
	dw $6333
	dw $633b
	dw $6343
	db $02, $02, $15, $41, $7f, $11, $00, $6a, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6a, $01, $02, $15, $41, $7f, $11, $00, $6a, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $6b, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $6b, $03, $02, $15, $41, $7f, $11, $00, $6a, $25, $23, $58, $01, $1d, $11, $00, $6b, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $6b, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6a, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c234b: ; c234b (30:634b)
	dw $6387
	dw NULL
	dw NULL
	dw $638f
	dw NULL
	dw $6397
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $639f
	dw $63a7
	dw NULL
	dw $63af
	dw NULL
	dw $639f
	dw $63b7
	dw NULL
	dw NULL
	dw NULL
	dw $63bf
	dw $63c7
	dw $63cf
	dw $63d7
	dw $63df
	dw $63e7
	dw $63ef
	dw $63f7
	dw $63ff
	dw $6407
	db $02, $02, $15, $41, $7f, $11, $00, $6c, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6c, $01, $02, $15, $41, $7f, $11, $00, $6c, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $6c, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6c, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c240f: ; c240f (30:640f)
	dw $644b
	dw NULL
	dw NULL
	dw $6453
	dw NULL
	dw $645b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6463
	dw $646b
	dw NULL
	dw $6473
	dw NULL
	dw $6463
	dw $647b
	dw NULL
	dw NULL
	dw NULL
	dw $6483
	dw $648b
	dw $6493
	dw $649b
	dw $64a3
	dw $64ab
	dw $64b3
	dw $64bb
	dw $64c3
	dw $64cb
	db $02, $02, $15, $41, $7f, $11, $00, $6d, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6d, $01, $02, $15, $41, $7f, $11, $00, $6d, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $42, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $42, $03, $02, $15, $41, $7f, $11, $00, $6d, $25, $23, $58, $01, $1d, $11, $00, $42, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $42, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6d, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c24d3: ; c24d3 (30:64d3)
	dw $650f
	dw NULL
	dw NULL
	dw $6517
	dw NULL
	dw $651f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $6527
	dw $652f
	dw NULL
	dw $6537
	dw NULL
	dw $6527
	dw $653f
	dw NULL
	dw NULL
	dw NULL
	dw $6547
	dw $654f
	dw $6557
	dw $655f
	dw $6567
	dw $656f
	dw $6577
	dw $657f
	dw $6587
	dw $658f
	db $02, $02, $15, $41, $7f, $11, $00, $6d, $22, $23, $05, $01, $1d, $11, $00, $32, $13, $02, $15, $41, $7f, $11, $00, $6d, $01, $02, $15, $41, $7f, $11, $00, $6d, $28, $23, $8a, $08, $40, $11, $00, $32, $05, $02, $56, $0c, $56, $11, $00, $69, $26, $23, $58, $01, $1d, $11, $00, $6b, $24, $23, $05, $01, $1d, $11, $00, $32, $27, $23, $58, $01, $1d, $11, $00, $6b, $03, $02, $15, $41, $7f, $11, $00, $6d, $25, $23, $58, $01, $1d, $11, $00, $6b, $20, $23, $05, $01, $1d, $11, $00, $32, $23, $23, $05, $01, $1d, $11, $00, $32, $16, $02, $69, $01, $3f, $01, $00, $6b, $21, $23, $05, $01, $1d, $11, $00, $32, $11, $02, $15, $41, $7f, $11, $00, $6d, $29, $23, $8a, $08, $40, $11, $00, $32

Data_c2597: ; c2597 (30:6597)
	dw $65d3
	dw $65db
	dw NULL
	dw NULL
	dw $65e3
	dw $65eb
	dw $65f3
	dw $65fb
	dw $6603
	dw $660b
	dw $6613
	dw $661b
	dw NULL
	dw NULL
	dw $6623
	dw $662b
	dw NULL
	dw NULL
	dw NULL
	dw $6633
	dw $663b
	dw $6643
	dw $664b
	dw NULL
	dw $6653
	dw $665b
	dw $6663
	dw $666b
	dw $6673
	dw $6633
	db $02, $02, $15, $01, $17, $05, $00, $17, $20, $23, $01, $08, $0d, $05, $00, $18, $10, $12, $01, $08, $0a, $05, $00, $3e, $27, $03, $68, $08, $3c, $05, $00, $18, $21, $23, $12, $08, $02, $05, $00, $18, $07, $03, $68, $08, $3c, $05, $00, $18, $14, $02, $15, $01, $17, $05, $00, $17, $15, $03, $56, $01, $19, $05, $00, $18, $04, $02, $15, $01, $17, $05, $00, $17, $26, $03, $68, $08, $3c, $05, $00, $18, $08, $03, $89, $01, $0b, $05, $00, $3e, $09, $02, $9a, $0c, $37, $05, $00, $18, $17, $03, $68, $08, $3c, $05, $00, $18, $01, $02, $15, $01, $17, $05, $00, $17, $06, $03, $68, $08, $3c, $05, $00, $18, $28, $03, $89, $01, $0b, $05, $00, $3e, $25, $03, $56, $01, $19, $05, $00, $18, $24, $23, $45, $08, $0b, $05, $00, $18, $11, $02, $15, $01, $17, $05, $00, $17, $05, $03, $56, $01, $19, $05, $00, $18, $22, $23, $23, $08, $0b, $05, $00, $3e

Data_c267b: ; c267b (30:667b)
	dw $66b7
	dw $66bf
	dw NULL
	dw NULL
	dw $66c7
	dw $66cf
	dw $66d7
	dw $66df
	dw $66e7
	dw $66ef
	dw $66f7
	dw $66ff
	dw NULL
	dw NULL
	dw $6707
	dw $670f
	dw NULL
	dw NULL
	dw NULL
	dw $6717
	dw $671f
	dw $6727
	dw $672f
	dw NULL
	dw $6737
	dw $673f
	dw $6747
	dw $674f
	dw $6757
	dw $6717
	db $02, $02, $15, $01, $3d, $05, $00, $2a, $20, $23, $01, $08, $0d, $05, $00, $18, $10, $12, $01, $08, $0a, $05, $00, $3e, $27, $03, $68, $08, $3c, $05, $00, $18, $21, $23, $12, $08, $02, $05, $00, $18, $07, $03, $68, $08, $3c, $05, $00, $18, $14, $02, $15, $01, $3d, $05, $00, $2a, $15, $03, $56, $01, $19, $05, $00, $18, $04, $02, $15, $01, $3d, $05, $00, $2a, $26, $03, $68, $08, $3c, $05, $00, $18, $08, $03, $89, $01, $0b, $05, $00, $3e, $09, $02, $9a, $0c, $37, $05, $00, $18, $17, $03, $68, $08, $3c, $05, $00, $18, $01, $02, $15, $01, $3d, $05, $00, $2a, $06, $03, $68, $08, $3c, $05, $00, $18, $28, $03, $89, $01, $0b, $05, $00, $3e, $25, $03, $56, $01, $19, $05, $00, $18, $24, $23, $45, $08, $0b, $05, $00, $18, $11, $02, $15, $01, $3d, $05, $00, $2a, $05, $03, $56, $01, $19, $05, $00, $18, $22, $23, $23, $08, $0b, $05, $00, $3e

Data_c275f: ; c275f (30:675f)
	dw $679b
	dw NULL
	dw $67a3
	dw $67ab
	dw $67b3
	dw NULL
	dw $67bb
	dw $67c3
	dw NULL
	dw $67cb
	dw $67d3
	dw $67db
	dw $67db
	dw $67db
	dw $67db
	dw $67e3
	dw $67eb
	dw $67f3
	dw $67fb
	dw $6803
	dw $680b
	dw $6813
	dw $681b
	dw NULL
	dw NULL
	dw NULL
	dw $6823
	dw NULL
	dw $682b
	dw $6833
	db $21, $23, $07, $81, $0a, $03, $00, $1b, $02, $02, $15, $81, $41, $03, $00, $1b, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $41, $03, $00, $1b, $23, $23, $07, $81, $0a, $03, $00, $1b, $03, $02, $15, $81, $41, $03, $00, $1b, $24, $23, $07, $81, $0a, $03, $00, $1b, $25, $23, $07, $81, $0a, $03, $00, $1b, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $1b, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $41, $03, $00, $1b, $20, $23, $07, $81, $0a, $03, $00, $1b

Data_c283b: ; c283b (30:683b)
	dw $6877
	dw NULL
	dw $687f
	dw $6887
	dw $688f
	dw NULL
	dw $6897
	dw $689f
	dw NULL
	dw $68a7
	dw $68af
	dw $68b7
	dw $68b7
	dw $68b7
	dw $68b7
	dw $68bf
	dw $68c7
	dw $68cf
	dw $68d7
	dw $68df
	dw $68e7
	dw $68ef
	dw $68f7
	dw NULL
	dw NULL
	dw NULL
	dw $68ff
	dw NULL
	dw $6907
	dw $690f
	db $21, $23, $07, $81, $0a, $03, $00, $1b, $02, $02, $15, $81, $43, $03, $00, $1b, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $43, $03, $00, $1b, $23, $23, $07, $81, $0a, $03, $00, $1b, $03, $02, $15, $81, $43, $03, $00, $1b, $24, $23, $07, $81, $0a, $03, $00, $1b, $25, $23, $07, $81, $0a, $03, $00, $1b, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $1b, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $43, $03, $00, $1b, $20, $23, $07, $81, $0a, $03, $00, $1b

Data_c2917: ; c2917 (30:6917)
	dw $6953
	dw NULL
	dw $695b
	dw $6963
	dw $696b
	dw NULL
	dw $6973
	dw $697b
	dw NULL
	dw $6983
	dw $698b
	dw $6993
	dw $6993
	dw $6993
	dw $6993
	dw $699b
	dw $69a3
	dw $69ab
	dw $69b3
	dw $69bb
	dw $69c3
	dw $69cb
	dw $69d3
	dw NULL
	dw NULL
	dw NULL
	dw $69db
	dw NULL
	dw $69e3
	dw $69eb
	db $21, $23, $07, $81, $0a, $03, $00, $50, $02, $02, $15, $81, $41, $03, $00, $50, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $41, $03, $00, $50, $23, $23, $07, $81, $0a, $03, $00, $50, $03, $02, $15, $81, $41, $03, $00, $50, $24, $23, $07, $81, $0a, $03, $00, $50, $25, $23, $07, $81, $0a, $03, $00, $50, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $50, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $41, $03, $00, $50, $20, $23, $07, $81, $0a, $03, $00, $50

Data_c29f3: ; c29f3 (30:69f3)
	dw $6a2f
	dw NULL
	dw $6a37
	dw $6a3f
	dw $6a47
	dw NULL
	dw $6a4f
	dw $6a57
	dw NULL
	dw $6a5f
	dw $6a67
	dw $6a6f
	dw $6a6f
	dw $6a6f
	dw $6a6f
	dw $6a77
	dw $6a7f
	dw $6a87
	dw $6a8f
	dw $6a97
	dw $6a9f
	dw $6aa7
	dw $6aaf
	dw NULL
	dw NULL
	dw NULL
	dw $6ab7
	dw NULL
	dw $6abf
	dw $6ac7
	db $21, $23, $07, $81, $0a, $03, $00, $50, $02, $02, $15, $81, $43, $03, $00, $50, $10, $12, $01, $01, $1a, $07, $00, $15, $28, $23, $89, $08, $01, $03, $00, $1c, $05, $02, $56, $00, $2c, $03, $00, $1c, $01, $02, $15, $81, $43, $03, $00, $50, $23, $23, $07, $81, $0a, $03, $00, $50, $03, $02, $15, $81, $43, $03, $00, $50, $24, $23, $07, $81, $0a, $03, $00, $50, $25, $23, $07, $81, $0a, $03, $00, $50, $15, $02, $56, $00, $2c, $03, $00, $1c, $22, $23, $07, $81, $0a, $03, $00, $50, $19, $02, $9a, $01, $19, $07, $00, $15, $18, $02, $89, $01, $18, $07, $00, $15, $29, $23, $9a, $08, $07, $03, $00, $1c, $08, $02, $89, $01, $18, $07, $00, $15, $17, $02, $78, $00, $3b, $03, $00, $1c, $16, $02, $67, $0c, $2c, $03, $00, $9a, $04, $02, $15, $81, $43, $03, $00, $50, $20, $23, $07, $81, $0a, $03, $00, $50

Data_c2acf: ; c2acf (30:6acf)
	dw $6b0b
	dw $6b13
	dw NULL
	dw NULL
	dw NULL
	dw $6b1b
	dw $6b23
	dw $6b2b
	dw NULL
	dw $6b33
	dw $6b3b
	dw $6b43
	dw NULL
	dw $6b4b
	dw $6b53
	dw NULL
	dw $6b5b
	dw NULL
	dw NULL
	dw $6b63
	dw $6b6b
	dw $6b73
	dw $6b73
	dw $6b73
	dw $6b73
	dw $6b7b
	dw NULL
	dw NULL
	dw $6b83
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $1d, $20, $23, $05, $81, $4c, $03, $00, $1d, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $1d, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $1d, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $1d, $03, $02, $16, $08, $34, $03, $00, $1d, $05, $02, $16, $08, $34, $03, $00, $1d, $14, $02, $16, $08, $34, $03, $00, $1d

Data_c2b8b: ; c2b8b (30:6b8b)
	dw $6bc7
	dw $6bcf
	dw NULL
	dw NULL
	dw NULL
	dw $6bd7
	dw $6bdf
	dw $6be7
	dw NULL
	dw $6bef
	dw $6bf7
	dw $6bff
	dw NULL
	dw $6c07
	dw $6c0f
	dw NULL
	dw $6c17
	dw NULL
	dw NULL
	dw $6c1f
	dw $6c27
	dw $6c2f
	dw $6c2f
	dw $6c2f
	dw $6c2f
	dw $6c37
	dw NULL
	dw NULL
	dw $6c3f
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $52, $20, $23, $05, $81, $4c, $03, $00, $52, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $52, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $52, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $52, $03, $02, $16, $08, $34, $03, $00, $52, $05, $02, $16, $08, $34, $03, $00, $52, $14, $02, $16, $08, $34, $03, $00, $52

Data_c2c47: ; c2c47 (30:6c47)
	dw $6c83
	dw $6c8b
	dw NULL
	dw NULL
	dw NULL
	dw $6c93
	dw $6c9b
	dw $6ca3
	dw NULL
	dw $6cab
	dw $6cb3
	dw $6cbb
	dw NULL
	dw $6cc3
	dw $6ccb
	dw NULL
	dw $6cd3
	dw NULL
	dw NULL
	dw $6cdb
	dw $6ce3
	dw $6ceb
	dw $6ceb
	dw $6ceb
	dw $6ceb
	dw $6cf3
	dw NULL
	dw NULL
	dw $6cfb
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $51, $20, $23, $05, $81, $4c, $03, $00, $51, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $51, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $51, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $51, $03, $02, $16, $08, $34, $03, $00, $51, $05, $02, $16, $08, $34, $03, $00, $51, $14, $02, $16, $08, $34, $03, $00, $51

Data_c2d03: ; c2d03 (30:6d03)
	dw $6d3f
	dw $6d47
	dw NULL
	dw NULL
	dw NULL
	dw $6d4f
	dw $6d57
	dw $6d5f
	dw NULL
	dw $6d67
	dw $6d6f
	dw $6d77
	dw NULL
	dw $6d7f
	dw $6d87
	dw NULL
	dw $6d8f
	dw NULL
	dw NULL
	dw $6d97
	dw $6d9f
	dw $6da7
	dw $6da7
	dw $6da7
	dw $6da7
	dw $6daf
	dw NULL
	dw NULL
	dw $6db7
	dw NULL
	db $02, $02, $16, $08, $34, $03, $00, $53, $20, $23, $05, $81, $4c, $03, $00, $53, $25, $23, $56, $08, $08, $03, $00, $1e, $09, $02, $7a, $01, $01, $03, $00, $1e, $13, $02, $16, $08, $34, $03, $00, $53, $06, $02, $67, $0c, $6c, $03, $00, $1e, $11, $02, $16, $08, $34, $03, $00, $53, $10, $12, $01, $08, $02, $03, $00, $1e, $07, $02, $7a, $01, $01, $03, $00, $1e, $28, $23, $6a, $08, $4b, $03, $00, $1e, $19, $02, $7a, $01, $01, $03, $00, $1e, $16, $02, $67, $0c, $6c, $03, $00, $1e, $01, $02, $16, $08, $34, $03, $00, $53, $03, $02, $16, $08, $34, $03, $00, $53, $05, $02, $16, $08, $34, $03, $00, $53, $14, $02, $16, $08, $34, $03, $00, $53

Data_c2dbf: ; c2dbf (30:6dbf)
	dw $6dfb
	dw NULL
	dw NULL
	dw NULL
	dw $6e03
	dw $6e0b
	dw $6e13
	dw NULL
	dw NULL
	dw $6e1b
	dw $6e23
	dw $6e2b
	dw NULL
	dw NULL
	dw $6e33
	dw $6e3b
	dw $6e43
	dw $6e4b
	dw $6e53
	dw $6e5b
	dw NULL
	dw $6e63
	dw $6e6b
	dw $6e73
	dw $6e7b
	dw $6e83
	dw $6e8b
	dw $6e93
	dw $6e9b
	dw $6ea3
	db $12, $02, $15, $01, $44, $03, $00, $1f, $23, $23, $35, $08, $46, $03, $00, $20, $21, $23, $12, $01, $79, $0c, $00, $20, $28, $23, $89, $01, $1d, $0c, $00, $20, $14, $02, $15, $01, $44, $03, $00, $1f, $27, $23, $58, $08, $47, $03, $00, $21, $16, $02, $57, $01, $39, $0c, $00, $20, $09, $02, $9a, $01, $79, $0c, $00, $21, $22, $23, $23, $01, $91, $0c, $00, $20, $11, $02, $15, $01, $44, $03, $00, $1f, $19, $02, $9a, $01, $79, $0c, $00, $21, $29, $23, $9a, $08, $28, $0c, $00, $20, $17, $02, $79, $01, $28, $0c, $00, $3a, $05, $02, $57, $01, $39, $0c, $00, $20, $15, $02, $57, $01, $39, $0c, $00, $20, $04, $02, $15, $01, $44, $03, $00, $1f, $25, $23, $58, $08, $47, $03, $00, $21, $24, $23, $35, $08, $46, $03, $00, $20, $13, $02, $15, $01, $44, $03, $00, $1f, $20, $13, $01, $08, $6f, $14, $00, $1f, $06, $02, $57, $01, $39, $0c, $00, $20, $18, $02, $79, $01, $28, $0c, $00, $3a

Data_c2eab: ; c2eab (30:6eab)
	dw $6ee7
	dw NULL
	dw NULL
	dw NULL
	dw $6eef
	dw $6ef7
	dw $6eff
	dw NULL
	dw NULL
	dw $6f07
	dw $6f0f
	dw $6f17
	dw NULL
	dw NULL
	dw $6f1f
	dw $6f27
	dw $6f2f
	dw $6f37
	dw $6f3f
	dw $6f47
	dw NULL
	dw $6f4f
	dw $6f57
	dw $6f5f
	dw $6f67
	dw $6f6f
	dw $6f77
	dw $6f7f
	dw $6f87
	dw $6f8f
	db $12, $02, $15, $01, $44, $03, $00, $1f, $23, $23, $35, $08, $46, $03, $00, $20, $21, $23, $12, $01, $79, $0c, $00, $20, $28, $23, $89, $01, $1d, $0c, $00, $20, $14, $02, $15, $01, $44, $03, $00, $1f, $27, $23, $58, $08, $47, $03, $00, $21, $16, $02, $57, $01, $39, $0c, $00, $20, $09, $02, $9a, $01, $79, $0c, $00, $21, $22, $23, $23, $01, $91, $0c, $00, $20, $11, $02, $15, $01, $44, $03, $00, $1f, $19, $02, $9a, $01, $79, $0c, $00, $21, $29, $23, $9a, $08, $28, $0c, $00, $20, $17, $02, $79, $01, $28, $0c, $00, $57, $05, $02, $57, $01, $39, $0c, $00, $20, $15, $02, $57, $01, $39, $0c, $00, $20, $04, $02, $15, $01, $44, $03, $00, $1f, $25, $23, $58, $08, $47, $03, $00, $21, $24, $23, $35, $08, $46, $03, $00, $20, $13, $02, $15, $01, $44, $03, $00, $1f, $20, $13, $01, $08, $6f, $14, $00, $1f, $06, $02, $57, $01, $39, $0c, $00, $20, $18, $02, $79, $01, $28, $0c, $00, $57

Data_c2f97: ; c2f97 (30:6f97)
	dw $6fd3
	dw NULL
	dw NULL
	dw NULL
	dw $6fdb
	dw $6fe3
	dw $6feb
	dw NULL
	dw NULL
	dw $6ff3
	dw $6ffb
	dw $7003
	dw NULL
	dw NULL
	dw $700b
	dw $7013
	dw $701b
	dw $7023
	dw $702b
	dw $7033
	dw NULL
	dw $703b
	dw $7043
	dw $704b
	dw $7053
	dw $705b
	dw $7063
	dw $706b
	dw $7073
	dw $707b
	db $12, $02, $15, $01, $44, $03, $00, $54, $23, $23, $35, $08, $46, $03, $00, $55, $21, $23, $12, $01, $79, $0c, $00, $55, $28, $23, $89, $01, $1d, $0c, $00, $55, $14, $02, $15, $01, $44, $03, $00, $54, $27, $23, $58, $08, $47, $03, $00, $56, $16, $02, $57, $01, $39, $0c, $00, $55, $09, $02, $9a, $01, $79, $0c, $00, $56, $22, $23, $23, $01, $91, $0c, $00, $55, $11, $02, $15, $01, $44, $03, $00, $54, $19, $02, $9a, $01, $79, $0c, $00, $56, $29, $23, $9a, $08, $28, $0c, $00, $55, $17, $02, $79, $01, $28, $0c, $00, $3a, $05, $02, $57, $01, $39, $0c, $00, $55, $15, $02, $57, $01, $39, $0c, $00, $55, $04, $02, $15, $01, $44, $03, $00, $54, $25, $23, $58, $08, $47, $03, $00, $56, $24, $23, $35, $08, $46, $03, $00, $55, $13, $02, $15, $01, $44, $03, $00, $54, $20, $13, $01, $08, $6f, $14, $00, $54, $06, $02, $57, $01, $39, $0c, $00, $55, $18, $02, $79, $01, $28, $0c, $00, $3a

Data_c3083: ; c3083 (30:7083)
	dw $70bf
	dw NULL
	dw NULL
	dw NULL
	dw $70c7
	dw $70cf
	dw $70d7
	dw NULL
	dw NULL
	dw $70df
	dw $70e7
	dw $70ef
	dw NULL
	dw NULL
	dw $70f7
	dw $70ff
	dw $7107
	dw $710f
	dw $7117
	dw $711f
	dw NULL
	dw $7127
	dw $712f
	dw $7137
	dw $713f
	dw $7147
	dw $714f
	dw $7157
	dw $715f
	dw $7167
	db $12, $02, $15, $01, $44, $03, $00, $54, $23, $23, $35, $08, $46, $03, $00, $55, $21, $23, $12, $01, $79, $0c, $00, $55, $28, $23, $89, $01, $1d, $0c, $00, $55, $14, $02, $15, $01, $44, $03, $00, $54, $27, $23, $58, $08, $47, $03, $00, $56, $16, $02, $57, $01, $39, $0c, $00, $55, $09, $02, $9a, $01, $79, $0c, $00, $56, $22, $23, $23, $01, $91, $0c, $00, $55, $11, $02, $15, $01, $44, $03, $00, $54, $19, $02, $9a, $01, $79, $0c, $00, $56, $29, $23, $9a, $08, $28, $0c, $00, $55, $17, $02, $79, $01, $28, $0c, $00, $57, $05, $02, $57, $01, $39, $0c, $00, $55, $15, $02, $57, $01, $39, $0c, $00, $55, $04, $02, $15, $01, $44, $03, $00, $54, $25, $23, $58, $08, $47, $03, $00, $56, $24, $23, $35, $08, $46, $03, $00, $55, $13, $02, $15, $01, $44, $03, $00, $54, $20, $13, $01, $08, $6f, $14, $00, $54, $06, $02, $57, $01, $39, $0c, $00, $55, $18, $02, $79, $01, $28, $0c, $00, $57

Data_c316f: ; c316f (30:716f)
	dw $71ab
	dw NULL
	dw $71b3
	dw $71bb
	dw $71c3
	dw $71cb
	dw $71d3
	dw $71db
	dw NULL
	dw $71e3
	dw $71eb
	dw NULL
	dw $71f3
	dw NULL
	dw $71fb
	dw NULL
	dw NULL
	dw $7203
	dw $720b
	dw $7213
	dw $721b
	dw $7223
	dw $722b
	dw $7233
	dw $723b
	dw $7243
	dw $724b
	dw $7253
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $59, $08, $00, $22, $02, $01, $14, $01, $10, $08, $00, $22, $07, $02, $7a, $b1, $59, $08, $00, $22, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $22, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $59, $08, $00, $22, $09, $02, $7a, $b1, $59, $08, $00, $22, $18, $02, $7a, $b1, $59, $08, $00, $22, $10, $13, $02, $41, $1e, $08, $00, $22, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $22, $21, $13, $02, $41, $1e, $08, $00, $22, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $59, $08, $00, $22

Data_c325b: ; c325b (30:725b)
	dw $7297
	dw NULL
	dw $729f
	dw $72a7
	dw $72af
	dw $72b7
	dw $72bf
	dw $72c7
	dw NULL
	dw $72cf
	dw $72d7
	dw NULL
	dw $72df
	dw NULL
	dw $72e7
	dw NULL
	dw NULL
	dw $72ef
	dw $72f7
	dw $72ff
	dw $7307
	dw $730f
	dw $7317
	dw $731f
	dw $7327
	dw $732f
	dw $7337
	dw $733f
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7b, $02, $01, $14, $01, $10, $08, $00, $7b, $07, $02, $7a, $b1, $5a, $08, $00, $7b, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7b, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7b, $09, $02, $7a, $b1, $5a, $08, $00, $7b, $18, $02, $7a, $b1, $5a, $08, $00, $7b, $10, $13, $02, $41, $1e, $08, $00, $7b, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7b, $21, $13, $02, $41, $1e, $08, $00, $7b, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7b

Data_c3347: ; c3347 (30:7347)
	dw $7383
	dw NULL
	dw $738b
	dw $7393
	dw $739b
	dw $73a3
	dw $73ab
	dw $73b3
	dw NULL
	dw $73bb
	dw $73c3
	dw NULL
	dw $73cb
	dw NULL
	dw $73d3
	dw NULL
	dw NULL
	dw $73db
	dw $73e3
	dw $73eb
	dw $73f3
	dw $73fb
	dw $7403
	dw $740b
	dw $7413
	dw $741b
	dw $7423
	dw $742b
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7c, $02, $01, $14, $01, $10, $08, $00, $7c, $07, $02, $7a, $b1, $5a, $08, $00, $7c, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7c, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7c, $09, $02, $7a, $b1, $5a, $08, $00, $7c, $18, $02, $7a, $b1, $5a, $08, $00, $7c, $10, $13, $02, $41, $1e, $08, $00, $7c, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7c, $21, $13, $02, $41, $1e, $08, $00, $7c, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7c

Data_c3433: ; c3433 (30:7433)
	dw $746f
	dw NULL
	dw $7477
	dw $747f
	dw $7487
	dw $748f
	dw $7497
	dw $749f
	dw NULL
	dw $74a7
	dw $74af
	dw NULL
	dw $74b7
	dw NULL
	dw $74bf
	dw NULL
	dw NULL
	dw $74c7
	dw $74cf
	dw $74d7
	dw $74df
	dw $74e7
	dw $74ef
	dw $74f7
	dw $74ff
	dw $7507
	dw $750f
	dw $7517
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $59, $08, $00, $7d, $02, $01, $14, $01, $10, $08, $00, $7d, $07, $02, $7a, $b1, $59, $08, $00, $7d, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7d, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $59, $08, $00, $7d, $09, $02, $7a, $b1, $59, $08, $00, $7d, $18, $02, $7a, $b1, $59, $08, $00, $7d, $10, $13, $02, $41, $1e, $08, $00, $7d, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7d, $21, $13, $02, $41, $1e, $08, $00, $7d, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $59, $08, $00, $7d

Data_c351f: ; c351f (30:751f)
	dw $755b
	dw NULL
	dw $7563
	dw $756b
	dw $7573
	dw $757b
	dw $7583
	dw $758b
	dw NULL
	dw $7593
	dw $759b
	dw NULL
	dw $75a3
	dw NULL
	dw $75ab
	dw NULL
	dw NULL
	dw $75b3
	dw $75bb
	dw $75c3
	dw $75cb
	dw $75d3
	dw $75db
	dw $75e3
	dw $75eb
	dw $75f3
	dw $75fb
	dw $7603
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7e, $02, $01, $14, $01, $10, $08, $00, $7e, $07, $02, $7a, $b1, $5a, $08, $00, $7e, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7e, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7e, $09, $02, $7a, $b1, $5a, $08, $00, $7e, $18, $02, $7a, $b1, $5a, $08, $00, $7e, $10, $13, $02, $41, $1e, $08, $00, $7e, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7e, $21, $13, $02, $41, $1e, $08, $00, $7e, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7e

Data_c360b: ; c360b (30:760b)
	dw $7647
	dw NULL
	dw $764f
	dw $7657
	dw $765f
	dw $7667
	dw $766f
	dw $7677
	dw NULL
	dw $767f
	dw $7687
	dw NULL
	dw $768f
	dw NULL
	dw $7697
	dw NULL
	dw NULL
	dw $769f
	dw $76a7
	dw $76af
	dw $76b7
	dw $76bf
	dw $76c7
	dw $76cf
	dw $76d7
	dw $76df
	dw $76e7
	dw $76ef
	dw NULL
	dw NULL
	db $08, $02, $7a, $b1, $5a, $08, $00, $7f, $02, $01, $14, $01, $10, $08, $00, $7f, $07, $02, $7a, $b1, $5a, $08, $00, $7f, $24, $23, $45, $08, $07, $0b, $00, $36, $25, $23, $56, $01, $16, $0b, $00, $36, $26, $23, $67, $01, $8e, $0b, $00, $36, $03, $01, $14, $11, $2d, $08, $00, $7f, $12, $12, $24, $08, $65, $0b, $00, $36, $17, $02, $7a, $b1, $5a, $08, $00, $7f, $09, $02, $7a, $b1, $5a, $08, $00, $7f, $18, $02, $7a, $b1, $5a, $08, $00, $7f, $10, $13, $02, $41, $1e, $08, $00, $7f, $14, $02, $47, $01, $21, $12, $00, $36, $27, $23, $7a, $21, $85, $08, $00, $37, $22, $23, $24, $01, $2f, $0b, $00, $36, $23, $23, $24, $01, $2f, $0b, $00, $36, $20, $13, $02, $41, $1e, $08, $00, $7f, $21, $13, $02, $41, $1e, $08, $00, $7f, $04, $02, $47, $01, $21, $12, $00, $36, $05, $02, $47, $01, $21, $12, $00, $36, $06, $02, $47, $01, $21, $12, $00, $36, $19, $02, $7a, $b1, $5a, $08, $00, $7f

Data_c36f7: ; c36f7 (30:76f7)
	dw $7733
	dw $773b
	dw NULL
	dw NULL
	dw $7743
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $774b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7753
	dw $775b
	dw $7763
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $776b
	dw $7773
	dw $777b
	db $03, $03, $14, $01, $65, $0a, $00, $2f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $65, $0a, $00, $2f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $65, $0a, $00, $2f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $65, $0a, $00, $2f, $13, $03, $14, $01, $65, $0a, $00, $2f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c3783: ; c3783 (30:7783)
	dw $77bf
	dw $77c7
	dw NULL
	dw NULL
	dw $77cf
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $77d7
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $77df
	dw $77e7
	dw $77ef
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $77f7
	dw $77ff
	dw $7807
	db $03, $03, $14, $01, $88, $0a, $00, $2f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $2f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $2f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $2f, $13, $03, $14, $01, $88, $0a, $00, $2f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c380f: ; c380f (30:780f)
	dw $784b
	dw $7853
	dw NULL
	dw NULL
	dw $785b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7863
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $786b
	dw $7873
	dw $787b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7883
	dw $788b
	dw $7893
	db $03, $03, $14, $01, $88, $0a, $00, $8e, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $8e, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $8e, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $8e, $13, $03, $14, $01, $88, $0a, $00, $8e, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c389b: ; c389b (30:789b)
	dw $78d7
	dw $78df
	dw NULL
	dw NULL
	dw $78e7
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $78ef
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $78f7
	dw $78ff
	dw $7907
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $790f
	dw $7917
	dw $791f
	db $03, $03, $14, $01, $65, $0a, $00, $8f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $65, $0a, $00, $8f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $65, $0a, $00, $8f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $65, $0a, $00, $8f, $13, $03, $14, $01, $65, $0a, $00, $8f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c3927: ; c3927 (30:7927)
	dw $7963
	dw $796b
	dw NULL
	dw NULL
	dw $7973
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $797b
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7983
	dw $798b
	dw $7993
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $799b
	dw $79a3
	dw $79ab
	db $03, $03, $14, $01, $88, $0a, $00, $8f, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $8f, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $8f, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $8f, $13, $03, $14, $01, $88, $0a, $00, $8f, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c39b3: ; c39b3 (30:79b3)
	dw $79ef
	dw $79f7
	dw NULL
	dw NULL
	dw $79ff
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7a07
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7a0f
	dw $7a17
	dw $7a1f
	dw NULL
	dw NULL
	dw NULL
	dw NULL
	dw $7a27
	dw $7a2f
	dw $7a37
	db $03, $03, $14, $01, $88, $0a, $00, $90, $04, $02, $47, $01, $1a, $0a, $00, $30, $01, $03, $14, $01, $88, $0a, $00, $90, $28, $03, $8a, $01, $62, $0c, $00, $30, $21, $03, $14, $01, $88, $0a, $00, $90, $20, $13, $01, $11, $02, $0a, $00, $30, $27, $23, $48, $08, $1b, $0a, $00, $30, $22, $03, $14, $01, $88, $0a, $00, $90, $13, $03, $14, $01, $88, $0a, $00, $90, $29, $03, $8a, $01, $62, $0c, $00, $30

Data_c3a3f: ; c3a3f (30:7a3f)
	dw $7a7b
	dw $7a83
	dw $7a8b
	dw NULL
	dw $7a93
	dw $7a9b
	dw $7aa3
	dw NULL
	dw $7aab
	dw $7ab3
	dw NULL
	dw NULL
	dw NULL
	dw $7abb
	dw $7ac3
	dw $7acb
	dw $7ad3
	dw NULL
	dw $7adb
	dw $7ae3
	dw $7aeb
	dw $7af3
	dw NULL
	dw $7afb
	dw $7b03
	dw $7b0b
	dw NULL
	dw $7b13
	dw $7b1b
	dw $7b23
	db $11, $02, $16, $08, $70, $03, $00, $23, $09, $03, $9a, $01, $50, $03, $00, $0a, $19, $03, $9a, $01, $50, $03, $00, $0a, $06, $02, $68, $08, $31, $03, $00, $23, $23, $23, $35, $01, $0e, $13, $00, $13, $04, $02, $16, $08, $70, $03, $00, $23, $25, $23, $56, $01, $64, $03, $00, $49, $01, $02, $16, $08, $48, $03, $00, $23, $16, $02, $68, $08, $31, $03, $00, $23, $21, $23, $13, $08, $13, $13, $00, $13, $18, $03, $89, $21, $63, $03, $00, $49, $13, $02, $16, $08, $70, $03, $00, $23, $15, $02, $16, $08, $70, $03, $00, $23, $02, $02, $16, $08, $70, $03, $00, $23, $29, $03, $9a, $01, $50, $03, $00, $0a, $14, $02, $16, $08, $70, $03, $00, $23, $05, $02, $16, $08, $70, $03, $00, $23, $24, $23, $35, $01, $0e, $13, $00, $13, $08, $03, $89, $21, $63, $03, $00, $49, $28, $03, $89, $21, $63, $03, $00, $49, $27, $23, $68, $18, $5c, $03, $00, $49, $20, $23, $01, $08, $01, $13, $00, $13

Data_c3b2b: ; c3b2b (30:7b2b)
	dw $7b67
	dw $7b6f
	dw $7b77
	dw NULL
	dw $7b7f
	dw $7b87
	dw $7b8f
	dw NULL
	dw $7b97
	dw $7b9f
	dw NULL
	dw NULL
	dw NULL
	dw $7ba7
	dw $7baf
	dw $7bb7
	dw $7bbf
	dw NULL
	dw $7bc7
	dw $7bcf
	dw $7bd7
	dw $7bdf
	dw NULL
	dw $7be7
	dw $7bef
	dw $7bf7
	dw NULL
	dw $7bff
	dw $7c07
	dw $7c0f
	db $11, $02, $16, $08, $70, $03, $00, $58, $09, $03, $9a, $01, $50, $03, $00, $0a, $19, $03, $9a, $01, $50, $03, $00, $0a, $06, $02, $68, $08, $31, $03, $00, $58, $23, $23, $35, $01, $0e, $13, $00, $13, $04, $02, $16, $08, $70, $03, $00, $58, $25, $23, $56, $01, $64, $03, $00, $49, $01, $02, $16, $08, $48, $03, $00, $58, $16, $02, $68, $08, $31, $03, $00, $58, $21, $23, $13, $08, $13, $13, $00, $13, $18, $03, $89, $21, $63, $03, $00, $49, $13, $02, $16, $08, $70, $03, $00, $58, $15, $02, $16, $08, $70, $03, $00, $58, $02, $02, $16, $08, $70, $03, $00, $58, $29, $03, $9a, $01, $50, $03, $00, $0a, $14, $02, $16, $08, $70, $03, $00, $58, $05, $02, $16, $08, $70, $03, $00, $58, $24, $23, $35, $01, $0e, $13, $00, $13, $08, $03, $89, $21, $63, $03, $00, $49, $28, $03, $89, $21, $63, $03, $00, $49, $27, $23, $68, $18, $5c, $03, $00, $49, $20, $23, $01, $08, $01, $13, $00, $13

Data_c3c17: ; c3c17 (30:7c17)
	dw $7c53
	dw $7c5b
	dw $7c63
	dw NULL
	dw $7c6b
	dw $7c73
	dw $7c7b
	dw NULL
	dw $7c83
	dw $7c8b
	dw NULL
	dw NULL
	dw NULL
	dw $7c93
	dw $7c9b
	dw $7ca3
	dw $7cab
	dw NULL
	dw $7cb3
	dw $7cbb
	dw $7cc3
	dw $7ccb
	dw NULL
	dw $7cd3
	dw $7cdb
	dw $7ce3
	dw NULL
	dw $7ceb
	dw $7cf3
	dw $7cfb
	db $11, $02, $16, $08, $48, $03, $00, $58, $09, $03, $9a, $01, $50, $03, $00, $0a, $19, $03, $9a, $01, $50, $03, $00, $0a, $06, $02, $68, $08, $31, $03, $00, $58, $23, $23, $35, $01, $0e, $13, $00, $13, $04, $02, $16, $08, $48, $03, $00, $58, $25, $23, $56, $01, $64, $03, $00, $49, $01, $02, $16, $08, $48, $03, $00, $58, $16, $02, $68, $08, $31, $03, $00, $58, $21, $23, $13, $08, $13, $13, $00, $13, $18, $03, $89, $21, $63, $03, $00, $49, $13, $02, $16, $08, $48, $03, $00, $58, $15, $02, $16, $08, $48, $03, $00, $58, $02, $02, $16, $08, $48, $03, $00, $58, $29, $03, $9a, $01, $50, $03, $00, $0a, $14, $02, $16, $08, $48, $03, $00, $58, $05, $02, $16, $08, $48, $03, $00, $58, $24, $23, $35, $01, $0e, $13, $00, $13, $08, $03, $89, $21, $63, $03, $00, $49, $28, $03, $89, $21, $63, $03, $00, $49, $27, $23, $68, $18, $5c, $03, $00, $49, $20, $23, $01, $08, $01, $13, $00, $13
