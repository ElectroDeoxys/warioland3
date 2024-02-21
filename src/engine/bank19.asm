LoadEnemyGroupData::
; fills wObjDataPointers with Dummy Object
	ld hl, wObjDataPointers
	ld bc, DummyObjectData
	ld e, $10
.loop_1
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	dec e
	jr nz, .loop_1

	ld a, [wEnemyGroup]
	cp ENEMY_GROUP_HIDDEN_FIGURE
	jp z, LoadHiddenFigureData

	ld d, $00
	ld e, a
	sla e
	rl d
	sla e
	rl d ; *4
	ld hl, EnemyGroups
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]

	push hl
	ld h, a
	ld l, c
	ld de, wChestObjDataPtr
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a ; wKeyObjDataPtr
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a ; wMusicalCoinObjDataPtr
	inc e
	ld a, [hli]
	ld [de], a
	ld de, wTempPals2 palette 3
	ld b, 1 palettes
	call CopyHLToDE_Short
	pop hl

	ld a, [hli]
	ld c, a
	ld h, [hl]
	ld l, c
	ld a, BANK("WRAM1")
	ldh [rVBK], a
	ld a, [hli]
	ldh [hffa0], a

	; enemy slot 1
	ld a, [hli]
	ld c, a
	ld a, [hli]
	push hl
	ld h, a
	ld l, c
	ld bc, v1Tiles0
	ldh a, [hffa0]
	ld e, BANK("Enemy Gfx 1 Slot 1")
	add e
	ldh [hCallFuncBank], a
	hcall Decompress
	pop hl

	; enemy slot 2
	ld a, [hli]
	ld c, a
	ld a, [hli]
	push hl
	ld h, a
	ld l, c
	ld bc, v1Tiles0 + $400
	ldh a, [hffa0]
	ld e, BANK("Enemy Gfx 1 Slot 2")
	add e
	ldh [hCallFuncBank], a
	hcall Decompress
	pop hl

	; enemy slot 3
	ld a, [hli]
	ld c, a
	ld a, [hli]
	push hl
	ld h, a
	ld l, c
	ld bc, v1Tiles1
	ldh a, [hffa0]
	ld e, BANK("Enemy Gfx 1 Slot 3")
	add e
	ldh [hCallFuncBank], a
	hcall Decompress
	pop hl

	; enemy slot 4
	ld a, [hli]
	ld c, a
	ld a, [hli]
	push hl
	ld h, a
	ld l, c
	ld bc, v1Tiles1 + $400
	ldh a, [hffa0]
	ld e, BANK("Enemy Gfx 1 Slot 4")
	add e
	ldh [hCallFuncBank], a
	hcall Decompress
	pop hl

	xor a ; VRAM0
	ldh [rVBK], a

	ld a, 13
	ldh [hffa0], a
	ld de, wObjDataPtr01
.loop_2
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	inc a
	jr z, .copy_pals
	ld a, c
	ld [de], a
	inc e
	ld a, b
	ld [de], a
	inc e
	ldh a, [hffa0]
	dec a
	ldh [hffa0], a
	jr nz, .loop_2

.copy_pals
	jp LoadObjPals

; de = block
; c = entry in wObjDataPointers
SpawnObject:
	ldh a, [hXPosHi]
	cp $0a
	ret nc

	ld h, HIGH(wObj1)
FOR n, 1, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n})
	ld a, [hli]
	rra
	jr nc, .got_obj
ENDR
	ret

.got_obj
	; bit 7 set means it's not spawned in
	ld a, [de]
	rlca
	ret nc
	; not spawned, unset bit 7
	rrca
	and $7f
	ld [de], a

	ld [hl], e ; OBJ_UNK_01
	inc l
	ld a, [wccec]
	dec a
	add a ; *2
	add a ; *4
	add a ; *8
	add a ; *16
	add a ; *32
	add d
	ld [hli], a ; OBJ_UNK_02
	ldh a, [hYPosLo]
	ld [hli], a ; OBJ_Y_POS
	ldh a, [hYPosHi]
	ld [hli], a
	ldh a, [hXPosLo]
	ld [hli], a ; OBJ_X_POS
	ldh a, [hXPosHi]
	ld [hli], a

	push hl
	ld hl, wObjDataPointers
	dec c
	sla c ; *2
	ld b, $00
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de

	ld a, [hli]
	ld [de], a ; OBJ_UNK_07
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_INTERACTION_TYPE
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_COLLBOX_TOP
	inc e
	xor a
	ld [de], a ; OBJ_COLLBOX_BOTTOM

	ld a, e
	add OBJ_FRAME - OBJ_COLLBOX_BOTTOM
	ld e, a
	xor a
	ld [de], a ; OBJ_FRAME
	inc e
	ld a, [hli] ; OBJ_OAM_PTR
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a

	ld a, e
	add OBJ_FRAME_DURATION - (OBJ_OAM_PTR + 1)
	ld e, a
	ld a, $7f
	ld [de], a ; OBJ_FRAME_DURATION

	ld a, e
	add OBJ_SUBSTATE - OBJ_FRAME_DURATION
	ld e, a
	ld a, $1 | OBJSUBFLAG_UNINITIALISED
	ld [de], a ; OBJ_SUBSTATE
	inc e
	xor a ; OBJSTATE_00
	ld [de], a ; OBJ_STATE
	inc e
	ld a, 2 | (1 << 7)
	ld [de], a ; OBJ_ACTION
	inc e
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_UPDATE_FUNCTION
	inc e
	ld a, [hli]
	ld [de], a

	ld a, e
	sub (OBJ_UPDATE_FUNCTION + 1) - OBJ_FLAGS
	ld e, a
	ld a, [hl]
	or OBJFLAG_ACTIVE | OBJFLAG_INVISIBLE
	ld [de], a ; OBJ_FLAGS
	ret

DespawnAllObjects:
	ld h, HIGH(wObjects)
FOR n, 0, NUM_OBJECTS
	ld l, LOW(wObjects) + OBJ_STRUCT_LENGTH * n
	ld a, [hl] ; OBJ_FLAGS
	rra
	jr nc, .skip_{u:n} ; skip if OBJFLAG_ACTIVE not set
	rla
	rla
	rla
	jr nc, .despawn_{u:n} ; jump if OBJFLAG_TRANSIENT not set
	xor a
	ld [hl], a
	jr .skip_{u:n}
.despawn_{u:n}
	inc l
	inc l
	farcall DespawnObject
.skip_{u:n}
ENDR
	ret

; bc = object creation data
_CreateObjectFromCurObjPos::
	ld h, HIGH(wObj1Flags)
FOR n, 1, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	jr nc, .got_obj_slot ; OBJFLAG_ACTIVE not set
ENDR
	ret

.got_obj_slot
	ld a, OBJFLAG_ACTIVE | OBJFLAG_TRANSIENT
	ld [hli], a
	ld a, [wCurObjUnk01]
	ld [hli], a
	ld a, [wCurObjUnk02]
	ld [hli], a
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos + 0]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	jr CreateObject_GotPos

_CreateObjectAtRelativePos::
	ld h, HIGH(wObj1Flags)
FOR n, 1, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	jr nc, .got_obj_slot ; OBJFLAG_ACTIVE not set
ENDR
	ret

.got_obj_slot
	ld a, OBJFLAG_ACTIVE | OBJFLAG_TRANSIENT
	ld [hli], a
	ld a, [wCurObjUnk01]
	ld [hli], a
	ld a, [wCurObjUnk02]
	ld [hli], a
	ld a, [wCurObjYPos + 0]
	ld e, a
	ld a, [bc]
	rla
	jr c, .negative_y
	rra
	add e
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	jr nc, .got_hi_y
	inc a
	jr .got_hi_y
.negative_y
	rra
	add e
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	jr c, .got_hi_y
	dec a
.got_hi_y
	ld [hli], a
	inc bc
	ld a, [wCurObjXPos]
	ld e, a
	ld a, [bc]
	rla
	jr c, .negative_x
	rra
	add e
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	jr nc, .got_hi_x
	inc a
	jr .got_hi_x
.negative_x
	rra
	add e
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	jr c, .got_hi_x
	dec a
.got_hi_x
	inc bc
CreateObject_GotPos::
	ld [hli], a
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	ld a, [hli]
	ld [de], a ; OBJ_UNK_07
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_INTERACTION_TYPE
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_COLLBOX_TOP
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_COLLBOX_BOTTOM
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_COLLBOX_LEFT
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_COLLBOX_RIGHT
	inc e
	inc e
	inc e
	inc e
	ld a, [hli] ; OBJ_OAM_PTR
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	xor a
	ld [de], a ; OBJ_FRAME_DURATION
	inc e
	ld [de], a ; OBJ_FRAMESET_OFFSET
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_STATE_DURATION
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_VAR_1
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_VAR_2
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_VAR_3
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_SUBSTATE
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_STATE
	inc e
	xor a ; OBJACTION_NONE
	ld [de], a ; OBJ_ACTION
	inc e
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_UPDATE_FUNCTION
	inc e
	ld a, [hli]
	ld [de], a
	ld a, e
	sub (OBJ_UPDATE_FUNCTION + 1) - OBJ_FLAGS
	ld e, a
	ld a, [hl] ; OBJ_FLAGS
	or OBJFLAG_ACTIVE | OBJFLAG_TRANSIENT
	ld [de], a
	ret

LoadHiddenFigureData:
	ld hl, .pointers
	ld a, $d
	ldh [hffa0], a
	ld de, wObjDataPtr01
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	inc a
	ret z
	ld a, c
	ld [de], a
	inc e
	ld a, b
	ld [de], a
	inc e
	ldh a, [hffa0]
	dec a
	ldh [hffa0], a
	jr nz, .loop
	ret

.pointers
	dw HiddenFigureData
	dw NULL

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
HebariiData:               object_data OAM_18a703, $0, OBJ_INTERACTION_HEBARII,                         -15, HebariiFunc,               $0
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
OrangeBirdData:            object_data OAM_1819e3, $f, OBJ_INTERACTION_ORANGE_BIRD,                         -13, BirdFunc,                  OBJFLAG_PRIORITY
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
PneumoData:                object_data OAM_184db9, $6, OBJ_INTERACTION_PNEUMO,                         -16, PneumoFunc,                OBJFLAG_PRIORITY
ElectricLampData:          object_data OAM_184eeb, $7, OBJ_INTERACTION_0B,                           0, ElectricLampFunc,          $0
ZombieData:                object_data OAM_184ffa, $9, OBJ_INTERACTION_0B             | HEAVY_OBJ,  -6, ZombieFunc,                OBJFLAG_PRIORITY
FireBotData:               object_data OAM_184755, $c, OBJ_INTERACTION_0B,                         -14, FireBotFunc,               OBJFLAG_PRIORITY
SpearBotData:              object_data OAM_18440a, $b, OBJ_INTERACTION_01,                         -14, SpearBotFunc,              OBJFLAG_PRIORITY
BeamBotData:               object_data OAM_1845aa, $4, OBJ_INTERACTION_01,                         -14, BeamBotFunc,               OBJFLAG_PRIORITY
SunData:                   object_data OAM_1851df, $a, OBJ_INTERACTION_FIRE,                       -20, SunFunc,                   $0
MoonData:                  object_data OAM_1854a2, $a, OBJ_INTERACTION_ELECTRIC,                   -20, MoonFunc,                  $0
KobattoData:               object_data OAM_185788, $0, OBJ_INTERACTION_VAMPIRE,                    -12, KobattoFunc,               OBJFLAG_PRIORITY
HandData:                  object_data OAM_185893, $6, OBJ_INTERACTION_HAND,                         -20, HandFunc,                  OBJFLAG_PRIORITY
BubbleHoleData:            object_data OAM_185b98, $e, OBJ_INTERACTION_0B,                           0, BubbleHoleFunc,            $0
BrrrBearData:              object_data OAM_188000, $0, OBJ_INTERACTION_ICE            | HEAVY_OBJ, -18, BrrrBearFunc,              OBJFLAG_PRIORITY
CartLeftData:              object_data OAM_188279, $2, OBJ_INTERACTION_SOLID,                      -16, CartFunc,                  OBJFLAG_PRIORITY
CartRightData:             object_data OAM_188279, $3, OBJ_INTERACTION_SOLID,                      -16, CartFunc,                  OBJFLAG_PRIORITY
CartVariableLeftData:      object_data OAM_188279, $2, OBJ_INTERACTION_SOLID,                      -16, CartVariableFunc,          OBJFLAG_PRIORITY
CartVariableRightData:     object_data OAM_188279, $3, OBJ_INTERACTION_SOLID,                      -16, CartVariableFunc,          OBJFLAG_PRIORITY
RoboMouseData:             object_data OAM_188555, $6, OBJ_INTERACTION_ROBO_MOUSE,                         -20, RoboMouseFunc,             OBJFLAG_PRIORITY
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
PesceData:                 object_data OAM_1927d5, $5, OBJ_INTERACTION_PESCE             | HEAVY_OBJ, -14, PesceFunc,                 OBJFLAG_PRIORITY
DragonflySpawnerData:      object_data OAM_190000, $6, OBJ_INTERACTION_0B,                           0, DragonflySpawnerFunc,      $0
FlySpawnerData:            object_data OAM_190000, $7, OBJ_INTERACTION_0B,                           0, FlySpawnerFunc,            $0
StrongWaterCurrentData:    object_data OAM_1927d5, $0, OBJ_INTERACTION_51             | HEAVY_OBJ, -26, StrongWaterCurrentFunc,    OBJFLAG_PRIORITY
Dragonfly2Data:            object_data OAM_1927d5, $1, OBJ_INTERACTION_WALKABLE,                    -9, Dragonfly2Func,            OBJFLAG_PRIORITY
TadpoleSpawnerData:        object_data OAM_188000, $2, OBJ_INTERACTION_0B,                           0, TadpoleSpawnerFunc,        $0
WaterSparkData:            object_data OAM_18a7fd, $d, OBJ_INTERACTION_YELLOW_BELLY_ARROW,                         -13, WaterSparkFunc,            $0
SmallOctohonData:          object_data OAM_18a895, $0, OBJ_INTERACTION_06,                           0, SmallOctohonFunc,          OBJFLAG_PRIORITY
BigOctohonData:            object_data OAM_18a895, $1, OBJ_INTERACTION_06,                          -9, BigOctohonFunc,            $0
SparkHorizontalData:       object_data OAM_18ab04, $2, OBJ_INTERACTION_FULL_STING,                 -11, SparkFunc,                 OBJFLAG_PRIORITY
SparkVerticalData:         object_data OAM_18ab04, $0, OBJ_INTERACTION_FULL_STING,                 -11, SparkFunc,                 OBJFLAG_PRIORITY
ScowlerData:               object_data OAM_194895, $0, OBJ_INTERACTION_41             | HEAVY_OBJ, -32, ScowlerFunc,               $0
FloatingRingSpawnerData:   object_data OAM_194895, $4, OBJ_INTERACTION_0B,                           0, FloatingRingSpawnerFunc,   $0
FireData:                  object_data OAM_18aba0, $4, OBJ_INTERACTION_FIRE,                       -24, FireFunc,                  $0
JamanoData:                object_data OAM_19501c, $6, OBJ_INTERACTION_JAMANO,                         -10, JamanoFunc,                $0
SkullSpawnerData:          object_data OAM_19501c, $7, OBJ_INTERACTION_0B,                         -10, SkullSpawnerFunc,          $0
HatPlatformData:           object_data OAM_19501c, $9, OBJ_INTERACTION_31,                          -4, HatPlatformFunc,           OBJFLAG_PRIORITY
MuddeeData:                object_data OAM_195699, $a, OBJ_INTERACTION_0B,                          -8, MuddeeFunc,                $0
Turtle1Data:               object_data OAM_195699, $b, OBJ_INTERACTION_TURTLE,                          -2, Turtle1Func,               OBJFLAG_PRIORITY
Turtle2Data:               object_data OAM_195699, $c, OBJ_INTERACTION_TURTLE,                          -2, Turtle2Func,               OBJFLAG_PRIORITY
WolfenbossData:            object_data OAM_195e06, $d, OBJ_INTERACTION_0B             | HEAVY_OBJ,   0, WolfenbossFunc,            $0
WolfenbossPlatformData:    object_data OAM_195e06, $a, OBJ_INTERACTION_SOLID,                       -1, WolfenbossPlatformFunc,    $0
ShootData:                 object_data OAM_196583, $0, OBJ_INTERACTION_0B             | HEAVY_OBJ, -32, ShootFunc,                 $0
GKTortoiseData:            object_data OAM_196583, $1, OBJ_INTERACTION_4E             | HEAVY_OBJ, -20, GKTortoiseFunc,            $0
ShootGoalCounterData:      object_data OAM_196583, $a, OBJ_INTERACTION_0B,                         -32, ShootGoalCounterFunc,      $0
WarioGoalCounterData:      object_data OAM_196583, $b, OBJ_INTERACTION_0B,                         -32, WarioGoalCounterFunc,      $0
GKTortoisePlatformData:    object_data OAM_196583, $5, OBJ_INTERACTION_31,                         -10, GKTortoisePlatformFunc,    $0
WallCrackClosedData:       object_data OAM_18c806, $6, OBJ_INTERACTION_0B,                           0, WallCrackClosedFunc,       $0
WallCrackOpenData:         object_data OAM_18c806, $6, OBJ_INTERACTION_0B,                           0, WallCrackOpenFunc,         $0
HiddenFigureData:          object_data OAM_18c88a, $a, OBJ_INTERACTION_0B,                           0, HiddenFigureFunc,          $0

ObjParams_HebariiProjectile:
	db -8  ; y
	db  0  ; x
	dn $2, $1 ; unk7
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -3,  2, -3,  2 ; collision
	dw OAM_18a703 ; OAM
	dw Frameset_68408 ; frameset
	db 2 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw HebariiProjectileFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_WebberProjectile:
	db  5  ; y
	db -8  ; x
	dn $0, $3 ; unk7
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -7, -3, -4, 3 ; collision
	dw OAM_180242 ; OAM
	dw Frameset_682c8 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw WebberProjectileFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_UnusedFlowerProjectileLeft:
	db -10 ; y
	db   0 ; x
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FULL_STING
	db -13, -3, -6, 5 ; collision box
	dw OAM_180916 ; OAM
	dw Frameset_6838c ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw UnusedFlowerProjectileLeftFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_UnusedFlowerProjectileRight:
	db -10 ; y
	db   0 ; x
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -13, -3, -6, 5 ; collision box
	dw OAM_180916 ; OAM
	dw Frameset_68395 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw UnusedFlowerProjectileRightFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BigLeaf1:
	db -10 ; y
	db  15 ; x
	dn $0, $8 ; unk7
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -16, -8, -8, 7 ; collision box
	dw OAM_1817b4 ; OAM
	dw Frameset_68732 ; frameset
	db 80 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BigLeaf1Func
	db $0 ; obj flags

ObjParams_BigLeaf2:
	db -10 ; y
	db -17 ; x
	dn $0, $8 ; unk7
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -16, -8, -8, 7 ; collision box
	dw OAM_1817b4 ; OAM
	dw Frameset_68732 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BigLeaf2Func
	db $0 ; obj flags

ObjParams_BigLeaf3:
	db -10 ; y
	db -48 ; x
	dn $0, $8 ; unk7
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -16, -8, -8, 7 ; collision box
	dw OAM_1817b4 ; OAM
	dw Frameset_68732 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw BigLeaf2Func
	db $0 ; obj flags

ObjParams_DoughnutLeft:
	db -18 ; y
	db  -9 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ea ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw DoughnutFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DoughnutRight:
	db -18 ; y
	db   8 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ed ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw DoughnutFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DoughnutUpLeft:
	db -16 ; y
	db  -8 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ea ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw DoughnutFunc_Up
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DoughnutUpRight:
	db -16 ; y
	db   7 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ed ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw DoughnutFunc_Up
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionLeft:
	db  -8 ; y
	db -16 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionRight:
	db -8 ; y
	db 15 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionDropLeft:
	db  -8 ; y
	db -16 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Drop
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionDropRight:
	db -8 ; y
	db 15 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Drop
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ZombieHeadLeft:
	db -16 ; y
	db   0 ; x
	dn $1, $a ; unk7
	db OBJ_INTERACTION_ZOMBIE_HEAD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ffa ; OAM
	dw Frameset_68db3 ; frameset
	db 48 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ZombieHeadFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ZombieHeadRight:
	db -16 ; y
	db   0 ; x
	dn $1, $a ; unk7
	db OBJ_INTERACTION_ZOMBIE_HEAD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ffa ; OAM
	dw Frameset_68dc4 ; frameset
	db 48 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw ZombieHeadFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsLeft:
	db -20 ; y
	db -12 ; x
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsRight:
	db -20 ; y
	db  11 ; x
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BeamLeft:
	db  0 ; y
	db -8 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_BEAM ; interaction type
	db -14, -3, -2, 1 ; collision box
	dw OAM_1845aa ; OAM
	dw Frameset_68ee1 ; frameset
	db 18 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BeamFunc_Left
	db $0 ; obj flags

ObjParams_BeamRight:
	db  0 ; y
	db  8 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_BEAM ; interaction type
	db -14, -3, -2, 1 ; collision box
	dw OAM_1845aa ; OAM
	dw Frameset_68eea ; frameset
	db 18 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw BeamFunc_Right
	db $0 ; obj flags

ObjParams_AppleLeft:
	db -14 ; y
	db   7 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_185a1c ; OAM
	dw Frameset_68a60 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $01 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AppleFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AppleRight:
	db -14 ; y
	db  -8 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_185a1c ; OAM
	dw Frameset_68a60 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $01 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AppleFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SunFlameLeft:
	db  4 ; y
	db -8 ; x
	dn $1, $b ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -10, -2, -5, 4 ; collision box
	dw OAM_1851df ; OAM
	dw Frameset_68fb2 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SunFlameFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SunFlameRight:
	db  4 ; y
	db  7 ; x
	dn $1, $b ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -10, -2, -5, 4 ; collision box
	dw OAM_1851df ; OAM
	dw Frameset_68fad ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw SunFlameFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MoonStarLeft:
	db  4 ; y
	db -8 ; x
	dn $1, $b ; unk7
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -10, -3, -5, 4 ; collision box
	dw OAM_1854a2 ; OAM
	dw Frameset_6901b ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw MoonStarFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MoonStarRight:
	db  4 ; y
	db  7 ; x
	dn $1, $b ; unk7
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -10, -3, -5, 4 ; collision box
	dw OAM_1854a2 ; OAM
	dw Frameset_69012 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw MoonStarFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_649c2:
	db -10 ; y
	db  -7 ; x
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680b6 ; frameset
	db 17 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_649d7:
	db -10 ; y
	db   6 ; x
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680b6 ; frameset
	db 17 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SnowflakeLeft:
	db -8 ; y
	db -8 ; x
	dn $2, $1 ; unk7
	db OBJ_INTERACTION_ICE ; interaction type
	db -12, -5, -6, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_69169 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SnowflakeFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SnowflakeRight:
	db -8 ; y
	db  7 ; x
	dn $2, $1 ; unk7
	db OBJ_INTERACTION_ICE ; interaction type
	db -12, -5, -6, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_69169 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw SnowflakeFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MizzouProjectileLeft:
	db -10 ; y
	db -16 ; x
	dn $2, $5 ; unk7
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -7, 0, -4, 3 ; collision box
	dw OAM_188395 ; OAM
	dw Frameset_686ce ; frameset
	db 28 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw MizzouProjectileFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MizzouProjectileRight:
	db -10 ; y
	db  15 ; x
	dn $2, $5 ; unk7
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -7, 0, -4, 3 ; collision box
	dw OAM_188395 ; OAM
	dw Frameset_686d3 ; frameset
	db 28 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw MizzouProjectileFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_GreyTreasure:
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680da ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw GreyTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_RedTreasure:
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68113 ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw RedTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_GreenTreasure:
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_6814c ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw GreenTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BlueTreasure:
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68185 ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BlueTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk1Left:
	db  1 ; y
	db -4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 32 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatLeft
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk1Right:
	db 1 ; y
	db 3 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 32 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatRight
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk2Left:
	db  1 ; y
	db -4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 24 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatLeft
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk2Right:
	db 1 ; y
	db 3 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 24 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatRight
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk3Left:
	db  1 ; y
	db -4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 16 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatLeft
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk3Right:
	db 1 ; y
	db 3 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 16 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatRight
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterWaveLeft:
	db  4 ; y
	db -5 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_WAVE ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694f8 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsteWaveLFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterWaveRight:
	db 4 ; y
	db 4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_ANONSTER_WAVE ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_69505 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterWaveFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SilkPlatform1:
	db  -16 ; y
	db -112 ; x
	dn $4, $3 ; unk7
	db OBJ_INTERACTION_SOLID ; interaction type
	db -8, -2, -5, 5 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_6954a ; frameset
	db 170 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw SilkPlatformFunc
	db $0 ; obj flags

ObjParams_SilkPlatform2:
	db -16 ; y
	db -80 ; x
	dn $4, $3 ; unk7
	db OBJ_INTERACTION_SOLID ; interaction type
	db -8, -2, -5, 5 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_6954a ; frameset
	db 120 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw SilkPlatformFunc
	db $0 ; obj flags

ObjParams_SilkPlatform3:
	db -16 ; y
	db -48 ; x
	dn $4, $3 ; unk7
	db OBJ_INTERACTION_SOLID ; interaction type
	db -8, -2, -5, 5 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_6954a ; frameset
	db 70 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw SilkPlatformFunc
	db $0 ; obj flags

ObjParams_SnakeFireLeft:
	db  16 ; y
	db -21 ; x
	dn $2, $e ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -8, 0, -4, 3 ; collision box
	dw OAM_189783 ; OAM
	dw Frameset_6893a ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SnakeFireFunc
	db $0 ; obj flags

ObjParams_SnakeFireRight:
	db 16 ; y
	db  6 ; x
	dn $2, $e ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -8, 0, -4, 3 ; collision box
	dw OAM_189783 ; OAM
	dw Frameset_6893a ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SnakeFireFunc
	db $0 ; obj flags

ObjParams_DollBoyHammer:
	db -18 ; y
	db -10 ; x
	dn $4, $9 ; unk7
	db OBJ_INTERACTION_DOLL_BOY_HAMMER ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_19105c ; OAM
	dw Frameset_69684 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw DollBoyHammerFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HammerPlatform:
	db -60 ; y
	db  64 ; x
	dn $4, $6 ; unk7
	db OBJ_INTERACTION_31 ; interaction type
	db -10, -1, -5, 4 ; collision box
	dw OAM_19105c ; OAM
	dw Frameset_696b1 ; frameset
	db 140 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw HammerPlatformFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HighRollingRockLeft:
	db   4 ; y
	db -13 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_6973d ; frameset
	db 7 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw RollingRockFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HighRollingRockRight:
	db   4 ; y
	db  12 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_696f8 ; frameset
	db 7 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw RollingRockFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_LowRollingRockLeft:
	db   4 ; y
	db -13 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_6973d ; frameset
	db 7 ; action duration
	db $1 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw RollingRockFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_LowRollingRockRight:
	db   4 ; y
	db  12 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_696f8 ; frameset
	db 7 ; action duration
	db $1 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw RollingRockFunc_Right
	db OBJFLAG_PRIORITY ; obj flags


ObjParams_PalmTreeShort:
	db 16 ; y
	db 16 ; x
	dn $5, $a ; unk7
	db OBJ_INTERACTION_31 ; interaction type
	db -6, -2, -7, 6 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_69746 ; frameset
	db 0 ; action duration
	db $1a ; var1
	db $1f ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw PalmTreeFunc
	db $0 ; obj flags

ObjParams_PalmTreeMedium:
	db 28 ; y
	db 72 ; x
	dn $5, $a ; unk7
	db OBJ_INTERACTION_31 ; interaction type
	db -14, -10, -7, 6 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_6974d ; frameset
	db 0 ; action duration
	db $30 ; var1
	db $1f ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw PalmTreeFunc
	db $0 ; obj flags

ObjParams_PalmTreeTall:
	db  39 ; y
	db 127 ; x
	dn $5, $a ; unk7
	db OBJ_INTERACTION_31 ; interaction type
	db -30, -26, -7, 6 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_69754 ; frameset
	db 0 ; action duration
	db $4a ; var1
	db $1f ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw PalmTreeFunc
	db $0 ; obj flags

ObjParams_YellowBellyArrowLeft:
	db  16 ; y
	db -16 ; x
	dn $4, $d ; unk7
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -10, -4, -3, 2 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_69870 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $1 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw YellowBellyArrowFunc.Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_YellowBellyArrowRight:
	db 16 ; y
	db 15 ; x
	dn $4, $d ; unk7
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -10, -4, -3, 2 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_69875 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $1 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw YellowBellyArrowFunc.Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Dragonfly1:
	db -64 ; y
	db  48 ; x
	dn $4, $8 ; unk7
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -9, -7, -7, 6 ; collision box
	dw OAM_1927d5 ; OAM
	dw Frameset_699d0 ; frameset
	db 36 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw Dragonfly1Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Fly:
	db -48 ; y
	db  48 ; x
	dn $4, $9 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -12, 12, -6, 5 ; collision box
	dw OAM_1927d5 ; OAM
	dw Frameset_699e4 ; frameset
	db 40 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $5a ; state
	dw FlyFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Tadpole:
	db -3 ; y
	db  0 ; x
	dn $2, $f ; unk7
	db OBJ_INTERACTION_TADPOLE ; interaction type
	db -12, -4, -5, 4 ; collision box
	dw OAM_18a642 ; OAM
	dw Frameset_69a33 ; frameset
	db 28 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $5a ; state
	dw TadpoleFunc
	db $0 ; obj flags

ObjParams_InkLeft:
	db -12 ; y
	db  -4 ; x
	dn $5, $3 ; unk7
	db OBJ_INTERACTION_INK ; interaction type
	db -13, -3, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69ae3 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InkFunc.Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InkRight:
	db -12 ; y
	db   3 ; x
	dn $5, $3 ; unk7
	db OBJ_INTERACTION_INK ; interaction type
	db -13, -3, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69ae3 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InkFunc.Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_FloatingRing:
	db 64 ; y
	db  0 ; x
	dn $5, $5 ; unk7
	db OBJ_INTERACTION_31 ; interaction type
	db -1, 4, -5, 4 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69b0d ; frameset
	db 140 ; action duration
	db $00 ; var1
	db $14 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw FloatingRingFunc
	db $0 ; obj flags

ObjParams_Skull1:
	db -28 ; y
	db -16 ; x
	dn $5, $0 ; unk7
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69c69 ; frameset
	db 60 ; action duration
	db $64 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_Skull2:
	db 20 ; y
	db -16 ; x
	dn $5, $1 ; unk7
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69c69 ; frameset
	db 60 ; action duration
	db $78 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_Skull3:
	db -28 ; y
	db  16 ; x
	dn $5, $2 ; unk7
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69cc5 ; frameset
	db 60 ; action duration
	db $8c ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_Skull4:
	db 20 ; y
	db 16 ; x
	dn $5, $3 ; unk7
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69cc5 ; frameset
	db 60 ; action duration
	db $a0 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_JamanoHat:
	db -12 ; y
	db   0 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_0B ; interaction type
	db -4, 0, -6, 5 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69cef ; frameset
	db 40 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw JamanoHatFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MagicSpiralLeft:
	db  12 ; y
	db -12 ; x
	dn $5, $e ; unk7
	db OBJ_INTERACTION_MAGICAL_SPIRAL ; interaction type
	db -4, 3, -4, 3 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e30 ; frameset
	db 92 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $5 | OBJSUBFLAG_VDIR ; substate
	db $00 ; state
	dw MagicSpiralFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MagicSpiralRight:
	db 12 ; y
	db 11 ; x
	dn $5, $e ; unk7
	db OBJ_INTERACTION_MAGICAL_SPIRAL ; interaction type
	db -4, 3, -4, 3 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e30 ; frameset
	db 92 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $5 | OBJSUBFLAG_VDIR | OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw MagicSpiralFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_IgaguriLeft:
	db  21 ; y
	db -12 ; x
	dn $5, $f ; unk7
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -16, -4, -5, 4 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e7b ; frameset
	db 62 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw IgaguriFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_IgaguriRight:
	db 21 ; y
	db 11 ; x
	dn $5, $f ; unk7
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -16, -4, -5, 4 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e7b ; frameset
	db 62 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw IgaguriFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HiddenFigureFace:
	db -16 ; y
	db   8 ; x
	dn $3, $b ; unk7
	db OBJ_INTERACTION_FULL_STING | HEAVY_OBJ ; interaction type
	db -24, -19, -4, 3 ; collision box
	dw OAM_18c88a ; OAM
	dw Frameset_6a06c ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw HiddenFigureFaceFunc
	db $0 ; obj flags

ObjParams_HiddenFigureLeftHand:
	db  18 ; y
	db -40 ; x
	dn $3, $c ; unk7
	db OBJ_INTERACTION_0B | HEAVY_OBJ ; interaction type
	db -24, -8, -8, 7 ; collision box
	dw OAM_18c88a ; OAM
	dw Frameset_6a128 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw HiddenFigureLeftHandFunc
	db $0 ; obj flags

ObjParams_HiddenFigureRightHand:
	db 18 ; y
	db 56 ; x
	dn $3, $d ; unk7
	db OBJ_INTERACTION_0B | HEAVY_OBJ ; interaction type
	db -24, -8, -8, 7 ; collision box
	dw OAM_18c88a ; OAM
	dw Frameset_6a131 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw HiddenFigureRightHandFunc
	db $0 ; obj flags

ObjParams_Omodon2:
	db 16 ; y
	db  0 ; x
	dn $0, $d ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -16, 11, -17, 0 ; collision box
	dw OAM_18154f ; OAM
	dw Frameset_68f50 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw Func_4279c
	db $0 ; obj flags

ObjParams_Omodon1:
	db 16 ; y
	db  0 ; x
	dn $0, $d ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -26, 11, -17, 0 ; collision box
	dw OAM_18154f ; OAM
	dw Frameset_68f50 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw Func_4279c
	db $0 ; obj flags

ObjParams_DollBoyHammerStarsLeft:
	db -20 ; y
	db -19 ; x
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DollBoyHammerStarsRight:
	db -20 ; y
	db 18 ; x
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Coin:
	dn $8, $1 ; unk7
	db OBJ_INTERACTION_REGULAR_COIN
	db -12, 0, -4, 3
	dw OAM_180003 ; OAM
	db 1, 8 ; frameset
	db 4 ; action duration
	db $00 ; var1
	db $02 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNINITIALISED ; substate
	db OBJSTATE_19 ; state
	dw CoinFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ColourCoin:
	dn $8, $1 ; unk7
	db OBJ_INTERACTION_COLOUR_COIN
	db -12, 0, -4, 3
	dw OAM_180003 ; OAM
	db 1, 8 ; frameset
	db 4 ; action duration
	db $00 ; var1
	db $02 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNINITIALISED ; substate
	db OBJSTATE_19 ; state
	dw CoinFunc.ColourCoin
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberLeft1:
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw TorchEmberLeft1Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberRight1:
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw TorchEmberRight1Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberLeft2:
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw TorchEmberLeft2Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberRight2:
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw TorchEmberRight2Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ElectricLampSpark:
	dn $1, $8 ; unk7
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -6, -5, -4, 3 ; collision box
	dw OAM_184eeb ; OAM
	dw Frameset_68c97 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ElectricLampSparkFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Bubble:
	dn $1, $f ; unk7
	db OBJ_INTERACTION_BUBBLE ; interaction type
	db -24, -7, -9, 8 ; collision box
	dw OAM_185b98 ; OAM
	dw Frameset_69105 ; frameset
	db 32 ; action duration
	db $30 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BubbleFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_FallingSnow:
	dn $2, $a ; unk7
	db OBJ_INTERACTION_SNOW ; interaction type
	db -15, -8, -5, 4 ; collision box
	dw OAM_1893fe ; OAM
	dw Frameset_6957e ; frameset
	db 80 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw FallingSnowFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsAbove:
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680c5 ; frameset
	db 33 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_WithYOffset
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_YellowBellyHead:
	dn $4, $c ; unk7
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -10, -6, -4, 3 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_6987a ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw YellowBellyHeadFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Pump:
	dn $4, $e ; unk7
	db OBJ_INTERACTION_36 ; interaction type
	db -13, -1, -6, 5 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_6987a ; frameset
	db 16 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw PumpFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Cheese:
	dn $4, $a ; unk7
	db OBJ_INTERACTION_0B ; interaction type
	db -12, -5, -6, 5 ; collision box
	dw OAM_1927d5 ; OAM
	dw Frameset_69a00 ; frameset
	db 48 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw CheeseFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ScrowlerTentacleRight:
	dn $5, $1 ; unk7
	db OBJ_INTERACTION_WATER_TELEPORTING ; interaction type
	db -10, -2, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69af5 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ScrowlerTentacleFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ScrowlerTentacleLeft:
	dn $5, $2 ; unk7
	db OBJ_INTERACTION_WATER_TELEPORTING ; interaction type
	db -10, -2, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69af5 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ScrowlerTentacleFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MuddeeStinger1:
	dn $3, $4 ; unk7
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -12, 0, -4, 3 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68072 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $1 ; substate
	db $00 ; state
	dw MuddeeStingerFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MuddeeStinger2:
	dn $3, $5 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -12, 0, -4, 3 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68072 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $1 ; substate
	db $00 ; state
	dw MuddeeStingerFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Kuri:
	dn $5, $e ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -12, 0, -5, 4 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e50 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw KuriFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsCentre:
	dn $3, $0 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

Data_64fc3:
	dw GreyChestData
	dw GreyKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 28, 28, 28
	rgb 15, 15, 15
	rgb  0,  0,  0

Data_64fd1:
	dw RedChestData
	dw RedKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 31, 24, 24
	rgb 23,  0,  0
	rgb  7,  0,  0

Data_64fdf:
	dw GreenChestData
	dw GreenKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 24, 31, 21
	rgb  0, 16,  0
	rgb  0,  2,  0

Data_64fed:
	dw BlueChestData
	dw BlueKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 19, 31, 31
	rgb  0, 12, 31
	rgb  0,  0,  7

Data_64ffb:
	dw GreyChestData
	dw GreyKeyData
	dw MusicalCoinData

	rgb 31, 31, 31
	rgb  0, 27, 31
	rgb 31,  0, 12
	rgb  5,  0,  0

EnemyGroups:
	table_width 4, EnemyGroups
	dw Data_64fc3, EnemyGroupGfx0   ; ENEMY_GROUP_000
	dw Data_64fdf, EnemyGroupGfx2   ; ENEMY_GROUP_001
	dw Data_64fd1, EnemyGroupGfx3   ; ENEMY_GROUP_002
	dw Data_64fdf, EnemyGroupGfx6   ; ENEMY_GROUP_003
	dw Data_64fdf, EnemyGroupGfx7   ; ENEMY_GROUP_004
	dw Data_64fdf, EnemyGroupGfx8   ; ENEMY_GROUP_005
	dw Data_64fdf, EnemyGroupGfx9   ; ENEMY_GROUP_006
	dw Data_64fed, EnemyGroupGfx10  ; ENEMY_GROUP_007
	dw Data_64fc3, EnemyGroupGfx11  ; ENEMY_GROUP_008
	dw Data_64fc3, EnemyGroupGfx13  ; ENEMY_GROUP_009
	dw Data_64fc3, EnemyGroupGfx14  ; ENEMY_GROUP_010
	dw Data_64fc3, EnemyGroupGfx15  ; ENEMY_GROUP_011
	dw Data_64fc3, EnemyGroupGfx16  ; ENEMY_GROUP_012
	dw Data_64fd1, EnemyGroupGfx11  ; ENEMY_GROUP_013
	dw Data_64fd1, EnemyGroupGfx17  ; ENEMY_GROUP_014
	dw Data_64fdf, EnemyGroupGfx18  ; ENEMY_GROUP_015
	dw Data_64fc3, EnemyGroupGfx1   ; ENEMY_GROUP_016
	dw Data_64fc3, EnemyGroupGfx12  ; ENEMY_GROUP_017
	dw Data_64fc3, EnemyGroupGfx21  ; ENEMY_GROUP_018
	dw Data_64fc3, EnemyGroupGfx4   ; ENEMY_GROUP_019
	dw Data_64fc3, EnemyGroupGfx3   ; ENEMY_GROUP_020
	dw Data_64fdf, EnemyGroupGfx19  ; ENEMY_GROUP_021
	dw Data_64fdf, EnemyGroupGfx3   ; ENEMY_GROUP_022
	dw Data_64fc3, EnemyGroupGfx22  ; ENEMY_GROUP_023
	dw Data_64fed, EnemyGroupGfx24  ; ENEMY_GROUP_024
	dw Data_64fed, EnemyGroupGfx25  ; ENEMY_GROUP_025
	dw Data_64fdf, EnemyGroupGfx25  ; ENEMY_GROUP_026
	dw Data_64fd1, EnemyGroupGfx26  ; ENEMY_GROUP_027
	dw Data_64fed, EnemyGroupGfx33  ; ENEMY_GROUP_028
	dw Data_64fdf, EnemyGroupGfx34  ; ENEMY_GROUP_029
	dw Data_64fc3, EnemyGroupGfx35  ; ENEMY_GROUP_030
	dw Data_64fc3, EnemyGroupGfx37  ; ENEMY_GROUP_031
	dw Data_64fc3, EnemyGroupGfx38  ; ENEMY_GROUP_032
	dw Data_64fc3, EnemyGroupGfx39  ; ENEMY_GROUP_033
	dw Data_64fd1, EnemyGroupGfx33  ; ENEMY_GROUP_034
	dw Data_64fdf, EnemyGroupGfx40  ; ENEMY_GROUP_035
	dw Data_64fed, EnemyGroupGfx41  ; ENEMY_GROUP_036
	dw Data_64fd1, EnemyGroupGfx42  ; ENEMY_GROUP_037
	dw Data_64fc3, EnemyGroupGfx42  ; ENEMY_GROUP_038
	dw Data_64fc3, EnemyGroupGfx2   ; ENEMY_GROUP_039
	dw Data_64fed, EnemyGroupGfx40  ; ENEMY_GROUP_040
	dw Data_64fd1, EnemyGroupGfx43  ; ENEMY_GROUP_041
	dw Data_64fdf, EnemyGroupGfx44  ; ENEMY_GROUP_042
	dw Data_64fed, EnemyGroupGfx44  ; ENEMY_GROUP_043
	dw Data_64fc3, EnemyGroupGfx45  ; ENEMY_GROUP_044
	dw Data_64fdf, EnemyGroupGfx24  ; ENEMY_GROUP_045
	dw Data_64fed, EnemyGroupGfx35  ; ENEMY_GROUP_046
	dw Data_64fd1, EnemyGroupGfx15  ; ENEMY_GROUP_047
	dw Data_64fed, EnemyGroupGfx46  ; ENEMY_GROUP_048
	dw Data_64fc3, EnemyGroupGfx47  ; ENEMY_GROUP_049
	dw Data_64fd1, EnemyGroupGfx34  ; ENEMY_GROUP_050
	dw Data_64fed, EnemyGroupGfx48  ; ENEMY_GROUP_051
	dw Data_64fc3, EnemyGroupGfx49  ; ENEMY_GROUP_052
	dw Data_64fc3, EnemyGroupGfx50  ; ENEMY_GROUP_053
	dw Data_64fc3, EnemyGroupGfx51  ; ENEMY_GROUP_054
	dw Data_64fed, EnemyGroupGfx52  ; ENEMY_GROUP_055
	dw Data_64fdf, EnemyGroupGfx20  ; ENEMY_GROUP_056
	dw Data_64fdf, EnemyGroupGfx53  ; ENEMY_GROUP_057
	dw Data_64fd1, EnemyGroupGfx54  ; ENEMY_GROUP_058
	dw Data_64fc3, EnemyGroupGfx30  ; ENEMY_GROUP_059
	dw Data_64fdf, EnemyGroupGfx31  ; ENEMY_GROUP_060
	dw Data_64fc3, EnemyGroupGfx23  ; ENEMY_GROUP_061
	dw Data_64fed, EnemyGroupGfx36  ; ENEMY_GROUP_062
	dw Data_64fed, EnemyGroupGfx29  ; ENEMY_GROUP_063
	dw Data_64fd1, EnemyGroupGfx32  ; ENEMY_GROUP_064
	dw Data_64fd1, EnemyGroupGfx27  ; ENEMY_GROUP_065
	dw Data_64fd1, EnemyGroupGfx27  ; ENEMY_GROUP_066
	dw Data_64fd1, EnemyGroupGfx28  ; ENEMY_GROUP_067
	dw Data_64fc3, EnemyGroupGfx55  ; ENEMY_GROUP_068
	dw Data_64fc3, EnemyGroupGfx56  ; ENEMY_GROUP_069
	dw Data_64fc3, EnemyGroupGfx57  ; ENEMY_GROUP_070
	dw Data_64fc3, EnemyGroupGfx58  ; ENEMY_GROUP_071
	dw Data_64fd1, EnemyGroupGfx59  ; ENEMY_GROUP_072
	dw Data_64fc3, EnemyGroupGfx60  ; ENEMY_GROUP_073
	dw Data_64fed, EnemyGroupGfx61  ; ENEMY_GROUP_074
	dw Data_64fed, EnemyGroupGfx17  ; ENEMY_GROUP_075
	dw Data_64fd1, EnemyGroupGfx13  ; ENEMY_GROUP_076
	dw Data_64fc3, EnemyGroupGfx62  ; ENEMY_GROUP_077
	dw Data_64fed, EnemyGroupGfx63  ; ENEMY_GROUP_078
	dw Data_64fdf, EnemyGroupGfx64  ; ENEMY_GROUP_079
	dw Data_64fdf, EnemyGroupGfx65  ; ENEMY_GROUP_080
	dw Data_64fd1, EnemyGroupGfx35  ; ENEMY_GROUP_081
	dw Data_64fc3, EnemyGroupGfx66  ; ENEMY_GROUP_082
	dw Data_64fd1, EnemyGroupGfx67  ; ENEMY_GROUP_083
	dw Data_64fdf, EnemyGroupGfx68  ; ENEMY_GROUP_084
	dw Data_64fed, EnemyGroupGfx69  ; ENEMY_GROUP_085
	dw Data_64fc3, EnemyGroupGfx70  ; ENEMY_GROUP_086
	dw Data_64fdf, EnemyGroupGfx60  ; ENEMY_GROUP_087
	dw Data_64fc3, EnemyGroupGfx71  ; ENEMY_GROUP_088
	dw Data_64fed, EnemyGroupGfx72  ; ENEMY_GROUP_089
	dw Data_64fed, EnemyGroupGfx73  ; ENEMY_GROUP_090
	dw Data_64fdf, EnemyGroupGfx4   ; ENEMY_GROUP_091
	dw Data_64fed, EnemyGroupGfx14  ; ENEMY_GROUP_092
	dw Data_64fd1, EnemyGroupGfx24  ; ENEMY_GROUP_093
	dw Data_64fc3, EnemyGroupGfx74  ; ENEMY_GROUP_094
	dw Data_64fdf, EnemyGroupGfx75  ; ENEMY_GROUP_095
	dw Data_64fc3, EnemyGroupGfx76  ; ENEMY_GROUP_096
	dw Data_64fed, EnemyGroupGfx77  ; ENEMY_GROUP_097
	dw Data_64fed, EnemyGroupGfx78  ; ENEMY_GROUP_098
	dw Data_64fed, EnemyGroupGfx79  ; ENEMY_GROUP_099
	dw Data_64fed, EnemyGroupGfx80  ; ENEMY_GROUP_100
	dw Data_64fc3, EnemyGroupGfx81  ; ENEMY_GROUP_101
	dw Data_64fdf, EnemyGroupGfx82  ; ENEMY_GROUP_102
	dw Data_64fed, EnemyGroupGfx3   ; ENEMY_GROUP_103
	dw Data_64fed, EnemyGroupGfx83  ; ENEMY_GROUP_104
	dw Data_64fed, EnemyGroupGfx84  ; ENEMY_GROUP_105
	dw Data_64fed, EnemyGroupGfx85  ; ENEMY_GROUP_106
	dw Data_64fd1, EnemyGroupGfx86  ; ENEMY_GROUP_107
	dw Data_64fdf, EnemyGroupGfx87  ; ENEMY_GROUP_108
	dw Data_64fdf, EnemyGroupGfx88  ; ENEMY_GROUP_109
	dw Data_64fed, EnemyGroupGfx89  ; ENEMY_GROUP_110
	dw Data_64fd1, EnemyGroupGfx95  ; ENEMY_GROUP_111
	dw Data_64fd1, EnemyGroupGfx90  ; ENEMY_GROUP_112
	dw Data_64fc3, EnemyGroupGfx91  ; ENEMY_GROUP_113
	dw Data_64fed, EnemyGroupGfx92  ; ENEMY_GROUP_114
	dw Data_64fed, EnemyGroupGfx93  ; ENEMY_GROUP_115
	dw Data_64fc3, EnemyGroupGfx94  ; ENEMY_GROUP_116
	dw Data_64fdf, EnemyGroupGfx96  ; ENEMY_GROUP_117
	dw Data_64fd1, EnemyGroupGfx91  ; ENEMY_GROUP_118
	dw Data_64fdf, EnemyGroupGfx97  ; ENEMY_GROUP_119
	dw Data_64fd1, EnemyGroupGfx77  ; ENEMY_GROUP_120
	dw Data_64fd1, EnemyGroupGfx98  ; ENEMY_GROUP_121
	dw Data_64fdf, EnemyGroupGfx99  ; ENEMY_GROUP_122
	dw Data_64fdf, EnemyGroupGfx100 ; ENEMY_GROUP_123
	dw Data_64fc3, EnemyGroupGfx5   ; ENEMY_GROUP_124
	dw Data_64fc3, EnemyGroupGfx101 ; ENEMY_GROUP_125
	dw Data_64fed, EnemyGroupGfx101 ; ENEMY_GROUP_126
	dw Data_64fc3, EnemyGroupGfx85  ; ENEMY_GROUP_127
	dw Data_64fd1, EnemyGroupGfx105 ; ENEMY_GROUP_128
	dw Data_64fdf, EnemyGroupGfx102 ; ENEMY_GROUP_129
	dw Data_64fc3, EnemyGroupGfx103 ; ENEMY_GROUP_130
	dw Data_64fed, EnemyGroupGfx104 ; ENEMY_GROUP_131
	dw Data_64fdf, EnemyGroupGfx106 ; ENEMY_GROUP_132
	dw Data_64fed, EnemyGroupGfx107 ; ENEMY_GROUP_133
	dw Data_64fed, EnemyGroupGfx108 ; ENEMY_GROUP_134
	dw Data_64fed, EnemyGroupGfx109 ; ENEMY_GROUP_135
	dw Data_64fc3, EnemyGroupGfx110 ; ENEMY_GROUP_136
	dw Data_64fd1, EnemyGroupGfx111 ; ENEMY_GROUP_137
	dw Data_64fc3, EnemyGroupGfx112 ; ENEMY_GROUP_138
	dw Data_64fdf, EnemyGroupGfx113 ; ENEMY_GROUP_139
	dw Data_64fc3, EnemyGroupGfx114 ; ENEMY_GROUP_140
	dw Data_64fc3, EnemyGroupGfx115 ; ENEMY_GROUP_141
	dw Data_64fd1, EnemyGroupGfx116 ; ENEMY_GROUP_142
	dw Data_64fdf, EnemyGroupGfx43  ; ENEMY_GROUP_143
	dw Data_64fd1, EnemyGroupGfx44  ; ENEMY_GROUP_144
	dw Data_64ffb, EnemyGroupGfx117 ; ENEMY_GROUP_145
	assert_table_length NUM_ENEMY_GROUPS

EnemyGroupGfx0:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx1:
	db $00

	dw SilkyGfx
	dw CountRichtertoffenGfx
	dw DoughnuteerGfx
	dw BeamBotGfx

	dw DummyObjectData
	dw CountRichtertoffenData
	dw DoughnuteerData
	dw BeamBotData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/count_richtertoffen.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/beam_bot.pal"

EnemyGroupGfx2:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw BlueBirdData
	dw FutamoguData
	dw TorchData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/futamogu1.pal"
INCLUDE "gfx/pals/torch.pal"

EnemyGroupGfx3:
	db $00

	dw SilkyGfx
	dw CountRichtertoffenGfx
	dw ClearGate2Gfx
	dw OmodonmekaGfx

	dw SilkyData
	dw CountRichtertoffenData
	dw ClearGate2Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/count_richtertoffen.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx4:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw OmodonGfx
	dw OmodonmekaGfx

	dw DummyObjectData
	dw DummyObjectData
	dw OmodonmekaWithOmodon1Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/webber1.pal"
INCLUDE "gfx/pals/omodon.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx5:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw OmodonGfx
	dw OmodonmekaGfx

	dw DummyObjectData
	dw DummyObjectData
	dw OmodonmekaWithOmodon2Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/webber1.pal"
INCLUDE "gfx/pals/omodon.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx6:
	db $00

	dw SpearheadGfx
	dw KushimushiGfx
	dw FutamoguGfx
	dw TorchGfx

	dw DummyObjectData
	dw KushimushiVerticalData
	dw DummyObjectData
	dw DummyObjectData
	dw KushimushiHorizontalData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/kushimushi.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx7:
	db $00

	dw MizuuoGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw MizuuoData
	dw NULL

INCLUDE "gfx/pals/mizuuo.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx8:
	db $00

	dw SpearheadGfx
	dw KushimushiGfx
	dw BigLeafGfx
	dw TorchGfx

	dw DummyObjectData
	dw KushimushiVerticalData
	dw BigLeafSpawnerData
	dw DummyObjectData
	dw KushimushiHorizontalData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/kushimushi.pal"
INCLUDE "gfx/pals/big_leaf.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx9:
	db $00

	dw MizuuoGfx
	dw WebberGfx
	dw BigLeafGfx
	dw TorchGfx

	dw MizuuoData
	dw DummyObjectData
	dw BigLeafSpawnerData
	dw NULL

INCLUDE "gfx/pals/mizuuo.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/big_leaf.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx10:
	db $00

	dw SilkyGfx
	dw BirdGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw SilkyData
	dw OrangeBirdData
	dw DoughnuteerData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/orange_bird.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx11:
	db $00

	dw SnakeGfx
	dw ParaGoomGfx
	dw DoughnuteerGfx
	dw FireBotGfx

	dw SnakeData
	dw ParaGoomData
	dw DoughnuteerData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx12:
	db $00

	dw SnakeGfx
	dw ParaGoomGfx
	dw ZombieGfx
	dw FireBotGfx

	dw SnakeData
	dw ParaGoomData
	dw ZombieData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx13:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw SmallLeafGfx

	dw SpearheadData
	dw WebberData
	dw FutamoguData
	dw SmallLeafData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/webber2.pal"
INCLUDE "gfx/pals/futamogu1.pal"
INCLUDE "gfx/pals/small_leaf.pal"

EnemyGroupGfx14:
	db $00

	dw SpearheadGfx
	dw ApplebyGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw ApplebyData
	dw FutamoguData
	dw TorchData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/futamogu1.pal"
INCLUDE "gfx/pals/torch.pal"

EnemyGroupGfx15:
	db $00

	dw PrinceFroggyGfx
	dw HammerBotGfx
	dw SpearBotGfx
	dw BarrelGfx

	dw RedPrinceFroggyData
	dw HammerBotData
	dw SpearBotData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/prince_froggy1.pal"
INCLUDE "gfx/pals/hammer_bot.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx16:
	db $00

	dw MadSciensteinGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw TeruteruGfx

	dw MadSciensteinData
	dw ParaGoomData
	dw FutamoguData
	dw TeruteruData
	dw SeeingEyeDoorData
	dw NULL

INCLUDE "gfx/pals/mad_scienstein.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/futamogu1.pal"
INCLUDE "gfx/pals/teruteru.pal"

EnemyGroupGfx17:
	db $00

	dw SpearheadGfx
	dw PneumoGfx
	dw FutamoguGfx
	dw ClearGate3Gfx

	dw SpearheadData
	dw PneumoData
	dw DummyObjectData
	dw ClearGate3Data
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/pneumo.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/clear_gate.pal"

EnemyGroupGfx18:
	db $00

	dw MadSciensteinGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw ElectricLampGfx

	dw MadSciensteinData
	dw ParaGoomData
	dw DummyObjectData
	dw ElectricLampData
	dw SeeingEyeDoorData
	dw NULL

INCLUDE "gfx/pals/mad_scienstein.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/electric_lamp.pal"

EnemyGroupGfx19:
	db $00

	dw Sun1Gfx
	dw Sun2Gfx
	dw ClearGate2Gfx
	dw TorchGfx

	dw SunData
	dw DummyObjectData
	dw ClearGate2Data
	dw NULL

INCLUDE "gfx/pals/sun.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx20:
	db $00

	dw Moon1Gfx
	dw Moon2Gfx
	dw ClearGate2Gfx
	dw TorchGfx

	dw MoonData
	dw DummyObjectData
	dw ClearGate2Data
	dw NULL

INCLUDE "gfx/pals/moon.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx21:
	db $00

	dw UnusedFlowerGfx
	dw HammerBotGfx
	dw SpearBotGfx
	dw TorchGfx

	dw UnusedFlowerData
	dw HammerBotData
	dw SpearBotData
	dw TorchData
	dw NULL

INCLUDE "gfx/pals/unused_flower.pal"
INCLUDE "gfx/pals/hammer_bot.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/torch.pal"

EnemyGroupGfx22:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw HandGfx
	dw TorchGfx

	dw SpearheadData
	dw DummyObjectData
	dw HandData
	dw DummyObjectData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hand1.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx23:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx24:
	db $00

	dw HaridamaGfx
	dw WebberGfx
	dw BubbleGfx
	dw TorchGfx

	dw HaridamaData
	dw DummyObjectData
	dw BubbleHoleData
	dw DummyObjectData
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/bubble.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx25:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw KobattoGfx
	dw WaterDropGfx

	dw SpearheadData
	dw DummyObjectData
	dw KobattoData
	dw WaterDropData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/kobatto.pal"
INCLUDE "gfx/pals/water_drop.pal"

EnemyGroupGfx26:
	db $00

	dw SnakeGfx
	dw ClearGate1Gfx
	dw CartGfx
	dw FireBotGfx

	dw SnakeData
	dw ClearGate1Data
	dw CartRightData
	dw CartLeftData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/cart.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx27:
	db $00

	dw SpearheadGfx
	dw ClearGate1Gfx
	dw CartGfx
	dw FireBotGfx

	dw DummyObjectData
	dw ClearGate1Data
	dw CartVariableRightData
	dw CartVariableLeftData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/cart.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx28:
	db $00

	dw SnakeGfx
	dw ClearGate1Gfx
	dw CartGfx
	dw FireBotGfx

	dw SnakeData
	dw ClearGate1Data
	dw CartVariableRightData
	dw CartVariableLeftData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/cart.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx29:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw CartGfx
	dw TorchGfx

	dw SpearheadData
	dw DummyObjectData
	dw CartRightData
	dw CartLeftData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/cart.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx30:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw NobiiruGfx

	dw DummyObjectData
	dw ParaGoomData
	dw DummyObjectData
	dw NobiiruLeftData
	dw NobiiruRightData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/nobiiru.pal"

EnemyGroupGfx31:
	db $00

	dw SilkyGfx
	dw ParaGoomGfx
	dw ClearGate2Gfx
	dw BeamBotGfx

	dw SilkyData
	dw ParaGoomData
	dw ClearGate2Data
	dw BeamBotData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/beam_bot.pal"

EnemyGroupGfx32:
	db $00

	dw SpearheadGfx
	dw ApplebyGfx
	dw ClearGate2Gfx
	dw ElectricLampGfx

	dw DummyObjectData
	dw ApplebyData
	dw ClearGate2Data
	dw ElectricLampData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/electric_lamp.pal"

EnemyGroupGfx33:
	db $00

	dw RoboMouse1Gfx
	dw RoboMouse2Gfx
	dw SpearBotGfx
	dw TorchGfx

	dw RoboMouseData
	dw DummyObjectData
	dw SpearBotData
	dw NULL

INCLUDE "gfx/pals/robo_mouse.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx34:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw TogebaGfx

	dw DummyObjectData
	dw ParaGoomData
	dw DummyObjectData
	dw TogebaData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/togeba.pal"

EnemyGroupGfx35:
	db $00

	dw HaridamaGfx
	dw WebberGfx
	dw FutamoguGfx
	dw BrrrBearGfx

	dw HaridamaData
	dw DummyObjectData
	dw DummyObjectData
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx36:
	db $00

	dw HaridamaGfx
	dw WebberGfx
	dw BubbleGfx
	dw NobiiruGfx

	dw HaridamaData
	dw WebberData
	dw BubbleHoleData
	dw NobiiruLeftData
	dw NobiiruRightData
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/webber2.pal"
INCLUDE "gfx/pals/bubble.pal"
INCLUDE "gfx/pals/nobiiru.pal"

EnemyGroupGfx37:
	db $00

	dw OwlGfx
	dw WebberGfx
	dw OmodonGfx
	dw OmodonmekaGfx

	dw OwlData
	dw DummyObjectData
	dw OmodonmekaWithOmodon1Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/owl.pal"
INCLUDE "gfx/pals/webber1.pal"
INCLUDE "gfx/pals/omodon.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx38:
	db $00

	dw OwlGfx
	dw PneumoGfx
	dw ClearGate2Gfx
	dw OmodonmekaGfx

	dw OwlData
	dw PneumoData
	dw ClearGate2Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/owl.pal"
INCLUDE "gfx/pals/pneumo.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx39:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw ZipLineGfx
	dw BeamBotGfx

	dw ZipLine1Data
	dw ZipLine2Data
	dw ZipLine3Data
	dw ZipLine4Data
	dw ZipLine5Data
	dw ParaGoomData
	dw SpearheadData
	dw BeamBotData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/zip_line.pal"
INCLUDE "gfx/pals/beam_bot.pal"

EnemyGroupGfx40:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw SpearBotGfx
	dw FireBotGfx

	dw SpearheadData
	dw ParaGoomData
	dw SpearBotData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx41:
	db $04

	dw Anonster1Gfx
	dw Anonster2Gfx
	dw Anonster3Gfx
	dw Anonster4Gfx

	dw AnonsterData
	dw SilkPlatformsData
	dw NULL

INCLUDE "gfx/pals/anonster.pal"

EnemyGroupGfx42:
	db $00

	dw StoveGfx
	dw ParaGoomGfx
	dw FlameBlockGfx
	dw TorchGfx

	dw StoveData
	dw ParaGoomData
	dw FlameBlockData
	dw TorchNoEmbersData
	dw FlameBlockTorchData
	dw NULL

INCLUDE "gfx/pals/stove.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/flame_block.pal"
INCLUDE "gfx/pals/torch.pal"

EnemyGroupGfx43:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw KobattoGfx
	dw TorchGfx

	dw SpearheadData
	dw BlueBirdData
	dw KobattoData
	dw DummyObjectData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/kobatto.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx44:
	db $00

	dw SpearheadGfx
	dw HammerBotGfx
	dw ZombieGfx
	dw TorchGfx

	dw DummyObjectData
	dw HammerBotData
	dw ZombieData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hammer_bot.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx45:
	db $04

	dw DollBoy1Gfx
	dw DollBoy2Gfx
	dw DollBoy3Gfx
	dw DollBoy4Gfx

	dw DollBoyData
	dw HammerPlatformSpawnerData
	dw DollBoyBarrel1Data
	dw DollBoyBarrel2Data
	dw DollBoyBarrel3Data
	dw NULL

INCLUDE "gfx/pals/doll_boy.pal"

EnemyGroupGfx46:
	db $00

	dw MadSciensteinGfx
	dw ParaGoomGfx
	dw ZombieGfx
	dw TorchGfx

	dw MadSciensteinData
	dw ParaGoomData
	dw ZombieData
	dw DummyObjectData
	dw SeeingEyeDoorData
	dw NULL

INCLUDE "gfx/pals/mad_scienstein.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx47:
	db $04

	dw Wormwould1Gfx
	dw Wormwould2Gfx
	dw Wormwould3Gfx
	dw Wormwould4Gfx

	dw WormwouldData
	dw PalmTreeSpawnerData
	dw NULL

INCLUDE "gfx/pals/wormwould.pal"

EnemyGroupGfx48:
	db $00

	dw OwlGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw TorchGfx

	dw OwlData
	dw ParaGoomData
	dw NULL

INCLUDE "gfx/pals/owl.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx49:
	db $00

	dw HaridamaGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw PillarPlatformGfx

	dw HaridamaData
	dw ParaGoomData
	dw DummyObjectData
	dw PillarPlatform1Data
	dw PillarPlatform2Data
	dw PillarPlatform3Data
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/futamogu2.pal"
INCLUDE "gfx/pals/pillar_platform.pal"

EnemyGroupGfx50:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw DoughnuteerGfx
	dw FireBotGfx

	dw DummyObjectData
	dw ParaGoomData
	dw DoughnuteerData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx51:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw ZombieGfx
	dw FireBotGfx

	dw DummyObjectData
	dw ParaGoomData
	dw ZombieData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx52:
	db $04

	dw YellowBelly1Gfx
	dw YellowBelly2Gfx
	dw YellowBelly3Gfx
	dw YellowBelly4Gfx

	dw YellowBellyBodyData
	dw YellowBellyPlatformData
	dw NULL

INCLUDE "gfx/pals/yellow_belly.pal"

EnemyGroupGfx53:
	db $00

	dw SpearheadGfx
	dw ApplebyGfx
	dw KobattoGfx
	dw WaterDropGfx

	dw SpearheadData
	dw ApplebyData
	dw KobattoData
	dw WaterDropData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/kobatto.pal"
INCLUDE "gfx/pals/water_drop.pal"

EnemyGroupGfx54:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw SpearheadData
	dw DummyObjectData
	dw DoughnuteerData
	dw DummyObjectData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx55:
	db $00

	dw PrinceFroggyGfx
	dw ParaGoomGfx
	dw ZipLineGfx
	dw BrrrBearGfx

	dw GreyPrinceFroggyData
	dw ParaGoomData
	dw ZipLine4Data
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/zip_line.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx56:
	db $04

	dw Pesce1Gfx
	dw Pesce2Gfx
	dw Pesce3Gfx
	dw Pesce4Gfx

	dw PesceData
	dw DragonflySpawnerData
	dw FlySpawnerData
	dw StrongWaterCurrentData
	dw Dragonfly2Data
	dw NULL

INCLUDE "gfx/pals/pesce.pal"

EnemyGroupGfx57:
	db $00

	dw StoveGfx
	dw WebberGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw StoveData
	dw DummyObjectData
	dw DoughnuteerData
	dw NULL

INCLUDE "gfx/pals/stove.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx58:
	db $00

	dw StoveGfx
	dw WebberGfx
	dw ZombieGfx
	dw FireBotGfx

	dw StoveData
	dw DummyObjectData
	dw ZombieData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/stove.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx59:
	db $00

	dw SnakeGfx
	dw BirdGfx
	dw HebariiGfx
	dw NobiiruGfx

	dw SnakeData
	dw OrangeBirdData
	dw HebariiData
	dw NobiiruLeftData
	dw NobiiruRightData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/orange_bird.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/nobiiru.pal"

EnemyGroupGfx60:
	db $00

	dw HaridamaGfx
	dw WebberGfx
	dw TadpoleGfx
	dw BarrelGfx

	dw HaridamaData
	dw DummyObjectData
	dw TadpoleSpawnerData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/tadpole.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx61:
	db $00

	dw PrinceFroggyGfx
	dw WebberGfx
	dw KobattoGfx
	dw WaterDropGfx

	dw GreyPrinceFroggyData
	dw DummyObjectData
	dw KobattoData
	dw WaterDropData
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/kobatto.pal"
INCLUDE "gfx/pals/water_drop.pal"

EnemyGroupGfx62:
	db $00

	dw SpearheadGfx
	dw PneumoGfx
	dw DoughnuteerGfx
	dw SparkGfx

	dw DummyObjectData
	dw PneumoData
	dw DoughnuteerData
	dw SparkHorizontalData
	dw SparkVerticalData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/pneumo.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/spark.pal"

EnemyGroupGfx63:
	db $00

	dw SpearheadGfx
	dw PneumoGfx
	dw FutamoguGfx
	dw BeamBotGfx

	dw SpearheadData
	dw PneumoData
	dw DummyObjectData
	dw BeamBotData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/pneumo.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/beam_bot.pal"

EnemyGroupGfx64:
	db $00

	dw Sun1Gfx
	dw Sun2Gfx
	dw SpearBotGfx
	dw BrrrBearGfx

	dw SunData
	dw DummyObjectData
	dw SpearBotData
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/sun.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx65:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw BubbleGfx
	dw BarrelGfx

	dw DummyObjectData
	dw OrangeBirdData
	dw BubbleHoleData
	dw Barrel1Data
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/orange_bird.pal"
INCLUDE "gfx/pals/bubble.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx66:
	db $00

	dw PrinceFroggyGfx
	dw PneumoGfx
	dw WallCrackGfx
	dw BarrelGfx

	dw GreyPrinceFroggyData
	dw PneumoData
	dw WallCrackClosedData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/pneumo.pal"
INCLUDE "gfx/pals/wall_crack.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx67:
	db $00

	dw SnakeGfx
	dw ParaGoomGfx
	dw FireGfx
	dw FireBotGfx

	dw SnakeData
	dw ParaGoomData
	dw FireData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/fire.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx68:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw KobattoGfx
	dw NobiiruGfx

	dw DummyObjectData
	dw DummyObjectData
	dw KobattoData
	dw NobiiruLeftData
	dw NobiiruRightData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/kobatto.pal"
INCLUDE "gfx/pals/nobiiru.pal"

EnemyGroupGfx69:
	db $00

	dw SnakeGfx
	dw ApplebyGfx
	dw WallCrackGfx
	dw BarrelGfx

	dw SnakeData
	dw ApplebyData
	dw WallCrackOpenData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/wall_crack.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx70:
	db $04

	dw Scowler1Gfx
	dw Scowler2Gfx
	dw Scowler3Gfx
	dw Scowler4Gfx

	dw ScowlerData
	dw FloatingRingSpawnerData
	dw NULL

INCLUDE "gfx/pals/scowler.pal"

EnemyGroupGfx71:
	db $00

	dw WaterSparkGfx
	dw WebberGfx
	dw SpearBotGfx
	dw FireBotGfx

	dw WaterSparkData
	dw DummyObjectData
	dw SpearBotData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/water_spark.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx72:
	db $00

	dw HaridamaGfx
	dw WebberGfx
	dw BubbleGfx
	dw OctohonGfx

	dw HaridamaData
	dw DummyObjectData
	dw BubbleHoleData
	dw SmallOctohonData
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/bubble.pal"
INCLUDE "gfx/pals/octohon.pal"

EnemyGroupGfx73:
	db $00

	dw HaridamaGfx
	dw WebberGfx
	dw BubbleGfx
	dw OctohonGfx

	dw HaridamaData
	dw DummyObjectData
	dw BubbleHoleData
	dw BigOctohonData
	dw NULL

INCLUDE "gfx/pals/haridama.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/bubble.pal"
INCLUDE "gfx/pals/octohon.pal"

EnemyGroupGfx74:
	db $00

	dw PrinceFroggyGfx
	dw WebberGfx
	dw HandGfx
	dw FireBotGfx

	dw GreyPrinceFroggyData
	dw DummyObjectData
	dw HandData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hand2.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx75:
	db $00

	dw OwlGfx
	dw WebberGfx
	dw FutamoguGfx
	dw SparkGfx

	dw OwlData
	dw DummyObjectData
	dw DummyObjectData
	dw SparkHorizontalData
	dw SparkVerticalData
	dw NULL

INCLUDE "gfx/pals/owl.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/spark.pal"

EnemyGroupGfx76:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw RockGfx
	dw BrrrBearGfx

	dw DummyObjectData
	dw DummyObjectData
	dw RockData
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/rock.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx77:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw FallingSnowGfx

	dw SpearheadData
	dw DummyObjectData
	dw DummyObjectData
	dw FallingSnowSpawnerData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/falling_snow.pal"

EnemyGroupGfx78:
	db $00

	dw SpearheadGfx
	dw ApplebyGfx
	dw ClearGate2Gfx
	dw BarrelGfx

	dw DummyObjectData
	dw ApplebyData
	dw ClearGate2Data
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx79:
	db $00

	dw SilkyGfx
	dw ApplebyGfx
	dw FutamoguGfx
	dw BarrelGfx

	dw SilkyData
	dw ApplebyData
	dw DummyObjectData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx80:
	db $00

	dw StoveGfx
	dw HammerBotGfx
	dw FutamoguGfx
	dw TorchGfx

	dw StoveData
	dw HammerBotData
	dw NULL

INCLUDE "gfx/pals/stove.pal"
INCLUDE "gfx/pals/hammer_bot.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx81:
	db $00

	dw SpearheadGfx
	dw HammerBotGfx
	dw FireGfx
	dw FireBotGfx

	dw SpearheadData
	dw HammerBotData
	dw FireData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/hammer_bot.pal"
INCLUDE "gfx/pals/fire.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx82:
	db $04

	dw Jamano1Gfx
	dw Jamano2Gfx
	dw Jamano3Gfx
	dw Jamano4Gfx

	dw JamanoData
	dw SkullSpawnerData
	dw HatPlatformData
	dw NULL

INCLUDE "gfx/pals/jamano.pal"

EnemyGroupGfx83:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw OmodonGfx
	dw OmodonmekaGfx

	dw SpearheadData
	dw DummyObjectData
	dw OmodonmekaWithOmodon1Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/webber1.pal"
INCLUDE "gfx/pals/omodon.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx84:
	db $00

	dw SnakeGfx
	dw WebberGfx
	dw FutamoguGfx
	dw FireBotGfx

	dw SnakeData
	dw DummyObjectData
	dw DummyObjectData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx85:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw HebariiGfx
	dw BarrelGfx

	dw DummyObjectData
	dw DummyObjectData
	dw HebariiData
	dw Barrel1Data
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx86:
	db $04

	dw Muddee1Gfx
	dw Muddee2Gfx
	dw Muddee3Gfx
	dw Muddee4Gfx

	dw MuddeeData
	dw Turtle1Data
	dw Turtle2Data
	dw NULL

INCLUDE "gfx/pals/muddee.pal"

EnemyGroupGfx87:
	db $04

	dw Wolfenboss1Gfx
	dw Wolfenboss2Gfx
	dw Wolfenboss3Gfx
	dw Wolfenboss4Gfx

	dw WolfenbossData
	dw WolfenbossPlatformData
	dw NULL

INCLUDE "gfx/pals/wolfenboss.pal"

EnemyGroupGfx88:
	db $00

	dw SpearheadGfx
	dw CountRichtertoffenGfx
	dw FutamoguGfx
	dw BarrelGfx

	dw DummyObjectData
	dw CountRichtertoffenData
	dw DummyObjectData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/count_richtertoffen.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx89:
	db $00

	dw SpearheadGfx
	dw ApplebyGfx
	dw OmodonGfx
	dw OmodonmekaGfx

	dw DummyObjectData
	dw ApplebyData
	dw OmodonmekaWithOmodon1Data
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/omodon.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx90:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw HebariiGfx
	dw NobiiruGfx

	dw DummyObjectData
	dw OrangeBirdData
	dw HebariiData
	dw NobiiruLeftData
	dw NobiiruRightData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/orange_bird.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/nobiiru.pal"

EnemyGroupGfx91:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw BlueBirdData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx92:
	db $00

	dw SilkyGfx
	dw BirdGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw SilkyData
	dw BlueBirdData
	dw DoughnuteerData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx93:
	db $00

	dw SilkyGfx
	dw WebberGfx
	dw FutamoguGfx
	dw BrrrBearGfx

	dw SilkyData
	dw DummyObjectData
	dw DummyObjectData
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx94:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw ZombieGfx
	dw BrrrBearGfx

	dw DummyObjectData
	dw DummyObjectData
	dw ZombieData
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx95:
	db $04

	dw Shoot1Gfx
	dw Shoot2Gfx
	dw Shoot3Gfx
	dw Shoot4Gfx

	dw ShootData
	dw GKTortoiseData
	dw ShootGoalCounterData
	dw WarioGoalCounterData
	dw GKTortoisePlatformData
	dw NULL

INCLUDE "gfx/pals/shoot.pal"

EnemyGroupGfx96:
	db $00

	dw SpearheadGfx
	dw ApplebyGfx
	dw FutamoguGfx
	dw SparkGfx

	dw DummyObjectData
	dw ApplebyData
	dw DummyObjectData
	dw SparkHorizontalData
	dw SparkVerticalData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/appleby.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/spark.pal"

EnemyGroupGfx97:
	db $00

	dw MadSciensteinGfx
	dw WebberGfx
	dw TadpoleGfx
	dw BrrrBearGfx

	dw MadSciensteinData
	dw DummyObjectData
	dw TadpoleSpawnerData
	dw BrrrBearData
	dw SeeingEyeDoorData
	dw NULL

INCLUDE "gfx/pals/mad_scienstein.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/tadpole.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx98:
	db $00

	dw SilkyGfx
	dw WebberGfx
	dw HebariiGfx
	dw FireBotGfx

	dw SilkyData
	dw DummyObjectData
	dw HebariiData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/silky.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx99:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw WebberData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/webber2.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx100:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw ClearGate2Gfx
	dw BrrrBearGfx

	dw SpearheadData
	dw DummyObjectData
	dw ClearGate2Data
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/clear_gate.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx101:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw FutamoguGfx
	dw SparkGfx

	dw DummyObjectData
	dw BlueBirdData
	dw DummyObjectData
	dw SparkHorizontalData
	dw SparkVerticalData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/spark.pal"

EnemyGroupGfx102:
	db $00

	dw PrinceFroggyGfx
	dw BirdGfx
	dw ZombieGfx
	dw ClearGate3Gfx

	dw GreyPrinceFroggyData
	dw BlueBirdData
	dw ZombieData
	dw ClearGate3Data
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/zombie.pal"
INCLUDE "gfx/pals/clear_gate.pal"

EnemyGroupGfx103:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw RockGfx
	dw TogebaGfx

	dw DummyObjectData
	dw DummyObjectData
	dw RockData
	dw TogebaData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/rock.pal"
INCLUDE "gfx/pals/togeba.pal"

EnemyGroupGfx104:
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw FutamoguGfx
	dw BarrelGfx

	dw DummyObjectData
	dw BlueBirdData
	dw DummyObjectData
	dw Barrel1Data
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/blue_bird.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx105:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw BeamBotGfx

	dw DummyObjectData
	dw DummyObjectData
	dw DummyObjectData
	dw BeamBotData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/beam_bot.pal"

EnemyGroupGfx106:
	db $00

	dw Moon1Gfx
	dw Moon2Gfx
	dw SpearBotGfx
	dw FireBotGfx

	dw MoonData
	dw DummyObjectData
	dw SpearBotData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/moon.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx107:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw HebariiGfx
	dw BrrrBearGfx

	dw DummyObjectData
	dw ParaGoomData
	dw HebariiData
	dw BrrrBearData
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/brrr_bear.pal"

EnemyGroupGfx108:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw DoughnuteerGfx
	dw TogebaGfx

	dw SpearheadData
	dw ParaGoomData
	dw DoughnuteerData
	dw TogebaData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/doughnuteer.pal"
INCLUDE "gfx/pals/togeba.pal"

EnemyGroupGfx109:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw SpearBotGfx
	dw OmodonmekaGfx

	dw DummyObjectData
	dw DummyObjectData
	dw SpearBotData
	dw OmodonmekaData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/spear_bot.pal"
INCLUDE "gfx/pals/omodonmeka.pal"

EnemyGroupGfx110:
	db $00

	dw SpearheadGfx
	dw HammerBotGfx
	dw FutamoguGfx
	dw FireBotGfx

	dw SpearheadData
	dw HammerBotData
	dw DummyObjectData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/hammer_bot.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx111:
	db $00

	dw SnakeGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw FireBotGfx

	dw SnakeData
	dw ParaGoomData
	dw DummyObjectData
	dw FireBotData
	dw NULL

INCLUDE "gfx/pals/snake.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/fire_bot.pal"

EnemyGroupGfx112:
	db $00

	dw PrinceFroggyGfx
	dw PneumoGfx
	dw WallCrackGfx
	dw BarrelGfx

	dw GreyPrinceFroggyData
	dw PneumoData
	dw WallCrackOpenData
	dw Barrel2Data
	dw NULL

INCLUDE "gfx/pals/prince_froggy2.pal"
INCLUDE "gfx/pals/pneumo.pal"
INCLUDE "gfx/pals/wall_crack.pal"
INCLUDE "gfx/pals/barrel.pal"

EnemyGroupGfx113:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw RockGfx
	dw TorchGfx

	dw DummyObjectData
	dw DummyObjectData
	dw RockData
	dw TorchData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/rock.pal"
INCLUDE "gfx/pals/torch.pal"

EnemyGroupGfx114:
	db $00

	dw StoveGfx
	dw WebberGfx
	dw HebariiGfx
	dw TorchGfx

	dw StoveData
	dw DummyObjectData
	dw HebariiData
	dw NULL

INCLUDE "gfx/pals/stove.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx115:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw HebariiGfx
	dw TorchGfx

	dw SpearheadData
	dw DummyObjectData
	dw HebariiData
	dw NULL

INCLUDE "gfx/pals/spearhead.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/hebarii.pal"
INCLUDE "gfx/pals/dummy.pal"

EnemyGroupGfx116:
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TeruteruGfx

	dw DummyObjectData
	dw DummyObjectData
	dw DummyObjectData
	dw TeruteruData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/teruteru.pal"

EnemyGroupGfx117:
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw TorchGfx

	dw DummyObjectData
	dw ParaGoomData
	dw NULL

INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/para_goom.pal"
INCLUDE "gfx/pals/dummy.pal"
INCLUDE "gfx/pals/dummy.pal"
