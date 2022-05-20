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
	dw Data_8013e ; MAP_NORTH
	dw Data_8017e ; MAP_WEST
	dw Data_801be ; MAP_SOUTH
	dw Data_801fe ; MAP_EAST
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

Data_8023e: ; 8023e (20:423e)
	dw .North ; MAP_NORTH
	dw .West ; MAP_WEST
	dw .South ; MAP_SOUTH
	dw .East ; MAP_EAST

.North
; OWNORTH_THE_TEMPLE
	db $80 ; right
	db OWNORTH_OUT_OF_THE_WOODS ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OWNORTH_OUT_OF_THE_WOODS
	db OWNORTH_THE_TEMPLE ; right
	db $80 ; left
	db $80 ; up
	db OWNORTH_JUNCTION ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $01 ; down

; OWNORTH_THE_PEACEFUL_VILLAGE
	db $80 ; right
	db OW_EXIT_LEFT ; left
	db OWNORTH_JUNCTION ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $01 ; up
	db $00 ; down

; OWNORTH_THE_VAST_PLAIN
	db OW_EXIT_RIGHT ; right
	db OWNORTH_JUNCTION ; left
	db $80 ; up
	db OWNORTH_BANK_OF_THE_WILD_RIVER ; down

	db $04 ; right
	db $01 ; left
	db $00 ; up
	db $02 ; down

; OWNORTH_BANK_OF_THE_WILD_RIVER
	db OWNORTH_THE_VAST_PLAIN ; right
	db $80 ; left
	db $80 ; up
	db OWNORTH_THE_TIDAL_COAST ; down

	db $03 ; right
	db $00 ; left
	db $00 ; up
	db $02 ; down

; OWNORTH_THE_TIDAL_COAST
	db OWNORTH_SEA_TURTLE_ROCKS ; right
	db OWNORTH_BANK_OF_THE_WILD_RIVER ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OWNORTH_SEA_TURTLE_ROCKS
	db $80 ; right
	db OWNORTH_THE_TIDAL_COAST ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OWNORTH_JUNCTION
	db OWNORTH_THE_VAST_PLAIN ; right
	db $80 ; left
	db OWNORTH_OUT_OF_THE_WOODS ; up
	db OWNORTH_THE_PEACEFUL_VILLAGE ; down

	db $01 ; right
	db $00 ; left
	db $01 ; up
	db $01 ; down


.West
; OWWEST_DESERT_RUINS
	db $80 ; right
	db OW_EXIT_LEFT ; left
	db OWWEST_THE_VOLCANOS_BASE ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $02 ; up
	db $00 ; down

; OWWEST_THE_VOLCANOS_BASE
	db $80 ; right
	db OWWEST_DESERT_RUINS ; left
	db OWWEST_THE_WEST_CRATER ; up
	db OWWEST_THE_POOL_OF_RAIN ; down

	db $00 ; right
	db $03 ; left
	db $02 ; up
	db $02 ; down

; OWWEST_THE_POOL_OF_RAIN
	db OWWEST_A_TOWN_IN_CHAOS ; right
	db OWWEST_THE_VOLCANOS_BASE ; left
	db $80 ; up
	db OWWEST_BENEATH_THE_WAVES ; down

	db $03 ; right
	db $03 ; left
	db $00 ; up
	db $01 ; down

; OWWEST_A_TOWN_IN_CHAOS
	db $80 ; right
	db $80 ; left
	db OW_EXIT_RIGHT ; up
	db OWWEST_THE_POOL_OF_RAIN ; down

	db $00 ; right
	db $00 ; left
	db $02 ; up
	db $02 ; down

; OWWEST_BENEATH_THE_WAVES
	db $80 ; right
	db $80 ; left
	db OWWEST_THE_POOL_OF_RAIN ; up
	db $80 ; down

	db $00 ; right
	db $00 ; left
	db $01 ; up
	db $00 ; down

; OWWEST_THE_WEST_CRATER
	db $80 ; right
	db OWWEST_THE_VOLCANOS_BASE ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down


.South
; OWSOUTH_THE_GRASSLANDS
	db OWSOUTH_THE_BIG_BRIDGE ; right
	db OW_EXIT_LEFT ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OWSOUTH_THE_BIG_BRIDGE
	db OWSOUTH_TOWER_OF_REVIVAL ; right
	db OWSOUTH_THE_GRASSLANDS ; left
	db OWSOUTH_CAVE_OF_FLAMES ; up
	db OWSOUTH_THE_STEEP_CANYON ; down

	db $01 ; right
	db $01 ; left
	db $02 ; up
	db $02 ; down

; OWSOUTH_TOWER_OF_REVIVAL
	db OW_EXIT_RIGHT ; right
	db OWSOUTH_THE_BIG_BRIDGE ; left
	db OWSOUTH_ABOVE_THE_CLOUDS ; up
	db $80 ; down

	db $01 ; right
	db $01 ; left
	db $02 ; up
	db $00 ; down

; OWSOUTH_THE_STEEP_CANYON
	db $80 ; right
	db OWSOUTH_THE_BIG_BRIDGE ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OWSOUTH_CAVE_OF_FLAMES
	db $80 ; right
	db OWSOUTH_THE_BIG_BRIDGE ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OWSOUTH_ABOVE_THE_CLOUDS
	db $80 ; right
	db OWSOUTH_TOWER_OF_REVIVAL ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down


.East
; OWEAST_THE_STAGNANT_SWAMP
	db $80 ; right
	db OW_EXIT_LEFT ; left
	db OWEAST_CASTLE_OF_ILLUSIONS ; up
	db OWEAST_THE_FRIGID_SEA ; down

	db $00 ; right
	db $01 ; left
	db $02 ; up
	db $02 ; down

; OWEAST_THE_FRIGID_SEA
	db $80 ; right
	db OWEAST_THE_STAGNANT_SWAMP ; left
	db OWEAST_THE_COLOSSAL_HOLE ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $01 ; up
	db $00 ; down

; OWEAST_CASTLE_OF_ILLUSIONS
	db $80 ; right
	db OWEAST_THE_STAGNANT_SWAMP ; left
	db OWEAST_THE_EAST_CRATER ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $01 ; up
	db $00 ; down

; OWEAST_THE_COLOSSAL_HOLE
	db $80 ; right
	db $80 ; left
	db OWEAST_FOREST_OF_FEAR ; up
	db OWEAST_THE_FRIGID_SEA ; down

	db $00 ; right
	db $00 ; left
	db $02 ; up
	db $01 ; down

; OWEAST_THE_WARPED_VOID
	db $80 ; right
	db $80 ; left
	db OWEAST_FOREST_OF_FEAR ; up
	db $80 ; down

	db $00 ; right
	db $00 ; left
	db $01 ; up
	db $00 ; down

; OWEAST_THE_EAST_CRATER
	db $80 ; right
	db $80 ; left
	db $80 ; up
	db OWEAST_CASTLE_OF_ILLUSIONS ; down

	db $00 ; right
	db $00 ; left
	db $00 ; up
	db $01 ; down

; OWEAST_FOREST_OF_FEAR
	db OW_EXIT_RIGHT ; right
	db OWEAST_THE_COLOSSAL_HOLE ; left
	db $80 ; up
	db OWEAST_THE_WARPED_VOID ; down

	db $01 ; right
	db $03 ; left
	db $00 ; up
	db $01 ; down
; 0x8031e

Data_8031e: ; 8031e (20:431e)
	dw .North ; MAP_NORTH
	dw .West ; MAP_WEST
	dw .South ; MAP_SOUTH
	dw .East ; MAP_EAST

.North
; OW_EXIT_RIGHT
	db $80 ; right
	db OWNORTH_THE_VAST_PLAIN ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $04 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWNORTH_THE_PEACEFUL_VILLAGE ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

.West
; OW_EXIT_RIGHT
	db $80 ; right
	db OWWEST_A_TOWN_IN_CHAOS ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $03 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWWEST_DESERT_RUINS ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

.South
; OW_EXIT_RIGHT
	db $80 ; right
	db OWSOUTH_TOWER_OF_REVIVAL ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWSOUTH_THE_GRASSLANDS ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down

.East
; OW_EXIT_RIGHT
	db $80 ; right
	db OWEAST_FOREST_OF_FEAR ; left
	db $80 ; up
	db $80 ; down

	db $00 ; right
	db $01 ; left
	db $00 ; up
	db $00 ; down

; OW_EXIT_LEFT
	db OWEAST_THE_STAGNANT_SWAMP ; right
	db $80 ; left
	db $80 ; up
	db $80 ; down

	db $01 ; right
	db $00 ; left
	db $00 ; up
	db $00 ; down
; 0x80366

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

Func_80377: ; 80377 (20:4377)
	ld a, [wCurMapSide]
	cp MAP_EAST
	jr nz, Func_8038a
	; east side
	ld a, [wGotSunMedallion]
	and a
	jr nz, Func_8038a
	ld hl, wca3b
	res 4, [hl]
	ret

; flips bit 4 of wca3b
Func_8038a: ; 8038a (20:438a)
	ld hl, wca3b
	ld a, $1 << 4
	xor [hl]
	ld [hl], a
	ret
; 0x80392

OverworldStateTable: ; 80392 (20:4392)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitOverworld
	dw SlowFadeFromWhite
	dw Func_804ec
	dw FastFadeToWhite

	dw Func_804f7           ; SST_OVERWORLD_05
	dw SlowFadeFromWhite
	dw Func_80540
	dw FadeBGToWhite_Normal

	dw Func_8055f           ; SST_OVERWORLD_09
	dw DarkenBGToPal_Normal
	dw Func_805d7

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_0C
	dw InitTreasureCollection
	dw DarkenBGToPal_Normal
	dw TreasureCollection
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
	ld a, [wTransitionParam]
	and a
	ret z
	ld a, [wTopBarState]
	and a
	ret nz
	ld a, [wMapSideLevelIndex]
	cp OW_EXIT_RIGHT
	ret nc
	jp Func_15dc
; 0x803f9

InitOverworld: ; 803f9 (20:43f9)
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	stop_music2

	ld a, [wTransitionParam]
	ld [wLastTransitionParam], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	ld a, [wLastTransitionParam]
	inc a
	jr nz, .skip_set_first_treasure_flag
	; TRANSITION_NEW_GAME
	ld hl, wTreasuresCollected
	set 0, [hl]
.skip_set_first_treasure_flag

	call GetCrayonFlags

	ld a, [wTopBarState]
	cp $4
	jr z, .skip_get_level_index
	ld a, [wOWLevel]
	cp LEVEL_GOLF_BUILDING
	jp nc, .GolfBuilding
	ld b, a
	call GetMapSideLevelIndex
	ld a, b
	ld [wNextMapSide], a
	ld a, d
	ld [wMapSideLevelIndex], a
.skip_get_level_index
	call Func_80b29

	ld a, [wLastTransitionParam]
	and a
	jr z, .asm_8048a ; == 0
	cp TRANSITION_RETURN_TO_MAP
	jr z, .asm_8048a
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .asm_804a9
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .asm_804a9
	cp TRANSITION_GAME_OVER
	jr z, .asm_804b5
	inc a
	jr nz, .asm_8045f

	; TRANSITION_NEW_GAME
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
	ld a, TRANSITION_RETURN_TO_MAP
	ld [w2d00d], a
	ld a, CUTSCENE_5A
	ld [w2d025], a
	jr .asm_80480

.asm_804b5
	call Func_803e6
	ret

.GolfBuilding
	xor a
	ld [wNextMapSide], a
	ld [wMapSideLevelIndex], a
	ld a, SST_OVERWORLD_20
	ld [wSubState], a
	call Func_803e6
	ret

.Func_804c9
	ld a, [wTopBarState]
	and a
	ret nz
	ld a, TRANSITION_RETURN_TO_MAP
	ld [w2d00d], a
	ret

.Func_804d4
	ld a, [wTopBarState]
	and a
	ret nz
	ld a, [w2d028]
	cp $04
	ret z
	ld a, [wLastTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	ret z
	cp TRANSITION_EPILOGUE_PERFECT
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
	call ClearVirtualOAM

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
	ld [wCurMapSide], a
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
	call AddCompassSprite
	call ClearUnusedVirtualOAM
	ret
; 0x8055f

Func_8055f: ; 8055f (20:455f)
	call DisableLCD
	call FillBGMap0_With7f

	stop_music2

	ld a, $02
	ldh [rSVBK], a
	call ClearVirtualOAM
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

	ld a, [wTransitionParam]
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
	ld a, [wNextMapSide]
	ld [wCurMapSide], a
	jumptable

	dw Func_805e1 ; MAP_NORTH
	dw Func_805fd ; MAP_WEST
	dw Func_8060f ; MAP_SOUTH
	dw Func_80621 ; MAP_EAST
; 0x805d7

Func_805d7: ; 805d7 (20:45d7)
	call Func_80e89
	call AddCompassSprite
	call ClearUnusedVirtualOAM
	ret
; 0x805e1

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
	ld [wGotSunMedallion], a
	ld a, [wGotSunMedallion] ; unnecessary
	and a
	jr nz, .got_medallion
	ld a, $01
	ld [w2d011], a
	ld hl, wca3b
	set 0, [hl]
	res 7, [hl]
.got_medallion
	ld a, [wTransitionParam]
	cp TREASURE_KEY_CARD_BLUE
	call z, .Func_80655
	call Func_80aa5
	call LoadOverworld6Gfx
	call LoadOverworldCommonGfx
	call LoadOverworldArrowsGfx
	call Func_80b1b
	jp Func_8065e

.Func_80655
	ld a, TREASURE_KEY_CARD_RED
	call IsTreasureCollected
	jp z, InitOverworld.Func_804c9
	ret
; 0x8065e

Func_8065e: ; 8065e (20:465e)
	ld a, [wGameModeFlags]
	ld c, a
	and ($1 << MODE_DAY_NIGHT_F)
	bit MODE_TIME_ATTACK_F, c
	jr z, .asm_80669
	xor a
.asm_80669
	ld [w2d01f], a
	call Func_80b54

	decompress BGMap_85b91, v0BGMap0 tile $3a
	decompress_vram1 BGMap_85bc4, v1BGMap0 tile $3a

	ld a, [wTopBarState]
	and a
	ld a, $ec
	jr nz, .asm_806b6
	ld a, $04
.asm_806b6
	ldh [rSCY], a
	ld [wSCY], a
	xor a
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ld [wVirtualOAMByteSize], a

	ld a, [wCurMapSide] ; a gets overwritten
	call Func_81dce
	call Func_812c0
	call Func_80bd9
	call WriteBGMapFromWRAM

	call Func_8212c
	ld a, [wMapSideLevelIndex]
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

	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_80753
	decompress BGMap_86868, v0BGMap1
	decompress_vram1 BGMap_868b2, v1BGMap1
	jr .asm_80790
.asm_80753
	decompress BGMap_868f5, v0BGMap1
	decompress_vram1 BGMap_86929, v1BGMap1
.asm_80790
	xor a
	ld [wWX], a
	ldh [rWX], a
	ld a, $90
	ld [wWY], a
	ldh [rWY], a
	xor a ; BOTBAR_CLOSED
	ld [wBottomBarAction], a

	ld a, TREASURE_MAGNIFYING_GLASS
	call IsTreasureCollected
	ld [wHasMagnifyingGlass], a

	; collection button is always selectable
	xor a
	ld hl, wTopBarSelectableButtons
	ld [hl], a
	set TOPBAR_COLLECTION_F, [hl]

	call SetDayNightSpellSelectable
	call SetCutsceneButtonSelectable
	call SetNextPrevMapButtonsSelectable
	call UpdateNextPrevMapButtonsSelectable

	ld hl, v0BGMap0 tile $3c
	ld de, wAttrmap tile $2a
	ld b, 4 tiles
	call CopyHLToDE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0 tile $3c
	ld de, wAttrmap tile $26
	ld b, 4 tiles
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld a, [wTopBarState]
	cp $04
	jr nz, .asm_80809
	call Func_822b4
	ld hl, wAttrmap tile $2a
	ld de, v0BGMap0 tile $3c
	ld b, 4 tiles
	call CopyHLToDE
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wAttrmap tile $26
	ld de, v1BGMap0 tile $3c
	ld b, 4 tiles
	call CopyHLToDE
	xor a
	ldh [rVBK], a

	ld a, [w2d02c]
	ld [wTransitionParam], a
	call PlayOverworldMusic

.asm_80809
	call LoadLevelNameIfValid
	ld a, [wMapSideLevelIndex]
	cp OW_EXIT_RIGHT
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
	call SetCompassSprite

	ld a, [wTopBarState]
	and a
	call z, DrawBottomBar

	xor a
	ld [w2d073], a
	ld [w2d055], a
	ld [w2d013], a

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
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

	ld a, [wCurMapSide] ; a gets overwritten
	call Func_81dce
	call WriteBGMapFromWRAM

	ld a, $04
	ldh [rSCY], a
	ld [wSCY], a
	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ld a, [w2d018]
	ld [w2d015], a
	ld a, [w2d019]
	ld [w2d017], a
	ld a, [w2d029]
	ld [w2d028], a
	ld a, [wCurMapSide]
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
	call SetCompassSprite
	xor a
	ld [w2d073], a
	ld [w2d055], a
	ld [w2d013], a

	ld a, [wCurMapSide]
	and a
	jr nz, .no_window_display
	ld a, [w2d025]
	cp CUTSCENE_2F
	jr nz, .no_window_display
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	jr .apply_lcd
.no_window_display
	ld a, LCDCF_ON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
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
	ld [wGotSunMedallion], a
	ld a, [wGotSunMedallion] ; unnecessary
	and a
	jr nz, .got_medallion
	ld a, $01
	ld [w2d011], a
.got_medallion
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
	ld bc, wAttrmap
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
	decompress_vram1 OverworldCommonGfx, v1Tiles0
	decompress_vram1 OverworldNumbersGfx, v1Tiles0 tile $60
	ret
; 0x809f6

LoadOverworld1Gfx: ; 809f6 (20:49f6)
	decompress Overworld1Gfx, v0Tiles0
	ret
; 0x80a12

LoadOverworld2Gfx: ; 80a12 (20:4a12)
	decompress Overworld2Gfx, v0Tiles0
	ret
; 0x80a2e

LoadOverworld5Gfx: ; 80a2e (20:4a2e)
	decompress Overworld5Gfx, v0Tiles0
	ret
; 0x80a4a

LoadOverworld6Gfx: ; 80a4a (20:4a4a)
	decompress Overworld6Gfx, v0Tiles0
	ret
; 0x80a66

LoadOverworldArrowsGfx: ; 80a66 (20:4a66)
	decompress OverworldArrowsGfx, v0Tiles1
	ret
; 0x80a82

LoadOverworldGlowGfx: ; 80a82 (20:4a82)
	decompress_vram1 OverworldGlowGfx, v1Tiles0 tile $20
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

; copies from wTilemap to v0BGMap0
; and from wAttrmap to v1BGMap0
WriteBGMapFromWRAM: ; 80b34 (20:4b34)
	ld hl, wTilemap
	ld de, v0BGMap0
	ld bc, $260
	call CopyHLToDE_BC
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wAttrmap
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

	ld a, [wCurMapSide]
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
	ld hl, wAttrmap tile $1c
	res 7, [hl]
	ld de, 30 tiles
	ld c, $04
.loop_outer
	ld hl, wAttrmap
	add hl, de
	ld b, $03
.loop_inner
	res 7, [hl]
	inc hl
	dec b
	jr nz, .loop_inner
	dec c
	ret z
	ld hl, BG_MAP_WIDTH
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
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rWY], a
	ld a, [wWX]
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

	ld hl, wPalConfig1
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
	ld a, [wHDMABank]
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
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [w2d060]
	and a
	jr z, .asm_80cff
	ld c, LOW(rHDMA1)
	ld a, HIGH(wTilemap)
	ld [$ff00+c], a
	inc c
	xor a ; LOW(wTilemap)
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
	ld a, HIGH(wAttrmap)
	ld [$ff00+c], a
	inc c
	xor a ; LOW(wAttrmap)
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
	ld a, [wHDMABank]
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

	ld b, BANK(ApplyPalConfig1)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [wPalConfig1]
	and a
	call nz, ApplyPalConfig1
	ld a, [wPalConfig2]
	and a
	call nz, ApplyPalConfig2
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

Func_80d7c: ; 80d7c (20:4d7c)
	call Func_80d92
	farcall Func_9ce28
	call ClearUnusedVirtualOAM
	ret
; 0x80d92

Func_80d92: ; 80d92 (20:4d92)
	ld a, [wTopBarState]
	and a
	ret z
	ld a, [w2d013]
	cp $01
	ret c
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	ret z
	pop hl
	ld hl, wSubState
	inc [hl]
	stop_sfx
	ret
; 0x80db1

	INCROM $80db1, $80dc0

InitTreasureCollection: ; 80dc0 (20:4dc0)
	farcall _InitTreasureCollection
	ret
; 0x80dd0

TreasureCollection: ; 80dd0 (20:4dd0)
	farcall _TreasureCollection
	ret
; 0x80de0

Func_80de0: ; 80de0 (20:4de0)
	xor a
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret z
	ld a, [wJoypadPressed]
	bit START_F, a
	ret z
	ld a, SST_OVERWORLD_16
	ld [wSubState], a
	ret
; 0x80df3

	INCROM $80df3, $80e89

Func_80e89: ; 80e89 (20:4e89)
	call ProcessDPadRepeat
	farcall Func_b791e
	farcall UpdateCommonOWAnimations
	call Func_82242
	ld a, [wTopBarState]
	and a
	jp nz, Func_81055

	call HandleBottomBar
	call DrawBottomBar

	farcall Func_852e5
	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable

	dw Func_80ee7
	dw Func_80f0d
	dw Func_80f3c
	dw Func_80fb8
	dw Func_80fd6
	dw Func_80ff7
	dw Func_810bb
	dw Func_8115c
	dw Func_811cf
	dw Func_81200
	dw Func_81346
; 0x80ee7

Func_80ee7: ; 80ee7 (20:4ee7)
	call Func_8212c
	call GetOWAllowedDPadInput
	ld a, [wMapSideLevelIndex]
	ld [w2d067], a
	ld [w2d068], a
	xor a
	ld [w2d0d5], a
	ld [w2d0e0], a
	ld [w2d055], a
	call Func_81055
	ld hl, w2d014
	xor a
	ld [hl], a
	ld hl, w2d013
	inc [hl]
	ret
; 0x80f0d

Func_80f0d: ; 80f0d (20:4f0d)
	ld a, [wca3b]
	bit 7, a
	jr nz, .asm_80f1f
	call PlayOverworldMusic
	call Func_81055
	ld hl, w2d013
	inc [hl]
	ret
.asm_80f1f
	farcall Func_84a40
	call Func_81055
	ld a, [w2d055]
	and a
	ret nz
	di
	call VBlank_80bf9
	ei
	ret
; 0x80f3c

Func_80f3c: ; 80f3c (20:4f3c)
	xor a
	ld [wMagnifyingGlassCounter], a
	call Func_8212c
	call GetOWAllowedDPadInput
	ld c, $00
	ld b, $00
	ld a, [wMapSideLevelIndex]
	set 5, c
	cp OW_EXIT_RIGHT
	jr z, .is_exit
	ld c, b
	set 4, c
	cp OW_EXIT_LEFT
	jr z, .is_exit
	call LoadOWLevelFromLevelIndex
	farcall Func_9aab5
	xor a
	ld [w2d014], a
	call .GetDirectionalInput
	ld b, a
	ld a, [wOWAllowedDPadInput]
	and b
	and a
	jr z, .asm_80f83
	ld hl, w2d013
	ld [hl], $05
	jp Func_81034
.asm_80f83
	call Func_81055
	xor a
	ld [w2d073], a
	ld [w2d10e], a
	ld hl, w2d013
	inc [hl]
	ret

.is_exit
	ld a, c
	ld [w2d073], a
	call Func_820e6
	call Func_81055
	xor a
	ld [w2d014], a
	ld a, $06
	ld [w2d013], a
	ret

.GetDirectionalInput
	ld a, [wJoypadDown]
	and D_PAD
	ld b, a
	rla
	jr c, .up_down ; down
	rla
	jr c, .up_down ; up
; right/left
	ld a, b
	ret
.up_down
	ld a, D_UP | D_DOWN
	and b
	ret
; 0x80fb8

Func_80fb8: ; 80fb8 (20:4fb8)
	call Func_81055
	ld a, [w2d0e0]
	and a
	ret nz
	call LoadLevelNameIfValid
	ld hl, w2d013
	inc [hl]
	ret
; 0x80fc8

LoadLevelNameIfValid: ; 80fc8 (20:4fc8)
	ld a, [wNextMapSide]
	ld b, a
	ld a, [wMapSideLevelIndex]
	ld d, a
	cp $08
	ret nc
	jp LoadLevelName
; 0x80fd6

Func_80fd6: ; 80fd6 (20:4fd6)
	call Func_81055
	ld a, [wMapSideLevelIndex]
	cp OW_EXIT_RIGHT
	jr nc, .asm_80ff2
	farcall Func_85271
	srl c
	ret c
.asm_80ff2
	ld hl, w2d013
	inc [hl]
	ret
; 0x80ff7

Func_80ff7: ; 80ff7 (20:4ff7)
	call Func_81240
	jr c, Func_81055
	ld a, [w2d055]
	and a
	jr nz, Func_81055
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr nz, .asm_81016
	ld a, [wJoypadPressed]
	bit SELECT_F, a
	jr z, .asm_81016
	ld hl, wTopBarState
	inc [hl]
	jr Func_81055

.asm_81016
	call Func_81477
	ld a, [w2d0e3]
	and a
	jr nz, Func_81055
	call Func_81077
	jr c, Func_81055
	call Func_80de0
	jr c, Func_81055
	call Func_810a9
	ld b, a
	ld a, [wOWAllowedDPadInput]
	and b
	and a
	jr z, Func_81055
;	fallthrough

Func_81034: ; 81034 (20:5034)
	ld [w2d073], a
	call Func_820e6
	ld a, [w2d068]
	ld [w2d067], a
	ld a, $03
	ld [w2d0e0], a
	xor a
	ld [w2d0d5], a
	call Func_81055
	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	ret
; 0x81055

Func_81055: ; 81055 (20:5055)
	farcall Func_b4a3d
	call Func_82041
	farcall Func_b4aa9
	ret
; 0x81077

Func_81077: ; 81077 (20:5077)
	ld hl, wMapSideLevelIndex
	ld a, [wNextMapSide]
	or [hl]
	ret nz
	; OW position is in The Temple
	ld a, [wJoypadPressed]
	bit D_UP_F, a
	ret z
	ld a, [w2d00e]
	cp $ed
	jr nz, .asm_81092
	ld a, [wGameModeFlags]
	bit MODE_DAY_NIGHT_F, a
	ret nz
.asm_81092
	call Func_3c76
	ld a, $04
	call Func_820af
	play_sfx SFX_113
	ld a, $0a
	ld [w2d013], a
	scf
	ret
; 0x810a9

Func_810a9: ; 810a9 (20:50a9)
	ld a, [wJoypadPressed]
	and D_PAD
	ld b, a
	rla
	jr c, .up_down
	rla
	jr c, .up_down
	ld a, b
	ret
.up_down
	ld a, D_UP | D_DOWN
	and b
	ret
; 0x810bb

Func_810bb: ; 810bb (20:50bb)
	ld a, [w2d06b]
	ld [w2d06d], a
	ld a, [w2d06c]
	ld [w2d06e], a
	ld a, [w2d068]
	call Func_810f0
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	add b
	ld [w2d06f], a
	ld a, [hli]
	add c
	ld [w2d070], a
	ld bc, w2d071
	call Func_810fc
	call Func_821a1
	call Func_81055
	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	ret
; 0x810f0

Func_810f0: ; 810f0 (20:50f0)
	add a ; *2
	ld c, a
	ld a, [wCurMapSide]
	ld hl, Data_80136
	call GetCthEntryFromAthTable
	ret
; 0x810fc

Func_810fc: ; 810fc (20:50fc)
	ld a, [bc]
	jumptable
	dw Func_81108
	dw Func_8110d
	dw Func_8111c
	dw Func_81126
	dw Func_81130
; 0x81108

Func_81108: ; 81108 (20:5108)
	inc c
	ld a, $ff
	ld [bc], a
	ret
; 0x8110d

Func_8110d: ; 8110d (20:510d)
	ld a, [w2d06f]
	ld [w2d06d], a
	ld a, [w2d070]
	ld [w2d06e], a
	xor a
	ld [bc], a
	ret
; 0x8111c

Func_8111c: ; 8111c (20:511c)
	ld a, [w2d06f]
	ld [w2d06d], a
	ld a, $01
	ld [bc], a
	ret
; 0x81126

Func_81126: ; 81126 (20:5126)
	ld a, [w2d070]
	ld [w2d06e], a
	ld a, $01
	ld [bc], a
	ret
; 0x81130

Func_81130: ; 81130 (20:5130)
	ld a, [w2d06c]
	ld e, a
	ld a, [w2d070]
	sub e
	sra a
	add e
	ld [w2d06e], a
	ld a, $02
	ld [bc], a
	ret
; 0x81142

Func_81142: ; 81142 (20:5142)
	ld hl, w2d0a0
	bit 0, [hl]
	jr nz, .asm_81151
	ld a, $40
	bit 1, [hl]
	jr z, .asm_81157
	jr .asm_81158
.asm_81151
	ld a, $10
	bit 2, [hl]
	jr z, .asm_81158
.asm_81157
	rlca
.asm_81158
	ld [w2d073], a
	ret
; 0x8115c

Func_8115c: ; 8115c (20:515c)
	call Func_82208
	ld hl, w2d10e
	bit 7, [hl]
	jr nz, .asm_81177

	ld a, [wJoypadDown]
	and D_PAD
	jr z, .asm_81175
	inc [hl]
	ld a, [hl]
	cp $06
	jr c, .asm_81175
	set 7, [hl]
.asm_81175
	bit 7, [hl]
.asm_81177
	call nz, Func_82208

	ld a, [w2d06b]
	ld [w2d100], a
	ld a, [w2d06c]
	ld [w2d101], a
	ld a, [w2d0a1]
	and a
	jr nz, .asm_8119c
	ld bc, w2d071
	call Func_810fc
	cp $ff
	jr z, .asm_811a0
	call Func_821a1
	call Func_81142
.asm_8119c
	call Func_81055
	ret

.asm_811a0
	ld a, [w2d068]
	ld [wMapSideLevelIndex], a
	cp OW_EXIT_RIGHT
	jr nc, .asm_811b1
	ld a, $02
	ld [w2d013], a
	jr .asm_8119c

.asm_811b1
	stop_music2
	play_sfx SFX_0EB

	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	jr .asm_8119c
; 0x811cf

Func_811cf: ; 811cf (20:51cf)
	ld a, [w2d014]
	cp $02
	jr c, .asm_811fc
	xor a
	ld [hl], a
	ld a, [wMapSideLevelIndex]
	ld b, $01
	ld c, $a8
	cp OW_EXIT_RIGHT
	jr z, .is_exit
	ld b, $ff
	ld c, $f0
	cp OW_EXIT_LEFT
	jr z, .is_exit
	debug_nop
.is_exit
	ld a, [w2d101]
	add b
	ld [w2d101], a
	cp c
	jr nz, .asm_811fc
	ld hl, w2d013
	inc [hl]
.asm_811fc
	call Func_81055
	ret
; 0x81200

Func_81200: ; 81200 (20:5200)
	call Func_81055
	ld a, [wMapSideLevelIndex]
	ld b, 1
	cp OW_EXIT_RIGHT
	jr z, .is_exit
	ld b, -1
	cp OW_EXIT_LEFT
	jr z, .is_exit
	debug_nop
.is_exit
	ld a, [wNextMapSide]
	add b
	and $3
	ld [wNextMapSide], a
	ld a, [wMapSideLevelIndex]
	add b
	ld [wMapSideLevelIndex], a
	ld [w2d068], a
	ld a, [wNextMapSide]
	bit 1, a
	jr nz, .asm_81234 ; south or east?
	add b
	bit 1, a
	jr nz, .asm_8123a
.asm_81234
	ld a, SST_OVERWORLD_08
	ld [wSubState], a
	ret
.asm_8123a
	ld a, SST_OVERWORLD_1E
	ld [wSubState], a
	ret
; 0x81240

Func_81240: ; 81240 (20:5240)
	ld a, [w2d055]
	and a
	jr nz, .no_carry
	ld a, [wOWLevel]
	cp $80
	jr z, .no_carry
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .no_carry
	call LoadOWLevelFromLevelIndex
	ld a, [wOWLevel]
	and a
	jr z, .temple
	xor a
	ld [wSubState], a
	ld hl, wState
	inc [hl] ; ST_LEVEL
	scf
	ret

.no_carry
	and a
	ret

.temple
	play_sfx SFX_0E3
	ld a, SST_OVERWORLD_1A
	ld [wSubState], a
	scf
	ret
; 0x81278

; input:
; - b = LEVEL_* constant
; output:
; - d = map side level index
; - c = map side
GetMapSideLevelIndex: ; 81278 (20:5278)
; loop until a larger value than b is found
	ld hl, MapSideInitialLevels
	ld c, -1
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

; converts the level index in wMapSideLevelIndex
; to a valid OW level value corresponding
; to the map side in wNextMapSide
LoadOWLevelFromLevelIndex: ; 8128a (20:528a)
	ld a, [wNextMapSide]
	ld c, a
	and a
	jr z, .north
.get_ow_level
	ld b, $00
	ld hl, MapSideInitialLevels
	add hl, bc
	ld a, [wMapSideLevelIndex]
	add [hl]
	ld [wOWLevel], a
	ret

.north
	ld a, [wMapSideLevelIndex]
	cp OWNORTH_JUNCTION
	jr c, .get_ow_level
	ld a, $80
	ld [wOWLevel], a
	ret
; 0x812ac

MapSideInitialLevels: ; 812ac (20:52ac)
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
	ld a, [wCurMapSide]
	ld c, a
	ld b, $00
	ld hl, MapSideInitialLevels
	add hl, bc
	ld a, [hl]
	ld [wOWLevel], a

	ld a, [wNextMapSide]
	ld b, $06
	dec a
	jr z, .asm_812ed ; west
	ld b, $06
	dec a
	jr z, .asm_812ed ; south
	ld b, $07
	dec a
	jr z, .asm_812ed ; east
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
	farcall GetOWLevelCollectedTreasures
	ld a, [wKeyAndTreasureFlags]
	and TREASURES_MASK
	xor TREASURES_MASK
	call nz, .Func_8132a ; at least 1 treasure missing
.asm_81314
	ld a, [wOWLevel]
	inc a
	ld [wOWLevel], a
	ld hl, w2dffe
	inc [hl]
	ld a, [hli]
	cp [hl] ; w2dfff
	jr nz, .asm_812fb
	ld a, [w2dffd]
	ld [wOWLevel], a
	ret

.Func_8132a
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

Func_81346: ; 81346 (20:5346)
	farcall Func_852e5
	call Func_8137a
	farcall Func_b4a3d
	call Func_8208d
	farcall Func_b4aa9
	ret
; 0x8137a

Func_8137a: ; 8137a (20:537a)
	ld hl, w2d0e5
	inc [hl]
	ld a, [w2d0e4]
	jumptable

	dw Func_81398
	dw Func_8139f
	dw Func_813ad
	dw Func_813b4
	dw Func_813ef
	dw Func_813f6
	dw Func_813ef
	dw Func_81413
	dw Func_8139f
	dw Func_813ad
	dw Func_8142d
; 0x81398

Func_81398: ; 81398 (20:5398)
	xor a
	ld hl, w2d0e5
	ld [hld], a
	inc [hl] ; w2d0e4
	ret
; 0x8139f

Func_8139f: ; 8139f (20:539f)
	ld hl, w2d0e5
	ld a, [hl]
	cp $08
	ret c
	ld a, $03
	ld [w2d0e0], a
	jr Func_81398
; 0x813ad

Func_813ad: ; 813ad (20:53ad)
	ld a, [w2d0e0]
	and a
	ret nz
	jr Func_81398
; 0x813b4

Func_813b4: ; 813b4 (20:53b4)
	call Func_813bc
	call LoadLevelName
	jr Func_81398
; 0x813bc

Func_813bc: ; 813bc (20:53bc)
	ld a, [w2d00e]
	cp $ed
	jr z, .asm_813d3
	ld b, a
	call GetCutsceneWithTreasure
	ld a, CUTSCENE_25
	cp c
	jr nc, .asm_813d8
	ld a, [wGameModeFlags]
	bit MODE_DAY_NIGHT_F, a
	jr nz, .asm_813d8
.asm_813d3
	ld b, $00
	ld d, $00
	ret
.asm_813d8
	ld a, [w2d00e]
	ld c, a
	farcall Func_9aa81
	call GetMapSideLevelIndex
	ret
; 0x813ef

Func_813ef: ; 813ef (20:53ef)
	xor a
	ld [w2d0d5], a
	jp Func_81398
; 0x813f6

Func_813f6: ; 813f6 (20:53f6)
	farcall Func_85271
	srl c
	ret c
	ld a, $1c
	ld hl, wSceneObj13State
	call SetSceneObjState
	jp Func_81398
; 0x81413

Func_81413: ; 81413 (20:5413)
	ld a, [wJoypadPressed]
	and B_BUTTON | D_RIGHT | D_LEFT | D_DOWN
	jr nz, .asm_81423
	ld hl, wSceneObj13State
	ld a, [hl]
	and a
	jp z, Func_81398
	ret
.asm_81423
	xor a
	ld hl, wSceneObj13State
	call SetSceneObjState
	jp Func_81398
; 0x8142d

Func_8142d: ; 8142d (20:542d)
	ld a, $01
	call Func_820af
	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld [w2d0e4], a
	ret
; 0x8143d

	INCROM $8143d, $81477

Func_81477: ; 81477 (20:5477)
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_8148e
	ld hl, w2d0e2
	inc [hl]

	ld a, [w2d0e3]
	jumptable
	dw Func_814b2
	dw Func_814c4
	dw Func_814ec
	dw Func_8150c

.asm_8148e
	ld a, [w2d0e3]
	and a
	ret z
	ld a, $01
	ld hl, w2d106
	cp [hl]
	call nz, Func_820af
	ld hl, w2d88e
	ld a, [hli] ; w2d88e
	ld [w2d06b], a
	ld [w2d100], a
	ld a, [hl] ; w2d88f
	ld [w2d06c], a
	ld [w2d101], a
	xor a
	ld [w2d0e3], a
	ret
; 0x814b2

Func_814b2: ; 814b2 (20:54b2)
	ld hl, w2d88e
	ld a, [w2d100]
	ld [hli], a ; w2d88e
	ld a, [w2d101]
	ld [hl], a ; w2d88f
;	fallthrough

Func_814bd: ; 814bd (20:54bd)
	xor a
	ld hl, w2d0e2
	ld [hli], a
	inc [hl] ; w2d0e3
	ret
; 0x814c4

Func_814c4: ; 814c4 (20:54c4)
	ld b, $0a
	ld a, [w2d0e2]
	cp b
	ret c
	play_sfx SFX_113
	ld a, [w2d069]
	ld [w2d06b], a
	ld [w2d100], a
	ld a, [w2d06a]
	ld [w2d06c], a
	ld [w2d101], a
	ld a, $05
	call Func_820af
	jr Func_814bd
; 0x814ec

Func_814ec: ; 814ec (20:54ec)
	xor a
	ld hl, w2d800
	ld bc, $8e
	call WriteAToHL_BCTimes
	ld hl, w2d140
	ld bc, $40
	call WriteAToHL_BCTimes
	call Func_82111
	ld a, l
	ld [w2d889 + 0], a
	ld a, h
	ld [w2d889 + 1], a
	jr Func_814bd
; 0x8150c

Func_8150c: ; 8150c (20:550c)
	ld a, $00
	call .Func_81576
	call .Func_81615
	call .Func_81595
	ld a, $01
	call .Func_81576
	call .Func_81615
	call .Func_81595
	ld a, $02
	call .Func_81576
	call .Func_81615
	call .Func_81595
	ld a, $03
	call .Func_81576
	call .Func_81615
	call .Func_81595

	ld a, [w2d0e2]
	cp $14
	call z, .Func_815c1
	ld a, [w2d0e2]
	cp $28
	call z, .Func_815e5
	ld a, [w2d0e2]
	cp $2c
	ld hl, w2d146
	call z, .Func_81609
	ld a, [w2d0e2]
	cp $40
	ld hl, w2d160 + $6
	call z, .Func_81609
	call Func_81714

	ld hl, w2d807
	ld c, $04
.loop
	ld a, [hl]
	cp $05
	ret nz
	ld de, $20
	add hl, de
	dec c
	jr nz, .loop

	ld hl, w2d0e3
	dec [hl]
	ret

.Func_81576
	ld [w2d88b], a
	call .Func_815b6
	ld de, w2d880
	ld b, $9
	call CopyHLToDE
	ld de, w2d0a0
	ld b, $07
	call CopyHLToDE
	ld de, w2d06b
	ld b, $08
	call CopyHLToDE
	ret

.Func_81595
	ld a, [w2d88b]
	call .Func_815b6
	ld e, l
	ld d, h
	ld hl, w2d880
	ld b, $9
	call CopyHLToDE
	ld hl, w2d0a0
	ld b, $07
	call CopyHLToDE
	ld hl, w2d06b
	ld b, $08
	call CopyHLToDE
	ret

.Func_815b6
	rlca
	swap a
	ld e, a
	ld d, $00
	ld hl, w2d800
	add hl, de
	ret

.Func_815c1
	ld hl, w2d800
	ld de, w2d140
	ld b, $08
	call CopyHLToDE
	ld hl, w2d810 + $10
	ld b, $08
	call CopyHLToDE
	ld hl, w2d810 + $30
	ld b, $08
	call CopyHLToDE
	ld hl, w2d810 + $50
	ld b, $08
	call CopyHLToDE
	ret

.Func_815e5
	ld hl, w2d800
	ld de, w2d160
	ld b, $08
	call CopyHLToDE
	ld hl, w2d810 + $10
	ld b, $08
	call CopyHLToDE
	ld hl, w2d810 + $30
	ld b, $08
	call CopyHLToDE
	ld hl, w2d810 + $50
	ld b, $08
	call CopyHLToDE
	ret

.Func_81609
	ld de, $8
	xor a
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	ret

.Func_81615
	ld a, [w2d880 + $7]
	jumptable
	dw $5625
	dw $567f
	dw $56b3
	dw $56be
	dw $56ea
	dw $56f5
; 0x81625

	INCROM $81625, $81714

Func_81714: ; 81714 (20:5714)
	INCROM $81714, $8178b

SetDayNightSpellSelectable: ; 8178b (20:578b)
	ld a, TREASURE_DAY_OR_NIGHT_SPELL
	call IsTreasureCollected
	ret z
	ld a, [wCurMapSide]
	cp MAP_EAST
	jr nz, .set_selectable
	ld a, [wGotSunMedallion]
	and a
	ret z
.set_selectable
	ld hl, wTopBarSelectableButtons
	set TOPBAR_DAY_NIGHT_F, [hl]
	ret
; 0x817a3

SetCutsceneButtonSelectable: ; 817a3 (20:57a3)
	ld a, [w2d00d]
	cp TRANSITION_RETURN_TO_MAP
	ret z
	and a
	ret z
	ld hl, wTopBarSelectableButtons
	set TOPBAR_CUTSCENE_F, [hl]
	ret
; 0x817b1

	INCROM $817b1, $817d7

SetNextPrevMapButtonsSelectable: ; 817d7 (20:57d7)
	call .CheckAccessibleMapSides
	call GetAccessibleMapFlags
	ld hl, wTopBarSelectableButtons
	or [hl]
	ld [hl], a
	ret

.CheckAccessibleMapSides
	; check west side accessible
	ld a, CUTSCENE_03
	call CheckAllCutsceneTreasures
	rlca
	rlca
	rlca
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a

	; check south side accessible
	ld a, CUTSCENE_07
	call CheckAllCutsceneTreasures
	rlca
	rlca
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a

	; check east side accessible
	ld a, CUTSCENE_0C
	call CheckAllCutsceneTreasures
	rlca
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a

	; check north side accessible
	ld a, CUTSCENE_37
	call CheckAllCutsceneTreasures
	ld hl, wAccessibleMapSides
	or [hl]
	ld [hl], a
	and $1
	swap a
	or [hl]
	ld [hl], a
	ret
; 0x81818

GetAccessibleMapFlags: ; 81818 (20:5818)
	ld a, [wAccessibleMapSides]
	ld b, a
	ld a, [wCurMapSide]
.loop
	sub 1
	jr c, .done
	sla b
	jr .loop
.done
	ld a, b
	and TOPBAR_NEXT_MAP | TOPBAR_PREV_MAP
	ret
; 0x8182b

UpdateNextPrevMapButtonsSelectable: ; 8182b (20:582b)
	ld a, [wTopBarState]
	and a
	ret z
	ld a, [wTopBarSelection]
	and TOPBAR_NEXT_MAP | TOPBAR_PREV_MAP
	ret z
	ld c, a
	call GetAccessibleMapFlags
	and c
	ret nz
	ld hl, wTopBarSelection
	bit TOPBAR_NEXT_MAP_F, [hl]
	jr nz, .set_prev
; set next
	res TOPBAR_PREV_MAP_F, [hl]
	set TOPBAR_NEXT_MAP_F, [hl]
	ret
.set_prev
	res TOPBAR_NEXT_MAP_F, [hl]
	set TOPBAR_PREV_MAP_F, [hl]
	ret
; 0x8184d

Func_8184d: ; 8184d (20:584d)
	ld a, [w2d00e]
	call IsTreasureCollected
	ld hl, w2d00e
	jr nz, .collected
	ld a, [wTransitionParam]
	and a
	ret z
	cp TRANSITION_RETURN_TO_MAP
	ret z
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	ret z
	cp TRANSITION_EPILOGUE_PERFECT
	ret z
	cp TRANSITION_GAME_OVER
	ret z
	inc a
	jr z, .asm_8186d ; == TRANSITION_NEW_GAME
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
	ld a, [wTopBarState]
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
	dw Func_818e7
	dw Func_818f6
	dw Func_81900
; 0x818e7

Func_818e7: ; 818e7 (20:58e7)
	ld a, [w2d014]
	cp $04
	ret c

Func_818ed: ; 818ed (20:58ed)
	xor a
	ld [w2d014], a
	ld hl, w2d013
	inc [hl]
	ret
; 0x818f6

Func_818f6: ; 818f6 (20:58f6)
	call Func_8195d
	ld a, [w2d017]
	and a
	ret nz
	jr Func_818ed
; 0x81900

Func_81900: ; 81900 (20:5900)
	ld a, [w2d014]
	cp $04
	ret c
	ld hl, w2d026
	call GetByteFromPointerInHL
	call Func_81b13
	jr z, Func_81931
	ld a, [wCurMapSide]
	ld b, a
	ld a, [w2d016]
	cp b
	jr nz, .asm_81923
	xor a
	ld [w2d014], a
	ld [w2d013], a
	ret
.asm_81923
	stop_sfx
	ld a, $04
	ld [wSubState], a
	ret
; 0x81931

Func_81931: ; 81931 (20:5931)
	stop_sfx
	ld a, [w2d025]
	ld b, a
	xor a
	ld [wLastTransitionParam], a
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

Func_8195d: ; 8195d (20:595d)
	ld a, [w2d028]
	jumptable
	dw Func_8196b
	dw Func_829e2
	dw Func_8196e
	dw Func_82c33
	dw Func_8196e
; 0x8196b

Func_8196b: ; 8196b (20:596b)
	debug_nop
; 0x8196e

Func_8196e: ; 8196e (20:596e)
	farcall Func_b514a
	ret
; 0x8197e

Func_8197e: ; 8197e (20:597e)
	ld a, [wLastTransitionParam]
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
	call CheckAllCutsceneTreasures
	jr z, .asm_819a7
	ret ; collected all treasures

.asm_819a7
	xor a ; CUTSCENE_00
	ld [w2d025], a
	ret
; 0x819ac

; input:
; - a = CUTSCENE_* constant
CheckAllCutsceneTreasures: ; 819ac (20:59ac)
	call LoadCutsceneTreasures
	ld c, TRUE
	ld a, [w2dffd]
	call CheckCutsceneTreasure
	ret c
	ld a, [w2dffe]
	call CheckCutsceneTreasure
	ret c
	ld a, [w2dfff]
	call CheckCutsceneTreasure
	ret
; 0x819c6

; input:
; - a = CUTSCENE_* constant
Func_819c6: ; 819c6 (20:59c6)
	call CheckAllCutsceneTreasures
	and c
	ret
; 0x819cb

; returns carry if treasure in a
; is different from wLastTransitionParam
; and has not been collected
CheckCutsceneTreasure: ; 819cb (20:59cb)
	cp TREASURE_INVALID
	jr z, .no_carry
	ld hl, wLastTransitionParam
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
	ld a, [wLastTransitionParam]
	ld c, a
	dec c
	and a
	jr z, .asm_81de1
	cp TRANSITION_NEW_GAME
	jr nz, .asm_81de5
	ld c, $00
.asm_81de1
	ld a, c
	ld [wLastTransitionParam], a

.asm_81de5
	xor a
	ld [w2d078], a
	ld a, [wCutscene]
	call CheckAllCutsceneTreasures
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
	ld a, [wLastTransitionParam]
	inc a
	ret nz
	; TRANSITION_NEW_GAME
	ld [wLastTransitionParam], a ; = 0
	ret
; 0x81e16

Func_81e16: ; 81e16 (20:5e16)
	ld a, [wCutscene]
	call Func_81b0d
	ret z
.loop
	ld a, [w2d016]
	ld b, a
	ld a, [wCurMapSide]
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
	debug_nop
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
	ld [w2d082 + 0], a
	ld [w2d082 + 1], a
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
	ld a, [w2d082 + 0]
	ld [w2d086 + 0], a
	ld a, [w2d082 + 1]
	ld [w2d086 + 1], a
	ld hl, w2d06b
	call Func_3ad7
	ret
; 0x81feb

Func_81feb: ; 81feb (20:5feb)
	ld a, [w2d07f]
	and a
	ret z
	ld a, [w2d082 + 1]
	ld h, a
	ld a, [w2d082 + 0]
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
	debug_nop
; 0x8200f

Func_8200f: ; 8200f (20:600f)
	ld c, $07
	ret
; 0x82012

SetCompassSprite: ; 82012 (20:6012)
	ld a, [wCurMapSide]
	ld c, a
	ld hl, .coords
	ld de, wCompassSprite
	ld b, 2
	call CopyHLToDE
	ld a, c
	ld [de], a
	ret

.coords
	; y, x
	db $14, $14
; 0x82026

	INCROM $82026, $8202c

AddCompassSprite: ; 8202c (20:602c)
	ld hl, wCompassSprite
	ld de, OAM_aa580
	ld b, BANK(OAM_aa580)
	call AddOWSpriteWithScroll
	ret
; 0x82038

PlaySFX12A: ; 82038 (20:6038)
	play_sfx SFX_12A
	ret
; 0x82041

Func_82041: ; 82041 (20:6041)
	ld a, [wMapSideLevelIndex]
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
	jr z, Func_8208d
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
;	fallthrough
Func_8208d: ; 8208d (20:608d)
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
	ld bc, OAM_aa329
	cp $05
	jr c, .got_oam
	ld bc, OAM_aa0cf
.got_oam
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

Func_820e6: ; 820e6 (20:60e6)
	call Func_82111
	ld a, [w2d073]
	swap a
	rrca
	jr c, .asm_82100
	inc hl
	rrca
	jr c, .asm_82100
	inc hl
	rrca
	jr c, .asm_82100
	inc hl
	rrca
	jr c, .asm_82100
	debug_nop
.asm_82100
	ld a, [hl]
	ld [w2d068], a
	ld de, $4
	add hl, de
	ld a, [hl]
	ld [w2d071], a
	xor a
	ld [w2d072], a
	ret
; 0x82111

Func_82111: ; 82111 (20:6111)
	ld a, [wMapSideLevelIndex]
	cp OW_EXIT_RIGHT
	jr c, .asm_8211f
	sub OW_EXIT_RIGHT
	ld hl, Data_8031e
	jr .got_table
.asm_8211f
	ld hl, Data_8023e
.got_table
	add a
	add a ; *4
	ld c, a
	ld a, [wNextMapSide]
	call GetCthEntryFromAthTable
	ret
; 0x8212c

Func_8212c: ; 8212c (20:612c)
	ld a, [wMapSideLevelIndex]
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

; writes to wOWAllowedDPadInput the allowed
; d-pad inputs in the current OW position
GetOWAllowedDPadInput: ; 82150 (20:6150)
	ld a, [wMapSideLevelIndex]
	cp $07
	jr z, .asm_8219b
	ld hl, w2d069
	call Func_3ad7
	ld c, $00
	inc hl
	ld b, D_RIGHT
	call .CheckAllowedDirection
	dec hl
	dec hl
	ld b, D_LEFT
	call .CheckAllowedDirection
	inc hl
	ld de, -$20
	add hl, de
	ld b, D_UP
	call .CheckAllowedDirection
	ld de, $40
	add hl, de
	ld b, D_DOWN
	call .CheckAllowedDirection
	ld a, c
	ld [wOWAllowedDPadInput], a
	ret

.CheckAllowedDirection
	ld a, [hl]
	cp $02
	jr z, .check
	cp $01
	jr z, .check
	ret

.check
	ld e, l
	ld d, h
	dec d
	dec d
	dec d
	ld a, [de]
	bit 3, a
	ret z
	ld a, c
	or b
	ld c, a
	ret

.asm_8219b
	ld a, D_RIGHT | D_UP | D_DOWN
	ld [wOWAllowedDPadInput], a
	ret
; 0x821a1

Func_821a1: ; 821a1 (20:61a1)
	xor a
	ld [w2d0a0], a
	ld c, $02
	ld hl, w2d06b
	ld de, w2d06d
	call Func_821f9
	ld [w2d0a7], a
	ld c, $04
	ld hl, w2d06c
	ld de, w2d06e
	call Func_821f9
	ld [w2d0a8], a
	ld a, [w2d0a0]
	ld b, a
	ld hl, w2d0a7
	ld a, [hli]
	cp [hl] ; w2d0a8
	jr nc, .asm_821cf
	ld a, [hld]
	set 0, b
.asm_821cf
	ld [w2d0a1], a
	ld [w2d0a2], a
	ld a, [hl]
	ld [w2d0a3], a
	ld [w2d0a4], a
	ld a, b
	ld [w2d0a0], a
	lb de, $01, $01
	ld hl, w2d0a0
	bit 1, [hl]
	jr z, .asm_821ec
	ld d, $ff
.asm_821ec
	bit 2, [hl]
	jr z, .asm_821f2
	ld e, $ff
.asm_821f2
	ld hl, w2d0a5
	ld [hl], d
	inc l
	ld [hl], e ; w2d0a6
	ret
; 0x821f9

Func_821f9: ; 821f9 (20:61f9)
	ld b, [hl]
	ld a, [de]
	sub b
	ret nc
	cpl
	inc a
	ld b, a
	ld a, c
	ld hl, w2d0a0
	or [hl]
	ld [hl], a
	ld a, b
	ret
; 0x82208

Func_82208: ; 82208 (20:6208)
	ld hl, w2d0a1
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	ld a, [w2d0a2]
	ld d, a
	ld hl, w2d0a3
	ld a, [w2d0a4]
	add [hl]
	ld [hl], a
	cp d
	call nc, Func_82224
	call Func_8222f
	ret
; 0x82224

Func_82224: ; 82224 (20:6224)
	sub d
	ld [hl], a
	ld a, [w2d0a0]
	and $1
	xor $1
	jr Func_82234

Func_8222f: ; 8222f (20:622f)
	ld a, [w2d0a0]
	and $1
;	fallthrough

Func_82234: ; 82234 (20:6234)
	ld hl, w2d06b
	ld de, w2d0a5
	jr z, .asm_8223e
	inc e
	inc l
.asm_8223e
	ld a, [de]
	add [hl]
	ld [hl], a
	ret
; 0x82242

Func_82242: ; 82242 (20:6242)
	ld hl, w2d051
	inc [hl]
	ld a, [wTopBarState]
	and a
	ret z
	dec a
	jumptable

	dw Func_82263 ; $1
	dw Func_82277 ; $2
	dw Func_822d7 ; $3
	dw Func_822f1 ; $4
	dw Func_82311 ; $5
	dw Func_8235b ; $6
	dw Func_8237f ; $7
	dw Func_8239e ; $8
	dw Func_82400 ; $9
	dw Func_8241b ; $a
	dw Func_8242e ; $b
; 0x82263

Func_82263: ; 82263 (20:6263)
	; mark bottom bar as closing
	call DrawBottomBar
	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ld [wMagnifyingGlassCounter], a

	ld hl, wTopBarState
	inc [hl]
	ret
; 0x82277

Func_82277: ; 82277 (20:6277)
	; wait until bottom bar is fully closed
	call HandleBottomBar
	call DrawBottomBar
	ld a, [wBottomBarAction]
	and a
	ret nz

	play_sfx SFX_0E9

	xor a
	set TOPBAR_COLLECTION_F, a
	ld [wTopBarSelection], a
	call Func_822b4
	call Func_826f6

	ld a, LOW(rOCPS)
	ld [wPalConfig1Register], a
	ld a, HIGH(wTempPals2 palette 4)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals2 palette 4)
	ld [wPalConfig1SourceLo], a
	ld a, OCPSF_AUTOINC | (4 << 3)
	ld [wPalConfig1Index], a
	ld a, 4 ; number of pals
	ld [wPalConfig1Number], a

	ld hl, wTopBarState
	inc [hl]
	ret
; 0x822b4

Func_822b4: ; 822b4 (20:62b4)
	call Func_82490
	call Func_82654

	xor a
	ld [w2d140], a
	ld [w2d148], a
	ld a, $1c
	ld [w2d149], a
	call DrawTopBar

	ld hl, Pals_84a20
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84a20)
	call CopyFarBytes
	ret
; 0x822d7

Func_822d7: ; 822d7 (20:62d7)
	ld a, [wSCY]
	dec a
	dec a
	ld [wSCY], a
	cp $ec
	jr nz, .still_opening
	; fully open, advance state
	ld a, [wTransitionParam]
	ld [w2d02c], a
	ld hl, wTopBarState
	inc [hl]
.still_opening
	call DrawTopBar
	ret
; 0x822f1

Func_822f1: ; 822f1 (20:62f1)
	call Func_825af
	jr c, .done
	call Func_82451
	jr c, .done
	ld a, [wJoypadPressed]
	and B_BUTTON | SELECT
	jr z, .done
	play_sfx SFX_0EA
	ld hl, wTopBarState
	inc [hl]
.done
	jp DrawTopBar
; 0x82311

Func_82311: ; 82311 (20:6311)
	ld a, [wSCY]
	inc a
	inc a
	ld [wSCY], a
	cp $04
	jr nz, .asm_82357
	xor a
	ld [w2d013], a
	ld [wTopBarState], a
	ld hl, Pals_84900 palette 4
	ld de, 8 palettes
	ld a, [wCurMapSide]
	inc a
.loop
	dec a
	jr z, .got_pal
	add hl, de
	jr .loop
.got_pal
	ld de, wTempPals2 palette 4
	ld c, 4 palettes
	ld b, BANK(Pals_84900)
	call CopyFarBytes
	ld a, LOW(rOCPS)
	ld [wPalConfig1Register], a
	ld a, HIGH(wTempPals2 palette 4)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals2 palette 4)
	ld [wPalConfig1SourceLo], a
	ld a, OCPSF_AUTOINC | (4 << 3)
	ld [wPalConfig1Index], a
	ld a, 4 ; number of pals
	ld [wPalConfig1Number], a
.asm_82357
	call DrawTopBar
	ret
; 0x8235b

Func_8235b: ; 8235b (20:635b)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_82369
	ld a, [w2d051]
	cp 30
	jr c, .done
.asm_82369
	ld a, [w2d00d]
	ld [wTransitionParam], a
	xor a
	ld [wSubState], a
	xor a
	ld hl, w2d051
	ld [hld], a
	ld a, $04
	ld [hl], a ; wTopBarState
.done
	call DrawTopBar
	ret
; 0x8237f

Func_8237f: ; 8237f (20:637f)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_8238d
	ld a, [w2d051]
	cp 30
	jr c, .asm_8239a
.asm_8238d
	xor a
	ld hl, w2d051
	ld [hld], a
	ld a, $04
	ld [hl], a ; wTopBarState
	ld a, SST_OVERWORLD_0C
	ld [wSubState], a
.asm_8239a
	call DrawTopBar
	ret
; 0x8239e

Func_8239e: ; 8239e (20:639e)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_823ac
	ld a, [w2d051]
	cp 30
	jr c, .asm_823e2
.asm_823ac
	xor a
	ld hl, w2d051
	ld [hld], a
	ld a, $04
	ld [hl], a ; wTopBarState
	ld a, [w2d146]
	ld b, 1
	cp $0a
	jr nz, .asm_823bf
	ld b, -1
.asm_823bf
	ld hl, wNextMapSide
	ld a, b
	add [hl]
	and $3 ; wrap around
	ld [hl], a
	call .GetNextLevelIndex

	stop_music2

	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld a, SST_OVERWORLD_08
	ld [wSubState], a

.asm_823e2
	call DrawTopBar
	ret

.GetNextLevelIndex
	ld hl, .Indices
	call AddOffsetInPointerTable
	dec b
	jr z, .got_index
	inc hl
.got_index
	ld a, [hl]
	ld [wMapSideLevelIndex], a
	ld [w2d068], a
	ret

.Indices
	; left, right
	db OWNORTH_THE_PEACEFUL_VILLAGE, OWNORTH_THE_VAST_PLAIN   ; MAP_NORTH
	db OWWEST_DESERT_RUINS,          OWWEST_A_TOWN_IN_CHAOS   ; MAP_WEST
	db OWSOUTH_THE_GRASSLANDS,       OWSOUTH_TOWER_OF_REVIVAL ; MAP_SOUTH
	db OWEAST_THE_STAGNANT_SWAMP,    OWEAST_FOREST_OF_FEAR    ; MAP_EAST
; 0x82400

Func_82400: ; 82400 (20:6400)
	call DrawTopBar
	ld a, [w2d142]
	cp $04
	jr z, .asm_8240d
	cp $06
	ret nz
.asm_8240d
	call Func_80377
	call Func_82654
	call Func_826f6
	ld hl, wTopBarState
	inc [hl]
	ret
; 0x8241b

Func_8241b: ; 8241b (20:641b)
	ld a, [w2d146]
	cp $05
	jr z, .asm_82426
	cp $07
	jr nz, .asm_8242a
.asm_82426
	ld hl, wTopBarState
	inc [hl]
.asm_8242a
	call DrawTopBar
	ret
; 0x8242e

Func_8242e: ; 8242e (20:642e)
	farcall Func_84a40
	ld a, [w2d055]
	and a
	jr nz, .asm_8244d

	di
	call VBlank_80bf9
	ei

	ld a, $04
	ld [wTopBarState], a
.asm_8244d
	call DrawTopBar
	ret
; 0x82451

Func_82451: ; 82451 (20:6451)
	xor a
	ld a, [wTopBarSelection]
	ld b, a
	ld hl, wTopBarSelection
	ld a, [wJoypadPressed]
	ld c, a
	ld a, [wTopBarSelectableButtons]
	ld d, a
	bit D_RIGHT_F, c
	jr nz, .d_right
	bit D_LEFT_F, c
	jr nz, .d_left
	ret

.d_right
	; find the first item to the right
	; that can be selectable
	ld a, d
	rrc b
	ret c
	and b
	jr z, .d_right

.got_selection
	ld [hl], b
	call Func_82490
	call Func_82654
	call Func_826f6
	play_sfx SFX_0E2
	scf
	ret

.d_left
	; find the first item to the left
	; that can be selectable
	ld a, d
	sla b
	bit (TOPBAR_PREV_MAP_F + 1), b
	ret nz
	and b
	jr z, .d_left
	jr .got_selection
; 0x82490

Func_82490: ; 82490 (20:6490)
	ld a, [wTopBarSelection]
	ld c, $00
	bit TOPBAR_DAY_NIGHT_F, a
	jr nz, .asm_824d4
	inc c
	bit TOPBAR_CUTSCENE_F, a
	jr nz, .asm_824ab
	inc c
	bit TOPBAR_COLLECTION_F, a
	jr nz, .asm_824ab
	inc c
	bit TOPBAR_NEXT_MAP_F, a
	jr nz, .asm_824ab
	inc c
	bit TOPBAR_PREV_MAP_F, a ; unnecessary
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
	ld a, [wTopBarSelection]
	and TOPBAR_NEXT_MAP | TOPBAR_PREV_MAP
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
	db $60, $07 ; $0
	db $50, $03 ; $1
	db $40, $01 ; $2
	db $2c, $0d ; $3
	db $0c, $09 ; $4
	db $60, $05 ; $5
; 0x824ea

DrawTopBar: ; 824ea (20:64ea)
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
	ld b, BANK(OAM_a9fe2)
	ld de, OAM_a9fe2
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
	ld b, BANK(OAM_a9fe2)
	ld de, OAM_a9fe2
	ld hl, w2d148
	call AddOWSpriteWithScroll
	ret
; 0x82521

Func_82521: ; 82521 (20:6521)
	push hl
	jumptable

	dw .Func_82541
	dw .Func_82543
	dw .Func_82548
	dw .Func_8254d
	dw .Func_82552
	dw .Func_82557
	dw .Func_8255c
	dw .Func_82567
	dw .Func_8256c
	dw .Func_82577
	dw .Func_8257c
	dw .Func_82581
	dw .Func_82586
	dw .Func_8258b
	dw .Func_82590
; 0x82541

.Func_82541
	pop hl
	ret

.Func_82543
	ld de, Frameset_aa091
	jr .UpdateAnimation_PopHL

.Func_82548
	ld de, Frameset_aa094
	jr .UpdateAnimation_PopHL

.Func_8254d
	ld de, Frameset_aa097
	jr .UpdateAnimation_PopHL

.Func_82552
	ld de, Frameset_aa09a
	jr .UpdateAnimation_PopHL

.Func_82557
	ld de, Frameset_aa09d
	jr .UpdateAnimation_PopHL

.Func_8255c
	ld de, Frameset_aa0bc
	pop hl
	call .UpdateAnimation
	ld b, $07
	jr .Func_8259a

.Func_82567
	ld de, Frameset_aa0a3
	jr .UpdateAnimation_PopHL

.Func_8256c
	ld de, Frameset_aa0c1
	pop hl
	call .UpdateAnimation
	ld b, $05
	jr .Func_8259a

.Func_82577
	ld de, Frameset_aa0a9
	jr .UpdateAnimation_PopHL

.Func_8257c
	ld de, Frameset_aa0ae
	jr .UpdateAnimation_PopHL

.Func_82581
	ld de, Frameset_aa0b1
	jr .UpdateAnimation_PopHL

.Func_82586
	ld de, Frameset_aa0c6
	jr .UpdateAnimation_PopHL

.Func_8258b
	ld de, Frameset_aa0b4
	jr .UpdateAnimation_PopHL

.Func_82590
	ld de, Frameset_aa0b9
;	fallthrough

.UpdateAnimation_PopHL
	pop hl
;	fallthrough
.UpdateAnimation
	ld b, $2a
	call UpdateOWAnimation
	ret

.Func_8259a
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	set 2, l
	ld d, h
	ld e, l
	xor a
	ld [de], a
	inc e
	ld [de], a
	inc e
	ld a, b
	ld [de], a
	call Func_82521
	ret
; 0x825af

Func_825af: ; 825af (20:65af)
	xor a
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld a, [wTopBarSelection]
	bit TOPBAR_DAY_NIGHT_F, a
	jr nz, .DayNight
	bit TOPBAR_CUTSCENE_F, a
	jr nz, .Cutscene
	bit TOPBAR_COLLECTION_F, a
	jr nz, .Collection
	bit TOPBAR_NEXT_MAP_F, a
	jr nz, .NextMap
	bit TOPBAR_PREV_MAP_F, a
	jr nz, .PrevMap
	xor a
	ret

.DayNight
	call Func_82640
	ld de, wAttrmap tile $26 + $b
	call Func_8264a
	ld a, $09
	ld [wTopBarState], a

.do_selection
	play_sfx SFX_0E3
	scf
	ret

.Cutscene
	ld a, [w2d00d]
	and a
	ret z
	call Func_82640
	ld de, wAttrmap tile $26 + $9
	call Func_8264a
	ld a, $06
	ld [wTopBarState], a
	xor a
	ld [w2d051], a
	jr .do_selection

.Collection
	call Func_82640
	ld de, wAttrmap tile $26 + $7
	call Func_8264a
	ld a, $07
	ld [wTopBarState], a
	xor a
	ld [w2d051], a
	ld a, FALSE
	ld [wIsCollectionOpen], a
	jr .do_selection

.NextMap
	call Func_82640
	call Func_8263b
	ld a, $08
	ld [wTopBarState], a
	xor a
	ld [w2d051], a
	jr .do_selection

.PrevMap
	call Func_82640
	call Func_8263b
	ld a, $08
	ld [wTopBarState], a
	xor a
	ld [w2d051], a
	jr .do_selection
; 0x8263b

Func_8263b: ; 8263b (20:663b)
	ld hl, w2d14e
	jr Func_82643

Func_82640: ; 82640 (20:6640)
	ld hl, w2d146
;	fallthrough

Func_82643: ; 82643 (20:6643)
	ld a, [hl]
	inc a
	ld [hld], a
	xor a
	ld [hld], a
	ld [hl], a
	ret
; 0x8264a

Func_8264a: ; 8264a (20:664a)
	ld hl, Data_826ee
	call Func_8269f
	call Func_826f6
	ret
; 0x82654

Func_82654: ; 82654 (20:6654)
	ld a, [wTopBarSelectableButtons]
	ld b, a
	ld hl, Data_826c6
	ld de, wAttrmap + $26b
	call .Func_82698
	ld hl, Data_826ce
	ld de, wAttrmap + $269
	call .Func_82698
	ld hl, Data_826d6
	ld de, wAttrmap + $267
	call .Func_82698
	ld a, [wTopBarSelection]
	ld b, a
	ld hl, Data_826de
	ld de, wAttrmap + $26b
	call .Func_82693
	ld hl, Data_826de
	ld de, wAttrmap + $269
	call .Func_82693
	ld hl, Data_826e6
	ld de, wAttrmap + $267
	call .Func_82693
	ret

.Func_82693
	srl b
	ret nc
	jr Func_8269f

.Func_82698
	srl b
	jr c, Func_8269f
	ld hl, Data_826be
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

Data_826be: ; 826be (20:66be)
	db $3c, $3c, $3d, $3d
	db $0f, $2f, $0f, $2f

Data_826c6: ; 826c6 (20:66c6)
	db $3e, $3e, $3f, $3f
	db $0f, $2f, $0f, $2f

Data_826ce: ; 826ce (20:66ce)
	db $3a, $3a, $3b, $3b
	db $0f, $2f, $0f, $2f

Data_826d6: ; 826d6 (20:66d6)
	db $38, $38, $39, $39
	db $0f, $2f, $0f, $2f

Data_826de: ; 826de (20:66de)
	db $34, $35, $36, $37
	db $0f, $0f, $0f, $0f

Data_826e6: ; 826e6 (20:66e6)
	db $30, $31, $32, $33
	db $0f, $0f, $0f, $0f

Data_826ee: ; 826ee (20:66ee)
	db $48, $49, $4a, $4b
	db $0f, $0f, $0f, $0f
; 0x826f6

Func_826f6: ; 826f6 (20:66f6)
	ld a, HIGH(wAttrmap tile $2a)
	ld [wHDMASourceHi], a
	ld a, LOW(wAttrmap tile $2a)
	ld [wHDMASourceLo], a
	ld a, $1b
	ld [wHDMADestHi], a
	ld a, $c0
	ld [wHDMADestLo], a
	ld a, $03
	ld [wHDMAMode], a

	ld a, HIGH(wAttrmap tile $26)
	ld [w2d0b5 + 0], a
	ld a, LOW(wAttrmap tile $26)
	ld [w2d0b5 + 1], a
	ld a, $1b
	ld [w2d0b5 + 2], a
	ld a, $c0
	ld [w2d0b5 + 3], a
	ld a, $03
	ld [w2d0b5 + 4], a
	ret
; 0x82729

	INCROM $82729, $82761

HandleBottomBar: ; 82761 (20:6761)
	ld a, [wMapSideLevelIndex]
	ld c, a
	ld a, [w2d068]
	cp c
	jr nz, .asm_82788
	ld a, [wBottomBarAction]
	cp BOTBAR_CLOSING
	jp z, .CloseBottomBar
	cp BOTBAR_OPENING
	jp z, .OpenBottomBar
	call .CheckBottomBarPossible
	ret c
	ld a, [wBottomBarAction]
	cp BOTBAR_OPENED
	jr z, .HandleOpenedBottomBar
	cp BOTBAR_CLOSED
	jr z, .HandleClosedBottomBar
	ret

.asm_82788
	xor a
	ld [w2d096], a
	ld a, [wBottomBarAction]
	and a
	ret z ; is closed already
	cp BOTBAR_CLOSING
	jp z, .CloseBottomBar

	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ld [wMagnifyingGlassCounter], a
	ret

; returns carry if opening
; the bottom bar is not possible
.CheckBottomBarPossible
	ld a, [wOWLevel]
	add a
	; if it's either $00 (the Temple) or $80 (Junction)
	; then this will set z flag
	jr z, .set_carry
	ld a, [w2d013]
	cp $05
	jr nz, .set_carry
	and a
	ret
.set_carry
	scf
	ret

.HandleClosedBottomBar
	ld a, [wHasMagnifyingGlass]
	and a
	ret z ; no magnifying glass, exit
	ld hl, wMagnifyingGlassCounter
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr nz, .b_btn_down
	; reset counter
	xor a
	ld [hl], a
	ret
.b_btn_down
	inc [hl]
	ld a, [hl]
	cp 10
	ret c
	ld a, BOTBAR_OPENING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ret

.HandleOpenedBottomBar
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	ret nz ; B button still pressed

	; no longer pressing B,
	; begin closing bar
	ld hl, wBottomBarFlags
	res 4, [hl]
	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ret

.OpenBottomBar
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .no_b_btn
	ld a, [wBottomBarState]
	jumptable

	dw .InitBar
	dw .OpenWindow
	dw .SetVisibleTreasures
	dw .SetBottomBarAsOpen

.no_b_btn
	ld hl, wBottomBarFlags
	res 4, [hl]
	ld a, BOTBAR_CLOSING
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ret

.InitBar
	ld hl, wBottomBarFlags
	set 4, [hl]
	xor a
	ld [wHDMA], a
	ld [w2d0b5], a
	ld hl, wBottomBarState
	inc [hl]
	ret

.OpenWindow
	ld hl, wWY
	ld b, [hl]
	ld a, $78
	cp b
	jr nc, .cap_min_wy
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
.cap_min_wy
	ld [hl], a
	xor a
	ld [wMagnifyingGlassCounter], a
	ld hl, wBottomBarState
	inc [hl]
	ret

.SetVisibleTreasures
	ld hl, wMagnifyingGlassCounter
	inc [hl]
	ld a, [hl]
	cp $03
	ret c
	xor a
	ld [hl], a

; here, we use the divider register to
; determine which treasure gfx to load
; so that they appear in "random" time intervals
	ld hl, wBottomBarFlags
.loop_outer ; loop until we set a bit that is unset
	ldh a, [rDIV]
	and $0f
	inc a
	ld c, $00
	scf
.loop_inner
	rl c
	dec a
	jr nz, .loop_inner
	; make it so the set bit is
	; in the bottom nybble
	ld a, $0f
	and c
	jr nz, .bottom_nybble_bit
	swap c
.bottom_nybble_bit
	ld a, c
	and [hl]
	jr nz, .loop_outer ; loop if is already set

	ld a, c
	or [hl]
	ld [hl], a
	and $0f
	cp $0f
	ret nz ; exit if still some unset bits
	; all set, advance
	ld hl, wBottomBarState
	inc [hl]
	ret

.SetBottomBarAsOpen
	ld a, BOTBAR_OPENED
	ld [wBottomBarAction], a
	xor a
	ld [wBottomBarState], a
	ld hl, wBottomBarFlags
	bit 6, [hl]
	ret z
	set 7, [hl]
	ret

.CloseBottomBar
	ld a, [wBottomBarState]
	jumptable

	dw .CloseWindow
	dw .DeinitBar

.CloseWindow
	ld hl, wWY
	ld a, [hl]
	cp $90
	jr nc, .cap_max_wy
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret
.cap_max_wy
	ld [hl], $90
	ld hl, wBottomBarState
	inc [hl]
	ret

.DeinitBar
	ld hl, wBottomBarFlags
	ld a, $1 << 6
	and [hl]
	ld [hl], a
	xor a
	ld [w2d116], a
	ld [w2d117], a
	xor a ; unnecessary
	ld [wBottomBarAction], a
	xor a ; unnecessary
	ld [wBottomBarState], a
	ld [wMagnifyingGlassCounter], a
	ret
; 0x828b3

DrawBottomBar: ; 828b3 (20:68b3)
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jp nz, Func_82997

	ld a, [wLevelGreyTreasurePal]
	ld c, a
	ld e, $00
	ld a, [wBottomBarFlags]
	bit 0, a
	jr nz, .has_grey
	ld e, $09
	ld c, $00
.has_grey
	ld d, $20
	call AddSpriteInsideWindow_Low

	ld a, [wLevelRedTreasurePal]
	ld c, a
	ld e, $01
	ld a, [wBottomBarFlags]
	bit 1, a
	jr nz, .has_red
	ld e, $09
	ld c, $00
.has_red
	ld d, $3c
	call AddSpriteInsideWindow_Low

	ld a, [wLevelGreenTreasurePal]
	ld c, a
	ld e, $02
	ld a, [wBottomBarFlags]
	bit 2, a
	jr nz, .has_green
	ld e, $09
	ld c, $00
.has_green
	ld d, $58
	call AddSpriteInsideWindow_Low

	ld a, [wLevelBlueTreasurePal]
	ld c, a
	ld e, $03
	ld a, [wBottomBarFlags]
	bit 3, a
	jr nz, .has_blue
	ld e, $09
	ld c, $00
.has_blue
	ld d, $74
	call AddSpriteInsideWindow_Low

	call DrawBottomBarButtonPrompt
	call DrawBottomBar8Coin
	ret
; 0x8291a

AddSpriteInsideWindow_High: ; 8291a (20:691a)
	ld b, $20
	jr AddSpriteInsideWindow

AddSpriteInsideWindow_Low: ; 8291e (20:691e)
	ld b, $24
;	fallthrough

; b = y coord
; d = x coord
; e = tile ID
; c = attributes
AddSpriteInsideWindow: ; 82920 (20:6920)
	ld a, [wWY]
	add b
	ld [wCurSpriteYCoord], a
	ld a, [wWX]
	add d
	ld [wCurSpriteXCoord], a
	ld a, e
	ld [wCurSpriteFrame], a
	ld a, c
	ld [wCurSpriteAttributes], a
	ld hl, OAM_aa0cf
	ld b, BANK(OAM_aa0cf)
	call AddOWSpriteWithScroll_GotParams
	ret
; 0x8293f

DrawBottomBar8Coin: ; 8293f (20:693f)
	ld a, [wBottomBarFlags]
	bit 7, a
	ret z
	ld hl, w2d116
	ld de, Frameset_aa2fb
	ld b, BANK(Frameset_aa2fb)
	call UpdateOWAnimation
	ld d, $90
	ld hl, w2d114
	ld a, [hli]
	ld e, a
	ld c, $00
	jr AddSpriteInsideWindow_Low
; 0x8295b

DrawBottomBarButtonPrompt: ; 8295b (20:695b)
	ld a, [wHasMagnifyingGlass]
	and a
	ret z
	ld b, $04
	ld a, [wOWLevel]
	add a
	jr nz, .asm_8296c
	; wOWLevel == $00 or $80
	ld b, $06
	jr .got_tile
.asm_8296c
	ld a, [wBottomBarFlags]
	bit 4, a
	jr z, .got_tile
	ld b, $05
.got_tile
	ld a, b
	ld [wCurSpriteFrame], a
	ld a, [wWY]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [wWX]
	add $10
	ld [wCurSpriteXCoord], a
	ld a, $00
	ld [wCurSpriteAttributes], a
	ld hl, OAM_aa580
	ld b, BANK(OAM_aa580)
	call AddOWSpriteWithScroll_GotParams
	ret
; 0x82997

Func_82997: ; 82997 (20:6997)
	call Func_829a1
	call DrawBottomBarButtonPrompt
	call DrawBottomBar8Coin
	ret
; 0x829a1

Func_829a1: ; 829a1 (20:69a1)
	ld a, [w2d0ee]
	and $f0
	swap a ; top nybble
	add $1e
	ld e, a
	ld c, $00
	ld d, $50
	call AddSpriteInsideWindow_High
	ld a, [w2d0ee]
	and $0f ; bottom nybble
	add $1e
	ld e, a
	ld c, $00
	ld d, $58
	call AddSpriteInsideWindow_High
	ld a, [w2d0ef]
	and $f0
	swap a ; top nybble
	add $1e
	ld e, a
	ld c, $00
	ld d, $68
	call AddSpriteInsideWindow_High
	ld a, [w2d0ef]
	and $0f ; bottom nybbles
	add $1e
	ld e, a
	ld c, $00
	ld d, $70
	call AddSpriteInsideWindow_High
	ret
; 0x829e2

Func_829e2: ; 829e2 (20:69e2)
	ld hl, w2d061
	inc [hl]
	ld a, [w2d062]
	jumptable
	dw $6a79
	dw Func_82a0a
	dw $6a26
	dw $6a2f
	dw $6a4e
	dw $6a62
	dw $6a96
	dw $6a9b
	dw $6aae
	dw $6a9b
	dw $6aea
	dw $6a9b
	dw $6b22
	dw $6b67
	dw $6b7b
	dw $6baa
; 0x82a0a

Func_82a0a: ; 82a0a (20:6a0a)
	farcall Func_851e7
	ld a, [w2d055]
	and a
	ret nz
	di
	call VBlank_80cb1
	ei
	jp Func_82a8d
; 0x82a26

	INCROM $82a26, $82a8d

Func_82a8d: ; 82a8d (20:6a8d)
	xor a
	ld [w2d061], a
	ld hl, w2d062
	inc [hl]
	ret
; 0x82a96

	INCROM $82a96, $82ada

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
	ld a, [w2d180State]
	and a
	ret z
	ld de, Frameset_aa544
	ld hl, w2d180Duration
	ld b, BANK(Frameset_aa544)
	call UpdateOWAnimation
	ld hl, w2d180
	ld de, OAM_aa445
	ld b, BANK(OAM_aa445)
	call AddOWSpriteWithScroll
	ret
; 0x82bda

Func_82bda: ; 82bda (20:6bda)
	ld a, [w2d028]
	cp $03
	ret nz
	ld a, [w2d180State]
	and a
	ret z
	ld hl, w2d180Duration
	ld de, Frameset_aa555
	ld b, BANK(Frameset_aa555)
	call UpdateOWAnimation
	ld a, [wOWAnimationFinished]
	cp $ff
	jr z, .asm_82c03
	ld hl, w2d180
	ld de, OAM_aa445
	ld b, BANK(OAM_aa445)
	call AddOWSpriteWithScroll
	ret
.asm_82c03
	ld hl, w2d180State
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

	INCROM $82c1d, $82c33

Func_82c33: ; 82c33 (20:6c33)
	ld hl, w2d061
	inc [hl]
	ld a, [w2d062]
	jumptable
; 0x82c3b

	INCROM $82c3b, $82cb8
