SECTION "Title Palettes", ROMX

INCLUDE "data/title/palettes.asm"


SECTION "Title Gfx", ROMX

TitleScreenGfx:: INCBIN "gfx/intro/title_screen.2bpp.rle"
PlaneGfx::       INCBIN "gfx/intro/plane.2bpp.rle"

BGMap_697a:: INCBIN "gfx/bgmaps/map_697a.bin"
BGMap_6ae7:: INCBIN "gfx/bgmaps/map_6ae7.bin"
BGMap_6b47:: INCBIN "gfx/bgmaps/map_6b47.bin"


SECTION "Title OAM", ROMX

INCLUDE "data/title/oam.asm"


SECTION "Title Framesets", ROMX

INCLUDE "data/title/framesets.asm"

Pals_71b0::
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  7,  0

	rgb 31, 25, 9
	rgb 21, 15, 4
	rgb 13,  8, 1
	rgb 0,   0, 0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

TimeAttack1JPTextMap:: INCBIN "gfx/bgmaps/text/time_attack1_en.bin"
TimeAttack2JPTextMap:: INCBIN "gfx/bgmaps/text/time_attack2_en.bin"
TimeAttack1ENTextMap:: INCBIN "gfx/bgmaps/text/time_attack1_jp.bin"
TimeAttack2ENTextMap:: INCBIN "gfx/bgmaps/text/time_attack2_jp.bin"

INCLUDE "data/ow/epilogue/oam.asm"
INCLUDE "data/ow/epilogue/framesets.asm"

SECTION "Wario Gfx 1", ROMX

WarioIdleGfx::     INCBIN "gfx/wario/idle.2bpp"
WarioWalkGfx::     INCBIN "gfx/wario/walk.2bpp"
WarioDizzyGfx::    INCBIN "gfx/wario/dizzy.2bpp"
WarioAttackGfx::   INCBIN "gfx/wario/attack.2bpp"
WarioSwimGfx::     INCBIN "gfx/wario/swim.2bpp"
WarioLadderGfx::   INCBIN "gfx/wario/ladder.2bpp"
WarioThrowGfx::    INCBIN "gfx/wario/throw.2bpp"
WarioAirborneGfx:: INCBIN "gfx/wario/airborne.2bpp"


SECTION "Wario Gfx 2", ROMX

WarioHotGfx::      INCBIN "gfx/wario/hot.2bpp"
WarioBurntGfx::    INCBIN "gfx/wario/burnt.2bpp"
WarioSlideGfx::    INCBIN "gfx/wario/slide.2bpp"
WarioStringGfx::   INCBIN "gfx/wario/string.2bpp"
WarioFatGfx::      INCBIN "gfx/wario/fat.2bpp"
WarioElectricGfx:: INCBIN "gfx/wario/electric.2bpp"
WarioPuffyGfx::    INCBIN "gfx/wario/puffy.2bpp"


SECTION "Wario Gfx 3", ROMX

WarioZombieGfx::  INCBIN "gfx/wario/zombie.2bpp"
WarioBouncyGfx::  INCBIN "gfx/wario/bouncy.2bpp"
WarioCrazyGfx::   INCBIN "gfx/wario/crazy.2bpp"
WarioBatGfx::     INCBIN "gfx/wario/bat.2bpp"
WarioVampireGfx:: INCBIN "gfx/wario/vampire.2bpp"
WarioBubbleGfx::  INCBIN "gfx/wario/bubble.2bpp"
WarioClearGfx::   INCBIN "gfx/wario/clear.2bpp"
WarioHangGfx::    INCBIN "gfx/wario/hang.2bpp"


SECTION "Wario Gfx 4", ROMX

WarioSnowmanGfx::  INCBIN "gfx/wario/snowman.2bpp"
WarioSnowballGfx:: INCBIN "gfx/wario/snowball.2bpp"
WarioFanGfx::      INCBIN "gfx/wario/fan.2bpp"
WarioLaunchGfx::   INCBIN "gfx/wario/launch.2bpp"
WarioMagicGfx::    INCBIN "gfx/wario/magic.2bpp"
WarioBallGfx::     INCBIN "gfx/wario/ball.2bpp"


SECTION "Enemy Gfx 1 Slot 1", ROMX

SpearheadGfx::     INCBIN "gfx/enemies/spearhead.2bpp.rle"
UnusedFlowerGfx::  INCBIN "gfx/enemies/unused_flower.2bpp.rle"
MizuuoGfx::        INCBIN "gfx/enemies/mizuuo.2bpp.rle"
SilkyGfx::         INCBIN "gfx/enemies/silky.2bpp.rle"
SnakeGfx::         INCBIN "gfx/enemies/snake.2bpp.rle"
PrinceFroggyGfx::  INCBIN "gfx/enemies/prince_froggy.2bpp.rle"
MadSciensteinGfx:: INCBIN "gfx/enemies/mad_scienstein.2bpp.rle"
Sun1Gfx::          INCBIN "gfx/enemies/sun1.2bpp.rle"
Moon1Gfx::         INCBIN "gfx/enemies/moon1.2bpp.rle"
RoboMouse1Gfx::    INCBIN "gfx/enemies/robo_mouse1.2bpp.rle"
HaridamaGfx::      INCBIN "gfx/enemies/haridama.2bpp.rle"
OwlGfx::           INCBIN "gfx/enemies/owl.2bpp.rle"
StoveGfx::         INCBIN "gfx/enemies/stove.2bpp.rle"
WaterSparkGfx::    INCBIN "gfx/enemies/water_spark.2bpp.rle"


SECTION "Enemy Gfx 1 Slot 2", ROMX

WebberGfx::             INCBIN "gfx/enemies/webber.2bpp.rle"
CountRichtertoffenGfx:: INCBIN "gfx/enemies/count_richtertoffen.2bpp.rle"
ParaGoomGfx::           INCBIN "gfx/enemies/para_goom.2bpp.rle"
KushimushiGfx::         INCBIN "gfx/enemies/kushimushi.2bpp.rle"
BirdGfx::               INCBIN "gfx/enemies/bird.2bpp.rle"
ApplebyGfx::            INCBIN "gfx/enemies/appleby.2bpp.rle"
HammerBotGfx::          INCBIN "gfx/enemies/hammer_bot.2bpp.rle"
PneumoGfx::             INCBIN "gfx/enemies/pneumo.2bpp.rle"
Sun2Gfx::               INCBIN "gfx/enemies/sun2.2bpp.rle"
Moon2Gfx::              INCBIN "gfx/enemies/moon2.2bpp.rle"
RoboMouse2Gfx::         INCBIN "gfx/enemies/robo_mouse2.2bpp.rle"
ClearGate1Gfx::         INCBIN "gfx/enemies/clear_gate.2bpp.rle"


SECTION "Enemy Gfx 1 Slot 3", ROMX

FutamoguGfx::    INCBIN "gfx/enemies/futamogu.2bpp.rle"
HebariiGfx::     INCBIN "gfx/enemies/hebarii.2bpp.rle"
DoughnuteerGfx:: INCBIN "gfx/enemies/doughnuteer.2bpp.rle"
BigLeafGfx::     INCBIN "gfx/enemies/big_leaf.2bpp.rle"
ZombieGfx::      INCBIN "gfx/enemies/zombie.2bpp.rle"
SpearBotGfx::    INCBIN "gfx/enemies/spear_bot.2bpp.rle"
OmodonGfx::      INCBIN "gfx/enemies/omodon.2bpp.rle"
KobattoGfx::     INCBIN "gfx/enemies/kobatto.2bpp.rle"
HandGfx::        INCBIN "gfx/enemies/hand.2bpp.rle"
BubbleGfx::      INCBIN "gfx/enemies/bubble.2bpp.rle"
CartGfx::        INCBIN "gfx/enemies/cart.2bpp.rle"
ZipLineGfx::     INCBIN "gfx/enemies/zip_line.2bpp.rle"
FlameBlockGfx::  INCBIN "gfx/enemies/flame_block.2bpp.rle"
ClearGate2Gfx::  INCBIN "gfx/enemies/clear_gate.2bpp.rle"
TadpoleGfx::     INCBIN "gfx/enemies/tadpole.2bpp.rle"
RockGfx::        INCBIN "gfx/enemies/rock.2bpp.rle"
FireGfx::        INCBIN "gfx/enemies/fire.2bpp.rle"
WallCrackGfx::   INCBIN "gfx/enemies/wall_crack.2bpp.rle"


SECTION "Enemy Gfx 1 Slot 4", ROMX

TorchGfx::          INCBIN "gfx/enemies/torch.2bpp.rle"
FireBotGfx::        INCBIN "gfx/enemies/fire_bot.2bpp.rle"
BeamBotGfx::        INCBIN "gfx/enemies/beam_bot.2bpp.rle"
BarrelGfx::         INCBIN "gfx/enemies/barrel.2bpp.rle"
SmallLeafGfx::      INCBIN "gfx/enemies/small_leaf.2bpp.rle"
ElectricLampGfx::   INCBIN "gfx/enemies/electric_lamp.2bpp.rle"
TeruteruGfx::       INCBIN "gfx/enemies/teruteru.2bpp.rle"
OmodonmekaGfx::     INCBIN "gfx/enemies/omodonmeka.2bpp.rle"
BrrrBearGfx::       INCBIN "gfx/enemies/brrr_bear.2bpp.rle"
TogebaGfx::         INCBIN "gfx/enemies/togeba.2bpp.rle"
FallingSnowGfx::    INCBIN "gfx/enemies/falling_snow.2bpp.rle"
PillarPlatformGfx:: INCBIN "gfx/enemies/pillar_platform.2bpp.rle"
WaterDropGfx::      INCBIN "gfx/enemies/water_drop.2bpp.rle"
NobiiruGfx::        INCBIN "gfx/enemies/nobiiru.2bpp.rle"
ClearGate3Gfx::     INCBIN "gfx/enemies/clear_gate.2bpp.rle"
OctohonGfx::        INCBIN "gfx/enemies/octohon.2bpp.rle"
SparkGfx::          INCBIN "gfx/enemies/spark.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 1", ROMX

Anonster1Gfx::    INCBIN "gfx/enemies/anonster1.2bpp.rle"
DollBoy1Gfx::     INCBIN "gfx/enemies/doll_boy1.2bpp.rle"
Wormwould1Gfx::   INCBIN "gfx/enemies/wormwould1.2bpp.rle"
YellowBelly1Gfx:: INCBIN "gfx/enemies/yellow_belly1.2bpp.rle"
Pesce1Gfx::       INCBIN "gfx/enemies/pesce1.2bpp.rle"
Scowler1Gfx::     INCBIN "gfx/enemies/scowler1.2bpp.rle"
Jamano1Gfx::      INCBIN "gfx/enemies/jamano1.2bpp.rle"
Muddee1Gfx::      INCBIN "gfx/enemies/muddee1.2bpp.rle"
Wolfenboss1Gfx::  INCBIN "gfx/enemies/wolfenboss1.2bpp.rle"
Shoot1Gfx::       INCBIN "gfx/enemies/shoot1.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 2", ROMX

Anonster2Gfx::    INCBIN "gfx/enemies/anonster2.2bpp.rle"
DollBoy2Gfx::     INCBIN "gfx/enemies/doll_boy2.2bpp.rle"
Wormwould2Gfx::   INCBIN "gfx/enemies/wormwould2.2bpp.rle"
YellowBelly2Gfx:: INCBIN "gfx/enemies/yellow_belly2.2bpp.rle"
Pesce2Gfx::       INCBIN "gfx/enemies/pesce2.2bpp.rle"
Scowler2Gfx::     INCBIN "gfx/enemies/scowler2.2bpp.rle"
Jamano2Gfx::      INCBIN "gfx/enemies/jamano2.2bpp.rle"
Muddee2Gfx::      INCBIN "gfx/enemies/muddee2.2bpp.rle"
Wolfenboss2Gfx::  INCBIN "gfx/enemies/wolfenboss2.2bpp.rle"
Shoot2Gfx::       INCBIN "gfx/enemies/shoot2.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 3", ROMX

Anonster3Gfx::    INCBIN "gfx/enemies/anonster3.2bpp.rle"
DollBoy3Gfx::     INCBIN "gfx/enemies/doll_boy3.2bpp.rle"
Wormwould3Gfx::   INCBIN "gfx/enemies/wormwould3.2bpp.rle"
YellowBelly3Gfx:: INCBIN "gfx/enemies/yellow_belly3.2bpp.rle"
Pesce3Gfx::       INCBIN "gfx/enemies/pesce3.2bpp.rle"
Scowler3Gfx::     INCBIN "gfx/enemies/scowler3.2bpp.rle"
Jamano3Gfx::      INCBIN "gfx/enemies/jamano3.2bpp.rle"
Muddee3Gfx::      INCBIN "gfx/enemies/muddee3.2bpp.rle"
Wolfenboss3Gfx::  INCBIN "gfx/enemies/wolfenboss3.2bpp.rle"
Shoot3Gfx::       INCBIN "gfx/enemies/shoot3.2bpp.rle"


SECTION "Enemy Gfx 2 Slot 4", ROMX

Anonster4Gfx::    INCBIN "gfx/enemies/anonster4.2bpp.rle"
DollBoy4Gfx::     INCBIN "gfx/enemies/doll_boy4.2bpp.rle"
Wormwould4Gfx::   INCBIN "gfx/enemies/wormwould4.2bpp.rle"
YellowBelly4Gfx:: INCBIN "gfx/enemies/yellow_belly4.2bpp.rle"
Pesce4Gfx::       INCBIN "gfx/enemies/pesce4.2bpp.rle"
Scowler4Gfx::     INCBIN "gfx/enemies/scowler4.2bpp.rle"
Jamano4Gfx::      INCBIN "gfx/enemies/jamano4.2bpp.rle"
Muddee4Gfx::      INCBIN "gfx/enemies/muddee4.2bpp.rle"
Wolfenboss4Gfx::  INCBIN "gfx/enemies/wolfenboss4.2bpp.rle"
Shoot4Gfx::       INCBIN "gfx/enemies/shoot4.2bpp.rle"


SECTION "Wario OAM 1", ROMX

INCLUDE "gfx/oam/wario1.asm"


SECTION "Wario OAM 2", ROMX

INCLUDE "gfx/oam/wario2.asm"


SECTION "Wario OAM 3", ROMX

INCLUDE "gfx/oam/wario3.asm"


SECTION "Object Framesets", ROMX

INCLUDE "gfx/oam/object_framesets.asm"


SECTION "Objects OAM 1", ROMX

INCLUDE "gfx/oam/objects1.asm"


SECTION "Objects OAM 2", ROMX

INCLUDE "gfx/oam/objects2.asm"


SECTION "Objects OAM 3", ROMX

INCLUDE "gfx/oam/objects3.asm"


SECTION "Objects OAM 4", ROMX

INCLUDE "gfx/oam/objects4.asm"


SECTION "Objects OAM 5", ROMX

INCLUDE "gfx/oam/objects5.asm"


SECTION "Objects OAM 6", ROMX

INCLUDE "gfx/oam/objects6.asm"


SECTION "Level Palettes", ROMX

INCLUDE "data/levels/palettes.asm"


SECTION "Animated Tile GFX", ROMX

AnimatedTilesGfx::
AnimatedTiles1Gfx::  INCBIN "gfx/levels/animated/animated_tiles1.2bpp"  ; ANIMATED_TILES_GFX_00
AnimatedTiles2Gfx::  INCBIN "gfx/levels/animated/animated_tiles2.2bpp"  ; ANIMATED_TILES_GFX_01
AnimatedTiles3Gfx::  INCBIN "gfx/levels/animated/animated_tiles3.2bpp"  ; ANIMATED_TILES_GFX_02
AnimatedTiles4Gfx::  INCBIN "gfx/levels/animated/animated_tiles4.2bpp"  ; ANIMATED_TILES_GFX_03
AnimatedTiles5Gfx::  INCBIN "gfx/levels/animated/animated_tiles5.2bpp"  ; ANIMATED_TILES_GFX_04
AnimatedTiles6Gfx::  INCBIN "gfx/levels/animated/animated_tiles6.2bpp"  ; ANIMATED_TILES_GFX_05
AnimatedTiles7Gfx::  INCBIN "gfx/levels/animated/animated_tiles7.2bpp"  ; ANIMATED_TILES_GFX_06
AnimatedTiles8Gfx::  INCBIN "gfx/levels/animated/animated_tiles8.2bpp"  ; ANIMATED_TILES_GFX_07
AnimatedTiles9Gfx::  INCBIN "gfx/levels/animated/animated_tiles9.2bpp"  ; ANIMATED_TILES_GFX_08
AnimatedTiles10Gfx:: INCBIN "gfx/levels/animated/animated_tiles10.2bpp" ; ANIMATED_TILES_GFX_09
AnimatedTiles11Gfx:: INCBIN "gfx/levels/animated/animated_tiles11.2bpp" ; ANIMATED_TILES_GFX_10
AnimatedTiles12Gfx:: INCBIN "gfx/levels/animated/animated_tiles12.2bpp" ; ANIMATED_TILES_GFX_11
AnimatedTiles13Gfx:: INCBIN "gfx/levels/animated/animated_tiles13.2bpp" ; ANIMATED_TILES_GFX_12
AnimatedTiles14Gfx:: INCBIN "gfx/levels/animated/animated_tiles14.2bpp" ; ANIMATED_TILES_GFX_13
AnimatedTiles15Gfx:: INCBIN "gfx/levels/animated/animated_tiles15.2bpp" ; ANIMATED_TILES_GFX_14
AnimatedTiles16Gfx:: INCBIN "gfx/levels/animated/animated_tiles16.2bpp" ; ANIMATED_TILES_GFX_15
AnimatedTiles17Gfx:: INCBIN "gfx/levels/animated/animated_tiles17.2bpp" ; ANIMATED_TILES_GFX_16
AnimatedTiles18Gfx:: INCBIN "gfx/levels/animated/animated_tiles18.2bpp" ; ANIMATED_TILES_GFX_17
AnimatedTiles19Gfx:: INCBIN "gfx/levels/animated/animated_tiles19.2bpp" ; ANIMATED_TILES_GFX_18
AnimatedTiles20Gfx:: INCBIN "gfx/levels/animated/animated_tiles20.2bpp" ; ANIMATED_TILES_GFX_19
AnimatedTiles21Gfx:: INCBIN "gfx/levels/animated/animated_tiles21.2bpp" ; ANIMATED_TILES_GFX_20
AnimatedTiles22Gfx:: INCBIN "gfx/levels/animated/animated_tiles22.2bpp" ; ANIMATED_TILES_GFX_21
AnimatedTiles23Gfx:: INCBIN "gfx/levels/animated/animated_tiles23.2bpp" ; ANIMATED_TILES_GFX_22
AnimatedTiles24Gfx:: INCBIN "gfx/levels/animated/animated_tiles24.2bpp" ; ANIMATED_TILES_GFX_23
