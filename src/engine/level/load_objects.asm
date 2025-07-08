LoadObjectGroupData::
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

	ld a, [wObjectGroup]
	cp OBJECT_GROUP_HIDDEN_FIGURE
	jp z, LoadHiddenFigureData

	ld d, $00
	ld e, a
	sla e
	rl d
	sla e
	rl d ; *4
	ld hl, ObjectGroups
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
	ld a, BANK("VRAM1")
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
	ld bc, v1Tiles0 tile $40
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
	ld bc, v1Tiles1 tile $40
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

; input:
; - de = block
; - c = entry in wObjDataPointers
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
CreateObject_GotPos:
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

INCLUDE "data/object_data.asm"
INCLUDE "data/object_params.asm"

CommonObjects_Grey:
	dw GreyChestData
	dw GreyKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 28, 28, 28
	rgb 15, 15, 15
	rgb  0,  0,  0

CommonObjects_Red:
	dw RedChestData
	dw RedKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 31, 24, 24
	rgb 23,  0,  0
	rgb  7,  0,  0

CommonObjects_Green:
	dw GreenChestData
	dw GreenKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 24, 31, 21
	rgb  0, 16,  0
	rgb  0,  2,  0

CommonObjects_Blue:
	dw BlueChestData
	dw BlueKeyData
	dw MusicalCoinData

	rgb  0, 22, 16
	rgb 19, 31, 31
	rgb  0, 12, 31
	rgb  0,  0,  7

CommonObjects_Special:
	dw GreyChestData
	dw GreyKeyData
	dw MusicalCoinData

	rgb 31, 31, 31
	rgb  0, 27, 31
	rgb 31,  0, 12
	rgb  5,  0,  0

ObjectGroups:
	table_width 4
	dw CommonObjects_Grey,    ObjectGroup0   ; OBJECT_GROUP_000
	dw CommonObjects_Green,   ObjectGroup2   ; OBJECT_GROUP_001
	dw CommonObjects_Red,     ObjectGroup3   ; OBJECT_GROUP_002
	dw CommonObjects_Green,   ObjectGroup6   ; OBJECT_GROUP_003
	dw CommonObjects_Green,   ObjectGroup7   ; OBJECT_GROUP_004
	dw CommonObjects_Green,   ObjectGroup8   ; OBJECT_GROUP_005
	dw CommonObjects_Green,   ObjectGroup9   ; OBJECT_GROUP_006
	dw CommonObjects_Blue,    ObjectGroup10  ; OBJECT_GROUP_007
	dw CommonObjects_Grey,    ObjectGroup11  ; OBJECT_GROUP_008
	dw CommonObjects_Grey,    ObjectGroup13  ; OBJECT_GROUP_009
	dw CommonObjects_Grey,    ObjectGroup14  ; OBJECT_GROUP_010
	dw CommonObjects_Grey,    ObjectGroup15  ; OBJECT_GROUP_011
	dw CommonObjects_Grey,    ObjectGroup16  ; OBJECT_GROUP_012
	dw CommonObjects_Red,     ObjectGroup11  ; OBJECT_GROUP_013
	dw CommonObjects_Red,     ObjectGroup17  ; OBJECT_GROUP_014
	dw CommonObjects_Green,   ObjectGroup18  ; OBJECT_GROUP_015
	dw CommonObjects_Grey,    ObjectGroup1   ; OBJECT_GROUP_016
	dw CommonObjects_Grey,    ObjectGroup12  ; OBJECT_GROUP_017
	dw CommonObjects_Grey,    ObjectGroup21  ; OBJECT_GROUP_018
	dw CommonObjects_Grey,    ObjectGroup4   ; OBJECT_GROUP_019
	dw CommonObjects_Grey,    ObjectGroup3   ; OBJECT_GROUP_020
	dw CommonObjects_Green,   ObjectGroup19  ; OBJECT_GROUP_021
	dw CommonObjects_Green,   ObjectGroup3   ; OBJECT_GROUP_022
	dw CommonObjects_Grey,    ObjectGroup22  ; OBJECT_GROUP_023
	dw CommonObjects_Blue,    ObjectGroup24  ; OBJECT_GROUP_024
	dw CommonObjects_Blue,    ObjectGroup25  ; OBJECT_GROUP_025
	dw CommonObjects_Green,   ObjectGroup25  ; OBJECT_GROUP_026
	dw CommonObjects_Red,     ObjectGroup26  ; OBJECT_GROUP_027
	dw CommonObjects_Blue,    ObjectGroup33  ; OBJECT_GROUP_028
	dw CommonObjects_Green,   ObjectGroup34  ; OBJECT_GROUP_029
	dw CommonObjects_Grey,    ObjectGroup35  ; OBJECT_GROUP_030
	dw CommonObjects_Grey,    ObjectGroup37  ; OBJECT_GROUP_031
	dw CommonObjects_Grey,    ObjectGroup38  ; OBJECT_GROUP_032
	dw CommonObjects_Grey,    ObjectGroup39  ; OBJECT_GROUP_033
	dw CommonObjects_Red,     ObjectGroup33  ; OBJECT_GROUP_034
	dw CommonObjects_Green,   ObjectGroup40  ; OBJECT_GROUP_035
	dw CommonObjects_Blue,    ObjectGroup41  ; OBJECT_GROUP_036
	dw CommonObjects_Red,     ObjectGroup42  ; OBJECT_GROUP_037
	dw CommonObjects_Grey,    ObjectGroup42  ; OBJECT_GROUP_038
	dw CommonObjects_Grey,    ObjectGroup2   ; OBJECT_GROUP_039
	dw CommonObjects_Blue,    ObjectGroup40  ; OBJECT_GROUP_040
	dw CommonObjects_Red,     ObjectGroup43  ; OBJECT_GROUP_041
	dw CommonObjects_Green,   ObjectGroup44  ; OBJECT_GROUP_042
	dw CommonObjects_Blue,    ObjectGroup44  ; OBJECT_GROUP_043
	dw CommonObjects_Grey,    ObjectGroup45  ; OBJECT_GROUP_044
	dw CommonObjects_Green,   ObjectGroup24  ; OBJECT_GROUP_045
	dw CommonObjects_Blue,    ObjectGroup35  ; OBJECT_GROUP_046
	dw CommonObjects_Red,     ObjectGroup15  ; OBJECT_GROUP_047
	dw CommonObjects_Blue,    ObjectGroup46  ; OBJECT_GROUP_048
	dw CommonObjects_Grey,    ObjectGroup47  ; OBJECT_GROUP_049
	dw CommonObjects_Red,     ObjectGroup34  ; OBJECT_GROUP_050
	dw CommonObjects_Blue,    ObjectGroup48  ; OBJECT_GROUP_051
	dw CommonObjects_Grey,    ObjectGroup49  ; OBJECT_GROUP_052
	dw CommonObjects_Grey,    ObjectGroup50  ; OBJECT_GROUP_053
	dw CommonObjects_Grey,    ObjectGroup51  ; OBJECT_GROUP_054
	dw CommonObjects_Blue,    ObjectGroup52  ; OBJECT_GROUP_055
	dw CommonObjects_Green,   ObjectGroup20  ; OBJECT_GROUP_056
	dw CommonObjects_Green,   ObjectGroup53  ; OBJECT_GROUP_057
	dw CommonObjects_Red,     ObjectGroup54  ; OBJECT_GROUP_058
	dw CommonObjects_Grey,    ObjectGroup30  ; OBJECT_GROUP_059
	dw CommonObjects_Green,   ObjectGroup31  ; OBJECT_GROUP_060
	dw CommonObjects_Grey,    ObjectGroup23  ; OBJECT_GROUP_061
	dw CommonObjects_Blue,    ObjectGroup36  ; OBJECT_GROUP_062
	dw CommonObjects_Blue,    ObjectGroup29  ; OBJECT_GROUP_063
	dw CommonObjects_Red,     ObjectGroup32  ; OBJECT_GROUP_064
	dw CommonObjects_Red,     ObjectGroup27  ; OBJECT_GROUP_065
	dw CommonObjects_Red,     ObjectGroup27  ; OBJECT_GROUP_066
	dw CommonObjects_Red,     ObjectGroup28  ; OBJECT_GROUP_067
	dw CommonObjects_Grey,    ObjectGroup55  ; OBJECT_GROUP_068
	dw CommonObjects_Grey,    ObjectGroup56  ; OBJECT_GROUP_069
	dw CommonObjects_Grey,    ObjectGroup57  ; OBJECT_GROUP_070
	dw CommonObjects_Grey,    ObjectGroup58  ; OBJECT_GROUP_071
	dw CommonObjects_Red,     ObjectGroup59  ; OBJECT_GROUP_072
	dw CommonObjects_Grey,    ObjectGroup60  ; OBJECT_GROUP_073
	dw CommonObjects_Blue,    ObjectGroup61  ; OBJECT_GROUP_074
	dw CommonObjects_Blue,    ObjectGroup17  ; OBJECT_GROUP_075
	dw CommonObjects_Red,     ObjectGroup13  ; OBJECT_GROUP_076
	dw CommonObjects_Grey,    ObjectGroup62  ; OBJECT_GROUP_077
	dw CommonObjects_Blue,    ObjectGroup63  ; OBJECT_GROUP_078
	dw CommonObjects_Green,   ObjectGroup64  ; OBJECT_GROUP_079
	dw CommonObjects_Green,   ObjectGroup65  ; OBJECT_GROUP_080
	dw CommonObjects_Red,     ObjectGroup35  ; OBJECT_GROUP_081
	dw CommonObjects_Grey,    ObjectGroup66  ; OBJECT_GROUP_082
	dw CommonObjects_Red,     ObjectGroup67  ; OBJECT_GROUP_083
	dw CommonObjects_Green,   ObjectGroup68  ; OBJECT_GROUP_084
	dw CommonObjects_Blue,    ObjectGroup69  ; OBJECT_GROUP_085
	dw CommonObjects_Grey,    ObjectGroup70  ; OBJECT_GROUP_086
	dw CommonObjects_Green,   ObjectGroup60  ; OBJECT_GROUP_087
	dw CommonObjects_Grey,    ObjectGroup71  ; OBJECT_GROUP_088
	dw CommonObjects_Blue,    ObjectGroup72  ; OBJECT_GROUP_089
	dw CommonObjects_Blue,    ObjectGroup73  ; OBJECT_GROUP_090
	dw CommonObjects_Green,   ObjectGroup4   ; OBJECT_GROUP_091
	dw CommonObjects_Blue,    ObjectGroup14  ; OBJECT_GROUP_092
	dw CommonObjects_Red,     ObjectGroup24  ; OBJECT_GROUP_093
	dw CommonObjects_Grey,    ObjectGroup74  ; OBJECT_GROUP_094
	dw CommonObjects_Green,   ObjectGroup75  ; OBJECT_GROUP_095
	dw CommonObjects_Grey,    ObjectGroup76  ; OBJECT_GROUP_096
	dw CommonObjects_Blue,    ObjectGroup77  ; OBJECT_GROUP_097
	dw CommonObjects_Blue,    ObjectGroup78  ; OBJECT_GROUP_098
	dw CommonObjects_Blue,    ObjectGroup79  ; OBJECT_GROUP_099
	dw CommonObjects_Blue,    ObjectGroup80  ; OBJECT_GROUP_100
	dw CommonObjects_Grey,    ObjectGroup81  ; OBJECT_GROUP_101
	dw CommonObjects_Green,   ObjectGroup82  ; OBJECT_GROUP_102
	dw CommonObjects_Blue,    ObjectGroup3   ; OBJECT_GROUP_103
	dw CommonObjects_Blue,    ObjectGroup83  ; OBJECT_GROUP_104
	dw CommonObjects_Blue,    ObjectGroup84  ; OBJECT_GROUP_105
	dw CommonObjects_Blue,    ObjectGroup85  ; OBJECT_GROUP_106
	dw CommonObjects_Red,     ObjectGroup86  ; OBJECT_GROUP_107
	dw CommonObjects_Green,   ObjectGroup87  ; OBJECT_GROUP_108
	dw CommonObjects_Green,   ObjectGroup88  ; OBJECT_GROUP_109
	dw CommonObjects_Blue,    ObjectGroup89  ; OBJECT_GROUP_110
	dw CommonObjects_Red,     ObjectGroup95  ; OBJECT_GROUP_111
	dw CommonObjects_Red,     ObjectGroup90  ; OBJECT_GROUP_112
	dw CommonObjects_Grey,    ObjectGroup91  ; OBJECT_GROUP_113
	dw CommonObjects_Blue,    ObjectGroup92  ; OBJECT_GROUP_114
	dw CommonObjects_Blue,    ObjectGroup93  ; OBJECT_GROUP_115
	dw CommonObjects_Grey,    ObjectGroup94  ; OBJECT_GROUP_116
	dw CommonObjects_Green,   ObjectGroup96  ; OBJECT_GROUP_117
	dw CommonObjects_Red,     ObjectGroup91  ; OBJECT_GROUP_118
	dw CommonObjects_Green,   ObjectGroup97  ; OBJECT_GROUP_119
	dw CommonObjects_Red,     ObjectGroup77  ; OBJECT_GROUP_120
	dw CommonObjects_Red,     ObjectGroup98  ; OBJECT_GROUP_121
	dw CommonObjects_Green,   ObjectGroup99  ; OBJECT_GROUP_122
	dw CommonObjects_Green,   ObjectGroup100 ; OBJECT_GROUP_123
	dw CommonObjects_Grey,    ObjectGroup5   ; OBJECT_GROUP_124
	dw CommonObjects_Grey,    ObjectGroup101 ; OBJECT_GROUP_125
	dw CommonObjects_Blue,    ObjectGroup101 ; OBJECT_GROUP_126
	dw CommonObjects_Grey,    ObjectGroup85  ; OBJECT_GROUP_127
	dw CommonObjects_Red,     ObjectGroup105 ; OBJECT_GROUP_128
	dw CommonObjects_Green,   ObjectGroup102 ; OBJECT_GROUP_129
	dw CommonObjects_Grey,    ObjectGroup103 ; OBJECT_GROUP_130
	dw CommonObjects_Blue,    ObjectGroup104 ; OBJECT_GROUP_131
	dw CommonObjects_Green,   ObjectGroup106 ; OBJECT_GROUP_132
	dw CommonObjects_Blue,    ObjectGroup107 ; OBJECT_GROUP_133
	dw CommonObjects_Blue,    ObjectGroup108 ; OBJECT_GROUP_134
	dw CommonObjects_Blue,    ObjectGroup109 ; OBJECT_GROUP_135
	dw CommonObjects_Grey,    ObjectGroup110 ; OBJECT_GROUP_136
	dw CommonObjects_Red,     ObjectGroup111 ; OBJECT_GROUP_137
	dw CommonObjects_Grey,    ObjectGroup112 ; OBJECT_GROUP_138
	dw CommonObjects_Green,   ObjectGroup113 ; OBJECT_GROUP_139
	dw CommonObjects_Grey,    ObjectGroup114 ; OBJECT_GROUP_140
	dw CommonObjects_Grey,    ObjectGroup115 ; OBJECT_GROUP_141
	dw CommonObjects_Red,     ObjectGroup116 ; OBJECT_GROUP_142
	dw CommonObjects_Green,   ObjectGroup43  ; OBJECT_GROUP_143
	dw CommonObjects_Red,     ObjectGroup44  ; OBJECT_GROUP_144
	dw CommonObjects_Special, ObjectGroup117 ; OBJECT_GROUP_145
	assert_table_length NUM_OBJECT_GROUPS

INCLUDE "data/object_groups.asm"
