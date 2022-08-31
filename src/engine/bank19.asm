LoadEnemyGroupData:: ; 64000 (19:4000)
; fills wObjDataPointers with $43c3
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
	cp $f0
	jp z, Func_643a1

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

Func_640e5: ; 640e5 (19:40e5)
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
	ld a, [de]
	rlca
	ret nc
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
	add OBJ_UNK_1A - OBJ_FRAME_DURATION
	ld e, a
	ld a, $21
	ld [de], a ; OBJ_UNK_1A
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

Func_64187: ; 64187 (19:4187)
	ld h, HIGH(wObjects)
FOR n, 0, NUM_OBJECTS
	ld l, LOW(wObjects) + OBJ_STRUCT_LENGTH * n
	ld a, [hl] ; OBJ_FLAGS
	rra
	jr nc, .skip{u:n} ; skip if OBJFLAG_ACTIVE not set
	rla
	rla
	rla
	jr nc, .reload{u:n} ; jump if OBJFLAG_TRANSIENT not set
	xor a
	ld [hl], a
	jr .skip{u:n}
.reload{u:n}
	inc l
	inc l
	farcall Func_baee
.skip{u:n}
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
	ld a, [wCurObjYPos]
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
	ld [de], a ; OBJ_UNK_17
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_UNK_18
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_MOVEMENT_INDEX
	inc e
	ld a, [hli]
	ld [de], a ; OBJ_UNK_1A
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

; loads a pointer to wObjDataPtr01
Func_643a1: ; 643a1 (19:43a1)
	ld hl, .data_643bf
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

.data_643bf
	dw Data_64783
	dw NULL
; 0x643c3

; \1 OAM ptr
; \2 unknown
; \3 interaction type
; \4 collision box top
; \5 update function
; \6 object flags
MACRO object_data
assert (BANK(\1) - BANK("Objects OAM 1")) | (BANK(\5) - BANK("Object Update Functions 1")) == (BANK(\5) - BANK("Object Update Functions 1"))
	dn (BANK(\5) - BANK("Object Update Functions 1")), \2
	db \3, \4
	dw \1
	dw \5
	db \6
ENDM

DummyObjectData:        object_data OAM_18007b, $0, OBJ_INTERACTION_00,                           0, DummyObjectFunc,        $0
GreyChestData:          object_data OAM_18c000, $1, OBJ_INTERACTION_GREY_TREASURE  | HEAVY_OBJ, -24, GreyChestFunc,          $0
RedChestData:           object_data OAM_18c000, $1, OBJ_INTERACTION_RED_TREASURE   | HEAVY_OBJ, -24, RedChestFunc,           $0
GreenChestData:         object_data OAM_18c000, $1, OBJ_INTERACTION_GREEN_TREASURE | HEAVY_OBJ, -24, GreenChestFunc,         $0
BlueChestData:          object_data OAM_18c000, $1, OBJ_INTERACTION_BLUE_TREASURE  | HEAVY_OBJ, -24, BlueChestFunc,          $0
GreyKeyData:            object_data OAM_18c000, $2, OBJ_INTERACTION_GREY_KEY,                   -24, KeyFunc,                $0
RedKeyData:             object_data OAM_18c000, $2, OBJ_INTERACTION_RED_KEY,                    -24, KeyFunc,                $0
GreenKeyData:           object_data OAM_18c000, $2, OBJ_INTERACTION_GREEN_KEY,                  -24, KeyFunc,                $0
BlueKeyData:            object_data OAM_18c000, $2, OBJ_INTERACTION_BLUE_KEY,                   -24, KeyFunc,                $0
MusicaCoinData:         object_data OAM_18c000, $3, OBJ_INTERACTION_MUSICAL_COIN,               -25, MusicalCoinFunc,        $0
SpearheadData:          object_data OAM_18007b, $0, OBJ_INTERACTION_01,                         -14, SpearheadFunc,          OBJFLAG_VRAM1
FutamoguData:           object_data OAM_180564, $1, OBJ_INTERACTION_WALKABLE       | HEAVY_OBJ, -17, FutamoguFunc,           OBJFLAG_VRAM1
WebberData:             object_data OAM_180242, $2, OBJ_INTERACTION_WALKABLE       | HEAVY_OBJ, -16, WebberFunc,             OBJFLAG_VRAM1
TorchData:              object_data OAM_180838, $4, OBJ_INTERACTION_FIRE,                       -16, TorchFunc,              $0
TorchNoEmbersData:      object_data OAM_180838, $6, OBJ_INTERACTION_FIRE,                       -16, TorchNoEmbersFunc,      $0
FlameBlockTorchData:    object_data OAM_180838, $7, OBJ_INTERACTION_UNLIT_TORCH,                -16, FlameBlockTorchFunc,    $0
FlameBlockData:         object_data OAM_1895ec, $b, OBJ_INTERACTION_SOLID,                      -30, FlameBlockFunc,         $0
StoveData:              object_data OAM_1896e1, $c, OBJ_INTERACTION_STOVE          | HEAVY_OBJ, -32, StoveFunc,              $0
UnusedFlowerData:       object_data OAM_180916, $6, OBJ_INTERACTION_01                        ,   0, UnusedFlowerFunc,       $0
CountRichtertoffenData: object_data OAM_1809ff, $7, OBJ_INTERACTION_RICHTERTOFFEN  | HEAVY_OBJ, -18, CountRichtertoffenFunc, OBJFLAG_VRAM1
HebariiData:            object_data OAM_18a703, $0, OBJ_INTERACTION_3D                        , -15, HebariiFunc,            $0

Data_6446b: ; 6446b (19:446b)
	db ($0 << 4) | $9 ; low bank nybble, ??
	db $01, $f4 ; ??, ??
	dw $4b43 ; OAM ptr
	dw Func_41357 ; update function
	db $80 ; ??

Data_64473: ; 64473 (19:4473)
	db ($0 << 4) | $a ; low bank nybble, ??
	db $0b, $f2 ; ??, ??
	dw $4ea7 ; OAM ptr
	dw Func_41a7c ; update function
	db $80 ; ??

Data_6447b: ; 6447b (19:447b)
	db ($0 << 4) | $b ; low bank nybble, ??
	db $01, $e7 ; ??, ??
	dw $536c ; OAM ptr
	dw Func_42170 ; update function
	db $80 ; ??

Data_64483: ; 64483 (19:4483)
	db ($0 << 4) | $c ; low bank nybble, ??
	db $01, $e7 ; ??, ??
	dw $5189 ; OAM ptr
	dw Func_42478 ; update function
	db $80 ; ??

Data_6448b: ; 6448b (19:448b)
	db ($0 << 4) | $c ; low bank nybble, ??
	db $01, $e7 ; ??, ??
	dw $5189 ; OAM ptr
	dw Func_424b1 ; update function
	db $80 ; ??

Data_64493: ; 64493 (19:4493)
	db ($0 << 4) | $c ; low bank nybble, ??
	db $4c, $f3 ; ??, ??
	dw $560c ; OAM ptr
	dw Func_429c4 ; update function
	db $00 ; ??

Data_6449b: ; 6449b (19:449b)
	db ($0 << 4) | $d ; low bank nybble, ??
	db $02, $f4 ; ??, ??
	dw $560c ; OAM ptr
	dw Func_42b7d ; update function
	db $00 ; ??

Data_644a3: ; 644a3 (19:44a3)
	db ($2 << 4) | $4 ; low bank nybble, ??
	db $0a, $f6 ; ??, ??
	dw $4395 ; OAM ptr
	dw $4730 ; update function
	db $00 ; ??

Data_644ab: ; 644ab (19:44ab)
	db ($0 << 4) | $b ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4000 ; OAM ptr
	dw Func_42ba8 ; update function
	db $00 ; ??

Data_644b3: ; 644b3 (19:44b3)
	db ($0 << 4) | $8 ; low bank nybble, ??
	db $0c, $ef ; ??, ??
	dw $5be4 ; OAM ptr
	dw Func_436ea ; update function
	db $00 ; ??

Data_644bb: ; 644bb (19:44bb)
	db ($0 << 4) | $c ; low bank nybble, ??
	db $01, $f8 ; ??, ??
	dw $581e ; OAM ptr
	dw Func_42d1d ; update function
	db $80 ; ??

Data_644c3: ; 644c3 (19:44c3)
	db ($0 << 4) | $f ; low bank nybble, ??
	db $24, $f3 ; ??, ??
	dw $59e3 ; OAM ptr
	dw Func_43278 ; update function
	db $80 ; ??

Data_644cb: ; 644cb (19:44cb)
	db ($0 << 4) | $d ; low bank nybble, ??
	db $02, $f3 ; ??, ??
	dw $59e3 ; OAM ptr
	dw Func_43278 ; update function
	db $80 ; ??

Data_644d3: ; 644d3 (19:44d3)
	db ($2 << 4) | $d ; low bank nybble, ??
	db $8c, $e1 ; ??, ??
	dw $5783 ; OAM ptr
	dw $589e ; update function
	db $00 ; ??

Data_644db: ; 644db (19:44db)
	db ($1 << 4) | $d ; low bank nybble, ??
	db $01, $fa ; ??, ??
	dw $5a1c ; OAM ptr
	dw $79b8 ; update function
	db $00 ; ??

Data_644e3: ; 644e3 (19:44e3)
	db ($0 << 4) | $4 ; low bank nybble, ??
	db $b1, $f1 ; ??, ??
	dw $5b0f ; OAM ptr
	dw Func_43451 ; update function
	db $80 ; ??

Data_644eb: ; 644eb (19:44eb)
	db ($0 << 4) | $5 ; low bank nybble, ??
	db $3b, $f1 ; ??, ??
	dw $5b0f ; OAM ptr
	dw Func_434ba ; update function
	db $00 ; ??

Data_644f3: ; 644f3 (19:44f3)
	db ($2 << 4) | $3 ; low bank nybble, ??
	db $3b, $f1 ; ??, ??
	dw $6b5c ; OAM ptr
	dw $6902 ; update function
	db $00 ; ??

Data_644fb: ; 644fb (19:44fb)
	db ($1 << 4) | $1 ; low bank nybble, ??
	db $be, $f0 ; ??, ??
	dw $4000 ; OAM ptr
	dw $40a1 ; update function
	db $80 ; ??

Data_64503: ; 64503 (19:4503)
	db ($1 << 4) | $1 ; low bank nybble, ??
	db $be, $e6 ; ??, ??
	dw $4000 ; OAM ptr
	dw $4080 ; update function
	db $80 ; ??

Data_6450b: ; 6450b (19:450b)
	db ($1 << 4) | $2 ; low bank nybble, ??
	db $81, $ee ; ??, ??
	dw $422f ; OAM ptr
	dw $423b ; update function
	db $80 ; ??

Data_64513: ; 64513 (19:4513)
	db ($1 << 4) | $0 ; low bank nybble, ??
	db $01, $ec ; ??, ??
	dw $496f ; OAM ptr
	dw $48d7 ; update function
	db $80 ; ??

Data_6451b: ; 6451b (19:451b)
	db ($1 << 4) | $5 ; low bank nybble, ??
	db $81, $ee ; ??, ??
	dw $4ab2 ; OAM ptr
	dw $4d3c ; update function
	db $80 ; ??

Data_64523: ; 64523 (19:4523)
	db ($1 << 4) | $3 ; low bank nybble, ??
	db $a2, $e8 ; ??, ??
	dw $4ab2 ; OAM ptr
	dw $54a0 ; update function
	db $80 ; ??

Data_6452b: ; 6452b (19:452b)
	db ($1 << 4) | $6 ; low bank nybble, ??
	db $1e, $f0 ; ??, ??
	dw $4db9 ; OAM ptr
	dw $564a ; update function
	db $80 ; ??

Data_64533: ; 64533 (19:4533)
	db ($1 << 4) | $7 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4eeb ; OAM ptr
	dw $59a9 ; update function
	db $00 ; ??

Data_6453b: ; 6453b (19:453b)
	db ($1 << 4) | $9 ; low bank nybble, ??
	db $8b, $fa ; ??, ??
	dw $4ffa ; OAM ptr
	dw $5ab4 ; update function
	db $80 ; ??

Data_64543: ; 64543 (19:4543)
	db ($1 << 4) | $c ; low bank nybble, ??
	db $0b, $f2 ; ??, ??
	dw $4755 ; OAM ptr
	dw $6b66 ; update function
	db $80 ; ??

Data_6454b: ; 6454b (19:454b)
	db ($1 << 4) | $b ; low bank nybble, ??
	db $01, $f2 ; ??, ??
	dw $440a ; OAM ptr
	dw $5ee3 ; update function
	db $80 ; ??

Data_64553: ; 64553 (19:4553)
	db ($1 << 4) | $4 ; low bank nybble, ??
	db $01, $f2 ; ??, ??
	dw $45aa ; OAM ptr
	dw $65b5 ; update function
	db $80 ; ??

Data_6455b: ; 6455b (19:455b)
	db ($1 << 4) | $a ; low bank nybble, ??
	db $0e, $ec ; ??, ??
	dw $51df ; OAM ptr
	dw $724e ; update function
	db $00 ; ??

Data_64563: ; 64563 (19:4563)
	db ($1 << 4) | $a ; low bank nybble, ??
	db $1c, $ec ; ??, ??
	dw $54a2 ; OAM ptr
	dw $756f ; update function
	db $00 ; ??

Data_6456b: ; 6456b (19:456b)
	db ($1 << 4) | $0 ; low bank nybble, ??
	db $25, $f4 ; ??, ??
	dw $5788 ; OAM ptr
	dw $7718 ; update function
	db $80 ; ??

Data_64573: ; 64573 (19:4573)
	db ($1 << 4) | $6 ; low bank nybble, ??
	db $3f, $ec ; ??, ??
	dw $5893 ; OAM ptr
	dw $774f ; update function
	db $80 ; ??

Data_6457b: ; 6457b (19:457b)
	db ($1 << 4) | $e ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $5b98 ; OAM ptr
	dw $7be6 ; update function
	db $00 ; ??

Data_64583: ; 64583 (19:4583)
	db ($2 << 4) | $0 ; low bank nybble, ??
	db $a7, $ee ; ??, ??
	dw $4000 ; OAM ptr
	dw $4000 ; update function
	db $80 ; ??

Data_6458b: ; 6458b (19:458b)
	db ($2 << 4) | $2 ; low bank nybble, ??
	db $22, $f0 ; ??, ??
	dw $4279 ; OAM ptr
	dw $453b ; update function
	db $80 ; ??

Data_64593: ; 64593 (19:4593)
	db ($2 << 4) | $3 ; low bank nybble, ??
	db $22, $f0 ; ??, ??
	dw $4279 ; OAM ptr
	dw $453b ; update function
	db $80 ; ??

Data_6459b: ; 6459b (19:459b)
	db ($2 << 4) | $2 ; low bank nybble, ??
	db $22, $f0 ; ??, ??
	dw $4279 ; OAM ptr
	dw $4625 ; update function
	db $80 ; ??

Data_645a3: ; 645a3 (19:45a3)
	db ($2 << 4) | $3 ; low bank nybble, ??
	db $22, $f0 ; ??, ??
	dw $4279 ; OAM ptr
	dw $4625 ; update function
	db $80 ; ??

Data_645ab: ; 645ab (19:45ab)
	db ($2 << 4) | $6 ; low bank nybble, ??
	db $30, $ec ; ??, ??
	dw $4555 ; OAM ptr
	dw $48dc ; update function
	db $80 ; ??

Data_645b3: ; 645b3 (19:45b3)
	db ($2 << 4) | $7 ; low bank nybble, ??
	db $05, $fa ; ??, ??
	dw $4b56 ; OAM ptr
	dw $4d8a ; update function
	db $80 ; ??

Data_645bb: ; 645bb (19:45bb)
	db ($2 << 4) | $8 ; low bank nybble, ??
	db $06, $f3 ; ??, ??
	dw $4c7a ; OAM ptr
	dw $4ee2 ; update function
	db $80 ; ??

Data_645c3: ; 645c3 (19:45c3)
	db ($2 << 4) | $9 ; low bank nybble, ??
	db $0a, $ec ; ??, ??
	dw $4e16 ; OAM ptr
	dw $51d3 ; update function
	db $80 ; ??

Data_645cb: ; 645cb (19:45cb)
	db ($2 << 4) | $4 ; low bank nybble, ??
	db $29, $f9 ; ??, ??
	dw $434a ; OAM ptr
	dw $5326 ; update function
	db $80 ; ??

Data_645d3: ; 645d3 (19:45d3)
	db ($2 << 4) | $5 ; low bank nybble, ??
	db $29, $f9 ; ??, ??
	dw $434a ; OAM ptr
	dw $5326 ; update function
	db $80 ; ??

Data_645db: ; 645db (19:45db)
	db ($2 << 4) | $6 ; low bank nybble, ??
	db $29, $f9 ; ??, ??
	dw $434a ; OAM ptr
	dw $5326 ; update function
	db $80 ; ??

Data_645e3: ; 645e3 (19:45e3)
	db ($2 << 4) | $7 ; low bank nybble, ??
	db $29, $f9 ; ??, ??
	dw $434a ; OAM ptr
	dw $5326 ; update function
	db $80 ; ??

Data_645eb: ; 645eb (19:45eb)
	db ($2 << 4) | $8 ; low bank nybble, ??
	db $29, $f9 ; ??, ??
	dw $434a ; OAM ptr
	dw $5326 ; update function
	db $80 ; ??

Data_645f3: ; 645f3 (19:45f3)
	db ($4 << 4) | $0 ; low bank nybble, ??
	db $0b, $e3 ; ??, ??
	dw $4000 ; OAM ptr
	dw $4000 ; update function
	db $00 ; ??

Data_645fb: ; 645fb (19:45fb)
	db ($4 << 4) | $2 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4000 ; OAM ptr
	dw $471a ; update function
	db $00 ; ??

Data_64603: ; 64603 (19:4603)
	db ($2 << 4) | $9 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $53fe ; OAM ptr
	dw $552d ; update function
	db $00 ; ??

Data_6460b: ; 6460b (19:460b)
	db ($4 << 4) | $8 ; low bank nybble, ??
	db $8b, $e4 ; ??, ??
	dw $505c ; OAM ptr
	dw $4ac4 ; update function
	db $00 ; ??

Data_64613: ; 64613 (19:4613)
	db ($4 << 4) | $5 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $505c ; OAM ptr
	dw $526c ; update function
	db $00 ; ??

Data_6461b: ; 6461b (19:461b)
	db ($4 << 4) | $1 ; low bank nybble, ??
	db $af, $e1 ; ??, ??
	dw $505c ; OAM ptr
	dw $5006 ; update function
	db $00 ; ??

Data_64623: ; 64623 (19:4623)
	db ($4 << 4) | $2 ; low bank nybble, ??
	db $af, $e1 ; ??, ??
	dw $505c ; OAM ptr
	dw $500a ; update function
	db $00 ; ??

Data_6462b: ; 6462b (19:462b)
	db ($4 << 4) | $4 ; low bank nybble, ??
	db $af, $e1 ; ??, ??
	dw $505c ; OAM ptr
	dw $500e ; update function
	db $00 ; ??

Data_64633: ; 64633 (19:4633)
	db ($5 << 4) | $7 ; low bank nybble, ??
	db $8b, $e6 ; ??, ??
	dw $4000 ; OAM ptr
	dw $4020 ; update function
	db $00 ; ??

Data_6463b: ; 6463b (19:463b)
	db ($5 << 4) | $9 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4000 ; OAM ptr
	dw $4456 ; update function
	db $00 ; ??

Data_64643: ; 64643 (19:4643)
	db ($2 << 4) | $0 ; low bank nybble, ??
	db $af, $f0 ; ??, ??
	dw $65ae ; OAM ptr
	dw $5c8c ; update function
	db $00 ; ??

Data_6464b: ; 6464b (19:464b)
	db ($2 << 4) | $0 ; low bank nybble, ??
	db $af, $f0 ; ??, ??
	dw $65ae ; OAM ptr
	dw $5c70 ; update function
	db $00 ; ??

Data_64653: ; 64653 (19:4653)
	db ($2 << 4) | $0 ; low bank nybble, ??
	db $af, $f0 ; ??, ??
	dw $65ae ; OAM ptr
	dw $5c7e ; update function
	db $00 ; ??

Data_6465b: ; 6465b (19:465b)
	db ($2 << 4) | $1 ; low bank nybble, ??
	db $39, $f8 ; ??, ??
	dw $65cc ; OAM ptr
	dw $5d64 ; update function
	db $80 ; ??

Data_64663: ; 64663 (19:4663)
	db ($4 << 4) | $b ; low bank nybble, ??
	db $b6, $f0 ; ??, ??
	dw $553c ; OAM ptr
	dw $5356 ; update function
	db $80 ; ??

Data_6466b: ; 6466b (19:466b)
	db ($4 << 4) | $f ; low bank nybble, ??
	db $22, $ef ; ??, ??
	dw $66dc ; OAM ptr
	dw $5c18 ; update function
	db $00 ; ??

Data_64673: ; 64673 (19:4673)
	db ($0 << 4) | $a ; low bank nybble, ??
	db $0b, $f4 ; ??, ??
	dw $5cd3 ; OAM ptr
	dw Func_437d7 ; update function
	db $00 ; ??

Data_6467b: ; 6467b (19:467b)
	db ($0 << 4) | $b ; low bank nybble, ??
	db $0b, $f4 ; ??, ??
	dw $5cd3 ; OAM ptr
	dw Func_437d7 ; update function
	db $00 ; ??

Data_64683: ; 64683 (19:4683)
	db ($0 << 4) | $e ; low bank nybble, ??
	db $22, $e1 ; ??, ??
	dw $5c47 ; OAM ptr
	dw Func_437a5 ; update function
	db $00 ; ??

Data_6468b: ; 6468b (19:468b)
	db ($0 << 4) | $e ; low bank nybble, ??
	db $22, $e1 ; ??, ??
	dw $5c47 ; OAM ptr
	dw Func_437a0 ; update function
	db $00 ; ??

Data_64693: ; 64693 (19:4693)
	db ($0 << 4) | $e ; low bank nybble, ??
	db $22, $e1 ; ??, ??
	dw $5c47 ; OAM ptr
	dw Func_4379b ; update function
	db $00 ; ??

Data_6469b: ; 6469b (19:469b)
	db ($4 << 4) | $5 ; low bank nybble, ??
	db $ba, $f2 ; ??, ??
	dw $67d5 ; OAM ptr
	dw $5d2e ; update function
	db $80 ; ??

Data_646a3: ; 646a3 (19:46a3)
	db ($4 << 4) | $6 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4000 ; OAM ptr
	dw $626b ; update function
	db $00 ; ??

Data_646ab: ; 646ab (19:46ab)
	db ($4 << 4) | $7 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4000 ; OAM ptr
	dw $645e ; update function
	db $00 ; ??

Data_646b3: ; 646b3 (19:46b3)
	db ($4 << 4) | $0 ; low bank nybble, ??
	db $d1, $e6 ; ??, ??
	dw $67d5 ; OAM ptr
	dw $5cf9 ; update function
	db $80 ; ??

Data_646bb: ; 646bb (19:46bb)
	db ($4 << 4) | $1 ; low bank nybble, ??
	db $0c, $f7 ; ??, ??
	dw $67d5 ; OAM ptr
	dw $63c0 ; update function
	db $80 ; ??

Data_646c3: ; 646c3 (19:46c3)
	db ($2 << 4) | $2 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4000 ; OAM ptr
	dw $5e34 ; update function
	db $00 ; ??

Data_646cb: ; 646cb (19:46cb)
	db ($2 << 4) | $d ; low bank nybble, ??
	db $37, $f3 ; ??, ??
	dw $67fd ; OAM ptr
	dw $645d ; update function
	db $00 ; ??

Data_646d3: ; 646d3 (19:46d3)
	db ($2 << 4) | $0 ; low bank nybble, ??
	db $06, $00 ; ??, ??
	dw $6895 ; OAM ptr
	dw $64b5 ; update function
	db $80 ; ??

Data_646db: ; 646db (19:46db)
	db ($2 << 4) | $1 ; low bank nybble, ??
	db $06, $f7 ; ??, ??
	dw $6895 ; OAM ptr
	dw $669a ; update function
	db $00 ; ??

Data_646e3: ; 646e3 (19:46e3)
	db ($2 << 4) | $2 ; low bank nybble, ??
	db $05, $f5 ; ??, ??
	dw $6b04 ; OAM ptr
	dw $68a2 ; update function
	db $80 ; ??

Data_646eb: ; 646eb (19:46eb)
	db ($2 << 4) | $0 ; low bank nybble, ??
	db $05, $f5 ; ??, ??
	dw $6b04 ; OAM ptr
	dw $68a2 ; update function
	db $80 ; ??

Data_646f3: ; 646f3 (19:46f3)
	db ($5 << 4) | $0 ; low bank nybble, ??
	db $c1, $e0 ; ??, ??
	dw $4895 ; OAM ptr
	dw $44e5 ; update function
	db $00 ; ??

Data_646fb: ; 646fb (19:46fb)
	db ($5 << 4) | $4 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4895 ; OAM ptr
	dw $4981 ; update function
	db $00 ; ??

Data_64703: ; 64703 (19:4703)
	db ($2 << 4) | $4 ; low bank nybble, ??
	db $0e, $e8 ; ??, ??
	dw $6ba0 ; OAM ptr
	dw $6af9 ; update function
	db $00 ; ??

Data_6470b: ; 6470b (19:470b)
	db ($5 << 4) | $6 ; low bank nybble, ??
	db $44, $f6 ; ??, ??
	dw $501c ; OAM ptr
	dw $4d37 ; update function
	db $00 ; ??

Data_64713: ; 64713 (19:4713)
	db ($5 << 4) | $7 ; low bank nybble, ??
	db $0b, $f6 ; ??, ??
	dw $501c ; OAM ptr
	dw $51e5 ; update function
	db $00 ; ??

Data_6471b: ; 6471b (19:471b)
	db ($5 << 4) | $9 ; low bank nybble, ??
	db $31, $fc ; ??, ??
	dw $501c ; OAM ptr
	dw $515b ; update function
	db $80 ; ??

Data_64723: ; 64723 (19:4723)
	db ($5 << 4) | $a ; low bank nybble, ??
	db $0b, $f8 ; ??, ??
	dw $5699 ; OAM ptr
	dw $5611 ; update function
	db $00 ; ??

Data_6472b: ; 6472b (19:472b)
	db ($5 << 4) | $b ; low bank nybble, ??
	db $45, $fe ; ??, ??
	dw $5699 ; OAM ptr
	dw $5c4a ; update function
	db $80 ; ??

Data_64733: ; 64733 (19:4733)
	db ($5 << 4) | $c ; low bank nybble, ??
	db $45, $fe ; ??, ??
	dw $5699 ; OAM ptr
	dw $5de4 ; update function
	db $80 ; ??

Data_6473b: ; 6473b (19:473b)
	db ($5 << 4) | $d ; low bank nybble, ??
	db $8b, $00 ; ??, ??
	dw $5e06 ; OAM ptr
	dw $5e4e ; update function
	db $00 ; ??

Data_64743: ; 64743 (19:4743)
	db ($5 << 4) | $a ; low bank nybble, ??
	db $22, $ff ; ??, ??
	dw $5e06 ; OAM ptr
	dw $62c8 ; update function
	db $00 ; ??

Data_6474b: ; 6474b (19:474b)
	db ($5 << 4) | $0 ; low bank nybble, ??
	db $8b, $e0 ; ??, ??
	dw $6583 ; OAM ptr
	dw $6611 ; update function
	db $00 ; ??

Data_64753: ; 64753 (19:4753)
	db ($5 << 4) | $1 ; low bank nybble, ??
	db $ce, $ec ; ??, ??
	dw $6583 ; OAM ptr
	dw $6e6a ; update function
	db $00 ; ??

Data_6475b: ; 6475b (19:475b)
	db ($5 << 4) | $a ; low bank nybble, ??
	db $0b, $e0 ; ??, ??
	dw $6583 ; OAM ptr
	dw $7264 ; update function
	db $00 ; ??

Data_64763: ; 64763 (19:4763)
	db ($5 << 4) | $b ; low bank nybble, ??
	db $0b, $e0 ; ??, ??
	dw $6583 ; OAM ptr
	dw $72b4 ; update function
	db $00 ; ??

Data_6476b: ; 6476b (19:476b)
	db ($5 << 4) | $5 ; low bank nybble, ??
	db $31, $f6 ; ??, ??
	dw $6583 ; OAM ptr
	dw $6dcc ; update function
	db $00 ; ??

Data_64773: ; 64773 (19:4773)
	db ($3 << 4) | $6 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4806 ; OAM ptr
	dw $4b2d ; update function
	db $00 ; ??

Data_6477b: ; 6477b (19:477b)
	db ($3 << 4) | $6 ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $4806 ; OAM ptr
	dw $4b32 ; update function
	db $00 ; ??

Data_64783: ; 64783 (19:4783)
	db ($3 << 4) | $a ; low bank nybble, ??
	db $0b, $00 ; ??, ??
	dw $488a ; OAM ptr
	dw $4b51 ; update function
	db $00 ; ??

ObjParams_HebariiProjectile: ; 6478b (19:478b)
	db -8  ; y
	db  0  ; x
	dn $2, $1 ; unk7
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -3,  2, -3,  2 ; collision
	dw OAM_18a703 ; OAM
	dw Frameset_68408 ; frameset
	db 2 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw HebariiProjectileFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x647a0

ObjParams_WebberProjectile: ; 647a0 (19:47a0)
	db  5  ; y
	db -8  ; x
	dn $0, $3 ; unk7
	db OBJ_INTERACTION_1C ; interaction type
	db -7, -3, -4, 3 ; collision
	dw OAM_180242 ; OAM
	dw Frameset_682c8 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw WebberProjectileFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x647b5

ObjParams_UnusedFlowerProjectileLeft: ; 647b5 (19:47b5)
	db -10 ; y
	db   0 ; x
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FULL_STING
	db -13, -3, -6, 5 ; collision box
	dw OAM_180916 ; OAM
	dw Frameset_6838c ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw UnusedFlowerProjectileLeftFunc
	db OBJFLAG_VRAM1 ; obj flags

ObjParams_UnusedFlowerProjectileRight: ; 647ca (19:47ca)
	db -10 ; y
	db   0 ; x
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FULL_STING
	db -13, -3, -6, 5 ; collision box
	dw OAM_180916 ; OAM
	dw Frameset_68395 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $80 ; unk1a
	db OBJSTATE_00 ; state
	dw UnusedFlowerProjectileRightFunc
	db OBJFLAG_VRAM1 ; obj flags

	INCROM $647df, $64a40

ObjParams_GreyTreasure: ; 64a40 (19:4a40)
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680da ; frameset
	db 87 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw GreyTreasureFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x64a55

ObjParams_RedTreasure: ; 64a55 (19:4a55)
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68113 ; frameset
	db 87 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw RedTreasureFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x64a6a

ObjParams_GreenTreasure: ; 64a6a (19:4a6a)
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_6814c ; frameset
	db 87 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw GreenTreasureFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x64a7f

ObjParams_BlueTreasure: ; 64a7f (19:4a7f)
	db -40 ; y
	db   0 ; x
	dn $3, $3 ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68185 ; frameset
	db 87 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw BlueTreasureFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x64a94

	INCROM $64a94, $64e06

ObjParams_64e06: ; 64e06 (19:4e06)
	db 16 ; y
	db  0 ; x
	dn $0, $d ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -16, 11, -17, 0 ; collision box
	dw OAM_18154f ; OAM
	dw Frameset_68f50 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw $679c
	db $0 ; obj flags
; 0x64e1b

ObjParams_64e1b: ; 64e1b (19:4e1b)
	db 16 ; y
	db  0 ; x
	dn $0, $d ; unk7
	db OBJ_INTERACTION_01 ; interaction type
	db -26, 11, -17, 0 ; collision box
	dw OAM_18154f ; OAM
	dw Frameset_68f50 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw $679c
	db $0 ; obj flags
; 0x64e30

	INCROM $64e30, $64e5a

ObjParams_Coin: ; 64e5a (19:4e5a)
	dn $8, $1 ; unk7
	db OBJ_INTERACTION_REGULAR_COIN
	db -12, 0, -4, 3
	dw OAM_180003 ; OAM
	db 1, 8 ; frameset
	db 4 ; action duration
	db $00 ; unk17
	db $02 ; unk18
	db $00 ; movement index
	db $20 ; unk1a
	db OBJSTATE_19 ; state
	dw CoinFunc
	db OBJFLAG_VRAM1 ; obj flags
; 0x64e6d

ObjParams_ColourCoin: ; 64e6d (19:4e6d)
	dn $8, $1 ; unk7
	db OBJ_INTERACTION_COLOUR_COIN
	db -12, 0, -4, 3
	dw OAM_180003 ; OAM
	db 1, 8 ; frameset
	db 4 ; action duration
	db $00 ; unk17
	db $02 ; unk18
	db $00 ; movement index
	db $20 ; unk1a
	db OBJSTATE_19 ; state
	dw CoinFunc.ColourCoin
	db OBJFLAG_VRAM1 ; obj flags
; 0x64e6d

ObjParams_TorchEmberLeft1: ; 64e80 (19:4e80)
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw TorchEmberLeft1Func
	db OBJFLAG_VRAM1 ; obj flags

ObjParams_TorchEmberRight1: ; 64e93 (19:4e93)
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $80 ; unk1a
	db OBJSTATE_00 ; state
	dw TorchEmberRight1Func
	db OBJFLAG_VRAM1 ; obj flags

ObjParams_TorchEmberLeft2: ; 64ea6 (19:4ea6)
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $00 ; unk1a
	db OBJSTATE_00 ; state
	dw TorchEmberLeft2Func
	db OBJFLAG_VRAM1 ; obj flags

ObjParams_TorchEmberRight2: ; 64eb9 (19:4eb9)
	dn $0, $5 ; unk7
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; unk17
	db $00 ; unk18
	db $00 ; movement index
	db $80 ; unk1a
	db OBJSTATE_00 ; state
	dw TorchEmberRight2Func
	db OBJFLAG_VRAM1 ; obj flags
; 0x64ecc

	INCROM $64ecc, $64fc3

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
	dw Data_64473
	dw Data_64553
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
	dw Data_644cb
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

	dw Data_644bb
	dw CountRichtertoffenData
	dw Data_6468b
	dw Data_6447b
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
	dw Data_64483
	dw Data_6447b
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
	dw Data_6448b
	dw Data_6447b
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
	dw Data_64493
	dw DummyObjectData
	dw DummyObjectData
	dw Data_6449b
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

	dw Data_644a3
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
	dw Data_64493
	dw Data_644ab
	dw DummyObjectData
	dw Data_6449b
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

	dw Data_644a3
	dw DummyObjectData
	dw Data_644ab
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

	dw Data_644bb
	dw Data_644c3
	dw Data_64473
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

	dw Data_644d3
	dw Data_6446b
	dw Data_64473
	dw Data_64543
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

	dw Data_644d3
	dw Data_6446b
	dw Data_6453b
	dw Data_64543
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
	dw Data_644b3
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
	dw Data_644db
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

	dw Data_644fb
	dw Data_6450b
	dw Data_6454b
	dw Data_644eb
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

	dw Data_6451b
	dw Data_6446b
	dw FutamoguData
	dw Data_64513
	dw Data_64523
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
	dw Data_6452b
	dw DummyObjectData
	dw Data_64693
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

	dw Data_6451b
	dw Data_6446b
	dw DummyObjectData
	dw Data_64533
	dw Data_64523
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

	dw Data_6455b
	dw DummyObjectData
	dw Data_6468b
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

	dw Data_64563
	dw DummyObjectData
	dw Data_6468b
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
	dw Data_6450b
	dw Data_6454b
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
	dw Data_64573
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

	dw Data_645bb
	dw DummyObjectData
	dw Data_6457b
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
	dw Data_6456b
	dw Data_6465b
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

	dw Data_644d3
	dw Data_64683
	dw Data_64593
	dw Data_6458b
	dw Data_64543
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
	dw Data_64683
	dw Data_645a3
	dw Data_6459b
	dw Data_64543
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

	dw Data_644d3
	dw Data_64683
	dw Data_645a3
	dw Data_6459b
	dw Data_64543
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
	dw Data_64593
	dw Data_6458b
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
	dw Data_6446b
	dw DummyObjectData
	dw Data_64673
	dw Data_6467b
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

	dw Data_644bb
	dw Data_6446b
	dw Data_6468b
	dw Data_64553
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
	dw Data_644db
	dw Data_6468b
	dw Data_64533
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

	dw Data_645ab
	dw DummyObjectData
	dw Data_6454b
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
	dw Data_6446b
	dw DummyObjectData
	dw DoughnuteerGfx
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

	dw Data_645bb
	dw DummyObjectData
	dw DummyObjectData
	dw Data_64583
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

	dw Data_645bb
	dw WebberData
	dw Data_6457b
	dw Data_64673
	dw Data_6467b
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

	dw Data_645c3
	dw DummyObjectData
	dw Data_64483
	dw Data_6447b
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

	dw Data_645c3
	dw Data_6452b
	dw Data_6468b
	dw Data_6447b
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

	dw Data_645cb
	dw Data_645d3
	dw Data_645db
	dw Data_645e3
	dw Data_645eb
	dw Data_6446b
	dw SpearheadData
	dw Data_64553
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
	dw Data_6446b
	dw Data_6454b
	dw Data_64543
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

	dw Data_645f3
	dw Data_645fb
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
	dw Data_6446b
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
	dw Data_644cb
	dw Data_6456b
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
	dw Data_6450b
	dw Data_6453b
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

	dw Data_6460b
	dw Data_64613
	dw Data_6461b
	dw Data_64623
	dw Data_6462b
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

	dw Data_6451b
	dw Data_6446b
	dw Data_6453b
	dw DummyObjectData
	dw Data_64523
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

	dw Data_64633
	dw Data_6463b
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

	dw Data_645c3
	dw Data_6446b
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

	dw Data_645bb
	dw Data_6446b
	dw DummyObjectData
	dw Data_64643
	dw Data_6464b
	dw Data_64653
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
	dw Data_6446b
	dw Data_64473
	dw Data_64543
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
	dw Data_6446b
	dw Data_6453b
	dw Data_64543
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

	dw Data_64663
	dw Data_6466b
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
	dw Data_644db
	dw Data_6456b
	dw Data_6465b
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
	dw Data_64473
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

	dw Data_64503
	dw Data_6446b
	dw Data_645e3
	dw Data_64583
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

	dw Data_6469b
	dw Data_646a3
	dw Data_646ab
	dw Data_646b3
	dw Data_646bb
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
	dw Data_64473
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
	dw Data_6453b
	dw Data_64543
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

	dw Data_644d3
	dw Data_644c3
	dw HebariiData
	dw Data_64673
	dw Data_6467b
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

	dw Data_645bb
	dw DummyObjectData
	dw Data_646c3
	dw Data_644eb
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

	dw Data_64503
	dw DummyObjectData
	dw Data_6456b
	dw Data_6465b
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
	dw Data_6452b
	dw Data_64473
	dw Data_646e3
	dw Data_646eb
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
	dw Data_6452b
	dw DummyObjectData
	dw Data_64553
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

	dw Data_6455b
	dw DummyObjectData
	dw Data_6454b
	dw Data_64583
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
	dw Data_644c3
	dw Data_6457b
	dw Data_644e3
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

	dw Data_64503
	dw Data_6452b
	dw Data_64773
	dw Data_644eb
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

	dw Data_644d3
	dw Data_6446b
	dw Data_64703
	dw Data_64543
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
	dw Data_6456b
	dw Data_64673
	dw Data_6467b
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

	dw Data_644d3
	dw Data_644db
	dw Data_6477b
	dw Data_644eb
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

	dw Data_646f3
	dw Data_646fb
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

	dw Data_646cb
	dw DummyObjectData
	dw Data_6454b
	dw Data_64543
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

	dw Data_645bb
	dw DummyObjectData
	dw Data_6457b
	dw Data_646d3
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

	dw Data_645bb
	dw DummyObjectData
	dw Data_6457b
	dw Data_646db
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

	dw Data_64503
	dw DummyObjectData
	dw Data_64573
	dw Data_64543
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

	dw Data_645c3
	dw DummyObjectData
	dw DummyObjectData
	dw Data_646e3
	dw Data_646eb
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
	dw Data_644f3
	dw Data_64583
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
	dw Data_64603
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
	dw Data_644db
	dw Data_6468b
	dw Data_644eb
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

	dw Data_644bb
	dw Data_644db
	dw DummyObjectData
	dw Data_644eb
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
	dw Data_6450b
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
	dw Data_6450b
	dw Data_64703
	dw Data_64543
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

	dw Data_6470b
	dw Data_64713
	dw Data_6471b
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
	dw Data_64483
	dw Data_6447b
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

	dw Data_644d3
	dw DummyObjectData
	dw DummyObjectData
	dw Data_64543
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
	dw Data_644e3
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

	dw Data_64723
	dw Data_6472b
	dw Data_64733
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

	dw Data_6473b
	dw Data_64743
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
	dw Data_644eb
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
	dw Data_644db
	dw Data_64483
	dw Data_6447b
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
	dw Data_644c3
	dw HebariiData
	dw Data_64673
	dw Data_6467b
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
	dw Data_644cb
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

	dw Data_644bb
	dw Data_644cb
	dw Data_64473
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

	dw Data_644bb
	dw DummyObjectData
	dw DummyObjectData
	dw Data_64583
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
	dw Data_6453b
	dw Data_64583
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

	dw Data_6474b
	dw Data_64753
	dw Data_6475b
	dw Data_64763
	dw Data_6476b
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
	dw Data_644db
	dw DummyObjectData
	dw Data_646e3
	dw Data_646eb
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

	dw Data_6451b
	dw DummyObjectData
	dw Data_646c3
	dw Data_64583
	dw Data_64523
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

	dw Data_644bb
	dw DummyObjectData
	dw HebariiData
	dw Data_64543
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
	dw Data_6468b
	dw Data_64583
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
	dw Data_644cb
	dw DummyObjectData
	dw Data_646e3
	dw Data_646eb
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

	dw Data_64503
	dw Data_644cb
	dw Data_6453b
	dw Data_64693
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
	dw Data_644f3
	dw DoughnuteerGfx
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
	dw Data_644cb
	dw DummyObjectData
	dw Data_644e3
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
	dw Data_64553
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

	dw Data_64563
	dw DummyObjectData
	dw Data_6454b
	dw Data_64543
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
	dw Data_6446b
	dw HebariiData
	dw Data_64583
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
	dw Data_6446b
	dw Data_64473
	dw DoughnuteerGfx
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
	dw Data_6454b
	dw Data_6447b
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
	dw Data_6450b
	dw DummyObjectData
	dw Data_64543
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

	dw Data_644d3
	dw Data_6446b
	dw DummyObjectData
	dw Data_64543
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

	dw Data_64503
	dw Data_6452b
	dw Data_6477b
	dw Data_644eb
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
	dw Data_644f3
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
	dw Data_64513
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
	dw Data_6446b
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
