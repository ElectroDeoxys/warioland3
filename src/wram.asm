INCLUDE "macros.asm"
INCLUDE "constants.asm"

INCLUDE "vram.asm"

SECTION "WRAM0", WRAM0

w0Start:: ; c000

wTempPals1:: ; c000
	ds 8 palettes

wTempPals2:: ; c040
	ds 8 palettes

wBackupVBlankFunc:: ; c080
	ds $3

wTempSCY:: ; c083
	ds $1

	ds $1

wTempSCX:: ; c085
	ds $1

; intro background layers x offsets,
; that all scroll at different speeds
wIntroBGXOffsetFar:: ; c086
	ds $1
wIntroBGXOffsetCentre:: ; c087
	ds $1
wIntroBGXOffsetNear:: ; c088
	ds $1

wc089:: ; c089
	ds $1

wc08a:: ; c08a
	ds $1

wc08b:: ; c08b
	ds $1

wc08c:: ; c08c
	ds $1

wc08d:: ; c08d
	ds $1

wSRAMBank:: ; c08e
	ds $1

; ticks up by one every game loop
wGlobalCounter:: ; c08f
	ds $1

wc090:: ; c090
	ds $1

; whether VBlank function has been executed or not
; $0 false, $1 true
wVBlankFuncExecuted:: ; c091
	ds $1

; whether to run the VBlank function
; $0, don't run; $1 run
wEnableVBlankFunc:: ; c092
	ds $1

wJoypadDown:: ; c093
	ds $1

wJoypadPressed:: ; c094
	ds $1

; number of elements that wVirtualOAM holds
wNumOAMSprites:: ; c095
	ds $1

wCurSpriteYOffset:: ; c096
	ds $1

wCurSpriteXOffset:: ; c097
	ds $1

wCurSpriteFrame:: ; c098
	ds $1

wCurSpriteAttributes:: ; c099
	ds $1

; if TRUE, hard reset is not possible
wResetDisabled:: ; c09a
	ds $1

wSequence:: ; c09b
	ds $1

wSubSequence:: ; c09c
	ds $1

	ds $1

wTempIE:: ; c09e
	ds $1

wc09f:: ; c09f
	ds $1

wSpawnPointID:: ; c0a0
	ds $1

wSpawnPos:: ; c0a1
	ds $1

wc0a2:: ; c0a2
	ds $1

wc0a3:: ; c0a3
	ds $1

wc0a4:: ; c0a4
	ds $1

wc0a5:: ; c0a5
	ds $1

wc0a6:: ; c0a6
	ds $1

wc0a7:: ; c0a7
	ds $1

	ds $4

wTempBank:: ; c0ac
	ds $1

wCompressedLevelLayoutPtr:: ; c0ad
	ds $2

	ds $4

wc0b3:: ; c0b3
	ds $1

wc0b4:: ; c0b4
	ds $1

wc0b5:: ; c0b5
	ds $1

wc0b6:: ; c0b6
	ds $1

wc0b7:: ; c0b7
	ds $1

wc0b8:: ; c0b8
	ds $1

wc0b9:: ; c0b9
	ds $1

wc0ba:: ; c0ba
	ds $1

wc0bb:: ; c0bb
	ds $1

wc0bc:: ; c0bc
	ds $1

wc0bd:: ; c0bd
	ds $1

wc0be:: ; c0be
	ds $1

wc0bf:: ; c0bf
	ds $1

wc0c0:: ; c0c0
	ds $1

	ds $1

wc0c2:: ; c0c2
	ds $1

wc0c3:: ; c0c3
	ds $1

wc0c4:: ; c0c4
	ds $1

wc0c5:: ; c0c5
	ds $1

wc0c6:: ; c0c6
	ds $1

wc0c7:: ; c0c7
	ds $1

wEnemyGroup:: ; c0c8
	ds $1

wCurRoom:: ; c0c9
	ds $1

wRoomPermissionMap:: ; c0ca
	ds $1

wRoomTileMap:: ; c0cb
	ds $1

wRoomMainTiles:: ; c0cc
	ds $1

wRoomSpecialTiles:: ; c0cd
	ds $1

wRoomPalettes:: ; c0ce
	ds $1

wc0cf:: ; c0cf
	ds $1

wc0d0:: ; c0d0
	ds $1

wRoomMainTilesBank:: ; c0d1
	ds $1

wRoomSpecialTilesBank:: ; c0d2
	ds $1

wPaletteBank:: ; c0d3
	ds $1

wc0d4:: ; c0d4
	ds $1

wc0d5:: ; c0d5
	ds $1

wc0d6:: ; c0d6
	ds $1

wc0d7:: ; c0d7
	ds $1

wc0d8:: ; c0d8
	ds $1

wc0d9:: ; c0d9
	ds $1

wc0da:: ; c0da
	ds $1

; current position's interaction type with the water
; 0 = no water
; 1 = submersible water
; 2 = non-submersible water
wWaterInteraction:: ; c0db
	ds $1

wc0dc:: ; c0dc
	ds $1

wc0dd:: ; c0dd
	ds $1

wIsOnSlipperyGround:: ; c0de
	ds $1

	ds $1

wc0e0:: ; c0e0
	ds $1

wc0e1:: ; c0e1
	ds $1

wc0e2:: ; c0e2
	ds $1

wc0e3:: ; c0e3
	ds $1

wc0e4:: ; c0e4
	ds $1

	ds $1

wc0e6:: ; c0e6
	ds $1

	ds $19

wTempBGPals:: ; c100
	ds 8 palettes

wTempOBPals:: ; c140
	ds 8 palettes

; target rgb values for fading
wTargetRed:: ; c180
	ds $1

wTargetGreen:: ; c181
	ds $1

wTargetBlue:: ; c182
	ds $1

; current rgb values for color fade
wCurRGB:: ; c183
	ds $3

wc186:: ; c186
	ds $1

; keeps track of the fade amount, starting at 1
; when it reaches 32 + 1 (maximum amount of fade possible),
; fading is stopped
wPalFadeCounter:: ; c187
	ds $1

	ds $1

wIsStandingOnSlope:: ; c189
	ds $1

	ds $3

wc18d:: ; c18d
	ds $1

wc18e:: ; c18e
	ds $1

	ds $10

wc19f:: ; c19f
	ds $1

wc1a0:: ; c1a0
	ds $1

wc1a1:: ; c1a1
	ds $1

wc1a2:: ; c1a2
	ds $2

wc1a4:: ; c1a3
	ds $1

wc1a5:: ; c1a4
	ds $1

wc1a6:: ; c1a5
	ds $1

wc1a7:: ; c1a6
	ds $1

wAnimationHasFinished:: ; c1a8
	ds $1

wc1a9:: ; c1a9
	ds $1

wc1aa:: ; c1aa
	ds $1

wc1ab:: ; c1ab
	ds $1

wAnimatedTilesFrameDuration:: ; c1ac
	ds $1

wAnimatedTilesGroup:: ; c1ad
	ds $1

wAnimatedTilesFrame:: ; c1ae
	ds $1

wAnimatedTilesFrameCount:: ; c1af
	ds $1

wc1b0:: ; c1b0
	ds $1

wc1b1:: ; c1b1
	ds $1

wRoomAnimatedPals:: ; c1b2
	ds $2

wCurRoomAnimatedPal:: ; c1b4
	ds $1

wc1b5:: ; c1b5
	ds $1

; pointer to an object struct in wObjects
wObjPtr:: ; c1b6
	ds $2

wc1b8:: ; c1b8
	ds $1

; OBJ_INTERACTION_* constant for Func_20000
wObjInteractionType:: ; c1b9
	ds $1

wc1ba:: ; c1ba
	ds $1

wc1bb:: ; c1bb
	ds $1

wc1bc:: ; c1bc
	ds $1

wc1bd:: ; c1bd
	ds $1

wc1be:: ; c1be
	ds $1

wc1bf:: ; c1bf
	ds $1

wc1c0:: ; c1c0
	ds $1

wc1c1:: ; c1c1
	ds $1

wc1c2:: ; c1c2
	ds $1

wc1c3:: ; c1c3
	ds $1

wc1c4:: ; c1c4
	ds $1

	ds $1

wEnemyDirection:: ; c1c6
	ds $1

wLadderInteraction:: ; c1c7
	ds $1

wIsNearFence:: ; c1c8
	ds $1

wc1c9:: ; c1c9
	ds $1

wc1ca:: ; c1ca
	ds $1

	ds $35

; function called on V-Blank
wVBlankFunc:: ; c200
	ds $200

; function called on LCD
wLCDFunc:: ; c400
	ds $1ff

wROMBank:: ; c5ff
	ds $1

wc600:: ; c600
	ds $200

wc800:: ; c800
	ds $200

wca00:: ; ca00
	ds $1

	ds $3

wca04:: ; ca04
	ds $1

wca05:: ; ca05
	ds $1

; each level selectable in the overworld has 8 states
; divided by 2, which are the day and night variants
wLevel:: ; ca06
	ds $1

wca07:: ; ca07
	ds $32

wca39:: ; ca39
	ds $1

	ds $1

wca3b:: ; ca3b
	ds $1

; a POWER_UP_* constant
; this value is incremental which means that
; a Power Up level unlocks all levels before it
wPowerUpLevel:: ; ca3c
	ds $1

wca3d:: ; ca3d
	ds $1

	ds $4

wca42:: ; ca42
	ds $4

; $0 = Japanese
; $1 = English
wLanguage:: ; ca46
	ds $1

	ds $14

wca5b:: ; ca5b
	ds $1

wca5c:: ; ca5c
	ds $1

wca5d:: ; ca5d
	ds $1

wca5e:: ; ca5e
	ds $1

wca5f:: ; ca5f
	ds $1

wca60:: ; ca60
	ds $1

wPos::
wYPosHi:: ; ca61
	ds $1
wYPosLo:: ; ca62
	ds $1
wXPosHi:: ; ca63
	ds $1
wXPosLo:: ; ca64
	ds $1

wca65:: ; ca65
	ds $1

wca66:: ; ca66
	ds $1

wFrameDuration:: ; ca67
	ds $1

wca68:: ; ca68
	ds $1

; which way Wario is facing
; DIRECTION_LEFT  = 0
; DIRECTION_RIGHT = 1
wDirection:: ; ca69
	ds $1

wca6a:: ; ca6a
	ds $1

wca6b:: ; ca6b
	ds $1

wca6c:: ; ca6c
	ds $1

wca6d:: ; ca6d
	ds $1

wca6e:: ; ca6e
	ds $1

wca6f:: ; ca6f
	ds $1

wca70:: ; ca70
	ds $1

wca71:: ; ca71
	ds $1

wca72:: ; ca72
	ds $1

wca73:: ; ca73
	ds $1

; which table to use for jump velocities
; JUMP_VEL_* constant
wJumpVelTable:: ; ca74
	ds $1

; the index of the jump velocity value
; corresponding to wJumpVelTable
wJumpVelIndex:: ; ca75
	ds $1

wca76:: ; ca76
	ds $1

; whether Wario is jumping upwards or not
; used to check if the player can still
; gain height while holding down the jump button
wJumpingUpwards:: ; ca77
	ds $1

wca78:: ; ca78
	ds $1

; palette pointer
wWarioPalsPtr:: ; ca79
	ds $2

wca7b:: ; ca7b
	ds $1

wca7c:: ; ca7c
	ds $2

wOAMBank:: ; ca7e
	ds $1

wOAMPtr:: ; ca7f
	ds $2

wFramesetPtr:: ; ca81
	ds $2

; a STATE_* constant, corresponding
; to Wario's current state
wWarioState:: ; ca83
	ds $1

; increments every frame
; that Wario is in some state
wWarioStateCounter:: ; ca84
	ds $1

; counts how many times wWarioStateCounter overflows
; used for knowing how long Wario is some state
wWarioStateCycles:: ; ca85
	ds $1

wca86:: ; ca86
	ds $1

wWarioScreenYPos:: ; ca87
	ds $1

wWarioScreenXPos:: ; ca88
	ds $1

wca89:: ; ca89
	ds $1

wca8a:: ; ca8a
	ds $1

wca8b:: ; ca8b
	ds $1

wca8c:: ; ca8c
	ds $1

wca8d:: ; ca8d
	ds $1

wca8e:: ; ca8e
	ds $1

wca8f:: ; ca8f
	ds $1

wca90:: ; ca90
	ds $1

wca91:: ; ca91
	ds $1

wca92:: ; ca92
	ds $1

wca93:: ; ca93
	ds $1

wca94:: ; ca94
	ds $1

wca95:: ; ca95
	ds $1

wIsSmashAttacking:: ; ca96
	ds $1

wca97:: ; ca97
	ds $1

wca98:: ; ca98
	ds $1

wca99:: ; ca99
	ds $1

wca9a:: ; ca9a
	ds $1

wca9b:: ; ca9b
	ds $1

wca9c:: ; ca9c
	ds $1

wca9d:: ; ca9d
	ds $1

; counter to keep track of number of times
; Wario needs to "wiggle" to escape being picked up
; is reset to NUM_WIGGLES_TO_ESCAPE
wPickedUpWiggleCounter:: ; ca9e
	ds $1

; counter determining number of remaining frames
; Wario has to wiggle out of being picked up
; counts down from MAX_PICKED_UP_FRAME_COUNTER
; then resets after reaching 0
wPickedUpFrameCounter:: ; ca9f
	ds $1

wIsInSand:: ; caa0
	ds $1

wcaa1:: ; caa1
	ds 4 palettes

wcac1:: ; cac1
	ds $1

wcac2:: ; cac2
	ds $1

wcac3:: ; cac3
	ds $1

wcac4:: ; cac4
	ds $1

wcac5:: ; cac5
	ds $1

wcac6:: ; cac6
	ds $1

wcac7:: ; cac7
	ds $1

wcac8:: ; cac8
	ds $1

wcac9:: ; cac9
	ds $1

	ds $136

wVirtualOAM:: ; cc00
wVirtualOAMSprite00:: sprite_oam_struct wVirtualOAMSprite00
wVirtualOAMSprite01:: sprite_oam_struct wVirtualOAMSprite01
wVirtualOAMSprite02:: sprite_oam_struct wVirtualOAMSprite02
wVirtualOAMSprite03:: sprite_oam_struct wVirtualOAMSprite03
wVirtualOAMSprite04:: sprite_oam_struct wVirtualOAMSprite04
wVirtualOAMSprite05:: sprite_oam_struct wVirtualOAMSprite05
wVirtualOAMSprite06:: sprite_oam_struct wVirtualOAMSprite06
wVirtualOAMSprite07:: sprite_oam_struct wVirtualOAMSprite07
wVirtualOAMSprite08:: sprite_oam_struct wVirtualOAMSprite08
wVirtualOAMSprite09:: sprite_oam_struct wVirtualOAMSprite09
wVirtualOAMSprite10:: sprite_oam_struct wVirtualOAMSprite10
wVirtualOAMSprite11:: sprite_oam_struct wVirtualOAMSprite11
wVirtualOAMSprite12:: sprite_oam_struct wVirtualOAMSprite12
wVirtualOAMSprite13:: sprite_oam_struct wVirtualOAMSprite13
wVirtualOAMSprite14:: sprite_oam_struct wVirtualOAMSprite14
wVirtualOAMSprite15:: sprite_oam_struct wVirtualOAMSprite15
wVirtualOAMSprite16:: sprite_oam_struct wVirtualOAMSprite16
wVirtualOAMSprite17:: sprite_oam_struct wVirtualOAMSprite17
wVirtualOAMSprite18:: sprite_oam_struct wVirtualOAMSprite18
wVirtualOAMSprite19:: sprite_oam_struct wVirtualOAMSprite19
wVirtualOAMSprite20:: sprite_oam_struct wVirtualOAMSprite20
wVirtualOAMSprite21:: sprite_oam_struct wVirtualOAMSprite21
wVirtualOAMSprite22:: sprite_oam_struct wVirtualOAMSprite22
wVirtualOAMSprite23:: sprite_oam_struct wVirtualOAMSprite23
wVirtualOAMSprite24:: sprite_oam_struct wVirtualOAMSprite24
wVirtualOAMSprite25:: sprite_oam_struct wVirtualOAMSprite25
wVirtualOAMSprite26:: sprite_oam_struct wVirtualOAMSprite26
wVirtualOAMSprite27:: sprite_oam_struct wVirtualOAMSprite27
wVirtualOAMSprite28:: sprite_oam_struct wVirtualOAMSprite28
wVirtualOAMSprite29:: sprite_oam_struct wVirtualOAMSprite29
wVirtualOAMSprite30:: sprite_oam_struct wVirtualOAMSprite30
wVirtualOAMSprite31:: sprite_oam_struct wVirtualOAMSprite31
wVirtualOAMSprite32:: sprite_oam_struct wVirtualOAMSprite32
wVirtualOAMSprite33:: sprite_oam_struct wVirtualOAMSprite33
wVirtualOAMSprite34:: sprite_oam_struct wVirtualOAMSprite34
wVirtualOAMSprite35:: sprite_oam_struct wVirtualOAMSprite35
wVirtualOAMSprite36:: sprite_oam_struct wVirtualOAMSprite36
wVirtualOAMSprite37:: sprite_oam_struct wVirtualOAMSprite37
wVirtualOAMSprite38:: sprite_oam_struct wVirtualOAMSprite38
wVirtualOAMSprite39:: sprite_oam_struct wVirtualOAMSprite39
wVirtualOAMEnd::

wcca0:: unk3_struct wcca0 ; cca0
wccb0:: unk3_struct wccb0 ; ccb0
wccc0:: unk3_struct wccc0 ; ccc0
wccd0:: unk3_struct wccd0 ; ccd0

wcce0:: ; cce0
	ds $1

wcce1:: ; cce1
	ds $1

	ds $5

wcce7:: ; cce7
	ds $1

wcce8:: ; cce8
	ds $1

; each y section is divided in 20-cell high slices
; this stores the floor number of the current position
wFloorNum:: ; cce9
	ds $1

; the world is divided in a grid,
; with each cell being 16x16 units in dimension
; these store the y and x cells of the current position
wYCell:: ; ccea
	ds $1
wXCell:: ; cceb
	ds $1

wccec:: ; ccec
	ds $1

wSpawnYCell:: ; cced
	ds $1

wSpawnXCell:: ; ccee
	ds $1

wccef:: ; ccef
	ds $1

wccf0:: ; ccf0
	ds $1

wccf1:: ; ccf1
	ds $1

	ds $e

wPermissionMap:: ; cd00
	ds $42

	ds $be

wce00:: ; ce00
	ds $1

wce01:: ; ce01
	ds $1

	ds $33

wce35:: ; ce35
	ds $20

	ds $14

wce69:: ; ce69
	ds $1

wce6a:: ; ce6a
	ds $1

	ds $67

wced2:: ; ced2
	ds $1

wced3:: ; ced3
	ds $1

; which screen to fade out to for level end
; LEVEL_END_* constant
wLevelEndScreen:: ; ced4
	ds $1

wced5:: ; ced5
	ds $1

wced6:: ; ced6
	ds $1

; the speed in which to perform fading between palettes
; uses a FADE_SPEED_* constant
wFadeSpeed:: ; ced7
	ds $1

wRoomAnimatedTilesEnabled:: ; ced8
	ds $1

wRoomAnimatedPalsEnabled:: ; ced9
	ds $1

wceda:: ; ceda
	ds $1

wcedb:: ; cedb
	ds $1

wcedc:: ; cedc
	ds $1

wcedd:: ; cedd
	ds $1

wcede:: ; cede
	ds $1

	ds $1

wcee0:: ; cee0
	ds $1

wcee1:: ; cee1
	ds $1

wcee2:: ; cee2
	ds $1

wcee3:: ; cee3
	ds $1

wcee4:: ; cee4
	ds $1

; used in the Intro Sequence
; to time various events such as
; when the intro music starts playing, etc
wIntroSeqTimer:: ; cee5
	ds $2

wcee7:: ; cee7
	ds $1

wcee8:: ; cee8
	ds $1

wcee9:: ; cee9
	ds $1

wceea:: ; ceea
	ds $1

wceeb:: ; ceeb
	ds $1

wceec:: ; ceec
	ds $1

; used to control SFX looping
; every frame 1 is subtracted
; when it reaches 0 it plays SFX
; then it's reset to loop duration
wSFXLoopCounter:: ; ceed
	ds $1

wceee:: ; ceee
	ds $1

wceef:: ; ceef
	ds $1

wcef0:: ; cef0
	ds $1

wcef1:: ; cef1
	ds $1

SECTION "WRAM1", WRAMX

wObjects::
wObj1:: obj_struct wObj1 ; d000
wObj2:: obj_struct wObj2 ; d020
wObj3:: obj_struct wObj3 ; d040
wObj4:: obj_struct wObj4 ; d060
wObj5:: obj_struct wObj5 ; d080
wObj6:: obj_struct wObj6 ; d0a0
wObj7:: obj_struct wObj7 ; d0c0
wObj8:: obj_struct wObj8 ; d0e0

wCurObj:: obj_struct wCurObj ; d100

; pointers related to LoadEnemyGroupData
w1d120:: ; d120
	ds $2

w1d122:: ; d122
	ds $2

w1d124:: ; d124
	ds $2

w1d126:: ; d126
	ds $2

w1d128:: ; d128
	ds $2

w1d12a:: ; d12a
	ds $2

w1d12c:: ; d12c
	ds $2

w1d12e:: ; d12e
	ds $2

w1d130:: ; d130
	ds $2

w1d132:: ; d132
	ds $2

w1d134:: ; d134
	ds $2

w1d136:: ; d136
	ds $2

w1d138:: ; d138
	ds $2

w1d13a:: ; d13a
	ds $2

w1d13c:: ; d13c
	ds $2

w1d13e:: ; d13e
	ds $2

w1d140:: ; d140
	ds $1

w1d141:: ; d141
	ds $1

w1d142:: ; d142
	ds $1

w1d143:: ; d143
	ds $1

wNumShootGoals:: ; d144
	ds $1

w1d145:: ; d145
	ds $1

	ds $4

w1d14a:: ; d14a
	ds $1


SECTION "WRAM2", WRAMX

w2d000:: ; d000
	ds $1

	ds $a

w2d00b:: ; d00b
	ds $2

w2d00d:: ; d00d
	ds $1

w2d00e:: ; d00e
	ds $1

w2d00f:: ; d00f
	ds $1

	ds $2

w2d012:: ; d012
	ds $1

w2d013:: ; d013
	ds $1

w2d014:: ; d014
	ds $1

	ds $1

w2d016:: ; d016
	ds $1

w2d017:: ; d017
	ds $1

	ds $3

w2d01b:: ; d01b
	ds $1

	ds $1

w2d01d:: ; d01d
	ds $1

w2d01e:: ; d01e
	ds $1

	ds $3

w2d022:: ; d022
	ds $1

w2d023:: ; d023
	ds $1

w2d024:: ; d024
	ds $1

w2d025:: ; d025
	ds $1

w2d026:: ; d026
	ds $1

w2d027:: ; d027
	ds $1

w2d028:: ; d028
	ds $1

	ds $27

w2d050:: ; d050
	ds $1

	ds $6

w2d057:: ; d057
	ds $1

	ds $8

w2d060:: ; d060
	ds $1

	ds $18

w2d079:: ; d079
	ds $1

	ds $36

wHDMA:: ; d0b0
	ds $5

	ds $1b

w2d0d0:: ; d0d0
	ds $5

w2d0d5:: ; d5d5
	ds $1

w2d0d6:: ; d6d6
	ds $5

w2d0db:: ; d6db
	ds $1

	ds $14

wLevelTreasureIDs::
wLevelTreasure0ID:: ds $1 ; d0f0
wLevelTreasure1ID:: ds $1 ; d0f1
wLevelTreasure2ID:: ds $1 ; d0f2
wLevelTreasure3ID:: ds $1 ; d0f3

wLevelTreasure0Unk:: ds $1 ; d0f4
wLevelTreasure1Unk:: ds $1 ; d0f5
wLevelTreasure2Unk:: ds $1 ; d0f6
wLevelTreasure3Unk:: ds $1 ; d0f7

	ds $48

w2d140:: ; d140
	ds $1

	ds $3

w2d144:: ; d144
	ds $2

w2d146:: ; d146
	ds $1

	ds $1

w2d148:: ; d148
	ds $1

w2d149:: ; d149
	ds $1

w2d14a:: ; d14a
	ds $1

w2d14b:: ; d14b
	ds $1

w2d14c:: ; d14c
	ds $1

	ds $b

w2d158:: ; d158
	ds $1

	ds $27

w2d180:: ; d180
	ds $4

w2d184:: ; d184
	ds $4

w2d188:: ; d188
	ds $1

	ds $7

w2d190:: ; d190
	ds $2

	ds $2

w2d194:: ; d194
	ds $2

w2d196:: ; d196
	ds $2

w2d198:: ; d198
	ds $2

	ds $2

w2d19c:: ; d19c
	ds $2

w2d19e:: ; d19e
	ds $2

w2d1a0:: ; d1a0
	ds $2

	ds $2

w2d1a4:: ; d1a4
	ds $2

w2d1a6:: ; d1a6
	ds $2

	ds $658

w2d800:: ; d800
	ds $1

w2d801:: ; d801
	ds $1

	ds $286

w2da88:: ; da88
	ds $1

	ds $f7

w2db80:: ; db80
	ds $1

	ds $7f

wTreasureTiles:: ; dc00
	ds 16 tiles

SECTION "Audio RAM", WRAMX

; bit 5: ???
; bit 6: whether to invoke audio callback function
; bit 7: ???
wAudioEngineFlags:: ; d000
	ds $1

wAudioBankBackup:: ; d001
	ds $1

	ds $1

wAudioBankCallback:: ; d003
	ds $2

wSFXTempo:: ; d005
	ds $1

w3d006:: ; d006
	ds $1

w3d007:: ; d007
	ds $1

w3d008:: ; d008
	ds $2

wMusicTempo:: ; d00a
	ds $1

w3d00b:: ; d00b
	ds $1

w3d00c:: ; d00c
	ds $1

w3d00d:: ; d00d
	ds $2

wNumAudioChannels:: ; d00f
	ds $1

; points to one of channel_struct
wCurChannelPtr:: ; d010
	ds $2

wNumTracks:: ; d012
	ds $1

wCurTrackPtr:: ; d013
	ds $2

; low byte of a sound register:
; sound1 = rNR12
; sound2 = rNR22
; sound3 = rNR32
; sound4 = rNR42
wCurSoundRegister:: ; d015
	ds $1

	ds $1

wAudioCmdPtr:: ; d017
	ds $2

; channel Flags1
w3d019:: ; d019
	ds $1

w3d01a:: ; d01a
	ds $1

wLoadedMusic:: ; d01b
	ds $2

wCurWaveSample:: ; d01d
	ds $1

wVibratoValue:: ; d01e
	ds $1

wAudioCmdArg:: ; d01f
	ds $1

w3d020:: ; d020
	ds $1

w3d021:: ; d021
	ds $1

w3d022:: ; d022
	ds $1

	ds $1

; each bit represents whether a channel is active/inactive
; bit 0: MusicChannel1
; bit 1: MusicChannel2
; ...
wActiveChannels:: ; d024
	ds $1

w3d025:: ; d025
	ds $1

wSoundBank:: ; d026
	ds $1

	ds $11

wCurSoundID:: ; d038
	ds $2

w3d03a:: ; d03a
	ds $1

w3d03b:: ; d03b
	ds $1

wNumChannels:: ; d03c
	ds $1

	ds $1

wSoundPriority:: ; d03e
	ds $1

wStartChannel:: ; d03f
	ds $1

wChannels::
wChannel1:: channel_struct wChannel1 ; d040
wChannel2:: channel_struct wChannel2 ; d07c
wChannel3:: channel_struct wChannel3 ; d0b8
wChannel4:: channel_struct wChannel4 ; d0f4

wMusicChannels::
wChannel5:: channel_struct wChannel5 ; d130
wChannel6:: channel_struct wChannel6 ; d16c
wChannel7:: channel_struct wChannel7 ; d1a8
wChannel8:: channel_struct wChannel8 ; d1e4

wTracks::
wTrack1:: track_struct wTrack1 ; d220
wTrack2:: track_struct wTrack2 ; d238
wTrack3:: track_struct wTrack3 ; d250
wTrack4:: track_struct wTrack4 ; d268

w3d280:: ; d280
	ds 16 palettes

w3d300:: ; d300
	ds $200

w3d500:: ; d500
	ds $1

w3d501:: ; d501
	ds $1

	ds $b

w3d50d:: ; d50d
	ds $1

	ds $2

w3d510:: ; d510
	ds $1

w3d511:: ; d511
	ds $1

	ds $1

wStartMenuSelection:: ; d513
	ds $1

wObjAnimWasReset:: ; d514
	ds $1

wWarioPlane:: wario_plane wWarioPlane ; d515

	ds $2

; whether the animation of the plane
; in the Intro sequence has ended
wPlaneAnimationEnded:: ; d520
	ds $1

	ds $1

wIntroSeqSFXTimer:: ; d522
	ds $1

wIntroObj0:: intro_obj_struct wIntroObj0 ; d523
wIntroObj1:: intro_obj_struct wIntroObj1 ; d52b
wIntroObj2:: intro_obj_struct wIntroObj2 ; d533
wIntroObj3:: intro_obj_struct wIntroObj3 ; d53b

	ds $4

wIntroObj4:: intro_obj_struct wIntroObj4 ; d547

SECTION "WRAM4", WRAMX

w4d000:: ; d000
	ds $1000

SECTION "WRAM5", WRAMX

w5d000:: ; d000
	ds $1000

SECTION "WRAM6", WRAMX

w6d000:: ; d000
	ds $1000

SECTION "WRAM7", WRAMX

w7d000:: ; d000
	ds $1000

INCLUDE "sram.asm"
