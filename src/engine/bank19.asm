LoadEnemyGroupData:: ; 64000 (19:4000)
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
; 0x640e5

; de = cell
; c = entry in wObjDataPointers
SpawnObject: ; 640e5 (19:40e5)
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
; 0x64187

DespawnAllObjects: ; 64187 (19:4187)
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
; 0x6428a

; bc = object creation data
_CreateObjectFromCurObjPos:: ; 6428a (19:428a)
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
; 0x642d9

_CreateObjectAtRelativePos:: ; 642d9 (19:42d9)
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
CreateObject_GotPos:: ; 64352 (19:4352)
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
; 0x643a1

LoadHiddenFigureData: ; 643a1 (19:43a1)
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
; 0x643c3

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
MusicaCoinData:            object_data OAM_18c000, $3, OBJ_INTERACTION_MUSICAL_COIN,               -25, MusicalCoinFunc,           $0
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
HebariiData:               object_data OAM_18a703, $0, OBJ_INTERACTION_3D,                         -15, HebariiFunc,               $0
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
OrangeBirdData:            object_data OAM_1819e3, $f, OBJ_INTERACTION_24,                         -13, BirdFunc,                  OBJFLAG_PRIORITY
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
PneumoData:                object_data OAM_184db9, $6, OBJ_INTERACTION_1E,                         -16, PneumoFunc,                OBJFLAG_PRIORITY
ElectricLampData:          object_data OAM_184eeb, $7, OBJ_INTERACTION_0B,                           0, ElectricLampFunc,          $0
ZombieData:                object_data OAM_184ffa, $9, OBJ_INTERACTION_0B             | HEAVY_OBJ,  -6, ZombieFunc,                OBJFLAG_PRIORITY
FireBotData:               object_data OAM_184755, $c, OBJ_INTERACTION_0B,                         -14, FireBotFunc,               OBJFLAG_PRIORITY
SpearBotData:              object_data OAM_18440a, $b, OBJ_INTERACTION_01,                         -14, SpearBotFunc,              OBJFLAG_PRIORITY
BeamBotData:               object_data OAM_1845aa, $4, OBJ_INTERACTION_01,                         -14, BeamBotFunc,               OBJFLAG_PRIORITY
SunData:                   object_data OAM_1851df, $a, OBJ_INTERACTION_FIRE,                       -20, SunFunc,                   $0
MoonData:                  object_data OAM_1854a2, $a, OBJ_INTERACTION_ELECTRIC,                   -20, MoonFunc,                  $0
KobattoData:               object_data OAM_185788, $0, OBJ_INTERACTION_VAMPIRE,                    -12, KobattoFunc,               OBJFLAG_PRIORITY
HandData:                  object_data OAM_185893, $6, OBJ_INTERACTION_3F,                         -20, HandFunc,                  OBJFLAG_PRIORITY
BubbleHoleData:            object_data OAM_185b98, $e, OBJ_INTERACTION_0B,                           0, BubbleHoleFunc,            $0
BrrrBearData:              object_data OAM_188000, $0, OBJ_INTERACTION_ICE            | HEAVY_OBJ, -18, BrrrBearFunc,              OBJFLAG_PRIORITY
CartLeftData:              object_data OAM_188279, $2, OBJ_INTERACTION_SOLID,                      -16, CartFunc,                  OBJFLAG_PRIORITY
CartRightData:             object_data OAM_188279, $3, OBJ_INTERACTION_SOLID,                      -16, CartFunc,                  OBJFLAG_PRIORITY
CartVariableLeftData:      object_data OAM_188279, $2, OBJ_INTERACTION_SOLID,                      -16, CartVariableFunc,          OBJFLAG_PRIORITY
CartVariableRightData:     object_data OAM_188279, $3, OBJ_INTERACTION_SOLID,                      -16, CartVariableFunc,          OBJFLAG_PRIORITY
RoboMouseData:             object_data OAM_188555, $6, OBJ_INTERACTION_30,                         -20, RoboMouseFunc,             OBJFLAG_PRIORITY
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
PesceData:                 object_data OAM_1927d5, $5, OBJ_INTERACTION_3A             | HEAVY_OBJ, -14, PesceFunc,                 OBJFLAG_PRIORITY
DragonflySpawnerData:      object_data OAM_190000, $6, OBJ_INTERACTION_0B,                           0, DragonflySpawnerFunc,      $0
FlySpawnerData:            object_data OAM_190000, $7, OBJ_INTERACTION_0B,                           0, FlySpawnerFunc,            $0
StrongWaterCurrentData:    object_data OAM_1927d5, $0, OBJ_INTERACTION_51             | HEAVY_OBJ, -26, StrongWaterCurrentFunc,    OBJFLAG_PRIORITY
Dragonfly2Data:            object_data OAM_1927d5, $1, OBJ_INTERACTION_WALKABLE,                    -9, Dragonfly2Func,            OBJFLAG_PRIORITY
TadpoleSpawnerData:        object_data OAM_188000, $2, OBJ_INTERACTION_0B,                           0, TadpoleSpawnerFunc,        $0
WaterSparkData:            object_data OAM_18a7fd, $d, OBJ_INTERACTION_37,                         -13, WaterSparkFunc,            $0
SmallOctohonData:          object_data OAM_18a895, $0, OBJ_INTERACTION_06,                           0, SmallOctohonFunc,          OBJFLAG_PRIORITY
BigOctohonData:            object_data OAM_18a895, $1, OBJ_INTERACTION_06,                          -9, BigOctohonFunc,            $0
SparkHorizontalData:       object_data OAM_18ab04, $2, OBJ_INTERACTION_FULL_STING,                 -11, SparkFunc,                 OBJFLAG_PRIORITY
SparkVerticalData:         object_data OAM_18ab04, $0, OBJ_INTERACTION_FULL_STING,                 -11, SparkFunc,                 OBJFLAG_PRIORITY
ScowlerData:               object_data OAM_194895, $0, OBJ_INTERACTION_41             | HEAVY_OBJ, -32, ScowlerFunc,               $0
FloatingRingSpawnerData:   object_data OAM_194895, $4, OBJ_INTERACTION_0B,                           0, FloatingRingSpawnerFunc,   $0
FireData:                  object_data OAM_18aba0, $4, OBJ_INTERACTION_FIRE,                       -24, FireFunc,                  $0
JamanoData:                object_data OAM_19501c, $6, OBJ_INTERACTION_44,                         -10, JamanoFunc,                $0
SkullSpawnerData:          object_data OAM_19501c, $7, OBJ_INTERACTION_0B,                         -10, SkullSpawnerFunc,          $0
HatPlatformData:           object_data OAM_19501c, $9, OBJ_INTERACTION_31,                          -4, HatPlatformFunc,           OBJFLAG_PRIORITY
MuddeeData:                object_data OAM_195699, $a, OBJ_INTERACTION_0B,                          -8, MuddeeFunc,                $0
Turtle1Data:               object_data OAM_195699, $b, OBJ_INTERACTION_45,                          -2, Turtle1Func,               OBJFLAG_PRIORITY
Turtle2Data:               object_data OAM_195699, $c, OBJ_INTERACTION_45,                          -2, Turtle2Func,               OBJFLAG_PRIORITY
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

ObjParams_HebariiProjectile: ; 6478b (19:478b)
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

ObjParams_WebberProjectile: ; 647a0 (19:47a0)
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

ObjParams_UnusedFlowerProjectileLeft: ; 647b5 (19:47b5)
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

ObjParams_UnusedFlowerProjectileRight: ; 647ca (19:47ca)
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

ObjParams_BigLeaf1: ; 647df (19:47df)
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

ObjParams_BigLeaf2: ; 647df (19:47df)
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

ObjParams_BigLeaf3: ; 647df (19:47df)
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

ObjParams_DoughnutLeft: ; 6481e (19:481e)
	db -18 ; y
	db  -9 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_1A ; interaction type
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

ObjParams_DoughnutRight: ; 64833 (19:4833)
	db -18 ; y
	db   8 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_1A ; interaction type
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

ObjParams_DoughnutUpLeft: ; 64848 (19:4848)
	db -16 ; y
	db  -8 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_1A ; interaction type
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

ObjParams_DoughnutUpRight: ; 6485d (19:485d)
	db -16 ; y
	db   7 ; x
	dn $0, $b ; unk7
	db OBJ_INTERACTION_1A ; interaction type
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

ObjParams_InvisibilityPotionLeft: ; 64872 (19:4872)
	db  -8 ; y
	db -16 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_1D ; interaction type
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

ObjParams_InvisibilityPotionRight: ; 64887 (19:4887)
	db -8 ; y
	db 15 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_1D ; interaction type
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

ObjParams_InvisibilityPotionDropLeft: ; 6489c (19:489c)
	db  -8 ; y
	db -16 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_1D ; interaction type
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

ObjParams_InvisibilityPotionDropRight: ; 648b1 (19:48b1)
	db -8 ; y
	db 15 ; x
	dn $1, $6 ; unk7
	db OBJ_INTERACTION_1D ; interaction type
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

ObjParams_ZombieHeadLeft: ; 648c6 (19:48c6)
	db -16 ; y
	db   0 ; x
	dn $1, $a ; unk7
	db OBJ_INTERACTION_1F ; interaction type
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

ObjParams_ZombieHeadRight: ; 648db (19:48db)
	db -16 ; y
	db   0 ; x
	dn $1, $a ; unk7
	db OBJ_INTERACTION_1F ; interaction type
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

ObjParams_StarsLeft: ; 648f0 (19:48f0)
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

ObjParams_StarsRight: ; 64905 (19:4905)
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

ObjParams_BeamLeft: ; 6491a (19:491a)
	db  0 ; y
	db -8 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_35 ; interaction type
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

ObjParams_BeamRight: ; 6492f (19:492f)
	db  0 ; y
	db  8 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_35 ; interaction type
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

ObjParams_AppleLeft: ; 64948 (19:4948)
	db -14 ; y
	db   7 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_1A ; interaction type
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

ObjParams_AppleRight: ; 64959 (19:4959)
	db -14 ; y
	db  -8 ; x
	dn $1, $1 ; unk7
	db OBJ_INTERACTION_1A ; interaction type
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

ObjParams_SunFlameLeft: ; 6496e (19:496e)
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

ObjParams_SunFlameRight: ; 64983 (19:4983)
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

ObjParams_MoonStarLeft: ; 64998 (19:4998)
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

ObjParams_MoonStarRight: ; 649ad (19:49ad)
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

ObjParams_649c2: ; 649c2 (19:49c2)
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

ObjParams_649d7: ; 649d7 (19:49d7)
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

ObjParams_SnowflakeLeft: ; 649ec (19:49ec)
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

ObjParams_SnowflakeRight: ; 64a01 (19:4a01)
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

ObjParams_MizzouProjectileLeft: ; 64a16 (19:4a16)
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

ObjParams_MizzouProjectileRight: ; 64a2b (19:4a2b)
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

ObjParams_GreyTreasure: ; 64a40 (19:4a40)
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

ObjParams_RedTreasure: ; 64a55 (19:4a55)
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

ObjParams_GreenTreasure: ; 64a6a (19:4a6a)
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

ObjParams_BlueTreasure: ; 64a7f (19:4a7f)
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

ObjParams_AnonsterSilk1Left: ; 64a94 (19:4a94)
	db  1 ; y
	db -4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2C ; interaction type
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

ObjParams_AnonsterSilk1Right: ; 64aa9 (19:4aa9)
	db 1 ; y
	db 3 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2C ; interaction type
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

ObjParams_AnonsterSilk2Left: ; 64abe (19:4abe)
	db  1 ; y
	db -4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2C ; interaction type
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

ObjParams_AnonsterSilk2Right: ; 64ad3 (19:4ad3)
	db 1 ; y
	db 3 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2C ; interaction type
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

ObjParams_AnonsterSilk3Left: ; 64aae8(19:4aae8)
	db  1 ; y
	db -4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2C ; interaction type
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

ObjParams_AnonsterSilk3Right: ; 64afd (19:4afd)
	db 1 ; y
	db 3 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2C ; interaction type
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

ObjParams_AnonsteWaveLeft: ; 64b12(19:4ab12)
	db  4 ; y
	db -5 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2B ; interaction type
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

ObjParams_AnonsterWaveRight: ; 64b27 (19:4b27)
	db 4 ; y
	db 4 ; x
	dn $4, $1 ; unk7
	db OBJ_INTERACTION_2B ; interaction type
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

ObjParams_SilkPlatform1: ; 64b27 (19:4b27)
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

ObjParams_SilkPlatform2: ; 64b51 (19:4b51)
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

ObjParams_SilkPlatform3: ; 64b66 (19:4b66)
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

ObjParams_SnakeFireLeft: ; 64b7b (19:4b7b)
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

ObjParams_SnakeFireRight: ; 64b90 (19:4b90)
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

ObjParams_DollBoyHammer: ; 64ba5 (19:4ba5)
	db -18 ; y
	db -10 ; x
	dn $4, $9 ; unk7
	db OBJ_INTERACTION_32 ; interaction type
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

ObjParams_HammerPlatform: ; 64bba (19:4bba)
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

ObjParams_HighRollingRockLeft: ; 64bcf (19:4bcf)
	db   4 ; y
	db -13 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_33 ; interaction type
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

ObjParams_HighRollingRockRight: ; 64be4 (19:4be4)
	db   4 ; y
	db  12 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_33 ; interaction type
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

ObjParams_LowRollingRockLeft: ; 64bcf (19:4bcf)
	db   4 ; y
	db -13 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_33 ; interaction type
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

ObjParams_LowRollingRockRight: ; 64be4 (19:4be4)
	db   4 ; y
	db  12 ; x
	dn $5, $8 ; unk7
	db OBJ_INTERACTION_33 ; interaction type
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


ObjParams_PalmTreeShort: ; 64c23 (19:4c23)
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

ObjParams_PalmTreeMedium: ; 64c38 (19:4c38)
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

ObjParams_PalmTreeTall: ; 64c4d (19:4c4d)
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

ObjParams_YellowBellyArrowLeft: ; 64c62 (19:4c62)
	db  16 ; y
	db -16 ; x
	dn $4, $d ; unk7
	db OBJ_INTERACTION_37 ; interaction type
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

ObjParams_YellowBellyArrowRight: ; 64c77 (19:4c77)
	db 16 ; y
	db 15 ; x
	dn $4, $d ; unk7
	db OBJ_INTERACTION_37 ; interaction type
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

ObjParams_Dragonfly1: ; 64c8c (19:4c8c)
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

ObjParams_Fly: ; 64ca1 (19:4ca1)
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

ObjParams_Tadpole: ; 64cb6 (19:4cb6)
	db -3 ; y
	db  0 ; x
	dn $2, $f ; unk7
	db OBJ_INTERACTION_3C ; interaction type
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

ObjParams_InkLeft: ; 64ccb (19:4ccb)
	db -12 ; y
	db  -4 ; x
	dn $5, $3 ; unk7
	db OBJ_INTERACTION_42 ; interaction type
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

ObjParams_InkRight: ; 64ce0 (19:4ce0)
	db -12 ; y
	db   3 ; x
	dn $5, $3 ; unk7
	db OBJ_INTERACTION_42 ; interaction type
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

ObjParams_FloatingRing: ; 64cf5 (19:4cf5)
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

ObjParams_Skull1: ; 64d0a (19:4d0a)
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

ObjParams_Skull2: ; 64d1f (19:4d1f)
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

ObjParams_Skull3: ; 64d34 (19:4d34)
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

ObjParams_Skull4: ; 64d49 (19:4d49)
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

ObjParams_JamanoHat: ; 64d5e (19:4d5e)
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

ObjParams_MagicSpiralLeft: ; 64d73 (19:4d73)
	db  12 ; y
	db -12 ; x
	dn $5, $e ; unk7
	db OBJ_INTERACTION_4B ; interaction type
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

ObjParams_MagicSpiralRight: ; 64d88 (19:4d88)
	db 12 ; y
	db 11 ; x
	dn $5, $e ; unk7
	db OBJ_INTERACTION_4B ; interaction type
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

ObjParams_IgaguriLeft: ; 64d9d (19:4d9d)
	db  21 ; y
	db -12 ; x
	dn $5, $f ; unk7
	db OBJ_INTERACTION_37 ; interaction type
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

ObjParams_IgaguriRight: ; 64db2 (19:4db2)
	db 21 ; y
	db 11 ; x
	dn $5, $f ; unk7
	db OBJ_INTERACTION_37 ; interaction type
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

ObjParams_HiddenFigureFace: ; 64dc7 (19:4dc7)
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

ObjParams_HiddenFigureLeftHand: ; 64ddc (19:4ddc)
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

ObjParams_HiddenFigureRightHand: ; 64df1 (19:4df1)
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

ObjParams_Omodon2: ; 64e06 (19:4e06)
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

ObjParams_Omodon1: ; 64e1b (19:4e1b)
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

ObjParams_DollBoyUnkObjLeft: ; 64e30 (19:4e30)
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

ObjParams_DollBoyUnkObjRight: ; 64e45 (19:4e45)
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

ObjParams_Coin: ; 64e5a (19:4e5a)
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

ObjParams_ColourCoin: ; 64e6d (19:4e6d)
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

ObjParams_TorchEmberLeft1: ; 64e80 (19:4e80)
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

ObjParams_TorchEmberRight1: ; 64e93 (19:4e93)
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

ObjParams_TorchEmberLeft2: ; 64ea6 (19:4ea6)
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

ObjParams_TorchEmberRight2: ; 64eb9 (19:4eb9)
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

ObjParams_ElectricLampSpark: ; 64ecc (19:4ecc)
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
; 0x64edf

ObjParams_Bubble: ; 64edf (19:4edf)
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
; 0x64ef2

ObjParams_FallingSnow: ; 64ef2 (19:4ef2)
	dn $2, $a ; unk7
	db OBJ_INTERACTION_2D ; interaction type
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

ObjParams_StarsAbove: ; 64f05 (19:4f05)
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

ObjParams_YellowBellyHead: ; 64f18 (19:4f18)
	dn $4, $c ; unk7
	db OBJ_INTERACTION_37 ; interaction type
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

ObjParams_Pump: ; 64f2b (19:4f2b)
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

ObjParams_Cheese: ; 64f3e (19:4f3e)
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

ObjParams_ScrowlerTentacleRight: ; 64f51 (19:4f51)
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

ObjParams_ScrowlerTentacleLeft: ; 64f64 (19:4f64)
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

ObjParams_MuddeeStinger1: ; 64f77 (19:4f77)
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

ObjParams_MuddeeStinger2: ; 64f8a (19:4f8a)
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

ObjParams_Kuri: ; 64f9d (19:4f9d)
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

ObjParams_StarsCentre: ; 64fb0 (19:4fb0)
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

Data_64fc3: ; 64fc3 (19:4fc3)
	dw GreyChestData
	dw GreyKeyData
	dw MusicaCoinData

	rgb  0, 22, 16
	rgb 28, 28, 28
	rgb 15, 15, 15
	rgb  0,  0,  0

Data_64fd1: ; 64fd1 (19:4fd1)
	dw RedChestData
	dw RedKeyData
	dw MusicaCoinData

	rgb  0, 22, 16
	rgb 31, 24, 24
	rgb 23,  0,  0
	rgb  7,  0,  0

Data_64fdf: ; 64fdf (19:4fdf)
	dw GreenChestData
	dw GreenKeyData
	dw MusicaCoinData

	rgb  0, 22, 16
	rgb 24, 31, 21
	rgb  0, 16,  0
	rgb  0,  2,  0

Data_64fed: ; 64fed (19:4fed)
	dw BlueChestData
	dw BlueKeyData
	dw MusicaCoinData

	rgb  0, 22, 16
	rgb 19, 31, 31
	rgb  0, 12, 31
	rgb  0,  0,  7

Data_64ffb: ; 64ffb (19:4ffb)
	dw GreyChestData
	dw GreyKeyData
	dw MusicaCoinData

	rgb 31, 31, 31
	rgb  0, 27, 31
	rgb 31,  0, 12
	rgb  5,  0,  0
; 0x65009

EnemyGroups: ; 65009 (19:5009)
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
; 0x65251

EnemyGroupGfx0: ; 65251 (19:5251)
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw NULL

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx1: ; 6527c (19:527c)
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

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 31, 31, 20
	rgb  0, 20, 31
	rgb  2,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 15
	rgb 10, 17, 31
	rgb  0,  0,  0

EnemyGroupGfx2: ; 652af (19:52af)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31, 10, 10
	rgb  5,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb 10,  0,  0

EnemyGroupGfx3: ; 652e2 (19:52e2)
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

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 31, 31, 20
	rgb  0, 20, 31
	rgb  2,  0,  0

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx4: ; 65315 (19:5315)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  0, 25,  0
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  8,  8
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx5: ; 65348 (19:5348)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  0, 25,  0
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  8,  8
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx6: ; 6537b (19:537b)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 20
	rgb 31, 11,  0
	rgb  0,  0, 10

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx7: ; 653b0 (19:53b0)
	db $00

	dw MizuuoGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw MizuuoData
	dw NULL

	rgb  0, 20,  0
	rgb 30, 30, 30
	rgb  3, 27, 31
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx8: ; 653dd (19:53dd)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 20
	rgb 31, 11,  0
	rgb  0,  0, 10

	rgb 31, 18, 18
	rgb 31, 31,  0
	rgb  0, 30,  0
	rgb  0,  5,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx9: ; 65412 (19:5412)
	db $00

	dw MizuuoGfx
	dw WebberGfx
	dw BigLeafGfx
	dw TorchGfx

	dw MizuuoData
	dw DummyObjectData
	dw BigLeafSpawnerData
	dw NULL

	rgb  0, 20,  0
	rgb 30, 30, 30
	rgb  3, 27, 31
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 18, 18
	rgb 31, 31,  0
	rgb  0, 30,  0
	rgb  0,  5,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx10: ; 65443 (19:5443)
	db $00

	dw SilkyGfx
	dw BirdGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw SilkyData
	dw OrangeBirdData
	dw DoughnuteerData
	dw NULL

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 24
	rgb 31, 10,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx11: ; 65474 (19:5474)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx12: ; 654a7 (19:54a7)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx13: ; 654da (19:54da)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 20,  1
	rgb 31, 31, 23
	rgb 15,  5,  5
	rgb  0,  0, 13

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31, 10, 10
	rgb  5,  0,  0

	rgb 31, 31, 31
	rgb  0, 15,  0
	rgb 10, 31, 10
	rgb  0,  5,  0

EnemyGroupGfx14: ; 6550d (19:550d)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31, 10, 10
	rgb  5,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb 10,  0,  0

EnemyGroupGfx15: ; 65540 (19:5540)
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

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx16: ; 65573 (19:5573)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 17,  0
	rgb  3,  3, 13

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31, 10, 10
	rgb  5,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31,  2,  2
	rgb  0,  0,  3

EnemyGroupGfx17: ; 655a8 (19:55a8)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31, 31, 30
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

EnemyGroupGfx18: ; 655db (19:55db)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 17,  0
	rgb  3,  3, 13

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb  0,  0,  0

EnemyGroupGfx19: ; 65610 (19:5610)
	db $00

	dw Sun1Gfx
	dw Sun2Gfx
	dw ClearGate2Gfx
	dw TorchGfx

	dw SunData
	dw DummyObjectData
	dw ClearGate2Data
	dw NULL

	rgb  0, 20,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31,  0, 10
	rgb 31, 24, 17
	rgb  0,  0,  5

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx20: ; 65641 (19:5641)
	db $00

	dw Moon1Gfx
	dw Moon2Gfx
	dw ClearGate2Gfx
	dw TorchGfx

	dw MoonData
	dw DummyObjectData
	dw ClearGate2Data
	dw NULL

	rgb  0, 20,  0
	rgb  0, 28, 31
	rgb 31, 25,  0
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31, 31,  0
	rgb 31, 31, 31
	rgb  0,  0,  3

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx21: ; 65672 (19:5672)
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

	rgb 31, 31, 31
	rgb 22, 31,  5
	rgb 31, 10, 31
	rgb  0,  5,  0

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb 10,  0,  0

EnemyGroupGfx22: ; 656a5 (19:56a5)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 27, 20, 10
	rgb 18, 13,  7
	rgb  8,  6,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx23: ; 656d8 (19:56d8)
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw NULL

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx24: ; 65705 (19:5705)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 11, 15, 31
	rgb  0,  4, 11

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx25: ; 65738 (19:5738)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb 23, 16, 31
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 23, 30, 31
	rgb  8, 16, 31
	rgb  0,  0, 10

EnemyGroupGfx26: ; 6576b (19:576b)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  8,  8, 31
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx27: ; 657a0 (19:57a0)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  8,  8, 31
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx28: ; 657d5 (19:57d5)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  8,  8, 31
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx29: ; 6580a (19:580a)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  8,  8, 31
	rgb  3,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx30: ; 6583d (19:583d)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 25, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

EnemyGroupGfx31: ; 65872 (19:5872)
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

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 15
	rgb 10, 17, 31
	rgb  0,  0,  0

EnemyGroupGfx32: ; 658a5 (19:58a5)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb  0,  0,  0

EnemyGroupGfx33: ; 658d8 (19:58d8)
	db $00

	dw RoboMouse1Gfx
	dw RoboMouse2Gfx
	dw SpearBotGfx
	dw TorchGfx

	dw RoboMouseData
	dw DummyObjectData
	dw SpearBotData
	dw NULL

	rgb 25, 25, 25
	rgb 31, 31,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 20, 31, 31
	rgb 11, 12, 31
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx34: ; 65909 (19:5909)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 20,  0
	rgb 31, 31, 22
	rgb  0, 18, 31
	rgb  5,  0,  0

EnemyGroupGfx35: ; 6593c (19:593c)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx36: ; 6596f (19:596f)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb  0, 20,  1
	rgb 31, 31, 23
	rgb 15,  5,  5
	rgb  0,  0, 13

	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 11, 15, 31
	rgb  0,  4, 11

	rgb  0, 25,  0
	rgb 25, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

EnemyGroupGfx37: ; 659a4 (19:59a4)
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

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 25, 10, 27
	rgb  7,  3,  0

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  0, 25,  0
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  8,  8
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx38: ; 659d7 (19:59d7)
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

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 25, 10, 27
	rgb  7,  3,  0

	rgb  0, 20,  0
	rgb 31, 31, 30
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx39: ; 65a0a (19:5a0a)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 15
	rgb 10, 17, 31
	rgb  0,  0,  0

EnemyGroupGfx40: ; 65a45 (19:5a45)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx41: ; 65a78 (19:5a78)
	db $04

	dw Anonster1Gfx
	dw Anonster2Gfx
	dw Anonster3Gfx
	dw Anonster4Gfx

	dw AnonsterData
	dw SilkPlatformsData
	dw NULL

	rgb  0, 20, 12
	rgb 31,  7, 31
	rgb  5,  2,  0
	rgb 31, 31, 31

	rgb  0, 20, 12
	rgb 31, 31, 31
	rgb 12, 12, 31
	rgb  1,  0,  0

	rgb  0, 20, 12
	rgb 31, 31,  0
	rgb 31,  1,  0
	rgb  1,  0,  0

	rgb  0, 20, 12
	rgb  0, 31, 31
	rgb  0,  4, 23
	rgb  1,  0,  0

EnemyGroupGfx42: ; 65aa7 (19:5aa7)
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

	rgb  0, 25,  0
	rgb 29, 29, 29
	rgb 17, 17, 17
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 15
	rgb 31,  5,  0
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb 10,  0,  0

EnemyGroupGfx43: ; 65adc (19:5adc)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb 23, 16, 31
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx44: ; 65b0f (19:5b0f)
	db $00

	dw SpearheadGfx
	dw HammerBotGfx
	dw ZombieGfx
	dw TorchGfx

	dw DummyObjectData
	dw HammerBotData
	dw ZombieData
	dw NULL

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx45: ; 65b40 (19:5b40)
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

	rgb  0, 25,  1
	rgb 31, 31, 25
	rgb 31,  5,  5
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  0,  0
	rgb 31,  5,  5
	rgb 31, 31, 25

	rgb  0, 25,  1
	rgb 22, 31, 31
	rgb  0, 19, 31
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  3, 20
	rgb  0, 19, 31
	rgb  0,  0,  0

EnemyGroupGfx46: ; 65b75 (19:5b75)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 17,  0
	rgb  3,  3, 13

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx47: ; 65baa (19:5baa)
	db $04

	dw Wormwould1Gfx
	dw Wormwould2Gfx
	dw Wormwould3Gfx
	dw Wormwould4Gfx

	dw WormwouldData
	dw PalmTreeSpawnerData
	dw NULL

	rgb 25, 25, 25
	rgb 31, 21, 18
	rgb 31,  0,  4
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 29, 31, 29
	rgb 31,  2,  5
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  7, 31, 15
	rgb 31, 31,  1
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 26, 12,  3
	rgb 16,  3,  0
	rgb  0,  0,  0

EnemyGroupGfx48: ; 65bd9 (19:5bd9)
	db $00

	dw OwlGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw TorchGfx

	dw OwlData
	dw ParaGoomData
	dw NULL

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 25, 10, 27
	rgb  7,  3,  0

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx49: ; 65c08 (19:5c08)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  2, 19, 12
	rgb 15,  4, 11
	rgb  9,  0,  3
	rgb  0,  0,  0

	rgb  2, 19, 12
	rgb 25,  6,  4
	rgb 12,  0,  0
	rgb  0,  0,  0

EnemyGroupGfx50: ; 65c3f (19:5c3f)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx51: ; 65c72 (19:5c72)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx52: ; 65ca5 (19:5ca5)
	db $04

	dw YellowBelly1Gfx
	dw YellowBelly2Gfx
	dw YellowBelly3Gfx
	dw YellowBelly4Gfx

	dw YellowBellyBodyData
	dw YellowBellyPlatformData
	dw NULL

	rgb  0, 25,  1
	rgb  3,  0,  0
	rgb  3,  0,  0
	rgb  3,  0,  0

	rgb  0, 25,  1
	rgb  3,  0,  0
	rgb  3,  0,  0
	rgb  3,  0,  0

	rgb  0, 25,  1
	rgb  3,  0,  0
	rgb  3,  0,  0
	rgb  3,  0,  0

	rgb  0, 25,  1
	rgb  0,  0,  0
	rgb 31,  5,  5
	rgb 31, 31, 31

EnemyGroupGfx53: ; 65cd4 (19:5cd4)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb 23, 16, 31
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 23, 30, 31
	rgb  8, 16, 31
	rgb  0,  0, 10

EnemyGroupGfx54: ; 65d07 (19:5d07)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx55: ; 65d3a (19:5d3a)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx56: ; 65d6d (19:5d6d)
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

	rgb 31, 31, 31
	rgb 29, 30,  0
	rgb  1, 16,  6
	rgb  0,  0,  0

	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 28, 10,  0
	rgb  0,  0,  0

	rgb 10, 10, 10
	rgb 29, 30,  0
	rgb 28, 10,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 22,  5
	rgb 31,  6, 11
	rgb  0,  0,  0

EnemyGroupGfx57: ; 65da2 (19:5da2)
	db $00

	dw StoveGfx
	dw WebberGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw StoveData
	dw DummyObjectData
	dw DoughnuteerData
	dw NULL

	rgb  0, 25,  0
	rgb 29, 29, 29
	rgb 17, 17, 17
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx58: ; 65dd3 (19:5dd3)
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

	rgb  0, 25,  0
	rgb 29, 29, 29
	rgb 17, 17, 17
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx59: ; 65e06 (19:5e06)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 24
	rgb 31, 10,  0
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 25, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

EnemyGroupGfx60: ; 65e3b (19:5e3b)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 28
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx61: ; 65e6e (19:5e6e)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb 23, 16, 31
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 23, 30, 31
	rgb  8, 16, 31
	rgb  0,  0, 10

EnemyGroupGfx62: ; 65ea1 (19:5ea1)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 20,  0
	rgb 31, 31, 30
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 30, 30, 30
	rgb 31, 31,  0
	rgb  0,  0,  3

EnemyGroupGfx63: ; 65ed6 (19:5ed6)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31, 31, 30
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 15
	rgb 10, 17, 31
	rgb  0,  0,  0

EnemyGroupGfx64: ; 65f09 (19:5f09)
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

	rgb  0, 20,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31,  0, 10
	rgb 31, 24, 17
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx65: ; 65f3c (19:5f3c)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 24
	rgb 31, 10,  0
	rgb  0,  0,  5

	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 11, 15, 31
	rgb  0,  4, 11

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx66: ; 65f6f (19:5f6f)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 31, 30
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  9, 16,  8
	rgb 31, 31,  0
	rgb 20,  0, 19
	rgb  8,  0,  5

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx67: ; 65fa2 (19:5fa2)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31,  0,  0
	rgb  7,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx68: ; 65fd5 (19:5fd5)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb 23, 16, 31
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 25, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

EnemyGroupGfx69: ; 6600a (19:600a)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb  9, 16,  8
	rgb 31, 31,  0
	rgb 20,  0, 19
	rgb  8,  0,  5

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx70: ; 6603d (19:603d)
	db $04

	dw Scowler1Gfx
	dw Scowler2Gfx
	dw Scowler3Gfx
	dw Scowler4Gfx

	dw ScowlerData
	dw FloatingRingSpawnerData
	dw NULL

	rgb  0, 20,  0
	rgb 31, 31, 31
	rgb 31,  1,  1
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 27,  0
	rgb  0, 17, 31
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 27,  0
	rgb 29,  1, 29
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 31, 20
	rgb  0, 28,  0
	rgb  0,  0,  0

EnemyGroupGfx71: ; 6606c (19:606c)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 20,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx72: ; 6609f (19:609f)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 11, 15, 31
	rgb  0,  4, 11

	rgb  0, 22, 16
	rgb 31, 31, 28
	rgb 31,  3,  3
	rgb  0,  0,  3

EnemyGroupGfx73: ; 660d2 (19:60d2)
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

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31, 17,  0
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 11, 15, 31
	rgb  0,  4, 11

	rgb  0, 22, 16
	rgb 31, 31, 28
	rgb 31,  3,  3
	rgb  0,  0,  3

EnemyGroupGfx74: ; 66105 (19:6105)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 13, 13, 31
	rgb  2,  1, 18
	rgb  0,  0,  2

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx75: ; 66138 (19:6138)
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

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 25, 10, 27
	rgb  7,  3,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 30, 30, 30
	rgb 31, 31,  0
	rgb  0,  0,  3

EnemyGroupGfx76: ; 6616d (19:616d)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 22, 27, 31
	rgb  0, 13, 20
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx77: ; 661a0 (19:61a0)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 15, 15, 15
	rgb 31, 31, 31
	rgb  0, 19, 31
	rgb  0,  0,  0

EnemyGroupGfx78: ; 661d3 (19:61d3)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx79: ; 66206 (19:6206)
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

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx80: ; 66239 (19:6239)
	db $00

	dw StoveGfx
	dw HammerBotGfx
	dw FutamoguGfx
	dw TorchGfx

	dw StoveData
	dw HammerBotData
	dw NULL

	rgb  0, 25,  0
	rgb 29, 29, 29
	rgb 17, 17, 17
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx81: ; 66268 (19:6268)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31,  0,  0
	rgb  7,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx82: ; 6629b (19:629b)
	db $04

	dw Jamano1Gfx
	dw Jamano2Gfx
	dw Jamano3Gfx
	dw Jamano4Gfx

	dw JamanoData
	dw SkullSpawnerData
	dw HatPlatformData
	dw NULL

	rgb 28, 28, 28
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 31, 31
	rgb  3, 16,  3
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 10, 10, 10
	rgb 21, 21, 21
	rgb  0,  0,  0

EnemyGroupGfx83: ; 662cc (19:62cc)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  0, 25,  0
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  8,  8
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx84: ; 662ff (19:62ff)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx85: ; 66332 (19:6332)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx86: ; 66365 (19:6365)
	db $04

	dw Muddee1Gfx
	dw Muddee2Gfx
	dw Muddee3Gfx
	dw Muddee4Gfx

	dw MuddeeData
	dw Turtle1Data
	dw Turtle2Data
	dw NULL

	rgb 28, 28, 28
	rgb 26, 16,  4
	rgb 18,  7,  0
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 14, 14
	rgb 31, 31, 31
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31,  7,  6
	rgb 10, 10, 10
	rgb 10, 10, 10

	rgb 28, 28, 28
	rgb 31, 31, 31
	rgb 31, 20, 20
	rgb  0,  0,  0

EnemyGroupGfx87: ; 66396 (19:6396)
	db $04

	dw Wolfenboss1Gfx
	dw Wolfenboss2Gfx
	dw Wolfenboss3Gfx
	dw Wolfenboss4Gfx

	dw WolfenbossData
	dw WolfenbossPlatformData
	dw NULL

	rgb 28, 28, 28
	rgb 31, 26,  0
	rgb 17,  8, 17
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 26,  0
	rgb  0, 31,  0
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb  0, 16, 31

	rgb 28, 28, 28
	rgb 31, 31,  0
	rgb 31,  4,  0
	rgb  0,  0,  0

EnemyGroupGfx88: ; 663c5 (19:63c5)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 20
	rgb  0, 20, 31
	rgb  2,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx89: ; 663f8 (19:63f8)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 31,  8,  8
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx90: ; 6642b (19:642b)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 24
	rgb 31, 10,  0
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 25, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

EnemyGroupGfx91: ; 66460 (19:6460)
	db $00

	dw SpearheadGfx
	dw BirdGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw BlueBirdData
	dw NULL

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx92: ; 6648f (19:648f)
	db $00

	dw SilkyGfx
	dw BirdGfx
	dw DoughnuteerGfx
	dw TorchGfx

	dw SilkyData
	dw BlueBirdData
	dw DoughnuteerData
	dw NULL

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx93: ; 664c0 (19:64c0)
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

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx94: ; 664f3 (19:64f3)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx95: ; 66526 (19:6526)
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

	rgb 28, 28, 28
	rgb 31, 31, 31
	rgb 26,  0, 30
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 31,  0
	rgb 26,  0, 30
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 22, 16
	rgb  3, 21, 16
	rgb  0,  0,  0

	rgb 28, 28, 28
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb  0,  0,  0

EnemyGroupGfx96: ; 6655b (19:655b)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 27
	rgb 31,  0,  0
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 30, 30, 30
	rgb 31, 31,  0
	rgb  0,  0,  3

EnemyGroupGfx97: ; 66590 (19:6590)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 31, 17,  0
	rgb  3,  3, 13

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 28
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx98: ; 665c5 (19:65c5)
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

	rgb 31, 31, 31
	rgb 29, 29, 23
	rgb  5, 20,  5
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx99: ; 665f8 (19:65f8)
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw FutamoguGfx
	dw TorchGfx

	dw SpearheadData
	dw WebberData
	dw NULL

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0, 20,  1
	rgb 31, 31, 23
	rgb 15,  5,  5
	rgb  0,  0, 13

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx100: ; 66627 (19:6627)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx101: ; 6665a (19:665a)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 30, 30, 30
	rgb 31, 31,  0
	rgb  0,  0,  3

EnemyGroupGfx102: ; 6668f (19:668f)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb 31, 31, 31
	rgb 31, 25,  0
	rgb  0, 31, 25
	rgb  0,  0,  0

	rgb 31, 31, 27
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

EnemyGroupGfx103: ; 666c2 (19:66c2)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 22, 27, 31
	rgb  0, 13, 20
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 31, 22
	rgb  0, 18, 31
	rgb  5,  0,  0

EnemyGroupGfx104: ; 666f5 (19:66f5)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  5, 25, 31
	rgb  3,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx105: ; 66728 (19:6728)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 15
	rgb 10, 17, 31
	rgb  0,  0,  0

EnemyGroupGfx106: ; 6675b (19:675b)
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

	rgb  0, 20,  0
	rgb  0, 28, 31
	rgb 31, 25,  0
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31, 31,  0
	rgb 31, 31, 31
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx107: ; 6678e (19:678e)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb  3, 31, 30
	rgb  3,  0,  0

EnemyGroupGfx108: ; 667c1 (19:67c1)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

	rgb  0, 20,  0
	rgb 31, 31, 22
	rgb  0, 18, 31
	rgb  5,  0,  0

EnemyGroupGfx109: ; 667f4 (19:67f4)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 27, 27
	rgb  0, 28,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 25
	rgb  5, 17, 31
	rgb  3,  0,  0

EnemyGroupGfx110: ; 66827 (19:6827)
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

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx111: ; 6685a (19:685a)
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

	rgb 31, 31, 31
	rgb 26, 31, 28
	rgb  1, 17,  0
	rgb  0,  0,  5

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31, 15
	rgb 31,  5,  5
	rgb  0,  0,  0

EnemyGroupGfx112: ; 6688d (19:688d)
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

	rgb  0, 25,  0
	rgb 31, 31, 31
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb  0, 20,  0
	rgb 31, 31, 30
	rgb 31,  0,  0
	rgb  0,  0,  3

	rgb  9, 16,  8
	rgb 31, 31,  0
	rgb 20,  0, 19
	rgb  8,  0,  5

	rgb  0, 25,  0
	rgb 31, 31,  0
	rgb 25,  0,  0
	rgb  0,  0,  5

EnemyGroupGfx113: ; 668c0 (19:68c0)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 22, 27, 31
	rgb  0, 13, 20
	rgb  0,  0,  0

	rgb  0, 25,  0
	rgb 31, 31, 10
	rgb 31,  0,  0
	rgb 10,  0,  0

EnemyGroupGfx114: ; 668f3 (19:68f3)
	db $00

	dw StoveGfx
	dw WebberGfx
	dw HebariiGfx
	dw TorchGfx

	dw StoveData
	dw DummyObjectData
	dw HebariiData
	dw NULL

	rgb  0, 25,  0
	rgb 29, 29, 29
	rgb 17, 17, 17
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx115: ; 66924 (19:6924)
	db $00

	dw SpearheadGfx
	dw WebberGfx
	dw HebariiGfx
	dw TorchGfx

	dw SpearheadData
	dw DummyObjectData
	dw HebariiData
	dw NULL

	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 30, 30, 30
	rgb 27,  5, 27
	rgb  0,  0,  5

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

EnemyGroupGfx116: ; 66955 (19:6955)
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

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0, 25,  0
	rgb 31, 31, 27
	rgb 31,  2,  2
	rgb  0,  0,  3

EnemyGroupGfx117: ; 66988 (19:6988)
	db $00

	dw SpearheadGfx
	dw ParaGoomGfx
	dw FutamoguGfx
	dw TorchGfx

	dw DummyObjectData
	dw ParaGoomData
	dw NULL

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15

	rgb  0,  0,  0
	rgb 31,  0,  0
	rgb  0, 31,  0
	rgb  0,  0, 15
; 0x669b7
