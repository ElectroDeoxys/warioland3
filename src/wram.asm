INCLUDE "vram.asm"

SECTION "WRAM0", WRAM0

wTempPals1:: ds 8 palettes
wTempPals2:: ds 8 palettes

wBackupVBlankFunc::
	ds $3

wSCY::
	db

wCreditsPage::
	db

wSCX::
	db

; intro background layers x offsets,
; that all scroll at different speeds
wIntroBGXOffsetFar::    db
wIntroBGXOffsetCentre:: db
wIntroBGXOffsetNear::   db

; Hidden Figure fight values
wHiddenFigureSCYShake:: db
wc08a:: db
wc08b:: db
wc08c:: db
wc08d:: db

wSRAMBank::
	db

; ticks up by one every game loop
wGlobalCounter::
	db

; if not 0, then all sounds are muted
; is always set to FALSE
wSoundMuted::
	db

; whether VBlank function has been executed or not
wVBlankFuncExecuted::
	db

; whether to run the VBlank function
wEnableVBlankFunc::
	db

wJoypadDown::    db
wJoypadPressed:: db

; size of wVirtualOAM in number of bytes
wVirtualOAMByteSize::
	db

wCurSprite:: sprite_oam_struct wCurSprite

; if TRUE, hard reset is not possible
wResetDisabled::
	db

wState::    db
wSubState:: db

	ds $1

wTempIE::
	db

wRepeatByte::
	db

wLevelRoomID::
	db

; low nybble = x pos
; high nybble = y pos
wWarioSpawnPos::
	db

wc0a2::
	db

wBlockPos::
wBlockYPos:: dw
wBlockXPos:: dw

; temporary backup of wBlockPos
wBackupBlockPos::
	ds $4

	ds $1

wTempBank::
	db

wCompressedLevelBlockMapPtr::
	dw

	ds $4

wc0b3::
	dw

; whether camera is on the edge of the room horizontally
;  0 = not on the edge
;  1 = on left edge
; -1 = on right edge
wCameraRoomXScrollLimit::
	db

wRoomLowerYLimit:: db
wRoomUpperYLimit:: db
wRoomLeftXLimit::  db
wRoomRightXLimit:: db

wCameraConfigFlags::
	db

wc0bb::
	db

wSCYShake::
	db

wc0bd:: db
wc0be:: db
wc0bf:: db
wc0c0:: db

	ds $1

wc0c2::
	db

wc0c3::
	db

wc0c4::
	db

wc0c5::
	db

wc0c6::
	db

wc0c7::
	db

wObjectGroup::
	db

wRoom::                   db
wRoomBlockFunctionTable:: db
wRoomTileMap::            db
wRoomMainTiles::          db
wRoomSpecialTiles::       db
wRoomPalettes::           db
wRoomBlockFunctionTableBank:: db
wc0d0::                   db
wRoomMainTilesBank::      db
wRoomSpecialTilesBank::   db

wPaletteBank::
	db

wc0d4::
	db

wc0d5::
	db

wc0d6::
	db

wRoomTransitionParam::
	db

; if true, will allow block functions
; to run the block breaking routines
; otherwise, just treats these blocks
; as a default solid collision
wBlockFuncBreakFlag::
	db

; which special entity is causing the collision,
; either a thrown object or Robo-mouse
wBlockFuncSpecialCollision::
	db

; if true, then the entity causing the collision
; is Wario, otherwise it's a level object
wBlockFuncWarioFlag::
	db

; current position's interaction type with the water
; 0 = no water
; 1 = submersible water
; 2 = non-submersible water
wWaterInteraction::
	db

wc0dc::
	db

wIsInWaterOrSand::
	db

wIsOnSlipperyGround::
	db

	ds $1

wc0e0::
	db

wc0e1::
	db

; byte 1 = minutes
; byte 2 = seconds
; byte 3 = frames (60 fps, so 60 here is 1 second)
wLevelTime::
	ds 3

wTimeAttackResult::
	db

wIsBossBattle::
	db

wAllMusicalCoinsLevel::
	db

; used in the Musical Coin screen
; this value counts up from 0 up to
; the number of Musical Coins that
; Wario collected in the level
wMusicalCoinVisualCounter::
	db

	ds $17

wTempBGPals:: ds 8 palettes
wTempOBPals:: ds 8 palettes

; target rgb values for fading
wTargetRGB::
wTargetRed::   db
wTargetGreen:: db
wTargetBlue::  db

; current rgb values for color fade
wCurRGB::
wCurRed::   db
wCurGreen:: db
wCurBlue::  db

wUnused_c186::
	db

; keeps track of the fade amount, starting at 1
; when it reaches 32 + 1 (maximum amount of fade possible),
; fading is stopped
wPalFadeCounter::
	db

	ds $1

; bit 0: slope right
; bit 1: slope left
wSlopeInteraction::
	db

	ds $2

wc18c::
	db

wUnused_c18d::
	db

wc18e:: ds 8 * 2
wc19e:: db      
wc19f:: db      

wIsDMATransferPending::      db
wPendingDMASourceBank::      db
wPendingDMASourcePtr::       dw
wPendingDMADestinationBank:: db
wPendingDMADestinationPtr::  dw
wPendingDMALength::          db

wAnimationEnded::
	db

wFloorTransitionTimer::
	db

; bit 2 set = transitioning downwards
; bit 3 set = transitioning upwards
wFloorTransitionDir::
	db

wAnimatedTilesGroup::         db
wAnimatedTilesFrameDuration:: db
wAnimatedTilesGfx::           db
wAnimatedTilesFrame::         db
wAnimatedTilesFrameCount::    db

; counter is incremented each time the room pals are updated
; when it reaches wRoomPalCycleDuration, the cycle advances
; to the next index and counter value is reset
; see UpdateRoomAnimatedPals
wRoomPalCycle::         db
wRoomPalCycleDuration:: db
wRoomPalCyclePtr::      dw
wRoomPalCycleIndex::    db
wRoomPalCycleCounter::  db

; pointer to an object struct in wObjects
wObjPtr::
	dw

wUnused_c1b8::
	db

; OBJ_INTERACTION_* constant for ProcessInteractions
wObjInteractionType::
	db

wObjCollBoxTop::    db
wObjCollBoxBottom:: db
wObjCollBoxLeft::   db
wObjCollBoxRight::  db

wObjScreenYPos:: db
wObjScreenXPos:: db

wInteractionSide::
	db

wc1c1:: db
wc1c2:: db
wc1c3:: db
wc1c4:: db

	ds $1

wObjDirection::
	db

wLadderInteraction::
	db

wIsNearFence::
	db

wIsInAirCurrent::
	db

wc1ca::
	db

	ds $35

SECTION "wVBlankFunc", WRAM0

; function called on V-Blank
wVBlankFunc::
	ds $200

SECTION "wLCDFunc", WRAM0

; function called on LCD
wLCDFunc::
; "LCD Function" goes here

SECTION "Room Block Tiles", WRAM0

	ds $1e0

wROMBank::
	db

wRoomBlockTiles::
	ds $4 * $80

wVBlankFuncExtended::
	ds $200

SECTION "Progress WRAM", WRAM0

wSaveCounter::
	ds $4

; number of coins collected
; it's in big endian decimal form
wNumCoins::
	ds $2

; each level selectable in the overworld has 8 states
; divided by 2, which are the day and night variants
wLevel::
	db

; digits are represented in each nybble
; the first byte holds the tens and ones digits
; for the minute value, and the second byte
; holds the tens and ones digits for seconds
wLevelTimeAttackScores::
	ds 2 * NUM_LEVELS

; stores total number of treasures collected
; byte 1 lo nybble = hundreds
; byte 2 hi nybble = tens
; byte 2 lo nybble = ones
wNumCollectedTreasures::
	ds $2

; bit 0: not set = day, set = night
; bit 7: trigger day/night transition
wDayNight::
	db

; a POWER_UP_* constant
; this value is incremental which means that
; a Power Up level unlocks all levels before it
wPowerUpLevel::
	db

; MODE_* constant
wGameModeFlags::
	db

; flag set means that all the Musical Coins
; in that level have been collected
wMusicalCoinFlags::
	ds (NUM_LEVELS / 8) + 1

wGolfBestScores::
	ds NUM_GOLF_COURSES

; 0 = Japanese
; 1 = English
wLanguage::
	db

	ds $14

SECTION "Level WRAM", WRAM0

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
wKeyAndTreasureFlags::
	db

wNumMusicalCoins::
	db

wTempLevelRoomID::
	db

; always $70 or wWarioYPos
wca5e:: db
; spacing between Wario and left/right
; edge of the screen, always $58
wCamRightSpacing:: db
wCamLeftSpacing:: db

wWarioPos::
wWarioYPos:: dw
wWarioXPos:: dw

wca65::
	db

wca66::
	db

wFrameDuration::
	db

wAnimationFrame::
	db

; which way Wario is facing
; DIRECTION_LEFT  = 0
; DIRECTION_RIGHT = 1
wDirection::
	db

; when a switch is hit, this flag is set
; then UpdateSwitchableBlocks will update
; all blocks that are controlled by the switch,
; and then unset this flag
wSwitchStateUpdated:: db
; which state the switch is:
; - $60 is off
; - $68 is on
wSwitchState::        db

wca6c::
	db

wSwimVelIndex::
	db

; counter to keep track of
; Wario's water surface floating movement
wWaterSurfaceFloatingCounter::
	db

wCollisionBoxTop::    db
wCollisionBoxBottom:: db
wCollisionBoxLeft::   db
wCollisionBoxRight::  db

wIsFloorTransition::
	db

; which table to use for jump velocities
; JUMP_VEL_* constant
wJumpVelTable::
	db

; the index of the jump velocity value
; corresponding to wJumpVelTable
wJumpVelIndex::
	db

; if TRUE, then execute the full jump
; independently of pressing A or not
wDoFullJump::
	db

; whether Wario is jumping upwards or not
; used to check if the player can still
; gain height while holding down the jump button
wJumpingUpwards::
	db

; each y section is divided in 20-block high slices
; this stores the floor number of the current position
wFloor::
	db

; palette pointer
wWarioPalsPtr::
	dw

wDMASourceBank:: db
wDMASourcePtr::  dw

wOAMBank:: db
wOAMPtr::  dw

wFramesetPtr::
	dw

; a STATE_* constant, corresponding
; to Wario's current state
wWarioState::
	db

; increments every frame
; that Wario is in some state
wWarioStateCounter::
	db

; counts how many times wWarioStateCounter overflows
; used for knowing how long Wario is some state
wWarioStateCycles::
	db

wWalkVelIndex::
	db

wWarioScreenYPos::
	db

wWarioScreenXPos::
	db

wAttackCounter::
	db

; whether objects can interact with Wario
wIsIntangible::
	db

wIsCrouching::
	db

wInvincibleCounter::
	db

wInvisibleFrame::
	db

; lower 5 bits: TRANSFORMATION_* constant
wTransformation::
	db

; a general value on the progress of
; a transformation, used for Hot, Ball-o-string
; and Snowman Wario
; for Hot Wario, the values are:
; - 1: running around in flames
; - 2: engulfed in flames
; for Ball-o-string Wario, the value are:
; - 0: stopped and not rolling
; - 1: rolling
; for Snowman Wario, the values are:
; - 0: walking around
; - 1: small snowball
; - 2: medium snowball
; - 3: big snowball
wWarioTransformationProgress::
	db

; duration left for current transformation
; big endian
wTransformationDuration::
	dw

; a TOUCH_* constant that determines
; how Wario interacts with objects
; that would normally sting him
; this is used to override the normal stinging action
wStingTouchState::
	db

; a TOUCH_* constant that determines
; how Wario interacts with objects
; TOUCH_NONE: normal interaction
; TOUCH_VULNERABLE: clears current transformation
; TOUCH_BUMP: makes object bump
; TOUCH_ATTACK: acts as a regular attack
; TOUCH_VANISH: vanishes object
; TOUCH_PASS_THROUGH: does not interact horizontally
wTouchState::
	db

wca94::
	db

wIsTurning::
	db

wIsSmashAttacking::
	db

wGroundShakeCounter::
	db

; whether Wario is causing ground shaking
wIsWarioGroundShaking::
	db

wIsGettingOffLadder::
	db

; Wario's grabbing state
; lower 4 bits is GRAB_* constant
; bit 7: heavy object
wGrabState::
	db

wAutoMoveState::
	db

wSwimmingDirectionInput::
	db

wIsRolling::
	db

; counter to keep track of number of times
; Wario needs to "wiggle" to escape being picked up
; is reset to NUM_WIGGLES_TO_ESCAPE
wPickedUpWiggleCounter::
	db

; counter determining number of remaining frames
; Wario has to wiggle out of being picked up
; counts down from MAX_PICKED_UP_FRAME_COUNTER
; then resets after reaching 0
wPickedUpFrameCounter::
	db

wIsInSand::
	db

wcaa1::
	ds 4 palettes

; whether the level's Mini-Game
; has already been cleared
wIsMinigameCleared::
	db

wCoinCooldown::
	db

wBossBattleMusic::
	db

wCameraSCY:: dw
wCameraSCX:: dw

; whether camera is on the edge of the room vertically
;  0 = not on the edge
;  1 = on upper edge
; -1 = on lower edge
wCameraRoomYScrollLimit::
	db

wIsOnSteppableObject::
	db

SECTION "Sprites WRAM", WRAM0

wVirtualOAM::
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
wParticle1:: particle_struct wParticle1
wParticle2:: particle_struct wParticle2
wParticle3:: particle_struct wParticle3
wParticle4:: particle_struct wParticle4

; how many particles are active now
wNumParticles::
	db

; this particle will be overwritten
; when the next one is created
wCurParticleIndex::
	db

wCurParticle:: sprite_oam_struct wCurParticle
wCurParticleAnimEnded:: db

wcce7::
	dw

; the world is divided in a grid,
; with each block being 2x2 tiles in dimension
wBlockPtrBank:: db
wBlockPtr:: dw

wccec::
	db

wWarioSpawnYBlock:: db
wWarioSpawnXBlock:: db

wccef::
	db

wBGPtr::
wCreditsBGMapPtr::
	dw

	ds $e

wBlockFunctionTable::
	ds 2 * $80


; size of wBGMapTileVRAM0Queue in bytes
wBGMapTileQueueSize::
	db

UNION

; each tile corresponds to an address
; that is queued in wBGMapTileVRAM0Queue
wBGMapTileVRAM0Queue::
	ds $34

wBGMapTileVRAM1Queue::
	ds $34

; size of wBGMapAddressQueue in bytes
wBGMapAddressQueueSize::
	db

; each address corresponds to a tile
; that is queued in wBGMapTileVRAM0Queue
wBGMapAddressQueue::
	ds 2 * $34

NEXTU

wCreditsTextBuffer::
	ds $34

wCreditsTextPals::
	ds $34

	ds $1

wCreditsTextPtr::
	dw

wCreditsPalsMapPtr::
	dw

ENDU

wJumpCollision::
	db

wced3::
	db

; which screen to fade out to for level end
; LVLEND_* constant
wLevelEndScreen::
	db

wPendingSubState::
	db

wced6::
	db

; the speed in which to perform fading between palettes
; uses a FADE_SPEED_* constant
wFadeSpeed::
	db

wRoomAnimatedTilesEnabled:: db
wRoomAnimatedPalsEnabled::  db

wMultiBlockParam:: db
wcedb:: db
wcedc:: dw
wcede:: db
wcedf:: db

; uses CURRENT_* as flags
; to indicate what direction the
; current is pulling
wWaterCurrent::     db
wLastWaterCurrent:: db
wCurWaterCurrent::  db

wTransitionParam::
	db

wcee4::
	db

; used to time various events in
; Intro/Credits/other sequences
wTimer::
	ds $2

wChecksum::
	dw

wcee9::
	db

wceea::
	db

wceeb::
	db

wceec::
	db

; used to control SFX looping
; every frame 1 is subtracted
; when it reaches 0 it plays SFX
; then it's reset to loop duration
wSFXLoopCounter::
	db

wceee::
	db

wceef::
	db

wcef0::
	db

wcef1::
	db

wNumMusicBoxes::
	db

SECTION "Stack", WRAM0

wStackBottom::
	ds $100 - 1
wStackTop::
	db

SECTION "Level Objects WRAM", WRAMX

wObjects::
wObj1:: obj_struct wObj1
wObj2:: obj_struct wObj2
wObj3:: obj_struct wObj3
wObj4:: obj_struct wObj4
wObj5:: obj_struct wObj5
wObj6:: obj_struct wObj6
wObj7:: obj_struct wObj7
wObj8:: obj_struct wObj8

wCurObj:: obj_struct wCurObj

wObjDataPointers::
wChestObjDataPtr::       dw
wKeyObjDataPtr::         dw
wMusicalCoinObjDataPtr:: dw
wObjDataPtr01::          dw
wObjDataPtr02::          dw
wObjDataPtr03::          dw
wObjDataPtr04::          dw
wObjDataPtr05::          dw
wObjDataPtr06::          dw
wObjDataPtr07::          dw
wObjDataPtr08::          dw
wObjDataPtr09::          dw
wObjDataPtr10::          dw
wObjDataPtr11::          dw
wObjDataPtr12::          dw
wObjDataPtr13::          dw
wObjDataPointersEnd::

w1d140::

; if non-0, the Flame Block puzzle
; has already been cleared for the level
wFlameBlockCleared::
	db

wDollBoyNoFlashingBarrel:: db
wDollBoyRemainingParts::   db

; number of torches lit for the Flame Block puzzle
wNumLitTorches::
	db

wShootGoals:: db
wWarioGoals:: db

; during Doll Boy's barrel phase,
; each 4 lower significant bits represent a Doll Boy
; barrel that is still active, or Doll Boy itself
wDollBoyActiveBarrels::

; decides what the next Wolfenboss attack will be
; - if 0, then spawn Spiral
; - if 1, then spawn Igaguri
wWolfenbossNextAttack::

wJamanoActiveSkulls::
wMuddeeAmbushState::
	db

; if TRUE, then there is an Igaguri or Kuri still on screen
; this is checked so that Wolfenboss doesn't spawn another one
wWolfenbossIgaguriOrKuriActive::

w1d147::
	db

; decides which range for Doll Boy's hammer
; can be short, mid-short, mid-long and long range
wDollBoyHammerRange::

; remaining hits to defeat Wolfenboss + 1
wWolfenbossRemainingHits::
	db

; how many spirals that Wolfenboss will shoot
; before switching to attacking with a Igaguri
wWolfenbossConsecutiveSpirals::

w1d149::
	ds $1

SECTION "WRAM1", WRAMX

; some transformations can confer to Wario special power-ups
; e.g. Fat Wario can effectively have the Super Jump Slam Overalls
; this stores the Power-Up that is effectively active
; by taking into account the current transformation
wEffectivePowerUp::
	db

w1d14b::
	db

w1d14c::
	db

w1d14d::
	db

w1d14e::
	db

w1d14f::
	db

w1d150::
	db

w1d151::
	db

w1d152::
	ds $4

w1d156::
	ds $4

w1d15a::
	db

w1d15b::
	db

w1d15c::
	db

w1d15d::
	db

w1d15e::
	db

w1d15f::
	db

w1d160::
	db

w1d161::
	db

w1d162::
	db


SECTION "Golf RAM", WRAMX

; start of the whole Golf RAM
wGolfRAMStart::

w1d800::
	db

wGolfMenuOption::
	db

wPredeterminedGolfLevel::
	db

; current level number of golf course
wGolfCourseLevel::
	db

; GOLF_COURSE_* constant
wGolfCourse::
	db

; current score in the gold course being played
wGolfCourseScore::
	db

	ds $fa

; start of the RAM related to the Golf levels
wGolfLevelRAMStart::

UNION

; BGMap values to draw the golf course
; currently shown in the Golf Building menu
wGolfCourseTileMap::
	ds 7 * BG_MAP_WIDTH

NEXTU

; golf flag animation tiles to draw to VRAM
wGolfPinFlagTiles::
	ds 4 tiles

ENDU

	ds $20

w1da00::
	ds $100

w1db00::
	ds 8 palettes

wGolfLevelData::
wGolfTerrainBlocks:: ds NUM_GOLF_LEVEL_BLOCKS
wGolfPar::           db
w1db82::             ds $2
wGolfWaterSpawn1::   db
wGolfWaterSpawn2::   db
wGolfLevelDataEnd::

	ds $a

w1db90::
	ds 4 tiles

	ds $30

w1dc00::
wGolfLobbyState::
wGolfLevelState::
	db

w1dc01::
	db

wGolfVBlankMode::
	db

wHasAllMusicalCoinFlags::
	db

	ds $5

wGolfAnimLastFrame::
	db

; keeps track of several counters
wGolfCounter::
	db

w1dc0b::
	db

wGolfLCDConfig::
	db

wGolfWarioTilesBank::
	db

wGolfLevelTier::
	db

wGolfPrice::
	db

	ds $1

wdc11::
wGolfWarioTilesPtr::
	dw

w1dc13::
	db

	ds $3

wGolfOAMPtr::
	dw

; number of coins to be displayed
; in the Golf Lobby screen
wGolfNumCoins::
	ds $2

	ds $5

w1dc20::
	db

w1dc21::
	db

; current stroke number
wGolfStroke::
	db

wGolfMaxStrokes::
	db

wGolfResult::
	db

w1dc25::
	db

; GOLF_DISPLAY_* constant
wGolfDisplayMode::
	db

; $0 = right
; $1 = left
wGolfMenuScrollingDir::
wGolfLevelScrollingDir::
	db

; which side of the Para-Goomba that the hole is in
; $0 = to the right
; $1 = to the left
wGolfHoleDirection::
	db

wShotDirection::
	db

wHasGolfWarioAnimationFinished::
	db

	ds $1

wGolfXScroll::
	ds $2

wGolfMenuTargetSCX::
wTempGolfXScroll::
	ds $2

wGolfWarioYPos:: ds $2
wGolfWarioXPos:: ds $2

wGolfParaGoomYPos:: ds $2
wGolfParaGoomXPos:: ds $2

wGolfLevelHoleXPos:: ds $2

; position of Para-Goom when it was last shot
; used to reset position when, e.g. going in OB
wLastGolfParaGoomYPos:: ds $2
wLastGolfParaGoomXPos:: ds $2

w1dc3e::
	ds $2

wGolfWarioTargetXPos::
	ds $2

wGolfWarioDir::
	db

	ds $1

; can either be low byte of
; PARAGOOM_GROUND_LEVEL or PARAGOOM_TEE_BOX_LEVEL
; the ground level y position proper is considered
; to be $1xx, where xx is this value
wGroundLevelYPos::
	db

wGolfTerrain::
	db

wShotTerrainModifier::
	db

; used to check whether the Para-Goom
; has already left the Tee Box
w1dc47::
	db

; golf terrain of where Para-Goom was shot from
wStrokeGolfTerrain::
	db

; which way the Power Gauge is flowing
; FALSE = rising
; TRUE = falling
wIsPowerGaugeFalling::
	db

wShotPowerGaugeCursor::
	db

wShotPowerLevel::
	db

wSelectedShotPowerGauge::
	db

wShotSpin::
	db

wGolfWarioYVel::
wShotYVel::
	db

w1dc4f::
	db

wShotXVel::
	db

w1dc51::
	db

	ds $1

w1dc53::
	db

wGolfObj1:: golf_obj_struct wGolfObj1
wGolfObj2:: golf_obj_struct wGolfObj2
wGolfObj3:: golf_obj_struct wGolfObj3
wGolfObj4:: golf_obj_struct wGolfObj4
wGolfObj5:: golf_obj_struct wGolfObj5

wGolfParaGoom:: golf_obj_struct wGolfParaGoom
wGolfWario:: golf_obj_struct wGolfWario

wGolfOverlayText:: golf_obj_struct wGolfOverlayText
wGolfParaGoomGhost:: golf_obj_struct wGolfParaGoomGhost

	ds $364

wGolfRAMEnd::


SECTION "WRAM2", WRAMX

wTreasuresCollected::
	ds (NUM_TREASURES / 8) + 1

w2d00d::
	db

; next treasure in the list to collect
wNextTreasure::
	db

; LEVEL_* constant
wOWLevel::
	db

	ds $1

w2d011::
	db

wNextMapSide::
	db

w2d013::
	db

w2d014::
	db

w2d015::
	db

wCutsceneMapSide::
	db

wCutsceneActionParam::
	db

w2d018::
	db

wTempUnlockableConnectionID::
	db

; NORTH, WEST, SOUTH or EAST
wCurMapSide::
	db

wLastTransitionParam::
	db

	ds $1

wMapSideLevelID::
	db

w2d01e::
	db

; is TRUE if game has been cleared
; but there are still treasures left to collect
wMissingTreasureIndicatorsEnabled::
	db

wGotSunMedallion::
	db

	ds $1

w2d022::
	db

w2d023::
	db

; $00 when OW object animation is ongoing
; $ff when it reset
wOWAnimationFinished::
	db

w2d025::
	db

wCutsceneOWParamsPtr::     dw
wOWCutsceneAction::        db
wTempOWCutsceneAction::    db
wTempCutsceneOWParamsPtr:: dw

w2d02c::
	db

	ds $3

w2d030::
	db

w2d031::
	db

w2d032::
	db

w2d033::
	db

w2d034::
	db

w2d035::
	db

w2d036::
	db

w2d037::
	db

w2d038::
	db

w2d039::
	db

w2d03a::
	db

w2d03b::
	db

w2d03c::
	db

w2d03d::
	db

w2d03e::
	db

w2d03f::
	db

w2d040::
	db

w2d041::
	db

w2d042::
	db

w2d043::
	db

w2d044::
	ds $2

w2d046::
	db

w2d047::
	db

w2d048::
	db

w2d049::
	db

	ds $6

; TOPBARST_* constant
wTopBarState::
	db

wTopBarStateCounter::
	db

	ds $1

; 0: Day/Night spell
; 1: Cutscene
; 2: Collection
; 3: Next map
; 4: Prev map
wTopBarSelection::
	db

wTopBarSelectableButtons::
	db

wOWPalTransitionState::   db
wOWPalTransitionCounter:: db

; which crayons have been collected
; each bit corresponds to CRAYON_*
wCrayonFlags::
	db

wCollectionPage::
	db

wCollectionCell::
	db

	ds $6

wOWPendingTileUpdate::
	db

wOWFuncCounter::
	db

w2d062::
	db

wUnlockedLevelArrowsPtr::
	dw

w2d065::
	db

wLevel1:: db
wLevel2:: db

w2d068::
	db

w2d069::
	db

w2d06a::
	db

wLevel1Coords::
wLevel1YCoord:: db
wLevel1XCoord:: db

wLevel2Coords::
wLevel2YCoord:: db
wLevel2XCoord:: db

w2d06f::
	db

w2d070::
	db

w2d071::
	db

w2d072::
	db

wLevelArrowDirections1:: db
w2d074::                 db
wLevelArrowDirections2:: db
w2d076::                 db

; CUTSCENE_* constant
wCutscene::
	db

w2d078::
	db

wHDMABank::
	db

wAccessibleMapSides::
	db

wIsCollectionOpen::
	db

w2d07c::
	db

w2d07d::
	db

	ds $1

w2d07f::
	db

wTileToPlaceInOW::
	db

wAttrToPlaceInOW::
	db

wOWTilemapPtr::
	dw

	ds $2

wTempOWTilemapPtr::
	dw

	ds $8

wHasMagnifyingGlass::
	db

; BOTBAR_* constant
wBottomBarAction::
	db

wBottomBarState::
	db

wMagnifyingGlassCounter::
	db

wWY::
	db

wWX::
	db

w2d096::
	db

	ds $9

w2d0a0::
	db

w2d0a1::
	db

w2d0a2::
	db

w2d0a3::
	db

w2d0a4::
	db

w2d0a5::
	db

w2d0a6::
	db

w2d0a7::
	db

w2d0a8::
	db

	ds $7

wHDMA::  hdma_config_struct wHDMA
w2d0b5:: hdma_config_struct w2d0b5

	ds $6

	
w2d0c0::
	ds $10

wPalConfig1:: pal_config_struct wPalConfig1
wPalConfig2:: pal_config_struct wPalConfig2

; which PalConfig to fade in FadePalConfig
; 0 = wPalConfig1
; 1 = wPalConfig2
wPalConfigToFade::
	db

; how many times to repeat the fade routine
; higher values means more fade happens per frame
wPalFadeRepeat::
	db

	ds $2

w2d0e0::
	db

wCurPalTotalSteps::
	db

w2d0e2::
	db

w2d0e3::
	db

w2d0e4::
	db

w2d0e5::
	db

	ds $8

w2d0ee::
	db

w2d0ef::
	db

wLevelTreasureIDs::
wLevelGreyTreasureID::  db
wLevelRedTreasureID::   db
wLevelGreenTreasureID:: db
wLevelBlueTreasureID::  db

wLevelTreasurePals::
wLevelGreyTreasurePal::  db
wLevelRedTreasurePal::   db
wLevelGreenTreasurePal:: db
wLevelBlueTreasurePal::  db

	ds $2

wBottomBarFlags::
	db

	ds $1

wBottomBarTreasureIDs::
	ds NUM_LEVEL_TREASURES

w2d100::
	db

w2d101::
	db

	ds $2

w2d104::
	ds $2

w2d106::
	db

; some sprite pointer
w2d107::
	ds $2

; some frameset pointer
w2d109::
	ds $2

wOWAllowedDPadInput::
	db

w2d10c::
	db

w2d10d::
	db

w2d10e::
	db

	ds $1

wCompassObj:: scene_obj_struct wCompassObj

	ds $6

wCurSceneObjPtr::
	ds $2

	ds $1

w2d121::
	db

w2d122::
	db

w2d123::
	ds $1

w2d124::
	db

w2d125::
	db

w2d126::
	db

w2d127::
	db

	ds $1

w2d129::
	db

w2d12a::
	db

w2d12b::
	db

w2d12c::
	db

w2d12d::
	db

w2d12e::
	db

w2d12f::
	db

w2d130::
	db

	ds $1

w2d132::
	db

w2d133::
	db

w2d134::
	db

w2d135::
	db

	ds $2

w2d138::
	db

w2d139::
	db

w2d13a::
	db

w2d13b::
	db

w2d13c::
	db

w2d13d::
	db

w2d13e::
	db

w2d13f::
	db

UNION

wSceneWario:: scene_obj_struct wSceneWario
wSceneWarioStateGroup:: db
wSceneWarioOAMPtr::     dw
wSceneWarioOAMBank::    db

w2d14c::
	db

wSceneWarioIgnoreScroll::
	db

w2d14e::
	db

	ds $1

NEXTU

wOWUIObj1:: scene_obj_struct wOWUIObj1
wOWUIObj2:: scene_obj_struct wOWUIObj2

ENDU

w2d150::
	db

w2d151::
	db

wd152::
wDebugSceneWarioState::
	db

wd153::
	db

wd154::
	db

wd155::
	db

wd156::
	ds $2

wHDMADestVRAMBank::
	db

	ds $5

w2d15e::
	db

	ds $1

w2d160::
	ds $6

w2d166::
	ds $8

w2d16e::
	ds $8

w2d176::
	ds $8

w2d17e::
	ds $2

wCurSceneObj:: scene_obj_struct wCurSceneObj

wSceneObjs::
wSceneObj1::  scene_obj_struct wSceneObj1 
wSceneObj2::  scene_obj_struct wSceneObj2 
wSceneObj3::  scene_obj_struct wSceneObj3 
wSceneObj4::  scene_obj_struct wSceneObj4 
wSceneObj5::  scene_obj_struct wSceneObj5 
wSceneObj6::  scene_obj_struct wSceneObj6 
wSceneObj7::  scene_obj_struct wSceneObj7 
wSceneObj8::  scene_obj_struct wSceneObj8 
wSceneObj9::  scene_obj_struct wSceneObj9 
wSceneObj10:: scene_obj_struct wSceneObj10
wSceneObj11:: scene_obj_struct wSceneObj11
wSceneObj12:: scene_obj_struct wSceneObj12
wSceneObj13:: scene_obj_struct wSceneObj13
wSceneObj14:: scene_obj_struct wSceneObj14
wSceneObj15:: scene_obj_struct wSceneObj15
wSceneObjsEnd::

wAttrmap::
	ds $300

wTilemap::
	ds $300

UNION

w2d800::
wLCDCFlagsToFlip::
	db

w2d801::
	db

	ds $7e

w2d880::
	ds $9

w2d889::
	ds $2

w2d88b::
	db

	ds $2

w2d88e::
	db

w2d88f::
	db

w2d890::
	db

w2d891::
	db

w2d892::
	db

w2d893::
	db

w2d894::
	db

	ds $1

w2d896::
	db

w2d897::
	db

	ds $8

w2d8a0::
	db

w2d8a1::
	db

UNION

wTempleMusicBoxes::
wTempleMusicBox1::  temple_music_box_struct wTempleMusicBox1 
wTempleMusicBox2::  temple_music_box_struct wTempleMusicBox2 
wTempleMusicBox3::  temple_music_box_struct wTempleMusicBox3 
wTempleMusicBox4::  temple_music_box_struct wTempleMusicBox4 
wTempleMusicBox5::  temple_music_box_struct wTempleMusicBox5 

	ds $4

wTempleRocks::
wTempleRock1::  temple_rock_struct wTempleRock1 
wTempleRock2::  temple_rock_struct wTempleRock2 
wTempleRock3::  temple_rock_struct wTempleRock3 
wTempleRock4::  temple_rock_struct wTempleRock4 
wTempleRock5::  temple_rock_struct wTempleRock5 
wTempleRock6::  temple_rock_struct wTempleRock6 
wTempleRock7::  temple_rock_struct wTempleRock7 
wTempleRock8::  temple_rock_struct wTempleRock8 
wTempleRock9::  temple_rock_struct wTempleRock9 
wTempleRock10:: temple_rock_struct wTempleRock10

NEXTU

wPlaneParts::
wPlanePart1::  plane_part_struct wPlanePart1 
wPlanePart2::  plane_part_struct wPlanePart2 
wPlanePart3::  plane_part_struct wPlanePart3 
wPlanePart4::  plane_part_struct wPlanePart4 

	ds $6

w2d8b0::
	db

w2d8b1::
	db

ENDU

	ds $2

w2d8da::
	db

	ds $1

w2d8dc::
	db

	ds $123

; TEMPLE_SCENE_* constant
wTempleScene::
	db

	ds $1

wTempleMusicIsPlaying::    db
wTempleMusicDelayCounter:: db

w2da04::
	db

wTempleSceneCounter::
	db

	ds $7a

wTextPrintInfo::
wTextDelayCounter::  db
wCurTextLine::       db
wCurTextBufferLine:: db
wCurTextLinePos::    db
wCurTextBufferPage:: db
wBGMapToPrintText::  db

	ds $2

; pending character to write to BGMap
wPendingCharDest:: dw
wPendingCharTile:: db
wPendingCharAttr:: db

	ds $4

wTextPrintInfoEnd::

	ds $20

; true if the next objective is to
; go to The Temple to fight A Hidden Figure
wIsNextObjectiveTheTemple::
	db

	ds $4f

wText::
wTextLine1:: ds TEXT_LINE_LENGTH
wTextLine2:: ds TEXT_LINE_LENGTH
wTextLine3:: ds TEXT_LINE_LENGTH
wTextLine4:: ds TEXT_LINE_LENGTH

	ds $40

wClearedTextBuffer::
	ds 8 * TEXT_LINE_LENGTH

wTextBuffer::
wTileBuffer::
	ds $20 tiles

	ds $100

w2df00::
	ds $fc

w2dffc::
	db

w2dffd::
	db

w2dffe::
	db

w2dfff::
	db

NEXTU

	ds 2

wColourFadeDiff::           db
wColourFadeAccumulator::    db
	ds 2
wDayNightTransistionSteps:: db

w2d807::
	db

wColourFadeStep::
	db

w2d809::
	db

	ds $6

wFadePals::
wPalFade1:: pal_fade_struct wPalFade1
wPalFade2:: pal_fade_struct wPalFade2
wPalFade3:: pal_fade_struct wPalFade3
wPalFade4:: pal_fade_struct wPalFade4
wPalFade5:: pal_fade_struct wPalFade5
wPalFade6:: pal_fade_struct wPalFade6
wPalFade7:: pal_fade_struct wPalFade7
wPalFade8:: pal_fade_struct wPalFade8

NEXTU

wCollectionRow::              db
wCollectionCol::              db
wCollectionLinkState::        db
wCollectionLinkStateCounter:: db
wCollectionScrollMode::       db

	ds $b

; set of treasures that are
; linked together
wCollectionLinkedCells::
	ds $7

ENDU

wWRAM2End::

SECTION "Audio RAM", WRAMX

; bit 5: ???
; bit 6: whether to invoke audio callback function
; bit 7: ???
wAudioEngineFlags::
	db

wAudioBankBackup::
	db

	ds $1

wAudioBankCallback::
	dw

wSFXTempo::
	db

w3d006::
	db

w3d007::
	db

w3d008::
	ds $2

wMusicTempo::
	db

w3d00b::
	db

w3d00c::
	db

w3d00d::
	ds $2

wNumAudioChannels::
	db

; points to one of channel_struct
wCurChannelPtr::
	dw

wNumTracks::
	db

wCurTrackPtr::
	dw

; low byte of a sound register:
; sound1 = rAUD1ENV
; sound2 = rAUD2ENV
; sound3 = rAUD3LEVEL
; sound4 = rAUD4ENV
wCurSoundRegister::
	db

	ds $1

wAudioCmdPtr::
	dw

; channel Flags1
wCurChannelFlags::
	db

w3d01a::
	db

wLoadedMusic::
	ds $2

wCurWaveSample::
	db

wVibratoValue::
	db

wAudioCmdArg::
	db

w3d020::
	db

w3d021::
	db

w3d022::
	db

	ds $1

; each bit represents whether a channel is active/inactive
; bit 0: MusicChannel1
; bit 1: MusicChannel2
; ...
wActiveChannels::
	db

w3d025::
	db

wSoundBank::
	db

	ds $11

wCurSoundID::
	ds $2

w3d03a::
	db

w3d03b::
	db

wNumChannels::
	db

	ds $1

wSoundPriority::
	db

wStartChannel::
	db

wChannels::
wChannel1:: channel_struct wChannel1
wChannel2:: channel_struct wChannel2
wChannel3:: channel_struct wChannel3
wChannel4:: channel_struct wChannel4

wMusicChannels::
wChannel5:: channel_struct wChannel5
wChannel6:: channel_struct wChannel6
wChannel7:: channel_struct wChannel7
wChannel8:: channel_struct wChannel8

wTracks::
wTrack1:: track_struct wTrack1
wTrack2:: track_struct wTrack2
wTrack3:: track_struct wTrack3
wTrack4:: track_struct wTrack4

SECTION "GFX RAM", WRAMX

w3d280::
	ds 16 palettes

wRoomBlockAttributes::
	ds $4 * $80

w3d500::
	db

w3d501::
	db

wDPadRepeatCounter::
	db

w3d503::
	db

w3d504::
	ds $2

w3d506::
	db

w3d507::
	ds $2

; if TRUE, Action Help is in
; the initial blacked out state
wActionHelpBlackedOut::
	db

; counts up for each frame in Action Help
wActionHelpCounter::
	db

wActionHelpPowerUp::
	db

wActionHelpState::
	db

w3d50d::
	db

; if TRUE, don't update the animations
; in the Action Help
wActionHelpFrozen::
	db

wTempAnimatedTilesFrameDuration::
	db

wTempAnimatedTilesGroup::
	db

w3d511::
	ds $2

wStartMenuSelection::
wPauseMenuSelection::
	db

wObjAnimWasReset::
	db

UNION
wActionHelpWario:: menu_obj_ext_struct wActionHelpWario
NEXTU
wPlaneWario:: menu_obj_ext_struct wPlaneWario
NEXTU
wClearScreenWario:: menu_obj_ext_struct wClearScreenWario
NEXTU
wGameOverWario:: menu_obj_ext_struct wGameOverWario
NEXTU
wCreditsMusicBox:: menu_obj_ext_struct wCreditsMusicBox
ENDU

wSFXTimer::
	db

wMenuObj1:: menu_obj_struct wMenuObj1
wMenuObj2:: menu_obj_struct wMenuObj2
wMenuObj3:: menu_obj_struct wMenuObj3

wMenuObj4:: menu_obj_struct wMenuObj4
wMenuObj4OAMPtr::               dw
wMenuObj4FramesetBank::         db
wMenuObj4AnimationEnded::       db

wMenuObj5:: menu_obj_struct wMenuObj5
wMenuObj5OAMPtr::               dw
wMenuObj5FramesetBank::         db
wMenuObj5AnimationEnded::       db

wMenuObj6:: menu_obj_struct wMenuObj6
wMenuObj6OAMPtr::               dw
wMenuObj6FramesetBank::         db

wMenuObj7:: menu_obj_struct wMenuObj7
wMenuObj7OAMPtr::               dw
wMenuObj7FramesetBank::         db
wMenuObj7AnimationEnded::       db

wMenuObj8::  menu_obj_struct wMenuObj8 
wMenuObj9::  menu_obj_struct wMenuObj9 
wMenuObj10:: menu_obj_struct wMenuObj10
wMenuObj11:: menu_obj_struct wMenuObj11

SECTION "WRAM4", WRAMX

w4d000::
	ds $1000

SECTION "WRAM5", WRAMX

w5d000::
	ds $1000

SECTION "WRAM6", WRAMX

w6d000::
	ds $1000

SECTION "WRAM7", WRAMX

w7d000::
	ds $1000
