; for cutscenes that don't
; need to run an init function
NoInitCutscene:
	xor a
	ld [wEventWithCutscene], a
	ret

; returns nz if event in wCurEvent has a cutscene
; if TRUE, outputs event in wEventWithCutscene
; otherwise outputs 0
CheckIfEventHasCutscene:
	xor a
	ld [wEventWithCutscene], a
	ld a, [wCurEvent]
	ld b, a
	ld hl, CutsceneInitFunctions
	call GetPointerFromTableHL
	ld a, h
	cp HIGH(NoInitCutscene)
	jr nz, .has_cutscene
	ld a, l
	cp LOW(NoInitCutscene)
	ret z ; no cutscene
.has_cutscene
	ld a, b
	ld [wEventWithCutscene], a
	ret

_InitCutscene:
	call DisableLCD
	call ClearVirtualOAM
	stop_music2

	xor a
	ld hl, wLCDCFlagsToFlip
	ld bc, $30
	call WriteAToHL_BCTimes

	call VBlank_Cutscene
	call InitEventCutscene

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ldh [rSCX], a
	ld [wSCX], a
	ld [w2d801], a
	ld [w2d013], a
	ld [w2d014], a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a

	ld a, [wLCDCFlagsToFlip]
	ld b, a
	and a
	ld a, LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_WIN_9C00 | LCDC_ON
	jr z, .no_lcd_bit_flips
	xor b
.no_lcd_bit_flips
	ldh [rLCDC], a
	xor a
	ld [wLCDCFlagsToFlip], a

	ld hl, wSubState
	inc [hl]
	ret

; runs the init function from CutsceneInitFunctions
; for the cutscene in [wCurEvent]
InitEventCutscene:
	xor a
	ld [wLCDCFlagsToFlip], a
	call ClearVirtualOAM
	ld a, [wCurEvent]
	dec a
	jr z, .skip_load_tiles
	; != EVENT_PROLOGUE
	decompress_tiles1 Cutscenes6Gfx, v1Tiles0
.skip_load_tiles
	ld a, [wCurEvent]
	ld [wEventWithCutscene], a
	jumptable

CutsceneInitFunctions:
	table_width 2
	dw NoInitCutscene  ; EVENT_00
	dw InitPrologue ; EVENT_PROLOGUE
	dw InitCutscene02 ; EVENT_CUT_TREE
	dw InitCutscene03 ; EVENT_OPEN_NORTH_GATE
	dw InitCutscene04 ; EVENT_EXPEL_TORNADO
	dw NoInitCutscene  ; EVENT_LEAD_OVERALLS
	dw InitCutscene06 ; EVENT_RAINSTORM
	dw InitCutscene07 ; EVENT_FIX_ELEVATOR
	dw InitCutscene08 ; EVENT_YELLOW_MUSIC_BOX
	dw InitCutscene09 ; EVENT_PLANT_SEEDS
	dw InitCutscene0a ; EVENT_RAISE_TOWER
	dw NoInitCutscene  ; EVENT_SWIMMING_FLIPPERS
	dw InitCutscene0c ; EVENT_BLOW_MIST
	dw InitCutscene0d ; EVENT_SUMMON_SNAKES
	dw InitCutscene0e ; EVENT_FREEZE_SEA
	dw NoInitCutscene  ; EVENT_HEAD_SMASH_HELMET
	dw InitCutscene10 ; EVENT_BLUE_MUSIC_BOX
	dw InitCutscene11 ; EVENT_SUMMON_LIGHTNING
	dw NoInitCutscene  ; EVENT_GRAB_GLOVE
	dw InitCutscene13 ; EVENT_FOOT_STONE
	dw InitCutscene14 ; EVENT_VOLCANO_ERUPTION
	dw InitCutscene15 ; EVENT_OPEN_BLUE_SNAKE_DOOR
	dw NoInitCutscene  ; EVENT_GARLIC
	dw InitCutscene17 ; EVENT_GREEN_MUSIC_BOX
	dw InitCutscene18 ; EVENT_PURIFY_WATER
	dw InitCutscene19 ; EVENT_REVEAL_CASTLE
	dw NoInitCutscene  ; EVENT_SUPER_JUMP_SLAM_OVERALLS
	dw InitCutscene1b ; EVENT_SUMMON_SUN
	dw NoInitCutscene  ; EVENT_HIGH_JUMP_BOOTS
	dw InitCutscene1d ; EVENT_RED_MUSIC_BOX
	dw InitCutscene1e ; EVENT_EXPLODE_BOMBS
	dw InitCutscene1f ; EVENT_LEAVES_FALL
	dw NoInitCutscene  ; EVENT_PRINCE_FROGS_GLOVES
	dw InitCutscene21 ; EVENT_MAKE_WIRE
	dw InitCutscene22 ; EVENT_TREASURE_MAP
	dw NoInitCutscene  ; EVENT_SUPER_GRAB_GLOVES
	dw InitCutscene24 ; EVENT_OPEN_TREE_MOUTH
	dw InitCutscene25 ; EVENT_GOLD_MUSIC_BOX
	dw NoInitCutscene  ; EVENT_BLUE_CRAYON
	dw InitCutscene27 ; EVENT_PLACE_CART_WHEELS
	dw NoInitCutscene  ; EVENT_COLLECT_BLUE_GEM
	dw NoInitCutscene  ; EVENT_CYAN_CRAYON
	dw NoInitCutscene  ; EVENT_COLLECT_GOBLET
	dw NoInitCutscene  ; EVENT_COLLECT_CROWN
	dw NoInitCutscene  ; EVENT_PINK_CRAYON
	dw NoInitCutscene  ; EVENT_COLLECT_TEAPOT
	dw NoInitCutscene  ; EVENT_COLLECT_POCKET_PET
	dw NoInitCutscene  ; EVENT_MAGNIFYING_GLASS
	dw InitCutscene30 ; EVENT_RAISE_ICE_BLOCKS
	dw NoInitCutscene  ; EVENT_COLLECT_ROCKET
	dw NoInitCutscene  ; EVENT_YELLOW_CRAYON
	dw NoInitCutscene  ; EVENT_UNUSED_33
	dw NoInitCutscene  ; EVENT_COLLECT_SABER
	dw NoInitCutscene  ; EVENT_DAY_OR_NIGHT_SPELL
	dw NoInitCutscene  ; EVENT_COLLECT_UFO
	dw InitCutscene37 ; EVENT_TORCH_FOREST
	dw InitCutscene38 ; EVENT_REVEAL_WARPED_VOID
	dw InitCutscene39 ; EVENT_RAISE_PIPE
	dw InitCutscene3a ; EVENT_REMOVE_WARPS
	dw NoInitCutscene  ; EVENT_BROWN_CRAYON
	dw InitCutscene3c ; EVENT_COLLECT_DEMONS_BLOOD
	dw InitCutscene3d ; EVENT_OPEN_PARAGOOM_CAGE
	dw NoInitCutscene  ; EVENT_COLLECT_HEART_CREST
	dw NoInitCutscene  ; EVENT_COLLECT_MINICAR
	dw NoInitCutscene  ; EVENT_COLLECT_LOCOMOTIVE
	dw NoInitCutscene  ; EVENT_COLLECT_TELEPHONE
	dw NoInitCutscene  ; EVENT_RED_CRAYON
	dw InitCutscene43 ; EVENT_PLACE_PROPELLER
	dw InitCutscene44 ; EVENT_FEED_OCTOHON
	dw NoInitCutscene  ; EVENT_COLLECT_GREEN_GEM
	dw NoInitCutscene  ; EVENT_UNUSED_46
	dw NoInitCutscene  ; EVENT_UNUSED_47
	dw NoInitCutscene  ; EVENT_COLLECT_FIGHTER_MANNEQUIN
	dw InitCutscene49 ; EVENT_OPEN_GOLDEN_SNAKE_DOOR
	dw InitCutscene4a ; EVENT_OPEN_SKY_DOOR
	dw NoInitCutscene  ; EVENT_GREEN_CRAYON
	dw InitCutscene4c ; EVENT_EXTINGUISH_FIRE
	dw NoInitCutscene  ; EVENT_COLLECT_DIAMONDS_CREST
	dw InitCutscene4e ; EVENT_PLACE_BRICK
	dw InitCutscene4f ; EVENT_SPRAY_IRON_WALL
	dw NoInitCutscene  ; EVENT_COLLECT_SPADES_CREST
	dw InitCutscene51 ; EVENT_MIX_CHEMICALS
	dw NoInitCutscene  ; EVENT_COLLECT_RED_GEM
	dw NoInitCutscene  ; EVENT_COLLECT_CLUBS_CREST
	dw InitCutscene54 ; EVENT_CUT_BALOON
	dw InitCutscene55 ; EVENT_DRILL_HOLES
	dw InitCutscene56 ; EVENT_REVEAL_DARK_ROOM
	dw InitCutscene57 ; EVENT_SUMMON_MOON
	dw InitCutscene58 ; EVENT_OPEN_CRATER_HOLE
	dw NoInitCutscene  ; EVENT_COLLECT_EARTHEN_FIGURE
	dw NoInitCutscene  ; EVENT_EPILOGUE
	assert_table_length NUM_EVENTS
