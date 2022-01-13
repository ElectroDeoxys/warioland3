_GolfStateTable:: ; 1c8000 (72:4000)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitGolfLobby
	dw SlowFadeFromWhite
	dw HandleGolfLobby
	dw FastFadeToWhite
	dw Func_1c8965
	dw SlowFadeFromWhite
	dw Func_1c8ca4
	dw FastFadeToWhite
	dw Func_13d5
	dw FastFadeToWhite
	dw Func_1c846c
	dw SlowFadeFromWhite
	dw Func_1c84f9
; 0x1c8020

InitGolfLobby: ; 1c8020 (72:4020)
	call DisableLCD
	call ClearWholeVirtualOAM
	ld a, [w1d800]
	and a
	call z, SaveBackupVRAM
	ld a, $02
	ld [w1d800], a
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	ld hl, wPredeterminedGolfLevel
	ld bc, wGolfRAMEnd - wPredeterminedGolfLevel
.loop_clear
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop_clear

	ld hl, Pals_1ca1cf
	call LoadPalsToTempPals1
	ld hl, Pals_1ca20f
	call LoadPalsToTempPals2

	call .LoadGolfLobby

	ld a, [wGolfMenuOption]
	and a
	jr nz, .asm_1c8069
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $90
	ld [wGolfYPos], a
	ld a, $38
	ld [wGolfXPos], a
	jr .asm_1c807d
.asm_1c8069
	ld a, GOLF_WARIO_GOING_IN_PIPE
	ld [wGolfWarioState], a
	ld a, $a0
	ld [wGolfYPos], a
	ld a, $80
	ld [wGolfXPos], a
	ld a, GOLFLOBBY_ST_EXIT_PIPE
	ld [WGolfLobbyState], a

.asm_1c807d
	call HandleGolfLobbyWarioSprite

	xor a
	ld [wGolfMenuOption], a
	ld a, [wNumCoins + 0]
	ld [wGolfNumCoins + 0], a
	ld a, [wNumCoins + 1]
	ld [wGolfNumCoins + 1], a

	ld a, [wNumCoins + 0]
	and a
	jr nz, .enough_coins
	ld a, [wGolfPrice]
	ld c, a
	ld a, [wNumCoins + 1]
	cp c
	jr nc, .enough_coins
	ld a, COININFO_NOT_ENOUGH_COINS
	ld [wGolfObj4State], a
.enough_coins
	ld a, $01
	ld [wGolfVBlankMode], a
	call GolfLobbyVBlank

	play_music2 MUSIC_GOLF_MENU

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a

	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1c80cd

; loads all the gfx in the Golf Lobby
; and determines the price tier,
; corresponding to the number of treasures
.LoadGolfLobby:
	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld hl, BGMaps_1c5b4e
	push hl
	ld hl, BGMaps_1c5cbe
	push hl
	ld hl, GolfLobbyGfx

	ld bc, v0Tiles1
	xor a
	ldh [rVBK], a
	call FarDecompress

	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	pop hl
	ld bc, v1BGMap0
	call FarDecompress

	xor a
	ldh [rVBK], a
	pop hl
	ld bc, v0BGMap0
	call FarDecompress

	ld a, [wNumberCollectedTreasures + 0]
	and a
	jr nz, .tier_3
	ld a, [wNumberCollectedTreasures + 1]
	cp GOLF_TREASURES_TIER_3
	jr nc, .tier_3
	cp GOLF_TREASURES_TIER_2
	jr nc, .tier_2
; tier 1
	ld a, GOLF_PRICE_TIER_1
	ld [wGolfPrice], a
	ret
.tier_2
	ld a, GOLF_PRICE_TIER_2
	ld [wGolfPrice], a
	lb de, $f8, $f9
	lb bc, $fa, $fb
	jr .got_price
.tier_3
	ld a, GOLF_PRICE_TIER_3
	ld [wGolfPrice], a
	lb de, $fc, $fd
	lb bc, $fe, $ff
.got_price
	ld a, d
	ld [v0BGMap0 + $10b], a
	ld a, e
	ld [v0BGMap0 + $12b], a
	ld a, b
	ld [v0BGMap0 + $10c], a
	ld a, c
	ld [v0BGMap0 + $12c], a
	ret
; 0x1c8140

HandleGolfLobby: ; 1c8140 (72:4140)
	call HandleGolfLobbyStates
	call UpdateGolfLobbyAnimations
	call HandleGolfLobbyWarioSprite
	call ClearVirtualOAM
	jp GolfLobbyVBlank
; 0x1c814f

UpdateGolfLobbyAnimations: ; 1c814f (72:414f)
	ld a, HIGH(OAM_1cb2d3)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1cb2d3)
	ld [wGolfOAMPtr + 1], a
	ld a, $28
	ld [wGolfObj1YCoord], a
	ld a, $24
	ld [wGolfObj1XCoord], a
	ld de, Frameset_1cb3b3
	ld hl, wGolfObj1Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj1CurrentFrame]
	ld [wGolfObj1Frame], a
	ld hl, wGolfObj1Sprite
	call AddGolfSprite

	ld a, $2d
	ld [wGolfObj3YCoord], a
	ld a, $8c
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1cb3c4
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite

	ld a, $60
	ld [wGolfObj5YCoord], a
	ld a, $28
	ld [wGolfObj5XCoord], a
	ld de, Frameset_1cb3d7
	ld hl, wGolfObj5Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj5CurrentFrame]
	ld [wGolfObj5Frame], a
	ld hl, wGolfObj5Sprite
	call AddGolfSprite

	ld a, [wGolfObj4State]
	cp COININFO_SHOW_MESSAGE
	ret nz
	ld a, $50
	ld [wGolfObj4YCoord], a
	ld a, $38
	ld [wGolfObj4XCoord], a
	ld a, [wLanguage]
	and a
	jr nz, .english
	ld de, Frameset_1cb3d4
	jr .asm_1c81d4
.english
	ld de, Frameset_1cb3d1
.asm_1c81d4
	ld hl, wGolfObj4Duration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr z, .asm_1c81e4
	ld a, COININFO_NOT_ENOUGH_COINS
	ld [wGolfObj4State], a
	ret
.asm_1c81e4
	ld a, [wGolfObj4CurrentFrame]
	ld [wGolfObj4Frame], a
	ld hl, wGolfObj4Sprite
	jp AddGolfSprite
; 0x1c81f0

HandleGolfLobbyWarioSprite: ; 1c81f0 (72:41f0)
	ld a, [wGolfYPos]
	ld [wGolfWarioYCoord], a
	ld a, [wGolfXPos]
	ld [wGolfWarioXCoord], a
	call UpdateGolfWarioAnimation
	call LoadGolfWarioStateGfx

	; if Wario is walking, play walk sfx
	; if it's the first frame
	ld a, [wGolfWarioState]
	cp GOLF_WARIO_WALKING
	ret nz
	ld a, [wGolfWarioFramesetOffset]
	cp $02
	ret nz
	ld a, [wGolfWarioDuration]
	and a
	ret nz
	play_sfx SFX_WALK
	ret
; 0x1c821c

HandleGolfLobbyStates: ; 1c821c (72:421c)
	ld a, [WGolfLobbyState]
	jumptable
	dw .WaitingInput ; GOLFLOBBY_ST_WAIT_INPUT
	dw .WalkingRight ; GOLFLOBBY_ST_WALK_RIGHT
	dw .WalkingLeft  ; GOLFLOBBY_ST_WALK_LEFT
	dw .EnteringPipe ; GOLFLOBBY_ST_ENTER_PIPE
	dw .EnteringDoor ; GOLFLOBBY_ST_ENTER_DOOR
	dw .ExitingPipe  ; GOLFLOBBY_ST_EXIT_PIPE

.WaitingInput
	ld a, [wJoypadPressed]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.d_up
	ld a, [wGolfWarioXCoord]
	cp $38
	ret nz

	play_sfx SFX_0E6

	xor a
	ld [wGolfWarioDir], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_TURNING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ld a, GOLFLOBBY_ST_ENTER_DOOR
	ld [WGolfLobbyState], a
	ret

.d_right
	ld a, [wGolfWarioXCoord]
	cp $78
	ret nc
	xor a
	ld [wGolfWarioDir], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_TURNING
	ld [wGolfWarioState], a
	ld a, $04
	ld [wGolfYVel], a
	ld a, $01 ; aka GOLFLOBBY_ST_WALK_RIGHT
	ld [wGolfVBlankMode], a
	ld [WGolfLobbyState], a
	ret

.d_left
	ld a, [wGolfWarioXCoord]
	cp $78
	ret c
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_TURNING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ld [wGolfWarioDir], a
	ld a, GOLFLOBBY_ST_WALK_LEFT
	ld [WGolfLobbyState], a
	ret

.d_down
	ld a, [wGolfWarioXCoord]
	cp $78
	ret nz
	ld a, [wGolfObj4State]
	and a
	jr z, .enough_coins
	play_sfx SFX_0E5
	ld a, COININFO_SHOW_MESSAGE
	ld [wGolfObj4State], a
	xor a
	ld [wGolfObj4Duration], a
	ld [wGolfObj4FramesetOffset], a
	ret

.enough_coins
	play_sfx SFX_PIPE
	ld a, [wGolfPrice]
	ld c, a
	ld a, [wNumCoins + 1]
	sub c
	daa
	ld [wNumCoins + 1], a
	ld a, [wNumCoins + 0]
	sbc 0
	ld [wNumCoins + 0], a

	ld a, GOLF_WARIO_GOING_IN_PIPE
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ld a, $80
	ld [wGolfXPos], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLFLOBBY_ST_ENTER_PIPE
	ld [WGolfLobbyState], a
	ret

.WalkingRight
	; check if still doing turning animation
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	ret z
	cp $02
	jr nc, .walk_right
	; done turning, start walking
	inc [hl]
	xor a
	ld [wGolfWarioDir], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_WALKING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ret

.walk_right
	ld a, [wGolfXPos]
	cp $58
	call nc, .DoJumpRight
	ld hl, wGolfXPos
	ld a, [hl]
	cp $78
	jr nc, .reached_pipe
	inc [hl]
	ret
.reached_pipe
	ld a, $80
	ld [wGolfYPos], a
	ld a, $78
	ld [wGolfXPos], a
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [WGolfLobbyState], a ; GOLFLOBBY_ST_WAIT_INPUT
	ret

.DoJumpRight
	ld hl, wGolfYVel
	ld c, [hl]
	ld a, [wGolfCounter]
	inc a
	ld [wGolfCounter], a
	and $1
	jr nz, .skip_decr_y_vel
	dec [hl] ; decrease y vel
.skip_decr_y_vel
	; apply y vel to position
	ld de, wGolfYPos
	ld a, [de]
	sub c
	ld [de], a
	ld a, c
	cp -16
	ret c
	; cap y pos
	ld a, [de]
	cp $80
	ret c
	ld a, $80
	ld [de], a
	ret

.WalkingLeft
	; check if still doing turning animation
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	ret z
	cp $02
	jr nc, .walk_left
	; done turning, start walking
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_WALKING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ret

.walk_left
	ld de, wGolfYPos
	ld a, [de]
	cp $90
	call c, .DoJumpLeft
	ld hl, wGolfXPos
	ld a, [hl]
	cp $38
	jr z, .reached_door
	dec [hl]
	ret
.reached_door
	ld a, $90
	ld [wGolfYPos], a
	ld a, $38
	ld [wGolfXPos], a
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [WGolfLobbyState], a ; GOLFLOBBY_ST_WAIT_INPUT
	ret

.DoJumpLeft
	ld a, [wGolfXPos]
	cp $64
	ret nc
	ld a, [de]
	add $02
	ld [de], a
	ret

.EnteringPipe
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	jr nz, .asm_1c83ed
	inc [hl]
	ld hl, wGolfNumCoins + 1
	ld a, [wNumCoins + 1]
	ld [hld], a
	ld a, [wNumCoins + 0]
	ld [hl], a
.asm_1c83ed
	ld hl, wGolfYPos
	ld a, [hl]
	cp $b0
	jr nc, .asm_1c83f7
	inc [hl]
	ret
.asm_1c83f7
	ld a, SST_GOLF_04
	ld [wSubState], a
	ret

.EnteringDoor
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	ret z
	cp $01
	jr z, .asm_1c840d
	cp $1c
	jr nc, .asm_1c8420
	inc [hl]
	ret
.asm_1c840d
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_9
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ret
.asm_1c8420
	xor a
	ld [w1d800], a
	ld [wGolfMenuOption], a
	stop_music2
	ld a, SST_GOLF_08
	ld [wSubState], a
	ret

.ExitingPipe
	ld hl, wGolfYPos
	ld a, [hl]
	cp $80
	jr z, .asm_1c844f
	cp $a0
	jr nz, .asm_1c844d
	play_sfx SFX_PIPE
.asm_1c844d
	dec [hl]
	ret
.asm_1c844f
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $78
	ld [wGolfXPos], a
	ld a, $01
	ld [wGolfVBlankMode], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [WGolfLobbyState], a ; GOLFLOBBY_ST_WAIT_INPUT
	ret
; 0x1c846c

Func_1c846c: ; 1c846c (72:446c)
	call DisableLCD
	call ClearWholeVirtualOAM

	ld hl, wGolfRAMStart
	ld bc, wGolfRAMEnd - wGolfRAMStart
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop

	ld hl, Pals_1ca24f
	call LoadPalsToTempPals1
	ld hl, Pals_1ca34f
	call LoadPalsToTempPals2

	call LoadGolfMenu
	ld a, $70
	ld [wGolfObj1YCoord], a
	call Func_1c853e
	call VBlank_1c84e0

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a

	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1c84ad

LoadGolfMenu: ; 1c84ad (72:44ad)
	ld a, BANK(GolfMenuGfx)
	ld [wTempBank], a
	ld hl, BGMaps_1c5d6c
	push hl
	ld hl, BGMaps_1c5dc6
	push hl
	ld hl, GolfMenuGfx

	ld bc, v0Tiles0
	xor a
	ldh [rVBK], a
	call FarDecompress

	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	pop hl
	ld bc, v0BGMap0
	call FarDecompress

	xor a
	ldh [rVBK], a
	pop hl
	ld bc, v0BGMap0
	jp FarDecompress
; 0x1c84e0

VBlank_1c84e0: ; 1c84e0 (72:44e0)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c84f9

Func_1c84f9: ; 1c84f9 (72:44f9)
	ld hl, wGolfCounter
	ld a, [wGolfObj1State]
	and a
	jr nz, .asm_1c8530
	ld a, [wGolfObj1YCoord]
	cp $50
	jr z, .asm_1c8525
	ld a, [hl]
	and $0f
	jr nz, .asm_1c8516
	play_sfx SFX_01F
.asm_1c8516
	inc [hl]
	ld a, [hl]
	and $03
	jr nz, Func_1c853e
	ld a, [wGolfObj1YCoord]
	dec a
	ld [wGolfObj1YCoord], a
	jr Func_1c853e

.asm_1c8525
	xor a
	ld [hl], a
	ld [wGolfObj1FramesetOffset], a
	inc a
	ld [wGolfObj1State], a
	jr Func_1c853e

.asm_1c8530
	ld a, [hl]
	cp $40
	jr nc, .asm_1c8538
	inc [hl]
	jr Func_1c853e

.asm_1c8538
	ld a, SST_GOLF_08
	ld [wSubState], a
	ret
; 0x1c853e

Func_1c853e: ; 1c853e (72:453e)
	ld a, HIGH(OAM_1cb3e0)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1cb3e0)
	ld [wGolfOAMPtr + 1], a
	ld a, [wGolfObj1State]
	and a
	jr nz, .asm_1c8553
	ld de, Frameset_1cb5cf
	jr .asm_1c8556
.asm_1c8553
	ld de, Frameset_1cb5cc
.asm_1c8556
	ld hl, wGolfObj1Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj1CurrentFrame]
	ld [wGolfObj1Frame], a
	ld a, $58
	ld [wGolfObj1XCoord], a
	ld hl, wGolfObj1Sprite
	call AddGolfSprite
	jp ClearVirtualOAM
; 0x1c8570

_GolfBuildingStateTable:: ; 1c8570 (72:4570)
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw Func_1c8586
	dw SlowFadeFromWhite
	dw Func_1c86dd
	dw FastFadeToWhite
	dw Func_1c8965
	dw SlowFadeFromWhite
	dw Func_1c8ca4
	dw ReturnToMap
; 0x1c8586

Func_1c8586: ; 1c8586 (72:4586)
	call DisableLCD
	call ClearWholeVirtualOAM
	ld a, $08
	ld [wAnimatedTilesFrameDuration], a
	ld a, $0f
	ld [wAnimatedTilesGroup], a
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	inc a
	ld [wRoomAnimatedTilesEnabled], a
	ld a, [w1d800]
	and a
	call z, SaveBackupVRAM

	ld a, [wGolfMenuOption]
	and a
	jr nz, .asm_1c85b3
	ld a, $01
	ld [w1d800], a
.asm_1c85b3
	ld hl, wPredeterminedGolfLevel
	ld bc, $7fe
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop

	call CheckHasAllMusicalCoinFlags
	ld [wHasAllMusicalCoinFlags], a

	call Func_1c8604
	ld hl, w1db00
	call LoadPalsToTempPals1
	ld hl, Pals_1ca34f
	call LoadPalsToTempPals2

	ld a, [wNumCoins + 0]
	ld [wGolfNumCoins + 0], a
	ld a, [wNumCoins + 1]
	ld [wGolfNumCoins + 1], a

	call Func_1c86f8
	call Func_1c9fae

	ld bc, MUSIC_GOLF_MENU
	call Func_fe6

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ld a, [wGolfMenuTargetSCX]
	ldh [rSCX], a
	ld [wSCX], a
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret
; 0x1c8604

Func_1c8604: ; 1c8604 (72:4604)
	ld a, BANK(GolfMenuGfx)
	ld [wTempBank], a
	xor a
	ldh [rVBK], a
	ld hl, GolfMenuGfx
	ld bc, v0Tiles0
	call FarDecompress

	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMaps_1c4ea8
	ld bc, v1BGMap0
	call FarDecompress

	ld a, [wGolfMenuOption]
	ld [wGolfCourse], a
	call Func_1c87db
	call GetGolfCourseTargetSCX
	ld hl, w1d900
	ld de, v1BGMap0 + $c0
	ld b, $e0
	call CopyHLToDE

	xor a
	ldh [rVBK], a
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .has_all_musical_coins
	ld hl, BGMaps_1c4c60
	jr .asm_1c864f
.has_all_musical_coins
	ld hl, BGMaps_1c4d83
.asm_1c864f
	ld bc, v0BGMap0
	call FarDecompress

	ld hl, wGolfBestScores
	ld de, v0BGMap0 + $1a2
.loop_courses
	ld a, [hl]
	cp golf_score 100
	jp nc, .invalid_score ; score >= 100
	cp golf_score 1
	jr nc, .positive_score ; score > 0
	cp golf_score 0
	jr z, .zero_score

; negative score
	ld a, $d4
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, $d5
	ld [de], a
	ld a, GOLF_BASE_SCORE
	sub [hl]
	ld c, a
	jr .calculate_digits

.positive_score
	ld a, $d2
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, $d3
	ld [de], a
	ld a, [hl]
	sub $14
	ld c, a

.calculate_digits
	ld b, 0
.loop
	cp 10
	jr c, .got_digits
	sub 10
	ld c, a
	inc b
	jr .loop

.got_digits
	; b = tens digit
	; c = ones digit
	ld a, e
	sub BG_MAP_WIDTH - 1
	ld e, a
	ld a, b
	add a ; *2
	add $a0
	ld b, a
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, b
	inc a
	ld [de], a
	ld a, e
	sub BG_MAP_WIDTH - 1
	ld e, a
	ld a, c
	add a ; *2
	add $a0
	ld c, a
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, c
	inc a
	ld [de], a

	; next course
	ld a, l
	cp LOW(wGolfBestScores) + NUM_GOLF_COURSES - 1
	ret z
	inc hl
	ld a, e
	sub $1a
	ld e, a
	jp .loop_courses

.zero_score
	lb bc, 0, 0
	ld a, $be
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	ld a, $bf
	ld [de], a
	jr .got_digits

.invalid_score
	lb bc, 10, 10
	xor a
	ld [de], a
	ld a, e
	add BG_MAP_WIDTH
	ld e, a
	xor a
	ld [de], a
	jr .got_digits
; 0x1c86dd

Func_1c86dd: ; 1c86dd (72:46dd)
	call Func_1c882b
	call Func_1c86f8
	call ClearVirtualOAM
	ld a, [wSubState]
	cp $08
	jp nz, Func_1c9fae
	xor a
	ld [w1d800], a
	ld [wGolfMenuOption], a
	jp Func_1c9fae
; 0x1c86f8

Func_1c86f8: ; 1c86f8 (72:46f8)
	ld a, HIGH(OAM_1cb3e0)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1cb3e0)
	ld [wGolfOAMPtr + 1], a
	ld a, $42
	ld [wGolfObj1YCoord], a
	ld a, $58
	ld [wGolfObj1XCoord], a
	ld de, Frameset_1cb59b
	ld hl, wGolfObj1Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj1CurrentFrame]
	ld [wGolfObj1Frame], a
	ld hl, wGolfObj1Sprite
	call AddGolfSprite

	ld a, $2a
	ld [wGolfObj3YCoord], a
	ld a, $58
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1cb598
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite
	ld a, $a0
	ld [wGolfObj4YCoord], a
	ld a, $58
	ld [wGolfObj4XCoord], a
	ld de, Frameset_1cb59e
	ld hl, wGolfObj4Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj4CurrentFrame]
	ld [wGolfObj4Frame], a
	ld hl, wGolfObj4Sprite
	call AddGolfSprite

	ld a, [w1dc00]
	and a
	ret nz
	ld a, $76
	ld [wGolfObj5YCoord], a
	ld a, $6c
	ld [wGolfObj5XCoord], a
	ld de, Frameset_1cb5a1
	ld hl, wGolfObj5Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj5CurrentFrame]
	ld [wGolfObj5Frame], a
	ld hl, wGolfObj5Sprite
	call AddGolfSprite

	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, $76
	ld [wGolfWarioYCoord], a
	ld a, $6c
	ld [wGolfWarioXCoord], a
	ld hl, .framesets
	ld a, [wGolfMenuOption]
	add a
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wGolfWarioDuration
	call UpdateGolfObjectAnimation

	ld a, [wGolfWarioCurrentFrame]
	ld [wGolfWarioFrame], a
	ld hl, wGolfWarioSprite
	call AddGolfSprite

	ld a, $50
	ld [wGolfObj6YCoord], a
	ld a, $55
	ld [wGolfObj6XCoord], a
	ld de, Frameset_1cb5c3
	ld hl, wGolfObj6Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj6CurrentFrame]
	ld [wGolfObj6Frame], a
	ld hl, wGolfObj6Sprite
	jp AddGolfSprite

.framesets
	dw Frameset_1cb5d8
	dw Frameset_1cb5db
	dw Frameset_1cb5de
	dw Frameset_1cb5e1
; 0x1c87db

; loads attribute map to w1d900
; and palettes to w1db00
; depending on value in wGolfCourse
Func_1c87db: ; 1c87db (72:47db)
	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld hl, .data
	ld a, [wGolfCourse]
	add a
	add a ; *4
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, d
	ld l, e
	ld de, w1d900
	ld bc, $e0
	call FarCopyHLToDE_BC2
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, w1db00
	ld b, 8 palettes
	jp CopyHLToDE

.data
	dw BGMaps_1c48e0, Pals_1ca24f ; GOLF_COURSE_1
	dw BGMaps_1c49c0, Pals_1ca28f ; GOLF_COURSE_2
	dw BGMaps_1c4aa0, Pals_1ca2cf ; GOLF_COURSE_3
	dw BGMaps_1c4b80, Pals_1ca30f ; GOLF_COURSE_4
; 0x1c8818

; gets the golf course scroll X value
; and writes it as the target SCX
GetGolfCourseTargetSCX: ; 1c8818 (72:4818)
	ld hl, .scroll_x
	ld a, [wGolfCourse]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wGolfMenuTargetSCX], a
	ret

.scroll_x
	db $cc ; GOLF_COURSE_1
	db $0c ; GOLF_COURSE_2
	db $4c ; GOLF_COURSE_3
	db $8c ; GOLF_COURSE_4
; 0x1c882b

Func_1c882b: ; 1c882b (72:482b)
	ld a, [w1dc00]
	jumptable
	dw Func_1c8837
	dw Func_1c88dc
	dw Func_1c8907
	dw Func_1c8911
; 0x1C8837

Func_1c8837: ; 1c8837 (72:4837)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit B_BUTTON_F, a
	jr nz, .b_btn
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.a_btn
	ld a, [wNumCoins + 0]
	and a
	jr nz, .enough_coins
	ld a, [wNumCoins + 1]
	cp GOLF_BUILDING_PRICE
	jr nc, .enough_coins
	play_sfx SFX_0E5
	ret
.enough_coins
	ld a, [wNumCoins + 1]
	sub GOLF_BUILDING_PRICE
	daa
	ld [wNumCoins + 1], a
	ld a, [wNumCoins + 0]
	sbc 0
	ld [wNumCoins + 0], a
	ld a, $03
	ld [w1dc00], a
	ret

.b_btn
	ld a, $08
	ld [wSubState], a
	ret

.d_right
	xor a
	ld [wGolfMenuScrollingDir], a
	ld hl, wGolfMenuOption
	ld a, [hl]
	cp GOLF_COURSE_4
	jr z, .wrap_around_right
	cp GOLF_COURSE_3
	jr nz, .scroll_right
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .scroll_right
.wrap_around_right
	ld [hl], GOLF_COURSE_1
	jr .scrolling
.scroll_right
	inc [hl]
	jr .scrolling

.d_left
	ld a, $1
	ld [wGolfMenuScrollingDir], a
	ld hl, wGolfMenuOption
	ld a, [hl]
	and a
	jr nz, .scroll_left
	ld a, [wHasAllMusicalCoinFlags]
	and a
	jr nz, .wrap_around_left
	ld [hl], GOLF_COURSE_3
	jr .scrolling
.wrap_around_left
	ld [hl], GOLF_COURSE_4
	jr .scrolling
.scroll_left
	dec [hl]

.scrolling
	play_sfx SFX_0E2
	ld a, $01
	ld [w1dc00], a
	ld [wGolfVBlankMode], a
	ld a, [hl]
	ld [wGolfCourse], a
	call Func_1c87db
	ld hl, BGMaps_1c4800
	ld de, w1da00
	ld bc, $e0
	call FarCopyHLToDE_BC2
	jp GetGolfCourseTargetSCX
; 0x1c88dc

Func_1c88dc: ; 1c88dc (72:48dc)
	ld a, [wGolfMenuTargetSCX]
	ld c, a
	ld a, [wGolfMenuScrollingDir]
	and a
	jr nz, .left
; right
	ld a, [wSCX]
	cp c
	jr z, .reached_target_scx
	add $4
	ld [wSCX], a
	ret
.left
	ld a, [wSCX]
	cp c
	jr z, .reached_target_scx
	sub $4
	ld [wSCX], a
	ret

.reached_target_scx
	ld a, $02
	ld [w1dc00], a
	ld [wGolfVBlankMode], a
	ret
; 0x1c8907

Func_1c8907: ; 1c8907 (72:4907)
	xor a
	ld [w1dc00], a
	ld a, $03
	ld [wGolfVBlankMode], a
	ret
; 0x1c8911

Func_1c8911: ; 1c8911 (72:4911)
	ld hl, wGolfCounter
	ld a, [hl]
	cp $32 ; aka GOLF_BUILDING_PRICE in hex
	jr nc, .done_subtracting
	inc [hl]
	and $03
	jr nz, .skip_sfx
	play_sfx SFX_12B
.skip_sfx
	ld hl, wGolfNumCoins + 1
	ld a, [hl]
	sub 1
	daa
	ld [hld], a
	ld a, [hl]
	sbc 0
	ld [hl], a
	ret
.done_subtracting
	play_sfx SFX_0E3
	call .Func_1c8944
	ld a, $04
	ld [wSubState], a
	ret

.Func_1c8944
	ld hl, .first_golf_levels
	ld a, [wGolfMenuOption]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wPredeterminedGolfLevel], a
	ret

.first_golf_levels
	db GOLF_LEVEL_00 + $1 ; GOLF_COURSE_1
	db GOLF_LEVEL_05 + $1 ; GOLF_COURSE_2
	db GOLF_LEVEL_10 + $1 ; GOLF_COURSE_3
	db GOLF_LEVEL_15 + $1 ; GOLF_COURSE_4
; 0x1c8957

; unreferenced?
Func_1c8957: ; 1c8957 (72:4957)
	ld a, [wSubState]
	jumptable
	dw FastFadeToWhite
	dw Func_1c8965
	dw SlowFadeFromWhite
	dw Func_1c8ca4
	dw Func_1c8fb7
; 0x1c8965

Func_1c8965: ; 1c8965 (72:4965)
	call DisableLCD
	call ClearWholeVirtualOAM
	xor a
	ld [wRoomAnimatedTilesEnabled], a

	ld hl, wGolfLevelRAMStart
	ld bc, wGolfRAMEnd - wGolfLevelRAMStart
	xor a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	ld hl, .GolfCoursePals
	ld a, [wGolfMenuOption]
	add a ; *2
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call LoadPalsToTempPals1
	ld hl, Pals_1ca18f
	call LoadPalsToTempPals2

	ld a, BANK("Golf Gfx 1")
	ld [wTempBank], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, GolfFlagGfx
	ld bc, v1Tiles0
	call FarDecompress
	xor a
	ldh [rVBK], a
	ld hl, GolfGfx
	ld bc, v0Tiles1
	call FarDecompress

	ld a, BANK(WarioIdleGfx)
	ld [wTempBank], a
	ld hl, WarioIdleGfx
	ld de, v0Tiles0
	ld bc, $80 tiles
	call FarCopyHLToDE_BC2

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a
	ldh [rWY], a
	ld a, $a6
	ldh [rWX], a
	ld [w1dc25], a

	call Func_1c89fa
	call Func_1c9cf9
	play_music2 MUSIC_GOLF

	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

.GolfCoursePals
	dw Pals_1ca08f
	dw Pals_1ca0cf
	dw Pals_1ca10f
	dw Pals_1ca14f
; 0x1c89fa

Func_1c89fa: ; 1c89fa (72:49fa)
	call Func_1c8a03
	call Func_1c8b8b
	jp Func_1c8c33
; 0x1c8a03

Func_1c8a03: ; 1c8a03 (72:4a03)
	ld a, BANK("Golf Gfx 1")
	ld [wTempBank], a
	ld a, [wPredeterminedGolfLevel]
	and a
	jr z, .no_predetermined_golf_level
	dec a
	ld c, a
	jr .got_golf_level
.no_predetermined_golf_level
; tier 3
	ld a, GOLF_LEVEL_TIER_3
	ld [w1dc0e], a
	ld a, [wNumberCollectedTreasures + 0]
	and a
	jr nz, .got_tier
	ld a, [wNumberCollectedTreasures + 1]
	cp GOLF_TREASURES_TIER_3
	jr nc, .got_tier
	cp GOLF_TREASURES_TIER_2
	jr nc, .tier_2
; tier 1
	ld a, GOLF_LEVEL_TIER_1
	ld [w1dc0e], a
	jr .got_tier
.tier_2
	ld a, GOLF_LEVEL_TIER_2
	ld [w1dc0e], a

.got_tier
	ld a, [w1dc0e]
	ld b, a
	ldh a, [rDIV]
	ld c, a
.loop_division
	sub b
	jr c, .got_golf_level
	ld c, a ; remainder
	jr .loop_division

.got_golf_level
	ld hl, .GolfLevels
	ld a, c
	and a
	jr z, .got_golf_level_data
	ld de, GOLF_LEVEL_STRUCT_LENGTH
.loop_get_data
	add hl, de
	dec c
	jr nz, .loop_get_data
.got_golf_level_data
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld bc, v1BGMap0 + $e0
	call FarDecompress
	ld hl, BGMap_1c1651
	ld bc, v1BGMap0
	call FarDecompress
	pop hl
	ld bc, v1BGMap1 + $e0
	call FarDecompress
	ld hl, BGMap_1c1716
	ld bc, v1BGMap1
	call FarDecompress

	xor a
	ldh [rVBK], a
	pop hl
	ld bc, v0BGMap0 + $e0
	call FarDecompress
	ld hl, BGMap_1c15c5
	ld bc, v0BGMap0
	call FarDecompress
	pop hl
	ld bc, v0BGMap1 + $e0
	call FarDecompress
	ld hl, BGMap_1c168a
	ld bc, v0BGMap1
	call FarDecompress
	pop hl

	ld de, wGolfTerrain
	ld bc, $46
	call FarCopyHLToDE_BC2
	ld a, [w1db82]
	ld [w1dc38], a
	ld a, [w1db83]
	ld [w1dc39], a
	ret

.GolfLevels
	dw GolfLevel00, BGMap_1c18fd, BGMap_1c1869, BGMap_1c1973, BGMap_1c18be ; GOLF_LEVEL_00
	dw GolfLevel01, BGMap_1c1824, BGMap_1c1756, BGMap_1c1850, BGMap_1c17c6 ; GOLF_LEVEL_01
	dw GolfLevel02, BGMap_1c2287, BGMap_1c21e7, BGMap_1c2303, BGMap_1c224f ; GOLF_LEVEL_02
	dw GolfLevel03, BGMap_1c2819, BGMap_1c277e, BGMap_1c288c, BGMap_1c27cc ; GOLF_LEVEL_03
	dw GolfLevel04, BGMap_1c2aaf, BGMap_1c2a45, BGMap_1c2b03, BGMap_1c2a73 ; GOLF_LEVEL_04
	dw GolfLevel05, BGMap_1c1d24, BGMap_1c1c82, BGMap_1c1d7a, BGMap_1c1cd8 ; GOLF_LEVEL_05
	dw GolfLevel06, BGMap_1c1bc6, BGMap_1c1b2c, BGMap_1c1c2b, BGMap_1c1b78 ; GOLF_LEVEL_06
	dw GolfLevel07, BGMap_1c1e6e, BGMap_1c1dd0, BGMap_1c1ed2, BGMap_1c1e25 ; GOLF_LEVEL_07
	dw GolfLevel08, BGMap_1c1ffd, BGMap_1c1f18, BGMap_1c2047, BGMap_1c1f8f ; GOLF_LEVEL_08
	dw GolfLevel09, BGMap_1c2970, BGMap_1c28e3, BGMap_1c29e1, BGMap_1c292c ; GOLF_LEVEL_09
	dw GolfLevel10, BGMap_1c1a80, BGMap_1c19c5, BGMap_1c1ae5, BGMap_1c1a1c ; GOLF_LEVEL_10
	dw GolfLevel11, BGMap_1c26ad, BGMap_1c25f8, BGMap_1c2725, BGMap_1c2656 ; GOLF_LEVEL_11
	dw GolfLevel12, BGMap_1c2bdd, BGMap_1c2b55, BGMap_1c2c41, BGMap_1c2b9b ; GOLF_LEVEL_12
	dw GolfLevel13, BGMap_1c210b, BGMap_1c2084, BGMap_1c218e, BGMap_1c20c9 ; GOLF_LEVEL_13
	dw GolfLevel14, BGMap_1c2e88, BGMap_1c2ddc, BGMap_1c2efc, BGMap_1c2e39 ; GOLF_LEVEL_14
	dw GolfLevel15, BGMap_1c2ffc, BGMap_1c2f55, BGMap_1c3062, BGMap_1c2fa8 ; GOLF_LEVEL_15
	dw GolfLevel16, BGMap_1c25b6, BGMap_1c24db, BGMap_1c25e5, BGMap_1c254d ; GOLF_LEVEL_16
	dw GolfLevel17, BGMap_1c2d30, BGMap_1c2c9e, BGMap_1c2d93, BGMap_1c2cec ; GOLF_LEVEL_17
	dw GolfLevel18, BGMap_1c2410, BGMap_1c2361, BGMap_1c247d, BGMap_1c23bc ; GOLF_LEVEL_18
	dw GolfLevel19, BGMap_1c316a, BGMap_1c30b7, BGMap_1c31e4, BGMap_1c3119 ; GOLF_LEVEL_19
; 0x1c8b8b

Func_1c8b8b: ; 1c8b8b (72:4b8b)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [w1d800]
	cp $02
	jr z, .asm_1c8ba3
	ld a, [wGolfPar]
	add MAX_GOLF_COURSE_STROKES
	ld [wGolfMaxStrokes], a
	ld a, [w1d803]
	jr .asm_1c8bad
.asm_1c8ba3
	ld a, [wGolfPar]
	ld [wGolfMaxStrokes], a
	ld a, [wGolfPar]
	dec a
.asm_1c8bad
	ld hl, GolfFlagNumbersGfx
	swap a ; *$10
	ld b, $00
	ld c, a
	add hl, bc
	ld de, v1Tiles0 tile $01
	ld b, 1 tiles
	call CopyHLToDE

	ld hl, GolfParNumbersGfx
	ld a, [wGolfPar]
	dec a
	swap a ; *$10
	sub 2 tiles
	ld c, a
	add hl, bc
	ld de, v1Tiles0 tile $2b
	ld b, 1 tiles
	call CopyHLToDE
	ld hl, GolfParNumbersGfx
	add hl, bc
	ld de, v1Tiles0 tile $4b
	ld b, 1 tiles
	call CopyHLToDE
	ld hl, GolfParNumbersGfx
	add hl, bc
	ld de, v1Tiles0 tile $6b
	ld b, 1 tiles
	call CopyHLToDE
	ld hl, GolfParNumbersGfx
	add hl, bc
	ld de, v1Tiles0 tile $8b
	ld b, 1 tiles
	call CopyHLToDE

	ld a, [w1d800]
	cp $02
	jr z, .stroke_number
	ld hl, GolfHoleFlagGfx
	ld de, v1Tiles0 tile $20
	ld b, 6 tiles
	call CopyHLToDE
	ld de, v1Tiles0 tile $40
	ld b, 6 tiles
	call CopyHLToDE
	ld de, v1Tiles0 tile $60
	ld b, 6 tiles
	call CopyHLToDE
	ld de, v0Tiles1
	ld b, 6 tiles
	call CopyHLToDE

.stroke_number
	call PrintGolfStrokeNumber
	ld hl, w1db90
	ld de, v1Tiles0 tile $f0
	ld b, 4 tiles
	call CopyHLToDE

	xor a
	ldh [rVBK], a
	ret
; 0x1c8c33

Func_1c8c33: ; 1c8c33 (72:4c33)
	ld a, HIGH(OAM_1ca6cf)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1ca6cf)
	ld [wGolfOAMPtr + 1], a
	ld a, $08
	ld [w1dc4a], a
	ld hl, wGolfYPos
	ld a, $58
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $01
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	call Func_1c8cc3
	call Func_1c8d74
	call Func_1c8ea8
	jp ClearVirtualOAM
; 0x1c8c66

PrintGolfStrokeNumber: ; 1c8c66 (72:4c66)
	ld hl, GolfStrokeNumbersGfx
	ld a, [wGolfStroke]
	ld d, 0
	ld e, a
.loop_div
	cp 10
	jr c, .done_div
	sub 10
	ld e, a
	inc d
	jr .loop_div
.done_div
	push de
	ld a, d
	and a
	jr z, .got_tens_digit
	ld bc, 2 tiles
.loop_tens_digit
	add hl, bc
	dec d
	jr nz, .loop_tens_digit
.got_tens_digit
	ld de, w1db90
	ld b, 2 tiles
	call CopyHLToDE
	pop de

	ld hl, GolfStrokeNumbersGfx
	ld a, e
	and a
	jr z, .got_ones_digit
	ld bc, 2 tiles
.loop_ones_digit
	add hl, bc
	dec e
	jr nz, .loop_ones_digit
.got_ones_digit
	ld de, w1db90 tile $02
	ld b, 2 tiles
	jp CopyHLToDE
; 0x1c8ca4

Func_1c8ca4: ; 1c8ca4 (72:4ca4)
	ld a, HIGH(OAM_1ca6cf)
	ld [wGolfOAMPtr + 0], a
	ld a, LOW(OAM_1ca6cf)
	ld [wGolfOAMPtr + 1], a
	call Func_1c8fb8
	call Func_1c8cc3
	call Func_1c8d74
	call Func_1c8ea8
	call ClearVirtualOAM
	call LoadGolfWarioStateGfx
	jp Func_1c9cf9
; 0x1c8cc3

Func_1c8cc3: ; 1c8cc3 (72:4cc3)
	ld a, $30
	ld [wGolfObj1YCoord], a
	ld a, $0c
	ld [wGolfObj1XCoord], a
	ld de, Frameset_1caf6f
	ld hl, wGolfObj1Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj1CurrentFrame]
	ld [wGolfObj1Frame], a
	ld hl, wGolfObj1Sprite
	call AddGolfSprite

	ld a, $30
	ld [wGolfObj2YCoord], a
	ld a, $08
	ld [wGolfObj2XCoord], a
	ld de, Frameset_1caf81
	ld hl, wGolfObj2Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj2CurrentFrame]
	ld [wGolfObj2Frame], a
	ld hl, wGolfObj2Sprite
	call AddGolfSprite

	ld a, [w1dc00]
	cp $0c
	ret z
	ld a, $90
	ld [wGolfObj3YCoord], a
	ld a, $58
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1caf8a
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite

	ld a, [wGolfObj4State]
	and a
	ret nz
	ld a, $90
	ld [wGolfObj4YCoord], a
	ld a, [w1dc4a]
	add $32
	ld [wGolfObj4XCoord], a
	ld de, Frameset_1caf84
	ld hl, wGolfObj4Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj4CurrentFrame]
	ld [wGolfObj4Frame], a
	ld hl, wGolfObj4Sprite
	call AddGolfSprite

	ld a, [wGolfObj5State]
	and a
	ret z
	ld a, $90
	ld [wGolfObj5YCoord], a
	ld a, [w1dc4c]
	add $32
	ld [wGolfObj5XCoord], a
	ld de, Frameset_1caf87
	ld hl, wGolfObj5Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj5CurrentFrame]
	ld [wGolfObj5Frame], a
	ld hl, wGolfObj5Sprite
	jp AddGolfSprite
; 0x1c8d74

Func_1c8d74: ; 1c8d74 (72:4d74)
	ld a, [w1dc20]
	and a
	ret nz
	ld a, [wGolfObj6State]
	cp $08
	ret nc
	ld hl, w1dc36
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	push de
	call Func_1c8f56
	and a
	jr nz, .asm_1c8d96 ; if true
	pop de
	ret
.asm_1c8d96
	pop de
	ld a, [wSCX]
	ld b, a
	ld a, e
	add $08
	sub b
	ld [wGolfObj6XCoord], a
	ld b, $12
	ld a, [wGolfObj6State]
	ld c, a
	cp $08
	ret nc
	cp $05
	jr nz, .asm_1c8db1
	ld b, $13
.asm_1c8db1
	ld hl, w1dc34
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	ld a, e
	add b
	ld [wGolfObj6YCoord], a
	ld hl, .framesets
	ld b, $00
	sla c
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wGolfObj6Duration
	call UpdateGolfObjectAnimation

	ld b, $00
	bit 0, c
	call nz, Func_1c8e26
	bit 0, b
	ret nz
	ld a, [wGolfObj6State]
	cp $02
	jr nz, .asm_1c8e09
	ld a, [wGolfObj6Duration]
	and a
	jr nz, .asm_1c8e09
	ld a, [wGolfObj6FramesetOffset]
	cp $1e
	jr z, .asm_1c8e01
	cp $14
	jr nz, .asm_1c8e09
	play_sfx SFX_00F
	jr .asm_1c8e09
.asm_1c8e01
	play_sfx SFX_0E5
.asm_1c8e09
	ld a, [wGolfObj6CurrentFrame]
	ld [wGolfObj6Frame], a
	ld hl, wGolfObj6Sprite
	jp AddGolfSprite

.framesets
	dw Frameset_1cafb1
	dw Frameset_1cafb6
	dw Frameset_1cafc7
	dw Frameset_1cafe8
	dw Frameset_1cb005
	dw Frameset_1cafb1
; 0x1c8e21

; unreferenced?
Frameset_1c8e21: ; 1c8e21 (72:4e21)
	db $23, 78
	db $20,  4
	db $ff
; 0x1c8e26

Func_1c8e26: ; 1c8e26 (72:4e26)
	ld a, [wGolfObj6State]
	cp $02
	jr z, .asm_1c8e32
	cp $03
	jr z, .asm_1c8e7c
	ret
.asm_1c8e32
	ld hl, w1dc3a
	ld a, $80
	ld [hli], a
	ld [hl], $01
	ld hl, w1dc34
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [w1dc45]
	and $80
	jr nz, .asm_1c8e4c
	ld a, [w1db84]
	jr .asm_1c8e4f
.asm_1c8e4c
	ld a, [w1db85]
.asm_1c8e4f
	ld d, $00
	ld e, a
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld a, e
	ld [hli], a
	ld [hl], d
	call Func_1c960c
	call Func_1c9138
	ld b, $01
	xor a
	ld [wGolfObj6FramesetOffset], a
	ld a, $04
	ld [wGolfObj6State], a
	jr .asm_1c8e91

.asm_1c8e7c
	ld hl, w1dc34
	xor a
	ld [hli], a
	ld [hli], a
	ld de, w1dc3c
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ld b, $01
	ld a, $08
	ld [wGolfObj6State], a

.asm_1c8e91
	ld a, [wGolfMaxStrokes]
	ld c, a
	ld a, [wGolfStroke]
	cp c
	ret c
	ld hl, w1dc34
	ld a, $80
	ld [hli], a
	ld [hl], $01
	ld a, $01
	ld [w1dc20], a
	ret
; 0x1c8ea8

Func_1c8ea8: ; 1c8ea8 (72:4ea8)
	ld hl, wGolfXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	push de
	call Func_1c8f56
	and a
	jr nz, .asm_1c8f02
	pop de
	ld a, [w1dc21]
	and a
	ret z
	xor a
	ld [w1dc21], a

	ld a, [wGolfWarioDir]
	and a
	jr nz, .asm_1c8ee5
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld a, e
	sub 40
	ld e, a
	ld a, d
	sbc 0
	ld d, a
	jr .asm_1c8efb
.asm_1c8ee5
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld a, e
	add LOW(680)
	ld e, a
	ld a, d
	adc HIGH(680)
	ld d, a
.asm_1c8efb
	ld hl, wGolfXPos
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

.asm_1c8f02
	xor a
	ld [w1dc21], a
	pop de
	ld a, [wSCX]
	ld b, a
	ld a, e
	add $08
	sub b
	ld [wGolfWarioXCoord], a
	ld a, [wGolfYPos]
	add $11
	ld [wGolfWarioYCoord], a
	call UpdateGolfWarioAnimation
	ld a, [wGolfWarioState]
	cp GOLF_WARIO_WALKING
	ret nz
	ld a, [wGolfWarioFramesetOffset]
	cp $02
	ret nz
	ld a, [wGolfWarioDuration]
	and a
	ret nz
	play_sfx SFX_WALK
	ret
; 0x1c8f37

; holds the last frame in the animation
; of some states of Golf Wario
; and increments wGolfCounter
HoldGolfWarioLastFrame:: ; 1c8f37 (72:4f37)
	ld a, [wGolfWarioState]
	cp GOLF_WARIO_2
	jr z, .ok
	cp GOLF_WARIO_3
	jr z, .ok
	cp GOLF_WARIO_MISSING
	jr z, .ok
	cp GOLF_WARIO_TURNING
	jr z, .ok
	ret
.ok
	ld hl, wGolfCounter
	inc [hl]
	ld a, [wGolfAnimLastFrame]
	ld [wGolfWarioCurrentFrame], a
	ret
; 0x1c8f56

Func_1c8f56: ; 1c8f56 (72:4f56)
	ld hl, wGolfXScroll
	call Calculate2ByteSubtraction
	ld a, d
	and a
	jr z, .asm_1c8f66
	cp -1
	jr z, .asm_1c8f6e

.false
	xor a ; FALSE
	ret

.asm_1c8f66
	ld a, e
	cp $b0
	jr nc, .false
	ld a, TRUE
	ret

.asm_1c8f6e
	ld a, e
	cp $e0
	jr c, .false
	ld a, TRUE
	ret
; 0x1c8f76

; stores the bank and pointer
; for Golf Wario graphics of his current state
; the graphics will be loaded during VBlank
LoadGolfWarioStateGfx: ; 1c8f76 (72:4f76)
	ld hl, .GfxBanks
	ld a, [wGolfWarioState]
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wGolfWarioTilesBank], a
	ld hl, .GfxPointers
	sla c
	add hl, bc
	ld a, [hli]
	ld [wGolfWarioTilesPtr + 1], a
	ld a, [hl]
	ld [wGolfWarioTilesPtr + 0], a
	ret

.GfxBanks
	db BANK(WarioIdleGfx)   ; GOLF_WARIO_IDLING
	db BANK(WarioWalkGfx)   ; GOLF_WARIO_WALKING
	db BANK(WarioAttackGfx) ; GOLF_WARIO_2
	db BANK(WarioAttackGfx) ; GOLF_WARIO_3
	db BANK(WarioAttackGfx) ; GOLF_WARIO_4
	db BANK(WarioGolfMiss)  ; GOLF_WARIO_MISSING
	db BANK(WarioClearGfx)  ; GOLF_WARIO_6
	db BANK(WarioClearGfx)  ; GOLF_WARIO_7
	db BANK(WarioClearGfx)  ; GOLF_WARIO_WAITING
	db BANK(WarioClearGfx)  ; GOLF_WARIO_9
	db BANK(WarioIdleGfx)   ; GOLF_WARIO_GOING_IN_PIPE
	db BANK(WarioIdleGfx)   ; GOLF_WARIO_TURNING

.GfxPointers
	dw WarioIdleGfx   ; GOLF_WARIO_IDLING
	dw WarioWalkGfx   ; GOLF_WARIO_WALKING
	dw WarioAttackGfx ; GOLF_WARIO_2
	dw WarioAttackGfx ; GOLF_WARIO_3
	dw WarioAttackGfx ; GOLF_WARIO_4
	dw WarioGolfMiss  ; GOLF_WARIO_MISSING
	dw WarioClearGfx  ; GOLF_WARIO_6
	dw WarioClearGfx  ; GOLF_WARIO_7
	dw WarioClearGfx  ; GOLF_WARIO_WAITING
	dw WarioClearGfx  ; GOLF_WARIO_9
	dw WarioIdleGfx   ; GOLF_WARIO_GOING_IN_PIPE
	dw WarioIdleGfx   ; GOLF_WARIO_TURNING
; 0x1c8fb7

Func_1c8fb7: ; 1c8fb7 (72:4fb7)
	ret

Func_1c8fb8: ; 1c8fb8 (72:4fb8)
	ld a, [w1dc00]
	jumptable
	dw Func_1c8fd8
	dw Func_1c905d
	dw Func_1c9164
	dw Func_1c9286
	dw Func_1c92f7
	dw Func_1c93a7
	dw Func_1c9648
	dw Func_1c9654
	dw Func_1c98c7
	dw Func_1c9a01
	dw Func_1c9a62
	dw Func_1c9bbc
	dw Func_1c9bfc
	dw Func_1c9c53
; 0x1c8fd8

Func_1c8fd8: ; 1c8fd8 (72:4fd8)
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wJoypadPressed]
	bit SELECT_F, a
	jr nz, .select_btn
	bit A_BUTTON_F, a
	jr nz, .a_btn
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	ret

.select_btn
	play_sfx SFX_0E4
	xor a
	ld [wGolfObj3Duration], a
	ld [wGolfObj3FramesetOffset], a
	ld a, $0c
	ld [w1dc00], a
	ret

.a_btn
	play_sfx SFX_0E9
	ld hl, wGolfObj7
	xor a
	ld c, $8
.asm_1c9015
	ld [hli], a
	dec c
	jr nz, .asm_1c9015
	xor a
	ld [w1dc24], a
	ld a, $02
	ld [w1dc00], a
	ld a, [w1dc45]
	ld [w1dc48], a
	ld a, [w1dc47]
	ld [w1dc53], a
	ld hl, w1dc34
	ld de, w1dc3a
	ld b, $04
	jp CopyHLToDE

.d_right
	ld a, d
	and a
	jr z, .asm_1c9041
	ld a, e
	cp $60
	ret nc
.asm_1c9041
	xor a
	jr .asm_1c9049

.d_left
	ld a, d
	or e
	ret z
	ld a, $1
.asm_1c9049
	ld [wGolfMenuScrollingDir], a
	ld hl, wGolfXScroll
	ld a, [hli]
	ld [wTempGolfXScroll + 0], a
	ld a, [hl]
	ld [wTempGolfXScroll + 1], a
	ld a, $01
	ld [w1dc00], a
	ret
; 0x1c905d

Func_1c905d: ; 1c905d (72:505d)
	call Func_1c90c8
	ld hl, w1dc36
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	ld a, [w1dc45]
	cp $03
	jr z, .asm_1c907d
	cp $04
	jr z, .asm_1c9081
	ld b, $a0
	jr .asm_1c9083
.asm_1c907d
	ld b, $80
	jr .asm_1c9083
.asm_1c9081
	ld b, $50
.asm_1c9083
	ld a, [w1dc28]
	and a
	jr nz, .asm_1c9092
	ld a, e
	add b
	ld e, a
	ld a, d
	adc $00
	ld d, a
	jr .asm_1c9099
.asm_1c9092
	ld a, e
	sub b
	ld e, a
	ld a, d
	sbc $00
	ld d, a
.asm_1c9099
	push de
	call Func_1c8f56
	and a
	jr nz, .asm_1c90a2
	pop de
	ret
.asm_1c90a2
	pop de
	ld a, [wSCX]
	ld b, a
	ld a, e
	add $08
	sub b
	ld [wGolfObj8XCoord], a
	ld a, $72
	ld [wGolfObj8YCoord], a
	ld hl, wGolfObj8Duration
	ld de, Frameset_1cb0a4
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj8CurrentFrame]
	ld [wGolfObj8Frame], a
	ld hl, wGolfObj8Sprite
	jp AddGolfSprite
; 0x1c90c8

Func_1c90c8: ; 1c90c8 (72:50c8)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .restore_scroll
	bit B_BUTTON_F, a
	jr nz, .restore_scroll

	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wGolfMenuScrollingDir]
	and a
	jr nz, .dir_left

; dir right
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr z, .no_directional_input
	ld a, d
	and a
	jr z, .asm_1c90ee
	ld a, e
	cp $60
	ret nc
.asm_1c90ee
	inc de
	jr .apply_scroll

.dir_left
	ld a, [wJoypadDown]
	bit D_LEFT_F, a
	jr z, .no_directional_input
	ld a, d
	or e
	ret z
	dec de
.apply_scroll
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	jr Func_1c9138

.no_directional_input
	ld hl, wGolfXScroll
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wGolfMenuScrollingDir]
	and a
	jr nz, .asm_1c9111
	dec de
	jr .asm_1c9112
.asm_1c9111
	inc de
.asm_1c9112
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	ld hl, wTempGolfXScroll
	call Calculate2ByteSubtraction
	ld a, d
	or e
	jr nz, Func_1c9138
	ld a, $00
	ld [w1dc00], a
	jr Func_1c9138

.restore_scroll
	ld a, [wTempGolfXScroll + 0]
	ld [wGolfXScroll + 0], a
	ld a, [wTempGolfXScroll + 1]
	ld [wGolfXScroll + 1], a
	ld a, $00
	ld [w1dc00], a
;	fallthrough

Func_1c9138: ; 1c9138 (72:5138)
	ld hl, wGolfXScroll + 1
	ld a, [hld]
	and a
	jr z, .asm_1c9149
	ld a, [hl]
	ld [wSCX], a
	ld a, GOLF_DISPLAY_BGMAP1
	ld [wGolfDisplayMode], a
	ret
.asm_1c9149
	ld a, [hl]
	ld [wSCX], a
	cp $60
	jr c, .no_split
; split
	ld a, $a7
	sub [hl]
	add $60
	ld [w1dc25], a
	ld a, GOLF_DISPLAY_SPLIT
	ld [wGolfDisplayMode], a
	ret
.no_split
	xor a ; GOLF_DISPLAY_BGMAP0
	ld [wGolfDisplayMode], a
	ret
; 0x1c9164

Func_1c9164: ; 1c9164 (72:5164)
	ld a, [w1dc49]
	and a
	jr nz, .asm_1c918c
	ld b, $01
	ld a, [w1dc4a]
	cp $10
	jr c, .asm_1c9175
	ld b, $02
.asm_1c9175
	add b
	ld [w1dc4a], a
	cp $4c
	jr c, .asm_1c91a3
	play_sfx SFX_0EA

	ld a, $01
	ld [w1dc49], a
	jr .asm_1c91a3
.asm_1c918c
	ld a, [w1dc4a]
	sub $02
	ld [w1dc4a], a
	jr nc, .asm_1c91a3
	xor a
	ld [wGolfCounter], a
	ld [w1dc4a], a
	ld a, $04
	ld [w1dc00], a
	ret
.asm_1c91a3
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	inc a
	ld [wGolfObj5State], a
	ld a, $03
	ld [w1dc00], a

	ld hl, wGolfYVel
	ld a, [w1dc4a]
	ld [w1dc4c], a
	cp $10
	jr c, .asm_1c91ed
	cp $18
	jr c, .asm_1c91f3
	cp $20
	jr c, .asm_1c91fa
	cp $28
	jr c, .asm_1c9201
	cp $30
	jr c, .asm_1c9208
	cp $38
	jr c, .asm_1c920f
	cp $40
	jr c, .asm_1c9216
	cp $46
	jr c, .asm_1c921d
	cp $4a
	jr c, .asm_1c9224
	ld a, $09
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c91ed
	xor a
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c91f3
	ld a, $01
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c91fa
	ld a, $02
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c9201
	ld a, $03
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c9208
	ld a, $04
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c920f
	ld a, $05
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c9216
	ld a, $06
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c921d
	ld a, $07
	ld [w1dc4b], a
	jr .asm_1c9229
.asm_1c9224
	ld a, $08
	ld [w1dc4b], a

.asm_1c9229
	ld hl, .data
	ld de, wGolfYVel
	ld a, [w1dc4b]
	sla a
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld [de], a ; wGolfYVel
	inc de
	xor a
	ld [de], a ; w1dc4f
	inc de
	ld a, [hl]
	ld [de], a ; w1dc50

	ld a, [w1dc45]
	cp $03
	jr z, .asm_1c9250
	cp $04
	jr z, .asm_1c9263
	xor a
	ld [w1dc46], a
	ret
.asm_1c9250
	ld hl, wGolfYVel
	ld a, [hl]
	add [hl]
	add [hl]
	add $3
	srl a
	srl a
	ld [hli], a ; (a*3 + 3) / 4
	ld a, $01
	ld [w1dc46], a
	ret
.asm_1c9263
	ld hl, wGolfYVel
	ld a, [hl]
	inc a
	srl a
	dec a
	ld [hli], a ; ((a + 1) / 2) - 1
	ld a, $02
	ld [w1dc46], a
	ret

.data
	db $04, $04 ; $0
	db $06, $06 ; $1
	db $08, $08 ; $2
	db $0a, $0a ; $3
	db $0c, $0b ; $4
	db $10, $0c ; $5
	db $12, $0d ; $6
	db $14, $0e ; $7
	db $16, $0f ; $8
	db $18, $10 ; $9
; 0x1c9286

Func_1c9286: ; 1c9286 (72:5286)
	ld a, [w1dc49]
	and a
	jr nz, .asm_1c92ae
	ld b, $01
	ld a, [w1dc4c]
	cp $10
	jr c, .asm_1c9297
	ld b, $02
.asm_1c9297
	add b
	ld [w1dc4c], a
	cp $4c
	jr c, .asm_1c92be
	play_sfx SFX_0EA
	ld a, $01
	ld [w1dc49], a
	jr .asm_1c92be
.asm_1c92ae
	ld a, [w1dc4c]
	sub $02
	ld [w1dc4c], a
	jr nc, .asm_1c92be
	xor a
	ld [w1dc4c], a
	jr .asm_1c92c4
.asm_1c92be
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z

.asm_1c92c4
	xor a
	ld [wGolfCounter], a
	ld a, $04
	ld [w1dc00], a
	ld a, [w1dc4c]
	cp $02
	jr c, .asm_1c92e0
	cp $05
	jr c, .asm_1c92e5
	cp $0b
	jr c, .asm_1c92eb
	cp $0e
	jr c, .asm_1c92f1
.asm_1c92e0
	xor a
	ld [w1dc4d], a
	ret
.asm_1c92e5
	ld a, $01
	ld [w1dc4d], a
	ret
.asm_1c92eb
	ld a, $02
	ld [w1dc4d], a
	ret
.asm_1c92f1
	ld a, $03
	ld [w1dc4d], a
	ret
; 0x1c92f7

Func_1c92f7: ; 1c92f7 (72:52f7)
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	jr z, .asm_1c930b
	cp $01
	jr z, .asm_1c9318
	cp $03
	jr z, .asm_1c9333
	cp $05
	jr nc, .asm_1c9368
	ret

.asm_1c930b
	inc [hl]
	ld hl, wGolfStroke
	inc [hl]
	ld a, $03
	ld [wGolfVBlankMode], a
	jp PrintGolfStrokeNumber

.asm_1c9318
	inc [hl]
	play_sfx SFX_0ED
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_2
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.asm_1c9333
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, [w1dc4a]
	and a
	jr z, .asm_1c9355
	ld a, [w1dc4d]
	and a
	jr z, .asm_1c9355
	play_sfx SFX_017
	ld a, GOLF_WARIO_3
	ld [wGolfWarioState], a
	ret
.asm_1c9355
	play_sfx SFX_0E8
	ld a, GOLF_WARIO_MISSING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.asm_1c9368
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, [wGolfWarioState]
	cp $05
	jr z, .asm_1c9397
	ld a, [w1dc28]
	ld [w1dc29], a
	xor a
	ld [wGolfObj6FramesetOffset], a
	inc a
	ld [wGolfObj6State], a
	ld a, GOLF_WARIO_4
	ld [wGolfWarioState], a
	ld a, $06
	ld [w1dc01], a
	ld a, $05
	ld [w1dc00], a
	ret
.asm_1c9397
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $09
	ld [w1dc00], a
	ret
; 0x1c93a7

Func_1c93a7: ; 1c93a7 (72:53a7)
	call Func_1c9438
	call Func_1c94e8
	call Func_1c960c
	call Func_1c9138
	ld a, [w1dc00]
	cp $05
	ret z
	ld a, $08
	ld [w1dc01], a
	ld a, [w1dc4d]
	cp $02
	jr z, .asm_1c93d1
	cp $03
	jr z, .asm_1c93d6
	ld a, [w1dc29]
	xor $01
	ld [w1dc29], a

.asm_1c93d1
	ld hl, .data_1
	jr .asm_1c93d9
.asm_1c93d6
	ld hl, .data_2
.asm_1c93d9
	ld de, wGolfYVel
	ld a, [w1dc4b]
	sla a
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld [de], a ; wGolfYVel
	inc de
	xor a
	ld [de], a ; w1dc4f
	inc de
	ld a, [hl]
	ld [de], a ; w1dc50
	ld a, [w1dc46]
	cp $01
	jr z, .asm_1c93f9
	cp $02
	jr z, .asm_1c9407
	ret
.asm_1c93f9
	ld hl, wGolfYVel
	ld a, [hl]
	add [hl]
	add [hl]
	add $03
	srl a
	srl a
	ld [hli], a ; (a*3 + 3) / 4
	ret
.asm_1c9407
	ld hl, wGolfYVel
	ld a, [hl]
	inc a
	srl a
	ld [hli], a ; (a + 1) / 2
	ret

.data_1
	db $01, $01 ; $0
	db $02, $01 ; $1
	db $03, $02 ; $2
	db $04, $02 ; $3
	db $05, $03 ; $4
	db $06, $03 ; $5
	db $07, $03 ; $6
	db $08, $04 ; $7
	db $09, $04 ; $8
	db $0a, $04 ; $9

.data_2
	db $01, $02 ; $0
	db $02, $03 ; $1
	db $03, $04 ; $2
	db $04, $05 ; $3
	db $05, $06 ; $4
	db $06, $06 ; $5
	db $07, $07 ; $6
	db $08, $07 ; $7
	db $09, $08 ; $8
	db $0a, $08 ; $9
; 0x1c9438

Func_1c9438: ; 1c9438 (72:5438)
	ld hl, w1dc51
	inc [hl]
	ld a, [hl]
	and $07
	jr nz, .asm_1c9445
	ld hl, w1dc50
	dec [hl]
.asm_1c9445
	ld hl, w1dc36
	ld a, [w1dc29]
	and a
	jr nz, .asm_1c945b
	ld a, [w1dc50]
	add [hl]
	ld [hli], a
	ld e, a
	ld a, [hl]
	adc $00
	ld [hl], a
	ld d, a
	jr .asm_1c9475
.asm_1c945b
	ld a, [w1dc50]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ld e, a
	ld a, [hl]
	sbc $00
	ld [hl], a
	ld d, a
	cp $ff
	jr nz, .asm_1c9475
	ld [hl], $00
	ld a, $08
	ld [w1dc45], a
	jr .asm_1c94c2

.asm_1c9475
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	ld a, e
	ld [w1dc3e], a
	ld a, d
	ld [w1dc3f], a
	ld hl, wGolfTerrain
	add hl, de
	ld a, [hl]
	ld [w1dc45], a
	and $0f
	jr z, .asm_1c94a7
	cp $08
	jr z, .asm_1c94c2
.asm_1c94a1
	ld a, $80
	ld [w1dc44], a
	ret
.asm_1c94a7
	ld a, [w1dc47]
	and a
	jr nz, .asm_1c94b3
	ld a, $60
	ld [w1dc44], a
	ret
.asm_1c94b3
	ld a, [w1dc45]
	and $f0
	jr z, .asm_1c94a1
	ld c, a
	ld a, $07
	ld [w1dc45], a
	jr .asm_1c94a1

.asm_1c94c2
	xor a
	ld [wGolfObj6Duration], a
	ld [wGolfWarioDuration], a
	ld [wGolfObj6FramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld a, $08
	ld [wGolfObj6State], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, $07
	ld [w1dc00], a

	ld hl, wGolfStroke
	inc [hl]
	ret
; 0x1c94e8

Func_1c94e8: ; 1c94e8 (72:54e8)
	ld hl, wGolfYVel
	ld a, [hli]
	ld d, [hl]
	ld e, a
	dec de
	ld a, d
	ld [hld], a
	ld [hl], e
	ld hl, w1dc34
	ld a, [hli]
	ld d, [hl]
	ld e, a

	ld hl, wGolfYVel
	call Calculate2ByteSubtraction
	ld hl, w1dc34 + 1
	ld a, d
	ld [hld], a
	ld [hl], e
	cp $01
	ret nz
	ld a, [w1dc44]
	ld d, a
	sub e
	ret nc
	ld a, d
	ld [hli], a
	ld a, $01
	ld [hl], a
	ld a, [w1dc45]
	and $0f
	ld d, a
	jr z, .asm_1c9521
	cp $06
	jr nc, .asm_1c9521
	ld [w1dc47], a
.asm_1c9521
	xor a
	ld [w1dc51], a
	ld a, d
	cp $02
	jr nc, .asm_1c955e
	play_sfx SFX_BUMP
	ld a, [w1dc01]
	ld [w1dc00], a
	cp $06
	ret z
	ld a, $09
	ld [w1dc01], a
	call Func_1c99ca
	xor a
	ld [wGolfObj6Duration], a
	ld [wGolfWarioDuration], a
	ld [wGolfObj6FramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfObj6State], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.asm_1c955e
	ld a, $07
	ld [w1dc00], a
	xor a
	ld [wGolfObj6Duration], a
	ld [wGolfWarioDuration], a
	ld [wGolfObj6FramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfObj6State], a
	ld a, GOLF_WARIO_IDLING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a

	ld a, [w1dc45]
	ld c, a
	and $0f
	cp $02
	jr z, .asm_1c95ae
	cp $05
	jr z, .asm_1c95bd
	cp $06
	jr z, .asm_1c95c7
	cp $07
	jr z, .asm_1c95b8
	cp $04
	jr z, .asm_1c95a0
	play_sfx SFX_0A1
	ret
.asm_1c95a0
	play_sfx SFX_065
	ld a, $05
	ld [wGolfObj6State], a
	ret
.asm_1c95ae
	play_sfx SFX_0EF
	jr .asm_1c95de
.asm_1c95b8
	ld hl, wGolfStroke
	inc [hl]
	ret
.asm_1c95bd
	play_sfx SFX_SLIDE
	jr .asm_1c95d5
.asm_1c95c7
	play_sfx SFX_073
	ld a, [w1dc53]
	ld [w1dc47], a
.asm_1c95d5
	ld a, $06
	ld [wGolfObj6State], a
	ld hl, wGolfStroke
	inc [hl]
.asm_1c95de
	ld hl, w1dc3e
	bit 4, c
	jr nz, .asm_1c95ee
	bit 5, c
	jr nz, .asm_1c95ea
	ret
.asm_1c95ea
	ld a, [hli]
	inc a
	jr .asm_1c95ef
.asm_1c95ee
	ld a, [hli]
.asm_1c95ef
	ld e, a
	ld d, [hl]
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld hl, w1dc36
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
; 0x1c960c

Func_1c960c: ; 1c960c (72:560c)
	ld hl, w1dc36
	ld a, [hli]
	ld d, [hl]
	ld e, a
	srl d
	rr e
	srl d
	rr e
	ld hl, wGolfXScroll
	ld a, d
	cp $02
	jr nc, .asm_1c9639
	and a
	jr nz, .asm_1c9634
	ld a, e
	cp $50
	jr nc, .asm_1c962e
	xor a
	ld [hli], a
	ld [hl], a
	ret
.asm_1c962e
	sub $50
	ld [hli], a
	xor a
	ld [hl], a
	ret
.asm_1c9634
	ld a, e
	cp $b0
	jr c, .asm_1c9640
.asm_1c9639
	ld a, $60
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret
.asm_1c9640
	sub $50
	ld [hli], a
	ld a, d
	sbc $00
	ld [hl], a
	ret
; 0x1c9648

Func_1c9648: ; 1c9648 (72:5648)
	call Func_1c9438
	call Func_1c94e8
	call Func_1c960c
	jp Func_1c9138
; 0x1c9654

Func_1c9654: ; 1c9654 (72:5654)
	ld a, $50
	ld [wGolfObj7YCoord], a
	ld a, $58
	ld [wGolfObj7XCoord], a
	ld [wGolfObj4State], a
	ld a, $09
	ld [w1dc01], a
	ld a, [w1dc45]
	and $0f
	cp $02
	jp z, .asm_1c97f2
	cp $03
	jr z, .asm_1c96dd
	cp $04
	jp z, .asm_1c96f4
	cp $05
	jp z, .asm_1c9722
	cp $06
	jp z, .asm_1c9799
	ld a, [wGolfObj6State]
	cp $04
	jp z, .asm_1c9743
	ld de, Frameset_1cb016
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr nz, .asm_1c96ba
	ld a, [wGolfObj7FramesetOffset]
	cp $02
	jr nz, .asm_1c96ae
	ld a, [wGolfObj7Duration]
	cp $01
	jr nz, .asm_1c96ae
	play_sfx SFX_0E5
.asm_1c96ae
	ld a, [wGolfObj7CurrentFrame]
	ld [wGolfObj7Frame], a
	ld hl, wGolfObj7Sprite
	jp AddGolfSprite

.asm_1c96ba
	ld hl, w1dc34
	xor a
	ld [hli], a
	ld [hli], a
	ld a, [w1dc3c + 0]
	ld [hli], a
	ld a, [w1dc3c + 1]
	ld [hl], a
	call Func_1c960c
	call Func_1c9138
	call Func_1c99ca
	xor a
	ld [wGolfObj6FramesetOffset], a
	ld a, $04
	ld [wGolfObj6State], a
	jp Func_1c8e26.asm_1c8e91

.asm_1c96dd
	ld de, Frameset_1cb035
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jp nz, .asm_1c976f
	ld a, [wGolfObj7FramesetOffset]
	cp $0a
	jr nz, .asm_1c9716
	jr .asm_1c9708

.asm_1c96f4
	ld de, Frameset_1cb068
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr nz, .asm_1c976f
	ld a, [wGolfObj7FramesetOffset]
	cp $06
	jr nz, .asm_1c9716
.asm_1c9708
	ld a, [wGolfObj7Duration]
	and a
	jr nz, .asm_1c9716
	play_sfx SFX_0F0
.asm_1c9716
	ld a, [wGolfObj7CurrentFrame]
	ld [wGolfObj7Frame], a
	ld hl, wGolfObj7Sprite
	jp AddGolfSprite

.asm_1c9722
	ld a, [wGolfObj6State]
	cp $04
	jr z, .asm_1c9743
	cp $06
	ret nz
	ld hl, w1dc34
	ld a, [hl]
	cp $c0
	jr nc, .asm_1c9738
	add $04
	ld [hli], a
	ret
.asm_1c9738
	ld a, $02
	ld [wGolfObj6State], a
	ld a, $01
	ld [w1dc48], a
	ret
.asm_1c9743
	ld hl, w1dc34
	ld a, [hli]
	or [hl]
	jr nz, .asm_1c9752
	play_sfx SFX_0EE
.asm_1c9752
	ld hl, w1dc3a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, w1dc34
	ld a, [hl]
	add $02
	ld [hli], a
	ld a, [hl]
	adc $00
	ld [hld], a
	call Func_1c9ce5
	cp $02
	ret nc
	ld a, [w1dc48]
	ld [w1dc45], a

.asm_1c976f
	ld a, [wGolfObj6State]
	cp $05
	jr z, .asm_1c977a
	xor a
	ld [wGolfObj6State], a
.asm_1c977a
	xor a
	ld [wGolfCounter], a
	ld [wGolfObj6Duration], a
	ld [wGolfWarioDuration], a
	ld [wGolfObj6FramesetOffset], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfObj7FramesetOffset], a
	ld [wGolfObj7], a
	call Func_1c99ca
	ld a, $08
	ld [w1dc00], a
	ret

.asm_1c9799
	ld a, [wGolfObj6]
	cp $04
	jr z, .asm_1c9743
	cp $06
	jr nz, .asm_1c97b5
	ld hl, w1dc34
	ld a, [hl]
	cp $a0
	jr nc, .asm_1c97b0
	add $04
	ld [hli], a
	ret
.asm_1c97b0
	ld a, $03
	ld [wGolfObj6], a
.asm_1c97b5
	ld de, Frameset_1cb016
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, c
	and a
	jr nz, .asm_1c97e4
	ld a, [wGolfObj7FramesetOffset]
	cp $02
	jr nz, .asm_1c97d8
	ld a, [wGolfObj7Duration]
	cp $01
	jr nz, .asm_1c97d8
	play_sfx SFX_0E5
.asm_1c97d8
	ld a, [wGolfObj7CurrentFrame]
	ld [wGolfObj7Frame], a
	ld hl, wGolfObj7Sprite
	jp AddGolfSprite
.asm_1c97e4
	ld a, $04
	ld [wGolfObj6], a
	call Func_1c960c
	call Func_1c9138
	jp Func_1c99ca

.asm_1c97f2
	ld hl, wGolfCounter
	ld a, [hl]
	cp $30
	jr nc, .asm_1c9838
	cp $18
	jr nc, .asm_1c9833
	inc [hl]
	ld hl, .data_1
	ld de, w1dc36
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_1c981b
	ld hl, .data_2
	add hl, bc
	ld a, [de]
	add [hl]
	ld [de], a
	inc de
	ld a, [de]
	adc $00
	ld [de], a
	jr .asm_1c9827
.asm_1c981b
	ld hl, .data_2
	add hl, bc
	ld a, [de]
	sub [hl]
	ld [de], a
	inc de
	ld a, [de]
	sbc $00
	ld [de], a
.asm_1c9827
	ld hl, .data_3
	add hl, bc
	ld a, [w1dc34]
	add [hl]
	ld [w1dc34], a
	ret

.asm_1c9833
	ld hl, wGolfCounter
	inc [hl]
	ret

.asm_1c9838
	ld a, [wGolfPar]
	ld c, a
	ld a, [wGolfStroke]
	cp c
	jr z, .par
	jr nc, .over_par
; under par
	play_music2 MUSIC_GOLF_CLEARED
	jr .asm_1c9863
.par
	play_music2 MUSIC_GOLF_CLEARED
	ld a, $01
	ld [w1dc24], a
.asm_1c9863
	ld a, $0a
	ld [w1dc01], a
	jp .asm_1c976f
.over_par
	ld a, $02
	ld [w1dc24], a
	ld a, [w1d800]
	cp $01
	jr z, .asm_1c9863
	ld a, $0b
	ld [w1dc01], a
	jp .asm_1c976f

.data_1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $1
	db $1
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0
	db $0

.data_2
	db 2
	db 2
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 2
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0

.data_3
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db  4
	db -2
	db -2
	db  2
	db  2
	db -1
	db -1
	db  2
	db  2
	db  0
	db  0
; 0x1c98c7

Func_1c98c7: ; 1c98c7 (72:58c7)
	ld hl, wGolfCounter
	ld a, [hl]
	cp $19
	jr nc, .asm_1c993f
	cp $18
	jr nc, .asm_1c98e1
	inc [hl]
	and a
	ret nz
	ld a, $03
	ld [wGolfVBlankMode], a
	ld [w1dc21], a
	jp PrintGolfStrokeNumber

.asm_1c98e1
	ld a, [w1dc47]
	and a
	jr z, .asm_1c990f
	ld a, [wGolfYPos]
	cp $60
	jr nc, .asm_1c990f
	ld hl, w1dc34
	ld a, [hli]
	ld e, a
	ld d, [hl]
	srl d
	rr e
	srl d
	rr e
	ld hl, wGolfYPos
	ld a, [hl]
	sub e
	jr nc, .asm_1c990f
	inc [hl]
	inc [hl]
	ld a, [hl]
	cp $60
	ret c
	ld a, $01
	ld [wGolfVBlankMode], a
	ret

.asm_1c990f
	ld hl, wGolfXPos
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, w1dc40
	call Func_1c9ce5
	cp $01
	jr nz, .asm_1c9929
	xor a
	ld [wGolfCounter], a
	ld a, $09
	ld [w1dc00], a
	ret
.asm_1c9929
	ld hl, wGolfCounter
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_WALKING
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ret

.asm_1c993f
	ld a, [wGolfWarioDir]
	and a
	jr nz, .asm_1c995d
	ld hl, wGolfXPos
	ld a, [hli]
	add $04
	ld e, a
	ld a, [hld]
	adc $00
	ld d, a
	push de
	push hl
	ld hl, w1dc40
	call Func_1c9ce5
	and a
	jr nz, .asm_1c997a
	jr .asm_1c9974
.asm_1c995d
	ld hl, wGolfXPos
	ld a, [hli]
	sub $04
	ld e, a
	ld a, [hld]
	sbc $00
	ld d, a
	push de
	push hl
	ld hl, w1dc40
	call Func_1c9ce5
	cp $02
	jr nz, .asm_1c997a
.asm_1c9974
	pop hl
	pop de
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
.asm_1c997a
	pop hl
	pop de
	ld de, w1dc40
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ld a, [w1dc28]
	ld [wGolfWarioDir], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a

	ld hl, w1dc01
	ld a, [hl]
	cp $0a
	jr z, .asm_1c99a4
	cp $0b
	jr z, .asm_1c99bb
	ld a, GOLF_WARIO_IDLING
	jr .asm_1c99bd
.asm_1c99a4
	ld a, [w1dc24]
	cp $02
	jr nc, .asm_1c99af
	ld a, GOLF_WARIO_6
	jr .asm_1c99bd
.asm_1c99af
	play_music2 MUSIC_GAME_OVER
.asm_1c99bb
	ld a, GOLF_WARIO_7
.asm_1c99bd
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, [hl]
	ld [w1dc00], a
	ret
; 0x1c99ca

Func_1c99ca: ; 1c99ca (72:59ca)
	ld hl, w1dc36
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Func_1c9ce5
	cp $02
	jr nc, .asm_1c99ec
	xor a
	ld [w1dc28], a
	ld hl, w1dc36
	ld de, w1dc40
	ld a, [hli]
	sub $40
	ld [de], a
	ld a, [hl]
	sbc $00
	inc de
	ld [de], a
	ret

.asm_1c99ec
	ld a, $01
	ld [w1dc28], a
	ld hl, w1dc36
	ld de, w1dc40
	ld a, [hli]
	add $40
	ld [de], a
	ld a, [hl]
	adc $00
	inc de
	ld [de], a
	ret
; 0x1c9a01

Func_1c9a01: ; 1c9a01 (72:5a01)
	ld a, [wGolfCounter]
	inc a
	ld [wGolfCounter], a
	cp $08
	jr z, .asm_1c9a28
	cp $20
	ret c
	ld a, $08
	ld [w1dc4a], a
	xor a
	ld [wGolfCounter], a
	ld [w1dc51], a
	ld [w1dc49], a
	ld [wGolfObj4State], a
	ld [wGolfObj5], a
	ld [w1dc00], a
	ret

.asm_1c9a28
	ld a, [wGolfMaxStrokes]
	ld c, a
	ld a, [wGolfStroke]
	cp c
	ret c

	play_music2 MUSIC_GAME_OVER

	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfObj7Duration], a
	ld [wGolfObj7FramesetOffset], a
	ld a, $01
	ld [wGolfObj4State], a
	ld a, GOLF_WARIO_7
	ld [wGolfWarioState], a
	ld a, $02
	ld [wGolfVBlankMode], a
	ld a, $0b
	ld [w1dc00], a
	ret
; 0x1c9a62

Func_1c9a62: ; 1c9a62 (72:5a62)
	ld a, [w1d800]
	cp $01
	jr z, .asm_1c9ac2
	ld a, $50
	ld [wGolfObj7YCoord], a
	ld a, $58
	ld [wGolfObj7XCoord], a
	ld de, Frameset_1caf8d
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj7CurrentFrame]
	ld [wGolfObj7Frame], a
	ld hl, wGolfObj7Sprite
	call AddGolfSprite

	ld hl, wGolfCounter
	ld a, [hl]
	cp $50
	jr nc, .asm_1c9a92
	inc [hl]
	ret
.asm_1c9a92
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	stop_music2
	xor a
	ld [w1d800], a
	ld [wGolfMenuOption], a
	ld a, [wcac1]
	and a
	jr nz, .asm_1c9abc
	ld a, $01
	ld [wcac1], a
	ld a, $0a
	ld [wSubState], a
	ret
.asm_1c9abc
	ld a, $08
	ld [wSubState], a
	ret

.asm_1c9ac2
	call Func_1c9b53
	call Func_1c9b8d
	ld b, $50
	ld a, [wGolfWarioState]
	cp $06
	jr z, .asm_1c9ad3
	ld b, $70
.asm_1c9ad3
	ld hl, wGolfCounter
	ld a, [hl]
	cp b
	jr nc, .asm_1c9adc
	inc [hl]
	ret
.asm_1c9adc
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld a, [wGolfStroke]
	ld c, a
	ld a, [wGolfCourseScore]
	add c
	ld [wGolfCourseScore], a
	ld hl, w1d803
	ld a, [hl]
	cp $04
	jr z, .asm_1c9b00
	inc [hl]
	ld hl, wPredeterminedGolfLevel
	inc [hl]
	ld a, $04
	ld [wSubState], a
	ret

.asm_1c9b00
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfObj7Duration], a
	ld [wGolfObj7FramesetOffset], a
	ld [wGolfObj8Duration], a
	ld [wGolfObj8FramesetOffset], a

	ld a, [wGolfCourseScore]
	cp $15
	jr nc, .asm_1c9b24
	ld a, $03
	ld [w1dc24], a
	jr .asm_1c9b29
.asm_1c9b24
	ld a, $04
	ld [w1dc24], a
.asm_1c9b29
	ld hl, wGolfBestScores
	ld a, [wGolfCourse]
	ld d, $00
	ld e, a
	add hl, de
	ld a, [wGolfCourseScore]
	cp [hl]
	jr nc, .asm_1c9b48
	play_sfx SFX_0FA
	ld a, GOLF_WARIO_6
	ld [wGolfWarioState], a
	jr .asm_1c9b4d
.asm_1c9b48
	ld a, GOLF_WARIO_7
	ld [wGolfWarioState], a
.asm_1c9b4d
	ld a, $0d
	ld [w1dc00], a
	ret
; 0x1c9b53

Func_1c9b53: ; 1c9b53 (72:5b53)
	ld a, $50
	ld [wGolfObj7YCoord], a
	ld a, $58
	ld [wGolfObj7XCoord], a
	ld hl, .framesets
	ld a, [w1dc24]
	add a ; *2
	ld b, $00
	ld c, a
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj7CurrentFrame]
	ld [wGolfObj7Frame], a
	ld hl, wGolfObj7Sprite
	jp AddGolfSprite

.framesets
	dw Frameset_1cb0c2
	dw Frameset_1cb089
	dw Frameset_1cb0a9
	dw Frameset_1c9b87
	dw Frameset_1c9b8a
; 0x1c9b87

Frameset_1c9b87: ; 1c9b87 (72:5b87)
	db $73,  4
	db $ff
; 0x1c9b8a

Frameset_1c9b8a: ; 1c9b8a (72:5b8a)
	db $6a,  4
	db $ff
; 0x1c9b8d

Func_1c9b8d: ; 1c9b8d (72:5b8d)
	ld a, [w1dc24]
	cp $01
	ret z
	cp $02
	jr z, .asm_1c9ba1
	ld a, [wGolfStroke]
	ld c, a
	ld a, [wGolfPar]
	sub c
	jr .got_ones_digit
.asm_1c9ba1
	ld a, [wGolfPar]
	ld c, a
	ld a, [wGolfStroke]
	sub c
	cp 10
	jr c, .got_ones_digit
	ld hl, wVirtualOAMSprite01Frame
	ld [hl], $82
	sub 10
.got_ones_digit
	add a
	add $80
	ld hl, wVirtualOAMSprite02Frame
	ld [hl], a
	ret
; 0x1c9bbc

Func_1c9bbc: ; 1c9bbc (72:5bbc)
	ld a, $50
	ld [wGolfObj7YCoord], a
	ld a, $58
	ld [wGolfObj7XCoord], a
	ld de, Frameset_1cafa0
	ld hl, wGolfObj7Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj7CurrentFrame]
	ld [wGolfObj7Frame], a
	ld hl, wGolfObj7Sprite
	call AddGolfSprite

	ld hl, wGolfCounter
	ld a, [hl]
	cp $50
	jr nc, .asm_1c9be5
	inc [hl]
	ret
.asm_1c9be5
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld a, [w1d800]
	cp $02
	jr nz, .asm_1c9bf7
	ld a, $01
	ld [wGolfMenuOption], a
.asm_1c9bf7
	xor a
	ld [wSubState], a
	ret
; 0x1c9bfc

Func_1c9bfc: ; 1c9bfc (72:5bfc)
	ld a, $9c
	ld [wGolfObj3YCoord], a
	ld a, $58
	ld [wGolfObj3XCoord], a
	ld de, Frameset_1cb0da
	ld hl, wGolfObj3Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj3CurrentFrame]
	ld [wGolfObj3Frame], a
	ld hl, wGolfObj3Sprite
	call AddGolfSprite

	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jr nz, .asm_1c9c27
	bit B_BUTTON_F, a
	jr nz, .asm_1c9c40
	ret
.asm_1c9c27
	ld a, [w1d800]
	cp $01
	jr z, .asm_1c9c33
	ld a, $01
	ld [wGolfMenuOption], a
.asm_1c9c33
	play_sfx SFX_0E3
	xor a
	ld [wSubState], a
	ret
.asm_1c9c40
	play_sfx SFX_0E7
	xor a
	ld [wGolfObj3Duration], a
	ld [wGolfObj3FramesetOffset], a
	ld [w1dc00], a
	ret
; 0x1c9c53

Func_1c9c53: ; 1c9c53 (72:5c53)
	call Func_1c9b53
	call Func_1c9c9e
	ld a, $3c
	ld [wGolfObj8YCoord], a
	ld a, $50
	ld [wGolfObj8XCoord], a
	ld de, Frameset_1cb0d7
	ld hl, wGolfObj8Duration
	call UpdateGolfObjectAnimation
	ld a, [wGolfObj8CurrentFrame]
	ld [wGolfObj8Frame], a
	ld hl, wGolfObj8Sprite
	call AddGolfSprite

	ld hl, wGolfCounter
	ld a, [hl]
	cp $20
	jr nc, .asm_1c9c82
	inc [hl]
	ret
.asm_1c9c82
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wGolfBestScores
	ld a, [wGolfCourse]
	ld d, $00
	ld e, a
	add hl, de
	ld a, [wGolfCourseScore]
	cp [hl]
	jr nc, .asm_1c9c99
	ld [hl], a
.asm_1c9c99
	xor a
	ld [wSubState], a
	ret
; 0x1c9c9e

Func_1c9c9e: ; 1c9c9e (72:5c9e)
	ld hl, wVirtualOAMSprite00YCoord
	dec [hl]
	ld d, $00
	ld a, [wGolfCourseScore]
	ld c, a
	cp GOLF_BASE_SCORE + 1
	jr nc, .positive_score
	cp GOLF_BASE_SCORE
	jr c, .negative_score
	dec [hl]
	ld hl, wVirtualOAMSprite00Frame
	ld [hl], $fe
.negative_score
	ld a, GOLF_BASE_SCORE
	sub c
	ld e, a
	jr .loop_get_digits
.positive_score
	sub GOLF_BASE_SCORE
	ld e, a
.loop_get_digits
	cp 10
	jr c, .got_tens_digit
	sub 10
	ld e, a
	inc d
	jr .loop_get_digits
.got_tens_digit
	ld a, d
	and a
	jr z, .got_ones_digit
	add a
	add $80
	ld hl, wVirtualOAMSprite01Frame
	ld [hl], a
.got_ones_digit
	ld a, e
	add a
	add $80
	ld hl, wVirtualOAMSprite02Frame
	ld [hl], a
	ret
; 0x1c9cdd

; outputs de - *hl word
Calculate2ByteSubtraction: ; 1c9cdd (72:5cdd)
	ld a, e
	sub [hl]
	ld e, a
	inc hl
	ld a, d
	sbc [hl]
	ld d, a
	ret
; 0x1c9ce5

Func_1c9ce5: ; 1c9ce5 (72:5ce5)
	push de
	call Calculate2ByteSubtraction
	jr c, .asm_1c9cf3
	ld a, d
	or e
	jr z, .asm_1c9cf6
	ld a, $02
	jr .done
.asm_1c9cf3
	xor a
	jr .done
.asm_1c9cf6
	inc a
.done
	pop de
	ret
; 0x1c9cf9

Func_1c9cf9: ; 1c9cf9 (72:5cf9)
	ld a, [wGolfDisplayMode]
	cp GOLF_DISPLAY_SPLIT
	jr z, .split
	cp GOLF_DISPLAY_BGMAP1
	jr z, .bgmap1
; bgmap0
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_ON
	jr .got_lcd_config
.split
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_WINON | LCDC_WIN9C00 | LCDC_ON
	jr .got_lcd_config
.bgmap1
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_BG9C00 | LCDC_ON
.got_lcd_config
	ld [w1dc0c], a

	ld a, [wGolfVBlankMode]
	jumptable
	dw VBlank_1c9d1d
	dw VBlank_1c9e8d
	dw VBlank_1c9eb3
	dw VBlank_1c9ef1
; 0x1c9d1d

VBlank_1c9d1d: ; 1c9d1d (72:5d1d)
	call .UpdatePinFlagTiles
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ldh [rVBK], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w1dc25]
	ldh [rWX], a
	ld a, [w1dc0c]
	ldh [rLCDC], a
	ld hl, rHDMA1
	ld a, HIGH(w1d900)
	ld [hli], a
	ld a, LOW(w1d900)
	ld [hli], a
	ld a, $17
	ld [hli], a
	ld a, $40
	ld [hli], a
	ld a, $03
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end

.UpdatePinFlagTiles
	ld hl, w1dc0b
	ld a, [hl]
	cp $18
	jr nc, .frame_3
	cp $10
	jr nc, .frame_2
	cp $08
	jr nc, .frame_1
; frame 0
	ld hl, GolfPinFlag tile 0
	jr .got_tiles
.frame_1
	ld hl, GolfPinFlag tile 4
	jr .got_tiles
.frame_2
	ld hl, GolfPinFlag tile 8
	jr .got_tiles
.frame_3
	ld hl, GolfPinFlag tile 12
.got_tiles
	ld de, w1d900
	ld b, 4 tiles
	call CopyHLToDE

	ld hl, w1dc0b
	ld a, [hl]
	inc a
	and $1f
	ld [hl], a
	ret
; 0x1c9d8d

GolfPinFlag: INCBIN "gfx/golf/golf_pin_flag.2bpp"

VBlank_1c9e8d: ; 1c9e8d (72:5e8d)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ldh [rVBK], a
	ld a, $03
	ld [v1BGMap0 + $145], a
	ld a, [w1dc0c]
	ldh [rLCDC], a
	xor a
	ldh [rVBK], a
	ld [wGolfVBlankMode], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c9eb3

VBlank_1c9eb3: ; 1c9eb3 (72:5eb3)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w1dc25]
	ldh [rWX], a
	ld a, [w1dc0c]
	ldh [rLCDC], a
	ld a, [wGolfWarioTilesBank]
	ld [MBC5RomBank - $100], a
	ld hl, rHDMA1
	ld a, [wGolfWarioTilesPtr + 0]
	ld [hli], a
	ld a, [wGolfWarioTilesPtr + 1]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $7f
	ld [hl], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c9ef1

VBlank_1c9ef1: ; 1c9ef1 (72:5ef1)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ldh [rVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w1dc25]
	ldh [rWX], a
	ld a, [w1dc0c]
	ldh [rLCDC], a
	ld hl, rHDMA1
	ld a, HIGH(w1db90)
	ld [hli], a
	ld a, LOW(w1db90)
	ld [hli], a
	ld a, $0f
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $03
	ld [hl], a
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c9f2e

GolfLobbyVBlank: ; 1c9f2e (72:5f2e)
	ld a, [wGolfVBlankMode]
	jumptable
	dw VBlank_1c9f36
	dw VBlank_1c9f7a
; 0x1c9f36

VBlank_1c9f36: ; 1c9f36 (72:5f36)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	; update the coin number in the Golf Lobby
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ldh [rVBK], a
	ld a, [wGolfNumCoins + 0]
	add a
	add $e0
	ld [v0BGMap0 + $106], a
	inc a
	ld [v0BGMap0 + $126], a
	ld a, [wGolfNumCoins + 1]
	and $f0
	swap a
	add a
	add $e0
	ld [v0BGMap0 + $107], a
	inc a
	ld [v0BGMap0 + $127], a
	ld a, [wGolfNumCoins + 1]
	and $0f
	add a
	add $e0
	ld [v0BGMap0 + $108], a
	inc a
	ld [v0BGMap0 + $128], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c9f7a

VBlank_1c9f7a: ; 1c9f7a (72:5f7a)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [wGolfWarioTilesBank]
	ld [MBC5RomBank - $100], a
	ld hl, rHDMA1
	ld a, [wGolfWarioTilesPtr + 0]
	ld [hli], a
	ld a, [wGolfWarioTilesPtr + 1]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $7f
	ld [hl], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c9fae

Func_1c9fae: ; 1c9fae (72:5fae)
	call Func_1c9fbd
	ld a, [wGolfVBlankMode]
	jumptable
	dw VBlank_1c9fe1
	dw VBlank_1c9ffa
	dw VBlank_1ca033
	dw VBlank_1ca056
; 0x1c9fbd

Func_1c9fbd: ; 1c9fbd (72:5fbd)
	ld a, [wGolfNumCoins + 0]
	add a
	add $a0
	ld hl, wVirtualOAMSprite00Frame
	ld [hl], a
	ld a, [wGolfNumCoins + 1]
	ld b, a
	and $f0
	swap a
	add a
	add $a0
	ld hl, wVirtualOAMSprite01Frame
	ld [hl], a
	ld a, b
	and $0f
	add a
	add $a0
	ld hl, wVirtualOAMSprite02Frame
	ld [hl], a
	ret
; 0x1c9fe1

VBlank_1c9fe1: ; 1c9fe1 (72:5fe1)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, $1
	ldh [rSVBK], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1c9ffa

VBlank_1c9ffa: ; 1c9ffa (72:5ffa)
	ld a, $18
	ld [wdc11 + 0], a
	ld a, $c0
	ld [wdc11 + 1], a
	ld a, $0d
	ld [w1dc13], a

	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, $1
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w1da00
	call Func_2c30
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1ca033

VBlank_1ca033: ; 1ca033 (72:6033)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld hl, w1db00
	call Func_2c46
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1ca056

VBlank_1ca056: ; 1ca056 (72:6056)
	ld a, $18
	ld [wdc11 + 0], a
	ld a, $c0
	ld [wdc11 + 1], a
	ld a, $0d
	ld [w1dc13], a

	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	jp CopyHLToDE

.func
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	xor a
	ld [wGolfVBlankMode], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, w1d900
	call Func_2c30
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x1ca08f

Pals_1ca08f: ; 1ca08f (72:608f)
	rgb 12, 27, 31
	rgb 25, 25, 25
	rgb 28,  0,  0
	rgb  0,  0,  0

	rgb 18, 29,  7
	rgb  2, 17,  2
	rgb  1, 10,  1
	rgb  0,  3,  0

	rgb 12, 27, 31
	rgb  2, 17,  2
	rgb  1, 10,  1
	rgb  0,  3,  0

	rgb 12, 27, 31
	rgb 25, 25, 25
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 13,  8,  3
	rgb 21, 13,  5
	rgb 29, 23, 10
	rgb  0,  0,  0

	rgb 12, 27, 31
	rgb 27, 29, 31
	rgb  8, 22, 31
	rgb  3, 16, 31

	rgb 12, 27, 31
	rgb 14,  0,  0
	rgb 28,  0,  0
	rgb  0,  0,  0

	rgb 12, 27, 31
	rgb 31, 20,  7
	rgb  1, 10,  1
	rgb 18,  7,  2
; 0x1ca0cf

Pals_1ca0cf: ; 1ca0cf (72:60cf)
	rgb 31,  8, 23
	rgb 25, 25, 25
	rgb 28,  0,  0
	rgb  0,  0,  0

	rgb 25, 26,  3
	rgb 13, 13,  0
	rgb  8,  6,  0
	rgb  0,  3,  0

	rgb 31,  8, 23
	rgb 13, 13,  0
	rgb  8,  6,  0
	rgb  0,  3,  0

	rgb 31,  8, 23
	rgb 25, 25, 25
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 13,  8,  3
	rgb 21, 13,  5
	rgb 29, 23, 10
	rgb  0,  0,  0

	rgb 31,  8, 23
	rgb 27, 29, 31
	rgb 23,  8, 23
	rgb 15,  5, 23

	rgb 31,  8, 23
	rgb 14,  0,  0
	rgb 28,  0,  0
	rgb  0,  0,  0

	rgb 31,  8, 23
	rgb 31, 17,  4
	rgb  8,  5,  0
	rgb 22,  6,  0
; 0x1ca10f

Pals_1ca10f: ; 1ca10f (72:610f)
	rgb  3,  3, 31
	rgb 22, 22, 30
	rgb 25,  0,  5
	rgb  0,  0,  0

	rgb 15, 26, 12
	rgb  0, 14,  9
	rgb  0,  7,  7
	rgb  0,  3,  0

	rgb  3,  3, 31
	rgb  0, 14,  9
	rgb  0,  7,  7
	rgb  0,  3,  0

	rgb  3,  3, 31
	rgb 22, 22, 30
	rgb  7,  7, 15
	rgb  0,  0,  0

	rgb 10,  5,  8
	rgb 18, 10, 10
	rgb 26, 20, 15
	rgb  0,  0,  0

	rgb  3,  3, 31
	rgb 17, 17, 31
	rgb  0,  0, 26
	rgb  0,  0, 12

	rgb  3,  3, 31
	rgb 10,  0,  5
	rgb 25,  0,  5
	rgb  0,  0,  5

	rgb  3,  3, 31
	rgb 12, 12, 31
	rgb  0,  0,  8
	rgb  8,  8, 31
; 0x1ca14f

Pals_1ca14f: ; 1ca14f (72:614f)
	rgb 31, 24,  5
	rgb 25, 25, 25
	rgb 28,  0,  0
	rgb  0,  0,  0

	rgb 23, 27,  2
	rgb  7, 15,  0
	rgb  6,  8,  0
	rgb  5,  1,  0

	rgb 31, 24,  5
	rgb  7, 15,  0
	rgb  6,  8,  0
	rgb  5,  1,  0

	rgb 31, 24,  5
	rgb 25, 25, 25
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 13,  8,  3
	rgb 21, 13,  5
	rgb 29, 23, 10
	rgb  0,  0,  0

	rgb 31, 24,  5
	rgb 27, 29, 31
	rgb 28, 17,  7
	rgb 21,  8, 11

	rgb 31, 24,  5
	rgb 14,  0,  0
	rgb 28,  0,  0
	rgb  0,  0,  0

	rgb 31, 24,  5
	rgb 31, 20,  7
	rgb  6,  8,  0
	rgb 18,  7,  2
; 0x1ca18f

Pals_1ca18f: ; 1ca18f (72:618f)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 15, 22, 31
	rgb  3, 16, 31
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 28, 31, 29
	rgb 30, 23,  0
	rgb  4,  5,  0

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb  0, 17, 31

	rgb  0,  0,  0
	rgb 31, 31, 31
	rgb 31,  7,  0
	rgb 31, 21,  8

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  0,  0, 31
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 28,  0,  0
	rgb  5,  0,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0
; 0x1ca1cf

Pals_1ca1cf: ; 1ca1cf (72:61cf)
	rgb 31, 31, 31
	rgb  0, 31, 31
	rgb  0, 12, 26
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 26, 26, 26
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 10, 10, 10
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb  0, 25,  0
	rgb  0, 10,  0

	rgb 31, 31, 31
	rgb 31, 13,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 13,  0
	rgb 31, 27,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 15, 31
	rgb 20,  0, 26
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb 31, 31, 31
	rgb  0,  0,  0
; 0x1ca20f

Pals_1ca20f: ; 1ca20f (72:620f)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 10, 10, 10
	rgb 21, 21, 21
	rgb 31, 31, 31

	rgb 31, 31, 31
	rgb  0, 25,  0
	rgb  0, 25,  0
	rgb 10, 10, 10

	rgb 31, 31, 31
	rgb  0, 25,  0
	rgb  0, 25,  0
	rgb 10, 10, 10

	rgb 31, 31, 31
	rgb 10, 25, 31
	rgb 31,  0,  0
	rgb  0,  0, 10

	rgb 31, 31, 31
	rgb 24, 24, 24
	rgb 13, 13, 13
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31, 20
	rgb 10, 31, 31
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 20, 10,  0
	rgb 30, 20,  0
	rgb  5,  1,  0
; 0x1ca24f

Pals_1ca24f: ; 1ca24f (72:624f)
	rgb 31, 31, 31
	rgb 19, 19, 19
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 21, 26, 17
	rgb  8, 16,  4
	rgb  3,  8,  0
	rgb  2,  0,  0

	rgb  0,  0, 21
	rgb 18, 18, 31
	rgb 10,  9, 31
	rgb  0,  0,  0

	rgb 31, 28, 15
	rgb 10,  4, 17
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb 14, 27, 31
	rgb  0, 18, 30
	rgb 10, 10, 10
	rgb  0,  4,  0

	rgb 28, 21,  3
	rgb 21, 14,  3
	rgb 16,  9,  3
	rgb  8,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb  0, 10,  0
	rgb  0,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb 30,  0,  0
	rgb  0,  4,  0
; 0x1ca28f

Pals_1ca28f: ; 1ca28f (72:628f)
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0,  0, 21
	rgb 18, 18, 31
	rgb 10,  9, 31
	rgb  0,  0,  0

	rgb 31, 28, 15
	rgb 10,  4, 17
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb 31, 17, 28
	rgb 31,  4, 15
	rgb 10, 10, 10
	rgb  0,  4,  0

	rgb 28, 21,  3
	rgb 21, 14,  3
	rgb 16,  9,  3
	rgb  8,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb  0, 10,  0
	rgb  0,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb 30,  0,  0
	rgb  0,  4,  0
; 0x1ca2cf

Pals_1ca2cf: ; 1ca2cf (72:62cf)
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb 25, 16,  0
	rgb 14,  7,  1

	rgb  0,  0, 21
	rgb 18, 18, 31
	rgb 10,  9, 31
	rgb  0,  0,  0

	rgb 31, 28, 15
	rgb 10,  4, 17
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb 27, 15, 31
	rgb 20,  3, 27
	rgb 10, 10, 10
	rgb  0,  4,  0

	rgb 28, 21,  3
	rgb 21, 14,  3
	rgb 16,  9,  3
	rgb  8,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb  0, 10,  0
	rgb  0,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb 30,  0,  0
	rgb  0,  4,  0
; 0x1ca30f

Pals_1ca30f: ; 1ca30f (72:630f)
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 13, 21, 31
	rgb  0,  0, 23
	rgb  0,  0,  0

	rgb  0,  0, 21
	rgb 18, 18, 31
	rgb 10,  9, 31
	rgb  0,  0,  0

	rgb 31, 28, 15
	rgb 10,  4, 17
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb 31, 29, 15
	rgb 28, 21,  1
	rgb 10, 10, 10
	rgb  0,  4,  0

	rgb 28, 21,  3
	rgb 21, 14,  3
	rgb 16,  9,  3
	rgb  8,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb  0, 10,  0
	rgb  0,  4,  0

	rgb  6, 30,  0
	rgb  0, 16,  0
	rgb 30,  0,  0
	rgb  0,  4,  0
; 0x1ca34f

Pals_1ca34f: ; 1ca34f (72:634f)
	rgb  0, 22, 16
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 27
	rgb 10, 10,  8
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 25, 16,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 13,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 13,  0
	rgb 31, 31,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 25,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 14, 26,  6
	rgb  0,  0,  0
; 0x1ca38f

GolfFlagNumbersGfx:   INCBIN "gfx/golf/golf_flag_numbers.2bpp"
GolfParNumbersGfx:    INCBIN "gfx/golf/golf_par_numbers.2bpp"
GolfStrokeNumbersGfx: INCBIN "gfx/golf/golf_stroke_numbers.2bpp"
GolfHoleFlagGfx:      INCBIN "gfx/golf/golf_hole_flag.2bpp"

	INCROM $1ca66f, $1ca6cf

OAM_1ca6cf: ; 1ca6cf (72:66cf)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19
	dw .frame_20
	dw .frame_21
	dw .frame_22
	dw .frame_23
	dw .frame_24
	dw .frame_25
	dw .frame_26
	dw .frame_27
	dw .frame_28
	dw .frame_29
	dw .frame_30
	dw .frame_31
	dw .frame_32
	dw .frame_33
	dw .frame_34
	dw .frame_35
	dw .frame_36
	dw .frame_37
	dw .frame_38
	dw .frame_39
	dw .frame_40
	dw .frame_41
	dw .frame_42
	dw .frame_43
	dw .frame_44
	dw .frame_45
	dw .frame_46
	dw .frame_47
	dw .frame_48
	dw .frame_49
	dw .frame_50
	dw .frame_51
	dw .frame_52
	dw .frame_53
	dw .frame_54
	dw .frame_55
	dw .frame_56
	dw .frame_57
	dw .frame_58
	dw .frame_59
	dw .frame_60
	dw .frame_61
	dw .frame_62
	dw .frame_63
	dw .frame_64
	dw .frame_65
	dw .frame_66
	dw .frame_67
	dw .frame_68
	dw .frame_69
	dw .frame_70
	dw .frame_71
	dw .frame_72
	dw .frame_73
	dw .frame_74
	dw .frame_75
	dw .frame_76
	dw .frame_77
	dw .frame_78
	dw .frame_79
	dw .frame_80
	dw .frame_81
	dw .frame_82
	dw .frame_83
	dw .frame_84
	dw .frame_85
	dw .frame_86
	dw .frame_87
	dw .frame_88
	dw .frame_89
	dw .frame_90
	dw .frame_91
	dw .frame_92
	dw .frame_93
	dw .frame_94
	dw .frame_95
	dw .frame_96
	dw .frame_97
	dw .frame_98
	dw .frame_99
	dw .frame_100
	dw .frame_101
	dw .frame_102
	dw .frame_103
	dw .frame_104
	dw .frame_105
	dw .frame_106
	dw .frame_107
	dw .frame_108
	dw .frame_109
	dw .frame_110
	dw .frame_111
	dw .frame_112
	dw .frame_113
	dw .frame_114
	dw .frame_115
	dw .frame_116
	dw .frame_117
	dw .frame_118
	dw .frame_119

.frame_0
	frame_oam -30,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $20, 6 | TILE_BANK
	frame_oam -32,   8, $22, 6 | TILE_BANK
	frame_oam -32,  16, $24, 6 | TILE_BANK
	frame_oam -16,   0, $26, 6 | TILE_BANK
	frame_oam -16,   8, $28, 6 | TILE_BANK
	frame_oam -16,  16, $2a, 6 | TILE_BANK
	db $80

.frame_1
	frame_oam -29,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $40, 6 | TILE_BANK
	frame_oam -32,   8, $42, 6 | TILE_BANK
	frame_oam -32,  16, $44, 6 | TILE_BANK
	frame_oam -16,   0, $46, 6 | TILE_BANK
	frame_oam -16,   8, $48, 6 | TILE_BANK
	frame_oam -16,  16, $4a, 6 | TILE_BANK
	db $80

.frame_2
	frame_oam -29,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $60, 6 | TILE_BANK
	frame_oam -32,   8, $62, 6 | TILE_BANK
	frame_oam -32,  16, $64, 6 | TILE_BANK
	frame_oam -16,   0, $66, 6 | TILE_BANK
	frame_oam -16,   8, $68, 6 | TILE_BANK
	frame_oam -16,  16, $6a, 6 | TILE_BANK
	db $80

.frame_3
	frame_oam -30,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $80, 6 | TILE_BANK
	frame_oam -32,   8, $82, 6 | TILE_BANK
	frame_oam -32,  16, $84, 6 | TILE_BANK
	frame_oam -16,   0, $86, 6 | TILE_BANK
	frame_oam -16,   8, $88, 6 | TILE_BANK
	frame_oam -16,  16, $8a, 6 | TILE_BANK
	db $80

.frame_4
	frame_oam -30,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $2e, 6 | TILE_BANK
	frame_oam -32,   8, $30, 6 | TILE_BANK
	frame_oam -32,  16, $32, 6 | TILE_BANK
	frame_oam -16,   0, $26, 6 | TILE_BANK
	frame_oam -16,   8, $28, 6 | TILE_BANK
	frame_oam -16,  16, $2a, 6 | TILE_BANK
	db $80

.frame_5
	frame_oam -29,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $4e, 6 | TILE_BANK
	frame_oam -32,   8, $50, 6 | TILE_BANK
	frame_oam -32,  16, $52, 6 | TILE_BANK
	frame_oam -16,   0, $46, 6 | TILE_BANK
	frame_oam -16,   8, $48, 6 | TILE_BANK
	frame_oam -16,  16, $4a, 6 | TILE_BANK
	db $80

.frame_6
	frame_oam -29,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $6e, 6 | TILE_BANK
	frame_oam -32,   8, $70, 6 | TILE_BANK
	frame_oam -32,  16, $72, 6 | TILE_BANK
	frame_oam -16,   0, $66, 6 | TILE_BANK
	frame_oam -16,   8, $68, 6 | TILE_BANK
	frame_oam -16,  16, $6a, 6 | TILE_BANK
	db $80

.frame_7
	frame_oam -30,   8, $00, 6 | TILE_BANK
	frame_oam -32,   0, $8e, 6 | TILE_BANK
	frame_oam -32,   8, $90, 6 | TILE_BANK
	frame_oam -32,  16, $92, 6 | TILE_BANK
	frame_oam -16,   0, $86, 6 | TILE_BANK
	frame_oam -16,   8, $88, 6 | TILE_BANK
	frame_oam -16,  16, $8a, 6 | TILE_BANK
	db $80

.frame_8
	frame_oam  -9,  30, $96, 0
	frame_oam  -9,  38, $96, 0 | X_FLIP
	frame_oam -25,  30, $f0, 5 | TILE_BANK
	frame_oam -25,  38, $f2, 5 | TILE_BANK
	db $80

.frame_9
	frame_oam   6,  -8, $96, 0
	frame_oam   6,   0, $96, 0 | X_FLIP
	frame_oam   0,  -4, $94, 5
	db $80

.frame_10
	frame_oam   0,  -4, $94, 6
	frame_oam   6,  -8, $98, 0
	frame_oam   6,   0, $98, 0 | X_FLIP
	db $80

.frame_11
	frame_oam -16, -40, $e0, 3
	frame_oam -16, -32, $e2, 3
	frame_oam -16, -24, $e4, 4
	frame_oam -16, -16, $e6, 4
	frame_oam -16,  -8, $e8, 4
	frame_oam -16,   0, $ea, 4
	frame_oam -16,   8, $ec, 4
	frame_oam -16,  16, $ee, 4
	frame_oam -16,  24, $f0, 4
	frame_oam -16,  32, $f2, 4
	db $80

.frame_12
	frame_oam -16, -20, $a4, 0 | TILE_BANK
	frame_oam -16, -13, $b6, 0 | TILE_BANK
	frame_oam -16,  -7, $a8, 0 | TILE_BANK
	frame_oam -16,  -1, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	frame_oam -16,  15, $d4, 0 | TILE_BANK
	db $80

.frame_13
	frame_oam -17, -20, $a4, 0 | TILE_BANK
	frame_oam -16, -13, $b6, 0 | TILE_BANK
	frame_oam -16,  -7, $a8, 0 | TILE_BANK
	frame_oam -16,  -1, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	frame_oam -16,  15, $d4, 0 | TILE_BANK
	db $80

.frame_14
	frame_oam -18, -20, $a4, 0 | TILE_BANK
	frame_oam -17, -13, $b6, 0 | TILE_BANK
	frame_oam -16,  -7, $a8, 0 | TILE_BANK
	frame_oam -16,  -1, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	frame_oam -16,  15, $d4, 0 | TILE_BANK
	db $80

.frame_15
	frame_oam -17, -20, $a4, 0 | TILE_BANK
	frame_oam -18, -13, $b6, 0 | TILE_BANK
	frame_oam -17,  -7, $a8, 0 | TILE_BANK
	frame_oam -16,  -1, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	frame_oam -16,  15, $d4, 0 | TILE_BANK
	db $80

.frame_16
	frame_oam -16, -20, $a4, 0 | TILE_BANK
	frame_oam -17, -13, $b6, 0 | TILE_BANK
	frame_oam -18,  -7, $a8, 0 | TILE_BANK
	frame_oam -17,  -1, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	frame_oam -16,  15, $d4, 0 | TILE_BANK
	db $80

.frame_17
	frame_oam -16, -20, $a4, 0 | TILE_BANK
	frame_oam -16, -13, $b6, 0 | TILE_BANK
	frame_oam -17,  -7, $a8, 0 | TILE_BANK
	frame_oam -18,  -1, $a0, 0 | TILE_BANK
	frame_oam -17,   6, $c2, 0 | TILE_BANK
	frame_oam -16,  15, $d4, 0 | TILE_BANK
	db $80

.frame_18
	frame_oam -16, -20, $a4, 0 | TILE_BANK
	frame_oam -16, -13, $b6, 0 | TILE_BANK
	frame_oam -16,  -7, $a8, 0 | TILE_BANK
	frame_oam -17,  -1, $a0, 0 | TILE_BANK
	frame_oam -18,   6, $c2, 0 | TILE_BANK
	frame_oam -17,  15, $d4, 0 | TILE_BANK
	db $80

.frame_19
	frame_oam -16, -20, $a4, 0 | TILE_BANK
	frame_oam -16, -13, $b6, 0 | TILE_BANK
	frame_oam -16,  -7, $a8, 0 | TILE_BANK
	frame_oam -16,  -1, $a0, 0 | TILE_BANK
	frame_oam -17,   6, $c2, 0 | TILE_BANK
	frame_oam -18,  15, $d4, 0 | TILE_BANK
	db $80

.frame_20
	frame_oam -16, -20, $a4, 0 | TILE_BANK
	frame_oam -16, -13, $b6, 0 | TILE_BANK
	frame_oam -16,  -7, $a8, 0 | TILE_BANK
	frame_oam -16,  -1, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	frame_oam -17,  15, $d4, 0 | TILE_BANK
	db $80

.frame_21
	frame_oam -32, -14, $ac, 0 | TILE_BANK
	frame_oam -32,  -7, $a0, 0 | TILE_BANK
	frame_oam -32,   0, $b8, 0 | TILE_BANK
	frame_oam -32,   7, $a8, 0 | TILE_BANK
	frame_oam -16, -14, $bc, 0 | TILE_BANK
	frame_oam -16,  -7, $ca, 0 | TILE_BANK
	frame_oam -16,   0, $a8, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	db $80

.frame_22
	frame_oam -32, -16, $ac, 0 | TILE_BANK
	frame_oam -32,  -8, $a0, 0 | TILE_BANK
	frame_oam -32,   0, $b8, 0 | TILE_BANK
	frame_oam -32,   8, $a8, 0 | TILE_BANK
	frame_oam -16, -14, $bc, 0 | TILE_BANK
	frame_oam -16,  -7, $ca, 0 | TILE_BANK
	frame_oam -16,   0, $a8, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	db $80

.frame_23
	frame_oam -32, -17, $ac, 0 | TILE_BANK
	frame_oam -32,  -8, $a0, 0 | TILE_BANK
	frame_oam -32,   1, $b8, 0 | TILE_BANK
	frame_oam -32,  10, $a8, 0 | TILE_BANK
	frame_oam -16, -14, $bc, 0 | TILE_BANK
	frame_oam -16,  -7, $ca, 0 | TILE_BANK
	frame_oam -16,   0, $a8, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	db $80

.frame_24
	frame_oam -32, -14, $ac, 0 | TILE_BANK
	frame_oam -32,  -7, $a0, 0 | TILE_BANK
	frame_oam -32,   0, $b8, 0 | TILE_BANK
	frame_oam -32,   7, $a8, 0 | TILE_BANK
	frame_oam -16, -16, $bc, 0 | TILE_BANK
	frame_oam -16,  -8, $ca, 0 | TILE_BANK
	frame_oam -16,   0, $a8, 0 | TILE_BANK
	frame_oam -16,   7, $c2, 0 | TILE_BANK
	db $80

.frame_25
	frame_oam -32, -14, $ac, 0 | TILE_BANK
	frame_oam -32,  -7, $a0, 0 | TILE_BANK
	frame_oam -32,   0, $b8, 0 | TILE_BANK
	frame_oam -32,   7, $a8, 0 | TILE_BANK
	frame_oam -16, -17, $bc, 0 | TILE_BANK
	frame_oam -16,  -8, $ca, 0 | TILE_BANK
	frame_oam -16,   1, $a8, 0 | TILE_BANK
	frame_oam -16,   9, $c2, 0 | TILE_BANK
	db $80

.frame_26
	frame_oam -16,   0, $f4, 7 | Y_FLIP
	frame_oam -16,  -7, $f6, 7 | X_FLIP | Y_FLIP
	db $80

.frame_27
	frame_oam -16,  -7, $f4, 7 | X_FLIP | Y_FLIP
	frame_oam -16,   0, $f6, 7 | Y_FLIP
	db $80

.frame_28
	frame_oam -15,   0, $f6, 7 | Y_FLIP
	frame_oam -15,  -7, $f6, 7 | X_FLIP | Y_FLIP
	db $80

.frame_29
	frame_oam -15,  -8, $c0, 7 | Y_FLIP
	frame_oam -15,   0, $c2, 7 | Y_FLIP
	db $80

.frame_30
	frame_oam -15,  -8, $f8, 7
	frame_oam -15,   0, $fa, 7
	db $80

.frame_31
	frame_oam -15,  -8, $c0, 7
	frame_oam -15,   0, $c2, 7
	db $80

.frame_32
	frame_oam -15,  -1, $f6, 7
	frame_oam -15,  -8, $f6, 7 | X_FLIP
	db $80

.frame_33
	frame_oam -15,   0, $c0, 7 | X_FLIP
	frame_oam -15,  -8, $c2, 7 | X_FLIP
	db $80

.frame_34
	frame_oam -15,   0, $f8, 7 | X_FLIP
	frame_oam -15,  -8, $fa, 7 | X_FLIP
	db $80

.frame_35
	frame_oam -15,   0, $c0, 7 | X_FLIP | Y_FLIP
	frame_oam -15,  -8, $c2, 7 | X_FLIP | Y_FLIP
	db $80

.frame_36
	frame_oam -16,   0, $c4, 1
	frame_oam -16,  -7, $c4, 1 | X_FLIP
	db $80

.frame_37
	frame_oam -16,   0, $c6, 1
	frame_oam -16,  -7, $c6, 1 | X_FLIP
	db $80

.frame_38
	frame_oam -16,   0, $c8, 1
	frame_oam -16,  -7, $c8, 1 | X_FLIP
	db $80

.frame_39
	frame_oam -16,   0, $ca, 1
	frame_oam -16,  -7, $ca, 1 | X_FLIP
	db $80

.frame_40
	frame_oam -16,   0, $cc, 1
	frame_oam -16,  -7, $cc, 1 | X_FLIP
	db $80

.frame_41
	frame_oam -16,   0, $ce, 1
	frame_oam -16,  -7, $ce, 1 | X_FLIP
	db $80

.frame_42
	frame_oam -16,   0, $d0, 1
	frame_oam -16,  -7, $d0, 1 | X_FLIP
	db $80

.frame_43
	frame_oam -13,  -5, $d6, 0
	db $80

.frame_44
	frame_oam -15,  -7, $d4, 0
	db $80

.frame_45
	frame_oam -18,  -6, $d2, 0
	db $80

.frame_46
	frame_oam -16,   0, $9e, 7
	db $80

.frame_47
	frame_oam -13,  -1, $d6, 0
	db $80

.frame_48
	frame_oam -16,   0, $d4, 0
	db $80

.frame_49
	frame_oam -18,  -3, $d2, 0
	db $80

.frame_50
	frame_oam -16,  -8, $a0, 6
	frame_oam -16,   0, $a2, 6
	frame_oam -16,   0, $f6, 7
	frame_oam -16,  -7, $f6, 7 | X_FLIP
	db $80

.frame_51
	frame_oam -16,  -8, $a4, 6
	frame_oam -16,   0, $a6, 6
	frame_oam -16,   0, $f6, 7
	frame_oam -16,  -7, $f6, 7 | X_FLIP
	db $80

.frame_52
	frame_oam -16,  -8, $a8, 6
	frame_oam -16,   0, $aa, 6
	frame_oam -16,   0, $f6, 7
	frame_oam -16,  -7, $f6, 7 | X_FLIP
	db $80

.frame_53
	frame_oam -16,  -8, $ac, 6
	frame_oam -16,   0, $ae, 6
	db $80

.frame_54
	frame_oam -16,  -8, $b0, 6
	frame_oam -16,   0, $b2, 6
	frame_oam -33,  -5, $bc, 6
	db $80

.frame_55
	frame_oam -16,  -8, $b4, 6
	frame_oam -16,   0, $b6, 6
	frame_oam -34,  -2, $be, 6
	db $80

.frame_56
	frame_oam -16,   0, $b8, 6
	frame_oam -16,  -7, $b8, 6 | X_FLIP
	frame_oam -23,  -4, $da, 6
	db $80

.frame_57
	frame_oam -16,   0, $b8, 6
	frame_oam -16,  -7, $b8, 6 | X_FLIP
	frame_oam -32,  -4, $d8, 6
	db $80

.frame_58
	frame_oam -16,   0, $b8, 6
	frame_oam -16,  -7, $b8, 6 | X_FLIP
	frame_oam -32,  -4, $da, 6
	db $80

.frame_59
	frame_oam -16,   0, $b8, 6
	frame_oam -16,  -7, $b8, 6 | X_FLIP
	db $80

.frame_60
	frame_oam -16,   0, $ba, 6
	frame_oam -16,  -7, $ba, 6 | X_FLIP
	db $80

.frame_61
	frame_oam -12,   0, $dc, 7
	frame_oam -12,  -7, $dc, 7 | X_FLIP
	frame_oam -28,  -7, $0a, 6 | TILE_BANK
	frame_oam -32,   1, $0c, 6 | TILE_BANK
	db $80

.frame_62
	frame_oam -12,  -2, $dc, 7
	frame_oam -12,  -9, $dc, 7 | X_FLIP
	frame_oam -28,  -9, $0e, 6 | TILE_BANK
	frame_oam -32,  -1, $10, 6 | TILE_BANK
	db $80

.frame_63
	frame_oam -12,  -3, $dc, 7
	frame_oam -12, -10, $dc, 7 | X_FLIP
	frame_oam -28, -10, $12, 6 | TILE_BANK
	frame_oam -32,  -2, $14, 6 | TILE_BANK
	db $80

.frame_64
	frame_oam -12,  -2, $dc, 7
	frame_oam -12,  -9, $dc, 7 | X_FLIP
	frame_oam -28,  -9, $16, 6 | TILE_BANK
	frame_oam -32,  -1, $18, 6 | TILE_BANK
	db $80

.frame_65
	frame_oam -12,   2, $dc, 7
	frame_oam -12,  -5, $dc, 7 | X_FLIP
	frame_oam -28,  -5, $0e, 6 | TILE_BANK
	frame_oam -32,   3, $10, 6 | TILE_BANK
	db $80

.frame_66
	frame_oam -12,   3, $dc, 7
	frame_oam -12,  -4, $dc, 7 | X_FLIP
	frame_oam -28,  -4, $12, 6 | TILE_BANK
	frame_oam -32,   4, $14, 6 | TILE_BANK
	db $80

.frame_67
	frame_oam -12,   2, $dc, 7
	frame_oam -12,  -5, $dc, 7 | X_FLIP
	frame_oam -28,  -5, $16, 6 | TILE_BANK
	frame_oam -32,   3, $18, 6 | TILE_BANK
	db $80

.frame_68
	frame_oam -32,  -8, $bc, 0 | TILE_BANK
	frame_oam -32,   2, $a2, 0 | TILE_BANK
	db $80

.frame_69
	frame_oam -30,  -8, $bc, 0 | TILE_BANK
	frame_oam -32,   2, $a2, 0 | TILE_BANK
	db $80

.frame_70
	frame_oam -28,  -8, $bc, 0 | TILE_BANK
	frame_oam -32,   2, $a2, 0 | TILE_BANK
	db $80

.frame_71
	frame_oam -25,  -8, $bc, 0 | TILE_BANK
	frame_oam -32,   2, $a2, 0 | TILE_BANK
	db $80

.frame_72
	frame_oam -22,  -8, $bc, 0 | TILE_BANK
	frame_oam -32,   2, $a2, 0 | TILE_BANK
	db $80

.frame_73
	frame_oam -18,  -8, $bc, 0 | TILE_BANK
	frame_oam -30,   2, $a2, 0 | TILE_BANK
	db $80

.frame_74
	frame_oam -14,  -8, $bc, 0 | TILE_BANK
	frame_oam -28,   2, $a2, 0 | TILE_BANK
	db $80

.frame_75
	frame_oam -16,  -8, $bc, 0 | TILE_BANK
	frame_oam -25,   2, $a2, 0 | TILE_BANK
	db $80

.frame_76
	frame_oam -17,  -8, $bc, 0 | TILE_BANK
	frame_oam -22,   2, $a2, 0 | TILE_BANK
	db $80

.frame_77
	frame_oam -16,  -8, $bc, 0 | TILE_BANK
	frame_oam -18,   2, $a2, 0 | TILE_BANK
	db $80

.frame_78
	frame_oam -14,  -8, $bc, 0 | TILE_BANK
	frame_oam -14,   2, $a2, 0 | TILE_BANK
	db $80

.frame_79
	frame_oam -14,  -8, $bc, 0 | TILE_BANK
	frame_oam -16,   2, $a2, 0 | TILE_BANK
	db $80

.frame_80
	frame_oam -14,  -8, $bc, 0 | TILE_BANK
	frame_oam -17,   2, $a2, 0 | TILE_BANK
	db $80

.frame_81
	frame_oam -16, -18, $c2, 0 | TILE_BANK
	frame_oam -16, -11, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   3, $ac, 0 | TILE_BANK
	frame_oam -16,  10, $ae, 0 | TILE_BANK
	db $80

.frame_82
	frame_oam -16, -19, $c2, 0 | TILE_BANK
	frame_oam -16, -11, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   3, $ac, 0 | TILE_BANK
	frame_oam -16,  11, $ae, 0 | TILE_BANK
	db $80

.frame_83
	frame_oam -16, -20, $c2, 0 | TILE_BANK
	frame_oam -16, -12, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   4, $ac, 0 | TILE_BANK
	frame_oam -16,  12, $ae, 0 | TILE_BANK
	db $80

.frame_84
	frame_oam -16, -22, $c2, 0 | TILE_BANK
	frame_oam -16, -13, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   5, $ac, 0 | TILE_BANK
	frame_oam -16,  14, $ae, 0 | TILE_BANK
	db $80

.frame_85
	frame_oam -16, -24, $c2, 0 | TILE_BANK
	frame_oam -16, -14, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   6, $ac, 0 | TILE_BANK
	frame_oam -16,  16, $ae, 0 | TILE_BANK
	db $80

.frame_86
	frame_oam -16, -17, $c2, 0 | TILE_BANK
	frame_oam -16, -11, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   3, $ac, 0 | TILE_BANK
	frame_oam -16,   9, $ae, 0 | TILE_BANK
	db $80

.frame_87
	frame_oam -16, -16, $c2, 0 | TILE_BANK
	frame_oam -16, -10, $bc, 0 | TILE_BANK
	frame_oam -16,  -4, $c8, 0 | TILE_BANK
	frame_oam -16,   2, $ac, 0 | TILE_BANK
	frame_oam -16,   8, $ae, 0 | TILE_BANK
	db $80

.frame_88
	frame_oam -16, -21, $a2, 0 | TILE_BANK
	frame_oam -16, -14, $c8, 0 | TILE_BANK
	frame_oam -16,  -7, $ba, 0 | TILE_BANK
	frame_oam -16,   0, $b4, 0 | TILE_BANK
	frame_oam -16,   7, $a8, 0 | TILE_BANK
	frame_oam -16,  13, $c2, 0 | TILE_BANK
	db $80

.frame_89
	frame_oam -16, -22, $a2, 0 | TILE_BANK
	frame_oam -16, -14, $c8, 0 | TILE_BANK
	frame_oam -16,  -7, $ba, 0 | TILE_BANK
	frame_oam -16,   0, $b4, 0 | TILE_BANK
	frame_oam -16,   7, $a8, 0 | TILE_BANK
	frame_oam -16,  13, $c2, 0 | TILE_BANK
	db $80

.frame_90
	frame_oam -16, -24, $a2, 0 | TILE_BANK
	frame_oam -16, -15, $c8, 0 | TILE_BANK
	frame_oam -16,  -7, $ba, 0 | TILE_BANK
	frame_oam -16,   0, $b4, 0 | TILE_BANK
	frame_oam -16,   7, $a8, 0 | TILE_BANK
	frame_oam -16,  13, $c2, 0 | TILE_BANK
	db $80

.frame_91
	frame_oam -16, -25, $a2, 0 | TILE_BANK
	frame_oam -16, -17, $c8, 0 | TILE_BANK
	frame_oam -16,  -8, $ba, 0 | TILE_BANK
	frame_oam -16,   0, $b4, 0 | TILE_BANK
	frame_oam -16,   7, $a8, 0 | TILE_BANK
	frame_oam -16,  13, $c2, 0 | TILE_BANK
	db $80

.frame_92
	frame_oam -16, -25, $a2, 0 | TILE_BANK
	frame_oam -16, -18, $c8, 0 | TILE_BANK
	frame_oam -16, -10, $ba, 0 | TILE_BANK
	frame_oam -16,  -1, $b4, 0 | TILE_BANK
	frame_oam -16,   7, $a8, 0 | TILE_BANK
	frame_oam -16,  13, $c2, 0 | TILE_BANK
	db $80

.frame_93
	frame_oam -16, -25, $a2, 0 | TILE_BANK
	frame_oam -16, -18, $c8, 0 | TILE_BANK
	frame_oam -16, -11, $ba, 0 | TILE_BANK
	frame_oam -16,  -3, $b4, 0 | TILE_BANK
	frame_oam -16,   6, $a8, 0 | TILE_BANK
	frame_oam -16,  13, $c2, 0 | TILE_BANK
	db $80

.frame_94
	frame_oam -16, -25, $a2, 0 | TILE_BANK
	frame_oam -16, -18, $c8, 0 | TILE_BANK
	frame_oam -16, -11, $ba, 0 | TILE_BANK
	frame_oam -16,  -4, $b4, 0 | TILE_BANK
	frame_oam -16,   4, $a8, 0 | TILE_BANK
	frame_oam -16,  12, $c2, 0 | TILE_BANK
	db $80

.frame_95
	frame_oam -16, -25, $a2, 0 | TILE_BANK
	frame_oam -16, -18, $c8, 0 | TILE_BANK
	frame_oam -16, -11, $ba, 0 | TILE_BANK
	frame_oam -16,  -4, $b4, 0 | TILE_BANK
	frame_oam -16,   3, $a8, 0 | TILE_BANK
	frame_oam -16,  10, $c2, 0 | TILE_BANK
	db $80

.frame_96
	frame_oam -16, -25, $a2, 0 | TILE_BANK
	frame_oam -16, -18, $c8, 0 | TILE_BANK
	frame_oam -16, -11, $ba, 0 | TILE_BANK
	frame_oam -16,  -4, $b4, 0 | TILE_BANK
	frame_oam -16,   3, $a8, 0 | TILE_BANK
	frame_oam -16,   9, $c2, 0 | TILE_BANK
	db $80

.frame_97
	frame_oam -16, -11, $c0, 0 | TILE_BANK
	frame_oam -16,  -4, $a0, 0 | TILE_BANK
	frame_oam -16,   3, $c2, 0 | TILE_BANK
	db $80

.frame_98
	frame_oam -16, -12, $c0, 0 | TILE_BANK
	frame_oam -16,  -4, $a0, 0 | TILE_BANK
	frame_oam -16,   4, $c2, 0 | TILE_BANK
	db $80

.frame_99
	frame_oam -16, -13, $c0, 0 | TILE_BANK
	frame_oam -16,  -4, $a0, 0 | TILE_BANK
	frame_oam -16,   5, $c2, 0 | TILE_BANK
	db $80

.frame_100
	frame_oam -16, -14, $c0, 0 | TILE_BANK
	frame_oam -16,  -4, $a0, 0 | TILE_BANK
	frame_oam -16,   6, $c2, 0 | TILE_BANK
	db $80

.frame_101
	frame_oam -16,   0, $fc, 6
	frame_oam -16,  -7, $fc, 6 | X_FLIP
	db $80

.frame_102
	frame_oam -16,   0, $9e, 0
	db $80

.frame_103
	frame_oam -16, -16, $9c, 5
	frame_oam -16,  -8, $9e, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_104
	frame_oam -16, -16, $9a, 5
	frame_oam -16,  -8, $9e, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_105
	frame_oam -16, -16, $c6, 0 | TILE_BANK
	frame_oam -16,  -8, $bc, 0 | TILE_BANK
	frame_oam -16,   0, $c6, 0 | TILE_BANK
	frame_oam -16,   8, $a0, 0 | TILE_BANK
	frame_oam -16,  16, $b6, 0 | TILE_BANK
	db $80

.frame_106
	frame_oam -15, -16, $9c, 5
	frame_oam -16,  -8, $9e, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_107
	frame_oam -13, -16, $9c, 5
	frame_oam -15,  -8, $9e, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_108
	frame_oam -13, -16, $9c, 5
	frame_oam -13,  -8, $9e, 0
	frame_oam -15,   0, $9e, 0
	db $80

.frame_109
	frame_oam -13, -16, $9c, 5
	frame_oam -13,  -8, $9e, 0
	frame_oam -13,   0, $9e, 0
	db $80

.frame_110
	frame_oam -12, -16, $9c, 5
	frame_oam -12,  -8, $9e, 0
	frame_oam -12,   0, $9e, 0
	db $80

.frame_111
	frame_oam -19, -16, $9a, 5
	frame_oam -16,  -8, $9e, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_112
	frame_oam -21, -16, $9a, 5
	frame_oam -19,  -8, $9e, 0
	frame_oam -16,   0, $9e, 0
	db $80

.frame_113
	frame_oam -22, -16, $9a, 5
	frame_oam -21,  -8, $9e, 0
	frame_oam -19,   0, $9e, 0
	db $80

.frame_114
	frame_oam -22, -16, $9a, 5
	frame_oam -22,  -8, $9e, 0
	frame_oam -21,   0, $9e, 0
	db $80

.frame_115
	frame_oam -21, -16, $9a, 5
	frame_oam -22,  -8, $9e, 0
	frame_oam -22,   0, $9e, 0
	db $80

.frame_116
	frame_oam -19, -16, $9a, 5
	frame_oam -21,  -8, $9e, 0
	frame_oam -22,   0, $9e, 0
	db $80

.frame_117
	frame_oam -16, -16, $9a, 5
	frame_oam -19,  -8, $9e, 0
	frame_oam -21,   0, $9e, 0
	db $80

.frame_118
	frame_oam -16, -16, $9a, 5
	frame_oam -16,  -8, $9e, 0
	frame_oam -19,   0, $9e, 0
	db $80

.frame_119
	frame_oam -16, -40, $36, 7 | TILE_BANK
	frame_oam -16, -32, $38, 7 | TILE_BANK
	frame_oam -16, -24, $3a, 6 | TILE_BANK
	frame_oam -16, -16, $3c, 6 | TILE_BANK
	frame_oam -16,  -8, $3e, 6 | TILE_BANK
	frame_oam -16,   0, $56, 7 | TILE_BANK
	frame_oam -16,   8, $58, 7 | TILE_BANK
	frame_oam -16,  16, $5a, 6 | TILE_BANK
	frame_oam -16,  24, $5c, 6 | TILE_BANK
	frame_oam -16,  32, $5e, 6 | TILE_BANK
	db $80
; 0x1caf6f

Frameset_1caf6f: ; 1caf6f (72:6f6f)
	db $00,  5
	db $01,  5
	db $02,  5
	db $03,  5
	db $ff
; 0x1caf78

	INCROM $1caf78, $1caf81

Frameset_1caf81: ; 1caf81 (72:6f81)
	db $08,  4
	db $ff
; 0x1caf84

Frameset_1caf84: ; 1caf84 (72:6f84)
	db $09,  4
	db $ff
; 0x1caf87

Frameset_1caf87: ; 1caf87 (72:6f87)
	db $0a,  4
	db $ff
; 0x1caf8a

Frameset_1caf8a: ; 1caf8a (72:6f8a)
	db $0b,  4
	db $ff
; 0x1caf8d

Frameset_1caf8d: ; 1caf8d (72:6f8d)
	db $0c, 10
	db $0d,  4
	db $0e,  4
	db $0f,  4
	db $10,  4
	db $11,  4
	db $12,  4
	db $13,  4
	db $14,  4
	db $ff
; 0x1cafa0

Frameset_1cafa0: ; 1cafa0 (72:6fa0)
	db $15,  8
	db $16,  4
	db $17,  8
	db $16,  4
	db $15,  8
	db $18,  4
	db $19,  8
	db $18,  4
	db $ff
; 0x1cafb1

Frameset_1cafb1: ; 1cafb1 (72:6fb1)
	db $1a,  8
	db $1b,  8
	db $ff
; 0x1cafb6

Frameset_1cafb6: ; 1cafb6 (72:6fb6)
	db $1c,  3
	db $1d,  3
	db $1e,  3
	db $1f,  3
	db $20,  3
	db $21,  3
	db $22,  3
	db $23,  3
	db $ff
; 0x1cafc7

Frameset_1cafc7: ; 1cafc7 (72:6fc7)
	db $24,  6
	db $25,  6
	db $26,  6
	db $27,  6
	db $28,  6
	db $29,  6
	db $2a,  6
	db $2e,  6
	db $2b,  6
	db $2c,  6
	db $2d,  6
	db $2e,  6
	db $2f,  6
	db $30,  6
	db $31,  6
	db $2e, 100
	db $ff
; 0x1cafe8

Frameset_1cafe8: ; 1cafe8 (72:6fe8)
	db $32,  4
	db $33,  4
	db $34,  4
	db $35,  4
	db $36,  4
	db $37,  4
	db $38,  4
	db $39,  4
	db $3a,  4
	db $3b, 20
	db $3c,  4
	db $3b,  4
	db $3c,  4
	db $3b, 50
	db $ff
; 0x1cb005

Frameset_1cb005: ; 1cb005 (72:7005)
	db $3d,  4
	db $3e,  6
	db $3f,  6
	db $40,  6
	db $3d,  4
	db $41,  6
	db $42,  6
	db $43,  6
	db $ff
; 0x1cb016

Frameset_1cb016: ; 1cb016 (72:7016)
	db $44, 50
	db $45,  2
	db $46,  2
	db $47,  2
	db $48,  2
	db $49,  2
	db $4a,  2
	db $4b,  2
	db $4c,  2
	db $4d,  2
	db $4e,  2
	db $4f,  2
	db $50,  2
	db $4f,  2
	db $4e, 50
	db $ff
; 0x1cb035

Frameset_1cb035: ; 1cb035 (72:7035)
	db $51,  4
	db $52,  4
	db $53,  4
	db $54,  4
	db $55, 20
	db $54,  1
	db $53,  1
	db $52,  1
	db $51,  1
	db $56,  1
	db $57,  1
	db $56,  1
	db $51,  1
	db $52,  1
	db $53,  1
	db $52,  1
	db $51,  1
	db $56,  1
	db $57,  1
	db $56,  1
	db $51,  1
	db $52,  1
	db $53,  1
	db $52,  1
	db $51, 20
	db $ff
; 0x1cb068

Frameset_1cb068: ; 1cb068 (72:7068)
	db $58, 20
	db $59,  2
	db $5a,  2
	db $5b,  2
	db $5c,  2
	db $5d,  2
	db $5e,  2
	db $5f,  2
	db $60, 20
	db $5f,  2
	db $5e,  2
	db $5d,  2
	db $5c,  2
	db $5b,  2
	db $5a,  2
	db $59,  2
	db $ff
; 0x1cb089

Frameset_1cb089: ; 1cb089 (72:7089)
	db $61,  8
	db $62,  8
	db $63,  8
	db $64,  8
	db $63,  2
	db $62,  2
	db $61,  2
	db $62,  2
	db $63,  2
	db $64,  2
	db $63,  2
	db $62,  2
	db $61,  2
	db $ff
; 0x1cb0a4

Frameset_1cb0a4: ; 1cb0a4 (72:70a4)
	db $65,  8
	db $66,  8
	db $ff
; 0x1cb0a9

Frameset_1cb0a9: ; 1cb0a9 (72:70a9)
	db $67, 20
	db $6a,  4
	db $6b,  4
	db $6c,  4
	db $6d,  4
	db $6e,  4
	db $6d,  4
	db $6e,  4
	db $6d,  4
	db $6e,  4
	db $6d,  4
	db $6e, 20
	db $ff
; 0x1cb0c2

Frameset_1cb0c2: ; 1cb0c2 (72:70c2)
	db $68, 20
	db $6f,  4
	db $70,  4
	db $71,  4
	db $72,  4
	db $73,  4
	db $74,  4
	db $75,  4
	db $76,  4
	db $68, 20
	db $ff
; 0x1cb0d7

Frameset_1cb0d7: ; 1cb0d7 (72:70d7)
	db $69,  4
	db $ff
; 0x1cb0da

Frameset_1cb0da: ; 1cb0da (72:70da)
	db $77,  4
	db $ff
; 0x1cb0dd

OAM_1cb0dd:: ; 1cb0dd (72:70dd)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15

.frame_0
	frame_oam -32,  -6, $02, 0
	frame_oam -32,   2, $04, 0
	frame_oam -32, -14, $00, 0
	frame_oam -16, -20, $06, 0
	frame_oam -16, -12, $08, 0
	frame_oam -16,  -4, $0a, 0
	frame_oam -16,   4, $0c, 0
	db $80

.frame_1
	frame_oam -32, -12, $0e, 0
	frame_oam -32,  -4, $10, 0
	frame_oam -32,   4, $12, 0
	frame_oam -16, -12, $14, 0
	frame_oam -16,  -4, $16, 0
	frame_oam -16,   4, $18, 0
	db $80

.frame_2
	frame_oam -26, -19, $1a, 0
	frame_oam -26, -11, $1c, 0
	frame_oam -26,  -3, $1e, 0
	frame_oam -26,   5, $20, 0
	frame_oam -10, -11, $22, 0
	frame_oam -10,  -3, $24, 0
	db $80

.frame_3
	frame_oam -32,  -4, $26, 0
	frame_oam -32,   4, $28, 0
	frame_oam -16, -12, $2a, 0
	frame_oam -16,  -4, $2c, 0
	frame_oam -16,   4, $2e, 0
	db $80

.frame_4
	frame_oam -32,   4, $32, 0
	frame_oam -32,  -4, $30, 0
	frame_oam -16, -12, $34, 0
	frame_oam -16,  -4, $36, 0
	frame_oam -16,   4, $38, 0
	db $80

.frame_5
	frame_oam -32, -12, $3a, 0
	frame_oam -32,  -4, $3c, 0
	frame_oam -32,   4, $3e, 0
	frame_oam -16, -12, $40, 0
	frame_oam -16,  -4, $42, 0
	frame_oam -16,   4, $44, 0
	db $80

.frame_6
	frame_oam -32, -12, $46, 0
	frame_oam -32,  -4, $48, 0
	frame_oam -32,   4, $4a, 0
	frame_oam -16, -12, $4c, 0
	frame_oam -16,  -4, $4e, 0
	frame_oam -16,   4, $50, 0
	db $80

.frame_7
	frame_oam -15, -12, $4c, 0
	frame_oam -15,  -4, $4e, 0
	frame_oam -15,   4, $50, 0
	frame_oam -31, -12, $52, 0
	frame_oam -31,  -4, $54, 0
	frame_oam -31,   4, $56, 0
	db $80

.frame_8
	frame_oam -32,  -2, $02, 0 | X_FLIP
	frame_oam -32, -10, $04, 0 | X_FLIP
	frame_oam -32,   6, $00, 0 | X_FLIP
	frame_oam -16,  12, $06, 0 | X_FLIP
	frame_oam -16,   4, $08, 0 | X_FLIP
	frame_oam -16,  -4, $0a, 0 | X_FLIP
	frame_oam -16, -12, $0c, 0 | X_FLIP
	db $80

.frame_9
	frame_oam -32,   4, $0e, 0 | X_FLIP
	frame_oam -32,  -4, $10, 0 | X_FLIP
	frame_oam -32, -12, $12, 0 | X_FLIP
	frame_oam -16,   4, $14, 0 | X_FLIP
	frame_oam -16,  -4, $16, 0 | X_FLIP
	frame_oam -16, -12, $18, 0 | X_FLIP
	db $80

.frame_10
	frame_oam -26,  11, $1a, 0 | X_FLIP
	frame_oam -26,   3, $1c, 0 | X_FLIP
	frame_oam -26,  -5, $1e, 0 | X_FLIP
	frame_oam -26, -13, $20, 0 | X_FLIP
	frame_oam -10,   3, $22, 0 | X_FLIP
	frame_oam -10,  -5, $24, 0 | X_FLIP
	db $80

.frame_11
	frame_oam -32,  -4, $26, 0 | X_FLIP
	frame_oam -32, -12, $28, 0 | X_FLIP
	frame_oam -16,   4, $2a, 0 | X_FLIP
	frame_oam -16,  -4, $2c, 0 | X_FLIP
	frame_oam -16, -12, $2e, 0 | X_FLIP
	db $80

.frame_12
	frame_oam -32, -12, $32, 0 | X_FLIP
	frame_oam -32,  -4, $30, 0 | X_FLIP
	frame_oam -16,   4, $34, 0 | X_FLIP
	frame_oam -16,  -4, $36, 0 | X_FLIP
	frame_oam -16, -12, $38, 0 | X_FLIP
	db $80

.frame_13
	frame_oam -32,   4, $3a, 0 | X_FLIP
	frame_oam -32,  -4, $3c, 0 | X_FLIP
	frame_oam -32, -12, $3e, 0 | X_FLIP
	frame_oam -16,   4, $40, 0 | X_FLIP
	frame_oam -16,  -4, $42, 0 | X_FLIP
	frame_oam -16, -12, $44, 0 | X_FLIP
	db $80

.frame_14
	frame_oam -32,   4, $46, 0 | X_FLIP
	frame_oam -32,  -4, $48, 0 | X_FLIP
	frame_oam -32, -12, $4a, 0 | X_FLIP
	frame_oam -16,   4, $4c, 0 | X_FLIP
	frame_oam -16,  -4, $4e, 0 | X_FLIP
	frame_oam -16, -12, $50, 0 | X_FLIP
	db $80

.frame_15
	frame_oam -15,   4, $4c, 0 | X_FLIP
	frame_oam -15,  -4, $4e, 0 | X_FLIP
	frame_oam -15, -12, $50, 0 | X_FLIP
	frame_oam -31,   4, $52, 0 | X_FLIP
	frame_oam -31,  -4, $54, 0 | X_FLIP
	frame_oam -31, -12, $56, 0 | X_FLIP
	db $80
; 0x1cb285

Frameset_1cb285:: ; 1cb285 (72:7285)
	db $00,  4
	db $01,  3
	db $02,  6
	db $03,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  2
	db $04,  2
	db $03,  2
	db $04, 60
	db $05,  4
	db $01,  3
	db $06,  3
	db $07,  8
	db $ff
; 0x1cb2ac

Frameset_1cb2ac:: ; 1cb2ac (72:72ac)
	db $08,  4
	db $09,  3
	db $0a,  6
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c,  2
	db $0b,  2
	db $0c, 60
	db $0d,  4
	db $09,  3
	db $0e,  3
	db $0f,  8
	db $ff
; 0x1cb2d3

OAM_1cb2d3: ; 1cb2d3 (72:72d3)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15

.frame_0
	frame_oam  -8,  -4, $80, 5
	db $80

.frame_1
	frame_oam -10,  -4, $80, 5
	db $80

.frame_2
	frame_oam -13,  -4, $80, 5
	db $80

.frame_3
	frame_oam -16,  -4, $80, 5
	db $80

.frame_4
	frame_oam -17,  -4, $80, 5
	db $80

.frame_5
	frame_oam  -6,  -4, $82, 4
	frame_oam -22,  -4, $84, 4
	frame_oam -22,   4, $86, 4
	db $80

.frame_6
	frame_oam  -6,  -4, $82, 4
	frame_oam -22,  -4, $88, 4
	frame_oam -22,   4, $8a, 4
	db $80

.frame_7
	frame_oam -22,  -4, $8c, 4
	frame_oam  -6,  -4, $82, 4
	db $80

.frame_8
	frame_oam  -6,  -4, $82, 4
	frame_oam -22,  -4, $8e, 4
	db $80

.frame_9
	frame_oam  -6,  -4, $82, 4
	frame_oam -22,  -4, $90, 4
	frame_oam -29,   4, $8a, 4 | Y_FLIP
	db $80

.frame_10
	frame_oam -16, -28, $92, 6
	frame_oam -16, -20, $94, 6
	frame_oam -16, -12, $96, 6
	frame_oam -16,  -4, $98, 6
	frame_oam -16,   4, $9a, 6
	frame_oam -16,  12, $9c, 6
	frame_oam -16,  20, $9e, 6
	db $80

.frame_11
	frame_oam -25, -28, $a0, 6
	frame_oam -25, -20, $a2, 6
	frame_oam -25, -12, $a4, 6
	frame_oam -25,  -4, $a6, 6
	frame_oam -25,   4, $a8, 6
	frame_oam -25,  12, $aa, 6
	frame_oam -25,  20, $ac, 6
	frame_oam  -9, -28, $ae, 6
	frame_oam  -9, -20, $b0, 6
	frame_oam  -9, -12, $b2, 6
	frame_oam  -9,  -4, $b4, 6
	frame_oam  -9,   4, $b6, 6
	frame_oam  -9,  12, $b8, 6
	frame_oam  -9,  20, $ba, 6
	db $80

.frame_12
	frame_oam -16,  -8, $bc, 7
	frame_oam -16,   0, $bc, 7 | X_FLIP
	db $80

.frame_13
	frame_oam -16,  -4, $be, 7
	db $80

.frame_14
	frame_oam -16,  -4, $c0, 7
	db $80

.frame_15
	frame_oam -16,  -4, $be, 7 | X_FLIP
	db $80
; 0x1cb3b3

Frameset_1cb3b3: ; 1cb3b3 (72:73b3)
	db $00, 24
	db $01,  4
	db $02,  4
	db $03,  6
	db $04,  8
	db $03,  6
	db $02,  4
	db $01,  4
	db $ff
; 0x1cb3c4

Frameset_1cb3c4: ; 1cb3c4 (72:73c4)
	db $05,  8
	db $06,  6
	db $07,  4
	db $08,  2
	db $07,  4
	db $09,  6
	db $ff
; 0x1cb3d1

Frameset_1cb3d1: ; 1cb3d1 (72:73d1)
	db $0a, 64
	db $ff
; 0x1cb3d4

Frameset_1cb3d4: ; 1cb3d4 (72:73d4)
	db $0b, 64
	db $ff
; 0x1cb3d7

Frameset_1cb3d7: ; 1cb3d7 (72:73d7)
	db $0c, 12
	db $0d,  8
	db $0e, 12
	db $0f,  8
	db $ff
; 0x1cb3e0

OAM_1cb3e0: ; 1cb3e0 (72:73e0)
	dw .frame_0
	dw .frame_1
	dw .frame_2
	dw .frame_3
	dw .frame_4
	dw .frame_5
	dw .frame_6
	dw .frame_7
	dw .frame_8
	dw .frame_9
	dw .frame_10
	dw .frame_11
	dw .frame_12
	dw .frame_13
	dw .frame_14
	dw .frame_15
	dw .frame_16
	dw .frame_17
	dw .frame_18
	dw .frame_19

.frame_0
	frame_oam -32, -40, $00, 5
	frame_oam -32, -32, $02, 5
	frame_oam -32, -24, $04, 5
	frame_oam -32, -16, $06, 5
	frame_oam -32,  -8, $08, 5
	frame_oam -32,   0, $0a, 5
	frame_oam -32,   8, $0c, 5
	frame_oam -32,  16, $0e, 5
	frame_oam -32,  24, $10, 5
	frame_oam -32,  32, $12, 5
	frame_oam -16, -40, $20, 4
	frame_oam -16, -32, $22, 4
	frame_oam -16, -24, $24, 4
	frame_oam -16, -16, $26, 4
	frame_oam -16,  -8, $28, 4
	frame_oam -16,   0, $2a, 4
	frame_oam -16,   8, $2c, 4
	frame_oam -16,  16, $2e, 4
	frame_oam -16,  24, $30, 4
	frame_oam -16,  32, $32, 4
	db $80

.frame_1
	frame_oam -16,   1, $b2, 3
	frame_oam -16,   9, $b2, 3
	frame_oam -16,  17, $b2, 3
	frame_oam -15, -25, $60, 3
	frame_oam -15, -17, $62, 3
	frame_oam -15,  -9, $64, 3
	db $80

.frame_2
	frame_oam -16, -24, $40, 7
	frame_oam -16, -16, $42, 7
	frame_oam -16,  -8, $44, 7
	frame_oam -16,   0, $46, 7
	frame_oam -16,   8, $48, 7
	frame_oam -16,  16, $4a, 7
	db $80

.frame_3
	frame_oam -16,  -4, $7c, 2
	frame_oam -16,   4, $7e, 2
	frame_oam -16, -12, $6a, 2
	db $80

.frame_4
	frame_oam -16, -12, $6c, 2
	frame_oam -16,  -4, $6e, 2
	frame_oam -16,   4, $70, 2
	db $80

.frame_5
	frame_oam -16, -12, $52, 2
	frame_oam -16,  -4, $54, 2
	frame_oam -16,   4, $56, 2
	db $80

.frame_6
	frame_oam -16, -12, $78, 2
	frame_oam -16,  -4, $7a, 2
	frame_oam -16,   4, $78, 2 | X_FLIP
	db $80

.frame_7
	frame_oam  -8, -27, $66, 6
	frame_oam  -8,  27, $66, 6 | X_FLIP
	db $80

.frame_8
	frame_oam  -8, -28, $66, 6
	frame_oam  -8,  28, $66, 6 | X_FLIP
	db $80

.frame_9
	frame_oam  -8, -29, $66, 6
	frame_oam  -8,  29, $66, 6 | X_FLIP
	db $80

.frame_10
	frame_oam -32, -16, $14, 1
	frame_oam -32,  -8, $16, 1
	frame_oam -32,   0, $18, 1
	frame_oam -32,   8, $1a, 1
	frame_oam -16, -16, $34, 1
	frame_oam -16,  -8, $36, 1
	frame_oam -16,   0, $38, 1
	frame_oam -16,   8, $3a, 1
	db $80

.frame_11
	frame_oam -33, -16, $14, 1
	frame_oam -33,  -8, $16, 1
	frame_oam -33,   0, $18, 1
	frame_oam -33,   8, $1a, 1
	frame_oam -17, -16, $34, 1
	frame_oam -17,  -8, $36, 1
	frame_oam -17,   0, $38, 1
	frame_oam -17,   8, $3a, 1
	db $80

.frame_12
	frame_oam -31, -16, $14, 1
	frame_oam -31,  -8, $16, 1
	frame_oam -31,   0, $18, 1
	frame_oam -31,   8, $1a, 1
	frame_oam -15, -16, $34, 1
	frame_oam -15,  -8, $36, 1
	frame_oam -15,   0, $38, 1
	frame_oam -15,   8, $3a, 1
	db $80

.frame_13
	frame_oam -16,   4, $52, 2 | X_FLIP
	frame_oam -16,  -4, $54, 2 | X_FLIP
	frame_oam -16, -12, $56, 2 | X_FLIP
	db $80

.frame_14
	frame_oam -16,  -4, $7c, 2 | X_FLIP
	frame_oam -16, -12, $7e, 2 | X_FLIP
	frame_oam -16,   4, $6a, 2 | X_FLIP
	db $80

.frame_15
	frame_oam -16, -12, $58, 2
	frame_oam -16,  -4, $5a, 2
	frame_oam -16,   4, $5c, 2
	db $80

.frame_16
	frame_oam -32,   4, $50, 2
	frame_oam -32, -12, $4c, 2
	frame_oam -32,  -4, $4e, 2
	db $80

.frame_17
	frame_oam -32, -12, $4c, 2
	frame_oam -32,  -4, $4e, 2
	frame_oam -32,   4, $3c, 2
	db $80

.frame_18
	frame_oam -32, -12, $4c, 2
	frame_oam -32,  -4, $4e, 2
	frame_oam -32,   4, $3e, 2
	db $80

.frame_19
	frame_oam -32, -12, $4c, 2
	frame_oam -32,  -4, $4e, 2
	frame_oam -32,   4, $5e, 2
	db $80
; 0x1cb598

Frameset_1cb598: ; 1cb598 (72:7598)
	db $00,  4
	db $ff
; 0x1cb59b

Frameset_1cb59b: ; 1cb59b (72:759b)
	db $01,  4
	db $ff
; 0x1cb59e

Frameset_1cb59e: ; 1cb59e (72:759e)
	db $02,  4
	db $ff
; 0x1cb5a1

Frameset_1cb5a1: ; 1cb5a1 (72:75a1)
	db $04, 50
	db $03,  4
	db $05,  4
	db $06,  4
	db $0d,  4
	db $0e,  4
	db $0f, 50
	db $03,  4
	db $05,  4
	db $06,  4
	db $0d,  4
	db $0e,  4
	db $ff
; 0x1cb5ba

	INCROM $1cb5ba, $1cb5c3

Frameset_1cb5c3: ; 1cb5c3 (72:75c3)
	db $07,  4
	db $08,  4
	db $09,  4
	db $08,  4
	db $ff
; 0x1cb5cc

Frameset_1cb5cc: ; 1cb5cc (72:75cc)
	db $0a,  4
	db $ff
; 0x1cb5cf

Frameset_1cb5cf: ; 1cb5cf (72:75cf)
	db $0a,  2
	db $0b,  2
	db $0a,  2
	db $0c,  2
	db $ff
; 0x1cb5d8

Frameset_1cb5d8: ; 1cb5d8 (72:75d8)
	db $10,  4
	db $ff
; 0x1cb5db

Frameset_1cb5db: ; 1cb5db (72:75db)
	db $11,  4
	db $ff
; 0x1cb5de

Frameset_1cb5de: ; 1cb5de (72:75de)
	db $12,  4
	db $ff
; 0x1cb5e1

Frameset_1cb5e1: ; 1cb5e1 (72:75e1)
	db $13,  4
	db $ff
; 0x1cb5e4
