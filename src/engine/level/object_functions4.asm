	INCROM $4c000, $4c860

Func_4c860: ; 4c860 (13:4860)
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall Func_baee
	ret
; 0x4c87c

	INCROM $4c87c, $4c8a2

VanishStarsFunc: ; 4c8a2 (13:48a2)
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x4c8b1

DeinitTreasure: ; 4c8b1 (13:48b1)
	xor a
	ld [wCurObjFlags], a
	ret
; 0x4c8b6

GreyTreasureFunc: ; 4c8b6 (13:48b6)
	ld a, [wKeyAndTreasureFlags]
	and GREY_TREASURE
	jr z, TreasureFunc
	jr DeinitTreasure

RedTreasureFunc: ; 4c8bf (13:48bf)
	ld a, [wKeyAndTreasureFlags]
	and RED_TREASURE
	jr z, TreasureFunc
	jr DeinitTreasure

GreenTreasureFunc: ; 4c8c8 (13:48c8)
	ld a, [wKeyAndTreasureFlags]
	and GREEN_TREASURE
	jr z, TreasureFunc
	jr DeinitTreasure

BlueTreasureFunc: ; 4c8d1 (13:48d1)
	ld a, [wKeyAndTreasureFlags]
	and BLUE_TREASURE
	jr z, TreasureFunc
	jr DeinitTreasure

TreasureFunc: ; 4c8da (13:48da)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	set 4, [hl]
	ld de, Frameset_68000
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0d
	ld [hld], a
	ld a, $f2
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ret

.Update:
	ld hl, wCurObjAction
	ld a, [hl]
	cp OBJACTION_18
	ret nz
	ld a, [wAutoMoveState]
	and a
	ret nz
	ld de, Frameset_68003
	call SetObjectFramesetPtr
	ld a, $56
	ld [hli], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Open)
	ld [hld], a
	ld a, LOW(.Open)
	ld [hld], a

.Ret:
	ret

.Open:
	ld hl, wCurObjActionDuration
	ld a, [hl]
	cp $49
	play_sfx z, SFX_035
	dec [hl]
	ret nz
	ld de, Frameset_68060
	call SetObjectFramesetPtr
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Ret)
	ld [hld], a
	ld a, LOW(.Ret)
	ld [hld], a

	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	cp OBJ_INTERACTION_GREY_TREASURE
	jr z, .grey
	cp OBJ_INTERACTION_RED_TREASURE
	jr z, .red
	cp OBJ_INTERACTION_GREEN_TREASURE
	jr z, .green
; blue
	ld bc, ObjParams_64a7f
	jr .play_fanfare
.grey
	ld bc, ObjParams_64a40
	jr .play_fanfare
.red
	ld bc, ObjParams_64a55
	jr .play_fanfare
.green
	ld bc, ObjParams_64a6a
.play_fanfare
	play_music2 MUSIC_TREASURE_FANFARE
	jp CreateObjectAtRelativePos
; 0x4c970

	INCROM $4c970, $4c992

KeyFunc: ; 4c992 (13:4992)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld de, Frameset_6804f
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $04
	ld [hld], a
	ld a, $fb
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, $fc
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
	ret

.Update:
	ld a, [wCurObjAction]
	cp OBJACTION_18
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	farcall Func_bb2d
	ret
; 0x4c9d4

MusicalCoinFunc: ; 4c9d4 (13:49d4)
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_UNK_1A
	res 5, [hl]
	ld de, Frameset_68036
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $01
	ld [hld], a
	ld a, $ef
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, $f9
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
	ret

.Update:
	ld a, [wCurObjAction]
	cp OBJACTION_18
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	farcall Func_bb2d
	ret
; 0x4ca16

	INCROM $4ca16, $4d8fa
