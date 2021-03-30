INCLUDE "macros.asm"
INCLUDE "constants.asm"

INCLUDE "engine/home.asm"


SECTION "Bank 1", ROMX

INCLUDE "engine/bank1.asm"


SECTION "Bank 2", ROMX

INCLUDE "engine/bank2.asm"


SECTION "Bank 3", ROMX

INCLUDE "engine/bank3.asm"


SECTION "Bank 4", ROMX

	INCROM $10000, $14000


SECTION "Framesets 1", ROMX

INCLUDE "gfx/framesets1.asm"


SECTION "Bank 6", ROMX

INCLUDE "engine/bank6.asm"


SECTION "Bank 7", ROMX

INCLUDE "engine/bank7.asm"


SECTION "Bank 8", ROMX

INCLUDE "engine/bank8.asm"


SECTION "Bank 9", ROMX

	INCROM $24000, $27800


SECTION "Bank A", ROMX

INCLUDE "engine/banka.asm"


SECTION "Bank B", ROMX

	INCROM $2c000, $30000


SECTION "Bank C", ROMX

INCLUDE "engine/bankc.asm"


SECTION "Bank D", ROMX

	INCROM $34000, $38000


SECTION "Bank E", ROMX

	INCROM $38000, $3c000


SECTION "Bank F", ROMX

INCLUDE "engine/bankf.asm"


SECTION "Bank 10", ROMX

	INCROM $40000, $43a48


SECTION "Bank 11", ROMX

	INCROM $44000, $47db3


SECTION "Bank 12", ROMX

	INCROM $48000, $4ab1e


SECTION "Bank 13", ROMX

	INCROM $4c000, $4d8fa


SECTION "Bank 14", ROMX

	INCROM $50000, $52665


SECTION "Bank 15", ROMX

	INCROM $54000, $57300


SECTION "Bank 18", ROMX

INCLUDE "engine/bank18.asm"


SECTION "Bank 19", ROMX

INCLUDE "engine/bank19.asm"


SECTION "Bank 1A", ROMX

	INCROM $68000, $6a150


SECTION "Bank 20", ROMX

INCLUDE "engine/bank20.asm"


SECTION "Bank 21", ROMX

	INCROM $84000, $86b5d


SECTION "Bank 22", ROMX

	INCROM $88000, $8c000


SECTION "Bank 23", ROMX

	INCROM $8c000, $8ea1a


SECTION "Bank 24", ROMX

	INCROM $90000, $94000


SECTION "Bank 25", ROMX

	INCROM $94000, $98000


SECTION "Bank 26", ROMX

INCLUDE "engine/bank26.asm"


SECTION "Bank 27", ROMX

	INCROM $9c000, $a0000


SECTION "Bank 28", ROMX

	INCROM $a0000, $a4000


SECTION "Bank 29", ROMX

	INCROM $a4000, $a796d


SECTION "Bank 2A", ROMX

	INCROM $a8000, $ab16a


SECTION "Bank 2B", ROMX

	INCROM $ac000, $b0000


SECTION "Bank 2C", ROMX

INCLUDE "engine/bank2c.asm"


SECTION "Bank 2D", ROMX

	INCROM $b4000, $b7d12


SECTION "Bank 2E", ROMX

	INCROM $b8000, $baade


SECTION "Bank 2F", ROMX

	INCROM $bc000, $bf92c


SECTION "Bank 30", ROMX

INCLUDE "engine/bank30.asm"


SECTION "Bank 31", ROMX

INCLUDE "engine/bank31.asm"


SECTION "Permission Maps 1", ROMX

INCLUDE "data/levels/permission_maps1.asm"


SECTION "Palettes", ROMX

INCLUDE "gfx/palettes.asm"


SECTION "Bank 34", ROMX

INCLUDE "engine/bank34.asm"


SECTION "Bank 35", ROMX

INCLUDE "engine/bank35.asm"


SECTION "Bank 36", ROMX

INCLUDE "engine/bank36.asm"


SECTION "Bank 37", ROMX

INCLUDE "engine/bank37.asm"


SECTION "Bank 38", ROMX

	INCROM $e0000, $e3d04


SECTION "Bank 39", ROMX

	INCROM $e4000, $e7e76


SECTION "Bank 3A", ROMX

	INCROM $e8000, $eb478


SECTION "Bank 3B", ROMX

	INCROM $ec000, $eff0d


SECTION "Bank 3C", ROMX

	INCROM $f0000, $f3c16


SECTION "Bank 3D", ROMX

	INCROM $f4000, $f78b4


SECTION "Bank 3E", ROMX

	INCROM $f8000, $fb5b0


SECTION "Bank 3F", ROMX

	INCROM $fc000, $ffb97


SECTION "Bank 40", ROMX

	INCROM $100000, $103e21


SECTION "Bank 41", ROMX

	INCROM $104000, $107322


SECTION "Bank 42", ROMX

	INCROM $108000, $10bf09


SECTION "Bank 43", ROMX

	INCROM $10c000, $10f437


SECTION "Bank 44", ROMX

	INCROM $110000, $112757


SECTION "Bank 45", ROMX

	INCROM $114000, $117aa6


SECTION "Bank 46", ROMX

	INCROM $118000, $11b746


SECTION "Bank 47", ROMX

	INCROM $11c000, $11e4f9


SECTION "Bank 48", ROMX

	INCROM $120000, $12315d


SECTION "Bank 49", ROMX

	INCROM $124000, $12526f


SECTION "Room Special Tiles 1", ROMX

INCLUDE "data/levels/special_tiles1.asm"


SECTION "Room Special Tiles 2", ROMX

INCLUDE "data/levels/special_tiles2.asm"


SECTION "Permission Maps 2", ROMX

INCLUDE "data/levels/permission_maps2.asm"


SECTION "Room Main Tiles 1", ROMX

INCLUDE "data/levels/main_tiles1.asm"


SECTION "Room Main Tiles 2", ROMX

INCLUDE "data/levels/main_tiles2.asm"


SECTION "Room Main Tiles 3", ROMX

INCLUDE "data/levels/main_tiles3.asm"


SECTION "Room Main Tiles 4", ROMX

INCLUDE "data/levels/main_tiles4.asm"


SECTION "Room Main Tiles 5", ROMX

INCLUDE "data/levels/main_tiles5.asm"


SECTION "Bank 56", ROMX

	INCROM $158000, $158ba3


SECTION "Bank 57", ROMX

	INCROM $15c000, $15ee8d


SECTION "Bank 58", ROMX

INCLUDE "engine/bank58.asm"


SECTION "Bank 60", ROMX

	INCROM $180000, $181eb6


SECTION "Bank 61", ROMX

	INCROM $184000, $185ce5


SECTION "Bank 62", ROMX

	INCROM $188000, $18ac38


SECTION "Bank 63", ROMX

	INCROM $18c000, $18d07c


SECTION "Bank 64", ROMX

	INCROM $190000, $193134


SECTION "Bank 65", ROMX

	INCROM $194000, $196fa6


SECTION "Enemy Gfx 1", ROMX

SpearheadGfx::     INCBIN "gfx/enemies/spearhead.2bpp.lz"
UnusedFlowerGfx::  INCBIN "gfx/enemies/unused_flower.2bpp.lz"
MizuuoGfx::        INCBIN "gfx/enemies/mizuuo.2bpp.lz"
SilkyGfx::         INCBIN "gfx/enemies/silky.2bpp.lz"
SnakeGfx::         INCBIN "gfx/enemies/snake.2bpp.lz"
PrinceFroggyGfx::  INCBIN "gfx/enemies/prince_froggy.2bpp.lz"
MadSciensteinGfx:: INCBIN "gfx/enemies/mad_scienstein.2bpp.lz"
Sun1Gfx::          INCBIN "gfx/enemies/sun1.2bpp.lz"
Moon1Gfx::         INCBIN "gfx/enemies/moon1.2bpp.lz"
RoboMouse1Gfx::    INCBIN "gfx/enemies/robo_mouse1.2bpp.lz"
HaridamaGfx::      INCBIN "gfx/enemies/haridama.2bpp.lz"
OwlGfx::           INCBIN "gfx/enemies/owl.2bpp.lz"
StoveGfx::         INCBIN "gfx/enemies/stove.2bpp.lz"
WaterSparkGfx::    INCBIN "gfx/enemies/water_spark.2bpp.lz"


SECTION "Enemy Gfx 2", ROMX

WebberGfx::             INCBIN "gfx/enemies/webber.2bpp.lz"
CountRichtertoffenGfx:: INCBIN "gfx/enemies/count_richtertoffen.2bpp.lz"
ParaGoomGfx::           INCBIN "gfx/enemies/para_goom.2bpp.lz"
KushimushiGfx::         INCBIN "gfx/enemies/kushimushi.2bpp.lz"
BirdGfx::               INCBIN "gfx/enemies/bird.2bpp.lz"
ApplebyGfx::            INCBIN "gfx/enemies/appleby.2bpp.lz"
HammerBotGfx::          INCBIN "gfx/enemies/hammer_bot.2bpp.lz"
PneumoGfx::             INCBIN "gfx/enemies/pneumo.2bpp.lz"
Sun2Gfx::               INCBIN "gfx/enemies/sun2.2bpp.lz"
Moon2Gfx::              INCBIN "gfx/enemies/moon2.2bpp.lz"
RoboMouse2Gfx::         INCBIN "gfx/enemies/robo_mouse2.2bpp.lz"
ClearGate1Gfx::         INCBIN "gfx/enemies/clear_gate1.2bpp.lz"


SECTION "Enemy Gfx 3", ROMX

FutamoguGfx::    INCBIN "gfx/enemies/futamogu.2bpp.lz"
HebariiGfx::     INCBIN "gfx/enemies/hebarii.2bpp.lz"
DoughnuteerGfx:: INCBIN "gfx/enemies/doughnuteer.2bpp.lz"
BigLeafGfx::     INCBIN "gfx/enemies/big_leaf.2bpp.lz"
ZombieGfx::      INCBIN "gfx/enemies/zombie.2bpp.lz"
SpearBotGfx::    INCBIN "gfx/enemies/spear_bot.2bpp.lz"
OmodonGfx::      INCBIN "gfx/enemies/omodon.2bpp.lz"
KobattoGfx::     INCBIN "gfx/enemies/kobatto.2bpp.lz"
HandGfx::        INCBIN "gfx/enemies/hand.2bpp.lz"
BubbleGfx::      INCBIN "gfx/enemies/bubble.2bpp.lz"
CartGfx::        INCBIN "gfx/enemies/cart.2bpp.lz"
ZipLineGfx::     INCBIN "gfx/enemies/zip_line.2bpp.lz"
FlameBlockGfx::  INCBIN "gfx/enemies/flame_block.2bpp.lz"
ClearGate2Gfx::  INCBIN "gfx/enemies/clear_gate2.2bpp.lz"
TadpoleGfx::     INCBIN "gfx/enemies/tadpole.2bpp.lz"
RockGfx::        INCBIN "gfx/enemies/rock.2bpp.lz"
FireGfx::        INCBIN "gfx/enemies/fire.2bpp.lz"
WallCrackGfx::   INCBIN "gfx/enemies/wall_crack.2bpp.lz"


SECTION "Enemy Gfx 4", ROMX

TorchGfx::          INCBIN "gfx/enemies/torch.2bpp.lz"
FireBotGfx::        INCBIN "gfx/enemies/fire_bot.2bpp.lz"
BeamBotGfx::        INCBIN "gfx/enemies/beam_bot.2bpp.lz"
BarrelGfx::         INCBIN "gfx/enemies/barrel.2bpp.lz"
SmallLeafGfx::      INCBIN "gfx/enemies/small_leaf.2bpp.lz"
ElectricLampGfx::   INCBIN "gfx/enemies/electric_lamp.2bpp.lz"
TeruteruGfx::       INCBIN "gfx/enemies/teruteru.2bpp.lz"
OmodonmekaGfx::     INCBIN "gfx/enemies/omodonmeka.2bpp.lz"
BrrrBearGfx::       INCBIN "gfx/enemies/brrr_bear.2bpp.lz"
TogebaGfx::         INCBIN "gfx/enemies/togeba.2bpp.lz"
FallingSnowGfx::    INCBIN "gfx/enemies/falling_snow.2bpp.lz"
PillarPlatformGfx:: INCBIN "gfx/enemies/pillar_platform.2bpp.lz"
WaterDropGfx::      INCBIN "gfx/enemies/water_drop.2bpp.lz"
NobiiruGfx::        INCBIN "gfx/enemies/nobiiru.2bpp.lz"
ClearGate3Gfx::     INCBIN "gfx/enemies/clear_gate3.2bpp.lz"
OctohonGfx::        INCBIN "gfx/enemies/octohon.2bpp.lz"
SparkGfx::          INCBIN "gfx/enemies/spark.2bpp.lz"


SECTION "Enemy Gfx 5", ROMX

Anonster1Gfx::    INCBIN "gfx/enemies/anonster1.2bpp.lz"
DollBoy1Gfx::     INCBIN "gfx/enemies/doll_boy1.2bpp.lz"
Wormwould1Gfx::   INCBIN "gfx/enemies/wormwould1_matching.2bpp.lz"
YellowBelly1Gfx:: INCBIN "gfx/enemies/yellow_belly1.2bpp.lz"
Pesce1Gfx::       INCBIN "gfx/enemies/pesce1.2bpp.lz"
Scowler1Gfx::     INCBIN "gfx/enemies/scowler1.2bpp.lz"
Jamano1Gfx::      INCBIN "gfx/enemies/jamano1.2bpp.lz"
Muddee1Gfx::      INCBIN "gfx/enemies/muddee1.2bpp.lz"
Wolfenboss1Gfx::  INCBIN "gfx/enemies/wolfenboss1.2bpp.lz"
Shoot1Gfx::       INCBIN "gfx/enemies/shoot1.2bpp.lz"


SECTION "Enemy Gfx 6", ROMX

Anonster2Gfx::    INCBIN "gfx/enemies/anonster2_matching.2bpp.lz"
DollBoy2Gfx::     INCBIN "gfx/enemies/doll_boy2.2bpp.lz"
Wormwould2Gfx::   INCBIN "gfx/enemies/wormwould2.2bpp.lz"
YellowBelly2Gfx:: INCBIN "gfx/enemies/yellow_belly2.2bpp.lz"
Pesce2Gfx::       INCBIN "gfx/enemies/pesce2.2bpp.lz"
Scowler2Gfx::     INCBIN "gfx/enemies/scowler2_matching.2bpp.lz"
Jamano2Gfx::      INCBIN "gfx/enemies/jamano2.2bpp.lz"
Muddee2Gfx::      INCBIN "gfx/enemies/muddee2_matching.2bpp.lz"
Wolfenboss2Gfx::  INCBIN "gfx/enemies/wolfenboss2.2bpp.lz"
Shoot2Gfx::       INCBIN "gfx/enemies/shoot2.2bpp.lz"


SECTION "Enemy Gfx 7", ROMX

Anonster3Gfx::    INCBIN "gfx/enemies/anonster3.2bpp.lz"
DollBoy3Gfx::     INCBIN "gfx/enemies/doll_boy3.2bpp.lz"
Wormwould3Gfx::   INCBIN "gfx/enemies/wormwould3.2bpp.lz"
YellowBelly3Gfx:: INCBIN "gfx/enemies/yellow_belly3.2bpp.lz"
Pesce3Gfx::       INCBIN "gfx/enemies/pesce3.2bpp.lz"
Scowler3Gfx::     INCBIN "gfx/enemies/scowler3.2bpp.lz"
Jamano3Gfx::      INCBIN "gfx/enemies/jamano3.2bpp.lz"
Muddee3Gfx::      INCBIN "gfx/enemies/muddee3.2bpp.lz"
Wolfenboss3Gfx::  INCBIN "gfx/enemies/wolfenboss3.2bpp.lz"
Shoot3Gfx::       INCBIN "gfx/enemies/shoot3.2bpp.lz"


SECTION "Enemy Gfx 8", ROMX

Anonster4Gfx::    INCBIN "gfx/enemies/anonster4.2bpp.lz"
DollBoy4Gfx::     INCBIN "gfx/enemies/doll_boy4.2bpp.lz"
Wormwould4Gfx::   INCBIN "gfx/enemies/wormwould4.2bpp.lz"
YellowBelly4Gfx:: INCBIN "gfx/enemies/yellow_belly4.2bpp.lz"
Pesce4Gfx::       INCBIN "gfx/enemies/pesce4.2bpp.lz"
Scowler4Gfx::     INCBIN "gfx/enemies/scowler4.2bpp.lz"
Jamano4Gfx::      INCBIN "gfx/enemies/jamano4.2bpp.lz"
Muddee4Gfx::      INCBIN "gfx/enemies/muddee4.2bpp.lz"
Wolfenboss4Gfx::  INCBIN "gfx/enemies/wolfenboss4.2bpp.lz"
Shoot4Gfx::       INCBIN "gfx/enemies/shoot4.2bpp.lz"


SECTION "Bank 70", ROMX

	INCROM $1c0000, $1c37cc


SECTION "Bank 71", ROMX

	INCROM $1c4000, $1c5e07


SECTION "Bank 72", ROMX

INCLUDE "engine/bank72.asm"


SECTION "Bank 76", ROMX

	INCROM $1d8000, $1db800


SECTION "Framesets 3", ROMX

INCLUDE "gfx/framesets3.asm"


SECTION "Bank 78", ROMX

	INCROM $1e0000, $1e1dd1


SECTION "Bank 79", ROMX

	INCROM $1e4000, $1e6fd3


SECTION "Bank 7A", ROMX

	INCROM $1e8000, $1eb000


SECTION "Bank 7B", ROMX

INCLUDE "engine/bank7b.asm"


SECTION "Bank 7C", ROMX

INCLUDE "engine/bank7c.asm"


SECTION "Bank 7D", ROMX

INCLUDE "engine/bank7d.asm"


SECTION "Bank 7E", ROMX

INCLUDE "engine/bank7e.asm"


SECTION "Framesets 2", ROMX

INCLUDE "gfx/framesets2.asm"
