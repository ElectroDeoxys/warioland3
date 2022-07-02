MACRO music
	assert (\4) < CHAN5, "Invalid channel for music"

	dab \1 ; sound addr
	db \2 ; unknown
	db \3 ; priority
	db \4 ; channel start number
	db \5 ; number of channels used
	db $00 ; padding
ENDM

MACRO sfx
	assert (\4) >= CHAN5, "Invalid channel for SFX"

	dab \1 ; sound addr
	db \2 ; unknown
	db \3 ; priority
	db (\4) - CHAN5 ; channel start number
	db \5 ; number of channels used
	db $00 ; padding
ENDM

MACRO filler_sounds
REPT \1
	music Music_OutOfTheWoodsDay, $00, 100, CHAN1, 4
ENDR
ENDM

SoundHeaders: ; 3155e (c:555e)
	music Music_OutOfTheWoodsDay,        $00, 100, CHAN1, 4 ; MUSIC_OUT_OF_THE_WOODS_DAY
	music Music_OutOfTheWoodsNight,      $00, 100, CHAN1, 3 ; MUSIC_OUT_OF_THE_WOODS_NIGHT
	music Music_ForestOfFear,            $00, 100, CHAN1, 2 ; MUSIC_FOREST_OF_FEAR
	music Music_TheWarpedVoid,           $00, 100, CHAN1, 3 ; MUSIC_THE_WARPED_VOID
	music Music_DesertRuins,             $00, 100, CHAN1, 3 ; MUSIC_DESERT_RUINS
	music Music_TheFrigidSea,            $00, 100, CHAN1, 3 ; MUSIC_THE_FRIGID_SEA
	music Music_ThePeacefulVillageDay,   $00, 100, CHAN1, 4 ; MUSIC_THE_PEACEFUL_VILLAGE_DAY
	music Music_ThePeacefulVillageNight, $00, 100, CHAN1, 3 ; MUSIC_THE_PEACEFUL_VILLAGE_NIGHT
	music Music_AboveTheCloudsDay,       $00, 100, CHAN1, 3 ; MUSIC_ABOVE_THE_CLOUDS_DAY
	music Music_AboveTheCloudsNight,     $00, 100, CHAN1, 3 ; MUSIC_ABOVE_THE_CLOUDS_NIGHT
	music Music_TheVolcanosBaseDay,      $00, 100, CHAN1, 3 ; MUSIC_THE_VOLCANOS_BASE_NIGHT
	music Music_TheVolcanosBaseNight,    $00, 100, CHAN1, 3 ; MUSIC_THE_VOLCANOS_BASE_DAY
	music Music_TheWestCrater,           $00, 100, CHAN1, 3 ; MUSIC_THE_WEST_CRATER
	music Music_TheVastPlainDay,         $00, 100, CHAN1, 4 ; MUSIC_THE_VAST_PLAIN_DAY
	music Music_TheVastPlainNight,       $00, 100, CHAN1, 4 ; MUSIC_THE_VAST_PLAIN_NIGHT
	music Music_BankOfTheWildRiver,      $00, 100, CHAN1, 4 ; MUSIC_BANK_OF_THE_WILD_RIVER
	music Music_TheTidalCoast,           $00, 100, CHAN1, 4 ; MUSIC_THE_TIDAL_COAST
	music Music_CaveOfFlames,            $00, 100, CHAN1, 4 ; MUSIC_CAVE_OF_FLAMES
	music Music_ThePoolOfRainDay,        $00, 100, CHAN1, 4 ; MUSIC_THE_POOL_OF_RAIN_DAY
	music Music_ThePoolOfRainNight,      $00, 100, CHAN1, 4 ; MUSIC_THE_POOL_OF_RAIN_NIGHT
	music Music_Credits,                 $00, 100, CHAN1, 4 ; MUSIC_CREDITS
	music Music_HotWario,                $00, 100, CHAN1, 3 ; MUSIC_HOT_WARIO
	music Music_FatWario,                $00, 100, CHAN1, 3 ; MUSIC_FAT_WARIO
	music Music_BouncyWario,             $00, 100, CHAN1, 3 ; MUSIC_BOUNCY_WARIO
	music Music_ZombieWario,             $00, 100, CHAN1, 2 ; MUSIC_ZOMBIE_WARIO
	music Music_FlatWario,               $00, 100, CHAN1, 3 ; MUSIC_FLAT_WARIO
	music Music_CrazyWario,              $00, 100, CHAN1, 3 ; MUSIC_CRAZY_WARIO
	music Music_InvisibleWario,          $00, 100, CHAN1, 3 ; MUSIC_INVISIBLE_WARIO
	music Music_SnowmanWario,            $00, 100, CHAN1, 3 ; MUSIC_SNOWMAN_WARIO
	music Music_OwlWario,                $00, 100, CHAN1, 3 ; MUSIC_OWL_WARIO
	music Music_BallOStringWario,        $00, 100, CHAN1, 2 ; MUSIC_BALL_O_STRING_WARIO
	music Music_VampireWario,            $00, 100, CHAN1, 3 ; MUSIC_VAMPIRE_WARIO
	music Music_OverworldDay,            $00, 100, CHAN1, 4 ; MUSIC_OVERWORLD_DAY
	music Music_OverworldNight,          $00, 100, CHAN1, 3 ; MUSIC_OVERWORLD_NIGHT
	music Music_LevelClearNoTreasure,    $00, 100, CHAN1, 3 ; MUSIC_LEVEL_CLEAR_NO_TREASURE
	music Music_TreasureFanfare,         $00, 100, CHAN1, 4 ; MUSIC_TREASURE_FANFARE
	music Music_PauseMenu,               $00, 100, CHAN1, 2 ; MUSIC_PAUSE_MENU
	music Music_Golf,                    $00, 100, CHAN1, 3 ; MUSIC_GOLF
	music Music_BossBattle,              $00, 100, CHAN1, 4 ; MUSIC_BOSS_BATTLE
	music Music_LevelClearGotTreasure,   $00, 100, CHAN1, 4 ; MUSIC_LEVEL_CLEAR_GOT_TREASURE
	music Music_BossDefeat,              $00, 100, CHAN1, 2 ; MUSIC_BOSS_DEFEAT
	music Music_GolfGameOver,            $00, 100, CHAN1, 3 ; MUSIC_GOLF_GAME_OVER
	music Music_GolfClear,               $00, 100, CHAN1, 4 ; MUSIC_GOLF_CLEAR
	music Music_MusicBoxes,              $00, 100, CHAN1, 3 ; MUSIC_MUSIC_BOXES
	music Music_BossReveal,              $00, 100, CHAN1, 2 ; MUSIC_BOSS_REVEAL
	music Music_ActionHelp,              $00, 100, CHAN1, 2 ; MUSIC_ACTION_HELP
	music Music_GolfLobby,               $00, 100, CHAN1, 4 ; MUSIC_GOLF_LOBBY
	music Music_GameOver,                $00, 100, CHAN1, 3 ; MUSIC_GAME_OVER
	music Music_MusicBoxCave,            $00, 100, CHAN1, 3 ; MUSIC_MUSIC_BOX_CAVE
	music Music_TheTemple,               $00, 100, CHAN1, 2 ; MUSIC_THE_TEMPLE
	music Music_TitleScreen,             $00, 100, CHAN1, 4 ; MUSIC_TITLE_SCREEN
	music Music_Intro,                   $00, 100, CHAN1, 3 ; MUSIC_INTRO
	music Music_HiddenFigureBattle1,     $00, 100, CHAN1, 4 ; MUSIC_HIDDEN_FIGURE_BATTLE_1
	music Music_Perfect,                 $00, 100, CHAN1, 4 ; MUSIC_PERFECT
	music Music_TreasureCollection,      $00, 100, CHAN1, 3 ; MUSIC_TREASURE_COLLECTION
	music Music_Epilogue,                $00, 100, CHAN1, 3 ; MUSIC_EPILOGUE
	music Music_HiddenFigureReveal,      $00, 100, CHAN1, 3 ; MUSIC_HIDDEN_FIGURE_REVEAL
	music Music_HiddenFigureBattle2,     $00, 100, CHAN1, 4 ; MUSIC_HIDDEN_FIGURE_BATTLE_2
	filler_sounds 198

	sfx Sfx_Jump,                        $00, 220, CHAN5, 1 ; SFX_JUMP
	sfx Sfx_GroundShake,                 $00, 237, CHAN8, 1 ; SFX_GROUND_SHAKE
	sfx Sfx_Bump,                        $00, 236, CHAN5, 1 ; SFX_BUMP
	sfx Sfx_Walk,                        $00, 226, CHAN8, 1 ; SFX_WALK
	sfx Sfx_BlockBreak,                  $00, 236, CHAN8, 1 ; SFX_BLOCK_BREAK
	sfx Sfx_006,                         $00, 236, CHAN8, 1 ; SFX_006
	sfx Sfx_Attack,                      $00, 235, CHAN8, 1 ; SFX_ATTACK
	sfx Sfx_AttackPoweredUp,             $00, 235, CHAN5, 2 ; SFX_ATTACK_POWERED_UP
	sfx Sfx_RegularCoin,                 $00, 235, CHAN5, 1 ; SFX_REGULAR_COIN
	sfx Sfx_Roll,                        $00, 230, CHAN5, 1 ; SFX_ROLL
	sfx Sfx_ZipLineSlide,                $00, 230, CHAN8, 1 ; SFX_ZIP_LINE_SLIDE
	sfx Sfx_Slide,                       $00, 237, CHAN5, 1 ; SFX_SLIDE
	sfx Sfx_Splash,                      $00, 235, CHAN5, 2 ; SFX_SPLASH
	sfx Sfx_00e,                         $00, 228, CHAN5, 1 ; SFX_00E
	sfx Sfx_00f,                         $00, 210, CHAN5, 1 ; SFX_00F
	sfx Sfx_Land,                        $00, 228, CHAN8, 1 ; SFX_LAND
	sfx Sfx_011,                         $00, 200, CHAN5, 1 ; SFX_011
	sfx Sfx_Recovery,                    $00, 255, CHAN5, 1 ; SFX_RECOVERY
	sfx Sfx_Sting,                       $00, 237, CHAN7, 1 ; SFX_STING
	sfx Sfx_014,                         $00, 239, CHAN5, 1 ; SFX_014
	sfx Sfx_Grab,                        $00, 210, CHAN5, 1 ; SFX_GRAB
	sfx Sfx_016,                         $00, 239, CHAN5, 1 ; SFX_016
	sfx Sfx_017,                         $00, 238, CHAN5, 2 ; SFX_017
	sfx Sfx_018,                         $00, 230, CHAN8, 1 ; SFX_018
	sfx Sfx_019,                         $00, 236, CHAN5, 1 ; SFX_THROW
	sfx Sfx_01a,                         $00, 239, CHAN7, 1 ; SFX_01A
	sfx Sfx_01b,                         $00, 220, CHAN5, 2 ; SFX_01B
	sfx Sfx_FlatWalk,                    $00, 200, CHAN5, 1 ; SFX_FLAT_WALK
	sfx Sfx_01d,                         $00, 220, CHAN5, 1 ; SFX_01D
	sfx Sfx_01e,                         $00, 221, CHAN8, 1 ; SFX_01E
	sfx Sfx_01f,                         $00, 228, CHAN8, 1 ; SFX_01F
	sfx Sfx_020,                         $00, 221, CHAN8, 1 ; SFX_020
	sfx Sfx_HangGrab,                    $00, 220, CHAN8, 1 ; SFX_HANG_GRAB
	sfx Sfx_022,                         $00, 229, CHAN5, 1 ; SFX_022
	sfx Sfx_023,                         $00, 220, CHAN5, 1 ; SFX_023
	sfx Sfx_024,                         $00, 236, CHAN5, 1 ; SFX_024
	sfx Sfx_025,                         $00, 240, CHAN5, 1 ; SFX_025
	sfx Sfx_PuffRaise,                   $00, 221, CHAN5, 1 ; SFX_PUFF_RAISE
	sfx Sfx_027,                         $00, 220, CHAN8, 1 ; SFX_027
	sfx Sfx_028,                         $00, 226, CHAN5, 1 ; SFX_028
	sfx Sfx_ZombieWalk,                  $00, 226, CHAN8, 1 ; SFX_ZOMBIE_WALK
	sfx Sfx_02a,                         $00, 226, CHAN8, 1 ; SFX_02A
	sfx Sfx_02b,                         $00, 220, CHAN5, 1 ; SFX_02B
	sfx Sfx_02c,                         $00, 220, CHAN5, 1 ; SFX_02C
	sfx Sfx_FullyChargedThrow,           $00, 220, CHAN5, 1 ; SFX_FULLY_CHARGED_THROW
	sfx Sfx_02e,                         $00, 232, CHAN5, 1 ; SFX_02E
	sfx Sfx_02f,                         $00, 236, CHAN5, 1 ; SFX_02F
	sfx Sfx_Pipe,                        $00, 220, CHAN5, 1 ; SFX_PIPE
	sfx Sfx_MusicalCoin,                 $00, 255, CHAN5, 2 ; SFX_MUSICAL_COIN
	sfx Sfx_Key,                         $00, 255, CHAN5, 2 ; SFX_KEY
	sfx Sfx_GroundPound,                 $00, 237, CHAN5, 1 ; SFX_GROUND_POUND
	sfx Sfx_034,                         $00, 237, CHAN5, 2 ; SFX_034
	sfx Sfx_035,                         $00, 221, CHAN8, 1 ; SFX_035
	sfx Sfx_Sleep,                       $00, 228, CHAN8, 1 ; SFX_SLEEP
	sfx Sfx_WaterSurface,                $00, 220, CHAN5, 1 ; SFX_WATER_SURFACE
	sfx Sfx_Climb,                       $00, 220, CHAN5, 2 ; SFX_CLIMB
	sfx Sfx_039,                         $00, 220, CHAN5, 1 ; SFX_039
	sfx Sfx_03a,                         $00, 220, CHAN5, 1 ; SFX_03A
	sfx Sfx_FatWalk,                     $00, 230, CHAN5, 1 ; SFX_FAT_WALK
	sfx Sfx_03c,                         $00, 220, CHAN5, 1 ; SFX_03C
	sfx Sfx_03d,                         $00, 220, CHAN5, 1 ; SFX_03D
	sfx Sfx_03e,                         $00, 220, CHAN5, 1 ; SFX_03E
	sfx Sfx_03f,                         $00, 220, CHAN5, 2 ; SFX_03F
	sfx Sfx_040,                         $00, 236, CHAN8, 1 ; SFX_040
	sfx Sfx_041,                         $00, 220, CHAN5, 1 ; SFX_041
	sfx Sfx_042,                         $00, 220, CHAN5, 1 ; SFX_042
	sfx Sfx_043,                         $00, 220, CHAN5, 1 ; SFX_043
	sfx Sfx_044,                         $00, 220, CHAN8, 1 ; SFX_044
	sfx Sfx_045,                         $00, 220, CHAN5, 3 ; SFX_045
	sfx Sfx_046,                         $00, 220, CHAN5, 3 ; SFX_046
	sfx Sfx_047,                         $00, 220, CHAN5, 1 ; SFX_047
	sfx Sfx_048,                         $00, 239, CHAN5, 2 ; SFX_048
	sfx Sfx_049,                         $00, 220, CHAN5, 1 ; SFX_049
	sfx Sfx_CrouchWalk,                  $00, 200, CHAN5, 1 ; SFX_CROUCH_WALK
	sfx Sfx_ColourCoin,                  $00, 240, CHAN5, 1 ; SFX_COLOUR_COIN
	sfx Sfx_04c,                         $00, 239, CHAN5, 2 ; SFX_04C
	filler_sounds 20

	sfx Sfx_061,                         $00, 239, CHAN8, 1 ; SFX_061
	sfx Sfx_062,                         $00, 237, CHAN8, 1 ; SFX_062
	sfx Sfx_063,                         $00, 239, CHAN8, 1 ; SFX_063
	sfx Sfx_064,                         $00, 220, CHAN5, 1 ; SFX_064
	sfx Sfx_065,                         $00, 221, CHAN8, 1 ; SFX_065
	sfx Sfx_066,                         $00, 220, CHAN5, 1 ; SFX_066
	sfx Sfx_067,                         $00, 220, CHAN5, 1 ; SFX_067
	sfx Sfx_068,                         $00, 220, CHAN8, 1 ; SFX_068
	sfx Sfx_069,                         $00, 220, CHAN5, 1 ; SFX_069
	sfx Sfx_06a,                         $00, 220, CHAN5, 1 ; SFX_06A
	sfx Sfx_06b,                         $00, 220, CHAN5, 1 ; SFX_06B
	sfx Sfx_06c,                         $00, 220, CHAN5, 1 ; SFX_06C
	sfx Sfx_06d,                         $00, 220, CHAN8, 1 ; SFX_06D
	sfx Sfx_06e,                         $00, 220, CHAN8, 1 ; SFX_06E
	sfx Sfx_06f,                         $00, 220, CHAN5, 1 ; SFX_06F
	sfx Sfx_070,                         $00, 220, CHAN5, 1 ; SFX_070
	sfx Sfx_071,                         $00, 220, CHAN8, 1 ; SFX_071
	sfx Sfx_072,                         $00, 220, CHAN8, 1 ; SFX_072
	sfx Sfx_073,                         $00, 227, CHAN8, 1 ; SFX_073
	sfx Sfx_074,                         $00, 221, CHAN5, 1 ; SFX_074
	sfx Sfx_075,                         $00, 220, CHAN5, 1 ; SFX_075
	sfx Sfx_076,                         $00, 235, CHAN8, 1 ; SFX_076
	sfx Sfx_077,                         $00, 220, CHAN7, 1 ; SFX_077
	sfx Sfx_078,                         $00, 240, CHAN8, 1 ; SFX_078
	sfx Sfx_079,                         $00, 227, CHAN8, 1 ; SFX_079
	sfx Sfx_07a,                         $00, 227, CHAN8, 1 ; SFX_07A
	sfx Sfx_07b,                         $00, 227, CHAN8, 1 ; SFX_07B
	sfx Sfx_07c,                         $00, 220, CHAN5, 2 ; SFX_07C
	sfx Sfx_07d,                         $00, 221, CHAN8, 1 ; SFX_07D
	sfx Sfx_07e,                         $00, 239, CHAN5, 1 ; SFX_07E
	sfx Sfx_07f,                         $00, 220, CHAN5, 1 ; SFX_07F
	sfx Sfx_080,                         $00, 220, CHAN8, 1 ; SFX_080
	sfx Sfx_081,                         $00, 227, CHAN5, 1 ; SFX_081
	sfx Sfx_082,                         $00, 220, CHAN5, 2 ; SFX_082
	sfx Sfx_083,                         $00, 220, CHAN5, 2 ; SFX_083
	sfx Sfx_084,                         $00, 220, CHAN5, 1 ; SFX_084
	sfx Sfx_085,                         $00, 220, CHAN7, 1 ; SFX_085
	sfx Sfx_086,                         $00, 220, CHAN5, 1 ; SFX_086
	sfx Sfx_087,                         $00, 220, CHAN8, 1 ; SFX_087
	sfx Sfx_088,                         $00, 220, CHAN5, 2 ; SFX_088
	sfx Sfx_089,                         $00, 227, CHAN8, 1 ; SFX_089
	sfx Sfx_08a,                         $00, 227, CHAN5, 2 ; SFX_08A
	sfx Sfx_08b,                         $00, 220, CHAN5, 1 ; SFX_08B
	sfx Sfx_08c,                         $00, 227, CHAN8, 1 ; SFX_08C
	sfx Sfx_08d,                         $00, 220, CHAN5, 1 ; SFX_08D
	sfx Sfx_08e,                         $00, 239, CHAN5, 1 ; SFX_08E
	sfx Sfx_08f,                         $00, 220, CHAN8, 1 ; SFX_08F
	filler_sounds 17

	sfx Sfx_0a1,                         $00, 234, CHAN8, 1 ; SFX_0A1
	sfx Sfx_0a2,                         $00, 234, CHAN5, 2 ; SFX_0A2
	sfx Sfx_0a3,                         $00, 239, CHAN5, 1 ; SFX_0A3
	sfx Sfx_0a4,                         $00, 239, CHAN7, 1 ; SFX_0A4
	sfx Sfx_0a5,                         $00, 220, CHAN5, 1 ; SFX_0A5
	sfx Sfx_0a6,                         $00, 220, CHAN7, 1 ; SFX_0A6
	sfx Sfx_0a7,                         $00, 239, CHAN7, 1 ; SFX_0A7
	sfx Sfx_0a8,                         $00, 239, CHAN5, 2 ; SFX_0A8
	sfx Sfx_0a9,                         $00, 239, CHAN7, 1 ; SFX_0A9
	sfx Sfx_0aa,                         $00, 239, CHAN5, 2 ; SFX_0AA
	sfx Sfx_0ab,                         $00, 239, CHAN5, 1 ; SFX_0AB
	sfx Sfx_0ac,                         $00, 239, CHAN5, 1 ; SFX_0AC
	sfx Sfx_0ad,                         $00, 220, CHAN5, 1 ; SFX_0AD
	sfx Sfx_0ae,                         $00, 220, CHAN5, 1 ; SFX_0AE
	sfx Sfx_0af,                         $00, 220, CHAN5, 1 ; SFX_0AF
	sfx Sfx_0b0,                         $00, 220, CHAN5, 2 ; SFX_0B0
	sfx Sfx_0b1,                         $00, 239, CHAN5, 1 ; SFX_0B1
	sfx Sfx_0b2,                         $00, 239, CHAN5, 2 ; SFX_0B2
	sfx Sfx_0b3,                         $00, 239, CHAN5, 1 ; SFX_0B3
	sfx Sfx_0b4,                         $00, 239, CHAN5, 1 ; SFX_0B4
	sfx Sfx_0b5,                         $00, 238, CHAN5, 2 ; SFX_0B5
	sfx Sfx_0b6,                         $00, 238, CHAN5, 2 ; SFX_0B6
	sfx Sfx_0b7,                         $00, 239, CHAN5, 2 ; SFX_0B7
	sfx Sfx_0b8,                         $00, 239, CHAN5, 2 ; SFX_0B8
	sfx Sfx_0b9,                         $00, 220, CHAN5, 1 ; SFX_0B9
	sfx Sfx_0ba,                         $00, 220, CHAN5, 2 ; SFX_0BA
	sfx Sfx_0bb,                         $00, 220, CHAN5, 2 ; SFX_0BB
	sfx Sfx_0bc,                         $00, 239, CHAN5, 1 ; SFX_0BC
	sfx Sfx_0bd,                         $00, 239, CHAN5, 1 ; SFX_0BD
	sfx Sfx_0be,                         $00, 239, CHAN7, 1 ; SFX_0BE
	sfx Sfx_0bf,                         $00, 239, CHAN7, 1 ; SFX_0BF
	sfx Sfx_0c0,                         $00, 239, CHAN7, 1 ; SFX_0C0
	sfx Sfx_0c1,                         $00, 238, CHAN5, 2 ; SFX_0C1
	sfx Sfx_0c2,                         $00, 230, CHAN5, 1 ; SFX_0C2
	sfx Sfx_0c3,                         $00, 219, CHAN5, 1 ; SFX_0C3
	sfx Sfx_0c4,                         $00, 220, CHAN5, 1 ; SFX_0C4
	sfx Sfx_0c5,                         $00, 220, CHAN5, 1 ; SFX_0C5
	sfx Sfx_0c6,                         $00, 220, CHAN5, 1 ; SFX_0C6
	sfx Sfx_0c7,                         $00, 239, CHAN5, 2 ; SFX_0C7
	sfx Sfx_0c8,                         $00, 220, CHAN5, 1 ; SFX_0C8
	sfx Sfx_0c9,                         $00, 220, CHAN5, 1 ; SFX_0C9
	sfx Sfx_0ca,                         $00, 240, CHAN5, 2 ; SFX_0CA
	sfx Sfx_0cb,                         $00, 239, CHAN8, 1 ; SFX_0CB
	sfx Sfx_0cc,                         $00, 220, CHAN5, 2 ; SFX_HIDDEN_FIGURE_LAUGH
	sfx Sfx_0cd,                         $00, 220, CHAN5, 3 ; SFX_0CD
	sfx Sfx_0ce,                         $00, 240, CHAN5, 2 ; SFX_0CE
	sfx Sfx_0cf,                         $00, 220, CHAN5, 2 ; SFX_0CF
	sfx Sfx_0d0,                         $00, 239, CHAN5, 1 ; SFX_0D0
	sfx Sfx_0d1,                         $00, 239, CHAN5, 2 ; SFX_0D1
	filler_sounds 15

	sfx Sfx_0e1,                         $00, 255, CHAN5, 1 ; SFX_0E1
	sfx Sfx_0e2,                         $00, 220, CHAN5, 1 ; SFX_0E2
	sfx Sfx_Selection,                   $00, 220, CHAN5, 1 ; SFX_SELECTION
	sfx Sfx_0e4,                         $00, 251, CHAN5, 1 ; SFX_0E4
	sfx Sfx_0e5,                         $00, 230, CHAN5, 2 ; SFX_0E5
	sfx Sfx_0e6,                         $00, 227, CHAN6, 1 ; SFX_0E6
	sfx Sfx_0e7,                         $00, 220, CHAN5, 1 ; SFX_0E7
	sfx Sfx_0e8,                         $00, 220, CHAN5, 1 ; SFX_0E8
	sfx Sfx_0e9,                         $00, 220, CHAN5, 1 ; SFX_0E9
	sfx Sfx_0ea,                         $00, 220, CHAN5, 1 ; SFX_0EA
	sfx Sfx_0eb,                         $00, 220, CHAN5, 2 ; SFX_0EB
	sfx Sfx_0ec,                         $00, 220, CHAN7, 1 ; SFX_0EC
	sfx Sfx_0ed,                         $00, 220, CHAN8, 1 ; SFX_0ED
	sfx Sfx_0ee,                         $00, 220, CHAN5, 1 ; SFX_0EE
	sfx Sfx_0ef,                         $00, 237, CHAN5, 1 ; SFX_0EF
	sfx Sfx_0f0,                         $00, 220, CHAN5, 1 ; SFX_0F0
	sfx Sfx_0f1,                         $00, 237, CHAN5, 1 ; SFX_0F1
	sfx Sfx_0f2,                         $00, 220, CHAN5, 1 ; SFX_0F2
	sfx Sfx_0f3,                         $00, 220, CHAN8, 1 ; SFX_0F3
	sfx Sfx_0f4,                         $00, 220, CHAN5, 1 ; SFX_0F4
	sfx Sfx_0f5,                         $00, 220, CHAN8, 1 ; SFX_0F5
	sfx Sfx_Plane1,                      $00, 220, CHAN8, 1 ; SFX_PLANE1
	sfx Sfx_Plane2,                      $00, 220, CHAN8, 1 ; SFX_PLANE2
	sfx Sfx_Plane3,                      $00, 220, CHAN8, 1 ; SFX_PLANE3
	sfx Sfx_PlaneExplosion,              $00, 220, CHAN8, 1 ; SFX_PLANE_EXPLOSION
	sfx Sfx_0fa,                         $00, 239, CHAN5, 3 ; SFX_0FA
	filler_sounds 6

	sfx Sfx_101,                         $00, 220, CHAN8, 1 ; SFX_101
	sfx Sfx_102,                         $00, 220, CHAN5, 1 ; SFX_102
	sfx Sfx_103,                         $00, 220, CHAN8, 1 ; SFX_103
	sfx Sfx_104,                         $00, 220, CHAN5, 1 ; SFX_104
	sfx Sfx_105,                         $00, 220, CHAN5, 2 ; SFX_105
	sfx Sfx_106,                         $00, 237, CHAN7, 1 ; SFX_106
	sfx Sfx_107,                         $00, 219, CHAN5, 1 ; SFX_107
	sfx Sfx_108,                         $00, 220, CHAN5, 1 ; SFX_108
	sfx Sfx_109,                         $00, 220, CHAN5, 2 ; SFX_109
	sfx Sfx_10a,                         $00, 220, CHAN8, 1 ; SFX_10A
	sfx Sfx_10b,                         $00, 220, CHAN5, 1 ; SFX_10B
	sfx Sfx_10c,                         $00, 220, CHAN8, 1 ; SFX_10C
	sfx Sfx_10d,                         $00, 236, CHAN5, 1 ; SFX_TEMPLE_ROCK
	sfx Sfx_10e,                         $00, 220, CHAN5, 2 ; SFX_10E
	sfx Sfx_10f,                         $00, 220, CHAN8, 1 ; SFX_10F
	sfx Sfx_110,                         $00, 220, CHAN5, 2 ; SFX_110
	sfx Sfx_111,                         $00, 220, CHAN8, 1 ; SFX_111
	sfx Sfx_112,                         $00, 220, CHAN5, 3 ; SFX_112
	sfx Sfx_113,                         $00, 220, CHAN5, 1 ; SFX_113
	sfx Sfx_114,                         $00, 220, CHAN8, 1 ; SFX_114
	sfx Sfx_115,                         $00, 220, CHAN8, 1 ; SFX_115
	sfx Sfx_116,                         $00, 220, CHAN8, 1 ; SFX_116
	sfx Sfx_117,                         $00, 220, CHAN5, 2 ; SFX_117
	sfx Sfx_118,                         $00, 220, CHAN5, 2 ; SFX_118
	sfx Sfx_119,                         $00, 220, CHAN5, 1 ; SFX_119
	sfx Sfx_11a,                         $00, 220, CHAN5, 1 ; SFX_11A
	sfx Sfx_11b,                         $00, 220, CHAN5, 2 ; SFX_11B
	sfx Sfx_11c,                         $00, 220, CHAN5, 1 ; SFX_11C
	sfx Sfx_11d,                         $00, 220, CHAN5, 1 ; SFX_11D
	sfx Sfx_11e,                         $00, 220, CHAN5, 2 ; SFX_11E
	sfx Sfx_11f,                         $00, 220, CHAN5, 2 ; SFX_11F
	sfx Sfx_120,                         $00, 220, CHAN5, 2 ; SFX_120
	sfx Sfx_121,                         $00, 220, CHAN5, 2 ; SFX_121
	sfx Sfx_122,                         $00, 220, CHAN5, 1 ; SFX_122
	sfx Sfx_123,                         $00, 220, CHAN5, 1 ; SFX_123
	sfx Sfx_124,                         $00, 220, CHAN8, 1 ; SFX_124
	sfx Sfx_125,                         $00, 220, CHAN8, 1 ; SFX_125
	sfx Sfx_126,                         $00, 220, CHAN8, 1 ; SFX_126
	sfx Sfx_127,                         $00, 220, CHAN6, 2 ; SFX_127
	sfx Sfx_128,                         $00, 220, CHAN5, 1 ; SFX_128
	sfx Sfx_129,                         $00, 239, CHAN8, 1 ; SFX_129
	sfx Sfx_12a,                         $00, 220, CHAN8, 1 ; SFX_12A
	sfx Sfx_12b,                         $00, 220, CHAN7, 1 ; SFX_12B
	sfx Sfx_12c,                         $00, 220, CHAN5, 2 ; SFX_12C
	sfx Sfx_12d,                         $00, 220, CHAN8, 1 ; SFX_12D
	sfx Sfx_12e,                         $00, 220, CHAN5, 4 ; SFX_12E
	sfx Sfx_12f,                         $00, 220, CHAN8, 1 ; SFX_12F
	sfx Sfx_130,                         $00, 220, CHAN8, 1 ; SFX_130
	sfx Sfx_131,                         $00, 220, CHAN8, 1 ; SFX_131
	sfx Sfx_132,                         $00, 220, CHAN5, 1 ; SFX_132
	sfx Sfx_133,                         $00, 220, CHAN7, 1 ; SFX_133
	sfx Sfx_134,                         $00, 220, CHAN5, 1 ; SFX_134
	sfx Sfx_135,                         $00, 220, CHAN5, 1 ; SFX_135
	sfx Sfx_136,                         $00, 236, CHAN6, 1 ; SFX_136
	sfx Sfx_137,                         $00, 226, CHAN8, 1 ; SFX_137
	sfx Sfx_138,                         $00, 220, CHAN8, 1 ; SFX_138
; 0x32726
