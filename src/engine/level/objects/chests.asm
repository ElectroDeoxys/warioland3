DeinitChest:
	xor a
	ld [wCurObjFlags], a
	ret

GreyChestFunc:
	ld a, [wKeyAndTreasureFlags]
	and GREY_TREASURE
	jr z, ChestFunc
	jr DeinitChest

RedChestFunc:
	ld a, [wKeyAndTreasureFlags]
	and RED_TREASURE
	jr z, ChestFunc
	jr DeinitChest

GreenChestFunc:
	ld a, [wKeyAndTreasureFlags]
	and GREEN_TREASURE
	jr z, ChestFunc
	jr DeinitChest

BlueChestFunc:
	ld a, [wKeyAndTreasureFlags]
	and BLUE_TREASURE
	jr z, ChestFunc
	jr DeinitChest

ChestFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld de, Frameset_68000
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 13
	ld [hld], a
	ld a, -14
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ret

.Update:
	ld hl, wCurObjState
	ld a, [hl]
	cp OBJSTATE_18
	ret nz
	ld a, [wAutoMoveState]
	and a
	ret nz
	ld de, Frameset_68003
	call SetObjectFramesetPtr
	ld a, 86
	ld [hli], a
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Open)
	ld [hld], a
	ld a, LOW(.Open)
	ld [hld], a

.Ret:
	ret

.Open:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp 73
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
	ld bc, ObjParams_BlueTreasure
	jr .play_fanfare
.grey
	ld bc, ObjParams_GreyTreasure
	jr .play_fanfare
.red
	ld bc, ObjParams_RedTreasure
	jr .play_fanfare
.green
	ld bc, ObjParams_GreenTreasure
.play_fanfare
	play_music2 MUSIC_TREASURE_FANFARE
	jp CreateObjectAtRelativePos

; these framesets use OAM data that point
; to addresses in VRAM that are loaded
; with the treasure tiles
GreyTreasureFunc:
	ld de, Frameset_681be
	jr TreasureFunc
RedTreasureFunc:
	ld de, Frameset_681c3
	jr TreasureFunc
GreenTreasureFunc:
	ld de, Frameset_681c8
	jr TreasureFunc
BlueTreasureFunc:
	ld de, Frameset_681cd
TreasureFunc:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	jp SetObjectFramesetPtr
