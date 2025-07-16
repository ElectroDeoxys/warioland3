_ReturnToPauseMenuFromActionHelp::
	call DisableLCD
	ld hl, wState
	ld a, ST_PAUSE_MENU
	ld [hli], a
	ld [hl], SST_PAUSE_INIT_MENU
	jr InitPauseMenu_SkipBackupVRAM

InitPauseMenu:
	call DisableLCD
	call SaveBackupVRAM
	ld a, [wAnimatedTilesFrameDuration]
	ld [wTempAnimatedTilesFrameDuration], a
	ld a, [wAnimatedTilesGfx]
	ld [wTempAnimatedTilesGroup], a
;	fallthrough

InitPauseMenu_SkipBackupVRAM:
	stop_sfx
	play_music MUSIC_PAUSE_MENU
	xor a ; PAUSEMENU_RETURN
	ld [wPauseMenuSelection], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a
	call ClearBGMap0
	call ClearVirtualOAM

	farcall LoadPauseMenuPals
	farcall LoadPauseMenuGfx
	farcall Func_1f403f

	call PrintNumberMusicCoins
	hlbgcoord 14, 15, v0BGMap1
	farcall PrintNumberCoins
	call VBlank_PauseMenu

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a

	ld hl, wMenuObj2
	ld a, $38
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cb8)
	ld [hli], a
	ld a, LOW(Frameset_1f1cb8)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj2
	call LoadPauseMenuSprite

	ld hl, wMenuObj3
	ld a, $8c
	ld [hli], a
	ld a, $20
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1cd4)
	ld [hli], a
	ld a, LOW(Frameset_1f1cd4)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj3
	call LoadPauseMenuSprite

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	ld a, $54
	ld [hli], a
	ld a, $38
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4a)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4a)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj4
	call LoadPauseMenuSprite

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	ld a, $54
	ld [hli], a
	ld a, $48
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4d)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4d)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj5
	call LoadPauseMenuSprite

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	ld a, $54
	ld [hli], a
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4a)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4a)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj6
	call LoadPauseMenuSprite

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .collected_treasures
	ld hl, wMenuObj7
	ld a, $54
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_1f1c4d)
	ld [hli], a
	ld a, LOW(Frameset_1f1c4d)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj7
	call LoadPauseMenuSprite

.collected_treasures
	ld hl, wMenuObj8
	ld a, $64
	ld [hli], a
	ld a, $38
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit GREY_TREASURE_F, a
	jr z, .no_grey_treasure
	ld a, HIGH(Frameset_1f1cf0)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf0)
	ld [hl], a
	jr .set_grey_treasure_sprite
.no_grey_treasure
	ld a, HIGH(Frameset_1f1ced)
	ld [hli], a
	ld a, LOW(Frameset_1f1ced)
	ld [hl], a
.set_grey_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj8
	call LoadPauseMenuSprite

	ld hl, wMenuObj9
	ld a, $64
	ld [hli], a
	ld a, $48
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit RED_TREASURE_F, a
	jr z, .no_red_treasure
	ld a, HIGH(Frameset_1f1cf6)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf6)
	ld [hl], a
	jr .set_red_treasure_sprite
.no_red_treasure
	ld a, HIGH(Frameset_1f1cf3)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf3)
	ld [hl], a
.set_red_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj9
	call LoadPauseMenuSprite

	ld hl, wMenuObj10
	ld a, $64
	ld [hli], a
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_TREASURE_F, a
	jr z, .no_green_treasure
	ld a, HIGH(Frameset_1f1cf0)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf0)
	ld [hl], a
	jr .set_green_treasure_sprite
.no_green_treasure
	ld a, HIGH(Frameset_1f1ced)
	ld [hli], a
	ld a, LOW(Frameset_1f1ced)
	ld [hl], a
.set_green_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj10
	call LoadPauseMenuSprite

	ld hl, wMenuObj11
	ld a, $64
	ld [hli], a
	ld a, $68
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_TREASURE_F, a
	jr z, .no_blue_treasure
	ld a, HIGH(Frameset_1f1cf6)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf6)
	ld [hl], a
	jr .set_blue_treasure_sprite
.no_blue_treasure
	ld a, HIGH(Frameset_1f1cf3)
	ld [hli], a
	ld a, LOW(Frameset_1f1cf3)
	ld [hl], a
.set_blue_treasure_sprite
	call UpdateObjAnim
	ld hl, wMenuObj11
	call LoadPauseMenuSprite

	ld a, LCDC_ON | LCDC_BG_9C00 | LCDC_OBJ_16 | LCDC_OBJ_ON | LCDC_BG_ON
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret

UpdatePauseMenu:
	call HandlePauseMenuInput
	ld hl, wMenuObj3FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj3
	call LoadPauseMenuSprite
	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	call LoadPauseMenuSprite
.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	call LoadPauseMenuSprite
.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	call LoadPauseMenuSprite
.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .asm_1f02e5
	ld hl, wMenuObj7
	call LoadPauseMenuSprite

.asm_1f02e5
	ld hl, wMenuObj8
	call LoadPauseMenuSprite
	ld hl, wMenuObj8End
	call LoadPauseMenuSprite
	ld hl, wMenuObj10
	call LoadPauseMenuSprite
	ld hl, wMenuObj11
	call LoadPauseMenuSprite
	ld hl, wMenuObj2FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj2
	call LoadPauseMenuSprite

	call ClearUnusedVirtualOAM

	ld a, [wPauseMenuSelection]
	bit PAUSEMENUF_B_PAD_SELECT, a
	ret z
	ld a, [wObjAnimWasReset]
	and a
	ret z
	ld a, [wPauseMenuSelection]
	and $0f
	cp PAUSEMENU_TO_MAP
	jr z, .ToMap
	cp PAUSEMENU_SAVE
	jr z, .Save
	cp PAUSEMENU_ACTION_HELP
	jp z, OpenActionHelp

; Return
	ld hl, wSubState
	inc [hl]
	ret

.ToMap:
	jp ReturnToMapFromLevel

.Save:
	ld a, TRUE
	ld [wResetDisabled], a
	ld a, SST_PAUSE_MENU_SAVE
	ld [wSubState], a
	ret

ExitPauseMenu:
	call DisableLCD
	call ClearVirtualOAM
	call DrawLevelObjectsAfterLevelReturn
	call LoadBackupVRAM

	xor a
	ld [wUnused_IsPaused], a
	ld a, [wTempAnimatedTilesFrameDuration]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [wTempAnimatedTilesGroup]
	ld [wAnimatedTilesGfx], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a

	call UpdateLevelMusic
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
