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
	db

wCreditsPage:: ; c084
	db

wSCX:: ; c085
	db

; intro background layers x offsets,
; that all scroll at different speeds
wIntroBGXOffsetFar::    db ; c086
wIntroBGXOffsetCentre:: db ; c087
wIntroBGXOffsetNear::   db ; c088

wc089:: ; c089
	db

wc08a:: ; c08a
	db

wc08b:: ; c08b
	db

wc08c:: ; c08c
	db

wc08d:: ; c08d
	db

wSRAMBank:: ; c08e
	db

; ticks up by one every game loop
wGlobalCounter:: ; c08f
	db

wc090:: ; c090
	db

; whether VBlank function has been executed or not
; $0 false, $1 true
wVBlankFuncExecuted:: ; c091
	db

; whether to run the VBlank function
; $0, don't run; $1 run
wEnableVBlankFunc:: ; c092
	db

wJoypadDown:: ; c093
	db

wJoypadPressed:: ; c094
	db

; size of wVirtualOAM in number of bytes
wVirtualOAMByteSize:: ; c095
	db

wCurSprite:: sprite_oam_struct wCurSprite ; c096

; if TRUE, hard reset is not possible
wResetDisabled:: ; c09a
	db

wState:: ; c09b
	db

wSubState:: ; c09c
	db

	db

wTempIE:: ; c09e
	db

wc09f:: ; c09f
	db

wInternalRoomID:: ; c0a0
	db

; low nybble = x pos
; high nybble = y pos
wSpawnPos:: ; c0a1
	db

wc0a2:: ; c0a2
	db

wc0a3:: ; c0a3
	db

wc0a4:: ; c0a4
	db

wc0a5:: ; c0a5
	db

wc0a6:: ; c0a6
	db

wc0a7:: ; c0a7
	db

	ds $4

wTempBank:: ; c0ac
	db

wCompressedLevelLayoutPtr:: ; c0ad
	dw

	ds $4

wc0b3:: ; c0b3
	db

wc0b4:: ; c0b4
	db

wc0b5:: ; c0b5
	db

wc0b6:: ; c0b6
	db

wc0b7:: ; c0b7
	db

wc0b8:: ; c0b8
	db

wc0b9:: ; c0b9
	db

wCameraConfigFlags:: ; c0ba
	db

wc0bb:: ; c0bb
	db

wc0bc:: ; c0bc
	db

wc0bd:: ; c0bd
	db

wc0be:: ; c0be
	db

wc0bf:: ; c0bf
	db

wc0c0:: ; c0c0
	db

	db

wc0c2:: ; c0c2
	db

wc0c3:: ; c0c3
	db

wc0c4:: ; c0c4
	db

wc0c5:: ; c0c5
	db

wc0c6:: ; c0c6
	db

wc0c7:: ; c0c7
	db

wEnemyGroup:: ; c0c8
	db

wRoom::                 db ; c0c9
wRoomPermissionMap::    db ; c0ca
wRoomTileMap::          db ; c0cb
wRoomMainTiles::        db ; c0cc
wRoomSpecialTiles::     db ; c0cd
wRoomPalettes::         db ; c0ce
wRoomPermissionMapBank:: db ; c0cf
wc0d0::                 db ; c0d0
wRoomMainTilesBank::    db ; c0d1
wRoomSpecialTilesBank:: db ; c0d2

wPaletteBank:: ; c0d3
	db

wc0d4:: ; c0d4
	db

wc0d5:: ; c0d5
	db

wc0d6:: ; c0d6
	db

wc0d7:: ; c0d7
	db

wc0d8:: ; c0d8
	db

wc0d9:: ; c0d9
	db

wc0da:: ; c0da
	db

; current position's interaction type with the water
; 0 = no water
; 1 = submersible water
; 2 = non-submersible water
wWaterInteraction:: ; c0db
	db

wc0dc:: ; c0dc
	db

wc0dd:: ; c0dd
	db

wIsOnSlipperyGround:: ; c0de
	db

	db

wc0e0:: ; c0e0
	db

wc0e1:: ; c0e1
	db

; byte 1 = minutes
; byte 2 = seconds
; byte 3 = frames (60 fps, so 60 here is 1 second)
wLevelTime:: ; c0e2
	ds 3

wTimeAttackResult:: ; c0e5
	db

wIsBossBattle:: ; c0e6
	db

wAllMusicalCoinsLevel:: ; c0e7
	db

wc0e8:: ; c0e8
	db

	ds $17

wTempBGPals:: ; c100
	ds 8 palettes

wTempOBPals:: ; c140
	ds 8 palettes

; target rgb values for fading
wTargetRed::   db ; c180
wTargetGreen:: db ; c181
wTargetBlue::  db ; c182

; current rgb values for color fade
wCurRGB:: ; c183
	ds $3

wc186:: ; c186
	db

; keeps track of the fade amount, starting at 1
; when it reaches 32 + 1 (maximum amount of fade possible),
; fading is stopped
wPalFadeCounter:: ; c187
	db

	db

; bit 0: slope right
; bit 1: slope left
wIsStandingOnSlope:: ; c189
	db

	ds $2

wc18c:: ; c18c
	db

wc18d:: ; c18d
	db

wc18e:: ; c18e
	db

	ds $f

wc19e:: ; c19e
	db

wc19f:: ; c19f
	db

wIsDMATransferPending::      db ; c1a0
wPendingDMASourceBank::      db ; c1a1
wPendingDMASourcePtr::       dw ; c1a2
wPendingDMADestinationBank:: db ; c1a3
wPendingDMADestinationPtr::  dw ; c1a4
wPendingDMALength::          db ; c1a6

wAnimationEnded:: ; c1a8
	db

wFloorTransitionTimer:: ; c1a9
	db

; bit 2 set = transitioning downwards
; bit 3 set = transitioning upwards
wFloorTransitionDir:: ; c1aa
	db

wAnimatedTilesGroup::         db ; c1ab
wAnimatedTilesFrameDuration:: db ; c1ac
wAnimatedTilesGfx::           db ; c1ad
wAnimatedTilesFrame::         db ; c1ae
wAnimatedTilesFrameCount::    db ; c1af

; counter is incremented each time the room pals are updated
; when it reaches wRoomPalCycleDuration, the cycle advances
; to the next index and counter value is reset
; see UpdateRoomAnimatedPals
wRoomPalCycle::         db ; c1b0
wRoomPalCycleDuration:: db ; c1b1
wRoomPalCyclePtr::      dw ; c1b2
wRoomPalCycleIndex::    db ; c1b4
wRoomPalCycleCounter::  db ; c1b5

; pointer to an object struct in wObjects
wObjPtr:: ; c1b6
	dw

wc1b8:: ; c1b8
	db

; OBJ_INTERACTION_* constant for Func_20000
wObjInteractionType:: ; c1b9
	db

wc1ba:: ; c1ba
	db

wc1bb:: ; c1bb
	db

wc1bc:: ; c1bc
	db

wc1bd:: ; c1bd
	db

wObjScreenYPos:: db ; c1be
wObjScreenXPos:: db ; c1bf

wInteractionSide:: ; c1c0
	db

wc1c1:: ; c1c1
	db

wc1c2:: ; c1c2
	db

wc1c3:: ; c1c3
	db

wc1c4:: ; c1c4
	db

	db

wEnemyDirection:: ; c1c6
	db

wLadderInteraction:: ; c1c7
	db

wIsNearFence:: ; c1c8
	db

wc1c9:: ; c1c9
	db

wc1ca:: ; c1ca
	db

	ds $35

; function called on V-Blank
wVBlankFunc:: ; c200
	ds $200

; function called on LCD
wLCDFunc:: ; c400
	ds $1ff

wROMBank:: ; c5ff
	db

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
	db

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
wNumCollectedTreasures:: ; ca39
	ds $2

; MODE_* constant
wca3b:: ; ca3b
	db

; a POWER_UP_* constant
; this value is incremental which means that
; a Power Up level unlocks all levels before it
wPowerUpLevel:: ; ca3c
	db

; MODE_* constant
wGameModeFlags:: ; ca3d
	db

; flag set means that all the Musical Coins
; in that level have been collected
wMusicalCoinFlags:: ; ca3e
	ds (NUM_LEVELS / 8) + 1

wGolfBestScores:: ; ca42
	ds NUM_GOLF_COURSES

; $0 = Japanese
; $1 = English
wLanguage:: ; ca46
	db

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
	db

wNumMusicalCoins:: ; ca5c
	db

wTempInternalRoomID:: ; ca5d
	db

wca5e:: ; ca5e
	db

wca5f:: ; ca5f
	db

wca60:: ; ca60
	db

wPos::
wYPosHi:: db ; ca61
wYPosLo:: db ; ca62
wXPosHi:: db ; ca63
wXPosLo:: db ; ca64

wca65:: ; ca65
	db

wca66:: ; ca66
	db

wFrameDuration:: ; ca67
	db

wAnimationFrame:: ; ca68
	db

; which way Wario is facing
; DIRECTION_LEFT  = 0
; DIRECTION_RIGHT = 1
wDirection:: ; ca69
	db

wca6a:: ; ca6a
	db

wca6b:: ; ca6b
	db

wca6c:: ; ca6c
	db

wSwimVelIndex:: ; ca6d
	db

; counter to keep track of
; Wario's water surface floating movement
wWaterSurfaceFloatingCounter:: ; ca6e
	db

wCollisionBoxTop::    db ; ca6f
wCollisionBoxBottom:: db ; ca70
wCollisionBoxLeft::   db ; ca71
wCollisionBoxRight::  db ; ca72

wIsFloorTransition:: ; ca73
	db

; which table to use for jump velocities
; JUMP_VEL_* constant
wJumpVelTable:: ; ca74
	db

; the index of the jump velocity value
; corresponding to wJumpVelTable
wJumpVelIndex:: ; ca75
	db

; if TRUE, then execute the full jump
; independently of pressing A or not
wDoFullJump:: ; ca76
	db

; whether Wario is jumping upwards or not
; used to check if the player can still
; gain height while holding down the jump button
wJumpingUpwards:: ; ca77
	db

; each y section is divided in 20-cell high slices
; this stores the floor number of the current position
wFloor:: ; ca78
	db

; palette pointer
wWarioPalsPtr:: ; ca79
	dw

wDMASourceBank:: ; ca7b
	db

wDMASourcePtr:: ; ca7c
	dw

wOAMBank:: ; ca7e
	db

wOAMPtr:: ; ca7f
	dw

wFramesetPtr:: ; ca81
	dw

; a STATE_* constant, corresponding
; to Wario's current state
wWarioState:: ; ca83
	db

; increments every frame
; that Wario is in some state
wWarioStateCounter:: ; ca84
	db

; counts how many times wWarioStateCounter overflows
; used for knowing how long Wario is some state
wWarioStateCycles:: ; ca85
	db

wWalkVelIndex:: ; ca86
	db

wWarioScreenYPos:: ; ca87
	db

wWarioScreenXPos:: ; ca88
	db

wAttackCounter:: ; ca89
	db

; whether objects can interact with Wario
wIsIntangible:: ; ca8a
	db

wIsCrouching:: ; ca8b
	db

wInvincibleCounter:: ; ca8c
	db

wInvisibleFrame:: ; ca8d
	db

; lower 5 bits: TRANSFORMATION_* constant
wTransformation:: ; ca8e
	db

wca8f:: ; ca8f
	db

; duration left for current transformation
; big endian
wTransformationDuration:: ; ca90
	ds $2

; a TOUCH_* constant that determines
; how Wario interacts with objects
; that would normally sting them
; this is used to override the normal stinging action
wStingTouchState:: ; ca92
	db

; a TOUCH_* constant that determines
; how Wario interacts with objects
; TOUCH_NONE: normal interaction
; TOUCH_VULNERABLE: clears current transformation
; TOUCH_BUMP: makes object bump
; TOUCH_ATTACK: acts as a regular attack
; TOUCH_VANISH: vanishes object
; TOUCH_PASS_THROUGH: does not interact horizontally
wTouchState:: ; ca93
	db

wca94:: ; ca94
	db

wIsTurning:: ; ca95
	db

wIsSmashAttacking:: ; ca96
	db

wGroundShakeCounter:: ; ca97
	db

; whether Wario is causing ground shaking
wIsWarioGroundShaking:: ; ca98
	db

wIsGettingOffLadder:: ; ca99
	db

; Wario's grabbing state
; lower 4 bits is GRAB_* constant
; bit 7: heavy object
wGrabState:: ; ca9a
	db

wAutoMoveState:: ; ca9b
	db

wSwimmingDirectionInput:: ; ca9c
	db

wIsRolling:: ; ca9d
	db

; counter to keep track of number of times
; Wario needs to "wiggle" to escape being picked up
; is reset to NUM_WIGGLES_TO_ESCAPE
wPickedUpWiggleCounter:: ; ca9e
	db

; counter determining number of remaining frames
; Wario has to wiggle out of being picked up
; counts down from MAX_PICKED_UP_FRAME_COUNTER
; then resets after reaching 0
wPickedUpFrameCounter:: ; ca9f
	db

wIsInSand:: ; caa0
	db

wcaa1:: ; caa1
	ds 4 palettes

; whether the level's Mini-Game
; has already been cleared
wIsMinigameCleared:: ; cac1
	db

wcac2:: ; cac2
	db

wcac3:: ; cac3
	db

wcac4:: ds $2 ; cac4
wcac6:: ds $2 ; cac6

wcac8:: ; cac8
	db

wIsOnSteppableObject:: ; cac9
	db

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
	db

; this particle will be overwritten
; when the next one is created
wCurParticleIndex:: ; cce1
	db

wCurParticle:: sprite_oam_struct wCurParticle ; cce2
wCurParticleAnimEnded:: db ; cce6

wcce7:: ; cce7
	db

wcce8:: ; cce8
	db

wFloorSRAMBank:: ; cce9
	db

; the world is divided in a grid,
; with each cell being 16x16 units in dimension
; these store the y and x cells of the current position
wYCell:: ; ccea
	db
wXCell:: ; cceb
	db

wccec:: ; ccec
	db

wSpawnYCell:: ; cced
	db

wSpawnXCell:: ; ccee
	db

wccef:: ; ccef
	db

wccf0:: ; ccf0
wCreditsBGMapPtr::
	dw

	ds $e

wPermissionMap:: ; cd00
	ds $100

wce00:: ; ce00
	db

wce01:: ; ce01
wCreditsTextBuffer::
	ds $34

wce35:: ; ce35
wCreditsTextPals::
	ds $34

wce69:: ; ce69
	db

wce6a:: ; ce6a
wCreditsTextPtr::
	dw

wCreditsPalsMapPtr:: ; ce6c
	dw

	ds $64

wced2:: ; ced2
	db

wced3:: ; ced3
	db

; which screen to fade out to for level end
; LVLEND_* constant
wLevelEndScreen:: ; ced4
	db

wPendingSubState:: ; ced5
	db

wced6:: ; ced6
	db

; the speed in which to perform fading between palettes
; uses a FADE_SPEED_* constant
wFadeSpeed:: ; ced7
	db

wRoomAnimatedTilesEnabled:: ; ced8
	db

wRoomAnimatedPalsEnabled:: ; ced9
	db

wceda:: ; ceda
	db

wcedb:: ; cedb
	db

wcedc:: ; cedc
	db

wcedd:: ; cedd
	db

wcede:: ; cede
	db

wcedf:: ; cedf
	db

; uses CURRENT_* as flags
; to indicate what direction the
; current is pulling
wWaterCurrent::     db ; cee0
wLastWaterCurrent:: db ; cee1
wCurWaterCurrent::  db ; cee2

wTransitionParam:: ; cee3
	db

wcee4:: ; cee4
	db

; used to time various events in
; Intro/Credits/other sequences
wTimer:: ; cee5
	ds $2

wcee7:: ; cee7
	db

wcee8:: ; cee8
	db

wcee9:: ; cee9
	db

wceea:: ; ceea
	db

wceeb:: ; ceeb
	db

wceec:: ; ceec
	db

; used to control SFX looping
; every frame 1 is subtracted
; when it reaches 0 it plays SFX
; then it's reset to loop duration
wSFXLoopCounter:: ; ceed
	db

wceee:: ; ceee
	db

wceef:: ; ceef
	db

wcef0:: ; cef0
	db

wcef1:: ; cef1
	db

wNumMusicBoxes:: ; cef2
	db

	ds $d

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
	dw

w1d122:: ; d122
	dw

w1d124:: ; d124
	dw

w1d126:: ; d126
	dw

w1d128:: ; d128
	dw

w1d12a:: ; d12a
	dw

w1d12c:: ; d12c
	dw

w1d12e:: ; d12e
	dw

w1d130:: ; d130
	dw

w1d132:: ; d132
	dw

w1d134:: ; d134
	dw

w1d136:: ; d136
	dw

w1d138:: ; d138
	dw

w1d13a:: ; d13a
	dw

w1d13c:: ; d13c
	dw

w1d13e:: ; d13e
	dw

w1d140:: ; d140
	db

w1d141:: ; d141
	db

w1d142:: ; d142
	db

; number of torches lit for the Flame Block puzzle
wNumLitTorches:: ; d143
	db

wNumShootGoals:: ; d144
	db

w1d145:: ; d145
	db

	ds $4

; some transformations can confer to Wario special power-ups
; e.g. Fat Wario can effectively have the Super Jump Slam Overalls
; this stores the Power-Up that is effectively active
; by taking into account the current transformation
wEffectivePowerUp:: ; d14a
	db

	ds $6b5


SECTION "Golf RAM", WRAMX

; start of the whole Golf RAM
wGolfRAMStart::

w1d800:: ; d800
	db

wGolfMenuOption:: ; d801
	db

wPredeterminedGolfLevel:: ; d802
	db

w1d803:: ; d803
	db

; GOLF_COURSE_* constant
wGolfCourse:: ; d804
	db

; current score in the gold course being played
wGolfCourseScore:: ; d805
	db

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
wGolfPar::           db ; db81
w1db82::             ds $2 ; db82
wGolfWaterSpawn1::   db ; db84
wGolfWaterSpawn2::   db ; db85
wGolfLevelDataEnd::

	ds $a

w1db90:: ; db90
	ds 4 tiles

	ds $30

w1dc00:: ; dc00
wGolfLobbyState:: ; dc00
wGolfLevelState:: ; dc00
	db

w1dc01:: ; dc01
	db

wGolfVBlankMode:: ; dc02
	db

wHasAllMusicalCoinFlags:: ; dc03
	db

	ds $5

wGolfAnimLastFrame:: ; dc09
	db

; keeps track of several counters
wGolfCounter:: ; dc0a
	db

w1dc0b:: ; dc0b
	db

wGolfLCDConfig:: ; dc0c
	db

wGolfWarioTilesBank:: ; dc0d
	db

w1dc0e:: ; dc0e
	db

wGolfPrice:: ; dc0f
	db

	db

wdc11:: ; dc11
wGolfWarioTilesPtr:: ; dc11
	dw

w1dc13:: ; dc13
	db

	ds $3

wGolfOAMPtr:: ; dc17
	dw

; number of coins to be displayed
; in the Golf Lobby screen
wGolfNumCoins:: ; dc19
	ds $2

	ds $5

w1dc20:: ; dc20
	db

w1dc21:: ; dc21
	db

; current stroke number
wGolfStroke:: ; dc22
	db

wGolfMaxStrokes:: ; dc23
	db

wGolfResult:: ; dc24
	db

w1dc25:: ; dc25
	db

; GOLF_DISPLAY_* constant
wGolfDisplayMode:: ; dc26
	db

; $0 = right
; $1 = left
wGolfMenuScrollingDir:: ; dc27
wGolfLevelScrollingDir:: ; dc27
	db

; which side of the Para-Goomba that the hole is in
; $0 = to the right
; $1 = to the left
wGolfHoleDirection:: ; dc28
	db

wShotDirection:: ; dc29
	db

wHasGolfWarioAnimationFinished:: ; dc2a
	db

	db

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
	db

	db

; can either be low byte of
; PARAGOOM_GROUND_LEVEL or PARAGOOM_TEE_BOX_LEVEL
; the ground level y position proper is considered
; to be $1xx, where xx is this value
wGroundLevelYPos:: ; dc44
	db

wGolfTerrain:: ; dc45
	db

wShotTerrainModifier:: ; dc46
	db

; used to check whether the Para-Goom
; has already left the Tee Box
w1dc47:: ; dc47
	db

; golf terrain of where Para-Goom was shot from
wStrokeGolfTerrain:: ; dc48
	db

; which way the Power Gauge is flowing
; FALSE = rising
; TRUE = falling
wIsPowerGaugeFalling:: ; dc49
	db

wShotPowerGaugeCursor:: ; dc4a
	db

wShotPowerLevel:: ; dc4b
	db

wSelectedShotPowerGauge:: ; dc4c
	db

wShotSpin:: ; dc4d
	db

wGolfWarioYVel:: ; dc4e
wShotYVel:: ; dc4e
	db

w1dc4f:: ; dc4f
	db

wShotXVel:: ; dc50
	db

w1dc51:: ; dc51
	db

	db

w1dc53:: ; dc53
	db

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
	db

; next treasure in the list to collect
wNextTreasure:: ; d00e
	db

; LEVEL_* constant
wOWLevel:: ; d00f
	db

	db

w2d011:: ; d011
	db

wNextMapSide:: ; d012
	db

w2d013:: ; d013
	db

w2d014:: ; d014
	db

w2d015:: ; d015
	db

w2d016:: ; d016
	db

w2d017:: ; d017
	db

w2d018:: ; d018
	db

w2d019:: ; d019
	db

; NORTH, WEST, SOUTH or EAST
wCurMapSide:: ; d01a
	db

wLastTransitionParam:: ; d01b
	db

	db

wMapSideLevelIndex:: ; d01d
	db

w2d01e:: ; d01e
	db

w2d01f:: ; d01f
	db

wGotSunMedallion:: ; d020
	db

	db

w2d022:: ; d022
	db

w2d023:: ; d023
	db

; $00 when OW object animation is ongoing
; $ff when it reset
wOWAnimationFinished:: ; d024
	db

w2d025:: ; d025
	db

w2d026:: ; d026
	ds $2

w2d028:: ; d028
	db

w2d029:: ; d029
	db

w2d02a:: ; d02a
	ds $2

w2d02c:: ; d02c
	db

	ds $3

w2d030:: ; d030
	db

w2d031:: ; d031
	db

w2d032:: ; d032
	db

w2d033:: ; d033
	db

w2d034:: ; d034
	db

w2d035:: ; d035
	db

w2d036:: ; d036
	db

w2d037:: ; d037
	db

w2d038:: ; d038
	db

w2d039:: ; d039
	db

w2d03a:: ; d03a
	db

w2d03b:: ; d03b
	db

w2d03c:: ; d03c
	db

w2d03d:: ; d03d
	db

w2d03e:: ; d03e
	db

w2d03f:: ; d03f
	db

w2d040:: ; d040
	db

w2d041:: ; d041
	db

w2d042:: ; d042
	db

w2d043:: ; d043
	db

w2d044:: ; d044
	ds $2

w2d046:: ; d046
	db

w2d047:: ; d047
	db

w2d048:: ; d048
	db

w2d049:: ; d049
	db

	ds $6

; $0 = hidden
; $1 = turning visible
wTopBarState:: ; d050
	db

w2d051:: ; d051
	db

	db

; 0: Day/Night spell
; 1: Cutscene
; 2: Collection
; 3: Next map
; 4: Prev map
wTopBarSelection:: ; d053
	db

wTopBarSelectableButtons:: ; d054
	db

w2d055:: ; d055
	db

w2d056:: ; d056
	db

; which crayons have been collected
; each bit corresponds to CRAYON_*
wCrayonFlags:: ; d057
	db

wCollectionPage:: ; d058
	db

wCollectionCell:: ; d059
	db

	ds $6

w2d060:: ; d060
	db

w2d061:: ; d061
	db

w2d062:: ; d062
	db

w2d063:: ; d063
	ds $2

w2d065:: ; d065
	db

w2d066:: ; d066
	db

w2d067:: ; d067
	db

w2d068:: ; d068
	db

w2d069:: ; d069
	db

w2d06a:: ; d06a
	db

w2d06b:: ; d06b
	db

w2d06c:: ; d06c
	db

w2d06d:: ; d06d
	db

w2d06e:: ; d06e
	db

w2d06f:: ; d06f
	db

w2d070:: ; d070
	db

w2d071:: ; d071
	db

w2d072:: ; d072
	db

w2d073:: ; d073
	db

w2d074:: ; d074
	db

w2d075:: ; d075
	db

w2d076:: ; d076
	db

; CUTSCENE_* constant
wCutscene:: ; d077
	db

w2d078:: ; d078
	db

wHDMABank:: ; d079
	db

wAccessibleMapSides:: ; d07a
	db

wIsCollectionOpen:: ; d07b
	db

w2d07c:: ; d07c
	db

w2d07d:: ; d07d
	db

	db

w2d07f:: ; d07f
	db

w2d080:: ; d080
	db

w2d081:: ; d081
	db

w2d082:: ; d082
	ds $2

	ds $2

w2d086:: ; d086
	ds $2

	ds $8

wHasMagnifyingGlass:: ; d090
	db

; BOTBAR_* constant
wBottomBarAction:: ; d091
	db

wBottomBarState:: ; d092
	db

wMagnifyingGlassCounter:: ; d093
	db

wWY:: ; d094
	db

wWX:: ; d095
	db

w2d096:: ; d096
	db

	ds $9

w2d0a0:: ; d0a0
	db

w2d0a1:: ; d0a1
	db

w2d0a2:: ; d0a2
	db

w2d0a3:: ; d0a3
	db

w2d0a4:: ; d0a4
	db

w2d0a5:: ; d0a5
	db

w2d0a6:: ; d0a6
	db

w2d0a7:: ; d0a7
	db

w2d0a8:: ; d0a8
	db

	ds $7

wHDMA::  hdma_config_struct wHDMA ; d0b0
w2d0b5:: hdma_config_struct w2d0b5 ; d0b5

	ds $6

	
w2d0c0:: ; d0dc0
	ds $10

wPalConfig1:: pal_config_struct wPalConfig1 ; d0d0

w2d0d5:: ; d0d5
	db

wPalConfig2:: pal_config_struct wPalConfig2 ; d0d6

w2d0db:: ; d0db
	db

w2d0dc:: ; d0dc
	db

w2d0dd:: ; d0dd
	db

	ds $2

w2d0e0:: ; d0e0
	db

w2d0e1:: ; d0e1
	db

w2d0e2:: ; d0e2
	db

w2d0e3:: ; d0e3
	db

w2d0e4:: ; d0e4
	db

w2d0e5:: ; d0e5
	db

	ds $8

w2d0ee:: ; d0ee
	db

w2d0ef:: ; d0ef
	db

wLevelTreasureIDs::
wLevelGreyTreasureID::  db ; d0f0
wLevelRedTreasureID::   db ; d0f1
wLevelGreenTreasureID:: db ; d0f2
wLevelBlueTreasureID::  db ; d0f3

wLevelTreasurePals::
wLevelGreyTreasurePal::  db ; d0f4
wLevelRedTreasurePal::   db ; d0f5
wLevelGreenTreasurePal:: db ; d0f6
wLevelBlueTreasurePal::  db ; d0f7

	ds $2

wBottomBarFlags:: ; d0fa
	db

	db

wBottomBarTreasureIDs:: ; d0fc
	ds NUM_LEVEL_TREASURES

w2d100:: ; d100
	db

w2d101:: ; d101
	db

	ds $2

w2d104:: ; d104
	ds $2

w2d106:: ; d106
	db

; some sprite pointer
w2d107:: ; d107
	ds $2

; some frameset pointer
w2d109:: ; d109
	ds $2

wOWAllowedDPadInput:: ; d10b
	db

w2d10c:: ; d10c
	db

w2d10d:: ; d10d
	db

w2d10e:: ; d10e
	db

	db

wCompassSprite:: sprite_oam_struct wCompassSprite ; d110

w2d114:: ; d114
	ds $2

w2d116:: ; d116
	db

w2d117:: ; d117
	db

	ds $6

wCurSceneObj:: ; d11e
	ds $2

	ds $4

w2d124:: ; d124
	db

w2d125:: ; d125
	db

	ds $4

w2d12a:: ; d12a
	db

w2d12b:: ; d12b
	db

w2d12c:: ; d12c
	db

	db

w2d12e:: ; d12e
	db

w2d12f:: ; d12f
	db

	ds $10

wSceneWario:: scene_obj_struct wSceneWario ; d140
wSceneWarioStateGroup:: db ; d148
wSceneWarioOAMPtr::     dw ; d149
wSceneWarioOAMBank::    db ; d14b

w2d14c:: ; d14c
	db

wSceneWarioIgnoreScroll:: ; d14d
	db

w2d14e:: ; d14e
	db

	db

w2d150:: ; d150
	db

w2d151:: ; d151
	db

wDebugSceneWarioState:: ; d152
	db

	ds $5

wHDMADestVRAMBank:: ; d158
	db

	ds $7

w2d160:: ; d160
	ds $8

	ds $18

w2d180:: scene_obj_struct w2d180 ; d180

wSceneObjs::
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
wSceneObjsEnd::

wAttrmap:: ; d200
	ds $300

wTilemap:: ; d500
	ds $300

UNION

w2d800:: ; d800
wLCDCFlagsToFlip::
	db

w2d801:: ; d801
	db

w2d802:: ; d802
	db

w2d803:: ; d803
	db

w2d804:: ; d804
	db

	db

w2d806:: ; d806
	db

w2d807:: ; d807
	db

w2d808:: ; d808
	db

w2d809:: ; d809
	db

	ds $6

w2d810:: ; d810
	ds $70

w2d880:: ; d880
	ds $9

w2d889:: ; d889
	ds $2

w2d88b:: ; d88b
	db

	ds $2

w2d88e:: ; d88e
	db

w2d88f:: ; d88f
	db

w2d890:: ; d890
	db

w2d891:: ; d891
	db

w2d892:: ; d892
	db

w2d893:: ; d893
	db

w2d894:: ; d894
	db

	db

w2d896:: ; d896
	db

w2d897:: ; d897
	db

	ds $8

w2d8a0:: ; d8a0
	db

w2d8a1:: ; d8a1
	db

UNION

wTempleMusicBoxes::
wTempleMusicBox1::  temple_music_box_struct wTempleMusicBox1  ; d8a2
wTempleMusicBox2::  temple_music_box_struct wTempleMusicBox2  ; d8a4
wTempleMusicBox3::  temple_music_box_struct wTempleMusicBox3  ; d8a6
wTempleMusicBox4::  temple_music_box_struct wTempleMusicBox4  ; d8a8
wTempleMusicBox5::  temple_music_box_struct wTempleMusicBox5  ; d8aa

	ds $4

wTempleRocks::
wTempleRock1::  temple_rock_struct wTempleRock1  ; d8b0
wTempleRock2::  temple_rock_struct wTempleRock2  ; d8b4
wTempleRock3::  temple_rock_struct wTempleRock3  ; d8b8
wTempleRock4::  temple_rock_struct wTempleRock4  ; d8bc
wTempleRock5::  temple_rock_struct wTempleRock5  ; d8c0
wTempleRock6::  temple_rock_struct wTempleRock6  ; d8c4
wTempleRock7::  temple_rock_struct wTempleRock7  ; d8c8
wTempleRock8::  temple_rock_struct wTempleRock8  ; d8cc
wTempleRock9::  temple_rock_struct wTempleRock9  ; d8d0
wTempleRock10:: temple_rock_struct wTempleRock10 ; d8d4

NEXTU

wPlaneParts::
wPlanePart1::  plane_part_struct wPlanePart1  ; d8a2
wPlanePart2::  plane_part_struct wPlanePart2  ; d8a4
wPlanePart3::  plane_part_struct wPlanePart3  ; d8a6
wPlanePart4::  plane_part_struct wPlanePart4  ; d8a8

	ds $6

w2d8b0:: ; d8b0
	db

w2d8b1:: ; d8b1
	db

ENDU

	ds $2

w2d8da:: ; d8da
	db

	db

w2d8dc:: ; d8dc
	db

	ds $123

; TEMPLE_SCENE_* constant
wTempleScene:: ; da00
	db

	db

wTempleMusicIsPlaying::    db ; da02
wTempleMusicDelayCounter:: db ; da03

w2da04:: ; da04
	db

wTempleSceneCounter:: ; da05
	db

	ds $7a

wTextPrintInfo::
wTextDelayCounter::  db ; da80
wCurTextLine::       db ; da81
wCurTextBufferLine:: db ; da82
wCurTextLinePos::    db ; da83
wCurTextBufferPage:: db ; da84
wBGMapToPrintText::  db ; da85

	ds $2

; pending character to write to BGMap
wPendingCharDest:: dw ; da88
wPendingCharTile:: db ; da8a
wPendingCharAttr:: db ; da8b

	ds $4

wTextPrintInfoEnd::

	ds $20

; true if the next objective is to
; go to The Temple to fight A Hidden Figure
wIsNextObjectiveTheTemple:: ; dab0
	db

	ds $4f

wText::
wTextLine1:: ds TEXT_LINE_LENGTH ; db00
wTextLine2:: ds TEXT_LINE_LENGTH ; db10
wTextLine3:: ds TEXT_LINE_LENGTH ; db20
wTextLine4:: ds TEXT_LINE_LENGTH ; db30

	ds $40

wClearedTextBuffer:: ; db80
	ds 8 * TEXT_LINE_LENGTH

wTextBuffer::
wTileBuffer:: ; dc00
	ds $20 tiles

	ds $1fd

w2dffd:: ; dffd
	db

w2dffe:: ; dffe
	db

w2dfff:: ; dfff
	db

NEXTU

wCollectionRow:: ; d800
	db

wCollectionCol:: ; d801
	db

wCollectionLinkState:: ; d802
	db

wCollectionLinkStateCounter:: ; d803
	db

wCollectionScrollMode:: ; d804
	db

	ds $b

; set of treasures that are
; linked together
wCollectionLinkedCells:: ; d810
	ds $7

ENDU

wWRAM2End::

SECTION "Audio RAM", WRAMX

; bit 5: ???
; bit 6: whether to invoke audio callback function
; bit 7: ???
wAudioEngineFlags:: ; d000
	db

wAudioBankBackup:: ; d001
	db

	db

wAudioBankCallback:: ; d003
	dw

wSFXTempo:: ; d005
	db

w3d006:: ; d006
	db

w3d007:: ; d007
	db

w3d008:: ; d008
	ds $2

wMusicTempo:: ; d00a
	db

w3d00b:: ; d00b
	db

w3d00c:: ; d00c
	db

w3d00d:: ; d00d
	ds $2

wNumAudioChannels:: ; d00f
	db

; points to one of channel_struct
wCurChannelPtr:: ; d010
	dw

wNumTracks:: ; d012
	db

wCurTrackPtr:: ; d013
	dw

; low byte of a sound register:
; sound1 = rAUD1ENV
; sound2 = rAUD2ENV
; sound3 = rAUD3LEVEL
; sound4 = rAUD4ENV
wCurSoundRegister:: ; d015
	db

	db

wAudioCmdPtr:: ; d017
	dw

; channel Flags1
wCurChannelFlags:: ; d019
	db

w3d01a:: ; d01a
	db

wLoadedMusic:: ; d01b
	ds $2

wCurWaveSample:: ; d01d
	db

wVibratoValue:: ; d01e
	db

wAudioCmdArg:: ; d01f
	db

w3d020:: ; d020
	db

w3d021:: ; d021
	db

w3d022:: ; d022
	db

	db

; each bit represents whether a channel is active/inactive
; bit 0: MusicChannel1
; bit 1: MusicChannel2
; ...
wActiveChannels:: ; d024
	db

w3d025:: ; d025
	db

wSoundBank:: ; d026
	db

	ds $11

wCurSoundID:: ; d038
	ds $2

w3d03a:: ; d03a
	db

w3d03b:: ; d03b
	db

wNumChannels:: ; d03c
	db

	db

wSoundPriority:: ; d03e
	db

wStartChannel:: ; d03f
	db

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
	db

w3d501:: ; d501
	db

wDPadRepeatCounter:: ; d502
	db

w3d503:: ; d503
	db

w3d504:: ; d504
	ds $2

w3d506:: ; d506
	db

w3d507:: ; d507
	ds $2

; if TRUE, Action Help is in
; the initial blacked out state
wActionHelpBlackedOut:: ; d509
	db

; counts up for each frame in Action Help
wActionHelpCounter:: ; d50a
	db

wActionHelpPowerUp:: ; d50b
	db

wActionHelpState:: ; d50c
	db

w3d50d:: ; d50d
	db

; if TRUE, don't update the animations
; in the Action Help
wActionHelpFrozen:: ; d50e
	db

wTempAnimatedTilesFrameDuration:: ; d50f
	db

wTempAnimatedTilesGroup:: ; d510
	db

w3d511:: ; d511
	ds $2

wStartMenuSelection:: ; d513
wPauseMenuSelection:: ; d513
	db

wObjAnimWasReset:: ; d514
	db

UNION
wActionHelpWario:: menu_obj_ext_struct wActionHelpWario ; d515
NEXTU
wPlaneWario:: menu_obj_ext_struct wPlaneWario ; d515
NEXTU
wClearScreenWario:: menu_obj_ext_struct wClearScreenWario ; d515
NEXTU
wGameOverWario:: menu_obj_ext_struct wGameOverWario ; d515
NEXTU
wCreditsMusicBox:: menu_obj_ext_struct wCreditsMusicBox ; d515
ENDU

wSFXTimer:: ; d522
	db

wMenuObj1:: menu_obj_struct wMenuObj1 ; d523
wMenuObj2:: menu_obj_struct wMenuObj2 ; d52b
wMenuObj3:: menu_obj_struct wMenuObj3 ; d533

wMenuObj4:: menu_obj_struct wMenuObj4 ; d53b
wMenuObj4OAMPtr::               dw ; d543
wMenuObj4FramesetBank::         db ; d545
wMenuObj4AnimationEnded::       db ; d546

wMenuObj5:: menu_obj_struct wMenuObj5 ; d547
wMenuObj5OAMPtr::               dw ; d54f
wMenuObj5FramesetBank::         db ; d551
wMenuObj5AnimationEnded::       db ; d552

wMenuObj6:: menu_obj_struct wMenuObj6 ; d553
wMenuObj6OAMPtr::               dw ; d55b
wMenuObj6FramesetBank::         db ; d55d

wMenuObj7:: menu_obj_struct wMenuObj7 ; d55e
wMenuObj7OAMPtr::               dw ; d566
wMenuObj7FramesetBank::         db ; d568
wMenuObj7AnimationEnded::       db ; d569

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
