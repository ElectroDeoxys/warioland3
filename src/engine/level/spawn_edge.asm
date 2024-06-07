SpawnRowEdgeObjects:
	ld a, [wLevelEndScreen]
	and a
	ret nz ; level ended

	ld hl, wBlockPos
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	call .SpawnObjs ; can be fallthrough
	ret

.SpawnObjs:
	ld e, $0c
.loop_rows
	bit 7, [hl]
	jr z, .next_row
	push hl
	call Func_d8c
	ld a, [hl]
	bit 0, b
	jr z, .skip_swap
	swap a
.skip_swap
	and $0f
	ld c, a
	pop hl
	jr z, .next_row
	push de
	push bc
	call Func_d3e
	ld d, h
	ld e, l
	push hl
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall SpawnObject
	pop af
	ldh [rSVBK], a
	pop hl
	pop bc
	pop de
.next_row
	inc h
	ld a, h
	cp $c0
	jr nz, .skip_incr_srambank
	ld h, HIGH(sLevelBlockObjectMap)
	ld a, [wBlockPtrBank]
	inc a
	ld [wBlockPtrBank], a
	sramswitch
.skip_incr_srambank
	dec e
	jr nz, .loop_rows
	ret

SpawnColEdgeObjects:
	ld a, [wLevelEndScreen]
	and a
	ret nz ; level ended

	ld hl, wBlockPos
	call GetBlockPtr
	ld a, [wBlockPtrBank]
	sramswitch
	call .SpawnObjs ; can be fallthrough
	ret

.SpawnObjs:
	ld e, $0d
.loop_cols
	bit 7, [hl]
	jr z, .next_col
	push hl
	call Func_d8c
	ld a, [hl]
	bit 0, b
	jr z, .skip_swap
	swap a
.skip_swap
	and $0f
	ld c, a
	pop hl
	jr z, .next_col
	push de
	push bc
	call Func_d3e
	ld d, h
	ld e, l
	push hl
	ldh a, [rSVBK]
	push af
	ld a, $01
	ldh [rSVBK], a
	farcall SpawnObject
	pop af
	ldh [rSVBK], a
	pop hl
	pop bc
	pop de
.next_col
	ld a, b
	xor $1
	ld b, a
	inc l
	dec e
	jr nz, .loop_cols
	ret

LoadLevelCommonGfxAndTreasures:
	ld hl, LevelsCommonGfx
	ld de, v0Tiles1
	ld bc, LevelsCommonGfxEnd - LevelsCommonGfx
	call CopyHLToDE_BC
	farcall LoadLevelTreasureData
	ret
