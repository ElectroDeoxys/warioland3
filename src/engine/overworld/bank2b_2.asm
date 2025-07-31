Prologue_Delay:
	ld a, [w2d014]
	cp c
	ret c
;	fallthrough

Prologue_Next:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret

Prologue_Finish:
	ld hl, wSubState
	inc [hl]
	ret

Prologue:
	call .PlayCutscene
	call UpdatePrologueSceneObjects
	call UpdateSceneWario
	call Func_ac3fd
	ret

.PlayCutscene:
	ld a, [w2d013]
	jumptable

	dw Prologue_Next
	dw .Wait60
	dw .SetFadeInFromBlack
	dw PrologueFade
	dw Prologue_WarioFallFromPlane
	dw .ScrollRight40Pixels
	dw Prologue_WarioWalkToCaveEntrance
	dw .SetFadeToBlack
	dw PrologueFade
	dw .PrepareCaveScene1
	dw PrologueFade
	dw Prologue_WarioEnterCave
	dw .ShowMusicBoxCloseUp
	dw Func_ae1de
	dw .PrepareCaveScene2
	dw Prologue_WarioSuckedIntoMusicBox
	dw .SetFadeToBlack
	dw PrologueFade
	dw .LoadTempleTilemap
	dw .LoadTempleAttrmap
	dw .LoadTempleGfx
	dw .PrepareTempleScene
	dw .Func_ae15b
	dw Func_ae55c
	dw .Func_ae164
	dw .Func_ae169
	dw Func_ae641
	dw InitTextPrinting
	dw Func_aca9e
	dw .Wait30
	dw LoadCurTextPageBufferPage
	dw Func_acacd
	dw Func_acae7
	dw .Func_ae181
	dw .Func_ae196
	dw .Func_ae19e
	dw .Func_ae1af
	dw Func_ae668
	dw Prologue_Finish

.Wait60:
	ld c, 60
	jp Prologue_Delay

.SetFadeInFromBlack:
	ld a, $01
;	fallthrough

.Func_ae009:
	ld [w2d880], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Prologue_Next

.ScrollRight40Pixels:
	ld hl, wSCX
	inc [hl]
	ld a, [hl]
	cp 40
	ret nz
	jp Prologue_Next

.SetFadeToBlack:
	ld a, $00
	jr .Func_ae009

.PrepareCaveScene1:
	; set scroll to (0, 112)
	ld a, 112
	ld [wSCY], a
	xor a
	ld [wSCX], a

	; set Wario's coordinates to (240, 208)
	ld hl, wSceneWarioYCoord
	ld a, 208
	ld [hli], a ; y
	ld a, 240
	ld [hl], a ; x
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState

	call .Func_ae067

	; set Obj1 and Obj2's coordinates to (120, 187)
	ld hl, wSceneObj1
	ld a, 187
	ld [hli], a ; y
	ld [wSceneObj2YCoord], a
	ld a, 120
	ld [hl], a ; x
	ld [wSceneObj2XCoord], a

	xor a
	ld [w2d8b0], a
	ld hl, wSceneObj1State
	call SetSceneObjState

	play_music2 MUSIC_MUSIC_BOX_CAVE

	ld a, $06
	jr .Func_ae009

.Func_ae067:
	; set Obj3's coordinates to (120, 195)
	ld hl, wSceneObj3YCoord
	ld a, 195
	ld [hli], a
	ld a, 120
	ld [hl], a

	ld hl, wSceneObj3State
	ld a, $09
	call SetSceneObjState
	ret

.ShowMusicBoxCloseUp:
	; set scroll to (0, 0)
	xor a
	ld [wSCY], a
	ld [wSCX], a

	; setting BG map to $9c00 shows Music Box scene
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a

	; set Obj8's position to (80, 80)
	ld a, 80
	ld hl, wSceneObj8
	ld [hli], a
	ld [hl], a
	ld a, $0d
	ld hl, wSceneObj8State
	call SetSceneObjState

	; deactivate Obj3
	xor a
	ld hl, wSceneObj3State
	call SetSceneObjState

	ld hl, Pals_86a8d
	ld de, wTempOBPals
	ld c, 1 palettes
	ld b, BANK(Pals_86a8d)
	call CopyFarBytes
	ld hl, Pals_86a0d
	;	fallthrough

.Func_ae0ab:
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86a0d)
	call CopyFarBytes

	ld de, Data_ac9f5
	call Func_ac9e9
	ld de, Data_ac9ff
	call Func_ac9e4
	jp Prologue_Next

.PrepareCaveScene2:
	; set scroll to (0, 112)
	ld a, 112
	ld [wSCY], a
	xor a
	ld [wSCX], a

	; setting BG map to $9800 shows cave scene
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a

	ld a, SCENEWARIO_HOLD_MUSIC_BOX
	call SetSceneWarioState
	call .Func_ae067

	ld a, $0e
	ld hl, wSceneObj1State
	call SetSceneObjState

	; deactivate Obj8
	xor a
	ld hl, wSceneObj8State
	call SetSceneObjState

	ld hl, wTempPals2
	ld de, wTempOBPals
	ld b, 1 palettes
	call CopyHLToDE
	ld hl, Pals_869cd
	jr .Func_ae0ab

.LoadTempleTilemap:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, TempleTilemap
	ld b, HIGH(v0BGMap0) - $80
	ld c, 18 dma_rows
.configure_hdma_transfer:
	ld a, BANK(TempleTilemap)
	ld [wHDMABank], a
	ld hl, wHDMA
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	ld [hl], a
	jp Prologue_Next

.LoadTempleAttrmap:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, TempleAttrmap
	ld b, HIGH(v0BGMap0) - $80
	ld c, 18 dma_rows
	jr .configure_hdma_transfer

.LoadTempleGfx:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, TempleGfx
	ld b, HIGH(v0Tiles2) - $80
	ld c, $80 dma_tiles
	jr .configure_hdma_transfer

.PrepareTempleScene:
	; set scroll to (0, 0)
	xor a
	ld [wSCY], a
	ld [wSCX], a

	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a

	; place sleeping Wario at (64, 96)
	ld hl, wSceneWarioYCoord
	ld a, 96
	ld [hli], a
	ld a, 64
	ld [hl], a
	ld a, SCENEWARIO_SLEEP
	call SetSceneWarioState
	play_sfx SFX_SNORE
	ld a, $05
	jp .Func_ae009

.Func_ae15b:
	ld a, [w2d014]
	and $07
	ret nz
	jp PrologueFade

.Func_ae164:
	ld a, $02
	jp .Func_ae009

.Func_ae169:
	ld c, $07
	ld a, [wPalConfig1TotalSteps]
	cp $08
	jr c, .asm_ae174
	ld c, $01
.asm_ae174
	ld a, [w2d014]
	and c
	ret nz
	jp PrologueFade

.Wait30:
	ld c, 30
	jp Prologue_Delay

.Func_ae181:
	call Func_acaf3
	call .Func_ae188
	ret

.Func_ae188:
	ld a, [wCurTextBufferPage]
	cp $02
	jr z, .asm_ae190
	ret
.asm_ae190
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	ret

.Func_ae196:
	ld a, SCENEWARIO_NOD_ONCE
	call SetSceneWarioState
	jp Prologue_Next

.Func_ae19e:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Prologue_Next

.Func_ae1af:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	ld hl, wSceneObj1State
	xor a
	call SetSceneObjState
	call ClearTextbox
	jp Prologue_Next

Func_ae1c2:
	ld a, [wSceneWarioState]
	cp b
	ret nz
	jr Func_ae1ce

Func_ae1c9:
	ld a, [w2d891]
	cp c
	ret c
;	fallthrough

Func_ae1ce:
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl] ; w2d890
	ret

Func_ae1d5:
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a ; w2d891
	jp Prologue_Next

Func_ae1de:
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw .Wait20
	dw .Func_ae1f5
	dw .Wait10
	dw .Func_ae215
	dw .Wait90
	dw Func_ae1d5

.Wait20:
	ld c, 20
	jr Func_ae1c9

.Func_ae1f5:
	; set Obj4's position to (56, 56)
	ld hl, wSceneObj4
	ld a, 56
	ld [hli], a ; y
	ld a, 56
	ld [hl], a ; x
	ld a, $0e
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_104
	jp Func_ae1ce

.Wait10:
	ld c, 10
	jr Func_ae1c9

.Func_ae215:
	; set Obj5's position to (120, 48)
	ld hl, wSceneObj5
	ld a, 48
	ld [hli], a ; y
	ld a, 120
	ld [hl], a ; x
	ld a, $0e
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp Func_ae1ce

.Wait90:
	ld c, 90
	jr Func_ae1c9

Prologue_WarioEnterCave:
	call Func_ae2dd
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw .WarioWalkRight
	dw .WarioMoveRightTo64
	dw .Func_ae272
	dw .ShowEmote
	dw .WaitEmoteAnimation
	dw .Wait26
	dw .WarioWalkRight
	dw .WarioMoveRightTo102
	dw .Func_ae2b8
	dw .WarioLookMusicBox
	dw .WarioHoldMusicBox
	dw .Wait60
	dw Func_ae1d5

.WarioWalkRight:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

.WarioMoveRightTo64:
	call ApplySceneWarioMovementRight
	cp 50
	jr z, .Func_ae26c
	cp 64
	ret nz
	ld [hl], a
.wario_idle_right
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

.Func_ae26c:
	ld a, $01
	ld [w2d8b0], a
	ret

.Func_ae272:
	ld a, [w2d8b0]
	and a
	ret nz
	jp Func_ae1ce

.ShowEmote:
	ld a, [w2d891]
	cp $16
	ret c
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub 24
	ld [hli], a ; y
	ld a, [wSceneWarioXCoord]
	add 16
	ld [hl], a ; x
	ld a, $11
	ld hl, wCurSceneObjState
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ae1ce

.WaitEmoteAnimation:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	jp Func_ae1ce

.Wait26:
	ld c, 26
	jp Func_ae1c9

.WarioMoveRightTo102:
	call ApplySceneWarioMovementRight
	cp 102
	ret nz
	ld [hl], a
	jr .wario_idle_right

.Func_ae2b8:
	ld a, [w2d891]
	cp $14
	jr z, .asm_ae2c5
	cp $3c
	ret c
	jp Func_ae1ce
.asm_ae2c5
	ld a, $03
	ld [w2d8b0], a
	ret

.WarioLookMusicBox:
	ld a, SCENEWARIO_LOOK_MUSIC_BOX
	call SetSceneWarioState
	jp Func_ae1ce

.WarioHoldMusicBox:
	ld b, SCENEWARIO_HOLD_MUSIC_BOX
	jp Func_ae1c2

.Wait60:
	ld c, 60
	jp Func_ae1c9

Func_ae2dd:
	ld a, [w2d8b0]
	jumptable
	dw Func_ae2fb
	dw Func_ae2ed
	dw Func_ae303
	dw Func_ae2ed
	dw Func_ae2fc
	dw Func_ae30e

Func_ae2ed:
	ld a, $0e
	ld hl, wSceneObj1State
	call SetSceneObjState
Func_ae2f5:
	ld hl, w2d8b1
	xor a
	ld [hld], a
	inc [hl] ; w2d8b0
Func_ae2fb:
	ret

Func_ae2fc:
	ld a, [wSceneObj1State]
	and a
	ret nz
	jr Func_ae2f5

Func_ae303:
	ld a, [wSceneObj1State]
	and a
	ret nz
	ld hl, w2d8b0
	ld [hli], a
	ld [hl], a
	ret

Func_ae30e:
	ld hl, w2d8b1
	inc [hl]
	ld a, [hl]
	cp $14
	ret c
	ld hl, w2d8b0
	dec [hl]
	dec [hl]
	ret

Prologue_WarioSuckedIntoMusicBox:
	call Func_ae523
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw .Func_ae352
	dw .Func_ae35a
	dw .Wait30
	dw .WarioPickupMusicBox
	dw .Func_ae37c
	dw .WarioShortHopBack
	dw .MusicBoxRise
	dw .Wait120_1
	dw .Func_ae3d8
	dw .Func_ae3e2
	dw .Func_ae3fa
	dw .Func_ae407
	dw .Func_ae435
	dw .Wait60
	dw .Func_ae447
	dw .Func_ae476
	dw .Func_ae488
	dw .Wait40
	dw .Func_ae4a9
	dw .Func_ae4e5
	dw .Wait120
	dw Func_ae1d5

.Func_ae352:
	ld a, [wSceneObj1State]
	and a
	ret nz
	jp Func_ae1ce

.Func_ae35a:
	ld a, [w2d891]
	cp $14
	ret c
	stop_music2
	jp Func_ae1ce

.Wait30:
	ld c, 30
	jp Func_ae1c9

.WarioPickupMusicBox:
	ld a, SCENEWARIO_PICKUP_MUSIC_BOX
	call SetSceneWarioState
	jp Func_ae1ce

.Func_ae37c:
	ld a, [w2d891]
	cp $08
	ret nc
	ld hl, wSceneObj3State
	ld a, $0a
	call SetSceneObjState
	jp Func_ae1ce

.WarioShortHopBack:
	ld hl, wSceneWario
	ld a, [w2d891]
	cp $01
	jr z, .hop_up
	cp $05
	jr z, .hop_down
	cp $30
	ret c
	jp Func_ae1ce
.hop_up
	dec [hl] ; y
	inc l
	dec [hl] ; x
	ret
.hop_down
	inc [hl] ; y
	inc l
	dec [hl] ; x
	ret

.MusicBoxRise:
	ld a, [w2d891]
	and $07
	ret nz
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld a, [hl]
	ld b, a
	sub 8
	ld [wSceneObj2YCoord], a
	ld a, b
	cp 180
	jr z, .asm_ae3c5
	cp 165
	ret nz
	jp Func_ae1ce
.asm_ae3c5
	ld hl, wSceneObj2State
	ld a, $0c
	call SetSceneObjState
	ld a, $01
	ld [w2d150], a
	ret

.Wait120_1:
	ld c, 120
	jp Func_ae1c9

.Func_ae3d8:
	xor a
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_ae1ce

.Func_ae3e2:
	; place obj at (Wario_x, Wario_y - 8)
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub 8
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	ld [hl], a
	ld a, $0e
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp Func_ae1ce

.Func_ae3fa:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	ld a, $80
	ld [w2d150], a
	jp Func_ae1ce

.Func_ae407:
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub 16
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add 2
	ld [hl], a
	ld a, $15
	ld hl, wCurSceneObjState
	call SetSceneObjState

	; sets OB palette 0 to all (28, 28, 28)
	ld hl, wTempOBPals
	ld b, PAL_COLORS
.loop_set_pal
	ld a, LOW(palred 28 + palgreen 28 + palblue 28)
	ld [hli], a
	ld a, HIGH(palred 28 + palgreen 28 + palblue 28)
	ld [hli], a
	dec b
	jr nz, .loop_set_pal

	ld de, Data_ac9ff
	call Func_ac9e4
	jp Func_ae1ce

.Func_ae435:
	ld a, [wCurSceneObjState]
	cp $16
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce

.Wait60:
	ld c, 60
	jp Func_ae1c9

.Func_ae447:
	ld hl, wCurSceneObj
	ld a, [hli] ; y
	cp 181
	jr c, .above_181
	ld a, [w2d891]
	ld b, a
	and $03
	ret nz
	bit 2, b
	jr z, .asm_ae45b
	inc [hl] ; x
.asm_ae45b
	dec l
	dec [hl] ; y
	ret

.above_181
	inc [hl] ; x
	dec l
	dec [hl] ; y
	dec [hl]
	ld a, [hl]
	cp 168
	jr z, .asm_ae46d
	cp 156
	ret nz
	jp Func_ae1ce
.asm_ae46d
	ld a, $17
	ld hl, wCurSceneObjState
	call SetSceneObjState
	ret

.Func_ae476:
	ld a, $09
	ld hl, wSceneObj3State
	call SetSceneObjState
	xor a
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp Func_ae1ce

.Func_ae488:
	ld a, [w2d891]
	srl a
	ret c
	ld hl, wSceneObj3XCoord
	cp $01
	jr z, .IncreaseX
	cp $02
	jr z, .DecreaseX
	call .IncreaseX
	jp Func_ae1ce
.IncreaseX
	inc [hl]
	ret
.DecreaseX
	dec [hl]
	dec [hl]
	ret

.Wait40:
	ld c, 40
	jp Func_ae1c9

.Func_ae4a9:
	ld hl, w2d891
	call .Func_ae4c0
	ld hl, wSceneObj3YCoord
	add [hl]
	ld [hl], a
	cp 195
	ret c
	ld a, 195
	ld [hl], a
	call .PlayBumpSFX
	jp Func_ae1ce

.Func_ae4c0:
	ld a, [hl]
	cp $14
	jr c, .asm_ae4c8
	ld a, $10
	ld [hl], a
.asm_ae4c8
	ld e, a
	ld d, $00
	ld hl, .data_ae4d1
	add hl, de
	ld a, [hl]
	ret

.data_ae4d1
	db 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 2

.Func_ae4e5:
	ld hl, w2d891
	call .Func_ae4fe
	and a
	ret z
	ld hl, wSceneObj3YCoord
	add [hl]
	ld [hl], a
	cp 195
	call z, .PlayBumpSFX
	ld a, $80
	cp b
	ret nz
	jp Func_ae1ce

.Func_ae4fe:
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, .data_ae509
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ret
.data_ae509
	db 0, -2, 0, 0, 1, 0, 1, 0, -1, 0, 1, $80

.PlayBumpSFX:
	play_sfx SFX_BUMP
	ret

.Wait120:
	ld c, 120
	jp Func_ae1c9

Func_ae523:
	ld hl, w2d150
	ld a, [hl]
	and a
	ret z
	cp $80
	jr z, .asm_ae554
	ld hl, w2d151
	inc [hl]
	ld a, [hl]
	cp $02
	ret c
	xor a
	ld [hld], a ; w2d151
	ld c, [hl] ; w2d150
	inc [hl]
	ld a, [hl]
	cp $09
	jr c, .asm_ae540
	ld [hl], $01
.asm_ae540
	ld hl, .data_ae54b
	ld b, $00
	add hl, bc
	ld a, [hl]
	ld [wSceneWarioAttributes], a
	ret

.data_ae54b
	db $0
	db $0
	db $1
	db $2
	db $3
	db $4
	db $5
	db $6
	db $7

.asm_ae554
	xor a
	ld [wSceneWarioAttributes], a
	ld [w2d150], a
	ret

Func_ae55c:
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae585
	dw Func_ae58d
	dw Func_ae599
	dw Func_ae5a8
	dw Func_ae5b1
	dw Func_ae5d0
	dw Func_ae5dc
	dw Func_ae5f0
	dw Func_ae5f5
	dw Func_ae5fd
	dw Func_ae60c
	dw Func_ae618
	dw Func_ae61d
	dw Func_ae630
	dw Func_ae63c
	dw Func_ae1d5

Func_ae585:
	ld a, [w2d14e]
	inc a
	ret nz
	jp Func_ae1ce

Func_ae58d:
	ld a, [bc]
	cp $4b
	ret c
	ld a, SCENEWARIO_WAKE_UP
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae599:
	ld a, [bc]
	cp $14
	ret c
	play_sfx SFX_GRAB
	jp Func_ae1ce

Func_ae5a8:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_SIT_IDLE
	ret nz
	jp Func_ae1ce

Func_ae5b1:
	ld a, [bc]
	cp $05
	ret c
	ld a, [wSceneWarioYCoord]
	sub $01
	ld [wCurSceneObjYCoord], a
	ld a, [wSceneWarioXCoord]
	add $09
	ld [wCurSceneObjXCoord], a
	ld a, $14
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp Func_ae1ce

Func_ae5d0:
	ld a, [bc]
	cp $8c
	ret c
	ld a, SCENEWARIO_SIT_STILL
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae5dc:
	ld a, [bc]
	cp $10
	ret c
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	play_sfx SFX_12A
	jp Func_ae1ce

Func_ae5f0:
	ld c, 60
	jp Func_ae1c9

Func_ae5f5:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae5fd:
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae60c:
	ld a, [bc]
	cp $1e
	ret c
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae618:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae61d:
	ld a, [bc]
	cp $1e
	ret c
	play_music2 MUSIC_THE_TEMPLE
	jp Func_ae1ce

Func_ae630:
	ld a, [bc]
	cp $1e
	ret c
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae63c:
	ld c, 30
	jp Func_ae1c9

Func_ae641:
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae652
	dw Func_ae657
	dw Func_ae663
	dw Func_ae1d5

Func_ae652:
	ld b, SCENEWARIO_LOOK_FORWARD
	jp Func_ae1c2

Func_ae657:
	ld a, SCENEWARIO_JUMP_AND_BOW
	call SetSceneWarioState
	xor a
	ld [wSceneWarioUnk7], a
	jp Func_ae1ce

Func_ae663:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae668:
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae683
	dw Func_ae68b
	dw Func_ae69c
	dw Func_ae6a1
	dw Func_ae6a6
	dw Func_ae6ae
	dw Func_ae6b3
	dw Func_ae6c1
	dw Func_ae6ce
	dw Func_ae1d5

Func_ae683:
	ld a, SCENEWARIO_SNAP_FINGERS
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae68b:
	ld a, [wSceneWarioFrame]
	cp $0f
	ret nz
	play_sfx SFX_106
	jp Func_ae1ce

Func_ae69c:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae6a1:
	ld c, 30
	jp Func_ae1c9

Func_ae6a6:
	ld a, SCENEWARIO_TURN_BACK_TO_LEFT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae6ae:
	ld b, SCENEWARIO_IDLE_LEFT
	jp Func_ae1c2

Func_ae6b3:
	ld a, [w2d891]
	cp $04
	ret c
	ld a, SCENEWARIO_WALK_LEFT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae6c1:
	call ApplySceneWarioMovementLeft
	cp $f0
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae6ce:
	ld c, 30
	jp Func_ae1c9

Prologue_WarioFallFromPlane:
	call Func_ae8bb
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw .Wait74
	dw .ShowWarioFall
	dw .WarioBounce
	dw .Wait60
	dw .WarioTurnRight
	dw .WarioLookBack
	dw .Wait38
	dw .WarioLookAround
	dw .WarioIdleRight
	dw .Wait46
	dw Func_ae1d5

.Wait74:
	ld c, 74
	jp Func_ae1c9

.ShowWarioFall:
	; set Wario's coordinates to (240, 60)
	ld hl, wSceneWarioYCoord
	ld a, 60
	ld [hli], a
	ld a, 240
	ld [hl], a

	ld a, SCENEWARIO_ON_FIRE
	call SetSceneWarioState

	play_sfx SFX_THROW

	xor a
	ld [w2d894], a
	ld [w2d892], a
	jp Func_ae1ce

.WarioBounce:
	call .DoBounce
	ld a, [w2d892]
	cp $80
	ret nz
	jp Func_ae1ce

.DoBounce:
	ld a, [w2d894]
	and a
	jr z, .asm_ae740
	ld a, [w2d891]
	and $03
	jr z, .asm_ae740
	ld de, Data_aed06
	ld hl, wSceneWario
	call ApplyOWMovement
	jr nz, .asm_ae740
	xor a
	ld [w2d894], a
.asm_ae740
	ld a, [w2d892]
	and a
	jr z, .asm_ae763
	dec a
	jr z, .asm_ae771
	dec a
	jr z, .asm_ae794
	dec a
	jr z, .asm_ae79e
	dec a
	jr z, .asm_ae7a5
	dec a
	jr z, .asm_ae794
	dec a
	jr z, .asm_ae7b5
	dec a
	jr z, .asm_ae7c5
	dec a
	jr z, .asm_ae7d4
	dec a
	jp z, .asm_ae7f2
	ret

.asm_ae763
	ld a, $01
	ld [w2d894], a
.asm_ae768
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.asm_ae771
	ld a, [wSceneWarioYCoord]
	cp 96
	ret nz
	ld a, SCENEWARIO_STUNNED_RIGHT
	call SetSceneWarioState
	call .PlayBumpSfx
.asm_ae77f
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	ld [hl], a
	ld a, $10
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jr .asm_ae768

.asm_ae794
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_ae768

.asm_ae79e
	ld a, SCENEWARIO_CRASH_TUMBLE_END
	call SetSceneWarioState
	jr .asm_ae768

.asm_ae7a5
	ld a, [wSceneWarioYCoord]
	cp 96
	ret nz
	ld a, SCENEWARIO_CRASH_LAND_RIGHT
	call SetSceneWarioState
	call .PlayBumpSfx
	jr .asm_ae77f

.asm_ae7b5
	ld a, [wSceneWarioYCoord]
	cp 96
	ret nz
	ld a, SCENEWARIO_CRASH_LAND_RIGHT
	call SetSceneWarioState
	call .PlayBumpSfx
	jr .asm_ae768

.asm_ae7c5
	ld a, [wSceneWarioState]
	cp SCENEWARIO_STUNNED_RIGHT
	ret nz
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.asm_ae7d4
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $3e
	ret c
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	play_sfx SFX_12A
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.asm_ae7f2
	ld a, $80
	ld [w2d892], a
	ret

.PlayBumpSfx:
	play_sfx SFX_BUMP
	ret

.Wait60:
	ld c, 60
	jp Func_ae1c9

.WarioTurnRight:
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

.WarioLookBack:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

.Wait38:
	ld c, 38
	jp Func_ae1c9

.WarioLookAround:
	ld a, SCENEWARIO_LOOK_AROUND_THEN_TURN
	call SetSceneWarioState
	jp Func_ae1ce

.WarioIdleRight:
	ld b, SCENEWARIO_IDLE_RIGHT
	jp Func_ae1c2

.Wait46:
	ld c, 46
	jp Func_ae1c9

Prologue_WarioWalkToCaveEntrance:
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl]
	jumptable
	dw .Wait60_1
	dw .WarioWalkRight
	dw .WarioMoveRightTo120
	dw .Wait60_2
	dw .WarioLookUp
	dw .WarioIdleRight
	dw .ShowEmote
	dw .WaitEmoteAnimation
	dw .Wait40_1
	dw .WarioWalkRight
	dw .WarioMoveRightTo208
	dw .Wait40_2
	dw Func_ae1d5

.Wait60_1:
	ld c, 60
	jp Func_ae1c9

.WarioMoveRightTo120:
	call ApplySceneWarioMovementRight
	cp 120
	ret nz ; if != 120 keep walking
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

.Wait60_2:
	ld c, 60
	jp Func_ae1c9

.WarioLookUp:
	ld a, SCENEWARIO_LOOK_UP
	call SetSceneWarioState
	jp Func_ae1ce

.WarioIdleRight:
	ld b, SCENEWARIO_IDLE_RIGHT
	jp Func_ae1c2

.ShowEmote:
	; place emote on position (Wario_x + 16, Wario_y - 24)
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub 24
	ld [hli], a ; y
	ld a, [wSceneWarioXCoord]
	add 16
	ld [hl], a ; x

	ld a, $11
	ld hl, wCurSceneObjState
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ae1ce

.WaitEmoteAnimation:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	jp Func_ae1ce

.Wait40_1:
	ld c, 40
	jp Func_ae1c9

.WarioWalkRight:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

.WarioMoveRightTo208:
	call ApplySceneWarioMovementRight
	cp 208
	ret nz
	ld [hl], a
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce

.Wait40_2:
	ld c, 40
	jp Func_ae1c9

Func_ae8bb:
	call Func_ae924
	call Func_ae9ee
	call Func_aeb0d
	call Func_aec1f

	ld hl, w2d8a1
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a0
	jumptable
	dw .Func_ae8d9
	dw .Func_ae8e8
	dw .Func_ae8f6
	dw .Func_ae904
	dw .Func_ae8d8

.Func_ae8d8:
	ret

.Func_ae8d9:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart1Counter
	call Func_ae915
	jp .asm_ae912

.Func_ae8e8:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart2Counter
	call Func_ae915
	jr .asm_ae912

.Func_ae8f6:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart3Counter
	call Func_ae915
	jr .asm_ae912

.Func_ae904:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart4Counter
	call Func_ae915
	jr .asm_ae912 ; unnecessary jump
.asm_ae912
	ld hl, w2d8a1

Func_ae915:
	xor a
	ld [hld], a
	inc [hl]
	ret

; input:
; - d = y coordinate
; - e = x coordinate
; - c = new state
; - hl = obj pointer
SetSceneObjCoordAndState:
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, c
	call SetSceneObjState
	ret

Func_ae924:
	ld hl, wPlanePart1Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart1Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_ae971
	dw .Func_ae97e
	dw .Func_ae983
	dw .Func_ae989
	dw .Func_ae98d
	dw .Func_ae99a
	dw .Func_ae99f
	dw .Func_ae9a5
	dw .Func_ae9a9
	dw .Func_ae9b6
	dw .Func_ae9bb
	dw .Func_ae9c1
	dw .Func_ae9c5

.Func_ae948:
	play_sfx SFX_006

.Func_ae950:
	ld hl, wPlanePart1Counter
	jp Func_ae915

.Func_ae956:
	ld a, [wSceneObj3YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart1Action
	inc [hl]
	ret

.Func_ae969:
	ld hl, wPlanePart1Counter
	ld a, [hl]
	cp c
	ret c
	jr Func_ae915

.Func_ae971:
	ld hl, wSceneObj3
	lb de, 46, 240
	ld c, $06
	call SetSceneObjCoordAndState
	jr .Func_ae950

.Func_ae97e:
	call Func_ae9d0
	jr .Func_ae956

.Func_ae983:
	call Func_ae9d0
	ret nz
	jr .Func_ae948

.Func_ae989:
	ld c, $08
	jr .Func_ae969

.Func_ae98d:
	ld hl, wSceneObj3
	lb de, 77, 224
	ld c, $05
	call SetSceneObjCoordAndState
	jr .Func_ae950

.Func_ae99a:
	call Func_ae9da
	jr .Func_ae956

.Func_ae99f:
	call Func_ae9da
	ret nz
	jr .Func_ae948

.Func_ae9a5:
	ld c, $28
	jr .Func_ae969

.Func_ae9a9:
	ld hl, wSceneObj3
	lb de, 62, 240
	ld c, $04
	call SetSceneObjCoordAndState
	jr .Func_ae950

.Func_ae9b6:
	call Func_ae9e4
	jr .Func_ae956

.Func_ae9bb:
	call Func_ae9e4
	ret nz
	jr .Func_ae948

.Func_ae9c1:
	ld c, $08
	jr .Func_ae969

.Func_ae9c5:
	xor a
	ld [wPlanePart1Action], a
	ld hl, wSceneObj3State
	call SetSceneObjState
	ret

Func_ae9d0:
	ld de, Data_aee09
	ld hl, wSceneObj3
	call ApplyOWMovement
	ret

Func_ae9da:
	ld de, Data_aedba
	ld hl, wSceneObj3
	call ApplyOWMovement
	ret

Func_ae9e4:
	ld de, Data_aed6d
	ld hl, wSceneObj3
	call ApplyOWMovement
	ret

Func_ae9ee:
	ld hl, wPlanePart2Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart2Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_aea40
	dw .Func_aea54
	dw .Func_aea59
	dw .Func_aea5f
	dw .Func_aea63
	dw .Func_aea6d
	dw .Func_aea71
	dw .Func_aea92
	dw .Func_aeab9
	dw .Func_aeac0
	dw .Func_aeac5
	dw .Func_aead2
	dw .Func_aead8
	dw .Func_aeadf
	dw .Func_aeae4

.Func_aea16:
	play_sfx SFX_006
.Func_aea1e:
	ld hl, wPlanePart2Counter
	jp Func_ae915

.Func_aea24:
	ld a, [wSceneObj4YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart2Action
	inc [hl]
	ret

.Func_aea37:
	ld hl, wPlanePart2Counter
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aea40:
	ld hl, wSceneObj4
	lb de, 62, 240
	ld c, $02
	call SetSceneObjCoordAndState
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea54:
	call .Func_aeaef
	jr .asm_aea95

.Func_aea59:
	call .Func_aeaef
	ret nz
	jr .Func_aea16

.Func_aea5f:
	ld c, $04
	jr .Func_aea37

.Func_aea63:
	ld a, $12
	ld hl, wSceneObj4State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea6d:
	ld c, $28
	jr .Func_aea37

.Func_aea71:
	ld hl, wSceneObj4
	lb de, 46, 224
	ld c, $08
	call SetSceneObjCoordAndState

.Func_aea7c:
	ld a, [wSceneObj4YCoord]
	ld [wSceneObj1YCoord], a
	ld a, [wSceneObj4XCoord]
	ld [wSceneObj1XCoord], a
	ld a, $0f
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea92:
	call .Func_aeaf9

.asm_aea95
	ld a, [wSceneObj4XCoord]
	ld [wSceneObj1XCoord], a
	ld a, [wSceneObj4YCoord]
	ld [wSceneObj1YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wSceneObj1State
	call SetSceneObjState
	play_sfx SFX_006
	ld hl, wPlanePart2Action
	inc [hl]
	ret

.Func_aeab9:
	call .Func_aeaf9
	ret nz
	jp .Func_aea16

.Func_aeac0:
	ld c, $08
	jp .Func_aea37

.Func_aeac5:
	ld hl, wSceneObj4
	lb de, 46, 244
	ld c, $04
	call SetSceneObjCoordAndState
	jr .Func_aea7c

.Func_aead2:
	call .Func_aeb03
	jp .Func_aea24

.Func_aead8:
	call .Func_aeb03
	ret nz
	jp .Func_aea16

.Func_aeadf:
	ld c, $08
	jp .Func_aea37

.Func_aeae4:
	xor a
	ld [wPlanePart2Action], a
	ld hl, wSceneObj4State
	call SetSceneObjState
	ret

.Func_aeaef:
	ld de, Data_aed6d
	ld hl, wSceneObj4
	call ApplyOWMovement
	ret

.Func_aeaf9:
	ld de, Data_aee09
	ld hl, wSceneObj4
	call ApplyOWMovement
	ret

.Func_aeb03:
	ld de, Data_aee09
	ld hl, wSceneObj4
	call ApplyOWMovement
	ret

Func_aeb0d:
	ld hl, wPlanePart3Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart3Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_aeb5f
	dw .Func_aeb80
	dw .Func_aeba7
	dw .Func_aebad
	dw .Func_aebb1
	dw .Func_aebbf
	dw .Func_aebc5
	dw .Func_aebcc
	dw .Func_aebd0
	dw .Func_aebdb
	dw .Func_aebe0
	dw .Func_aebee
	dw .Func_aebf4
	dw .Func_aebfb
	dw .Func_aec00

.Func_aeb35:
	play_sfx SFX_006
.Func_aeb3d:
	ld hl, wPlanePart3Counter
	jp Func_ae915

.Func_aeb43:
	ld a, [wSceneObj5YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart3Action
	inc [hl]
	ret

.Func_aeb56:
	ld hl, wPlanePart3Counter
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aeb5f:
	ld hl, wSceneObj5
	lb de, 62, 224
	ld c, $03
	call SetSceneObjCoordAndState
	ld a, [wSceneObj5YCoord]
	ld [wSceneObj2YCoord], a
	ld a, [wSceneObj5XCoord]
	ld [wSceneObj2XCoord], a
	ld a, $0f
	ld hl, wSceneObj2State
	call SetSceneObjState
	jr .Func_aeb3d

.Func_aeb80:
	call .Func_aec0b
	ld a, [wSceneObj5XCoord]
	ld [wSceneObj2XCoord], a
	ld a, [wSceneObj5YCoord]
	ld [wSceneObj2YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_006
	ld hl, wPlanePart3Action
	inc [hl]
	ret

.Func_aeba7:
	call .Func_aec0b
	ret nz
	jr .Func_aeb35

.Func_aebad:
	ld c, $08
	jr .Func_aeb56

.Func_aebb1:
	ld hl, wSceneObj5
	lb de, 46, 240
	ld c, $07
	call SetSceneObjCoordAndState
	jp .Func_aeb3d

.Func_aebbf:
	call .Func_aec15
	jp .Func_aeb43

.Func_aebc5:
	call .Func_aec15
	ret nz
	jp .Func_aeb35

.Func_aebcc:
	ld c, $04
	jr .Func_aeb56

.Func_aebd0:
	ld a, $13
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp .Func_aeb3d

.Func_aebdb:
	ld c, $28
	jp .Func_aeb56

.Func_aebe0:
	ld hl, wSceneObj5
	lb de, 77, 248
	ld c, $05
	call SetSceneObjCoordAndState
	jp .Func_aeb3d

.Func_aebee:
	call .Func_aec1a
	jp .Func_aeb43

.Func_aebf4:
	call .Func_aec1a
	ret nz
	jp .Func_aeb35

.Func_aebfb:
	ld c, $08
	jp .Func_aeb56

.Func_aec00:
	xor a
	ld [wPlanePart3Action], a
	ld hl, wSceneObj5State
	call SetSceneObjState
	ret

.Func_aec0b:
	ld de, Data_aed6d
.Func_aec0e:
	ld hl, wSceneObj5
	call ApplyOWMovement
	ret

.Func_aec15:
	ld de, Data_aee09
	jr .Func_aec0e

.Func_aec1a:
	ld de, Data_aedba
	jr .Func_aec0e

Func_aec1f:
	ld hl, wPlanePart4Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart4Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_aec69
	dw .Func_aec76
	dw .Func_aec7b
	dw .Func_aec81
	dw .Func_aec85
	dw .Func_aec8f
	dw .Func_aec93
	dw .Func_aecb4
	dw .Func_aecdb
	dw .Func_aece2
	dw .Func_aece7

.Func_aec3f:
	play_sfx SFX_006
.Func_aec47:
	ld hl, wPlanePart4Counter
	jp Func_ae915

.Func_aec4d:
	ld a, [wSceneObj9YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart4Action
	inc [hl]
	ret

.Func_aec60:
	ld hl, wPlanePart4Counter
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aec69:
	ld hl, wSceneObj9
	lb de, 77, 240
	ld c, $07
	call SetSceneObjCoordAndState
	jr .Func_aec47

.Func_aec76:
	call .Func_aecf2
	jr .Func_aec4d

.Func_aec7b:
	call .Func_aecf2
	ret nz
	jr .Func_aec3f

.Func_aec81:
	ld c, $04
	jr .Func_aec60

.Func_aec85:
	ld a, $13
	ld hl, wSceneObj9State
	call SetSceneObjState
	jr .Func_aec47

.Func_aec8f:
	ld c, $28
	jr .Func_aec60

.Func_aec93:
	ld hl, wSceneObj9
	lb de, 62, 240
	ld c, $08
	call SetSceneObjCoordAndState
	ld a, [wSceneObj9YCoord]
	ld [wSceneObj8YCoord], a
	ld a, [wSceneObj9XCoord]
	ld [wSceneObj8XCoord], a
	ld a, $0f
	ld hl, wSceneObj8State
	call SetSceneObjState
	jr .Func_aec47

.Func_aecb4:
	call .Func_aecfc
	ld a, [wSceneObj9XCoord]
	ld [wSceneObj8XCoord], a
	ld a, [wSceneObj9YCoord]
	ld [wSceneObj8YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wSceneObj8State
	call SetSceneObjState
	play_sfx SFX_006
	ld hl, wPlanePart4Action
	inc [hl]
	ret

.Func_aecdb:
	call .Func_aecfc
	ret nz
	jp .Func_aec3f

.Func_aece2:
	ld c, $08
	jp .Func_aec60

.Func_aece7:
	xor a
	ld [wPlanePart4Action], a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret

.Func_aecf2:
	ld de, Data_aedba
.Func_aecf5:
	ld hl, wSceneObj9
	call ApplyOWMovement
	ret

.Func_aecfc:
	ld de, Data_aed6d
	jr .Func_aecf5

.Func_aed01:
	ld de, Data_aee09
	jr .Func_aecf5

Data_aed06:
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 0
	db  0, 1
	db  0, 1
	db -1, 2
	db  0, 2
	db  0, 2
	db  1, 3
	db  0, 4
	db  1, 5
	db  2, 5
	db  2, 4
	db  3, 5
	db  2, 3
	db  2, 2
	db  2, 2
	db  2, 3
	db  3, 2
	db  2, 2
	db  3, 1
	db  3, 2
	db  3, 1
	db  3, 1
	db  3, 1
	db  0, 0
	db -3, 1
	db -3, 2
	db -2, 1
	db -3, 3
	db -1, 2
	db -2, 3
	db  0, 3
	db  0, 3
	db  1, 3
	db  2, 2
	db  2, 2
	db  2, 2
	db  2, 2
	db  2, 2
	db  3, 1
	db  0, 0
	db -2, 2
	db -2, 2
	db -2, 2
	db  0, 3
	db  0, 3
	db  2, 2
	db  2, 2
	db  2, 1
	db $80

Data_aed6d:
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 1
	db  0, 1
	db  0, 2
	db  0, 2
	db  0, 3
	db  0, 4
	db  1, 6
	db  2, 6
	db  2, 6
	db  3, 6
	db  2, 3
	db  2, 4
	db  3, 3
	db  2, 3
	db  3, 3
	db  3, 3
	db  3, 3
	db  3, 2
	db  4, 3
	db  3, 2
	db  0, 0
	db -2, 2
	db -3, 1
	db -2, 2
	db -2, 3
	db -1, 2
	db -1, 3
	db  0, 3
	db  0, 3
	db  1, 3
	db  1, 2
	db  2, 3
	db  2, 2
	db  3, 1
	db  2, 2
	db $80

Data_aedba:
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 1
	db -1, 1
	db  0, 2
	db  0, 2
	db  0, 3
	db  0, 3
	db  0, 5
	db  1, 6
	db  1, 7
	db  1, 7
	db  2, 7
	db  1, 4
	db  1, 5
	db  1, 4
	db  2, 5
	db  1, 4
	db  2, 5
	db  2, 4
	db  2, 5
	db  2, 4
	db  3, 4
	db  0, 0
	db -1, 2
	db -2, 3
	db -1, 2
	db -2, 3
	db -1, 2
	db -1, 3
	db  0, 3
	db  0, 3
	db  1, 3
	db  1, 2
	db  2, 3
	db  1, 2
	db  2, 3
	db  1, 2
	db $80

Data_aee09:
	db  0, 0
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 1
	db  0, 1
	db  1, 1
	db  0, 2
	db  1, 2
	db  2, 3
	db  2, 3
	db  2, 3
	db  4, 4
	db  4, 3
	db  3, 2
	db  3, 2
	db  3, 2
	db  4, 1
	db  3, 2
	db  4, 2
	db  4, 1
	db  4, 1
	db  4, 1
	db  4, 1
	db  0, 0
	db -2, 2
	db -3, 2
	db -2, 1
	db -2, 2
	db -2, 2
	db -2, 2
	db -1, 3
	db  1, 3
	db  2, 2
	db  2, 2
	db  2, 2
	db  2, 1
	db  3, 2
	db  2, 2
	db $80

_InitEpilogue:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	stop_music2

	ld a, $02
	ldh [rWBK], a
	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a

	call VBlank_PrologueEpilogue
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM

	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes

	decompress_tiles0 EpilogueGfx, v0Tiles0
	decompress_tiles1 FontGfx, v1Tiles0

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v0Tiles1
	ld de, wAttrmap
	ld bc, $50 tiles
	call CopyHLToDE_BC
	ld hl, EpilogueStarGfx
	ld de, v1Tiles1 tile $40
	ld c, $00 ; aka $100 bytes
	ld b, BANK(EpilogueStarGfx)
	call CopyFarBytes
	xor a
	ldh [rVBK], a

	decompress_tiles1 SpearheadGfx, v1Tiles0
	decompress_tiles1 HammerBotGfx, v1Tiles0, $40
	decompress_tiles1 DoughnuteerGfx, v1Tiles1

	decompress_attrmap EpilogueTransformationAttrmap, v1BGMap0
	decompress_tilemap EpilogueTransformationTilemap, v0BGMap0
	decompress_attrmap PrologueAttrmap, v1BGMap1
	decompress_tilemap PrologueTilemap, v0BGMap1

	call FillClearedTextBuffer
	ld a, [wLanguage]
	and a
	ld hl, TextJP_OldManThankYou ; japanese
	jr z, .got_text
	ld hl, TextEN_OldManThankYou ; english
.got_text
	ld a, BANK(TextJP_OldManThankYou) ; aka BANK(TextEN_OldManThankYou)
	ld [wTempBank], a
	ld bc, wTextBuffer
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a

	ld a, [wCollectionRow]
	ld b, a
	and a
	ld a, LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_WIN_9C00 | LCDC_ON
	jr z, .asm_af014
	xor b
.asm_af014
	ldh [rLCDC], a
	xor a
	ld [wCollectionRow], a
	ld hl, wSubState
	inc [hl]
	ret

; unreferenced
Func_af01f:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	play_music2 MUSIC_EPILOGUE

	ld a, $02
	ldh [rWBK], a
	ld a, SCREEN_WIDTH_PX
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ldh [rSCY], a
	ld [wSCY], a

	ld hl, Pals_86add
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86add)
	call CopyFarBytes
	ld hl, Pals_86b1d
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_86b1d)
	call CopyFarBytes

	decompress_tiles1 FontGfx, v1Tiles0

	; attempting to decompress uncompressed data
	decompress_attrmap EpilogueCrowdAttrmap, v1BGMap0
	decompress_tilemap EpilogueCrowdTilemap, v0BGMap0

	ld hl, wOWUIObj1YCoord
	ld a, $60
	ld [hli], a
	ld [hl], $5c
	ld a, $ff
	ld [wOWUIObj2YCoord], a

	ld a, $0c
	call SetSceneWarioState
	ld hl, wSceneObj10
	ld a, $30
	ld [hli], a
	ld [hl], $00
	ld a, $1b
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld hl, wSceneObj11
	ld a, $35
	ld [hli], a
	ld [hl], $20
	ld a, $1c
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld hl, wSceneObj12
	ld a, $32
	ld [hli], a
	ld [hl], $70
	ld a, $1b
	ld hl, wSceneObj12State
	call SetSceneObjState
	ld hl, wSceneObj13
	ld a, $38
	ld [hli], a
	ld [hl], $c0
	ld a, $1c
	ld hl, wSceneObj13State
	call SetSceneObjState

	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	ld [w2d890], a
	ld [w2d891], a
	ld a, [wCollectionRow]
	ld b, a
	and a
	ld a, LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_WIN_9C00 | LCDC_ON
	jr z, .asm_af127
	xor b
.asm_af127
	ldh [rLCDC], a
	xor a
	ld [wCollectionRow], a
	jp Func_af135

Func_af130:
	ld a, [w2d014]
	cp c
	ret c
;	fallthrough

Func_af135:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret

Func_af13c:
	call .Func_af14c
	call Func_ac074
	call UpdateSceneWario
	call Func_ac080
	call ClearUnusedVirtualOAM
	ret

.Func_af14c:
	call .Func_af8bc

	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable
	dw Func_af135
	dw .Func_af197
	dw .Func_af19c
	dw Func_ac9ca
	dw .Func_af7af
	dw .Func_af2d0
	dw PrologueFade
	dw .Func_af1e7
	dw .Func_af207
	dw .Func_af215
	dw .Func_af222
	dw .Func_af230
	dw .Func_af23e
	dw Func_ac9ca
	dw .Func_af741
	dw InitTextPrinting
	dw Func_aca9e
	dw .Func_af2bc
	dw LoadCurTextPageBufferPage
	dw Func_acacd
	dw .Func_af2c1
	dw Func_acaf3
	dw .Func_af670
	dw .Func_af2d0
	dw PrologueFade
	dw .Func_af2df
	dw .Func_af2f2
	dw Func_ac9ca
	dw .Func_af436
	dw .Func_af2d0
	dw .Func_af34a
	dw .Func_af353

.Func_af197:
	ld c, $3c
	jp Func_af130
.Func_af19c:
	ld hl, wSceneObj9
	ld a, $60
	ld [hli], a
	ld a, $50
	ld [hl], a
	ld a, $18
	ld hl, wSceneObj9State
	call SetSceneObjState
	call .Func_af1bd
	call .Func_af1db
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_af135
.Func_af1bd:
	call Func_aca09
	ld hl, Pals_86add
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86add)
	call CopyFarBytes
	ld hl, Pals_86b1d
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_86b1d)
	call CopyFarBytes
	ret
.Func_af1db:
	ld hl, .Pals_af35e
	ld de, wTempPals2 palette 4
	ld b, 3 palettes
	call CopyHLToDE
	ret
.Func_af1e7:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, OldMan1Gfx
	ld b, HIGH(v0Tiles1) - $80
	ld c, $40 dma_tiles
.asm_af1f2
	ld a, BANK(OldMan1Gfx)
	ld [wHDMABank], a
.asm_af1f7
	ld hl, wHDMA
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	ld [hl], a
	jp Func_af135
.Func_af207:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, OldMan2Gfx
	ld b, HIGH(v1Tiles0) - $80
	ld c, $80 dma_tiles
	jr .asm_af1f2
.Func_af215:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, EpilogueCrowdTilemap
	ld b, HIGH(v0BGMap0) - $80
	ld c, 18 dma_rows
	jr .asm_af1f2
.Func_af222:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, EpilogueCrowdAttrmap
	ld b, HIGH(v1BGMap0) - $80
	ld c, 18 dma_rows
	jr .asm_af1f2
.Func_af230:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, wAttrmap
	ld b, HIGH(v1Tiles1) - $80
	ld c, $50 dma_tiles
	jr .asm_af1f2
.Func_af23e:
	ld a, SCREEN_WIDTH_PX
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ld hl, wOWUIObj1YCoord
	ld a, $60
	ld [hli], a
	ld [hl], $5c
	ld a, $ff
	ld [wOWUIObj2YCoord], a
	ld a, $0c
	call SetSceneWarioState

	ld hl, wSceneObj10
	lb de, $30, $00
	ld b, $1b
	call .Func_af2ab
	ld hl, wSceneObj11
	lb de, $35, $20
	ld b, $1c
	call .Func_af2ab
	ld hl, wSceneObj12
	lb de, $32, $70
	ld b, $1b
	call .Func_af2ab
	ld hl, wSceneObj13
	lb de, $38, $c0
	ld b, $1c
	call .Func_af2ab

	ld hl, Pals_86add
	ld de, wTempPals1
	call .Func_af2b5
	ld hl, Pals_86b1d
	ld de, wTempPals2
	call .Func_af2b5

	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	ld [w2d890], a
	ld [w2d891], a
	jp Func_af135
.Func_af2ab:
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, b
	jp SetSceneObjState
.Func_af2b5:
	ld c, 8 palettes
	ld b, BANK(Pals_86add) ; aka BANK(Pals_86b1d)
	jp CopyFarBytes
.Func_af2bc:
	ld c, $1e
	jp Func_af130
.Func_af2c1:
	call PrintTextWithoutHeader
	call .Func_af376
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_af135
.Func_af2d0:
	ld a, $00
	ld [w2d880], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_af135
.Func_af2df:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, PrologueBackgroundGfx
	ld b, HIGH(v0Tiles2) - $80
	ld c, $80 dma_tiles
	ld a, BANK(PrologueBackgroundGfx)
	ld [wHDMABank], a
	jp .asm_af1f7
.Func_af2f2:
	ld hl, wSceneObj9
	ld a, $3c
	ld [hli], a
	ld a, $b2
	ld [hl], a
	ld a, $13
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wOWUIObj1YCoord
	ld a, $3c
	ld [hli], a
	ld a, $c8
	ld [hl], a
	ld a, $1c
	call SetSceneWarioState
	xor a
	ld [wSceneObj10State], a
	ld [wSceneObj11State], a
	ld [wSceneObj12State], a
	ld [wSceneObj13State], a
	ld a, $08
	ld [wCollectionRow], a
	call Func_aca09
	ld hl, Pals_869cd
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_869cd)
	call CopyFarBytes
	ld hl, Pals_86b1d
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_86b1d)
	call CopyFarBytes
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_af135

.Func_af34a:
	ld a, [w2d014]
	and $03
	ret nz
	jp PrologueFade

.Func_af353:
	ld a, [w2d014]
	cp $3c
	ret c
	ld hl, wSubState
	inc [hl]
	ret

.Pals_af35e:
	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

.Func_af376:
	ld a, [wPendingCharDest]
	and a
	ret z
	ld a, [wCurTextLinePos]
	cp 1
	ret nz
	ld a, [wLanguage]
	and a
	jr nz, .english
; japanese
	ld a, [wPalFade7Colour3RedUnk1]
	cp $01
	jr z, .asm_af3ce
	cp $04
	jr z, .asm_af3de
	cp $05
	jr z, .asm_af3e6
	cp $07
	jr z, .asm_af3f2
	cp $0a
	jr z, .asm_af3f6
	cp $0b
	jr z, .asm_af3fa
	jr .asm_af3bf
.english
	ld a, [wPalFade7Colour3RedUnk1]
	cp $01
	jr z, .asm_af3ce
	cp $04
	jr z, .asm_af3de
	cp $05
	jr z, .asm_af3e2
	cp $08
	jr z, .asm_af3f2
	cp $0b
	jr z, .asm_af3ce
	cp $0c
	jr z, .asm_af3de
.asm_af3bf
	ld a, [wPalFade7Colour3RedSign]
	cp $01
	ret nz
	ld a, $0b
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret
.asm_af3ce
	ld b, $10
.asm_af3d0
	ld a, $01
	ld hl, wPalFade7Colour3RedSign
	cp [hl]
	ret nz
.asm_af3d7
	ld a, b
	ld hl, wSceneObj9State
	jp SetSceneObjState
.asm_af3de
	ld b, $0c
	jr .asm_af3d0
.asm_af3e2
	ld b, $0d
	jr .asm_af3d0
.asm_af3e6
	ld b, $0d
.asm_af3e8
	ld a, $02
.asm_af3ea
	ld hl, wPalFade7Colour3RedSign
	cp [hl]
	jr nz, .asm_af3bf
	jr .asm_af3d7
.asm_af3f2
	ld b, $0e
	jr .asm_af3e8
.asm_af3f6
	ld b, $10
	jr .asm_af3e8
.asm_af3fa
	ld b, $0c
	ld a, $03
	jr .asm_af3ea

.asm_af400
	ld a, [wOWUIObj1State]
	cp b
	ret nz
	jr .asm_af40c

	ld a, [w2d891]
	cp c
	ret c

.asm_af40c
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl]
	ret

.asm_af413
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a
	jp Func_af135

.Func_af41c:
	farcall Func_84e43
	ld a, [wPalConfig1TotalSteps]
	and a
	ret nz
	ld hl, w2d891
	ld [hld], a
	inc [hl]
	ret

.Func_af436:
	call .Func_af60d
	call .Func_af57b
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af466
	dw .Func_af476
	dw .Func_af48a
	dw .Func_af49e
	dw .Func_af4ad
	dw .Func_af4b9
	dw .Func_af4be
	dw .Func_af4ca
	dw .Func_af4cf
	dw .Func_af4e7
	dw .Func_af4f6
	dw .Func_af528
	dw .Func_af534
	dw .Func_af545
	dw .Func_af54a
	dw .Func_af55a
	dw .Func_af574

.Func_af466:
	xor a
	ld [wPalFade2Colour2GreenUnk1], a
	ld [w2d892], a
	ld [wTempleRock5Action], a
	ld [wPalFade2Colour4GreenSign], a
	jp .asm_af40c

.Func_af476:
	ld a, [bc]
	cp $40
	ret c
	ld a, $01
	ld [w2d892], a
	play_sfx SFX_THROW
	jp .asm_af40c

.Func_af48a:
	ld a, [bc]
	cp $56
	ret c
	ld a, $01
	ld [wTempleRock5Action], a
	play_sfx SFX_THROW
	jp .asm_af40c

.Func_af49e:
	ld a, [w2d892]
	cp $80
	ret nz
	ld a, [wTempleRock5Action]
	cp $80
	ret nz
	jp .asm_af40c

.Func_af4ad:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $05
	call SetSceneWarioState
	jp .asm_af40c

.Func_af4b9:
	ld b, $02
	jp .asm_af400

.Func_af4be:
	ld a, [bc]
	cp $28
	ret c
	ld a, $14
	call SetSceneWarioState
	jp .asm_af40c

.Func_af4ca:
	ld b, $0c
	jp .asm_af400

.Func_af4cf:
	ld a, [bc]
	cp $2d
	ret c
	ld a, $0b
	call SetSceneWarioState
	xor a
	ld [wSceneObj9Unk7], a
	play_sfx SFX_GRAB
	jp .asm_af40c

.Func_af4e7:
	ld a, [wSceneObj9Unk7]
	cp $80
	ret nz
	ld a, [wOWUIObj1State]
	cp $0a
	ret nz
	jp .asm_af40c

.Func_af4f6:
	ld a, [w2d891]
	cp $04
	jr z, .asm_af506
	cp $06
	jr z, .asm_af518
	cp $07
	jr z, .asm_af51e
	ret
.asm_af506
	ld d, $df
	ld e, $fa
.asm_af50a
	ld hl, wSceneObj9
	ld a, [wOWUIObj1YCoord]
	add d
	ld [hli], a
	ld a, [wOWUIObj1XCoord]
	add e
	ld [hl], a
	ret
.asm_af518
	ld d, $e0
	ld e, $fb
	jr .asm_af50a
.asm_af51e
	ld d, $e2
	ld e, $fc
	call .asm_af50a
	jp .asm_af40c

.Func_af528:
	ld a, [bc]
	cp $32
	ret c
	ld a, $21
	call SetSceneWarioState
	jp .asm_af40c

.Func_af534:
	ld a, [wOWUIObj1Frame]
	cp $0b
	ret nz
	play_sfx SFX_106
	jp .asm_af40c

.Func_af545:
	ld b, $0a
	jp .asm_af400

.Func_af54a:
	ld a, [bc]
	cp $32
	ret c
	ld a, $09
	call SetSceneWarioState
	xor a
	ld [wSceneObj9Unk7], a
	jp .asm_af40c

.Func_af55a:
	call Func_aca63
	ld a, [wOWUIObj1XCoord]
	ld b, a
	sub $04
	ld [wSceneObj9XCoord], a
	ld a, $f0
	cp b
	ret nz
	xor a
	ld [wOWUIObj1State], a
	ld [wSceneObj9State], a
	jp .asm_af40c

.Func_af574:
	ld a, [bc]
	cp $3c
	ret c
	jp .asm_af413

.Func_af57b:
	ld a, [wPalFade2Colour2GreenUnk1]
	and a
	jr z, .asm_af597
	ld a, [w2d891]
	and $03
	jr z, .asm_af597
	ld de, Data_aed06
	ld hl, wOWUIObj1YCoord
	call ApplyOWMovement_Mirrored
	jr nz, .asm_af597
	xor a
	ld [wPalFade2Colour2GreenUnk1], a
.asm_af597
	ld a, [w2d892]
	cp $80
	ret z
	jumptable
	dw .Func_af5b2
	dw .Func_af5b3
	dw .Func_af5c5
	dw .Func_af5d5
	dw .Func_af5c5
	dw .Func_af5d5
	dw .Func_af5c5
	dw .Func_af5df
	dw .Func_af5e7
	dw .Func_af5fe

.Func_af5b2:
	ret

.Func_af5b3:
	ld a, $01
	ld [wPalFade2Colour2GreenUnk1], a
	xor a
	ld [wSceneWarioUnk7], a
.asm_af5bc
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.Func_af5c5:
	ld a, [wOWUIObj1YCoord]
	cp $60
	ret nz
	ld a, $1b
	call SetSceneWarioState
	call .Func_af604
	jr .asm_af5bc

.Func_af5d5:
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_af5bc

.Func_af5df:
	ld a, [wOWUIObj1State]
	cp $1c
	ret nz
	jr .asm_af5bc

.Func_af5e7:
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $42
	ret c
	ld a, $0c
	call SetSceneWarioState
	play_sfx SFX_12A
	jr .asm_af5bc

.Func_af5fe:
	ld a, $80
	ld [w2d892], a
	ret

.Func_af604:
	play_sfx SFX_BUMP
	ret

.Func_af60d:
	ld a, [wPalFade2Colour4GreenSign]
	and a
	jr z, .asm_af622
	ld hl, wSceneObj9
	ld de, Data_aed06
	call ApplyOWMovement_Mirrored
	jr nz, .asm_af622
	xor a
	ld [wPalFade2Colour4GreenSign], a
.asm_af622
	ld a, [wTempleRock5Action]
	cp $80
	ret z
	jumptable
	dw .Func_af639
	dw .Func_af63a
	dw .Func_af64c
	dw .Func_af657
	dw .Func_af64c
	dw .Func_af657
	dw .Func_af64c
	dw .Func_af661

.Func_af639:
	ret

.Func_af63a:
	ld a, $01
	ld [wPalFade2Colour4GreenSign], a
	xor a
	ld [wSceneObj9Unk7], a
.asm_af643
	ld hl, wTempleRock5Action
	inc [hl]
	xor a
	ld [wTempleRock5Counter], a
	ret

.Func_af64c:
	ld a, [wSceneObj9YCoord]
	cp $60
	ret nz
	call .Func_af667
	jr .asm_af643

.Func_af657:
	ld hl, wTempleRock5Counter
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_af643

.Func_af661:
	ld a, $80
	ld [wTempleRock5Action], a
	ret

.Func_af667:
	play_sfx SFX_BUMP
	ret

.Func_af670:
	call Func_ae523
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af68b
	dw .Func_af69a
	dw .Func_af6c1
	dw .Func_af6cd
	dw .Func_af6ee
	dw .Func_af6f9
	dw .Func_af700
	dw .Func_af73a

.Func_af68b:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $01
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp .asm_af40c

.Func_af69a:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	stop_music2
	call ClearTextbox
	ld a, $0f
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp .asm_af40c

.Func_af6c1:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $01
	ld [w2d150], a
	jp .asm_af40c

.Func_af6cd:
	ld a, [bc]
	cp $28
	ret c
	ld a, $80
	ld [w2d150], a
	ld hl, wCurSceneObj
	ld a, [wOWUIObj1YCoord]
	sub $04
	ld [hli], a
	ld a, [wOWUIObj1XCoord]
	ld [hl], a
	ld a, $11
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp .asm_af40c

.Func_af6ee:
	ld a, [bc]
	cp $14
	ret c
	xor a
	call SetSceneWarioState
	jp .asm_af40c

.Func_af6f9:
	ld a, [bc]
	cp $5a
	ret c
	jp .asm_af40c

.Func_af700:
	ld hl, wCurSceneObj
	ld a, [hl]
	cp $50
	jr c, .asm_af711
	ld a, [w2d891]
	ld b, a
	and $03
	ret nz
	dec [hl]
	ret
.asm_af711
	dec [hl]
	dec [hl]
	dec [hl]
	ld a, [hl]
	cp $18
	jr c, .asm_af733
	cp $40
	ret nc
	ld a, [wCurSceneObjState]
	cp $12
	ret z
	ld a, $12
	ld hl, wCurSceneObjState
	call SetSceneObjState
	ld a, $0a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret
.asm_af733
	xor a
	ld [wCurSceneObjState], a
	jp Func_ae1ce

.Func_af73a:
	ld a, [bc]
	cp $2d
	ret c
	jp .asm_af413

.Func_af741:
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af755
	dw .Func_af76c
	dw .Func_af775
	dw .Func_af788
	dw .Func_af797
	dw .Func_af7a0

.Func_af755:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $08
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9
	ld a, $60
	ld [hli], a
	ld [hl], $80
	jp .asm_af40c

.Func_af76c:
	call .Func_af7a7
	cp $e0
	ret nz
	jp .asm_af40c

.Func_af775:
	call .Func_af7a7
	ld hl, wSCX
	inc [hl]
	ret nz
	ld a, $09
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp .asm_af40c

.Func_af788:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $06
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp .asm_af40c

.Func_af797:
	ld a, [wSceneObj9State]
	cp $0a
	ret nz
	jp .asm_af40c

.Func_af7a0:
	ld a, [bc]
	cp $3c
	ret c
	jp .asm_af413

.Func_af7a7:
	ld hl, wSceneObj9XCoord
	inc [hl]
	ld a, [hl]
	and $fe
	ret

.Func_af7af:
	farcall Func_15848a
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af7ee
	dw .Func_af7fd
	dw .Func_af816
	dw .Func_af41c
	dw .Func_af82d
	dw .Func_af41c
	dw .Func_af843
	dw .Func_af860
	dw .Func_af816
	dw .Func_af41c
	dw .Func_af863
	dw .Func_af41c
	dw .Func_af871
	dw .Func_af88e
	dw .Func_af816
	dw .Func_af41c
	dw .Func_af893
	dw .Func_af41c
	dw .Func_af8a2
	dw .Func_af8a9

.Func_af7ee:
	play_music2 MUSIC_EPILOGUE
	jp .asm_af40c

.Func_af7fd:
	ld a, $04
.asm_af7ff
	ld [wSceneObj5Attributes], a
	ld [wSceneObj6Attributes], a
	ld [wSceneObj7Attributes], a
	ld [wSceneObj8Attributes], a
	ld [wSceneObj1Attributes], a
	ld a, $01
	ld [w2d8a0], a
	jp .asm_af40c

.Func_af816:
	ld a, [wSceneObj1YCoord]
	cp $50
	ret c
	play_sfx SFX_0EB
	call Func_aca09
	call Func_aca25
	jp .asm_af40c

.Func_af82d:
	ld a, $02
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9XCoord
	dec [hl]
.asm_af839
	xor a
	ld [wSceneObj1State], a
	call .Func_af1bd
	jp .asm_af40c

.Func_af843:
	ld a, [bc]
	cp $50
	ret c
	ld a, $19
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld a, $48
	ld [wSceneObj9XCoord], a
	call .Func_af1db
	ld de, Data_aca04
	call Func_ac9e4
	jp .asm_af40c

.Func_af860:
	xor a
	jr .asm_af7ff

.Func_af863:
	ld a, $03
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9XCoord
	dec [hl]
	jr .asm_af839

.Func_af871:
	ld a, [bc]
	cp $50
	ret c
	ld a, $1a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld a, $58
	ld [wSceneObj9XCoord], a
	call .Func_af1db
	ld de, Data_aca04
	call Func_ac9e4
	jp .asm_af40c

.Func_af88e:
	ld a, $03
	jp .asm_af7ff

.Func_af893:
	ld a, $04
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9XCoord
	dec [hl]
	dec [hl]
	jr .asm_af839

.Func_af8a2:
	ld a, [bc]
	cp $50
	ret c
	jp .asm_af40c

.Func_af8a9:
	xor a
	ld [wSceneObj5Attributes], a
	ld [wSceneObj6Attributes], a
	ld [wSceneObj7Attributes], a
	ld [wSceneObj8Attributes], a
	ld [wSceneObj1Attributes], a
	jp .asm_af413

.Func_af8bc:
	ld hl, wSceneObj10State
	ld a, [hl]
	cp $1b
	ret nz
	call .Func_af8d0
	call .Func_af8dc
	call .Func_af8ef
	call .Func_af902
	ret

.Func_af8d0:
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

.Func_af8dc:
	ld hl, wSceneObj11State
	ld a, [hl]
	cp $1c
	ret nz
	ld a, [wGlobalCounter]
	and %111
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

.Func_af8ef:
	ld hl, wSceneObj12State
	ld a, [hl]
	cp $1b
	ret nz
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

.Func_af902:
	ld hl, wSceneObj13State
	ld a, [hl]
	cp $1c
	ret nz
	ld a, [wGlobalCounter]
	and %111
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

	ds $6eb, $00
