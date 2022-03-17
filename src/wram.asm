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

wSCY:: ; c083
	ds $1

wc084:: ; c084
	ds $1

wSCX:: ; c085
	ds $1

; intro background layers x offsets,
; that all scroll at different speeds
wIntroBGXOffsetFar::    ds $1 ; c086
wIntroBGXOffsetCentre:: ds $1 ; c087
wIntroBGXOffsetNear::   ds $1 ; c088

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

; size of wVirtualOAM in number of bytes
wVirtualOAMByteSize:: ; c095
	ds $1

wCurSprite:: sprite_oam_struct wCurSprite ; c096

; if TRUE, hard reset is not possible
wResetDisabled:: ; c09a
	ds $1

wState:: ; c09b
	ds $1

wSubState:: ; c09c
	ds $1

	ds $1

wTempIE:: ; c09e
	ds $1

wc09f:: ; c09f
	ds $1

wInternalRoomID:: ; c0a0
	ds $1

; low nybble = x pos
; high nybble = y pos
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

wCameraConfigFlags:: ; c0ba
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

wRoom::                 ds $1 ; c0c9
wRoomPermissionMap::    ds $1 ; c0ca
wRoomTileMap::          ds $1 ; c0cb
wRoomMainTiles::        ds $1 ; c0cc
wRoomSpecialTiles::     ds $1 ; c0cd
wRoomPalettes::         ds $1 ; c0ce
wRoomPermissionMapBank::                 ds $1 ; c0cf
wc0d0::                 ds $1 ; c0d0
wRoomMainTilesBank::    ds $1 ; c0d1
wRoomSpecialTilesBank:: ds $1 ; c0d2

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

wIsBossBattle:: ; c0e6
	ds $1

	ds $19

wTempBGPals:: ; c100
	ds 8 palettes

wTempOBPals:: ; c140
	ds 8 palettes

; target rgb values for fading
wTargetRed::   ds $1 ; c180
wTargetGreen:: ds $1 ; c181
wTargetBlue::  ds $1 ; c182

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

	ds $2

wc18c:: ; c18c
	ds $1

wc18d:: ; c18d
	ds $1

wc18e:: ; c18e
	ds $1

	ds $10

wc19f:: ; c19f
	ds $1

wIsDMATransferPending::      ds $1 ; c1a0
wPendingDMASourceBank::      ds $1 ; c1a1
wPendingDMASourcePtr::       ds $2 ; c1a2
wPendingDMADestinationBank:: ds $1 ; c1a3
wPendingDMADestinationPtr::  ds $2 ; c1a4
wPendingDMALength::          ds $1 ; c1a6

wAnimationHasFinished:: ; c1a8
	ds $1

wFloorTransitionTimer:: ; c1a9
	ds $1

; bit 2 set = transitioning downwards
; bit 3 set = transitioning upwards
wFloorTransitionDir:: ; c1aa
	ds $1

wAnimatedTilesGroup::         ds $1 ; c1ab
wAnimatedTilesFrameDuration:: ds $1 ; c1ac
wAnimatedTilesGfx::           ds $1 ; c1ad
wAnimatedTilesFrame::         ds $1 ; c1ae
wAnimatedTilesFrameCount::    ds $1 ; c1af

; counter is incremented each time the room pals are updated
; when it reaches wRoomPalCycleDuration, the cycle advances
; to the next index and counter value is reset
; see UpdateRoomAnimatedPals
wRoomPalCycle::         ds $1 ; c1b0
wRoomPalCycleDuration:: ds $1 ; c1b1
wRoomPalCyclePtr::      ds $2 ; c1b2
wRoomPalCycleIndex::    ds $1 ; c1b4
wRoomPalCycleCounter::  ds $1 ; c1b5

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

wObjScreenYPos:: ; c1be
	ds $1

wObjScreenXPos:: ; c1bf
	ds $1

wInteractionSide:: ; c1c0
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
	ds $4

; number of coins collected
; it's in big endian decimal form
wNumCoins:: ; ca04
	ds $2

; each level selectable in the overworld has 8 states
; divided by 2, which are the day and night variants
wLevel:: ; ca06
	ds $1

; digits are represented in each nybble
; the first byte holds the tens and ones digits
; for the minute value, and the second byte
; holds the tens and ones digits for seconds
wLevelTimeAttackScores:: ; ca07
	ds 2 * NUM_LEVELS

; stores total number of treasures collected
; byte 1 lo nybble = hundreds
; byte 2 hi nybble = tens
; byte 2 lo nybble = ones
wNumberCollectedTreasures:: ; ca39
	ds $2

; bit 0: unset is day, set is night
; bit 1: whether it's Time Attack mode
wca3b:: ; ca3b
	ds $1

; a POWER_UP_* constant
; this value is incremental which means that
; a Power Up level unlocks all levels before it
wPowerUpLevel:: ; ca3c
	ds $1

wGameModeFlags:: ; ca3d
	ds $1

; flag set means that all the Musical Coins
; in that level have been collected
wMusicalCoinFlags:: ; ca3e
	ds (NUM_LEVELS / 8) + 1

wGolfBestScores:: ; ca42
	ds NUM_GOLF_COURSES

; $0 = Japanese
; $1 = English
wLanguage:: ; ca46
	ds $1

	ds $14

; collected keys in the level
; bit 0: grey key
; bit 1: red key
; bit 2: green key
; bit 3: blue key
; collected treasures in the level
; bit 4: grey treasure
; bit 5: red treasure
; bit 6: green treasure
; bit 7: blue treasure
wKeyAndTreasureFlags:: ; ca5b
	ds $1

wNumMusicalCoins:: ; ca5c
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
wYPosHi:: ds $1 ; ca61
wYPosLo:: ds $1 ; ca62
wXPosHi:: ds $1 ; ca63
wXPosLo:: ds $1 ; ca64

wca65:: ; ca65
	ds $1

wca66:: ; ca66
	ds $1

wFrameDuration:: ; ca67
	ds $1

wAnimationFrame:: ; ca68
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

wIsFloorTransition:: ; ca73
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

; each y section is divided in 20-cell high slices
; this stores the floor number of the current position
wFloor:: ; ca78
	ds $1

; palette pointer
wWarioPalsPtr:: ; ca79
	ds $2

wDMASourceBank:: ; ca7b
	ds $1

wDMASourcePtr:: ; ca7c
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

wAttackCounter:: ; ca89
	ds $1

; whether objects can interact with Wario
wIsIntangible:: ; ca8a
	ds $1

wIsCrouching:: ; ca8b
	ds $1

wInvincibleCounter:: ; ca8c
	ds $1

wInvisibleFrame:: ; ca8d
	ds $1

; lower 5 bits: TRANSFORMATION_* constant
wTransformation:: ; ca8e
	ds $1

wca8f:: ; ca8f
	ds $1

; duration left for current transformation
; big endian
wTransformationDuration:: ; ca90
	ds $2

; a TOUCH_* constant that determines
; how Wario interacts with objects
; that would normally sting them
; this is used to override the normal stinging action
wStingTouchState:: ; ca92
	ds $1

; a TOUCH_* constant that determines
; how Wario interacts with objects
; TOUCH_NONE: normal interaction
; TOUCH_VULNERABLE: clears current transformation
; TOUCH_BUMP: makes object bump
; TOUCH_ATTACK: acts as a regular attack
; TOUCH_VANISH: vanishes object
; TOUCH_PASS_THROUGH: does not interact horizontally
wTouchState:: ; ca93
	ds $1

wca94:: ; ca94
	ds $1

wIsTurningMidAir:: ; ca95
	ds $1

wIsSmashAttacking:: ; ca96
	ds $1

wGroundShakeCounter:: ; ca97
	ds $1

; whether Wario is causing ground shaking
wIsWarioGroundShaking:: ; ca98
	ds $1

wIsGettingOffLadder:: ; ca99
	ds $1

; Wario's grabbing state
; lower 4 bits is GRAB_* constant
; bit 7: heavy object
wGrabState:: ; ca9a
	ds $1

wAutoMoveState:: ; ca9b
	ds $1

wca9c:: ; ca9c
	ds $1

wIsRolling:: ; ca9d
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

; whether the level's Mini-Game
; has already been cleared
wIsMinigameCleared:: ; cac1
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

wIsOnSteppableObject:: ; cac9
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

wParticles::
wParticle1:: particle_struct wParticle1 ; cca0
wParticle2:: particle_struct wParticle2 ; ccb0
wParticle3:: particle_struct wParticle3 ; ccc0
wParticle4:: particle_struct wParticle4 ; ccd0

; how many particles are active now
wNumParticles:: ; cce0
	ds $1

; this particle will be overwritten
; when the next one is created
wCurParticleIndex:: ; cce1
	ds $1

wCurParticle:: sprite_oam_struct wCurParticle ; cce2
wCurParticleAnimFinished:: ds $1 ; cce6

wcce7:: ; cce7
	ds $1

wcce8:: ; cce8
	ds $1

wFloorSRAMBank:: ; cce9
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
	ds $2

	ds $e

wPermissionMap:: ; cd00
	ds $42

	ds $be

wce00:: ; ce00
	ds $1

wce01:: ; ce01
	ds $2

	ds $32

wce35:: ; ce35
	ds $20

	ds $14

wce69:: ; ce69
	ds $1

wce6a:: ; ce6a
	ds $2

wce6c:: ; ce6c
	ds $2

	ds $64

wced2:: ; ced2
	ds $1

wced3:: ; ced3
	ds $1

; which screen to fade out to for level end
; LVLEND_* constant
wLevelEndScreen:: ; ced4
	ds $1

wPendingSubState:: ; ced5
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

wTransitionParam:: ; cee3
	ds $1

wcee4:: ; cee4
	ds $1

; used to time various events in
; Intro/Credits/other sequences
wTimer:: ; cee5
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

	ds $e

w0End:: ; cf00

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

	ds $6b5


SECTION "Golf RAM", WRAMX

; start of the whole Golf RAM
wGolfRAMStart::

w1d800:: ; d800
	ds $1

wGolfMenuOption:: ; d801
	ds $1

wPredeterminedGolfLevel:: ; d802
	ds $1

w1d803:: ; d803
	ds $1

; GOLF_COURSE_* constant
wGolfCourse:: ; d804
	ds $1

; current score in the gold course being played
wGolfCourseScore:: ; d805
	ds $1

	ds $fa

; start of the RAM related to the Golf levels
wGolfLevelRAMStart::

w1d900:: ; d900
	ds 16 tiles

w1da00:: ; da00
	ds $100

w1db00:: ; db00
	ds 8 palettes

wGolfLevelData::
wGolfTerrainBlocks:: ds NUM_GOLF_LEVEL_BLOCKS ; db40
wGolfPar::           ds $1 ; db81
w1db82::             ds $2 ; db82
wGolfWaterSpawn1::   ds $1 ; db84
wGolfWaterSpawn2::   ds $1 ; db85
wGolfLevelDataEnd::

	ds $a

w1db90:: ; db90
	ds 4 tiles

	ds $30

w1dc00:: ; dc00
WGolfLobbyState:: ; dc00
WGolfLevelState:: ; dc00
	ds $1

w1dc01:: ; dc01
	ds $1

wGolfVBlankMode:: ; dc02
	ds $1

wHasAllMusicalCoinFlags:: ; dc03
	ds $1

	ds $5

wGolfAnimLastFrame:: ; dc09
	ds $1

; keeps track of several counters
wGolfCounter:: ; dc0a
	ds $1

w1dc0b:: ; dc0b
	ds $1

w1dc0c:: ; dc0c
	ds $1

wGolfWarioTilesBank:: ; dc0d
	ds $1

w1dc0e:: ; dc0e
	ds $1

wGolfPrice:: ; dc0f
	ds $1

	ds $1

wdc11:: ; dc11
wGolfWarioTilesPtr:: ; dc11
	ds $2

w1dc13:: ; dc13
	ds $1

	ds $3

wGolfOAMPtr:: ; dc17
	ds $2

; number of coins to be displayed
; in the Golf Lobby screen
wGolfNumCoins:: ; dc19
	ds $2

	ds $5

w1dc20:: ; dc20
	ds $1

w1dc21:: ; dc21
	ds $1

; current stroke number
wGolfStroke:: ; dc22
	ds $1

wGolfMaxStrokes:: ; dc23
	ds $1

wGolfResult:: ; dc24
	ds $1

w1dc25:: ; dc25
	ds $1

; GOLF_DISPLAY_* constant
wGolfDisplayMode:: ; dc26
	ds $1

; $0 = right
; $1 = left
wGolfMenuScrollingDir:: ; dc27
wGolfLevelScrollingDir:: ; dc27
	ds $1

; which side of the Para-Goomba that the hole is in
; $0 = to the right
; $1 = to the left
wGolfHoleDirection:: ; dc28
	ds $1

wShotDirection:: ; dc29
	ds $1

wHasGolfWarioAnimationFinished:: ; dc2a
	ds $1

	ds $1

wGolfXScroll:: ; dc2c
	ds $2

wGolfMenuTargetSCX:: ; dc2e
wTempGolfXScroll:: ; dc2e
	ds $2

wGolfWarioYPos:: ds $2 ; dc30
wGolfWarioXPos:: ds $2 ; dc32

wGolfParaGoomYPos:: ds $2 ; dc34
wGolfParaGoomXPos:: ds $2 ; dc36

wGolfLevelHoleXPos:: ds $2 ; dc38

; position of Para-Goom when it was last shot
; used to reset position when, e.g. going in OB
wLastGolfParaGoomYPos:: ds $2 ; dc3a
wLastGolfParaGoomXPos:: ds $2 ; dc3c

w1dc3e:: ; dc3e
	ds $2

wGolfWarioTargetXPos:: ; dc40
	ds $2

wGolfWarioDir:: ; dc42
	ds $1

	ds $1

; can either be low byte of
; PARAGOOM_GROUND_LEVEL or PARAGOOM_TEE_BOX_LEVEL
; the ground level y position proper is considered
; to be $1xx, where xx is this value
wGroundLevelYPos:: ; dc44
	ds $1

wGolfTerrain:: ; dc45
	ds $1

wShotTerrainModifier:: ; dc46
	ds $1

; used to check whether the Para-Goom
; has already left the Tee Box
w1dc47:: ; dc47
	ds $1

; golf terrain of where Para-Goom was shot from
wStrokeGolfTerrain:: ; dc48
	ds $1

; which way the Power Gauge is flowing
; FALSE = rising
; TRUE = falling
wIsPowerGaugeFalling:: ; dc49
	ds $1

wShotPowerGaugeCursor:: ; dc4a
	ds $1

wShotPowerLevel:: ; dc4b
	ds $1

wSelectedShotPowerGauge:: ; dc4c
	ds $1

wShotSpin:: ; dc4d
	ds $1

wGolfWarioYVel:: ; dc4e
wShotYVel:: ; dc4e
	ds $1

w1dc4f:: ; dc4f
	ds $1

wShotXVel:: ; dc50
	ds $1

w1dc51:: ; dc51
	ds $1

	ds $1

w1dc53:: ; dc53
	ds $1

wGolfObj1:: golf_obj_struct wGolfObj1 ; dc54
wGolfObj2:: golf_obj_struct wGolfObj2 ; dc5c
wGolfObj3:: golf_obj_struct wGolfObj3 ; dc64
wGolfObj4:: golf_obj_struct wGolfObj4 ; dc6c
wGolfObj5:: golf_obj_struct wGolfObj5 ; dc74

wGolfParaGoom:: golf_obj_struct wGolfParaGoom ; dc7c
wGolfWario:: golf_obj_struct wGolfWario ; dc84

wGolfOverlayText:: golf_obj_struct wGolfOverlayText ; dc8c
wGolfParaGoomGhost:: golf_obj_struct wGolfParaGoomGhost ; dc94

	ds $364

wGolfRAMEnd::


SECTION "WRAM2", WRAMX

wTreasuresCollected:: ; d000
	ds (NUM_TREASURES / 8) + 1

w2d00d:: ; d00d
	ds $1

w2d00e:: ; d00e
	ds $1

; LEVEL_* constant
wOWLevel:: ; d00f
	ds $1

	ds $1

w2d011:: ; d011
	ds $1

wNextMapSide:: ; d012
	ds $1

w2d013:: ; d013
	ds $1

w2d014:: ; d014
	ds $1

w2d015:: ; d015
	ds $1

w2d016:: ; d016
	ds $1

w2d017:: ; d017
	ds $1

w2d018:: ; d018
	ds $1

w2d019:: ; d019
	ds $1

; MAP_* constant
wCurMapSide:: ; d01a
	ds $1

wLastTransitionParam:: ; d01b
	ds $1

	ds $1

wMapSideLevelIndex:: ; d01d
	ds $1

w2d01e:: ; d01e
	ds $1

w2d01f:: ; d01f
	ds $1

wGotSunMedallion:: ; d020
	ds $1

	ds $1

w2d022:: ; d022
	ds $1

w2d023:: ; d023
	ds $1

; $00 when OW object animation is ongoing
; $ff when it reset
wOWAnimationFinished:: ; d024
	ds $1

w2d025:: ; d025
	ds $1

w2d026:: ; d026
	ds $2

w2d028:: ; d028
	ds $1

w2d029:: ; d029
	ds $1

w2d02a:: ; d02a
	ds $2

w2d02c:: ; d02c
	ds $1

	ds $3

w2d030:: ; d030
	ds $1

w2d031:: ; d031
	ds $1

w2d032:: ; d032
	ds $1

w2d033:: ; d033
	ds $1

w2d034:: ; d034
	ds $1

w2d035:: ; d035
	ds $1

w2d036:: ; d036
	ds $1

w2d037:: ; d037
	ds $1

w2d038:: ; d038
	ds $1

w2d039:: ; d039
	ds $1

w2d03a:: ; d03a
	ds $1

w2d03b:: ; d03b
	ds $1

w2d03c:: ; d03c
	ds $1

w2d03d:: ; d03d
	ds $1

w2d03e:: ; d03e
	ds $1

w2d03f:: ; d03f
	ds $1

w2d040:: ; d040
	ds $1

w2d041:: ; d041
	ds $1

w2d042:: ; d042
	ds $1

w2d043:: ; d043
	ds $1

w2d044:: ; d044
	ds $2

w2d046:: ; d046
	ds $1

w2d047:: ; d047
	ds $1

w2d048:: ; d048
	ds $1

w2d049:: ; d049
	ds $1

	ds $6

; $0 = hidden
; $1 = turning visible
wTopBarState:: ; d050
	ds $1

w2d051:: ; d051
	ds $1

	ds $1

; 0: Day/Night spell
; 1: Cutscene
; 2: Collection
; 3: Next map
; 4: Prev map
wTopBarSelection:: ; d053
	ds $1

wTopBarSelectableButtons:: ; d054
	ds $1

w2d055:: ; d055
	ds $1

w2d056:: ; d056
	ds $1

; which crayons have been collected
; each bit corresponds to CRAYON_*
wCrayonFlags:: ; d057
	ds $1

wCollectionPage:: ; d058
	ds $1

wCollectionCell:: ; d059
	ds $1

	ds $6

w2d060:: ; d060
	ds $1

w2d061:: ; d061
	ds $1

w2d062:: ; d062
	ds $1

w2d063:: ; d063
	ds $2

w2d065:: ; d065
	ds $1

w2d066:: ; d066
	ds $1

w2d067:: ; d067
	ds $1

w2d068:: ; d068
	ds $1

w2d069:: ; d069
	ds $1

w2d06a:: ; d06a
	ds $1

w2d06b:: ; d06b
	ds $1

w2d06c:: ; d06c
	ds $1

w2d06d:: ; d06d
	ds $1

w2d06e:: ; d06e
	ds $1

w2d06f:: ; d06f
	ds $1

w2d070:: ; d070
	ds $1

w2d071:: ; d071
	ds $1

w2d072:: ; d072
	ds $1

w2d073:: ; d073
	ds $1

w2d074:: ; d074
	ds $1

w2d075:: ; d075
	ds $1

w2d076:: ; d076
	ds $1

; CUTSCENE_* constant
wCutscene:: ; d077
	ds $1

w2d078:: ; d078
	ds $1

wHDMABank:: ; d079
	ds $1

wAccessibleMapSides:: ; d07a
	ds $1

wIsCollectionOpen:: ; d07b
	ds $1

w2d07c:: ; d07c
	ds $1

w2d07d:: ; d07d
	ds $1

	ds $1

w2d07f:: ; d07f
	ds $1

w2d080:: ; d080
	ds $1

w2d081:: ; d081
	ds $1

w2d082:: ; d082
	ds $2

	ds $2

w2d086:: ; d086
	ds $2

	ds $8

wHasMagnifyingGlass:: ; d090
	ds $1

; BOTBAR_* constant
wBottomBarAction:: ; d091
	ds $1

wBottomBarState:: ; d092
	ds $1

wMagnifyingGlassCounter:: ; d093
	ds $1

wWY:: ; d094
	ds $1

wWX:: ; d095
	ds $1

w2d096:: ; d096
	ds $1

	ds $9

w2d0a0:: ; d0a0
	ds $1

w2d0a1:: ; d0a1
	ds $1

w2d0a2:: ; d0a2
	ds $1

w2d0a3:: ; d0a3
	ds $1

w2d0a4:: ; d0a4
	ds $1

w2d0a5:: ; d0a5
	ds $1

w2d0a6:: ; d0a6
	ds $1

w2d0a7:: ; d0a7
	ds $1

w2d0a8:: ; d0a8
	ds $1

	ds $7

wHDMA::  hdma_config_struct wHDMA ; d0b0
w2d0b5:: hdma_config_struct w2d0b5 ; d0b5

	ds $6

	
w2d0c0:: ; d0dc0
	ds $10

wPalConfig1:: pal_config_struct wPalConfig1 ; d0d0

w2d0d5:: ; d0d5
	ds $1

wPalConfig2:: pal_config_struct wPalConfig2 ; d0d6

w2d0db:: ; d0db
	ds $1

w2d0dc:: ; d0dc
	ds $1

w2d0dd:: ; d0dd
	ds $1

	ds $2

w2d0e0:: ; d0e0
	ds $1

w2d0e1:: ; d0e1
	ds $1

w2d0e2:: ; d0e2
	ds $1

w2d0e3:: ; d0e3
	ds $1

w2d0e4:: ; d0e4
	ds $1

w2d0e5:: ; d0e5
	ds $1

	ds $8

w2d0ee:: ; d0ee
	ds $1

w2d0ef:: ; d0ef
	ds $1

wLevelTreasureIDs::
wLevelGreyTreasureID::  ds $1 ; d0f0
wLevelRedTreasureID::   ds $1 ; d0f1
wLevelGreenTreasureID:: ds $1 ; d0f2
wLevelBlueTreasureID::  ds $1 ; d0f3

wLevelGreyTreasurePal::  ds $1 ; d0f4
wLevelRedTreasurePal::   ds $1 ; d0f5
wLevelGreenTreasurePal:: ds $1 ; d0f6
wLevelBlueTreasurePal::  ds $1 ; d0f7

	ds $2

wBottomBarFlags:: ; d0fa
	ds $1

	ds $1

wBottomBarTreasureIDs:: ; d0fc
	ds NUM_LEVEL_TREASURES

w2d100:: ; d100
	ds $1

w2d101:: ; d101
	ds $1

	ds $2

w2d104:: ; d104
	ds $2

w2d106:: ; d106
	ds $1

; some sprite pointer
w2d107:: ; d107
	ds $2

; some frameset pointer
w2d109:: ; d109
	ds $2

wOWAllowedDPadInput:: ; d10b
	ds $1

w2d10c:: ; d10c
	ds $1

w2d10d:: ; d10d
	ds $1

w2d10e:: ; d10e
	ds $1

	ds $1

wCompassSprite:: sprite_oam_struct wCompassSprite ; d110

w2d114:: ; d114
	ds $2

w2d116:: ; d116
	ds $1

w2d117:: ; d117
	ds $1

	ds $6

wCurSceneObj:: ; d11e
	ds $2

	ds $4

w2d124:: ; d124
	ds $1

w2d125:: ; d125
	ds $1

	ds $4

w2d12a:: ; d12a
	ds $1

w2d12b:: ; d12b
	ds $1

w2d12c:: ; d12c
	ds $1

	ds $1

w2d12e:: ; d12e
	ds $1

w2d12f:: ; d12f
	ds $1

	ds $10

w2d140:: ; d140
	ds $1

w2d141:: ; d141
	ds $1

w2d142:: ; d142
	ds $1

w2d143:: ; d143
	ds $1

w2d144:: ; d144
	ds $2

w2d146:: ; d146
	ds $1

w2d147:: ; d147
	ds $1

w2d148:: ; d148
	ds $1

w2d149:: ; d149
	ds $2

w2d14b:: ; d14b
	ds $1

w2d14c:: ; d14c
	ds $1

w2d14d:: ; d14d
	ds $1

w2d14e:: ; d14e
	ds $1

	ds $1

w2d150:: ; d150
	ds $1

w2d151:: ; d151
	ds $1

w2d152:: ; d152
	ds $1

	ds $5

wHDMADestVRAMBank:: ; d158
	ds $1

	ds $7

w2d160:: ; d160
	ds $8

	ds $18

w2d180:: scene_obj_struct w2d180 ; d180

wSceneObj1::  scene_obj_struct wSceneObj1  ; d188
wSceneObj2::  scene_obj_struct wSceneObj2  ; d190
wSceneObj3::  scene_obj_struct wSceneObj3  ; d198
wSceneObj4::  scene_obj_struct wSceneObj4  ; d1a0
wSceneObj5::  scene_obj_struct wSceneObj5  ; d1a8
wSceneObj6::  scene_obj_struct wSceneObj6  ; d1b0
wSceneObj7::  scene_obj_struct wSceneObj7  ; d1b8
wSceneObj8::  scene_obj_struct wSceneObj8  ; d1c0
wSceneObj9::  scene_obj_struct wSceneObj9  ; d1c8
wSceneObj10:: scene_obj_struct wSceneObj10 ; d1d0
wSceneObj11:: scene_obj_struct wSceneObj11 ; d1d8
wSceneObj12:: scene_obj_struct wSceneObj12 ; d1e0
wSceneObj13:: scene_obj_struct wSceneObj13 ; d1e8
wSceneObj14:: scene_obj_struct wSceneObj14 ; d1f0
wSceneObj15:: scene_obj_struct wSceneObj15 ; d1f8

wAttrmap:: ; d200
	ds $300

wTilemap:: ; d500
	ds $300

UNION

w2d800:: ; d800
	ds $1

w2d801:: ; d801
	ds $1

w2d802:: ; d802
	ds $1

w2d803:: ; d803
	ds $1

w2d804:: ; d804
	ds $1

	ds $1

w2d806:: ; d806
	ds $1

w2d807:: ; d807
	ds $1

w2d808:: ; d808
	ds $1

w2d809:: ; d809
	ds $1

	ds $6

w2d810:: ; d810
	ds $70

w2d880:: ; d880
	ds $9

w2d889:: ; d889
	ds $2

w2d88b:: ; d88b
	ds $1

	ds $2

w2d88e:: ; d88e
	ds $1

w2d88f:: ; d88f
	ds $1

w2d890:: ; d890
	ds $1

w2d891:: ; d891
	ds $1

w2d892:: ; d892
	ds $1

w2d893:: ; d893
	ds $1

w2d894:: ; d894
	ds $1

	ds $b

w2d8a0:: ; d8a0
	ds $1

w2d8a1:: ; d8a1
	ds $1

w2d8a2:: ; d8a2
	ds $1

w2d8a3:: ; d8a3
	ds $1

w2d8a4:: ; d8a4
	ds $1

w2d8a5:: ; d8a5
	ds $1

w2d8a6:: ; d8a6
	ds $1

w2d8a7:: ; d8a7
	ds $1

w2d8a8:: ; d8a8
	ds $1

w2d8a9:: ; d8a9
	ds $1

	ds $6

w2d8b0:: ; d8b0
	ds $1

w2d8b1:: ; d8b1
	ds $1

	ds $1ce

w2da80:: ; da80
	ds $1

w2da81:: ; da81
	ds $1

w2da82:: ; da82
	ds $1

w2da83:: ; da83
	ds $1

w2da84:: ; da84
	ds $1

w2da85:: ; da85
	ds $1

	ds $2

w2da88:: ; da88
	ds $2

w2da8a:: ; da8a
	ds $1

w2da8b:: ; da8b
	ds $1

	ds $74

w2db00:: ; db00
	ds 4 tiles

	ds $40

w2db80:: ; db80
	ds 8 tiles

wTreasureTiles:: ; dc00
	ds 16 tiles

	ds $2fd

w2dffd:: ; dffd
	ds $1

w2dffe:: ; dffe
	ds $1

w2dfff:: ; dfff
	ds $1

NEXTU

wCollectionRow:: ; d800
	ds $1

wCollectionCol:: ; d801
	ds $1

wCollectionLinkState:: ; d802
	ds $1

wCollectionLinkStateCounter:: ; d803
	ds $1

wCollectionScrollMode:: ; d804
	ds $1

	ds $b

; set of treasures that are
; linked together
wCollectionLinkedCells:: ; d810
	ds $7

ENDU

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

SECTION "GFX RAM", WRAMX

w3d280:: ; d280
	ds 16 palettes

w3d300:: ; d300
	ds $200

w3d500:: ; d500
	ds $1

w3d501:: ; d501
	ds $1

wDPadRepeatCounter:: ; d502
	ds $1

w3d503:: ; d503
	ds $1

w3d504:: ; d504
	ds $2

w3d506:: ; d506
	ds $1

w3d507:: ; d507
	ds $2

; if TRUE, Action Help is in
; the initial blacked out state
wActionHelpBlackedOut:: ; d509
	ds $1

; counts up for each frame in Action Help
wActionHelpCounter:: ; d50a
	ds $1

wActionHelpPowerUp:: ; d50b
	ds $1

wActionHelpState:: ; d50c
	ds $1

w3d50d:: ; d50d
	ds $1

; if TRUE, don't update the animations
; in the Action Help
wActionHelpFrozen:: ; d50e
	ds $1

wTempAnimatedTilesFrameDuration:: ; d50f
	ds $1

wTempAnimatedTilesGroup:: ; d510
	ds $1

w3d511:: ; d511
	ds $2

wStartMenuSelection:: ; d513
wPauseMenuSelection:: ; d513
	ds $1

wObjAnimWasReset:: ; d514
	ds $1

UNION

wActionHelpWarioObj:: menu_obj_struct wActionHelpWarioObj ; d515

wActionHelpWarioJumpVelIndex:: ; d51d
	ds $1

wActionHelpWarioOAMPtr:: ; d51e
	ds $2

wActionHelpWarioAnimationEnded:: ; d520
	ds $1

wActionHelpWarioOAMBank:: ; d521
	ds $1

NEXTU

wWarioPlaneObj:: menu_obj_struct wWarioPlaneObj ; d515
wWarioPlaneState:: ds $1 ; d51d

	ds $2

; whether the animation of the plane
; in the Intro sequence has ended
wPlaneAnimationEnded:: ; d520
	ds $1
ENDU

wSFXTimer:: ; d522
	ds $1

wMenuObj1:: menu_obj_struct wMenuObj1 ; d523
wMenuObj2:: menu_obj_struct wMenuObj2 ; d52b
wMenuObj3:: menu_obj_struct wMenuObj3 ; d533

wMenuObj4:: menu_obj_struct wMenuObj4 ; d53b
wMenuObj4OAMPtr::               ds $2 ; d543
wMenuObj4FramesetBank::         ds $1 ; d545
wMenuObj4AnimationHasFinished:: ds $1 ; d546

wMenuObj5:: menu_obj_struct wMenuObj5 ; d547
wMenuObj5OAMPtr::               ds $2 ; d54f
wMenuObj5FramesetBank::         ds $1 ; d551
wMenuObj5AnimationHasFinished:: ds $1 ; d552

wMenuObj6:: menu_obj_struct wMenuObj6 ; d553
wMenuObj6OAMPtr::               ds $2 ; d55b
wMenuObj6FramesetBank::         ds $1 ; d55d

wMenuObj7:: menu_obj_struct wMenuObj7 ; d55e
wMenuObj7OAMPtr::               ds $2 ; d566
wMenuObj7FramesetBank::         ds $1 ; d568
wMenuObj7AnimationHasFinished:: ds $1 ; d569

wMenuObj8::  menu_obj_struct wMenuObj8  ; d56a
wMenuObj9::  menu_obj_struct wMenuObj9  ; d572
wMenuObj10:: menu_obj_struct wMenuObj10 ; d57a
wMenuObj11:: menu_obj_struct wMenuObj11 ; d582

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
