_GolfStateTable::
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitGolfLobby
	dw SlowFadeFromWhite
	dw HandleGolfLobby

	dw FastFadeToWhite ; SST_GOLF_LEVEL
	dw InitGolfLevel
	dw SlowFadeFromWhite
	dw HandleGolfLevel

	dw FastFadeToWhite ; SST_GOLF_EXIT
	dw ReturnToLevelFromGolf

	dw FastFadeToWhite ; SST_GOLF_CLEAR
	dw InitGolfClearCutscene
	dw SlowFadeFromWhite
	dw UpdateGolfClearCutscene

InitGolfLobby:
	call DisableLCD
	call ClearVirtualOAM
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
	ld a, SCREEN_HEIGHT_PX
	ld [wGolfWarioYPos], a
	ld a, $38
	ld [wGolfWarioXPos], a
	jr .asm_1c807d
.asm_1c8069
	ld a, GOLF_WARIO_GOING_IN_PIPE
	ld [wGolfWarioState], a
	ld a, $a0
	ld [wGolfWarioYPos], a
	ld a, $80
	ld [wGolfWarioXPos], a
	ld a, GOLFLOBBYSTATE_EXIT_PIPE
	ld [wGolfLobbyState], a

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

	play_music2 MUSIC_GOLF_LOBBY

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

; loads all the gfx in the Golf Lobby
; and determines the price tier,
; corresponding to the number of treasures
.LoadGolfLobby:
	ld a, BANK("Golf Gfx 2")
	ld [wTempBank], a
	ld hl, BGMap_1c5b4e
	push hl
	ld hl, BGMap_1c5cbe
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

	ld a, [wNumCollectedTreasures + 0]
	and a
	jr nz, .tier_3
	ld a, [wNumCollectedTreasures + 1]
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
	ldcoord_a 11, 8
	ld a, e
	ldcoord_a 11, 9
	ld a, b
	ldcoord_a 12, 8
	ld a, c
	ldcoord_a 12, 9
	ret

HandleGolfLobby:
	call HandleGolfLobbyStates
	call UpdateGolfLobbyAnimations
	call HandleGolfLobbyWarioSprite
	call ClearUnusedVirtualOAM
	jp GolfLobbyVBlank

UpdateGolfLobbyAnimations:
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
	call LoadGolfSprite

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
	call LoadGolfSprite

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
	call LoadGolfSprite

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
	jp LoadGolfSprite

HandleGolfLobbyWarioSprite:
	ld a, [wGolfWarioYPos]
	ld [wGolfWarioYCoord], a
	ld a, [wGolfWarioXPos]
	ld [wGolfWarioXCoord], a
	call UpdateGolfWarioAnimation
	call LoadGolfWarioStateGfx

	; if Wario is walking, play walk sfx
	; if it's the first frame
	ld a, [wGolfWarioState]
	cp GOLF_WARIO_WALKING
	ret nz
	ld a, [wGolfWarioFramesetOffset]
	cp $2
	ret nz
	ld a, [wGolfWarioDuration]
	and a
	ret nz
	play_sfx SFX_WALK
	ret

HandleGolfLobbyStates:
	ld a, [wGolfLobbyState]
	jumptable
	dw .WaitingInput ; GOLFLOBBYSTATE_WAIT_INPUT
	dw .WalkingRight ; GOLFLOBBYSTATE_WALK_RIGHT
	dw .WalkingLeft  ; GOLFLOBBYSTATE_WALK_LEFT
	dw .EnteringPipe ; GOLFLOBBYSTATE_ENTER_PIPE
	dw .EnteringDoor ; GOLFLOBBYSTATE_ENTER_DOOR
	dw .ExitingPipe  ; GOLFLOBBYSTATE_EXIT_PIPE

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
	ld a, GOLFLOBBYSTATE_ENTER_DOOR
	ld [wGolfLobbyState], a
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
	ld a, 4
	ld [wGolfWarioYVel], a
	ld a, $01 ; aka GOLFLOBBYSTATE_WALK_RIGHT
	ld [wGolfVBlankMode], a
	ld [wGolfLobbyState], a
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
	ld a, GOLFLOBBYSTATE_WALK_LEFT
	ld [wGolfLobbyState], a
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
	play_sfx SFX_PIPE_ENTER
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
	ld [wGolfWarioXPos], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLFLOBBYSTATE_ENTER_PIPE
	ld [wGolfLobbyState], a
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
	ld a, [wGolfWarioXPos]
	cp $58
	call nc, .DoJumpRight
	ld hl, wGolfWarioXPos
	ld a, [hl]
	cp $78
	jr nc, .reached_pipe
	inc [hl]
	ret
.reached_pipe
	ld a, $80
	ld [wGolfWarioYPos], a
	ld a, $78
	ld [wGolfWarioXPos], a
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfLobbyState], a ; GOLFLOBBYSTATE_WAIT_INPUT
	ret

.DoJumpRight
	ld hl, wGolfWarioYVel
	ld c, [hl]
	ld a, [wGolfCounter]
	inc a
	ld [wGolfCounter], a
	and $1
	jr nz, .skip_decr_y_vel
	dec [hl] ; decrease y vel
.skip_decr_y_vel
	; apply y vel to position
	ld de, wGolfWarioYPos
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
	ld de, wGolfWarioYPos
	ld a, [de]
	cp SCREEN_HEIGHT_PX
	call c, .DoJumpLeft
	ld hl, wGolfWarioXPos
	ld a, [hl]
	cp $38
	jr z, .reached_door
	dec [hl]
	ret
.reached_door
	ld a, SCREEN_HEIGHT_PX
	ld [wGolfWarioYPos], a
	ld a, $38
	ld [wGolfWarioXPos], a
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfLobbyState], a ; GOLFLOBBYSTATE_WAIT_INPUT
	ret

.DoJumpLeft
	ld a, [wGolfWarioXPos]
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
	ld hl, wGolfWarioYPos
	ld a, [hl]
	cp $b0
	jr nc, .asm_1c83f7
	inc [hl]
	ret
.asm_1c83f7
	ld a, SST_GOLF_LEVEL
	ld [wSubState], a
	ret

.EnteringDoor
	ld hl, wGolfCounter
	ld a, [hl]
	and a
	ret z
	cp 1
	jr z, .asm_1c840d
	cp 28
	jr nc, .asm_1c8420
	inc [hl]
	ret
.asm_1c840d
	inc [hl]
	xor a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld a, GOLF_WARIO_ENTERING_DOOR
	ld [wGolfWarioState], a
	ld a, $01
	ld [wGolfVBlankMode], a
	ret
.asm_1c8420
	xor a
	ld [w1d800], a
	ld [wGolfMenuOption], a
	stop_music2
	ld a, SST_GOLF_EXIT
	ld [wSubState], a
	ret

.ExitingPipe
	ld hl, wGolfWarioYPos
	ld a, [hl]
	cp $80
	jr z, .asm_1c844f
	cp $a0
	play_sfx z, SFX_PIPE_ENTER
	dec [hl]
	ret
.asm_1c844f
	ld a, GOLF_WARIO_WAITING
	ld [wGolfWarioState], a
	ld a, $78
	ld [wGolfWarioXPos], a
	ld a, $01
	ld [wGolfVBlankMode], a
	xor a
	ld [wGolfCounter], a
	ld [wGolfWarioDuration], a
	ld [wGolfWarioFramesetOffset], a
	ld [wGolfLobbyState], a ; GOLFLOBBYSTATE_WAIT_INPUT
	ret

InitGolfClearCutscene:
	call DisableLCD
	call ClearVirtualOAM

	ld hl, STARTOF("Golf RAM")
	ld bc, SIZEOF("Golf RAM")
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

	call .LoadCutsceneGfx
	ld a, $70
	ld [wGolfObj1YCoord], a
	call UpdateGolfClearCutsceneAnimation
	call VBlank_1c84e0

	xor a
	ldh [rSCY], a
	ldh [rSCX], a
	ld [wSCY], a
	ld [wSCX], a

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

.LoadCutsceneGfx
	ld a, BANK(GolfMenuGfx)
	ld [wTempBank], a
	ld hl, BGMap_1c5d6c
	push hl
	ld hl, BGMap_1c5dc6
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

VBlank_1c84e0:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	jp CopyHLToDE

.Func:
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

UpdateGolfClearCutscene:
	ld hl, wGolfCounter
	ld a, [wGolfObj1State]
	and a
	jr nz, .asm_1c8530
	ld a, [wGolfObj1YCoord]
	cp $50
	jr z, .asm_1c8525
	ld a, [hl]
	and $0f
	play_sfx z, SFX_01F
	inc [hl]
	ld a, [hl]
	and $03
	jr nz, UpdateGolfClearCutsceneAnimation
	ld a, [wGolfObj1YCoord]
	dec a
	ld [wGolfObj1YCoord], a
	jr UpdateGolfClearCutsceneAnimation

.asm_1c8525
	xor a
	ld [hl], a
	ld [wGolfObj1FramesetOffset], a
	inc a
	ld [wGolfObj1State], a
	jr UpdateGolfClearCutsceneAnimation

.asm_1c8530
	ld a, [hl]
	cp $40
	jr nc, .asm_1c8538
	inc [hl]
	jr UpdateGolfClearCutsceneAnimation

.asm_1c8538
	ld a, SST_GOLF_EXIT
	ld [wSubState], a
	ret

UpdateGolfClearCutsceneAnimation:
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
	call LoadGolfSprite
	jp ClearUnusedVirtualOAM
