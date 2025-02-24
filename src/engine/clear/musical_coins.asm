InitMusicalCoinScreen:
	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	call Func_d464e
	call Func_d465b
	call Func_d4668
	call Func_d47f1

	ld a, $ff
	ld [wAllMusicalCoinsLevel], a
	ld a, [wNumMusicalCoins]
	cp NUM_LEVEL_MUSICAL_COINS
	call z, SetMusicalCoinFlag

	call VBlank_MusicalCoinsScreen

	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld [wSCY], a
	ldh [rSCY], a

	ld hl, wMenuObj3
	ld a, $38
	ld [hli], a ; y
	ld a, $40
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cd4)
	ld [hli], a
	ld a, LOW(Frameset_1f1cd4)
	ld [hl], a
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall LoadPauseMenuSprite

	ld a, 8
	ld [wAnimatedTilesFrameDuration], a
	ld a, ANIMATED_TILES_GFX_15
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	inc a ; TRUE
	ld [wRoomAnimatedTilesEnabled], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	xor a
	ld [wMusicalCoinVisualCounter], a
	ld a, 60
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	ret

Func_d4472:
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall LoadPauseMenuSprite
	call ClearUnusedVirtualOAM

	ld hl, wNumMusicalCoins
	ld a, [wMusicalCoinVisualCounter]
	cp [hl]
	jr z, .counting_up_done
	ld hl, wTimer
	ld a, [hl]
	and a
	jr z, .count_up
	dec [hl]
	ret

.count_up
	ld a, [wGlobalCounter]
	and %11
	ret nz
	play_sfx SFX_REGULAR_COIN
	ld hl, wBGMapTileVRAM0Queue
	ld a, HIGH(v0BGMap0 + $8b)
	ld [hli], a
	ld a, LOW(v0BGMap0 + $8b)
	ld [hli], a

	ld a, [wMusicalCoinVisualCounter]
	inc a
	ld [wMusicalCoinVisualCounter], a
	add a ; *2
	add $a0
	ld b, a
	ld [hli], a
	ld a, $98
	ld [hli], a
	ld a, $ab
	ld [hli], a
	inc b
	ld [hl], b
	ld a, $80
	ld [wcee4], a
	ret

.counting_up_done
	ld a, [wAllMusicalCoinsLevel]
	inc a
	jp z, Func_d45e1

	play_sfx SFX_03A

	ld hl, wMenuObj1
	ld a, $42
	ld [hli], a ; y
	ld a, $60
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d65f0)
	ld [hli], a
	ld a, LOW(Frameset_d65f0)
	ld [hl], a
	call UpdateObjAnim

	ld hl, wSubState
	inc [hl]
	ret

Func_d4507:
	call DoPencilMovement
	push af
	ld hl, wMenuObj1
	call LoadPencilSprite
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall LoadPauseMenuSprite
	call ClearUnusedVirtualOAM
	pop af
	and a
	ret z

	xor a
	ld [wTimer], a
	play_sfx SFX_03A
	ld hl, wSubState
	inc [hl]
	ret

Func_d454c:
	call DoPencilScribbling

	ld hl, wMenuObj1
	call LoadPencilSprite

	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3YCoord
	farcall LoadPauseMenuSprite
	call ClearUnusedVirtualOAM

	ld hl, wTimer
	inc [hl]
	ld a, [hl]
	cp 52
	jr nc, .done
	cp 20
	ret nz
	ld a, [wAllMusicalCoinsLevel]
	ld e, a
	ld d, $00
	ld hl, MusicalCoinLevelBGPals
	add hl, de
	ld b, [hl]
	ld a, [wAllMusicalCoinsLevel]
	cp NUM_LEVELS - 5
	jr nc, .row_4
	cp NUM_LEVELS - 10
	jr nc, .row_3
	cp NUM_LEVELS - 15
	jr nc, .row_2
	cp NUM_LEVELS - 20
	jr nc, .row_1
; row 0
	hlbgcoord 8, 9
	jr .got_coords
.row_1
	sub 5
	hlbgcoord 8, 10
	jr .got_coords
.row_2
	sub 10
	hlbgcoord 8, 11
	jr .got_coords
.row_3
	sub 15
	hlbgcoord 8, 12
	jr .got_coords
.row_4
	sub 20
	hlbgcoord 8, 13
.got_coords
	ld e, a
	ld d, $00
	add hl, de
	ld d, h
	ld e, l
	ld hl, wBGMapTileVRAM0Queue
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], b
	ld a, $81
	ld [wcee4], a
	ret

.done
	play_sfx SFX_MUSICAL_COIN
;	fallthrough

Func_d45e1:
	xor a
	ld [wTimer + 0], a
	ld a, 2
	ld [wTimer + 1], a
	ld hl, wSubState
	ld [hl], SST_CLEAR_EXIT
	ret

ExitClearScreen:
	ld hl, wMenuObj3FramesetPtr + 1
	farcall $7c, UpdateObjAnim
	ld hl, wMenuObj3
	farcall LoadPauseMenuSprite
	call ClearUnusedVirtualOAM

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .skip_timer
	ld hl, wTimer
	dec [hl]
	ret nz
	ld hl, wTimer + 1
	dec [hl]
	ret nz

.skip_timer
	xor a
	ld [wTimer + 0], a
	ld [wTimer + 1], a
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .asm_d463e
	ld a, [wPowerUpLevel]
	and ACTION_HELP_LEVEL_CLEAR
	jp nz, OpenActionHelp
.asm_d463e
	farcall Func_4628
	ret

Func_d464e:
	ld hl, Pals_d50a4
	call LoadPalsToTempPals1
	ld hl, Pals_d50e4
	call LoadPalsToTempPals2
	ret

Func_d465b:
	xor a
	ldh [rVBK], a
	ld hl, GolfMenuGfx
	ld bc, v0Tiles0
	call Decompress
	ret

Func_d4668:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_d6502
	ld bc, v1BGMap0
	call Decompress
	xor a
	ldh [rVBK], a
	ld hl, BGMap_d63fd
	ld bc, v0BGMap0
	call Decompress
	ret
