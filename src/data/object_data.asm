; \1 OAM ptr
; \2 unknown
; \3 interaction type
; \4 collision box top
; \5 update function
; \6 object flags
MACRO object_data
assert (BANK(\1) - BANK("Objects OAM 1")) | (BANK(\5) - BANK("Object Functions 1")) == (BANK(\5) - BANK("Object Functions 1"))
	dn (BANK(\5) - BANK("Object Functions 1")), \2
	db \3, \4
	dw \1
	dw \5
	db \6
ENDM

DummyObjectData:           object_data OAM_18007b, $0, OBJ_INTERACTION_00,                           0, DummyObjectFunc,           $0
GreyChestData:             object_data OAM_18c000, $1, OBJ_INTERACTION_GREY_TREASURE  | HEAVY_OBJ, -24, GreyChestFunc,             $0
RedChestData:              object_data OAM_18c000, $1, OBJ_INTERACTION_RED_TREASURE   | HEAVY_OBJ, -24, RedChestFunc,              $0
GreenChestData:            object_data OAM_18c000, $1, OBJ_INTERACTION_GREEN_TREASURE | HEAVY_OBJ, -24, GreenChestFunc,            $0
BlueChestData:             object_data OAM_18c000, $1, OBJ_INTERACTION_BLUE_TREASURE  | HEAVY_OBJ, -24, BlueChestFunc,             $0
GreyKeyData:               object_data OAM_18c000, $2, OBJ_INTERACTION_GREY_KEY,                   -24, KeyFunc,                   $0
RedKeyData:                object_data OAM_18c000, $2, OBJ_INTERACTION_RED_KEY,                    -24, KeyFunc,                   $0
GreenKeyData:              object_data OAM_18c000, $2, OBJ_INTERACTION_GREEN_KEY,                  -24, KeyFunc,                   $0
BlueKeyData:               object_data OAM_18c000, $2, OBJ_INTERACTION_BLUE_KEY,                   -24, KeyFunc,                   $0
MusicalCoinData:           object_data OAM_18c000, $3, OBJ_INTERACTION_MUSICAL_COIN,               -25, MusicalCoinFunc,           $0
SpearheadData:             object_data OAM_18007b, $0, OBJ_INTERACTION_01,                         -14, SpearheadFunc,             OBJFLAG_PRIORITY
FutamoguData:              object_data OAM_180564, $1, OBJ_INTERACTION_WALKABLE       | HEAVY_OBJ, -17, FutamoguFunc,              OBJFLAG_PRIORITY
WebberData:                object_data OAM_180242, $2, OBJ_INTERACTION_WALKABLE       | HEAVY_OBJ, -16, WebberFunc,                OBJFLAG_PRIORITY
TorchData:                 object_data OAM_180838, $4, OBJ_INTERACTION_FIRE,                       -16, TorchFunc,                 $0
TorchNoEmbersData:         object_data OAM_180838, $6, OBJ_INTERACTION_FIRE,                       -16, TorchNoEmbersFunc,         $0
FlameBlockTorchData:       object_data OAM_180838, $7, OBJ_INTERACTION_UNLIT_TORCH,                -16, FlameBlockTorchFunc,       $0
FlameBlockData:            object_data OAM_1895ec, $b, OBJ_INTERACTION_SOLID,                      -30, FlameBlockFunc,            $0
StoveData:                 object_data OAM_1896e1, $c, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -32, StoveFunc,                 $0
UnusedFlowerData:          object_data OAM_180916, $6, OBJ_INTERACTION_01,                           0, UnusedFlowerFunc,          $0
CountRichtertoffenData:    object_data OAM_1809ff, $7, OBJ_INTERACTION_RICHTERTOFFEN  | HEAVY_OBJ, -18, CountRichtertoffenFunc,    OBJFLAG_PRIORITY
HebariiData:               object_data OAM_18a703, $0, OBJ_INTERACTION_HEBARII,                    -15, HebariiFunc,               $0
ParaGoomData:              object_data OAM_180b43, $9, OBJ_INTERACTION_01,                         -12, ParaGoomFunc,              OBJFLAG_PRIORITY
DoughnuteerData:           object_data OAM_180ea7, $a, OBJ_INTERACTION_0B,                         -14, DoughnuteerFunc,           OBJFLAG_PRIORITY
OmodonmekaData:            object_data OAM_18136c, $b, OBJ_INTERACTION_01,                         -25, OmodonmekaFunc,            OBJFLAG_PRIORITY
OmodonmekaWithOmodon1Data: object_data OAM_181189, $c, OBJ_INTERACTION_01,                         -25, OmodonmekaWithOmodon1Func, OBJFLAG_PRIORITY
OmodonmekaWithOmodon2Data: object_data OAM_181189, $c, OBJ_INTERACTION_01,                         -25, OmodonmekaWithOmodon2Func, OBJFLAG_PRIORITY
KushimushiVerticalData:    object_data OAM_18160c, $c, OBJ_INTERACTION_BOTTOM_STING,               -13, KushimushiVerticalFunc,    $0
KushimushiHorizontalData:  object_data OAM_18160c, $d, OBJ_INTERACTION_FRONT_STING,                -12, KushimushiHorizontalFunc,  $0
MizuuoData:                object_data OAM_188395, $4, OBJ_INTERACTION_0A,                         -10, MizuuoFunc,                $0
BigLeafSpawnerData:        object_data OAM_180000, $b, OBJ_INTERACTION_0B,                           0, BigLeafSpawnerFunc,        $0
SmallLeafData:             object_data OAM_181be4, $8, OBJ_INTERACTION_WALKABLE,                   -17, SmallLeafFunc,             $0
SilkyData:                 object_data OAM_18181e, $c, OBJ_INTERACTION_01,                          -8, SilkyFunc,                 OBJFLAG_PRIORITY
OrangeBirdData:            object_data OAM_1819e3, $f, OBJ_INTERACTION_ORANGE_BIRD,                -13, BirdFunc,                  OBJFLAG_PRIORITY
BlueBirdData:              object_data OAM_1819e3, $d, OBJ_INTERACTION_FRONT_STING,                -13, BirdFunc,                  OBJFLAG_PRIORITY
SnakeData:                 object_data OAM_189783, $d, OBJ_INTERACTION_WALKABLE       | HEAVY_OBJ, -31, SnakeFunc,                 $0
ApplebyData:               object_data OAM_185a1c, $d, OBJ_INTERACTION_01,                          -6, ApplebyFunc,               $0
Barrel1Data:               object_data OAM_181b0f, $4, OBJ_INTERACTION_31             | HEAVY_OBJ, -15, Barrel1Func,               OBJFLAG_PRIORITY
Barrel2Data:               object_data OAM_181b0f, $5, OBJ_INTERACTION_3B,                         -15, Barrel2Func,               $0
RockData:                  object_data OAM_18ab5c, $3, OBJ_INTERACTION_3B,                         -15, RockFunc,                  $0
RedPrinceFroggyData:       object_data OAM_184000, $1, OBJ_INTERACTION_PRINCE_FROGGY  | HEAVY_OBJ, -16, RedPrinceFroggyFunc,       OBJFLAG_PRIORITY
GreyPrinceFroggyData:      object_data OAM_184000, $1, OBJ_INTERACTION_PRINCE_FROGGY  | HEAVY_OBJ, -26, GreyPrinceFroggyFunc,      OBJFLAG_PRIORITY
HammerBotData:             object_data OAM_18422f, $2, OBJ_INTERACTION_01             | HEAVY_OBJ, -18, HammerBotFunc,             OBJFLAG_PRIORITY
TeruteruData:              object_data OAM_18496f, $0, OBJ_INTERACTION_01,                         -20, TeruteruFunc,              OBJFLAG_PRIORITY
MadSciensteinData:         object_data OAM_184ab2, $5, OBJ_INTERACTION_01             | HEAVY_OBJ, -18, MadSciensteinFunc,         OBJFLAG_PRIORITY
SeeingEyeDoorData:         object_data OAM_184ab2, $3, OBJ_INTERACTION_SOLID          | HEAVY_OBJ, -24, SeeingEyeDoorFunc,         OBJFLAG_PRIORITY
PneumoData:                object_data OAM_184db9, $6, OBJ_INTERACTION_PNEUMO,                     -16, PneumoFunc,                OBJFLAG_PRIORITY
ElectricLampData:          object_data OAM_184eeb, $7, OBJ_INTERACTION_0B,                           0, ElectricLampFunc,          $0
ZombieData:                object_data OAM_184ffa, $9, OBJ_INTERACTION_0B             | HEAVY_OBJ,  -6, ZombieFunc,                OBJFLAG_PRIORITY
FireBotData:               object_data OAM_184755, $c, OBJ_INTERACTION_0B,                         -14, FireBotFunc,               OBJFLAG_PRIORITY
SpearBotData:              object_data OAM_18440a, $b, OBJ_INTERACTION_01,                         -14, SpearBotFunc,              OBJFLAG_PRIORITY
BeamBotData:               object_data OAM_1845aa, $4, OBJ_INTERACTION_01,                         -14, BeamBotFunc,               OBJFLAG_PRIORITY
SunData:                   object_data OAM_1851df, $a, OBJ_INTERACTION_FIRE,                       -20, SunFunc,                   $0
MoonData:                  object_data OAM_1854a2, $a, OBJ_INTERACTION_ELECTRIC,                   -20, MoonFunc,                  $0
KobattoData:               object_data OAM_185788, $0, OBJ_INTERACTION_VAMPIRE,                    -12, KobattoFunc,               OBJFLAG_PRIORITY
HandData:                  object_data OAM_185893, $6, OBJ_INTERACTION_HAND,                       -20, HandFunc,                  OBJFLAG_PRIORITY
BubbleHoleData:            object_data OAM_185b98, $e, OBJ_INTERACTION_0B,                           0, BubbleHoleFunc,            $0
BrrrBearData:              object_data OAM_188000, $0, OBJ_INTERACTION_ICE            | HEAVY_OBJ, -18, BrrrBearFunc,              OBJFLAG_PRIORITY
CartLeftData:              object_data OAM_188279, $2, OBJ_INTERACTION_SOLID,                      -16, CartFunc,                  OBJFLAG_PRIORITY
CartRightData:             object_data OAM_188279, $3, OBJ_INTERACTION_SOLID,                      -16, CartFunc,                  OBJFLAG_PRIORITY
CartVariableLeftData:      object_data OAM_188279, $2, OBJ_INTERACTION_SOLID,                      -16, CartVariableFunc,          OBJFLAG_PRIORITY
CartVariableRightData:     object_data OAM_188279, $3, OBJ_INTERACTION_SOLID,                      -16, CartVariableFunc,          OBJFLAG_PRIORITY
RoboMouseData:             object_data OAM_188555, $6, OBJ_INTERACTION_ROBO_MOUSE,                 -20, RoboMouseFunc,             OBJFLAG_PRIORITY
TogebaData:                object_data OAM_188b56, $7, OBJ_INTERACTION_FULL_STING,                  -6, TogebaFunc,                OBJFLAG_PRIORITY
HaridamaData:              object_data OAM_188c7a, $8, OBJ_INTERACTION_06,                         -13, HaridamaFunc,              OBJFLAG_PRIORITY
OwlData:                   object_data OAM_188e16, $9, OBJ_INTERACTION_0A,                         -20, OwlFunc,                   OBJFLAG_PRIORITY
ZipLine1Data:              object_data OAM_18834a, $4, OBJ_INTERACTION_RAIL,                        -7, ZipLineFunc,               OBJFLAG_PRIORITY
ZipLine2Data:              object_data OAM_18834a, $5, OBJ_INTERACTION_RAIL,                        -7, ZipLineFunc,               OBJFLAG_PRIORITY
ZipLine3Data:              object_data OAM_18834a, $6, OBJ_INTERACTION_RAIL,                        -7, ZipLineFunc,               OBJFLAG_PRIORITY
ZipLine4Data:              object_data OAM_18834a, $7, OBJ_INTERACTION_RAIL,                        -7, ZipLineFunc,               OBJFLAG_PRIORITY
ZipLine5Data:              object_data OAM_18834a, $8, OBJ_INTERACTION_RAIL,                        -7, ZipLineFunc,               OBJFLAG_PRIORITY
AnonsterData:              object_data OAM_190000, $0, OBJ_INTERACTION_0B,                         -29, AnonsterFunc,              $0
SilkPlatformsData:         object_data OAM_190000, $2, OBJ_INTERACTION_0B,                           0, SilkPlatformsFunc,         $0
FallingSnowSpawnerData:    object_data OAM_1893fe, $9, OBJ_INTERACTION_0B,                           0, FallingSnowSpawnerFunc,    $0
DollBoyData:               object_data OAM_19105c, $8, OBJ_INTERACTION_0B             | HEAVY_OBJ, -28, DollBoyFunc,               $0
HammerPlatformSpawnerData: object_data OAM_19105c, $5, OBJ_INTERACTION_0B,                           0, HammerPlatformSpawnerFunc, $0
DollBoyBarrel1Data:        object_data OAM_19105c, $1, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -31, DollBoyBarrel1Func,        $0
DollBoyBarrel2Data:        object_data OAM_19105c, $2, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -31, DollBoyBarrel2Func,        $0
DollBoyBarrel3Data:        object_data OAM_19105c, $4, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -31, DollBoyBarrel3Func,        $0
WormwouldData:             object_data OAM_194000, $7, OBJ_INTERACTION_0B             | HEAVY_OBJ, -26, WormwouldFunc,             $0
PalmTreeSpawnerData:       object_data OAM_194000, $9, OBJ_INTERACTION_0B,                           0, PalmTreeSpawnerFunc,       $0
PillarPlatform1Data:       object_data OAM_18a5ae, $0, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -16, PillarPlatform1Func,       $0
PillarPlatform2Data:       object_data OAM_18a5ae, $0, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -16, PillarPlatform2Func,       $0
PillarPlatform3Data:       object_data OAM_18a5ae, $0, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -16, PillarPlatform3Func,       $0
WaterDropData:             object_data OAM_18a5cc, $1, OBJ_INTERACTION_WATER_DROP,                  -8, WaterDropFunc,             OBJFLAG_PRIORITY
YellowBellyBodyData:       object_data OAM_19153c, $b, OBJ_INTERACTION_36             | HEAVY_OBJ, -16, YellowBellyBodyFunc,       OBJFLAG_PRIORITY
YellowBellyPlatformData:   object_data OAM_1926dc, $f, OBJ_INTERACTION_SOLID,                      -17, YellowBellyPlatformFunc,   $0
NobiiruLeftData:           object_data OAM_181cd3, $a, OBJ_INTERACTION_0B,                         -12, NobiiruFunc,               $0
NobiiruRightData:          object_data OAM_181cd3, $b, OBJ_INTERACTION_0B,                         -12, NobiiruFunc,               $0
ClearGate1Data:            object_data OAM_181c47, $e, OBJ_INTERACTION_SOLID,                      -31, ClearGate1Func,            $0
ClearGate2Data:            object_data OAM_181c47, $e, OBJ_INTERACTION_SOLID,                      -31, ClearGate2Func,            $0
ClearGate3Data:            object_data OAM_181c47, $e, OBJ_INTERACTION_SOLID,                      -31, ClearGate3Func,            $0
PesceData:                 object_data OAM_1927d5, $5, OBJ_INTERACTION_PESCE          | HEAVY_OBJ, -14, PesceFunc,                 OBJFLAG_PRIORITY
DragonflySpawnerData:      object_data OAM_190000, $6, OBJ_INTERACTION_0B,                           0, DragonflySpawnerFunc,      $0
FlySpawnerData:            object_data OAM_190000, $7, OBJ_INTERACTION_0B,                           0, FlySpawnerFunc,            $0
StrongWaterCurrentData:    object_data OAM_1927d5, $0, OBJ_INTERACTION_51             | HEAVY_OBJ, -26, StrongWaterCurrentFunc,    OBJFLAG_PRIORITY
Dragonfly2Data:            object_data OAM_1927d5, $1, OBJ_INTERACTION_WALKABLE,                    -9, Dragonfly2Func,            OBJFLAG_PRIORITY
TadpoleSpawnerData:        object_data OAM_188000, $2, OBJ_INTERACTION_0B,                           0, TadpoleSpawnerFunc,        $0
WaterSparkData:            object_data OAM_18a7fd, $d, OBJ_INTERACTION_YELLOW_BELLY_ARROW,         -13, WaterSparkFunc,            $0
SmallOctohonData:          object_data OAM_18a895, $0, OBJ_INTERACTION_06,                           0, SmallOctohonFunc,          OBJFLAG_PRIORITY
BigOctohonData:            object_data OAM_18a895, $1, OBJ_INTERACTION_06,                          -9, BigOctohonFunc,            $0
SparkHorizontalData:       object_data OAM_18ab04, $2, OBJ_INTERACTION_FULL_STING,                 -11, SparkFunc,                 OBJFLAG_PRIORITY
SparkVerticalData:         object_data OAM_18ab04, $0, OBJ_INTERACTION_FULL_STING,                 -11, SparkFunc,                 OBJFLAG_PRIORITY
ScowlerData:               object_data OAM_194895, $0, OBJ_INTERACTION_SCOWLER             | HEAVY_OBJ, -32, ScowlerFunc,               $0
FloatingRingSpawnerData:   object_data OAM_194895, $4, OBJ_INTERACTION_0B,                           0, FloatingRingSpawnerFunc,   $0
FireData:                  object_data OAM_18aba0, $4, OBJ_INTERACTION_FIRE,                       -24, FireFunc,                  $0
JamanoData:                object_data OAM_19501c, $6, OBJ_INTERACTION_JAMANO,                     -10, JamanoFunc,                $0
SkullSpawnerData:          object_data OAM_19501c, $7, OBJ_INTERACTION_0B,                         -10, SkullSpawnerFunc,          $0
HatPlatformData:           object_data OAM_19501c, $9, OBJ_INTERACTION_31,                          -4, HatPlatformFunc,           OBJFLAG_PRIORITY
MuddeeData:                object_data OAM_195699, $a, OBJ_INTERACTION_0B,                          -8, MuddeeFunc,                $0
Turtle1Data:               object_data OAM_195699, $b, OBJ_INTERACTION_TURTLE,                      -2, Turtle1Func,               OBJFLAG_PRIORITY
Turtle2Data:               object_data OAM_195699, $c, OBJ_INTERACTION_TURTLE,                      -2, Turtle2Func,               OBJFLAG_PRIORITY
WolfenbossData:            object_data OAM_195e06, $d, OBJ_INTERACTION_0B             | HEAVY_OBJ,   0, WolfenbossFunc,            $0
WolfenbossPlatformData:    object_data OAM_195e06, $a, OBJ_INTERACTION_SOLID,                       -1, WolfenbossPlatformFunc,    $0
ShootData:                 object_data OAM_196583, $0, OBJ_INTERACTION_0B             | HEAVY_OBJ, -32, ShootFunc,                 $0
GKTortoiseData:            object_data OAM_196583, $1, OBJ_INTERACTION_GK_TORTOISE             | HEAVY_OBJ, -20, GKTortoiseFunc,            $0
ShootGoalCounterData:      object_data OAM_196583, $a, OBJ_INTERACTION_0B,                         -32, ShootGoalCounterFunc,      $0
WarioGoalCounterData:      object_data OAM_196583, $b, OBJ_INTERACTION_0B,                         -32, WarioGoalCounterFunc,      $0
GKTortoisePlatformData:    object_data OAM_196583, $5, OBJ_INTERACTION_31,                         -10, GKTortoisePlatformFunc,    $0
WallCrackClosedData:       object_data OAM_18c806, $6, OBJ_INTERACTION_0B,                           0, WallCrackClosedFunc,       $0
WallCrackOpenData:         object_data OAM_18c806, $6, OBJ_INTERACTION_0B,                           0, WallCrackOpenFunc,         $0
HiddenFigureData:          object_data OAM_18c88a, $a, OBJ_INTERACTION_0B,                           0, HiddenFigureFunc,          $0
