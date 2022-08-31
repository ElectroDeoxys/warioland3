; sequence of y-offsets used in Func_42725
Data_40000: ; 40000 (10:4000)
	db  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1
	db  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0
	db  0,  0,  0,  0,  0,  0,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1
	db  0,  0,  0,  0,  0,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1, $80
; 0x40040

INCLUDE "engine/level/objects/spearhead.asm"
INCLUDE "engine/level/objects/futamogu.asm"
INCLUDE "engine/level/objects/webber.asm"
INCLUDE "engine/level/objects/torch.asm"
INCLUDE "engine/level/objects/unused_flower.asm"
INCLUDE "engine/level/objects/count_richtertoffen.asm"

Func_41357: ; 41357 (10:5357)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $53
	ld [hld], a
	ld a, $61
	ld [hld], a
	ret
; 0x41361

	INCROM $41361, $41a7c

Func_41a7c: ; 41a7c (10:5a7c)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $5a
	ld [hld], a
	ld a, $86
	ld [hld], a
	ret
; 0x41a86

	INCROM $41a86, $42170

Func_42170: ; 42170 (10:6170)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $62
	ld [hld], a
	ld a, $18
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $fd
	ld [hld], a
	ld a, $f3
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld l, $17
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	jp Func_42432
; 0x42199

	INCROM $42199, $42432

Func_42432: ; 42432 (10:6432)
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $01
	ld [hld], a
	xor a
	ld [hl], a
	ld de, $4f0b
	call SetObjectFramesetPtr
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_18
	ld [hld], a
	ret
; 0x4244c

	INCROM $4244c, $42478

Func_42478: ; 42478 (10:6478)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $64
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $fd
	ld [hld], a
	ld a, $f3
	ld [hld], a
	ld a, $f9
	ld [hld], a
	call Func_3444
	ld a, e
	and a
	jp nz, Func_42559
	ld bc, ObjParams_64e1b
	call CreateObjectAtRelativePos
	ld de, Frameset_68f14
	call SetObjectFramesetPtr
	ld a, $00
	ld [hli], a
	ld [wCurObjMovementIndex], a
	jp Func_42535
; 0x424b1

Func_424b1: ; 424b1 (10:64b1)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $64
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $fd
	ld [hld], a
	ld a, $f3
	ld [hld], a
	ld a, $f9
	ld [hld], a
	call Func_3444
	ld a, e
	and a
	jp nz, Func_42559
	ld bc, ObjParams_64e06
	call CreateObjectAtRelativePos
	ld de, $4f14
	call SetObjectFramesetPtr
	ld a, $00
	ld [hli], a
	ld [wCurObjMovementIndex], a
	jp Func_42535
; 0x424ea

	INCROM $424ea, $42535

Func_42535: ; 42535 (10:6535)
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, Func_42725
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $02
	ld [hld], a
	ld de, $4f26
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld l, OBJ_FLAGS
	res OBJFLAG_STEPPED_F, [hl]
	ret
; 0x42554

	INCROM $42554, $42559

Func_42559: ; 42559 (10:6559)
	ld hl, wCurObjUnk1a
	ld a, [hl]
	and $f0
	or $03
	ld [hld], a
	ld de, $4f2b
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ret
; 0x4256c

	INCROM $4256c, $42725

Func_42725: ; 42725 (10:6725)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(Data_40000)
	add LOW(Data_40000)
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_42740
	ld a, c
	sub $3f
	ld c, a
	ld a, [bc]
	ld c, $01
	ld [hl], c
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr .apply_y_offset
.asm_42740
	inc [hl]
.apply_y_offset
	and a
	ret z
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.negative
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret
; 0x42754

	INCROM $42754, $429c4

Func_429c4: ; 429c4 (10:69c4)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $69
	ld [hld], a
	ld a, $ed
	ld [hld], a
	ld de, $461b
	call SetObjectFramesetPtr
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $03
	ld [hld], a
	ld a, $fc
	ld [hld], a
	ld a, $fd
	ld [hl], a
	ret
; 0x429ed

	INCROM $429ed, $42b7d

Func_42b7d: ; 42b7d (10:6b7d)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $6a
	ld [hld], a
	ld a, $cf
	ld [hld], a
	ld de, $4611
	call SetObjectFramesetPtr
	ld a, $60
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	set 7, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $04
	ld [hld], a
	ld a, $fb
	ld [hld], a
	ld a, $fc
	ld [hl], a
	ret
; 0x42ba8

Func_42ba8: ; 42ba8 (10:6ba8)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $6b
	ld [hld], a
	ld a, $bf
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, $14
	ld [wCurObjStateDuration], a
	ld l, OBJ_FLAGS
	set 3, [hl]
	ret
; 0x42bbf

	INCROM $42bbf, $42d1d

Func_42d1d: ; 42d1d (10:6d1d)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $6d
	ld [hld], a
	ld a, $27
	ld [hld], a
	ret
; 0x42d27

	INCROM $42d27, $43278

Func_43278: ; 43278 (10:7278)
	ld hl, wCurObjUpdateFunction + 1
	ld a, $72
	ld [hld], a
	ld a, $82
	ld [hld], a
	ret
; 0x43282

	INCROM $43282, $43451

Func_43451: ; 43451 (10:7451)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $74
	ld [hld], a
	ld a, $79
	ld [hld], a
	ld de, $4a7b
	call SetObjectFramesetPtr
	ld a, $0a
	ld [hli], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f7
	ld [hl], a
	ret
; 0x43479

	INCROM $43479, $434ba

Func_434ba: ; 434ba (10:74ba)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $74
	ld [hld], a
	ld a, $e2
	ld [hld], a
	ld de, $4a78
	call SetObjectFramesetPtr
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $00
	ld [hl], a
	ld a, $31
	ld [wCurObjState], a
	ret
; 0x434e2

	INCROM $434e2, $436ea

Func_436ea: ; 436ea (10:76ea)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set 3, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $06
	ld [hld], a
	ld a, $f9
	ld [hld], a
	ld a, $f3
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $77
	ld [hld], a
	ld a, $1b
	ld [hld], a
	ld de, $4a9f
	call SetObjectFramesetPtr
	ret
; 0x4370f

	INCROM $4370f, $4379b

Func_4379b: ; 4379b (10:779b)
	ld de, $58ae
	jr Func_437a8

Func_437a0: ; 437a0 (10:77a0)
	ld de, $58ab
	jr Func_437a8

Func_437a5: ; 437a5 (10:77a5)
	ld de, $58a8
;	fallthrough

Func_437a8: ; 437a8 (10:77a8)
	call SetObjectFramesetPtr
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $77
	ld [hld], a
	ld a, $d6
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $ea
	ld [hld], a
	ld a, $fe
	ld [hl], a
	ld a, [wIsMinigameCleared]
	and a
	ret z
	ld a, $20
	ld [wCurObjUnk18], a
	jp Func_3076
; 0x437d6

	ret ; stray ret

Func_437d7: ; 437d7 (10:77d7)
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set 3, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $78
	ld [hld], a
	ld a, $0e
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld a, [wCurObjUnk07]
	cp $0a
	jr nz, .asm_437f5
	res 7, [hl]
	jr .asm_437f7
.asm_437f5
	set 7, [hl]
.asm_437f7
	ld l, $0a
	ld a, $fc
	ld [hli], a
	ld a, $fd
	ld [hli], a
	ld a, $02
	ld [hl], a
	ld de, $58ff
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	xor a
	ld [hl], a
	ret
; 0x4380e

	INCROM $4380e, $43a48
