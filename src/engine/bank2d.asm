Func_b4000:
	ret

Func_b4001:
	debug_nop

_InitOWObjects:
	ld a, [w2d065]
	ld c, a
	ld a, [wOWSceneMapSide]
	jumptable

	dw InitOWObjects_North ; NORTH
	dw InitOWObjects_West  ; WEST
	dw InitOWObjects_South ; SOUTH
	dw InitOWObjects_East  ; EAST

InitOWObjects_North:
	ld a, [wOWSceneActionParam]
	jumptable

	dw Func_b4001
	dw Func_b403e ; NOWFUNC_CUT_TREE
	dw Func_b408e ; NOWFUNC_OPEN_GATE
	dw Func_b409c ; NOWFUNC_GARLIC
	dw Func_b40c0 ; NOWFUNC_MAGIC_SEED
	dw Func_b40d9 ; NOWFUNC_SUMMON_SNAKE
	dw Func_b40ff ; NOWFUNC_FALL_LEAVES
	dw Func_b4140 ; NOWFUNC_BLUE_MUSIC_BOX
	dw Func_b4140 ; NOWFUNC_GOLD_MUSIC_BOX
	dw Func_b4141 ; NOWFUNC_CRAYON_RED
	dw Func_b4162 ; NOWFUNC_CRAYON_BROWN
	dw Func_b4166 ; NOWFUNC_CRAYON_YELLOW
	dw Func_b416a ; NOWFUNC_CRAYON_GREEN
	dw Func_b416e ; NOWFUNC_CRAYON_CYAN
	dw Func_b4172 ; NOWFUNC_CRAYON_BLUE
	dw Func_b4176 ; NOWFUNC_CRAYON_PINK
	dw Func_b417a ; NOWFUNC_BOTTOM_BAR
	dw Func_b4247 ; NOWFUNC_DAY_NIGHT_SPELL
	dw Func_b42e7 ; NOWFUNC_PROLOGUE

Func_b403e:
	dec c
	jr z, .asm_b404f
	ld hl, wSceneObj8
	ld de, .data
	call InitSceneObjParams
	jr .asm_b404f

.data
	db $44, $30, $01

.asm_b404f
	call .Func_b4055
	jp Func_b4082

.Func_b4055:
	ld a, [wCurEvent]
	and a
	ret nz
	ld hl, wSceneObj15
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj14
	ld de, .data_2
	call InitSceneObjParams

	ld a, [w2d011]
	and a
	ret z
	ld a, $18
	ld [wSceneObj15State], a
	ld a, $1a
	ld [wSceneObj14State], a
	ret

.data_1
	db $56, $1c, $19
.data_2
	db $36, $50, $1b

Func_b4082:
	ld hl, wSceneObj13
	ld de, .data
	jp InitSceneObjParams

.data
	db $84, $82, $00

Func_b408e:
	dec c
	ret z
	ld hl, wSceneObj10
	ld de, .data
	jp InitSceneObjParams

.data
	db $40, $80, $03

Func_b409c:
	ld a, GREEN_MUSIC_BOX
	call IsTreasureCollected
	ret nz
	ld a, [wCurEvent]
	and a
	jr nz, .asm_b40b4
	ld a, [wNextMapSide]
	and a
	jr nz, .asm_b40b4
	ld a, [wMapSideLevelID]
	cp OWNORTH_SEA_TURTLE_ROCKS
	ret z
.asm_b40b4
	ld hl, wSceneObj3
	ld de, .data
	jp InitSceneObjParams

.data
	db $66, $74, $05

Func_b40c0:
	ld a, c
	and a
	ret z
	ld hl, wSceneObj4
	ld de, .data_2
	cp $80
	jr nz, .asm_b40d0
	ld de, .data_1
.asm_b40d0
	jp InitSceneObjParams

.data_1
	db $00, $68, $07
.data_2
	db $4c, $66, $0b

Func_b40d9:
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b40f0
	ld hl, wSceneObj1
	ld de, .data_1
	call InitSceneObjParams
	call .asm_b40f0
	xor a
	ld [wSceneObj2State], a
	ret

.asm_b40f0
	ld hl, wSceneObj2
	ld de, .data_2
	jp InitSceneObjParams

.data_1
	db $51, SCREEN_WIDTH_PX, $0f
.data_2
	db $59, $2d, $1d

Func_b40ff:
	ld a, c
	and a
	ret z
	sla c
	jr c, .asm_b4128
	ld a, $01
	ld [w2d12c], a
	ld hl, wSceneObj6
	ld de, .data_1
	call InitSceneObjParams
	ld a, $04
	ld [w2d12e], a
	ld hl, wSceneObj7
	ld de, .data_2
	jp InitSceneObjParams

.data_1
	db $48, $14, $11
.data_2
	db $38, $0f, $10

.asm_b4128
	ld hl, wSceneObj6
	ld de, .data_3
	call InitSceneObjParams
	ld hl, wSceneObj7
	ld de, .data_4
	jp InitSceneObjParams

.data_3
	db $38, $15, $14
.data_4
	db $41, $19, $14

Func_b4140:
	ret

Func_b4141:
	ld b, $00
;	fallthrough

Func_b4143:
	sla c
	ret nc
	ld hl, wSceneObj5
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj5Attributes
	ld [hl], b
	ld hl, wSceneObj1
	ld de, .data_2
	jp InitSceneObjParams

.data_1
	db $00, $70, $1f
.data_2
	db $00, $70, $21

Func_b4162:
	ld b, $00
	jr Func_b4143

Func_b4166:
	ld b, $02
	jr Func_b4143

Func_b416a:
	ld b, $03
	jr Func_b4143

Func_b416e:
	ld b, $03
	jr Func_b4143

Func_b4172:
	ld b, $02
	jr Func_b4143

Func_b4176:
	ld b, $01
	jr Func_b4143

Func_b417a:
	ld a, $80
	cp c
	ret nz

	ld hl, wSceneObj1
	ld de, .data_1
	call InitSceneObjParams

	ld hl, wSceneObj5
	ld de, .data_2
	call InitSceneObjParams

	ld hl, wSceneObj8
	ld de, .data_3
	call InitSceneObjParams

	ld hl, wSceneObj9
	ld de, .data_4
	call InitSceneObjParams

	ld hl, wSceneObj10
	ld de, .data_5
	call InitSceneObjParams

	ld hl, wSceneObj5Attributes
	set 2, [hl]
	ld hl, wSceneObj8Attributes
	set 2, [hl]
	ld hl, wSceneObj9Attributes
	set 2, [hl]
	ld hl, wSceneObj10Attributes
	set 2, [hl]

	farcall Func_80bd9
	farcall VBlank_Overworld

	decompress_bgmap0 BGMap_86868, v0BGMap1
	decompress_bgmap1 BGMap_868b2, v1BGMap1

	xor a
	ld [wWX], a
	ldh [rWX], a
	ld a, SCREEN_HEIGHT_PX
	ld [wWY], a
	ldh [rWY], a
	xor a ; BOTBAR_CLOSED
	ld [wBottomBarAction], a

	; copy empty treasure gfx
	ld hl, TreasureGfx
	ld de, v0Tiles1 tile $10
	ld c, 4 tiles
	ld b, BANK(TreasureGfx)
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

Func_b4247:
	ld a, $80
	cp c
	ret nz

	decompress_bgmap1 BGMap_85eda, v1BGMap0, 29
	decompress_bgmap0 BGMap_85ea7, v0BGMap0, 29

	hlbgcoord 0, 30
	debgcoord 0, 21, wAttrmap
	ld b, 2 * BG_MAP_WIDTH
	call CopyHLToDE

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	hlbgcoord 0, 30
	debgcoord 0, 19, wAttrmap
	ld b, 2 * BG_MAP_WIDTH
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld hl, Pals_84a20
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84a20)
	call CopyFarBytes

	ld hl, wSceneObj5
	ld de, .data
	call InitSceneObjParams

	farcall VBlank_Overworld
	farcall DrawCoinCount

	xor a
	ld [wSceneObj6State], a
	ld [wSceneObj7State], a
	ld [wSceneObj2State], a
	ret

.data
	db $00, $60, $00

Func_b42e7:
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .continue
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .continue
	ret
.continue
	xor a
	ld hl, wSceneObj1
	ld bc, 15 * 8
	call WriteAToHL_BCTimes
	ld hl, wSceneObj1
	ld de, .data
	jp InitSceneObjParams
.data
	db $28, $50, 00

InitOWObjects_West:
	ld a, [wOWSceneActionParam]
	jumptable

	dw Func_b4001
	dw Func_b431f ; WOWFUNC_RAIN
	dw Func_b4351 ; WOWFUNC_CLEAR_TORNADO
	dw Func_b435f ; WOWFUNC_ELEVATOR_WORKING
	dw Func_b438f ; WOWFUNC_MAGIC_SEED
	dw Func_b43a8 ; WOWFUNC_SUMMON_SNAKE
	dw Func_b43dd ; WOWFUNC_EARTHQUAKE
	dw Func_b4448 ; WOWFUNC_VULCANO_ERUPTION
	dw Func_b4474 ; WOWFUNC_RED_MUSIC_BOX

Func_b431f:
	ld a, c
	cp $80
	jr z, .asm_b4339
	and a
	ret z
	ld hl, Data_8550b
	farcall Func_854ee
	ret
.asm_b4339
	ld hl, wSceneObj15
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj14
	ld de, .data_2
	jp InitSceneObjParams

.data_1
	db $56, $5c, $00
.data_2
	db $3a, $5c, $03

Func_b4351:
	dec c
	ret z
	ld hl, wSceneObj1
	ld de, .data
	jp InitSceneObjParams
.data
	db $44, $28, $02

Func_b435f:
	ld hl, wSceneObj8
	ld de, .data_1
	call InitSceneObjParams
	ld a, [w2d065]
	add a
	ret z
	ld a, [wCurEvent]
	and a
	ret nz
	ld hl, wSceneObj7
	ld de, .data_2
	call InitSceneObjParams
	ld a, [w2d011]
	and a
	ld a, $06
	jr z, .asm_b4385
	ld a, $08
.asm_b4385
	ld [wSceneObj8State], a
	ret

.data_1
	db $3b, $80, $09
.data_2
	db $3b, $80, $00

Func_b438f:
	ld a, c
	and a
	ret z
	ld hl, wSceneObj4
	ld de, .data_2
	cp $80
	jr nz, .asm_b439f
	ld de, .data_1
.asm_b439f
	jp InitSceneObjParams

.data_1
	db $00, $68, $0a
.data_2
	db $5b, $60, $0e

Func_b43a8:
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b43ce
	ld hl, wSceneObj1
	ld de, .data_1
	call InitSceneObjParams
	call .asm_b43ce
	xor a
	ld [wSceneObj5State], a
	hlbgcoord 16, 5, wAttrmap
	res BGB_PRI, [hl]
	hlbgcoord 16, 6, wAttrmap
	res BGB_PRI, [hl]
	hlbgcoord  0, 7, wAttrmap
	res BGB_PRI, [hl]
	ret
.asm_b43ce
	ld hl, wSceneObj5
	ld de, .data_2
	jp InitSceneObjParams

.data_1
	db $32, SCREEN_WIDTH_PX, $12
.data_2
	db $3a, $2e, $13

Func_b43dd:
	ld a, c
	and a
	ret z
	dec a
	jr nz, .asm_b43e9
	ld hl, Data_85549
	jp Func_b586d
.asm_b43e9
	ld hl, wSceneObj11
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj12
	ld de, .data_2
	call InitSceneObjParams
	ld hl, wSceneObj13
	ld de, .data_3
	call InitSceneObjParams
	ld hl, wSceneObj14
	ld de, .data_4
	call InitSceneObjParams
	ld hl, wSceneObj15
	ld de, .data_5
	call InitSceneObjParams
	ld hl, wSceneObj10
	ld de, .data_6
	call InitSceneObjParams

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

Func_b4448:
	ld a, c
	and a
	ret z
	sla a
	jr c, .asm_b4455
.asm_b444f
	ld hl, Data_85536
	jp Func_b586d
.asm_b4455
	ld a, [wOWSceneActionParam]
	ld b, a
	ld a, [wTempUnlockableConnectionID]
	cp b
	jr nz, .asm_b444f
	ld hl, wSceneObj11
	ld de, Func_b43dd.data_1
	call InitSceneObjParams
	ld hl, wSceneObj10
	ld de, Func_b43dd.data_6
	call InitSceneObjParams
	jp LoadOverworld4Gfx

Func_b4474:
	ld a, c
	and a
	ret z
	call LoadOverworld3Gfx
	ld hl, wSceneObj6
	ld de, .data
	call InitSceneObjParams
	ld a, [w2d065]
	add a
	jr z, .asm_b448f
	ld hl, Data_8556e
	jp Func_b586d
.asm_b448f
	xor a
	ld [wSceneObj6State], a
	ld hl, wSceneObj6YCoord
	inc [hl]
	ret

.data
	db $78, $3c, $23

InitOWObjects_South:
	ld a, [wOWSceneActionParam]
	jumptable

	dw Func_b4001
	dw Func_b44b7 ; SOWFUNC_SEND_SEEDS
	dw Func_b44e7 ; SOWFUNC_MAGIC_SEED
	dw Func_b4509 ; SOWFUNC_YELLOW_MUSIC_BOX
	dw Func_b4520 ; SOWFUNC_CANYON_THUNDER
	dw Func_b4567 ; SOWFUNC_RAISE_TOWER
	dw Func_b45c8 ; SOWFUNC_FAN
	dw Func_b45f5 ; SOWFUNC_SUMMON_SNAKE
	dw Func_b461b ; SOWFUNC_EARTHQUAKE
	dw Func_b4637 ; SOWFUNC_GREEN_MUSIC_BOX
	dw Func_b4653 ; SOWFUNC_EXPLOSIVES
	dw Func_b4665 ; SOWFUNC_FULL_MOON

Func_b44b7:
	ld a, $80
	cp c
	ret nz
	ld a, [wOWSceneActionParam]
	ld hl, wTempUnlockableConnectionID
	cp [hl]
	ret nz
	ld hl, wSceneObj2
	ld de, .data_2
	call InitSceneObjParams
	ld hl, wSceneObj3
	ld de, .data_3
	call InitSceneObjParams
	ld hl, wSceneObj4
	ld de, .data_1
	jp InitSceneObjParams

.data_1
	db $38, $4c, $00
.data_2
	db $38, $44, $00
.data_3
	db $38, $54, $00

Func_b44e7:
	ld a, c
	and a
	ret z
	ld hl, wSceneObj4
	ld de, .data_2
	cp $80
	jr nz, .asm_b4500
	ld a, [wOWSceneActionParam]
	ld b, a
	ld a, [wTempUnlockableConnectionID]
	cp b
	ret nz
	ld de, .data_1
.asm_b4500
	jp InitSceneObjParams

.data_1
	db $00, $16, $05
.data_2
	db $56, $1a, $01

Func_b4509:
	ld hl, wSceneObj6
	ld de, .data
	call InitSceneObjParams
	ld a, [w2d065]
	dec a
	ret nz
	ld hl, wSceneObj6State
	inc [hl]
	inc [hl]
	ret

.data
	db $3d, $31, $07

Func_b4520:
	ld a, $80
	cp c
	jr z, .asm_b4542
	dec c
	ret nz
	ld hl, Data_855b2
	farcall Func_854ee
.asm_b4539
	ld hl, wSceneObj5
	ld de, .data_3
	jp InitSceneObjParams
.asm_b4542
	ld hl, wSceneObj2
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj10
	ld de, .data_2
	call InitSceneObjParams
	call .asm_b4539
	xor a
	ld [wSceneObj5State], a
	jp LoadOverworldThunderGfx

.data_1
	db $48, $38, $00
.data_2
	db $3d, $2f, $00
.data_3
	db $68, $44, $0a

Func_b4567:
	ld a, c
	dec a
	jr z, .asm_b459a
	sla c
	ret nc

	ld hl, wSceneObj2
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj3
	ld de, .data_2
	call InitSceneObjParams

	ld b, 3
	ld de, BG_MAP_WIDTH - 1
	hlbgcoord 14, 9, wAttrmap
.loop
	set BGB_PRI, [hl]
	inc hl
	set BGB_PRI, [hl]
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
	ld a, [wCurEvent]
	and a
	ret nz
	ld hl, wSceneObj15
	ld de, .data_3
	call InitSceneObjParams
	ld a, [w2d011]
	and a
	ret z
	ld a, $1e
	ld [wSceneObj15State], a
	ret

.data_3
	db $29, $78, $1f

Func_b45c8:
	ld a, c
	and a
	jr z, .asm_b45e3
	dec a
	ret z
	ld hl, wSceneObj1
	ld de, .data_2
	call InitSceneObjParams
	ld hl, wSceneObj8
	ld de, .data_3
	call InitSceneObjParams
	call LoadOverworldFanGfx
.asm_b45e3
	ld hl, wSceneObj9
	ld de, .data_1
	jp InitSceneObjParams

.data_1
	db $4d, $8a, $10
.data_2
	db $5c, $82, $00
.data_3
	db $64, $78, $19

Func_b45f5:
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b460c
	ld hl, wSceneObj1
	ld de, .data_1
	call InitSceneObjParams
	call .asm_b460c
	xor a
	ld [wSceneObj7State], a
	ret
.asm_b460c
	ld hl, wSceneObj7
	ld de, .data_2
	jp InitSceneObjParams

.data_1
	db $37, SCREEN_WIDTH_PX, $16
.data_2
	db $3f, $10, $1d

Func_b461b:
	ld a, c
	and a
	ret z
	sla c
	jr c, .asm_b4628
	ld hl, Data_855f9
	jp Func_b586d
.asm_b4628
	ld hl, wSceneObj2
	ld de, .data
	call InitSceneObjParams
	jp LoadOverworldThunderGfx

.data
	db $5f, $3d, $00

Func_b4637:
	ld a, c
	and a
	ret z
	sla c
	jr c, .asm_b4644
	ld hl, Data_8560e
	jp Func_b586d
.asm_b4644
	ld hl, wSceneObj2
	ld de, .data
	call InitSceneObjParams
	jp LoadOverworldThunderGfx

.data
	db $20, $48, $00

Func_b4653:
	sla c
	ret nc
	ld hl, wSceneObj2
	ld de, .data
	call InitSceneObjParams
	jp LoadOverworldExplosion1Gfx

.data
	db $20, $44, $00

Func_b4665:
	xor a
	cp c
	ret z
	ld hl, wSceneObj14
	ld de, .data
	call InitSceneObjParams
	ld a, $80
	cp c
	ret z
	ld a, [w2d011]
	and a
	ret z
	ld a, $80
	ld [wSceneObj14XCoord], a
	ld a, $15
	ld [wSceneObj14YCoord], a
	ret

.data
	db $25, $70, $20

InitOWObjects_East:
	ld a, [wOWSceneActionParam]
	jumptable

	dw Func_b4001
	dw Func_b46a0 ; EOWFUNC_FREEZE_SEA
	dw Func_b46d9 ; EOWFUNC_EARTHQUAKE
	dw Func_b4712 ; EOWFUNC_FORM_CASTLE
	dw Func_b4771 ; EOWFUNC_EXPLOSIVES
	dw Func_b4792 ; EOWFUNC_VULCANO_ERUPTION
	dw Func_b47f7 ; EOWFUNC_BURN_VINES
	dw Func_b481b ; EOWFUNC_SHOW_WARPED_VOID
	dw Func_b4832 ; EOWFUNC_RAISE_PIPE
	dw Func_b4873 ; EOWFUNC_DAYTIME

Func_b46a0:
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
	ld de, wTilemap + $14f
	ld c, $91
	ld b, BANK(BGMap_857f7)
	call CopyFarBytes
	ld hl, BGMap_85897
	debgcoord 15, 10, wAttrmap
	ld c, $91
	ld b, BANK(BGMap_85897)
	jp CopyFarBytes

.asm_b46cd
	ld hl, wSceneObj1
	ld de, .data
	jp InitSceneObjParams

.data
	db $64, $e8, $01

Func_b46d9:
	ld a, c
	and a
	jr z, .asm_b46e7
	cp $80
	jr z, .asm_b46f0
	ld hl, Data_8563e
	jp Func_b586d
.asm_b46e7
	ld hl, wSceneObj6
	ld de, .data_1
	jp InitSceneObjParams

.asm_b46f0
	call .asm_b46e7
	ld hl, wSceneObj15
	ld de, .data_2
	call InitSceneObjParams

	hlbgcoord 3, 10, wAttrmap
	ld b, 4
	call SetBGMapBytesPriority
	hlbgcoord 3, 11, wAttrmap
	ld b, 4
	jp SetBGMapBytesPriority

.data_1
	db $55, $28, $02
.data_2
	db $10, $5c, $07

Func_b4712:
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
	ld hl, wSceneObj1
	ld de, .data_1
	call InitSceneObjParams
	xor a
	ld [wSceneObj7State], a
	jp LoadOverworldExplosion2Gfx

.data_1
	db $3f, $1c, $00

.data_2
	db $28, $28, $12

.Func_b4757
	ld a, [wTempOWSceneAction]
	cp UNLOCK_LEVEL
	ret z
	ld hl, wSceneObj7
	ld de, .data_2
	call InitSceneObjParams
	ld a, [w2d011]
	and a
	ret nz
	ld a, $13
	ld [wSceneObj7State], a
	ret

Func_b4771:
	sla c
	ret nc
	ld hl, wSceneObj2
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj1
	ld de, .data_2
	call InitSceneObjParams
	call LoadOverworldExplosion3Gfx
	jp LoadOverworldSmokeGfx

.data_1
	db $54, $22, $00
.data_2
	db $4C, $48, $00

Func_b4792:
	ld a, c
	and a
	ret z
	sla c
	jr nc, .asm_b47dc
	ld a, [wOWSceneActionParam]
	ld b, a
	ld a, [wTempUnlockableConnectionID]
	cp b
	jr nz, .asm_b47dc

	ld hl, wSceneObj10
	ld de, .data_1
	call InitSceneObjParams
	ld hl, wSceneObj12
	ld de, .data_3
	call InitSceneObjParams
	ld hl, wSceneObj13
	ld de, .data_4
	call InitSceneObjParams
	ld hl, wSceneObj14
	ld de, .data_5
	call InitSceneObjParams
	ld hl, wSceneObj15
	ld de, .data_6
	call InitSceneObjParams
	ld hl, wSceneObj11
	ld de, .data_7
	call InitSceneObjParams

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

Func_b47f7:
	ld a, c
	dec c
	ret z
	and a
	jr z, .asm_b480c
	call .asm_b480c
	ld hl, wSceneObj1
	ld de, .data_2
	call InitSceneObjParams
	jp LoadOverworldTorchGfx
.asm_b480c
	ld hl, wSceneObj9
	ld de, .data_1
	jp InitSceneObjParams

.data_1
	db $45, $87, $17
.data_2
	db $45, $87, $00

Func_b481b:
	ld a, c
	and a
	ret z
	ld hl, wSceneObj5
	ld de, .data
	call InitSceneObjParams
	sla c
	ret nc
	xor a
	ld [wSceneObj5State], a
	ret

.data
	db $60, $88, $19

Func_b4832:
	ld a, c
	and a
	ret z
	dec c
	jr z, .asm_b4864
	call .asm_b4864
	ld a, [wSceneObj8YCoord]
	add $08
	ld [wSceneObj8YCoord], a
	ld hl, wSceneObj2
	ld de, .data_2
	call InitSceneObjParams
	hlbgcoord 14, 7, wAttrmap
	ld b, 3
	call SetBGMapBytesPriority
	hlbgcoord 14, 8, wAttrmap
	ld b, 3
	call SetBGMapBytesPriority
	hlbgcoord 14, 9, wAttrmap
	ld b, 2
	jp SetBGMapBytesPriority

.asm_b4864
	ld hl, wSceneObj8
	ld de, .data_1
	jp InitSceneObjParams

.data_1
	db $37, $7c, $1c
.data_2
	db $40, $7c, $21

Func_b4873:
	ret

Func_b4874:
	ld hl, .pal
	ld de, wTempPals1 palette 4
	ld b, 1 palettes
	jp CopyHLToDE

.pal
	rgb 16, 14, 23
	rgb  0, 10, 18
	rgb  0,  0,  0
	rgb  3,  0,  3

; sets the coords and state
; of SceneObj in hl, with params in de
InitSceneObjParams:
	ld a, [de]
	ld [hli], a ; y
	inc de
	ld a, [de]
	ld [hli], a ; x
	inc l
	inc l
	xor a
	ld [hli], a ; duration
	ld [hli], a ; frameset offset
	inc de
	ld a, [de]
	ld [hl], a ; state
	ret

; unreferenced
Func_b4895:
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hld], a
	call GetOWCoordInTilemap
	inc de
	ld a, [de]
	ld [hl], a
	dec h
	dec h
	dec h
	inc de
	ld a, [de]
	ld [hl], a
	ret

; sets the priority bit of b bytes
; starting from hl in BGMap
SetBGMapBytesPriority:
.loop
	set BGB_PRI, [hl]
	inc hl
	dec b
	jr nz, .loop
	ret

LoadOverworld3Gfx:
	decompress_tiles0 Overworld3Gfx, v0Tiles0
	ret

LoadOverworld4Gfx:
	decompress_tiles0 Overworld4Gfx, v0Tiles0
	ret

LoadOverworldRocksGfx:
	decompress_tiles0 OverworldRocksGfx, v0Tiles0, $58
	ret

LoadOverworldTowerGfx:
	decompress_tiles0 OverworldTowerGfx, v0Tiles0, $60
	ret

LoadOverworldFanGfx:
	decompress_tiles0 OverworldFanGfx, v0Tiles0, $60
	ret

LoadOverworldExplosion1Gfx:
	decompress_tiles0 OverworldExplosion1Gfx, v0Tiles0
	ret

LoadOverworldThunderGfx:
	decompress_tiles0 OverworldThunderGfx, v0Tiles0
	ret

LoadOverworldExplosion2Gfx:
	decompress_tiles0 OverworldExplosion2Gfx, v0Tiles0
	ret

LoadOverworldTorchGfx:
	decompress_tiles0 OverworldTorchGfx, v0Tiles0, $40
	ret

LoadOverworldFireGfx:
	decompress_tiles0 OverworldFireGfx, v0Tiles0
	ret

LoadOverworldExplosion3Gfx:
	decompress_tiles0 OverworldExplosion3Gfx, v0Tiles0
	ret

LoadOverworldSmokeGfx:
	decompress_tiles0 OverworldSmokeGfx, v0Tiles0, $32
	ret

UpdateCurOWOjAnimation:
	ld b, $2a
	ld a, [wCurSceneObjPtr + 0]
	ld l, a
	set 2, l
	ld a, [wCurSceneObjPtr + 1]
	ld h, a
	jp UpdateOWAnimation

Func_b4a0d:
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

LoadCurSceneObjSpriteWithScroll:
	ld b, $2a
	ld a, [wCurSceneObjPtr + 0]
	ld l, a
	ld a, [wCurSceneObjPtr + 1]
	ld h, a
	jp LoadOWSpriteWithScroll

LoadCurSceneObjSprite:
	ld b, $2a
	ld a, [wCurSceneObjPtr + 0]
	ld l, a
	ld a, [wCurSceneObjPtr + 1]
	ld h, a
	jp LoadOWSprite

Func_b4a37:
	call Func_b4a3d
	jp Func_b4aa9

Func_b4a3d:
	ld a, [wCurMapSide]
	jumptable

	dw .North ; NORTH
	dw .West  ; WEST
	dw .South ; SOUTH
	dw .East  ; EAST

.North
	ld bc, wSceneObj1State
	call Func_b4fa2
	ld bc, wSceneObj2State
	call Func_b4fa2
	ld bc, wSceneObj3State
	call Func_b4fa2
	ld bc, wSceneObj4State
	jp Func_b4fa2

.West
	ld bc, wSceneObj1State
	call Func_b4dfb
	ld bc, wSceneObj2State
	call Func_b4dfb
	ld bc, wSceneObj3State
	call Func_b4dfb
	ld bc, wSceneObj4State
	jp Func_b4dfb

.South
	ld bc, wSceneObj1State
	call Func_b4cc2
	ld bc, wSceneObj2State
	call Func_b4cc2
	ld bc, wSceneObj3State
	call Func_b4cc2
	ld bc, wSceneObj4State
	jp Func_b4cc2

.East
	ld bc, wSceneObj1State
	call Func_b4b99
	ld bc, wSceneObj2State
	call Func_b4b99
	ld bc, wSceneObj3State
	call Func_b4b99
	ld bc, wSceneObj4State
	jp Func_b4b99

Func_b4aa9:
	ld a, [wCurMapSide]
	jumptable

	dw .North ; NORTH
	dw .West  ; WEST
	dw .South ; SOUTH
	dw .East  ; EAST

.North
	ld bc, wSceneObj5State
	call Func_b4fa2
	ld bc, wSceneObj6State
	call Func_b4fa2
	ld bc, wSceneObj7State
	call Func_b4fa2
	ld bc, wSceneObj8State
	call Func_b4fa2
	ld bc, wSceneObj9State
	call Func_b4fa2
	ld bc, wSceneObj10State
	call Func_b4fa2
	ld bc, wSceneObj13State
	call Func_b4fa2
	ld bc, wSceneObj14State
	call Func_b4fa2
	ld bc, wSceneObj15State
	jp Func_b4fa2

.West
	ld bc, wSceneObj5State
	call Func_b4dfb
	ld bc, wSceneObj6State
	call Func_b4dfb
	ld bc, wSceneObj7State
	call Func_b4dfb
	ld bc, wSceneObj8State
	call Func_b4dfb
	ld bc, wSceneObj10State
	call Func_b4dfb
	ld bc, wSceneObj11State
	call Func_b4dfb
	ld bc, wSceneObj12State
	call Func_b4dfb
	ld bc, wSceneObj13State
	call Func_b4dfb
	ld bc, wSceneObj14State
	call Func_b4dfb
	ld bc, wSceneObj15State
	jp Func_b4dfb

.South
	ld bc, wSceneObj5State
	call Func_b4cc2
	ld bc, wSceneObj6State
	call Func_b4cc2
	ld bc, wSceneObj7State
	call Func_b4cc2
	ld bc, wSceneObj8State
	call Func_b4cc2
	ld bc, wSceneObj9State
	call Func_b4cc2
	ld bc, wSceneObj10State
	call Func_b4cc2
	ld bc, wSceneObj14State
	call Func_b4cc2
	ld bc, wSceneObj15State
	jp Func_b4cc2

.East
	ld bc, wSceneObj5State
	call Func_b4b99
	ld bc, wSceneObj6State
	call Func_b4b99
	ld bc, wSceneObj7State
	call Func_b4b99
	ld bc, wSceneObj8State
	call Func_b4b99
	ld bc, wSceneObj9State
	call Func_b4b99
	ld bc, wSceneObj10State
	call Func_b4b99
	ld bc, wSceneObj11State
	call Func_b4b99
	ld bc, wSceneObj12State
	call Func_b4b99
	ld bc, wSceneObj13State
	call Func_b4b99
	ld bc, wSceneObj14State
	call Func_b4b99
	ld bc, wSceneObj15State
	jp Func_b4b99

Func_b4b99:
	ld a, c
	and $f8
	ld hl, wCurSceneObjPtr
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4ba2:
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

Func_b4be9:
	ld de, Frameset_a9e61
	jr Func_b4c57

Func_b4bee:
	ld de, Frameset_a9e72
	jr Func_b4c57

Func_b4bf3:
	ld de, Frameset_a9e75
	jr Func_b4c57

Func_b4bf8:
	ld de, Frameset_a9e94
	jr Func_b4c57

Func_b4bfd:
	ld de, Frameset_a9e7a
	jr Func_b4c60

Func_b4c02:
	ld de, Frameset_a9e8c
	jr Func_b4c57

Func_b4c07:
	ld de, Frameset_a9e91
	jr Func_b4c57

Func_b4c0c:
	ld de, Frameset_a9fd0
	jr Func_b4c60

Func_b4c11:
	ld de, Frameset_a9e99
	jr Func_b4c60

Func_b4c16:
	ld de, Frameset_a9ed3
	jr Func_b4c57

Func_b4c1b:
	ld de, Frameset_a9eea
	call UpdateCurOWOjAnimation
	ld b, $0b
	jr Func_b4c65

Func_b4c25:
	ld de, Frameset_a9ef1
	jr Func_b4c57

Func_b4c2a:
	ld de, Frameset_a9ee3
	jr Func_b4c57

Func_b4c2f:
	ld de, Frameset_a9ef6
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b4c65

Func_b4c39:
	ld de, Frameset_a9efd
	jr Func_b4c57

Func_b4c3e:
	ld de, Frameset_a9ee0
	jr Func_b4c57

Func_b4c43:
	ld de, Frameset_a9f02
	jr Func_b4c57

Func_b4c48:
	ld de, Frameset_a9f0d
	jr Func_b4c57

Func_b4c4d:
	ld de, Frameset_a9ecd
	jr Func_b4c57

Func_b4c52:
	ld de, Frameset_a9ed0
	jr Func_b4c57

Func_b4c57:
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4c5a:
	ld de, OAM_a980c
	jp LoadCurSceneObjSpriteWithScroll

Func_b4c60:
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4c65:
	call Func_b4a0d
	jp z, Func_b4ba2
	jr Func_b4c5a

Func_b4c6d:
	ld de, Frameset_a9eaa
	jr Func_b4c57

Func_b4c72:
	ld de, Frameset_a9eb3
	jr Func_b4c57

Func_b4c77:
	ld de, Frameset_a9ebc
	jr Func_b4c57

Func_b4c7c:
	ld de, Frameset_a9ec5
	jr Func_b4c57

Func_b4c81:
	ld de, Frameset_a9ec8
	jr Func_b4c60

Func_b4c86:
	ld de, Frameset_a9f36
	jr Func_b4c57

Func_b4c8b:
	ld de, Frameset_a9f47
	call UpdateCurOWOjAnimation
	ld b, $1b
	jr Func_b4c65

Func_b4c95:
	ld de, Frameset_a9f76
	call UpdateCurOWOjAnimation
	ld b, $19
	jr Func_b4c65

Func_b4c9f:
	ld de, Frameset_a9fa7
	jr Func_b4c57

Func_b4ca4:
	ld de, Frameset_a9faa
	call UpdateCurOWOjAnimation
	ld b, $1c
	jr Func_b4c65

Func_b4cae:
	ld de, Frameset_a9fc9
	jr Func_b4c57

Func_b4cb3:
	ld de, Frameset_a9fbb
	jr Func_b4c57

Func_b4cb8:
	ld de, Frameset_a9fc2
	jr Func_b4c57

Func_b4cbd:
	ld de, Frameset_a9fdf
	jr Func_b4c57

Func_b4cc2:
	ld a, c
	and $f8
	ld hl, wCurSceneObjPtr
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4ccb:
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

Func_b4d0e:
	ld de, Frameset_a96c0
	jp Func_b4da0

Func_b4d14:
	ld de, Frameset_a968d
	call UpdateCurOWOjAnimation
	ld b, $01
	jp Func_b4dae

Func_b4d1f:
	ld de, Frameset_a967d
	jp Func_b4da0

Func_b4d25:
	ld de, Frameset_a9680
	jp Func_b4da0

Func_b4d2b:
	ld de, Frameset_a9674
	jp Func_b4da0

Func_b4d31:
	ld de, Frameset_a9680
	call UpdateCurOWOjAnimation
	ld b, $03
	jp Func_b4dae

Func_b4d3c:
	ld de, Frameset_a96af
	jr Func_b4da0

Func_b4d41:
	ld de, Frameset_a96b2
	call UpdateCurOWOjAnimation
	ld b, $09
	jr Func_b4dae

Func_b4d4b:
	ld de, Frameset_a96bd
	jr Func_b4da0

Func_b4d50:
	ld de, Frameset_a96d1
	jr Func_b4da0

Func_b4d55:
	ld de, Frameset_a969a
	jr Func_b4da0

Func_b4d5a:
	ld de, Frameset_a96a3
	jr Func_b4da0

Func_b4d5f:
	ld de, Frameset_a96a6
	jr Func_b4da0

Func_b4d64:
	ld de, Frameset_a96a9
	jr Func_b4da0

Func_b4d69:
	ld de, Frameset_a96ac
	jr Func_b4da0

Func_b4d6e:
	ld de, Frameset_a96d8
	jr Func_b4da0

Func_b4d73:
	ld de, Frameset_a96e1
	jr Func_b4da9

Func_b4d78:
	ld de, Frameset_a96ea
	jr Func_b4da9

Func_b4d7d:
	ld de, Frameset_a96ef
	call UpdateCurOWOjAnimation
	ld b, $15
	jr Func_b4dae

Func_b4d87:
	ld de, Frameset_a974a
	call UpdateCurOWOjAnimation
	ld b, $15
	jr Func_b4dae

Func_b4d91:
	ld de, Frameset_a979f
	jr Func_b4da0

Func_b4d96:
	ld de, Frameset_a97a2
	jr Func_b4da0

Func_b4d9b:
	ld de, Frameset_a97ad
	jr Func_b4da9

Func_b4da0:
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4da3:
	ld de, OAM_a9161
	jp LoadCurSceneObjSpriteWithScroll
;	fallthrough

Func_b4da9:
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4dae:
	call Func_b4a0d
	jp z, Func_b4ccb
	jr Func_b4da3

Func_b4db6:
	ld de, Frameset_a97e1
	jr Func_b4da0

Func_b4dbb:
	ld de, Frameset_a97ec
	jr Func_b4da0

Func_b4dc0:
	ld de, Frameset_a97d4
	call UpdateCurOWOjAnimation
	ld a, [wOWAnimationFinished]
	cp $ff
	call z, Func_b4dd4
	ld de, OAM_a9161
	jp LoadCurSceneObjSpriteWithScroll

Func_b4dd4:
	play_sfx SFX_12F
	ret

Func_b4ddd:
	ld de, Frameset_a97c5
	jr Func_b4da9

Func_b4de2:
	ld de, Frameset_a97ef
	jr Func_b4da9

Func_b4de7:
	ld de, Frameset_a97b2
	call UpdateCurOWOjAnimation
	ld b, $15
	jr Func_b4dae

Func_b4df1:
	ld de, Frameset_a97fe
	jr Func_b4da0

Func_b4df6:
	ld de, Frameset_a9803
	jr Func_b4da0

Func_b4dfb:
	ld a, c
	and $f8
	ld hl, wCurSceneObjPtr
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4e04:
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

Func_b4e4d:
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4e50:
	ld de, OAM_a884a
	jp LoadCurSceneObjSpriteWithScroll

Func_b4e56:
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4e5b:
	call Func_b4a0d
	jr z, Func_b4e04
	jr Func_b4e50

Func_b4e62:
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b4e65:
	ld de, OAM_a8f57
	jp LoadCurSceneObjSpriteWithScroll

; unreferenced
Func_b4e6b:
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b4e70:
	call Func_b4a0d
	jr z, Func_b4e04
	jr Func_b4e65

Func_b4e77:
	ld de, Frameset_a8de9
	jr Func_b4e56

Func_b4e7c:
	ld de, Frameset_a8de2
	jr Func_b4e4d

Func_b4e81:
	ld de, Frameset_a8dd1
	jr Func_b4e4d

Func_b4e86:
	ld de, Frameset_a8e1e
	jr Func_b4e56

Func_b4e8b:
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

Func_b4ea4:
	ld de, Frameset_a8e2c
	jr Func_b4e4d

Func_b4ea9:
	ld de, Frameset_a8e5d
	call Func_b4e56
	ld a, [wSceneObj7State]
	and a
	ret nz
	ld [wSceneObj8Duration], a
	ld a, $08
	ld [wSceneObj8State], a
	ret

Func_b4ebd:
	ld de, Frameset_a8e6c
	jr Func_b4e4d

Func_b4ec2:
	ld de, Frameset_a8df8
	jp Func_b4e4d

Func_b4ec8:
	ld de, Frameset_a8e04
	call UpdateCurOWOjAnimation
	ld b, $0c
	jr Func_b4e5b

Func_b4ed2:
	ld de, Frameset_a8e01
	jp Func_b4e4d

Func_b4ed8:
	ld de, Frameset_a8e11
	call UpdateCurOWOjAnimation
	ld b, $0e
	jp Func_b4e5b

Func_b4ee3:
	ld de, Frameset_a8f17
	jp Func_b4e4d

Func_b4ee9:
	ld de, Frameset_a9090
	call UpdateCurOWOjAnimation
	ld b, $11
	jp Func_b4e70

Func_b4ef4:
	ld de, Frameset_a90eb
	call UpdateCurOWOjAnimation
	ld b, $11
	jp Func_b4e70

Func_b4eff:
	ld de, Frameset_a9140
	jp Func_b4e62

Func_b4f05:
	ld de, Frameset_a9143
	jp Func_b4e62

Func_b4f0b:
	ld de, Frameset_a914e
	call UpdateCurOWOjAnimation
	ld b, $11
	jp Func_b4e70

Func_b4f16:
	ld de, Frameset_a8e9d
	jp Func_b4e56

Func_b4f1c:
	ld de, Frameset_a8eac
	jp Func_b4e56

Func_b4f22:
	ld de, Frameset_a8eb7
	jp Func_b4e56

Func_b4f28:
	ld de, Frameset_a8ec2
	jp Func_b4e4d

Func_b4f2e:
	ld de, Frameset_a8ec7
	jp Func_b4e4d

Func_b4f34:
	ld de, Frameset_a8eca
	jp Func_b4e4d

Func_b4f3a:
	ld de, Frameset_a8eca
	jp Func_b4e56

Func_b4f40:
	ld de, Frameset_a8ed3
	jp Func_b4e4d

Func_b4f46:
	ld de, Frameset_a8eda
	jp Func_b4e4d

Func_b4f4c:
	ld de, Frameset_a8ee1
	jp Func_b4e4d

Func_b4f52:
	ld de, Frameset_a8ee8
	call Func_b4e4d
;	fallthrough

Func_b4f58:
	ld hl, wTempPals1 palette 5
	ld a, [wSceneObj11Frame]
	cp $57
	jr z, .asm_b4f6b
	ld a, [wSceneObj11State]
	and a
	jr z, .asm_b4f6b
	ld hl, .pal
.asm_b4f6b
	ld de, wTempBGPals palette 5
	ld b, 1 palettes
	call CopyHLToDE
	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hl], a
	ret

.pal
	rgb 12, 29,  0
	rgb 31, 31, 31
	rgb 31, 26,  2
	rgb 31,  0, 10

Func_b4f82:
	ld de, Frameset_a8ee8
	call Func_b4e56
	jr Func_b4f58

Func_b4f8a:
	ld de, Frameset_a8f28
	jp Func_b4e4d

Func_b4f90:
	ld de, Frameset_a8f31
	jp Func_b4e4d

Func_b4f96:
	ld de, Frameset_a8f47
	jp Func_b4e4d

Func_b4f9c:
	ld de, Frameset_a8f3a
	jp Func_b4e4d

Func_b4fa2:
	ld a, c
	and $f8
	ld hl, wCurSceneObjPtr
	ld [hli], a
	ld [hl], b
	ld a, [bc]
;	fallthrough

Func_b4fab:
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

Func_b5004:
	ld de, Frameset_a85cd
	jr Func_b507c

Func_b5009:
	ld de, Frameset_a8590
	jr Func_b5085

Func_b500e:
	ld de, Frameset_a85d0
	jr Func_b507c

Func_b5013:
	ld de, Frameset_a85d3
	jr Func_b5085

Func_b5018:
	ld de, Frameset_a862a
	jr Func_b507c

Func_b501d:
	ld de, Frameset_a8653
	jr Func_b5085

Func_b5022:
	ld de, Frameset_a862d
	jr Func_b507c

Func_b5027:
	ld de, Frameset_a8639
	call UpdateCurOWOjAnimation
	ld b, $09
	jr Func_b508a

Func_b5031:
	ld de, Frameset_a8636
	jr Func_b507c

Func_b5036:
	ld de, Frameset_a8646
	call UpdateCurOWOjAnimation
	ld b, $0b
	jr Func_b508a

Func_b5040:
	ld de, Frameset_a866e
	jr Func_b507c

Func_b5045:
	ld de, Frameset_a867f
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b508a

Func_b504f:
	ld de, Frameset_a86da
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b508a

Func_b5059:
	ld de, Frameset_a872f
	jr Func_b507c

Func_b505e:
	ld de, Frameset_a8732
	jr Func_b507c

Func_b5063:
	ld de, Frameset_a8750
	jr Func_b507c

Func_b5068:
	ld de, Frameset_a8761
	jr Func_b507c

Func_b506d:
	ld de, Frameset_a879a
	jr Func_b507c

Func_b5072:
	ld de, Frameset_a8764
	jr Func_b507c

Func_b5077:
	ld de, Frameset_a876f
	jr Func_b507c

Func_b507c:
	call UpdateCurOWOjAnimation
;	fallthrough

Func_b507f:
	ld de, OAM_a8000
	jp LoadCurSceneObjSpriteWithScroll

Func_b5085:
	call UpdateCurOWOjAnimation
	ld b, $00
;	fallthrough

Func_b508a:
	call Func_b4a0d
	jp z, Func_b4fab
	jp Func_b507f

Func_b5093:
	ld de, Frameset_a8782
	call UpdateCurOWOjAnimation
	ld b, $18
	jr Func_b508a

Func_b509d:
	ld de, Frameset_a8793
	call UpdateCurOWOjAnimation
	ld b, $19
	jr Func_b508a

Func_b50a7:
	ld de, Frameset_a877a
	jr Func_b507c

Func_b50ac:
	ld de, Frameset_a877d
	jr Func_b507c

Func_b50b1:
	ld de, Frameset_a879f
	jr Func_b5085

Func_b50b6:
	ld de, Frameset_a873d
	call UpdateCurOWOjAnimation
	ld b, $0e
	jr Func_b508a

Func_b50c0:
	ld de, Frameset_a87d2
	call UpdateCurOWOjAnimation
	ld b, $20
	jr Func_b508a

Func_b50ca:
	ld de, Frameset_a87d9
	jr Func_b507c

Func_b50cf:
	ld de, Frameset_a87dc
	jr Func_b507c

Func_b50d4:
	ld de, Frameset_a87df
	jr Func_b507c

Func_b50d9:
	ld de, Frameset_aa5f5
	jr Func_b50e1

Func_b50de:
	ld de, Frameset_aa5f8
;	fallthrough

Func_b50e1:
	call UpdateCurOWOjAnimation
	ld de, OAM_aa580
	jp LoadCurSceneObjSpriteWithScroll

Func_b50ea:
	ld de, Frameset_aa252
	call UpdateCurOWOjAnimation
	ld de, OAM_aa0cf
	jp LoadCurSceneObjSpriteWithScroll

Func_b50f6:
	ld de, Frameset_aa0a3
	jr Func_b5114

Func_b50fb:
	ld de, Frameset_aa0c1
	call UpdateCurOWOjAnimation
	ld b, $27
	jr Func_b5114.asm_b5122

Func_b5105:
	ld de, Frameset_aa09d
	jr Func_b5114

Func_b510a:
	ld de, Frameset_aa0bc
	call UpdateCurOWOjAnimation
	ld b, $25
	jr Func_b5114.asm_b5122

Func_b5114:
	call UpdateCurOWOjAnimation
.asm_b5117
	ld de, OAM_a9fe2
	jp LoadCurSceneObjSpriteWithScroll

	call UpdateCurOWOjAnimation
	ld b, $00
.asm_b5122
	call Func_b4a0d
	jp z, Func_b4fab
	jr .asm_b5117

Func_b512a:
	ld de, Frameset_a87e8
	jp Func_b507c

Func_b5130:
	ld de, Frameset_a87f1
	jp Func_b507c

Func_b5136:
	ld de, Frameset_a883b
	call UpdateCurOWOjAnimation
	ld b, $00
	call Func_b4a0d
	jp z, Func_b4fab
	ld de, OAM_a87fa
	jp LoadCurSceneObjSprite

_DoOWFunction:
	ld hl, wOWFuncCounter
	inc [hl]
	ld a, [wCurMapSide]
	jumptable

	dw NorthOWFunctions ; NORTH
	dw WestOWFunctions  ; WEST
	dw SouthOWFunctions ; SOUTH
	dw EastOWFunctions  ; EAST

NorthOWFunctions:
	ld a, [wOWSceneActionParam]
	dec a
	jumptable

	dw NOWFunc_CutTree       ; NOWFUNC_CUT_TREE
	dw NOWFunc_OpenGate      ; NOWFUNC_OPEN_GATE
	dw NOWFunc_Garlic        ; NOWFUNC_GARLIC
	dw NOWFunc_MagicSeed     ; NOWFUNC_MAGIC_SEED
	dw NOWFunc_SummonSnake   ; NOWFUNC_SUMMON_SNAKE
	dw NOWFunc_FallLeaves    ; NOWFUNC_FALL_LEAVES
	dw NOWFunc_PlayMusicBox  ; NOWFUNC_BLUE_MUSIC_BOX
	dw NOWFunc_PlayMusicBox  ; NOWFUNC_GOLD_MUSIC_BOX
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_RED
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_BROWN
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_YELLOW
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_GREEN
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_CYAN
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_BLUE
	dw NOWFunc_Crayon        ; NOWFUNC_CRAYON_PINK
	dw NOWFunc_BottomBar     ; NOWFUNC_BOTTOM_BAR
	dw NOWFunc_DayNightSpell ; NOWFUNC_DAY_NIGHT_SPELL
	dw NOWFunc_Prologue      ; NOWFUNC_PROLOGUE

NOWFunc_CutTree:
	ld a, [w2d062]
	jumptable

	dw AdvanceOWFunc
	dw .Wait1
	dw .SetTreeFall
	dw .WaitFall
	dw .WaitDisappear
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, 4
	jp WaitOWFunc

.Wait2:
	ld a, 4
	jp WaitOWFunc

.SetTreeFall:
	ld a, $02
	ld hl, wSceneObj8State
	call SetSceneObjState
	play_sfx SFX_102
	jp AdvanceOWFunc

.WaitFall:
	ld a, [wSceneObj8Frame]
	cp $07
	ret nz
	play_sfx SFX_01A
	jp AdvanceOWFunc

.WaitDisappear:
	ld hl, wSceneObj8State
	jp WaitOWObjDisappear

NOWFunc_OpenGate:
	ld a, [w2d062]
	jumptable

	dw AdvanceOWFunc
	dw .Wait1
	dw .OpenDoor
	dw .WaitAnim
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, $04
	jp WaitOWFunc

.Wait2:
	ld a, $04
	jp WaitOWFunc

.OpenDoor:
	ld a, $04
	ld hl, wSceneObj10State
	call SetSceneObjState
	play_sfx SFX_108
	jp AdvanceOWFunc

.WaitAnim:
	ld hl, wSceneObj10State
	jp WaitOWObjDisappear

NOWFunc_Garlic:
	jp EndOWFunc

NOWFunc_MagicSeed:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .PlayFallSFX
	dw .SeedFall
	dw .WaitSeedFall
	dw .Wait2
	dw .GrowStalk
	dw .WaitGrowStalk
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.PlayFallSFX:
	play_sfx SFX_119
	jp AdvanceOWFunc

.SeedFall:
	ld hl, wOWFuncCounter
	call GetSceneFallingYOffset
	ld hl, wSceneObj4YCoord
	add [hl]
	ld [hl], a
	cp $4c
	ret c
	ld a, $08
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_014
	jp AdvanceOWFunc

.WaitSeedFall:
	ld hl, wSceneObj4State
	ld b, $09
	jp WaitOWObjState

.Wait2:
	ld a, 30
	jp WaitOWFunc

.GrowStalk:
	ld a, $0a
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_11A
	jp AdvanceOWFunc

.WaitGrowStalk:
	ld hl, wSceneObj4State
	ld b, $0b
	jp WaitOWObjState

NOWFunc_SummonSnake:
	call .MoveNotes
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .PlayFluteSFX
	dw .WaitNotesAndShowSnake
	dw .WaitSnakeComeOut
	dw .WaitSnakeComeIn
	dw EndOWFunc

.Wait1:
	ld a, 8
	jp WaitOWFunc

.PlayFluteSFX:
	ld a, $01
	ld [wSceneObj1Unk7], a
	play_sfx SFX_118
	jp AdvanceOWFunc

.WaitNotesAndShowSnake:
	ld hl, wSceneObj1XCoord
	ld a, $25
	cp [hl]
	ret nz
	ld a, $0c
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_TEMPLE_ROCK
	jp AdvanceOWFunc

.WaitSnakeComeOut:
	ld a, [wSceneObj2Frame]
	cp $37
	ret nz
	jp AdvanceOWFunc

.WaitSnakeComeIn:
	ld a, [wSceneObj2Frame]
	cp $35
	ret nz
	jp AdvanceOWFunc

.MoveNotes:
	ld a, [wSceneObj1Unk7]
	and a
	ret z
	ld hl, wSceneObj1XCoord
	dec [hl]
	ld a, [hl]
	add $18
	cp $f0
	ret c
	xor a
	ld [wSceneObj1Unk7], a
	ret

NOWFunc_FallLeaves:
	call .HandleLeaf1Movement
	call .HandleLeaf3Movement
	call .HandleLeaf2Movement
	call .HandleLeaf4Movement

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .Func_b5316
	dw .StartLeaf1MovementAndPlaySFX
	dw .Wait2
	dw .StartLeaf3Movement
	dw .WaitLeafMovement
	dw .Wait3
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.Wait3:
	ld a, 40
	jp WaitOWFunc

.Func_b5316:
	ld a, $14
	ld hl, wSceneObj7State
	call SetSceneObjState
	jp AdvanceOWFunc

.StartLeaf1MovementAndPlaySFX:
	ld a, $01
	ld [w2d12c], a
	play_sfx SFX_08E
	jp AdvanceOWFunc

.Wait2:
	ld a, 8
	jp WaitOWFunc

.StartLeaf3Movement:
	ld a, $01
	ld [w2d12e], a
	jp AdvanceOWFunc

.WaitLeafMovement:
	ld a, [w2d12e]
	and a
	ret nz
	jp AdvanceOWFunc

.HandleLeaf1Movement:
	ld hl, w2d12c
	ld a, [hli]
	and a
	ret z
	dec a
	jr z, .lift_leaf1
	dec a
	jp z, .blow_away_leaf1
	ret
.lift_leaf1
	ld de, Data_b6101
	ld hl, wSceneObj6
	call ApplyOWMovement
	ret nz ; hasn't finished movement

	ld hl, w2d12c
	inc [hl]
	ld a, $15
	ld hl, wSceneObj6State
	call SetSceneObjState
	ld a, $15
	ld hl, wSceneObj8State
	call SetSceneObjState
	ld a, $01
	ld [w2d130], a
	ld a, [wSceneObj6XCoord]
	dec a
	dec a
	ld [wSceneObj6XCoord], a
	ld a, [wSceneObj6YCoord]
	ld [wSceneObj8YCoord], a
	ld a, [wSceneObj6XCoord]
	inc a
	inc a
	inc a
	inc a
	inc a
	inc a
	ld [wSceneObj8XCoord], a
	ret

.blow_away_leaf1
	ld de, Data_b6196
	ld hl, wSceneObj6
	call ApplyOWMovement
	ret nz
	xor a
	ld [w2d12c], a
	ret

.HandleLeaf2Movement:
	ld hl, w2d130
	ld a, [hli]
	and a
	ret z
	ld de, Data_b6239
	ld hl, wSceneObj8
	call ApplyOWMovement
	ret nz
	xor a
	ld [w2d130], a
	ret

.HandleLeaf3Movement:
	ld hl, w2d12e
	ld a, [hli]
	and a
	ret z
	dec a
	jr z, .lift_leaf3
	dec a
	jp z, .blow_away_leaf3
	ret
.lift_leaf3
	ld de, Data_b6101
	ld hl, wSceneObj7
	call ApplyOWMovement
	ret nz
	ld hl, w2d12e
	inc [hl]
	ld a, $15
	ld hl, wSceneObj7State
	call SetSceneObjState
	ld a, $15
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld a, $01
	ld [w2d132], a
	ld a, [wSceneObj7XCoord]
	dec a
	dec a
	ld [wSceneObj7XCoord], a
	ld a, [wSceneObj7YCoord]
	ld [wSceneObj9YCoord], a
	ld a, [wSceneObj7XCoord]
REPT 6
	inc a
ENDR
	ld [wSceneObj9XCoord], a
	play_sfx SFX_08E
	ret

.blow_away_leaf3
	ld de, Data_b6196
	ld hl, wSceneObj7
	call ApplyOWMovement
	ret nz
	xor a
	ld [w2d12e], a
	ret

.HandleLeaf4Movement:
	ld hl, w2d132
	ld a, [hli]
	and a
	ret z
	ld de, Data_b6239
	ld hl, wSceneObj9
	call ApplyOWMovement
	ret nz
	xor a
	ld [w2d132], a
	ret

Func_b542e:
	call .Func_b5435
	call .Func_b54ba
	ret

.Func_b5435:
	ld hl, w2d12c
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b544a
	dw .Func_b5461
	dw .Func_b5471
	dw .Func_b5486
	dw .Func_b548e
	dw .Func_b549e

.Func_b544a:
	ld a, [w2d12d]
	cp $78
	ret c
	ld a, $12
	ld hl, wSceneObj6State
	call SetSceneObjState
.asm_b5458
	ld hl, w2d12c
	inc [hl]
	xor a
	ld [w2d12d], a
	ret

.Func_b5461:
	ld a, [w2d12d]
	cp $5a
	ret c
	ld a, $13
	ld hl, wSceneObj6State
	call SetSceneObjState
	jr .asm_b5458

.Func_b5471:
	ld a, [w2d12d]
	cp $28
	ret c
	ld a, $10
	ld hl, wSceneObj6State
	call SetSceneObjState
	ld a, $38
	ld [wSceneObj6YCoord], a
	jr .asm_b5458

.Func_b5486:
	ld a, [w2d12d]
	cp $5a
	ret c
	jr .asm_b5458

.Func_b548e:
	ld a, [w2d12d]
	and $0f
	ret nz
	ld hl, wSceneObj6
	inc [hl]
	ld a, [hl]
	cp $48
	ret nz
	jr .asm_b5458

.Func_b549e:
	ld hl, wSceneObj6Frame
	ld a, [hld]
	cp $46
	ret nz
	dec l
	ld a, [hl]
	and a
	ret z
	ld a, $11
	ld hl, wSceneObj6State
	call SetSceneObjState
	ld a, $01
	ld hl, w2d12c
	ld [hli], a
	xor a
	ld [hl], a
	ret

.Func_b54ba:
	ld hl, w2d12e
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b54cf
	dw .Func_b54e6
	dw .Func_b54f6
	dw .Func_b550b
	dw .Func_b5513
	dw .Func_b5523

.Func_b54cf:
	ld a, [w2d12f]
	cp $78
	ret c
	ld a, $12
	ld hl, wSceneObj7State
	call SetSceneObjState
.asm_b54dd
	ld hl, w2d12e
	inc [hl]
	xor a
	ld [w2d12f], a
	ret

.Func_b54e6:
	ld a, [w2d12f]
	cp $5a
	ret c
	ld a, $13
	ld hl, wSceneObj7State
	call SetSceneObjState
	jr .asm_b54dd

.Func_b54f6:
	ld a, [w2d12f]
	cp $28
	ret c
	ld a, $10
	ld hl, wSceneObj7State
	call SetSceneObjState
	ld a, $38
	ld [wSceneObj7YCoord], a
	jr .asm_b54dd

.Func_b550b:
	ld a, [w2d12f]
	cp $5a
	ret c
	jr .asm_b54dd

.Func_b5513:
	ld a, [w2d12f]
	and $0f
	ret nz
	ld hl, wSceneObj7
	inc [hl]
	ld a, [hl]
	cp $48
	ret nz
	jr .asm_b54dd

.Func_b5523:
	ld hl, wSceneObj7Frame
	ld a, [hld]
	cp $46
	ret nz
	dec l
	ld a, [hl]
	and a
	ret z
	ld a, $11
	ld hl, wSceneObj7State
	call SetSceneObjState
	ld a, $01
	ld hl, w2d12e
	ld [hli], a
	xor a
	ld [hl], a
	ret

NOWFunc_PlayMusicBox:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .PlayMusicBox
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.PlayMusicBox:
	ld a, [wOWSceneActionParam]
	cp NOWFUNC_GOLD_MUSIC_BOX
	jr z, .gold_music_box
	play_sfx SFX_11F
	jp AdvanceOWFunc
.gold_music_box
	play_sfx SFX_122
	jp AdvanceOWFunc

.Wait2:
	ld a, 254
	jp WaitOWFunc

NOWFunc_Crayon:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .PlayFallSFX
	dw .CrayonFall
	dw .Wait2
	dw .CrayonLift
	dw .WaitCrayonLift
	dw .Wait3
	dw .Scribble
	dw .AdvanceIfCollectedAllCrayons
	dw .LoadNewOWPal
	dw .FadePal
	dw .Wait4
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.Wait4:
	ld a, 20
	jp WaitOWFunc

.PlayFallSFX:
	play_sfx SFX_119
	jp AdvanceOWFunc

.CrayonFall:
	ld hl, wOWFuncCounter
	call GetSceneFallingYOffset
	ld hl, wSceneObj5YCoord
	add [hl]
	ld [hl], a
	ld c, a
	add -6
	ld [wSceneObj1YCoord], a
	ld a, c
	cp $40
	ret c
	xor a
	ld [wSceneObj1State], a
	play_sfx SFX_014
	jp AdvanceOWFunc

.Wait2:
	ld a, 4
	jp WaitOWFunc

.CrayonLift:
	ld a, $1e
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp AdvanceOWFunc

.WaitCrayonLift:
	ld b, $20
	ld hl, wSceneObj5State
	jp WaitOWObjState

.Wait3:
	ld a, 10
	jp WaitOWFunc

.Scribble:
	ld de, Data_b6294
	ld hl, wSceneObj5
	call ApplyOWMovement
	ld a, [wSceneObj5Unk7]
	cp $0a
	jr z, .play_scribble_sfx
	and a
	ret nz
	jp AdvanceOWFunc
.play_scribble_sfx
	play_sfx SFX_12D
	ret

.AdvanceIfCollectedAllCrayons:
	ld a, [wCrayonFlags]
	and ALL_CRAYONS
	cp ALL_CRAYONS
	jp z, AdvanceOWFunc
	ld a, $0c
	ld [w2d062], a
	xor a
	ld [wOWFuncCounter], a
	ret

.LoadNewOWPal:
	ld hl, wTempPals1
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, Pals_84500
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_84500)
	call CopyFarBytes
	xor a
	ld [wPalConfig1TotalSteps], a
	jp AdvanceOWFunc

.FadePal:
	ld a, [wOWFuncCounter]
	and 7
	ret nz
	call Func_b587d
	ret

NOWFunc_BottomBar:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .LoadBottomBarPal
	dw .RaiseBBtnIndicator
	dw .Wait2
	dw .BlinkBBtnIndicator
	dw .StartOpenBottomBar
	dw .Wait3
	dw .OpenBottomBar
	dw .Wait4
	dw EndOWFunc

.Wait1:
	ld a, 40
	jp WaitOWFunc

.Wait4:
	ld a, 60
	jp WaitOWFunc

.LoadBottomBarPal:
	ld hl, Pals_84000 palette 7
	ld de, wTempPals1 palette 7
	ld b, BANK(Pals_84000)
	ld c, 1 palettes
	call CopyFarBytes
	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	ld a, BCPSF_AUTOINC | palette 7
	ld [hli], a
	ld a, 1
	ld [hli], a
	ld a, HIGH(wTempPals1 palette 7)
	ld [hli], a
	ld a, LOW(wTempPals1 palette 7)
	ld [hli], a
	jp AdvanceOWFunc

.RaiseBBtnIndicator:
	ld a, [wOWFuncCounter]
	and $1
	ret nz
	ld hl, wSceneObj1
	dec [hl]
	ld a, [hl]
	cp $94
	ret nz
	play_sfx SFX_113
	jp AdvanceOWFunc

.Wait2:
	ld a, 45
	jp WaitOWFunc

.BlinkBBtnIndicator:
	ld a, [wOWFuncCounter]
	ld b, a
	bit 3, a
	ld a, $22
	jr z, .asm_b56b5
	ld a, $23
.asm_b56b5
	ld [wSceneObj1State], a
	ld a, 47
	cp b
	ret nc
	jp AdvanceOWFunc

.StartOpenBottomBar:
	ld a, [wOWFuncCounter]
	cp 45
	ret c
	ld a, $23
	ld [wSceneObj1State], a
	play_sfx SFX_113
	jp AdvanceOWFunc

.Wait3:
	ld a, 10
	jp WaitOWFunc

.OpenBottomBar:
	ld hl, wWY
	dec [hl]
	ld a, [hl]
	ld hl, wSceneObj1
	dec [hl]
	ld hl, wSceneObj5YCoord
	dec [hl]
	ld hl, wSceneObj8YCoord
	dec [hl]
	ld hl, wSceneObj9YCoord
	dec [hl]
	ld hl, wSceneObj10YCoord
	dec [hl]
	cp $78
	ret nz
	jp AdvanceOWFunc

NOWFunc_DayNightSpell:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw WaitOWSceneLevelNameFadeIn
	dw .StartOpenTopBar
	dw .OpenTopBar
	dw .Wait2
	dw .SetButtonVisible
	dw .SetButtonInvisible
	dw .SetButtonVisible
	dw .SetButtonInvisible
	dw .SetButtonVisible
	dw .WaitAndPressDayButton
	dw .WaitDayButtonPress
	dw .DayNightTransition
	dw .WaitAndPressNightButton
	dw .WaitNightButtonPress
	dw .DayNightTransition
	dw .Wait3
	dw EndOWFunc

.Wait1:
	ld a, 30
	jp WaitOWFunc

.Wait3:
	ld a, 60
	jp WaitOWFunc

.StartOpenTopBar:
	play_sfx SFX_0E9
	call AdvanceOWFunc
;	fallthrough
.OpenTopBar:
	ld a, [wSCY]
	dec a
	dec a
	ld [wSCY], a
	cp $ec
	ret nz
	jp AdvanceOWFunc

.Wait2:
	ld a, 40
	jp WaitOWFunc

.SetButtonVisible:
	ld a, [wOWFuncCounter]
	cp 20
	ret c
	ld a, $25
	ld hl, wSceneObj5State
	call SetSceneObjState
.show_visible_button
	ld hl, .visible_button_attr

.apply_attribute
	call .Func_b5827
	call .Func_b57f4
	jp AdvanceOWFunc

.SetButtonInvisible:
	ld a, [wOWFuncCounter]
	cp 20
	ret c
	ld a, $00
	ld hl, wSceneObj5State
	call SetSceneObjState
	ld hl, .invisible_button_attr
	jr .apply_attribute

.WaitAndPressDayButton:
	ld a, [wOWFuncCounter]
	cp 60
	ret c
	ld a, $26
	ld hl, wSceneObj5State
	call SetSceneObjState
.play_sfx_and_press_button
	play_sfx SFX_SELECTION
	ld hl, .pressed_button_attr
	jr .apply_attribute

.WaitDayButtonPress:
	ld a, [wSceneObj5Frame]
	cp $04
	ret nz
	jr .show_visible_button

.DayNightTransition:
	farcall Func_84c0d
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	di
	farcall VBlank_Overworld
	ei
	jp AdvanceOWFunc

.WaitAndPressNightButton:
	ld a, [wOWFuncCounter]
	cp 60
	ret c
	ld a, $28
	ld hl, wSceneObj5State
	call SetSceneObjState
	jr .play_sfx_and_press_button

.WaitNightButtonPress:
	ld a, [wSceneObj5Frame]
	cp $06
	ret nz
	jp .show_visible_button

.visible_button_attr
	db $34, $35
	db $36, $37

	db $7 | BGF_BANK1, $7 | BGF_BANK1
	db $7 | BGF_BANK1, $7 | BGF_BANK1

.invisible_button_attr
	db $3e, $3e
	db $3f, $3f

	db $7 | BGF_BANK1, $7 | BGF_BANK1 | BGF_XFLIP
	db $7 | BGF_BANK1, $7 | BGF_BANK1 | BGF_XFLIP

.pressed_button_attr
	db $48, $49
	db $4a, $4b

	db $7 | BGF_BANK1, $7 | BGF_BANK1
	db $7 | BGF_BANK1, $7 | BGF_BANK1

.Func_b57f4:
	ld a, HIGH(wAttrmap + 0 + 21 * BG_MAP_WIDTH)
	ld [wHDMASourceHi], a
	ld a, LOW(wAttrmap + 0 + 21 * BG_MAP_WIDTH)
	ld [wHDMASourceLo], a
	ld a, HIGH(v0BGMap0 + 0 + 30 * BG_MAP_WIDTH) - $80
	ld [wHDMADestHi], a
	ld a, LOW(v0BGMap0 + 0 + 30 * BG_MAP_WIDTH)
	ld [wHDMADestLo], a
	ld a, $4 - $1 ; 2 rows
	ld [wHDMAMode], a

	ld a, HIGH(wAttrmap + 0 + 19 * BG_MAP_WIDTH)
	ld [w2d0b5SourceHi], a
	ld a, LOW(wAttrmap + 0 + 19 * BG_MAP_WIDTH)
	ld [w2d0b5SourceLo], a
	ld a, HIGH(v0BGMap0 + 0 + 30 * BG_MAP_WIDTH) - $80
	ld [w2d0b5DestHi], a
	ld a, LOW(v0BGMap0 + 0 + 30 * BG_MAP_WIDTH)
	ld [w2d0b5DestLo], a
	ld a, $4 - $1 ; 2 rows
	ld [w2d0b5Mode], a
	ret

.Func_b5827:
	debgcoord 11, 19, wAttrmap
	push de
	ld a, e
	add 2 * BG_MAP_WIDTH
	ld e, a
	ld a, $00
	adc d
	ld d, a
	; debgcoord 11, 21, wAttrmap
	ld c, 2
.loop
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	dec e
	ld a, e
	add BG_MAP_WIDTH
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

; unreferenced
Func_b5849:
	ld a, 4
;	fallthrough

WaitOWFunc:
	ld hl, wOWFuncCounter
	cp [hl]
	ret nc
AdvanceOWFunc:
	xor a
	ld hl, wOWFuncCounter
	ld [hli], a
	inc [hl]
	ret

WaitOWObjDisappear:
	ld b, $00
WaitOWObjState:
	ld a, [hl]
	cp b
	ret nz
	jr AdvanceOWFunc

EndOWFunc:
	xor a
	ld [wOWSceneActionParam], a
	ld hl, wOWFuncCounter
	ld [hli], a
	ld [hl], a ; w2d062
	ret

Func_b5868:
	ld a, TRUE
	ld [wOWPendingTileUpdate], a
;	fallthrough
Func_b586d:
	farcall Func_854ee
	ret

Func_b587d:
	farcall Func_8518c
	ret

Func_b588d:
	farcall Func_85145
	ret

GetSceneFallingYOffset:
	ld a, [hl]
	cp .yoffsets_end - .yoffsets
	jr c, .no_carry
	ld a, (.yoffsets_end - .yoffsets) - $4
	ld [hl], a
.no_carry
	ld e, a
	ld d, $00
	ld hl, .yoffsets
	add hl, de
	ld a, [hl]
	ret

.yoffsets
	db 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
	db 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
	db 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
	db 0, 1, 0, 1, 1, 0, 1, 1, 0, 1
	db 1, 0, 1, 1, 0, 1, 1, 0, 1, 1
	db 0, 1, 1, 0, 1, 1, 0, 1, 1, 0
	db 1, 1, 0, 1, 1, 1, 0, 1, 1, 1
	db 0, 1, 1, 1, 0, 1, 1, 1, 0, 1
	db 1, 1, 0, 1, 1, 1, 0, 1, 1, 1
	db 0, 1, 1, 1, 1, 1, 1, 1, 1, 1
.yoffsets_end

NOWFunc_Prologue:
	call Func_b71fc
	farcall Func_15868e
	call .Func_b59e5
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b5949
	dw .Func_b5965
	dw .Func_b5973
	dw .Func_b598c
	dw .Func_b59a0
	dw .Func_b59a5
	dw .Func_b59ca
	dw .Func_b59c5
	dw .Func_b59d4
	dw .Func_b59cf
	dw .Func_b59b6
	dw .Func_b59d9
	dw .Func_b59d9
	dw .Func_b59de

.Func_b5949:
	ld a, [wOWFuncCounter]
	cp 60
	ret c
	ld a, $01
	ld [wOWUIObj1YCoord], a
	ld a, $01
	ld [w2d049], a
	ld a, $03
	ld hl, w2d03e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	jp AdvanceOWFunc

.Func_b5965:
	ld a, [wOWFuncCounter]
	cp 134
	ret c
	ld a, $04
	ld [wOWUIObj1YCoord], a
	jp AdvanceOWFunc

.Func_b5973:
	ld a, [wOWUIObj1YCoord]
	cp $05
	ret nz
	ld a, $2b
	ld hl, wSceneObj1State
	call SetSceneObjState
	play_sfx SFX_061
	jp AdvanceOWFunc

.Func_b598c:
	ld a, [wOWUIObj1YCoord]
	and a
	ret nz
	ld hl, w2d03e
	ld a, $0e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [w2d049], a
	jp AdvanceOWFunc

.Func_b59a0:
	ld a, 86
	jp WaitOWFunc

.Func_b59a5:
	ld a, [wOWFuncCounter]
	cp 6
	ret c
	ld a, $01
	ld [w2d150], a
	ld [wOWUIObj2Attributes], a
	jp AdvanceOWFunc

.Func_b59b6:
	ld hl, w2d151
.asm_b59b9
	ld a, [wOWFuncCounter]
	cp 6
	ret c
	ld a, $01
	ld [hl], a
	jp AdvanceOWFunc

.Func_b59c5:
	ld hl, wd152
	jr .asm_b59b9

.Func_b59ca:
	ld hl, wd153
	jr .asm_b59b9

.Func_b59cf:
	ld hl, wd154
	jr .asm_b59b9

.Func_b59d4:
	ld hl, wd155
	jr .asm_b59b9

.Func_b59d9:
	ld a, 120
	jp WaitOWFunc

.Func_b59de:
	xor a
	ld [wOWUIObj2Attributes], a
	jp EndOWFunc

.Func_b59e5:
	ld a, [wOWUIObj2Attributes]
	and a
	ret z
	ld hl, wOWUIObj2Duration
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, .asm_b59f9
	cp $30
	ret c
	xor a
	ld [hl], a
	ret
.asm_b59f9
	play_sfx SFX_08E
	ret

WestOWFunctions:
	ld a, [wOWSceneActionParam]
	dec a
	jumptable
	dw WOWFunc_Rain            ; WOWFUNC_RAIN
	dw WOWFunc_ClearTornado    ; WOWFUNC_CLEAR_TORNADO
	dw WOWFunc_ElevatorWorking ; WOWFUNC_ELEVATOR_WORKING
	dw WOWFunc_MagicSeed       ; WOWFUNC_MAGIC_SEED
	dw WOWFunc_SummonSnake     ; WOWFUNC_SUMMON_SNAKE
	dw WOWFunc_Earthquake      ; WOWFUNC_EARTHQUAKE
	dw WOWFunc_VulcanoEruption ; WOWFUNC_VULCANO_ERUPTION
	dw WOWFunc_RedMusicBox     ; WOWFUNC_RED_MUSIC_BOX

WOWFunc_Rain:
	call .UpdatePals
	call .PlayThunderSFX

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .InitPalConfig
	dw .Wait1
	dw .ShowRainClouds
	dw .WaitRainClouds
	dw .FillPool
	dw .Wait2
	dw .WaitRainAndHideClouds
	dw .WaitCloudsDisappear
	dw .Wait3
	dw EndOWFunc

.PlayThunderSFX:
	ld hl, w2d13f
	ld a, [hl]
	and a
	ret z
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	play_sfx SFX_076
	ld a, $01
	ld [hl], a
	ret

.Wait3:
	ld a, 60
	jp WaitOWFunc

.InitPalConfig:
	ld a, $5a
	ld [wPalConfig1TotalSteps], a
	ld a, $01
	ld [w2d13f], a
	jp AdvanceOWFunc

.Wait1:
	ld a, 180
	jp WaitOWFunc

.ShowRainClouds:
	ld a, $01
	ld hl, wSceneObj15State
	call SetSceneObjState
	jp AdvanceOWFunc

.WaitRainClouds:
	ld a, [wSceneObj15Frame]
	cp $0e
	ret nz
	jp AdvanceOWFunc

.FillPool:
	ld a, [wOWFuncCounter]
	cp 2
	ret c
	ld hl, Data_8550b
	call Func_b5868
	jp AdvanceOWFunc

.Wait2:
	ld a, 120
	jp WaitOWFunc

.WaitRainAndHideClouds:
	ld hl, wPalConfig1TotalSteps
	ld a, [hl]
	cp $3c
	ret c
	xor a
	ld [hl], a
	ld [w2d13f], a
	ld a, $04
	ld hl, wSceneObj14State
	call SetSceneObjState
	jp AdvanceOWFunc

.WaitCloudsDisappear:
	ld hl, wSceneObj14State
	jp WaitOWObjDisappear

.UpdatePals:
	ld a, [wPalConfig1TotalSteps]
	and a
	ret z
	ld hl, wPalConfig1TotalSteps
	inc [hl]
	ld a, [hl]
	cp $09
	jr z, .pals_flash2
	cp $12
	jr z, .pals_flash1
	cp $16
	jr z, .pals_flash2
	cp $1a
	jr z, .pals_flash1
	cp $1e
	jr z, .pals_flash2
	cp $22
	jr z, .pals_flash1
	cp $26
	jr z, .pals_flash2
	cp $29
	jr z, .pals_flash1
	cp $2c
	jr z, .pals_regular
	cp $82
	ret c
	ld a, $01
	ld [hl], a
	ret

.pals_flash1
	ld hl, Pals_8694d
	jr .apply_pals
.pals_flash2
	ld hl, Pals_8698d
	jr .apply_pals
.pals_regular
	ld hl, Pals_84140
.apply_pals
	ld de, wTempPals1
	ld b, BANK(Pals_84140)
	ld c, 8 palettes
	call CopyFarBytes
	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	ld a, BCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 1 palettes
	ld [hli], a
	ld a, HIGH(wTempPals1)
	ld [hli], a
	ld a, LOW(wTempPals1)
	ld [hli], a
	ret

WOWFunc_ClearTornado:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .ShowTornado
	dw .ClearTornado
	dw .HideTornado
	dw .Wait1
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.ShowTornado:
	call UpdateOWTornado
	ld a, [wSceneObj1Unk7]
	cp $01
	jr z, .play_tornado_sfx
	and a
	ret nz
	jp AdvanceOWFunc
.play_tornado_sfx
	play_sfx SFX_11D
	ret

.ClearTornado:
	ld de, Data_b6478
	ld hl, wSceneObj1
	call ApplyOWMovement
	ret nz
	jp AdvanceOWFunc

.HideTornado:
	ld a, $00
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

UpdateOWTornado:
	ld de, Data_b6337
	ld hl, wSceneObj1
	call ApplyOWMovement
	ret nz
	; only play SFX if not playing a scene...
	ld a, [wCurEvent]
	and a
	ret nz
	; ...and if no bars are open
	ld a, [wOWBarsState]
	and a
	ret nz
	play_sfx SFX_11D
	ret

WOWFunc_ElevatorWorking:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .SetElevatorWorking
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.SetElevatorWorking:
	ld a, $06
	ld hl, wSceneObj8State
	call SetSceneObjState
	jp AdvanceOWFunc

.Wait2:
	ld a, 200
	jp WaitOWFunc

WOWFunc_MagicSeed:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .PlayFallSFX
	dw .SeedFall
	dw .WaitSeedFall
	dw .Wait2
	dw .GrowStalk
	dw .WaitGrowStalk
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.PlayFallSFX:
	play_sfx SFX_119
	jp AdvanceOWFunc

.SeedFall:
	ld hl, wOWFuncCounter
	call GetSceneFallingYOffset
	ld hl, wSceneObj4YCoord
	add [hl]
	ld [hl], a
	cp $5b
	ret c
	ld a, $0b
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_014
	jp AdvanceOWFunc

.WaitSeedFall:
	ld hl, wSceneObj4State
	ld b, $0c
	jp WaitOWObjState

.Wait2:
	ld a, 30
	jp WaitOWFunc

.GrowStalk:
	ld a, $0d
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_11A
	jp AdvanceOWFunc

.WaitGrowStalk:
	ld hl, wSceneObj4State
	ld b, $0e
	jp WaitOWObjState

WOWFunc_SummonSnake:
	call .MoveNotes
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .PlayFluteSFX
	dw .WaitNotesAndShowSnake
	dw .WaitSnakeComeOut
	dw EndOWFunc

.Wait1:
	ld a, 8
	jp WaitOWFunc

.PlayFluteSFX:
	ld a, $01
	ld [wSceneObj1Unk7], a
	play_sfx SFX_118
	jp AdvanceOWFunc

.WaitNotesAndShowSnake:
	ld hl, wSceneObj1XCoord
	ld a, $26
	cp [hl]
	ret nz
	ld a, $0f
	ld hl, wSceneObj5State
	call SetSceneObjState
	play_sfx SFX_TEMPLE_ROCK
	jp AdvanceOWFunc

.WaitSnakeComeOut:
	ld a, [wSceneObj5Frame]
	cp $0a
	ret nz
	jp AdvanceOWFunc

.MoveNotes:
	ld a, [wSceneObj1Unk7]
	and a
	ret z
	ld hl, wSceneObj1XCoord
	dec [hl]
	ld a, [hl]
	add $18
	cp $f0
	ret c
	xor a
	ld [wSceneObj1Unk7], a
	ret

WOWFunc_Earthquake:
	call Func_b71fc
	call .Func_b5d0a

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .Func_b5c94
	dw .WaitShake
	dw .Func_b5cc4
	dw .WaitPostShake
	dw .DropRocks
	dw .Func_b5c8f
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.Func_b5c8f:
	ld a, 60
	jp WaitOWFunc

.Func_b5c94:
	ld a, $01
	ld [wOWUIObj1YCoord], a
	ld a, $01
	ld [wSceneWarioDuration], a
	ld a, $17
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld a, $19
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld a, $01
	ld [w2d049], a
	ld a, $03
	ld hl, w2d03e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	jp AdvanceOWFunc

.WaitShake:
	ld a, 120
	jp WaitOWFunc

.Func_b5cc4:
	xor a
	ld [wSceneWarioDuration], a
	ld a, $03
	ld [wOWUIObj1YCoord], a
	ld a, $18
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld a, $1a
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld hl, w2d03e
	ld a, $0e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [w2d049], a
	jp AdvanceOWFunc

.WaitPostShake:
	ld a, 60
	jp WaitOWFunc

.DropRocks:
	ld a, $16
	ld hl, wSceneObj13State
	call SetSceneObjState
	ld hl, Data_85549
	call Func_b5868
	play_sfx SFX_061
	jp AdvanceOWFunc

.Func_b5d0a:
	ld hl, wSceneWarioDuration
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b5d25
	dw .Func_b5d52
	dw .Func_b5d34
	dw .Func_b5d52
	dw .Func_b5d3e
	dw .Func_b5d52
	dw .Func_b5d48
	dw .Func_b5d52
	dw .Func_b5d5a

.Func_b5d25:
	ld a, $14
	ld hl, wSceneObj13State
	call SetSceneObjState
.asm_b5d2d
	xor a
	ld hl, wOWUIObj1FramesetOffset
	ld [hld], a
	inc [hl]
	ret

.Func_b5d34:
	ld a, $15
	ld hl, wSceneObj15State
	call SetSceneObjState
	jr .asm_b5d2d

.Func_b5d3e:
	ld a, $14
	ld hl, wSceneObj14State
	call SetSceneObjState
	jr .asm_b5d2d

.Func_b5d48:
	ld a, $15
	ld hl, wSceneObj12State
	call SetSceneObjState
	jr .asm_b5d2d

.Func_b5d52:
	ld a, [wOWUIObj1FramesetOffset]
	cp $0a
	ret c
	jr .asm_b5d2d

.Func_b5d5a:
	ld a, $01
	ld hl, wSceneWarioDuration
	ld [hli], a
	xor a
	ld [hl], a
	ret

WOWFunc_VulcanoEruption:
	call Func_b71fc
	call .Func_b5f58
	call .Func_b5fb9
	call .Func_b601a
	call Func_b6055

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .Func_b5dac
	dw .Func_b5dd2
	dw .Func_b5dd7
	dw .Func_b5dfa
	dw .Func_b5e02
	dw .Func_b5e10
	dw .Func_b5e73
	dw .Func_b5eb7
	dw .Func_b5ec7
	dw .Func_b5ed4
	dw .Func_b5ee1
	dw .Func_b5eee
	dw .Func_b5efb
	dw .Func_b5f08
	dw .Func_b5f10
	dw .Func_b5f15
	dw .Func_b5f33
	dw .Func_b5f50
	dw .Func_b5da7
	dw EndOWFunc

.Wait1:
	ld a, 60
	jp WaitOWFunc

.Func_b5da7:
	ld a, 24
	jp WaitOWFunc

.Func_b5dac:
	ld a, $01
	ld [wOWUIObj1YCoord], a
	ld a, $17
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld a, $19
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld a, $01
	ld [w2d049], a
	ld a, $03
	ld hl, w2d03e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	jp AdvanceOWFunc

.Func_b5dd2:
	ld a, 58
	jp WaitOWFunc

.Func_b5dd7:
	ld a, $1f
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld hl, wSceneObj11
	ld a, $10
	ld [hli], a
	ld a, $52
	ld [hl], a

	ld hl, wPalConfig1Index
	ld a, BCPSF_AUTOINC | palette 5
	ld [hli], a
	ld a, 1
	ld [hli], a
	ld a, $c1
	ld [hli], a
	ld a, $28
	ld [hli], a
	jp AdvanceOWFunc

.Func_b5dfa:
	ld a, [wSceneObj11State]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b5e02:
	ld a, [wOWFuncCounter]
	cp 6
	ret c
	ld a, $04
	ld [wOWUIObj1YCoord], a
	jp AdvanceOWFunc

.Func_b5e10:
	ld a, $1a
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld hl, w2d03e
	ld a, $0e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [w2d049], a

	ld hl, wTempBGPals palette 0
	ld b, 3 palettes
	call Func_b69a6

	ld hl, wTempPals1 palette 6
	ld de, wTempBGPals palette 6
	ld b, 1 palettes
	call CopyHLToDE

	ld hl, wTempBGPals palette 7
	ld b, 4
	call Func_b69a6

	ld hl, wTempOBPals palette 0
	ld b, 4 palettes
	call Func_b69a6

	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	ld a, BCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 1 palettes
	ld [hli], a
	ld a, HIGH(wTempBGPals)
	ld [hli], a
	ld a, LOW(wTempBGPals)
	ld [hli], a

	ld hl, wPalConfig2
	ld a, LOW(rOCPS)
	ld [hli], a
	ld a, OCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 1 palettes
	ld [hli], a
	ld a, HIGH(wTempOBPals)
	ld [hli], a
	ld a, LOW(wTempOBPals)
	ld [hli], a

	ld a, $01
	ld [wOWUIObj2Attributes], a
	jp AdvanceOWFunc

.Func_b5e73:
	ld a, [wOWFuncCounter]
	cp 8
	ret c
	ld a, $1b
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld hl, wSceneObj11
	ld a, $10
	ld [hli], a
	ld a, $54
	ld [hl], a
	ld hl, Data_85536
	call Func_b5868

	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	ld a, BCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 1 palettes
	ld [hli], a
	ld a, HIGH(wTempPals1)
	ld [hli], a
	ld a, LOW(wTempPals1)
	ld [hli], a

	ld hl, wPalConfig2
	ld a, LOW(rOCPS)
	ld [hli], a
	ld a, OCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 1 palettes
	ld [hli], a
	ld a, HIGH(wTempPals2)
	ld [hli], a
	ld a, LOW(wTempPals2)
	ld [hli], a

	jp AdvanceOWFunc

.Func_b5eb7:
	ld a, $03
	ld [w2d126], a
.asm_b5ebc
	play_sfx SFX_TEMPLE_ROCK
	jp AdvanceOWFunc

.Func_b5ec7:
	ld a, [wOWFuncCounter]
	cp 12
	ret c
	ld a, $03
	ld [w2d122], a
	jr .asm_b5ebc

.Func_b5ed4:
	ld a, [wOWFuncCounter]
	cp 36
	ret c
	ld a, $01
	ld [w2d12c], a
	jr .asm_b5ebc

.Func_b5ee1:
	ld a, [wOWFuncCounter]
	cp 12
	ret c
	ld a, $03
	ld [w2d126], a
	jr .asm_b5ebc

.Func_b5eee:
	ld a, [wOWFuncCounter]
	cp 20
	ret c
	ld a, $03
	ld [w2d122], a
	jr .asm_b5ebc

.Func_b5efb:
	ld a, [wOWFuncCounter]
	cp 38
	ret c
	ld a, $01
	ld [w2d126], a
	jr .asm_b5ebc

.Func_b5f08:
	ld a, [w2d126]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b5f10:
	ld a, 16
	jp WaitOWFunc

.Func_b5f15:
	ld a, $08
	ld [wOWUIObj1YCoord], a
	ld a, $19
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld a, $01
	ld [w2d049], a
	ld a, $03
	ld hl, w2d03e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	jp AdvanceOWFunc

.Func_b5f33:
	ld a, [wOWUIObj1Frame]
	cp $1b
	ret nz
	ld a, $1a
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld hl, w2d03e
	ld a, $0e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [w2d049], a
	jp AdvanceOWFunc

.Func_b5f50:
	ld a, [wOWUIObj1YCoord]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b5f58:
	ld hl, w2d122
	ld a, [hl]
	and a
	ret z
	dec a
	jumptable
	dw .Func_b5f70
	dw .Func_b5f89
	dw .Func_b5f9c
	dw .Func_b5fa1
	dw .Func_b5fad
	dw .Func_b5f89
	dw .Func_b5fb4
	dw .Func_b5fa1

.Func_b5f70:
	lb de, 8, 46
.asm_b5f73
	ld b, $1c
.asm_b5f75
	ld hl, wSceneObj1
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, b
	call SetSceneObjState
	xor a
	ld hl, w2d123
	ld [hld], a
	inc [hl]
	ret

.Func_b5f89:
	ld hl, wSceneObj1XCoord
	dec [hl]
	dec [hl]
	dec l
	inc [hl]
	inc [hl]
.asm_b5f91
	ld a, [hl]
	cp $88
	ret c
	xor a
	ld hl, w2d123
	ld [hld], a
	ld [hl], a
	ret

.Func_b5f9c:
	lb de, 8, 75
	jr .asm_b5f73

.Func_b5fa1:
	ld hl, wSceneObj1XCoord
	dec [hl]
	dec [hl]
	dec l
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_b5f91

.Func_b5fad:
	lb de, 8, 46
.asm_b5fb0
	ld b, $1f
	jr .asm_b5f75

.Func_b5fb4:
	lb de, 8, 75
	jr .asm_b5fb0

.Func_b5fb9:
	ld hl, w2d126
	ld a, [hl]
	and a
	ret z
	dec a
	jumptable
	dw .Func_b5fd1
	dw .Func_b5fea
	dw .Func_b5ffd
	dw .Func_b6002
	dw .Func_b600e
	dw .Func_b5fea
	dw .Func_b6015
	dw .Func_b6002

.Func_b5fd1:
	lb de, 8, 98
.asm_b5fd4
	ld b, $1d
.asm_b5fd6
	ld hl, wSceneObj3YCoord
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, b
	call SetSceneObjState
	xor a
	ld hl, w2d127
	ld [hld], a
	inc [hl]
	ret

.Func_b5fea:
	ld hl, wSceneObj3XCoord
	inc [hl]
	inc [hl]
	dec l
	inc [hl]
	inc [hl]
.asm_b5ff2
	ld a, [hl]
	cp $88
	ret c
	xor a
	ld hl, w2d127
	ld [hld], a
	ld [hl], a
	ret

.Func_b5ffd:
	lb de, 8, 93
	jr .asm_b5fd4

.Func_b6002:
	ld hl, wSceneObj3XCoord
	inc [hl]
	inc [hl]
	dec l
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_b5ff2

.Func_b600e:
	lb de, 8, 98
.asm_b6011
	ld b, $20
	jr .asm_b5fd6

.Func_b6015:
	lb de, 8, 93
	jr .asm_b6011

.Func_b601a:
	ld hl, w2d12c
	ld a, [hl]
	and a
	ret z
	dec a
	jr z, .asm_b6027
	dec a
	jr z, .asm_b603f
	ret
.asm_b6027
	ld hl, wSceneObj6
	ld a, $08
	ld [hli], a
	ld a, $2e
	ld [hl], a
	ld a, $1c
	ld hl, wSceneObj6State
	call SetSceneObjState
	xor a
	ld hl, w2d12d
	ld [hld], a
	inc [hl]
	ret
.asm_b603f
	ld hl, wSceneObj6YCoord
	inc [hl]
	inc [hl]
	ld b, [hl]
	ld hl, wSceneObj6XCoord
	dec [hl]
	dec [hl]
	ld a, b
	cp $88
	ret c
	xor a
	ld hl, w2d12d
	ld [hld], a
	ld [hl], a
	ret

Func_b6055:
	ld a, [wOWUIObj2Attributes]
	and a
	ret z
	ld hl, wOWUIObj2Duration
	inc [hl]
	ld a, [hl]
	cp $1a
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_076
	ret

WOWFunc_RedMusicBox:
	call .Func_b608a
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .Func_b60aa
	dw .Func_b60b5
	dw .Func_b60ba
	dw .Func_b60d0
	dw .Func_b60d5
	dw .Func_b60e4
	dw .Func_b60e9
	dw .Func_b60f4
	dw EndOWFunc

.Func_b608a:
	ld hl, wSceneObj6Unk7
	ld a, [hl]
	and a
	ret z
	cp $01
	play_sfx z, SFX_076
	inc [hl]
	ld a, [hl]
	cp $1b
	ret c
	ld a, $01
	ld [hl], a
	ret

.Wait1
	ld a, 20
	jp WaitOWFunc

.Func_b60aa
	play_sfx SFX_121
	jp AdvanceOWFunc

.Func_b60b5
	ld a, 254
	jp WaitOWFunc

.Func_b60ba
	ld a, $20
	ld hl, wSceneObj6State
	call SetSceneObjState
	ld hl, Data_8556e
	call Func_b5868
	ld a, $01
	ld [wSceneObj6Unk7], a
	jp AdvanceOWFunc

.Func_b60d0
	ld a, 23
	jp WaitOWFunc

.Func_b60d5
	ld a, $21
	ld hl, wSceneObj6State
	call SetSceneObjState
	ld hl, wSceneObj6
	dec [hl]
	jp AdvanceOWFunc

.Func_b60e4
	ld a, 10
	jp WaitOWFunc

.Func_b60e9
	ld a, $22
	ld hl, wSceneObj6State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b60f4
	ld a, [wOWFuncCounter]
	cp 106
	ret c
	xor a
	ld [wSceneObj6Unk7], a
	jp AdvanceOWFunc

Data_b6101:
	db  0,  0
	db -2,  0
	db -1,  0
	db -2,  0
	db -1,  0
	db -1,  0
	db -1,  0
	db -1,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
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
	db  0,  0
	db  0,  0
	db  1,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
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
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db $80

Data_b6196:
	db  0,  0
	db  1,  0
	db  0,  0
	db  1, -1
	db  0,  0
	db  1,  0
	db  0,  0
	db  1,  0
	db  0, -1
	db  1,  0
	db  0,  0
	db  1,  0
	db  0, -1
	db  1,  0
	db  0,  0
	db  1, -1
	db  0,  0
	db  1,  0
	db  0, -1
	db  1,  0
	db  0,  0
	db  1, -1
	db  0,  0
	db  1,  0
	db  0, -1
	db  0,  0
	db  1, -1
	db  0,  0
	db  1,  0
	db  0, -1
	db  0,  0
	db  1, -1
	db  0,  0
	db  1, -1
	db  0,  0
	db  1, -1
	db  0,  0
	db  1, -1
	db  0, -1
	db  0,  0
	db  1, -1
	db  0, -1
	db  1, -1
	db  0,  0
	db  1, -1
	db  0, -1
	db  0,  0
	db  1, -1
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  1, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0, -1
	db  1,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
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
	db $80

Data_b6239:
	db  0,  0
	db  1, -1
	db  0, -1
	db  1,  0
	db  0, -1
	db  1, -1
	db  0, -1
	db  1, -1
	db  0, -1
	db  0, -1
	db  1, -1
	db  0,  0
	db  1, -1
	db  0, -1
	db  0, -1
	db  1, -1
	db  0, -1
	db  0, -1
	db  1, -1
	db  0, -2
	db  0, -1
	db  1, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0,  0
	db  0, -1
	db  1, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db $80

Data_b6294:
	db  0,  0
	db  0,  0
	db -1,  1
	db -1,  1
	db -1,  0
	db -1,  1
	db -1,  1
	db -1,  1
	db -1,  0
	db -1,  1
	db -1,  1
	db  0,  1
	db -1,  1
	db  1,  0
	db  2, -1
	db  1,  0
	db  1, -1
	db  2,  0
	db  1, -1
	db  1,  0
	db  1, -1
	db  2,  0
	db  1, -1
	db  1,  1
	db -1,  2
	db -2,  2
	db -2,  2
	db -2,  1
	db -2,  2
	db -1,  2
	db -2,  2
	db -2,  1
	db -2,  2
	db -2,  2
	db -1,  2
	db  2,  0
	db  1, -1
	db  2, -1
	db  2, -1
	db  1, -1
	db  2,  0
	db  2, -1
	db  1, -1
	db  2, -1
	db  2, -1
	db  1, -1
	db  2,  0
	db -1,  2
	db -2,  1
	db -2,  2
	db -2,  2
	db -1,  1
	db -2,  2
	db -2,  1
	db -2,  2
	db -1,  1
	db -2,  2
	db -1,  2
	db  1,  1
	db  2,  0
	db  1,  0
	db  2,  0
	db  2, -1
	db  1,  0
	db  2,  0
	db  1,  0
	db  2, -1
	db  1,  0
	db  1,  1
	db -3,  2
	db -2,  1
	db -3,  2
	db -3,  1
	db -3,  2
	db -3,  1
	db -3,  1
	db -3,  2
	db -2,  1
	db -3,  1
	db -3,  2
	db -3,  1
	db $80

Data_b6337:
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

Data_b6478:
	db -1, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db  0, -1
	db  0, -1
	db -1, -1
	db  0,  0
	db -1, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db  0, -1
	db -1, -1
	db -1,  0
	db -1, -1
	db -1, -1
	db -1, -1
	db -1,  0
	db -1, -1
	db -1, -1
	db -1,  0
	db -1, -1
	db -1, -1
	db -1,  0
	db -1, -1
	db -1,  0
	db $80

Data_b64cd:
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db -1,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db -1,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db  0,  1
	db -1,  1
	db -1, -1
	db  0, -2
	db -1, -1
	db  0, -2
	db -1, -1
	db  0, -2
	db  0, -1
	db -1, -2
	db  0, -1
	db  0, -2
	db -1, -1
	db  0, -2
	db -1, -1
	db  0, -1
	db  0, -2
	db -1, -1
	db  0, -2
	db -1, -1
	db  0, -2
	db -1, -1
	db -1,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db -1,  2
	db  0,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db  0,  2
	db  0,  1
	db  0,  2
	db -1,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db  0,  2
	db -1,  1
	db -1, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db  0, -1
	db -1, -2
	db  0, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db  0, -1
	db -1, -2
	db  0, -1
	db  0, -1
	db -1, -1
	db  0, -1
	db  0, -2
	db -1, -1
	db  0, -1
	db  0, -1
	db -1, -1
	db -1,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db  0,  1
	db  0,  2
	db  0,  2
	db  0,  1
	db -1,  2
	db  0,  1
	db -1,  0
	db  0,  0
	db  0, -1
	db -1,  0
	db  0, -1
	db  0, -1
	db -1,  0
	db  0, -1
	db  0,  0
	db  0, -1
	db -1, -1
	db  0,  0
	db  0, -1
	db  0,  0
	db -1, -1
	db  0, -1
	db  0,  0
	db  0, -1
	db -1,  0
	db  0, -1
	db $80

SouthOWFunctions:
	ld a, [wOWSceneActionParam]
	dec a
	jumptable
	dw SOWFunc_SendSeeds      ; SOWFUNC_SEND_SEEDS
	dw SOWFunc_MagicSeed      ; SOWFUNC_MAGIC_SEED
	dw SOWFunc_YellowMusicBox ; SOWFUNC_YELLOW_MUSIC_BOX
	dw SOWFunc_CanyonThunder  ; SOWFUNC_CANYON_THUNDER
	dw SOWFunc_RaiseTower     ; SOWFUNC_RAISE_TOWER
	dw SOWFunc_Fan            ; SOWFUNC_FAN
	dw SOWFunc_SummonSnake    ; SOWFUNC_SUMMON_SNAKE
	dw SOWFunc_Earthquake     ; SOWFUNC_EARTHQUAKE
	dw SOWFunc_GreenMusicBox  ; SOWFUNC_GREEN_MUSIC_BOX
	dw SOWFunc_Explosives     ; SOWFUNC_EXPLOSIVES
	dw SOWFunc_FullMoon       ; SOWFUNC_FULL_MOON

SOWFunc_SendSeeds:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .ShowSeed1
	dw .WaitShowSeed
	dw .ShowSeed2
	dw .WaitShowSeed
	dw .ShowSeed3
	dw .WaitShowSeed
	dw .PlayFlyingSFX
	dw .MoveSeeds
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, 30
	jp WaitOWFunc

.Wait2:
	ld a, 10
	jp WaitOWFunc

.ShowSeed1:
	ld hl, wSceneObj4State
.asm_b6606
	ld a, $06
	call SetSceneObjState
	play_sfx SFX_TEMPLE_ROCK
	jp AdvanceOWFunc

.WaitShowSeed:
	ld a, 30
	jp WaitOWFunc

.ShowSeed2:
	ld hl, wSceneObj2State
	jr .asm_b6606

.ShowSeed3:
	ld a, $01
	ld [w2d125], a
	ld hl, wSceneObj3State
	jr .asm_b6606

.PlayFlyingSFX:
	play_sfx SFX_07F
	jp AdvanceOWFunc

.MoveSeeds:
	ld a, [w2d125]
	and a
	call nz, .MoveSeed2
	ld a, [w2d129]
	and a
	call nz, .MoveSeed1
	ld a, [w2d127]
	and a
	call nz, .MoveSeed3
	ld hl, wSceneObj3XCoord
	ld a, [hl]
	cp $f0
	ret c
	xor a
	ld [w2d127], a
	jp AdvanceOWFunc

.MoveSeed2:
	ld hl, w2d125
	call .GetXOffset
	cpl
	inc a ; = -a
	ld hl, wSceneObj2XCoord
	add [hl]
	ld [hld], a
	dec [hl]
	dec [hl]
	dec [hl]
	ld a, [hl]
	cp $1a
	jr z, .asm_b6675
	cp $f0
	ret c
	xor a
	ld [w2d125], a
	ret
.asm_b6675
	ld a, $01
	ld [w2d129], a
	play_sfx SFX_07F
	ret

.MoveSeed1:
	ld hl, wSceneObj4YCoord
	dec [hl]
	dec [hl]
	dec [hl]
	ld a, [hl]
	cp $1a
	jr z, .asm_b6696
	cp $f0
	ret c
	xor a
	ld [w2d129], a
	ret
.asm_b6696
	ld a, $01
	ld [w2d127], a
	play_sfx SFX_07F
	ret

.MoveSeed3:
	ld hl, w2d127
	call .GetXOffset
	ld hl, wSceneObj3XCoord
	add [hl]
	ld [hld], a
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.GetXOffset:
	ld a, [hl]
	cp $18
	jr nc, .no_carry
	inc [hl]
.no_carry
	ld c, a
	ld b, $00
	ld hl, .x_offsets
	add hl, bc
	ld a, [hl]
	ret

.x_offsets
	db 0, 1, 0, 0, 1, 1, 0, 1
	db 1, 1, 1, 1, 1, 2, 2, 2
	db 4, 6, 8, 8, 8, 8, 8, 8

SOWFunc_MagicSeed:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .PlayFallSFX
	dw .SeedFall
	dw .WaitSeedFall
	dw .Wait2
	dw .GrowStalk
	dw .WaitGrowStalk
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.PlayFallSFX:
	play_sfx SFX_119
	jp AdvanceOWFunc

.SeedFall:
	ld hl, wOWFuncCounter
	call GetSceneFallingYOffset
	ld hl, wSceneObj4YCoord
	add [hl]
	ld [hl], a
	cp $56
	ret c
	ld a, $06
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_014
	jp AdvanceOWFunc

.WaitSeedFall:
	ld hl, wSceneObj4State
	ld b, $03
	jp WaitOWObjState

.Wait2:
	ld a, 30
	jp WaitOWFunc

.GrowStalk:
	ld a, $02
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_11A
	jp AdvanceOWFunc

.WaitGrowStalk:
	ld hl, wSceneObj4State
	ld b, $01
	jp WaitOWObjState

SOWFunc_YellowMusicBox:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .PlayMusicBoxSFX
	dw .WaitMusic
	dw .LowerBridge
	dw .ShowLoweredBridge
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.Wait2:
	ld a, 40
	jp WaitOWFunc

.PlayMusicBoxSFX:
	play_sfx SFX_11E
	jp AdvanceOWFunc

.WaitMusic:
	ld a, 254
	jp WaitOWFunc

.LowerBridge:
	play_sfx SFX_123
	ld a, $08
	ld hl, wSceneObj6State
	call SetSceneObjState
	jp AdvanceOWFunc

.ShowLoweredBridge:
	ld hl, wSceneObj6State
	ld b, $09
	jp WaitOWObjState

SOWFunc_CanyonThunder:
	call .Func_b68cd
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b67c7
	dw .Func_b67d1
	dw .Func_b67ec
	dw .Func_b67f4
	dw .Func_b67f9
	dw .Func_b6801
	dw .Func_b6810
	dw .Func_b681b
	dw .Func_b6820
	dw .Func_b6828
	dw .Func_b6831
	dw .Func_b6971
	dw Func_b588d
	dw .Func_b6836
	dw .Func_b6847
	dw .Func_b684c
	dw .Func_b6968
	dw .Func_b67cc
	dw EndOWFunc

.Func_b67c7:
	ld a, 34
	jp WaitOWFunc

.Func_b67cc:
	ld a, 90
	jp WaitOWFunc

.Func_b67d1:
	ld hl, wSceneObj2State
.asm_b67d4
	ld a, $12
.asm_b67d6
	call SetSceneObjState
	ld a, $01
	ld [wPalConfig1TotalSteps], a
	call .Func_b6879
	play_sfx SFX_124
	jp AdvanceOWFunc

.Func_b67ec:
	call .Func_b6879
	ld a, 16
	jp WaitOWFunc

.Func_b67f4:
	ld hl, wSceneObj10State
	jr .asm_b67d4

.Func_b67f9:
	call .Func_b6879
	ld a, 54
	jp WaitOWFunc

.Func_b6801:
	ld hl, wSceneObj2YCoord
	ld a, $56
	ld [hli], a
	ld [hl], $47
	ld hl, wSceneObj2State
	ld a, $17
	jr .asm_b67d6

.Func_b6810:
	call .Func_b6879
	ld a, [wPalConfig1TotalSteps]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b681b:
	ld a, 30
	jp WaitOWFunc

.Func_b6820:
	ld a, $01
	ld [w2d124], a
	jp AdvanceOWFunc

.Func_b6828:
	ld a, [w2d124]
	cp $07
	ret c
	jp AdvanceOWFunc

.Func_b6831:
	ld a, 7
	jp WaitOWFunc

.Func_b6836:
	ld a, $0a
	ld hl, wSceneObj5State
	call SetSceneObjState
	ld hl, Data_855b2
	call Func_b5868
	jp AdvanceOWFunc

.Func_b6847:
	ld a, 45
	jp WaitOWFunc

.Func_b684c:
	ld hl, Pals_84280
	ld de, wTempPals1
	ld b, BANK(Pals_84280)
	ld c, 8 palettes
	call CopyFarBytes
	ld hl, Pals_84980
	ld de, wTempPals2
	ld b, BANK(Pals_84980)
	ld c, 8 palettes
	call CopyFarBytes
	jp AdvanceOWFunc

.Func_b6869:
	ld hl, wPalConfig1TotalSteps
	ld a, [hl]
	and a
	ret z
	inc [hl]
	cp $05
	jr z, .flash2_pal
	cp $09
	jr z, .flash1_pal
	ret

.Func_b6879:
	ld hl, wPalConfig1TotalSteps
	ld a, [hl]
	and a
	ret z
	inc [hl]
	cp $01
	jr z, .flash1_pal
	cp $05
	jr z, .flash2_pal
	cp $09
	jr z, .asm_b6892
	ret
.flash1_pal
	ld hl, Pals_8698d
	jr .got_pal
.asm_b6892
	xor a
	ld [hl], a
	ld a, [w2d062]
	cp $07
	jr z, .flash1_pal
	ld hl, Pals_84280
.got_pal
	ld de, wTempBGPals
	ld b, BANK(Pals_84280) ; aka BANK(Pals_8698d)
	ld c, 8 palettes
	call CopyFarBytes
.apply_pals
	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	ld a, BCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 1 palettes
	ld [hli], a
	ld a, HIGH(wTempBGPals)
	ld [hli], a
	ld a, LOW(wTempBGPals)
	ld [hli], a
	ret

.flash2_pal
	ld hl, wTempBGPals palette 0
	ld b, 3 palettes
	call Func_b69a6
	ld hl, wTempBGPals palette 7
	ld b, 4
	call Func_b69a6
	jr .apply_pals

.Func_b68cd:
	ld a, [w2d124]
	and a
	ret z
	ld hl, w2d125
	inc [hl]
	dec a
	jumptable
	dw .Func_b68ee
	dw .Func_b6919
	dw .Func_b692e
	dw .Func_b6919
	dw .Func_b6938
	dw .Func_b6919
	dw .Func_b6942
	dw .Func_b6919
	dw .Func_b694c
	dw .Func_b6925
	dw .Func_b6960

.Func_b68ee:
	ld hl, wSceneObj2
	lb de, $50, $38
	ld c, $17
.asm_b68f6
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, c
	call SetSceneObjState
	ld a, $01
	ld [wPalConfig1TotalSteps], a
	call .Func_b6869
.asm_b6908
	play_sfx SFX_124
.asm_b6910
	ld hl, w2d124
	inc [hl]
	xor a
	ld [w2d125], a
	ret

.Func_b6919:
	call .Func_b6869
	ld a, $07
	ld hl, w2d125
	cp [hl]
	ret nc
	jr .asm_b6910

.Func_b6925:
	ld a, $07
	ld hl, w2d125
	cp [hl]
	ret nc
	jr .asm_b6910

.Func_b692e:
	ld hl, wSceneObj1
	lb de, $48, $46
	ld c, $12
	jr .asm_b68f6

.Func_b6938:
	ld hl, wSceneObj2
	lb de, $42, $2e
	ld c, $17
	jr .asm_b68f6

.Func_b6942:
	ld hl, wSceneObj1
	lb de, $3e, $38
	ld c, $12
	jr .asm_b68f6

.Func_b694c:
	ld hl, wSceneObj10
	lb de, $3b, $1f
	ld c, $12
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, c
	call SetSceneObjState
	jr .asm_b6908

.Func_b6960:
	xor a
	ld [w2d124], a
	ld [w2d125], a
	ret

.Func_b6968:
	ld a, [wOWFuncCounter]
	bit 0, a
	ret z
	jp Func_b588d

.Func_b6971:
	ld hl, wTempPals1
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, wTempPals2
	ld de, wTempOBPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, wTempPals1
	ld b, 3 palettes
	call Func_b69a6
	ld hl, wTempPals1 palette 7
	ld b, 4
	call Func_b69a6
	ld hl, wTempPals2
	ld b, 4 palettes
	call Func_b69a6
	xor a
	ld [wPalConfig1TotalSteps], a
	jp AdvanceOWFunc

Func_b69a6:
.asm_b69a6
	ld a, $9c
	ld [hli], a
	ld a, $73
	ld [hli], a
	dec b
	jr nz, .asm_b69a6
	ret

SOWFunc_RaiseTower:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .StartDust
	dw .Wait2
	dw .RaiseTower
	dw .RaiseTower
	dw .RaiseTower
	dw .FinishRaiseTower
	dw .Func_b6a0f
	dw .Wait3
	dw .Func_b6a4b
	dw .Wait4
	dw EndOWFunc

.Wait1:
	ld a, 30
	jp WaitOWFunc

.Wait4:
	ld a, 40
	jp WaitOWFunc

.StartDust:
	ld a, $0b
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_11B
	jp AdvanceOWFunc

.Wait2:
	ld a, 45
	jp WaitOWFunc

.RaiseTower:
	call .Func_b6a16
	ret nz
	ld hl, wSceneObj3YCoord
	ld a, $10
	add [hl]
	ld [hl], a
	ld hl, wSceneObj3State
	ld a, [hl]
	inc a
	call SetSceneObjState
	jp AdvanceOWFunc

.FinishRaiseTower:
	call .Func_b6a16
	cp $50
	ret nz
	jp AdvanceOWFunc

.Func_b6a0f:
	call .Func_b6a2e
	ret nz
	jp AdvanceOWFunc

.Func_b6a16:
	ld a, [wGlobalCounter]
	and %111
	jr z, .asm_b6a28
	and $01
	ret nz
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld a, [hl]
	cp $48
	ret
.asm_b6a28
	ld hl, wSceneObj3YCoord
	ld a, [hl]
	inc [hl]
	ret

.Func_b6a2e:
	ld a, [wGlobalCounter]
	and %1111
	jr z, .asm_b6a40
	and $03
	ret nz
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld a, [hl]
	cp $48
	ret

.asm_b6a40
	ld hl, wSceneObj3YCoord
	ld a, [hl]
	inc [hl]
	ret

.Wait3:
	ld a, 40
	jp WaitOWFunc

.Func_b6a4b:
	ld a, $00
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $00
	ld hl, wSceneObj3State
	call SetSceneObjState
	ld hl, Data_85579
	call Func_b5868
	jp AdvanceOWFunc

SOWFunc_Fan:
	call .Func_b6af2
	call .Func_b6b48
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b6a86
	dw .Func_b6a90
	dw .Func_b6aa3
	dw .Func_b6aa8
	dw .Func_b6ab0
	dw .Func_b6abe
	dw .Func_b6acf
	dw .Func_b6ad4
	dw .Func_b6aea
	dw .Func_b6a8b
	dw EndOWFunc

.Func_b6a86:
	ld a, 20
	jp WaitOWFunc

.Func_b6a8b:
	ld a, 20
	jp WaitOWFunc

.Func_b6a90:
	ld a, $1a
	ld hl, wSceneObj8State
	call SetSceneObjState
	play_sfx SFX_12F
	jp AdvanceOWFunc

.Func_b6aa3:
	ld a, 24
	jp WaitOWFunc

.Func_b6aa8:
	ld a, $01
	ld [w2d122], a
	jp AdvanceOWFunc

.Func_b6ab0:
	ld a, [wOWFuncCounter]
	cp $0a
	ret nz
	ld a, $01
	ld [w2d124], a
	jp AdvanceOWFunc

.Func_b6abe:
	ld a, [wSceneObj9Frame]
	cp $21
	ret nz
	ld a, $11
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b6acf:
	ld a, 12
	jp WaitOWFunc

.Func_b6ad4:
	ld hl, wOWFuncCounter
	ld a, [hl]
	cp $08
	ret nz
	xor a
	ld [hl], a
	ld a, [wSceneObj9YCoord]
	dec a
	ld [wSceneObj9YCoord], a
	cp $45
	ret nz
	jp AdvanceOWFunc

.Func_b6aea:
	ld a, [w2d124]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b6af2:
	ld hl, w2d122
	ld a, [hl]
	and a
	ret z
	dec a
	jumptable
	dw .Func_b6b08
	dw .Func_b6b22
	dw .Func_b6b08
	dw .Func_b6b22
	dw .Func_b6b08
	dw .Func_b6b22
	dw .Func_b6b3b

.Func_b6b08:
	ld a, $18
	ld hl, wSceneObj1State
	call SetSceneObjState
	ld hl, wSceneObj1YCoord
	ld a, $5c
	ld [hli], a
	ld a, $82
	ld [hl], a
	ld hl, w2d122
	inc [hl]
	xor a
	ld [w2d123], a
	ret

.Func_b6b22:
	ld hl, w2d123
	inc [hl]
	ld a, [hl]
	cp $02
	ret nz
	xor a
	ld [hl], a
	ld hl, wSceneObj1YCoord
	dec [hl]
	inc l
	inc [hl]
	ld a, [hl]
	cp $8c
	ret nz
	ld hl, w2d122
	inc [hl]
	ret

.Func_b6b3b:
	ld a, $00
	ld hl, wSceneObj1State
	call SetSceneObjState
	xor a
	ld [w2d122], a
	ret

.Func_b6b48:
	ld hl, w2d124
	ld a, [hl]
	and a
	ret z
	dec a
	jumptable
	dw .Func_b6b62
	dw .Func_b6b7c
	dw .Func_b6b62
	dw .Func_b6b7c
	dw .Func_b6b62
	dw .Func_b6b7c
	dw .Func_b6b95
	dw .Func_b6ba2
	dw .Func_b6bb8

.Func_b6b62:
	ld a, $18
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj2YCoord
	ld a, $5c
	ld [hli], a
	ld a, $82
	ld [hl], a
	ld hl, w2d124
	inc [hl]
	xor a
	ld [w2d125], a
	ret

.Func_b6b7c:
	ld hl, w2d125
	inc [hl]
	ld a, [hl]
	cp $02
	ret nz
	xor a
	ld [hl], a
	ld hl, wSceneObj2YCoord
	dec [hl]
	inc l
	inc [hl]
	ld a, [hl]
	cp $8c
	ret nz
	ld hl, w2d124
	inc [hl]
	ret

.Func_b6b95:
	ld a, $00
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, w2d124
	inc [hl]
	ret

.Func_b6ba2:
	ld a, [wSceneObj8Frame]
	cp $4a
	ret nz
	ld a, $19
	ld hl, wSceneObj8State
	call SetSceneObjState
	ld hl, w2d124
	inc [hl]
	inc l
	xor a
	ld [hl], a
	ret

.Func_b6bb8:
	ld hl, w2d125
	inc [hl]
	ld a, [hl]
	cp $18
	ret nz
	ld a, $00
	ld hl, wSceneObj8State
	call SetSceneObjState
	xor a
	ld [w2d124], a
	ret

SOWFunc_SummonSnake:
	call .MoveNotes
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .PlayFluteSFX
	dw .WaitNotesAndShowSnake
	dw .WaitSnakeComeOut
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.PlayFluteSFX:
	ld a, $01
	ld [wSceneObj7Unk7], a
	play_sfx SFX_118
	jp AdvanceOWFunc

.WaitNotesAndShowSnake:
	ld hl, wSceneObj1XCoord
	ld a, $08
	cp [hl]
	ret nz
	ld a, $13
	ld hl, wSceneObj7State
	call SetSceneObjState
	play_sfx SFX_TEMPLE_ROCK
	jp AdvanceOWFunc

.WaitSnakeComeOut:
	ld a, [wSceneObj7Frame]
	cp $31
	ret nz
	jp AdvanceOWFunc

.MoveNotes:
	ld a, [wSceneObj7Unk7]
	and a
	ret z
	ld hl, wSceneObj1XCoord
	dec [hl]
	ld a, [hl]
	add $18
	cp $f0
	ret c
	xor a
	ld [wSceneObj7Unk7], a
	ret

SOWFunc_Earthquake:
	call Func_b71fc

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b6c53
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .Func_b6c5d
	dw .Func_b6c73
	dw .Func_b6c78
	dw .Func_b6c91
	dw .Func_b6c97
	dw .Func_b6ca4
	dw .Func_b6c58
	dw EndOWFunc

.Func_b6c53:
	ld a, 20
	jp WaitOWFunc

.Func_b6c58:
	ld a, 60
	jp WaitOWFunc

.Func_b6c5d:
	ld a, $01
	ld [wOWUIObj1YCoord], a
	ld a, $01
	ld [w2d049], a
	ld a, $03
	ld hl, w2d03e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	jp AdvanceOWFunc

.Func_b6c73:
	ld a, 120
	jp WaitOWFunc

.Func_b6c78:
	ld hl, Data_855f9
	call Func_b5868
	play_sfx SFX_061
.asm_b6c86
	ld a, $1b
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b6c91:
	ld hl, wSceneObj2State
	jp WaitOWObjDisappear

.Func_b6c97:
	ld hl, wSceneObj2YCoord
	ld a, $02
	add [hl]
	ld [hli], a
	ld a, $fe
	add [hl]
	ld [hl], a
	jr .asm_b6c86

.Func_b6ca4:
	ld a, $03
	ld [wOWUIObj1YCoord], a
	ld hl, w2d03e
	ld a, $0e
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [w2d049], a
	jp AdvanceOWFunc

SOWFunc_GreenMusicBox:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .PlayMusicBoxSFX
	dw .WaitMusic
	dw .BlowUpCave
	dw .HideSmoke
	dw .Wait2
	dw EndOWFunc

.Wait1:
	ld a, 20
	jp WaitOWFunc

.Wait2:
	ld a, 40
	jp WaitOWFunc

.PlayMusicBoxSFX:
	play_sfx SFX_120
	jp AdvanceOWFunc

.WaitMusic:
	ld a, 254
	jp WaitOWFunc

.BlowUpCave:
	ld hl, Data_8560e
	call Func_b5868
	ld a, $1b
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_129
	jp AdvanceOWFunc

.HideSmoke:
	ld hl, wSceneObj2State
	jp WaitOWObjDisappear

SOWFunc_Explosives:
EOWFunc_Explosives:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b6d3d
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .CheckMapSide

	; SOUTH
	dw .Func_b6d5a
	dw .Func_b6d6d
	dw .Func_b6d73
	dw .Func_b6d6d
	dw .Func_b6d83
	dw .Func_b6d6d
	dw .Func_b6d42
	dw EndOWFunc

	; EAST
	dw .Func_b6d88
	dw .Func_b6d6d
	dw .Func_b6d92
	dw .Func_b6dcd
	dw .Func_b6d97
	dw .Func_b6d9c
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .Func_b6daa
	dw .Func_b6db4
	dw .Func_b6d47
	dw EndOWFunc

.Func_b6d3d:
	ld a, 20
	jp WaitOWFunc

.Func_b6d42:
	ld a, 40
	jp WaitOWFunc

.Func_b6d47:
	ld a, 50
	jp WaitOWFunc

.CheckMapSide:
	ld a, [wCurMapSide]
	cp SOUTH
	jp z, AdvanceOWFunc
	ld a, $0e
	ld [w2d062], a
	ret

.Func_b6d5a:
	ld a, $1c
	ld hl, wSceneObj2State
	call SetSceneObjState
.asm_b6d62
	play_sfx SFX_129
	jp AdvanceOWFunc

.Func_b6d6d:
	ld hl, wSceneObj2State
	jp WaitOWObjDisappear

.Func_b6d73:
	lb de, -5, 4
.asm_b6d76
	ld hl, wSceneObj2YCoord
	ld a, $20
	add d
	ld [hli], a
	ld a, $44
	add e
	ld [hl], a
	jr .Func_b6d5a

.Func_b6d83:
	lb de, 3, 5
	jr .asm_b6d76

.Func_b6d88:
	ld a, $08
	ld hl, wSceneObj2State
	call SetSceneObjState
	jr .asm_b6d62

.Func_b6d92:
	ld a, 20
	jp WaitOWFunc

.Func_b6d97:
	ld a, 10
	jp WaitOWFunc

.Func_b6d9c:
	ld b, EAST
	ld d, OWEAST_THE_COLOSSAL_HOLE
	call LoadLevelName
	xor a
	ld [wPalConfig1TotalSteps], a
	jp AdvanceOWFunc

.Func_b6daa:
	ld a, $22
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .asm_b6d62

.Func_b6db4:
	ld a, [wOWFuncCounter]
	cp $14
	ret c
	ld hl, wSceneObj2YCoord
	ld a, $46
	ld [hli], a
	ld a, $50
	ld [hl], a
	ld a, $22
	ld hl, wSceneObj2State
	call SetSceneObjState
	jr .asm_b6d62

.Func_b6dcd:
	ld a, $03
	ld [w2d0e0], a
	farcall Func_852e5
	ld a, [w2d0e0]
	and a
	ret nz
	jp AdvanceOWFunc

SOWFunc_FullMoon:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Wait1
	dw .PlayGongSFX
	dw .Wait2
	dw .MoveMoon
	dw .Wait3
	dw EndOWFunc

.Wait1:
	ld a, 40
	jp WaitOWFunc

.Wait3:
	ld a, 60
	jp WaitOWFunc

.PlayGongSFX:
	play_sfx SFX_105
	jp AdvanceOWFunc

.Wait2:
	ld a, 30
	jp WaitOWFunc

.MoveMoon:
	ld a, [wGlobalCounter]
	and %111
	ret nz
	ld hl, wSceneObj14
	dec [hl]
	inc l
	inc [hl]
	ld a, [hl]
	cp $7b
	jr z, .asm_b6e2c
	cp $80
	ret nz
	jp AdvanceOWFunc
.asm_b6e2c
	play_sfx SFX_11A
	ret

LoadOWSceneLevelName:
	ld a, [wCurMapSide]
	ld b, a
	add a
	ld e, a
	ld d, $00
	ld hl, .MapSidePointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOWSceneActionParam]
	dec a
	ld e, a
	add hl, de
	ld d, [hl]
	ld a, b
	and a
	jr z, .is_north
	; levels that are not in the north
	; have their value incremented by 1
	dec d
.is_north
	call LoadLevelName
	xor a
	ld [wPalConfig1TotalSteps], a
	jp AdvanceOWFunc

.MapSidePointers:
	dw .North
	dw .West
	dw .South
	dw .East

.North:
	db $00 ; NOWFUNC_CUT_TREE
	db $00 ; NOWFUNC_OPEN_GATE
	db $00 ; NOWFUNC_GARLIC
	db OWNORTH_THE_VAST_PLAIN ; NOWFUNC_MAGIC_SEED
	db OWNORTH_THE_PEACEFUL_VILLAGE ; NOWFUNC_SUMMON_SNAKE
	db OWNORTH_OUT_OF_THE_WOODS ; NOWFUNC_FALL_LEAVES
	db $00 ; NOWFUNC_BLUE_MUSIC_BOX
	db $00 ; NOWFUNC_GOLD_MUSIC_BOX
	db $00 ; NOWFUNC_CRAYON_RED
	db $00 ; NOWFUNC_CRAYON_BROWN
	db $00 ; NOWFUNC_CRAYON_YELLOW
	db $00 ; NOWFUNC_CRAYON_GREEN
	db $00 ; NOWFUNC_CRAYON_CYAN
	db $00 ; NOWFUNC_CRAYON_BLUE
	db $00 ; NOWFUNC_CRAYON_PINK
	db $00 ; NOWFUNC_BOTTOM_BAR

.West:
	db $00 ; WOWFUNC_RAIN
	db $00 ; WOWFUNC_CLEAR_TORNADO
	db $00 ; WOWFUNC_ELEVATOR_WORKING
	db OWWEST_THE_POOL_OF_RAIN + 1 ; WOWFUNC_MAGIC_SEED
	db OWWEST_THE_VOLCANOS_BASE + 1 ; WOWFUNC_SUMMON_SNAKE
	db OWWEST_THE_VOLCANOS_BASE + 1 ; WOWFUNC_EARTHQUAKE
	db $00 ; WOWFUNC_VULCANO_ERUPTION
	db $00 ; WOWFUNC_RED_MUSIC_BOX

.South:
	db $00 ; SOWFUNC_SEND_SEEDS
	db OWSOUTH_THE_GRASSLANDS + 1 ; SOWFUNC_MAGIC_SEED
	db $00 ; SOWFUNC_YELLOW_MUSIC_BOX
	db $00 ; SOWFUNC_CANYON_THUNDER
	db $00 ; SOWFUNC_RAISE_TOWER
	db $00 ; SOWFUNC_FAN
	db OWSOUTH_THE_GRASSLANDS + 1 ; SOWFUNC_SUMMON_SNAKE
	db OWSOUTH_THE_STEEP_CANYON + 1 ; SOWFUNC_EARTHQUAKE
	db $00 ; SOWFUNC_GREEN_MUSIC_BOX
	db OWSOUTH_CAVE_OF_FLAMES + 1 ; SOWFUNC_EXPLOSIVES
	db $00 ; SOWFUNC_FULL_MOON

.East:
	db $00 ; EOWFUNC_FREEZE_SEA
	db OWEAST_THE_STAGNANT_SWAMP + 1 ; EOWFUNC_EARTHQUAKE
	db $00 ; EOWFUNC_FORM_CASTLE
	db OWEAST_THE_STAGNANT_SWAMP + 1 ; EOWFUNC_EXPLOSIVES
	db $00 ; EOWFUNC_VULCANO_ERUPTION
	db $00 ; EOWFUNC_BURN_VINES
	db $00 ; EOWFUNC_SHOW_WARPED_VOID
	db OWEAST_FOREST_OF_FEAR + 1 ; EOWFUNC_RAISE_PIPE
	db $00 ; EOWFUNC_DAYTIME

WaitOWSceneLevelNameFadeIn:
	farcall FadeInLevelName
	srl c
	ret c ; not done
	jp AdvanceOWFunc

WaitOWScene16Frames:
	ld a, 16
	jp WaitOWFunc

EastOWFunctions:
	ld a, [wOWSceneActionParam]
	dec a
	jumptable
	dw EOWFunc_FreezeSea       ; EOWFUNC_FREEZE_SEA
	dw EOWFunc_Earthquake      ; EOWFUNC_EARTHQUAKE
	dw EOWFunc_FormCastle      ; EOWFUNC_FORM_CASTLE
	dw EOWFunc_Explosives      ; EOWFUNC_EXPLOSIVES
	dw EOWFunc_VulcanoEruption ; EOWFUNC_VULCANO_ERUPTION
	dw EOWFunc_BurnVines       ; EOWFUNC_BURN_VINES
	dw EOWFunc_ShowWarpedVoid  ; EOWFUNC_SHOW_WARPED_VOID
	dw EOWFunc_RaisePipe       ; EOWFUNC_RAISE_PIPE
	dw EOWFunc_Daytime         ; EOWFUNC_DAYTIME

EOWFunc_FreezeSea:
	call .Func_b6f77
	call .Func_b6fae
	call .Func_b7056
	call .Func_b6ffe

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b6ee5
	dw .Func_b6ef4
	dw .Func_b6f00
	dw .Func_b6f0c
	dw .Func_b6f11
	dw .Func_b6f23
	dw .Func_b6f3a
	dw .Func_b6f4a
	dw .Func_b6eea
	dw EndOWFunc

.Func_b6ee5:
	ld a, 60
	jp WaitOWFunc

.Func_b6eea:
	ld a, 60
	jp WaitOWFunc

; unreachable
	ld a, 2
	jp WaitOWFunc

.Func_b6ef4:
	ld hl, Data_85657
	call Func_b5868
	call .Func_b6f52
	jp AdvanceOWFunc

.Func_b6f00:
	xor a
	ld [w2d046], a
	ld a, $01
	ld [wSceneObj1Unk7], a
	jp AdvanceOWFunc

.Func_b6f0c:
	ld a, 14
	jp WaitOWFunc

.Func_b6f11:
	ld a, $01
	ld [w2d150], a
	ld hl, w2d151
	play_sfx SFX_11C
	jr .asm_b6f31

.Func_b6f23:
	ld a, [wOWFuncCounter]
	cp $04
	ret nz
	ld a, $01
	ld [wOWUIObj1YCoord], a
	ld hl, wOWUIObj1XCoord
.asm_b6f31
	ld de, .data
	ld [hl], e
	inc l
	ld [hl], d
	jp AdvanceOWFunc

.Func_b6f3a:
	ld a, [wOWFuncCounter]
	cp $04
	ret nz
	ld a, $01
	ld [wOWUIObj2YCoord], a
	ld hl, wSceneWarioOAMPtr
	jr .asm_b6f31

.Func_b6f4a:
	ld a, [wSceneObj1Unk7]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b6f52:
	ld hl, Pals_84480 palette 4
	ld de, wTempPals1 palette 4
	ld c, 1 palettes
	ld b, BANK(Pals_84480)
	call CopyFarBytes
	jr .asm_b6f64
	call Func_b4874
.asm_b6f64
	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	ld a, BCPSF_AUTOINC | palette 4
	ld [hli], a
	ld a, 1
	ld [hli], a
	ld a, HIGH(wTempPals1 palette 4)
	ld [hli], a
	ld a, LOW(wTempPals1 palette 4)
	ld [hli], a
	ret

.Func_b6f77:
	ld a, [wSceneObj1Unk7]
	and a
	ret z
	dec a
	jr z, .asm_b6f83
	dec a
	jr z, .asm_b6f8c
	ret
.asm_b6f83
	xor a
	ld [w2d122], a
	ld hl, wSceneObj1Unk7
	inc [hl]
	ret
.asm_b6f8c
	ld hl, w2d122
	inc [hl]
	ld c, [hl]
	ld hl, wSceneObj1XCoord
	inc [hl]
	inc [hl]
	ld a, [hl]
	add $18
	cp $c0
	jr nc, .asm_b6fa9
	cp $78
	ret c
	ld a, c
	and $03
	ret nz
	ld hl, wSceneObj1YCoord
	dec [hl]
	ret
.asm_b6fa9
	xor a
	ld [wSceneObj1Unk7], a
	ret

.Func_b6fae:
	ld a, [wOWUIObj1YCoord]
	and a
	ret z
	ld hl, wOWUIObj1YCoord
	inc [hl]
	ld a, [hl]
	cp $05
	ret c
	ld a, $01
	ld [hli], a
	ld hl, wOWUIObj1XCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	cp $80
	jr z, .asm_b6ff9
	ld [wOWUIObj1Attributes], a
	ld a, [hli]
	ld [wSceneWarioDuration], a
	ld a, [hli]
	ld [wOWUIObj1FramesetOffset], a
	ld a, [hli]
	ld [wOWUIObj1State], a
	ld a, [hli]
	ld [wSceneWarioUnk7], a
	ld a, l
	ld [wOWUIObj1XCoord], a
	ld a, h
	ld [wOWUIObj1Frame], a
	farcall Func_85a68
	ld a, TRUE
	ld [wOWPendingTileUpdate], a
	ret
.asm_b6ff9
	xor a
	ld [wOWUIObj1YCoord], a
	ret

.Func_b6ffe:
	ld a, [wOWUIObj2YCoord]
	and a
	ret z
	ld hl, wOWUIObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $05
	ret c
	ld a, $01
	ld [hli], a
	ld hl, wSceneWarioOAMPtr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	cp $80
	jr z, .asm_b7051
	ld [wOWUIObj2Attributes], a
	ld a, [hli]
	ld [wOWUIObj2Duration], a
	ld a, [hli]
	ld [wSceneWarioIgnoreScroll], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, l
	ld [wSceneWarioOAMPtr], a
	ld a, h
	ld [wOWUIObj2Frame], a
	ld hl, $140
	add hl, de
	ld a, l
	ld [wOWUIObj2State], a
	ld a, h
	ld [wOWUIObj2Unk7], a
	farcall Func_85aa2
	ld a, TRUE
	ld [wOWPendingTileUpdate], a
	ret
.asm_b7051
	xor a
	ld [wOWUIObj2YCoord], a
	ret

.Func_b7056:
	ld a, [w2d150]
	and a
	ret z
	ld hl, w2d150
	inc [hl]
	ld a, [hl]
	cp $05
	ret c
	ld a, $01
	ld [hli], a
	ld hl, w2d151
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	cp $80
	jr z, .asm_b70a9
	ld [wd153], a
	ld a, [hli]
	ld [wd154], a
	ld a, [hli]
	ld [wd155], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, l
	ld [w2d151], a
	ld a, h
	ld [wd152], a
	ld hl, $280
	add hl, de
	ld a, l
	ld [wd156 + 0], a
	ld a, h
	ld [wd156 + 1], a
	farcall Func_85acb
	ld a, TRUE
	ld [wOWPendingTileUpdate], a
	ret
.asm_b70a9
	xor a
	ld [w2d150], a
	ret

.data
	db $04, $61, $d6, $c9, $56
	db $04, $62, $d6, $ca, $56
	db $04, $63, $d6, $cb, $56
	db $04, $64, $d6, $cc, $56
	db $04, $65, $d6, $cd, $56
	db $04, $66, $d6, $ce, $56
	db $04, $67, $d6, $cf, $56
	db $04, $68, $d6, $d0, $56
	db $04, $69, $d6, $d1, $56
	db $04, $6a, $d6, $d2, $56
	db $04, $6b, $d6, $d3, $56
	db $04, $6c, $d6, $d4, $56
	db $04, $6d, $d6, $d5, $56
	db $04, $6e, $d6, $d6, $56
	db $05, $4f, $d6, $b7, $56
	db $05, $50, $d6, $b8, $56
	db $05, $51, $d6, $b9, $56
	db $05, $52, $d6, $ba, $56
	db $80 ; end

EOWFunc_Earthquake:
	call Func_b71fc

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b7138
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .Func_b7142
	dw .Func_b7160
	dw .Func_b716b
	dw .Func_b7170
	dw .Func_b7188
	dw .Func_b7195
	dw .Func_b71a2
	dw .Func_b71af
	dw .Func_b71bc
	dw .Func_b71c9
	dw .Func_b71d9
	dw .Func_b71e4
	dw .Func_b71ed
	dw .Func_b713d
	dw EndOWFunc

.Func_b7138:
	ld a, 20
	jp WaitOWFunc

.Func_b713d:
	ld a, 40
	jp WaitOWFunc

.Func_b7142:
	ld b, $04
	hlbgcoord 2, 10, wAttrmap
.asm_b7147
	set BGB_PRI, [hl]
	inc hl
	dec b
	jr nz, .asm_b7147
	ld b, $04
	hlbgcoord 2, 11, wAttrmap
.asm_b7152
	set BGB_PRI, [hl]
	inc hl
	dec b
	jr nz, .asm_b7152
	ld a, TRUE
	ld [wOWPendingTileUpdate], a
	jp AdvanceOWFunc

.Func_b7160:
	ld a, $03
	ld hl, wSceneObj6State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b716b:
	ld a, 10
	jp WaitOWFunc

.Func_b7170:
	ld a, $01
	ld [wOWUIObj1YCoord], a
	ld a, $06
	ld hl, wSceneObj15State
	call SetSceneObjState
	ld a, $04
	ld hl, wSceneObj6State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b7188:
	ld a, [wOWFuncCounter]
	cp $0a
	ret c
	ld hl, wSceneObj6YCoord
	inc [hl]
	jp AdvanceOWFunc

.Func_b7195:
	ld a, [wOWFuncCounter]
	cp $20
	ret c
	ld hl, wSceneObj6YCoord
	inc [hl]
	jp AdvanceOWFunc

.Func_b71a2:
	ld a, [wOWFuncCounter]
	cp $1c
	ret c
	ld hl, wSceneObj6YCoord
	inc [hl]
	jp AdvanceOWFunc

.Func_b71af:
	ld a, [wOWFuncCounter]
	cp $18
	ret c
	ld hl, wSceneObj6YCoord
	inc [hl]
	jp AdvanceOWFunc

.Func_b71bc:
	ld a, [wOWFuncCounter]
	cp $14
	ret c
	ld hl, wSceneObj6YCoord
	inc [hl]
	jp AdvanceOWFunc

.Func_b71c9:
	ld a, $03
	ld [wOWUIObj1YCoord], a
	ld a, $07
	ld hl, wSceneObj15State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b71d9:
	ld a, $05
	ld hl, wSceneObj6State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b71e4:
	ld a, [wSceneObj6Frame]
	cp $09
	ret nz
	jp AdvanceOWFunc

.Func_b71ed:
	ld a, [wOWFuncCounter]
	cp $09
	ret c
	ld hl, Data_8563e
	call Func_b5868
	jp AdvanceOWFunc

Func_b71fc:
	call .Func_b7273
	ld hl, wOWUIObj1YCoord
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b721f
	dw .Func_b721e
	dw .Func_b7231
	dw .Func_b723f
	dw .Func_b7249
	dw .Func_b7245
	dw .Func_b7249
	dw .Func_b7257
	dw .Func_b725b
	dw .Func_b7265
	dw .Func_b7269

.Func_b721e:
	ret

.Func_b721f:
	ld a, $01
.asm_b7221
	ld [wOWUIObj1Frame], a
	xor a
	ld [wOWUIObj1Attributes], a
	ld hl, wOWUIObj1YCoord
	inc [hl]
	xor a
	ld [wOWUIObj1XCoord], a
	ret

.Func_b7231:
	ld a, [wOWUIObj1Frame]
	cp $01
	ret nz
	xor a
	ld [wOWUIObj1Frame], a
	ld [wOWUIObj1YCoord], a
	ret

.Func_b723f:
	ld a, [wOWUIObj1Frame]
	cp $01
	ret nz
.Func_b7245:
	ld a, $11
	jr .asm_b7221

.Func_b7249:
	ld a, [wOWUIObj1Frame]
	cp $11
	ret nz
	xor a
	ld [wOWUIObj1Frame], a
	ld [wOWUIObj1YCoord], a
	ret

.Func_b7257:
	ld a, $15
	jr .asm_b7221

.Func_b725b:
	ld a, [wOWUIObj1Frame]
	and a
	ret nz
	xor a
	ld [wOWUIObj1YCoord], a
	ret

.Func_b7265:
	ld a, $1e
	jr .asm_b7221

.Func_b7269:
	ld a, [wOWUIObj1Frame]
	and a
	ret nz
	xor a
	ld [wOWUIObj1YCoord], a
	ret

.Func_b7273:
	ld hl, wOWUIObj1Frame
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b72f8
	dw .Func_b72e0
	dw .Func_b730b
	dw .Func_b72e0
	dw .Func_b7300
	dw .Func_b72e0
	dw .Func_b730b
	dw .Func_b72e0
	dw .Func_b7300
	dw .Func_b72e0
	dw .Func_b730b
	dw .Func_b72e0
	dw .Func_b7300
	dw .Func_b72e0
	dw .Func_b730b
	dw .Func_b72e8
	dw .Func_b7311
	dw .Func_b72c8
	dw .Func_b7322
	dw .Func_b72d0
	dw .Func_b733b
	dw .Func_b72c8
	dw .Func_b7379
	dw .Func_b72c8
	dw .Func_b7387
	dw .Func_b72c8
	dw .Func_b7379
	dw .Func_b72c8
	dw .Func_b734c
	dw .Func_b7363
	dw .Func_b72c8
	dw .Func_b7334
	dw .Func_b72c8
	dw .Func_b735c
	dw .Func_b72c8
	dw .Func_b7334
	dw .Func_b72c8
	dw .Func_b7371

.Func_b72c8:
	ld a, [wOWUIObj1Attributes]
	cp $03
	ret c
	jr .asm_b7304
.Func_b72d0:
	ld a, [wOWUIObj1Attributes]
	cp $03
	ret c
	ld a, [wOWUIObj1Frame]
	sub $04
	ld [wOWUIObj1Frame], a
	jr .asm_b7304
.Func_b72e0:
	ld a, [wOWUIObj1Attributes]
	cp $01
	ret c
	jr .asm_b7304
.Func_b72e8:
	ld a, [wOWUIObj1Attributes]
	cp $01
	ret c
	ld a, [wOWUIObj1Frame]
	sub $10
	ld [wOWUIObj1Frame], a
	jr .asm_b7304
.Func_b72f8:
	play_sfx SFX_01F
.Func_b7300
	ld hl, wSCY
	dec [hl]
.asm_b7304
	xor a
	ld hl, wOWUIObj1Attributes
	ld [hld], a
	inc [hl]
	ret

.Func_b730b:
	ld hl, wSCY
	inc [hl]
	jr .asm_b7304

.Func_b7311:
	ld hl, wSCY
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	play_sfx SFX_01F
	jr .asm_b7304

.Func_b7322:
	ld hl, wSCY
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_b7304

.Func_b732b:
	ld hl, wSCX
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	jr .asm_b7304

.Func_b7334:
	ld hl, wSCX
	dec [hl]
	dec [hl]
	jr .asm_b7304

.Func_b733b:
	play_sfx SFX_063
.Func_b7343:
	ld hl, wSCX
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_b7304

.Func_b734c:
	call .Func_b7343
	xor a
	ld [wOWUIObj1Frame], a
	ret

; unreachable
	ld hl, wSCX
	inc [hl]
	inc [hl]
	inc [hl]
	jr .asm_b7304

.Func_b735c:
	ld hl, wSCX
	inc [hl]
	inc [hl]
	jr .asm_b7304

.Func_b7363:
	play_sfx SFX_063
.asm_b736b
	ld hl, wSCX
	inc [hl]
	jr .asm_b7304

.Func_b7371:
	call .asm_b736b
	xor a
	ld [wOWUIObj1Frame], a
	ret

.Func_b7379:
	ld hl, wSCX
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	jp .asm_b7304

.Func_b7387:
	ld hl, wSCX
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	jp .asm_b7304

EOWFunc_FormCastle:
	call .Func_b74cb

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b73c4
	dw .Func_b73ce
	dw .Func_b73e1
	dw .Func_b73e6
	dw .Func_b73ee
	dw .Func_b742b
	dw .Func_b7430
	dw .Func_b743b
	dw .Func_b744a
	dw .Func_b7459
	dw .Func_b7468
	dw .Func_b7477
	dw .Func_b7486
	dw .Func_b7495
	dw .Func_b74a0
	dw .Func_b74a5
	dw .Func_b74b0
	dw .Func_b73c9
	dw EndOWFunc

.Func_b73c4:
	ld a, 60
	jp WaitOWFunc

.Func_b73c9:
	ld a, 40
	jp WaitOWFunc

.Func_b73ce:
	ld a, $10
	ld hl, wSceneObj1State
	call SetSceneObjState
	play_sfx SFX_12E
	jp AdvanceOWFunc

.Func_b73e1:
	ld a, 40
	jp WaitOWFunc

.Func_b73e6:
	ld a, $01
	ld [w2d121], a
	jp AdvanceOWFunc

.Func_b73ee:
	call .Func_b741b
	ld a, [wSceneObj1Unk7]
	cp $30
	jr z, .asm_b7404
	cp $50
	jr z, .asm_b7410
	and a
	ret nz
	call .asm_b7410
	jp AdvanceOWFunc
.asm_b7404
	ld a, [wOWFuncCounter]
	and $03
	ret z
	ld a, $01
	ld [wOWUIObj2YCoord], a
	ret

.asm_b7410
	ld a, [wOWFuncCounter]
	and $03
	ret z
	ld hl, wOWUIObj2Frame
	inc [hl]
	ret

.Func_b741b:
	ld a, [wOWFuncCounter]
	and $03
	ret z
	ld de, Data_b64cd
	ld hl, wSceneObj1YCoord
	call ApplyOWMovement
	ret

.Func_b742b:
	ld a, 20
	jp WaitOWFunc

.Func_b7430:
	ld a, $11
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b743b:
	ld a, [wOWFuncCounter]
	cp $28
	ret c
	ld hl, Data_85b3d
	call Func_b5868
	jp AdvanceOWFunc

.Func_b744a:
	ld a, [wOWFuncCounter]
	cp $05
	ret c
	ld hl, Data_85b2c
	call Func_b5868
	jp AdvanceOWFunc

.Func_b7459:
	ld a, [wOWFuncCounter]
	cp $05
	ret c
	ld hl, Data_85b1b
	call Func_b5868
	jp AdvanceOWFunc

.Func_b7468:
	ld a, [wOWFuncCounter]
	cp $05
	ret c
	ld hl, Data_85b0a
	call Func_b5868
	jp AdvanceOWFunc

.Func_b7477:
	ld a, [wOWFuncCounter]
	cp $05
	ret c
	ld hl, Data_85afd
	call Func_b5868
	jp AdvanceOWFunc

.Func_b7486:
	ld a, [wOWFuncCounter]
	cp $05
	ret c
	ld hl, Data_85af4
	call Func_b5868
	jp AdvanceOWFunc

.Func_b7495:
	ld a, $12
	ld hl, wSceneObj7State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b74a0:
	ld a, 10
	jp WaitOWFunc

.Func_b74a5:
	ld a, $00
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b74b0:
	ld a, [wOWFuncCounter]
	cp $0a
	jr z, .asm_b74c6
	cp $14
	jr z, .asm_b74c6
	cp $21
	ret nz
	ld a, $04
	ld [wOWUIObj2YCoord], a
	jp AdvanceOWFunc
.asm_b74c6
	ld hl, wOWUIObj2Frame
	dec [hl]
	ret

.Func_b74cb:
	ld hl, wOWUIObj2YCoord
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jr z, .asm_b74df
	dec a
	jr z, .asm_b7511
	dec a
	jr z, .asm_b7522
	dec a
	jr z, .asm_b7539
	ret
.asm_b74df
	ld hl, wPalConfig1Index
	ld a, BCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 6
	ld [hli], a
	ld a, HIGH(wTempBGPals)
	ld [hli], a
	ld a, LOW(wTempBGPals)
	ld [hli], a

	ld hl, wPalConfig2Index
	ld a, BCPSF_AUTOINC | palette 0
	ld [hli], a
	ld a, 6
	ld [hli], a
	ld a, HIGH(wTempPals1)
	ld [hli], a
	ld a, LOW(wTempPals1)
	ld [hli], a

	ld hl, Pals_84840
	ld de, wTempBGPals
	ld c, 6 palettes
	ld b, BANK(Pals_84840)
	call CopyFarBytes

.asm_b750a
	xor a
	ld hl, wSceneWarioOAMPtr
	ld [hld], a
	inc [hl]
	ret

.asm_b7511
	call .Func_b7544
	ld b, [hl]
	ld a, [wSceneWarioOAMPtr]
	cp b
	ret c
	ld hl, wPalConfig1
	ld a, LOW(rBCPS)
	ld [hli], a
	jr .asm_b750a
.asm_b7522
	call .Func_b7544
	inc hl
	ld b, [hl]
	ld a, [wSceneWarioOAMPtr]
	cp b
	ret c
	ld hl, wPalConfig2
	ld a, LOW(rBCPS)
	ld [hli], a
	xor a
	ld hl, wSceneWarioOAMPtr
	ld [hld], a
	dec [hl]
	ret

.asm_b7539
	ld hl, wPalConfig2
	ld a, LOW(rBCPS)
	ld [hli], a
	xor a
	ld [wOWUIObj2YCoord], a
	ret

.Func_b7544:
	ld a, [wOWUIObj2Frame]
	add a
	ld e, a
	ld d, $00
	ld hl, .data
	add hl, de
	ret

.data
	db $05, $02
	db $03, $02
	db $02, $01
	db $fa, $49
	db $d1, $fe
	db $03, $d8
	db $21, $d0
	db $d0, $3e
	db $68, $22
	db $18, $a6
	db $fa, $49
	db $d1, $fe
	db $02, $d8
	db $21, $d0
	db $d0, $3e
	db $68, $22
	db $18, $98
	db $fa, $49
	db $d1, $fe
	db $01, $d8
	db $21, $d6
	db $d0, $3e
	db $68, $22
	db $18, $b2

EOWFunc_VulcanoEruption:
	call .Func_b774c
	call Func_b71fc
	call .Func_b762d
	call .Func_b766c
	call .Func_b76a9
	call .Func_b76e6
	call .Func_b7719
	call Func_b6055

	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b75b6
	dw .Func_b75c3
	dw .Func_b75d0
	dw .Func_b75d8
	dw .Func_b75dd
	dw .Func_b75ed
	dw .Func_b75fb
	dw .Func_b7609
	dw .Func_b7617
	dw .Func_b7625
	dw .Func_b75be
	dw EndOWFunc

.Func_b75b6:
	ld a, $01
	ld [wOWUIObj2Attributes], a
	jp AdvanceOWFunc

.Func_b75be:
	ld a, 180
	jp WaitOWFunc

.Func_b75c3:
	ld a, $0a
	ld [wOWUIObj1YCoord], a
	ld a, $01
	ld [wOWUIObj1State], a
	jp AdvanceOWFunc

.Func_b75d0:
	ld a, [wOWUIObj1YCoord]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b75d8:
	ld a, 56
	jp WaitOWFunc

.Func_b75dd:
	play_sfx SFX_127
	ld a, $01
	ld [w2d134], a
	jp AdvanceOWFunc

.Func_b75ed:
	ld a, [wOWFuncCounter]
	cp $08
	ret c
	ld a, $01
	ld [w2d13a], a
	jp AdvanceOWFunc

.Func_b75fb:
	ld a, [wOWFuncCounter]
	cp $3c
	ret c
	ld a, $01
	ld [w2d13c], a
	jp AdvanceOWFunc

.Func_b7609:
	ld a, [wOWFuncCounter]
	cp $08
	ret c
	ld a, $01
	ld [w2d138], a
	jp AdvanceOWFunc

.Func_b7617:
	ld a, [wOWFuncCounter]
	cp $08
	ret c
	ld a, $01
	ld [w2d13e], a
	jp AdvanceOWFunc

.Func_b7625:
	ld a, [w2d13e]
	and a
	ret nz
	jp AdvanceOWFunc

.Func_b762d:
	ld hl, w2d134
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b763e
	dw .Func_b764e
	dw .Func_b7656
	dw .Func_b765f

.Func_b763e:
	ld a, $0a
	ld hl, wSceneObj10State
	call SetSceneObjState
.asm_b7646
	ld hl, w2d134
.asm_b7649
	inc [hl]
	inc l
	xor a
	ld [hl], a
	ret

.Func_b764e:
	ld a, [wSceneObj10State]
	cp $0b
	ret nz
	jr .asm_b7646

.Func_b7656:
	ld a, $5a
	ld hl, w2d135
	cp [hl]
	ret nc
	jr .asm_b7646

.Func_b765f:
	ld a, $00
	ld hl, wSceneObj10State
	call SetSceneObjState
	xor a
	ld [w2d134], a
	ret

.Func_b766c:
	ld hl, w2d138
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b767d
	dw .Func_b768b
	dw .Func_b7693
	dw .Func_b769c

.Func_b767d:
	ld a, $0d
	ld hl, wSceneObj12State
	call SetSceneObjState
.asm_b7685
	ld hl, w2d138
	jp .asm_b7649

.Func_b768b:
	ld a, [wSceneObj12State]
	cp $0e
	ret nz
	jr .asm_b7685

.Func_b7693:
	ld a, $5a
	ld hl, w2d139
	cp [hl]
	ret nc
	jr .asm_b7685

.Func_b769c:
	ld a, $00
	ld hl, wSceneObj12State
	call SetSceneObjState
	xor a
	ld [w2d138], a
	ret

.Func_b76a9:
	ld hl, w2d13a
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b76ba
	dw .Func_b76c8
	dw .Func_b76d0
	dw .Func_b76d9

.Func_b76ba:
	ld a, $0d
	ld hl, wSceneObj13State
	call SetSceneObjState
.asm_b76c2
	ld hl, w2d13a
	jp .asm_b7649

.Func_b76c8:
	ld a, [wSceneObj13State]
	cp $0e
	ret nz
	jr .asm_b76c2

.Func_b76d0:
	ld a, $5a
	ld hl, w2d13b
	cp [hl]
	ret nc
	jr .asm_b76c2

.Func_b76d9:
	ld a, $00
	ld hl, wSceneObj13State
	call SetSceneObjState
	xor a
	ld [w2d13a], a
	ret

.Func_b76e6:
	ld hl, w2d13c
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b76f5
	dw .Func_b7703
	dw .Func_b770c

.Func_b76f5:
	ld a, $0e
	ld hl, wSceneObj14State
	call SetSceneObjState
.asm_b76fd
	ld hl, w2d13c
	jp .asm_b7649

.Func_b7703:
	ld a, $5a
	ld hl, w2d13d
	cp [hl]
	ret nc
	jr .asm_b76fd

.Func_b770c:
	ld a, $00
	ld hl, wSceneObj14State
	call SetSceneObjState
	xor a
	ld [w2d13c], a
	ret

.Func_b7719:
	ld hl, w2d13e
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b7728
	dw .Func_b7736
	dw .Func_b773f

.Func_b7728:
	ld a, $0e
	ld hl, wSceneObj15State
	call SetSceneObjState
.asm_b7730
	ld hl, w2d13e
	jp .asm_b7649

.Func_b7736:
	ld a, $5a
	ld hl, w2d13f
	cp [hl]
	ret nc
	jr .asm_b7730

.Func_b773f:
	ld a, $00
	ld hl, wSceneObj15State
	call SetSceneObjState
	xor a
	ld [w2d13e], a
	ret

.Func_b774c:
	call WOWFunc_VulcanoEruption.Func_b5f58
	call WOWFunc_VulcanoEruption.Func_b5fb9
	ld hl, wOWUIObj1State
	ld a, [hli]
	and a
	ret z
	inc [hl]
	dec a
	jumptable
	dw .Func_b7772
	dw .Func_b777f
	dw .Func_b778c
	dw .Func_b77a6

.Func_b7763:
	play_sfx SFX_TEMPLE_ROCK
	ld hl, wSceneWarioUnk7
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_b7772:
	ld a, [wSceneWarioUnk7]
	cp $50
	ret c
	ld a, $05
	ld [w2d122], a
	jr .Func_b7763

.Func_b777f:
	ld a, [wSceneWarioUnk7]
	cp $3c
	ret c
	ld a, $07
	ld [w2d126], a
	jr .Func_b7763

.Func_b778c:
	ld a, [wSceneWarioUnk7]
	cp $50
	ret c
	ld a, $07
	ld [w2d122], a
	jr .Func_b7763

; unreachable
	ld a, [wSceneWarioUnk7]
	cp $3c
	ret c
	ld a, $05
	ld [w2d126], a
	jr .Func_b7763
.Func_b77a6:
	xor a
	ld [wOWUIObj1State], a
	ret

EOWFunc_BurnVines:
	call .Func_b77ce
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b7803
	dw .Func_b780d
	dw .Func_b7818
	dw .Func_b781d
	dw .Func_b7828
	dw .Func_b782d
	dw .Func_b7838
	dw .Func_b783d
	dw .Func_b7847
	dw .Func_b784c
	dw .Func_b7857
	dw .Func_b7808
	dw EndOWFunc

.Func_b77ce:
	ld hl, w2d123
	inc [hl]
	ld a, [hl]
	cp $0f
	ret c
	xor a
	ld [hl], a
	ld a, [wSceneObj1State]
	cp $15
	jr z, .asm_b77fa
	cp $16
	jr z, .asm_b77f1
	cp $14
	jr z, .asm_b77e8
	ret
.asm_b77e8
	play_sfx SFX_01E
	ret
.asm_b77f1
	play_sfx SFX_125
	ret
.asm_b77fa
	play_sfx SFX_126
	ret

.Func_b7803:
	ld a, 40
	jp WaitOWFunc

.Func_b7808:
	ld a, 30
	jp WaitOWFunc
.Func_b780d
	ld a, $15
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b7818:
	ld a, 60
	jp WaitOWFunc

.Func_b781d:
	ld a, $16
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b7828:
	ld a, 30
	jp WaitOWFunc

.Func_b782d:
	ld a, $14
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b7838:
	ld a, 90
	jp WaitOWFunc

.Func_b783d:
	ld a, $00
	ld hl, wSceneObj9State
	call SetSceneObjState
	jr .Func_b780d

.Func_b7847:
	ld a, 40
	jp WaitOWFunc

.Func_b784c:
	ld a, $18
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b7857:
	ld hl, wSceneObj1State
	jp WaitOWObjDisappear

EOWFunc_ShowWarpedVoid:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b786d
	dw .Func_b7877
	dw .Func_b788a
	dw .Func_b7872
	dw EndOWFunc

.Func_b786d:
	ld a, 60
	jp WaitOWFunc

.Func_b7872:
	ld a, 160
	jp WaitOWFunc

.Func_b7877:
	ld a, $1b
	ld hl, wSceneObj5State
	call SetSceneObjState
	play_sfx SFX_128
	jp AdvanceOWFunc

.Func_b788a:
	ld hl, wSceneObj5State
	ld b, $19
	jp WaitOWObjState

EOWFunc_RaisePipe:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b78aa
	dw LoadOWSceneLevelName
	dw WaitOWSceneLevelNameFadeIn
	dw WaitOWScene16Frames
	dw .Func_b78b4
	dw .Func_b78c4
	dw .Func_b78d5
	dw .Func_b78af
	dw EndOWFunc

.Func_b78aa:
	ld a, 20
	jp WaitOWFunc

.Func_b78af:
	ld a, 60
	jp WaitOWFunc

.Func_b78b4:
	ld a, $37
	ld [wSceneObj8], a
	ld a, $1d
	ld hl, wSceneObj8State
	call SetSceneObjState
	jp AdvanceOWFunc

.Func_b78c4:
	ld a, [wOWFuncCounter]
	cp $10
	ret c
	play_sfx SFX_FAT_WALK
	jp AdvanceOWFunc

.Func_b78d5:
	ld b, $1c
	ld hl, wSceneObj8State
	jp WaitOWObjState

EOWFunc_Daytime:
	ld a, [w2d062]
	jumptable
	dw AdvanceOWFunc
	dw .Func_b78eb
	dw .Func_b78f5
	dw .Func_b78f0
	dw EndOWFunc

.Func_b78eb:
	ld a, 60
	jp WaitOWFunc

.Func_b78f0:
	ld a, 60
	jp WaitOWFunc

.Func_b78f5:
	farcall Func_84b97
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	di
	farcall VBlank_OWScene
	ei
	jp AdvanceOWFunc

Func_b791d:
	ret

UpdateMapSideOWAnimations:
	ld a, [wCurMapSide]
	jumptable

	dw .North ; NORTH
	dw .West  ; WEST
	dw .South ; SOUTH
	dw .East  ; EAST

.North
	ld bc, wSceneObj2State
	call Func_b7984
	ld bc, wSceneObj3State
	call Func_b7984
	ld bc, wSceneObj6State
	call Func_b7984
	ld bc, wSceneObj7State
	call Func_b7984
	ld bc, wSceneObj14State
	call Func_b7984
	ld bc, wSceneObj15State
	jp Func_b7984

.West
	ld bc, wSceneObj1State
	call Func_b7a6d
	ld bc, wSceneObj7State
	call Func_b7a6d
	ld bc, wSceneObj8State
	call Func_b7a6d
	ld bc, wSceneObj5State
	jp Func_b7a6d

.South
	ld bc, wSceneObj7State
	call Func_b7c18
	ld bc, wSceneObj14State
	call Func_b7c18
	ld bc, wSceneObj15State
	jp Func_b7c18

.East
	ld bc, wSceneObj5State
	call Func_b7b61
	ld bc, wSceneObj7State
	jp Func_b7b61

Func_b7984:
	ld a, [bc]
	jumptable

	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw .Func_b79de
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw .Func_b7a32
	dw Func_b791d
	dw Func_b542e
	dw Func_b542e
	dw Func_b542e
	dw Func_b542e
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw Func_b791d
	dw .Func_b79fa
	dw .Func_b7a08
	dw .Func_b7a16
	dw .Func_b7a24
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

.Func_b79de:
	ld a, [wCurEvent]
	and a
	ret nz
	ld a, [wLevel2]
	cp $06
	ret nz
	ld a, $06
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_BLOCK_BREAK
	ret

.Func_b79fa:
	ld a, [w2d011]
	and a
	ret nz
	ld a, $17
	ld hl, wSceneObj15State
	call SetSceneObjState
	ret

.Func_b7a08:
	ld a, [w2d011]
	and a
	ret z
	ld a, $16
	ld hl, wSceneObj15State
	call SetSceneObjState
	ret

.Func_b7a16:
	ld a, [w2d011]
	and a
	ret nz
	ld a, $1b
	ld hl, wSceneObj14State
	call SetSceneObjState
	ret

.Func_b7a24:
	ld a, [w2d011]
	and a
	ret z
	ld a, $1a
	ld hl, wSceneObj14State
	call SetSceneObjState
	ret

.Func_b7a32:
	call .Func_b7a5a
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
	call .Func_b7a5a
	ld b, $1d
	jr nz, .asm_b7a52
	ld a, $01
	ld [w2d124], a
	ld b, $0d
.asm_b7a52
	ld a, b
	ld hl, wSceneObj2State
	call SetSceneObjState
	ret

.Func_b7a5a:
	ld a, [wCurEvent]
	and a
	ret nz
	ld a, [w2d124]
	and a
	ret nz
	ld a, [wMapSideLevelID]
	cp $02
	ret z
	cp $07
	ret

Func_b7a6d:
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

Func_b7ab7:
	ld a, [wCurEvent]
	cp $04
	ret z
	jp UpdateOWTornado

Func_b7ac0:
	ld a, [wCurEvent]
	and a
	ret nz
	ld hl, wSceneObj8Unk7
	ld a, [hl]
	and a
	jr nz, .asm_b7ad7
	ld a, [wSceneObj7State]
	and a
	ret nz
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	inc [hl]
.asm_b7ad7
	ld a, [w2d011]
	and a
	jr nz, .asm_b7af0
	ld a, [wOWPalTransitionState]
	cp $02
	ret nz
	ld a, $07
.asm_b7ae5
	ld hl, wSceneObj7State
	call SetSceneObjState
	xor a
	ld [wSceneObj8Unk7], a
	ret
.asm_b7af0
	ld a, $08
	ld [wSceneObj8State], a
	xor a
	ld [wSceneObj8Duration], a
	jr .asm_b7ae5

Func_b7afb:
	ld a, [wCurEvent]
	and a
	ret nz
	ld hl, wSceneObj8Unk7
	ld a, [hl]
	and a
	jr nz, .asm_b7b0d
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	inc [hl]
.asm_b7b0d
	ld a, [w2d011]
	and a
	jr z, .asm_b7b19
	ld a, [wOWPalTransitionState]
	cp $02
	ret nz
.asm_b7b19
	ld a, $06
	ld [wSceneObj8State], a
	xor a
	ld [wSceneObj8Duration], a
	ld [wSceneObj8Unk7], a
	ret

Func_b7b26:
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
	ld hl, wSceneObj5State
	call SetSceneObjState
	ret

Func_b7b4e:
	ld a, [wCurEvent]
	and a
	ret nz
	ld a, [w2d12a]
	and a
	ret nz
	ld a, [wMapSideLevelID]
	cp $01
	ret z
	cp $02
	ret

Func_b7b61:
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

Func_b7ba9:
	call Func_b7be9
	ret nz
	ld a, [w2d011]
	and a
	jr z, .asm_b7bc2
	ld a, [wOWPalTransitionState]
	cp $02
	ret nz
.asm_b7bb9
	ld a, $13
	ld hl, wSceneObj7State
	call SetSceneObjState
	ret
.asm_b7bc2
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	jr .asm_b7bb9

Func_b7bc9:
	call Func_b7be9
	ret nz
	ld a, [w2d011]
	and a
	jr nz, .asm_b7be2
	ld a, [wOWPalTransitionState]
	cp $02
	ret nz
.asm_b7bd9
	ld a, $12
	ld hl, wSceneObj7State
	call SetSceneObjState
	ret
.asm_b7be2
	ld a, [wOWPalTransitionState]
	and a
	ret nz
	jr .asm_b7bd9

Func_b7be9:
	ld a, [wOWSceneAction]
	cp UNLOCK_LEVEL
	jr z, .asm_b7bf9
	cp HIGHLIGHT_LEVEL
	jr z, .asm_b7bf9
	ld a, [wCurEvent]
	and a
	ret
.asm_b7bf9
	ld a, $00
	ld hl, wSceneObj7State
	call SetSceneObjState
	ld a, $01
	and a
	ret

Func_b7c05:
	ld a, [wCurEvent]
	and a
	ret nz
	ld hl, w2d12b
	inc [hl]
	ret nz
	ld a, $1a
	ld hl, wSceneObj5State
	call SetSceneObjState
	ret

Func_b7c18:
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

Func_b7c5c:
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
	ld hl, wSceneObj7State
	call SetSceneObjState
	ret

Func_b7c84:
	ld a, [wCurEvent]
	and a
	ret nz
	ld a, [w2d12e]
	and a
	ret nz
	ld a, [wMapSideLevelID]
	cp $00
	ret z
	cp $01
	ret

Func_b7c97:
	ld a, [w2d011]
	and a
	ret nz
	ld a, $1f
	ld hl, wSceneObj15State
	call SetSceneObjState
	ret

Func_b7ca5:
	ld a, [w2d011]
	and a
	ret z
	ld a, $1e
	ld hl, wSceneObj15State
	call SetSceneObjState
	ret

Func_b7cb3:
	ld a, [wCurEvent]
	and a
	ret nz
	ld a, [w2d07c]
	and a
	jr z, .asm_b7ce7
	jr .asm_b7cc0 ; unnecessary jump
.asm_b7cc0
	ld a, [wSceneObj14XCoord]
	cp $80
	ret z
	ld a, [w2d07d]
	and a
	call z, .Func_b7cda
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wSceneObj14YCoord
	dec [hl]
	inc l
	inc [hl]
	ret

.Func_b7cda
	ld hl, w2d07d
	inc [hl]
	ld hl, wSceneObj14YCoord
	ld [hl], $25
	inc l
	ld [hl], $70
	ret

.asm_b7ce7
	ld a, [wSceneObj14XCoord]
	cp $70
	ret z
	ld a, [w2d07d]
	and a
	call z, .Func_b7d0d
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wSceneObj14YCoord
	dec [hl]
	inc l
	inc [hl]
	ld a, [hl]
	cp $88
	ret nz
	ld hl, wSceneObj14YCoord
	ld [hl], $25
	inc l
	ld [hl], $70
	ret

.Func_b7d0d
	ld hl, w2d07d
	inc [hl]
	ret
