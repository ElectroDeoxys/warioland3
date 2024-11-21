VBlank_Level:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	jp LevelVBlankFunc
.end

SetTileQueueProcessingFunctions:
	ld hl, wVBlankFunc + $10
	ld a, [wBGMapTileQueueSize]
	and a
	jr z, .no_queue

	ld c, a
.loop_1
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $57 ; ld d, a
	ld [hli], a
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $5f ; ld e, a
	ld [hli], a
	ld a, $0a ; ld a, [bc]
	ld [hli], a
	ld a, $12 ; ld [de], a
	ld [hli], a
	ld a, $0c ; inc c
	ld [hli], a
	dec c
	jr nz, .loop_1

	ld a, $c3 ; jp
	ld [hli], a
	ld a, LOW(ProcessLevelTileQueue_VRAM1)
	ld [hli], a
	ld a, HIGH(ProcessLevelTileQueue_VRAM1)
	ld [hl], a

	ld a, [wBGMapTileQueueSize]
	ld c, a
	ld hl, wVBlankFuncExtended
.loop_2
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $57 ; ld d, a
	ld [hli], a
	ld a, $2a ; ld a, [hli]
	ld [hli], a
	ld a, $5f ; ld e, a
	ld [hli], a
	ld a, $0a ; ld a, [bc]
	ld [hli], a
	ld a, $12 ; ld [de], a
	ld [hli], a
	ld a, $0c ; inc c
	ld [hli], a
	dec c
	jr nz, .loop_2

.no_queue
	ld a, $c3 ; jp
	ld [hli], a
	ld a, LOW(ClearLevelTileQueue)
	ld [hli], a
	ld a, HIGH(ClearLevelTileQueue)
	ld [hl], a
	ret
