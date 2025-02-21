Func_9c000:
	xor a
	ld [w2d01e], a
	ret

Func_9c005:
	xor a
	ld [w2d01e], a
	ld a, [w2d025]
	ld b, a
	ld hl, Func_9c072.table
	call GetPointerFromTableHL
	ld a, h
	cp HIGH(Func_9c000)
	jr nz, .valid
	ld a, l
	cp LOW(Func_9c000)
	ret z
.valid
	ld a, b
	ld [w2d01e], a
	ret

Func_9c021:
	call DisableLCD
	call ClearVirtualOAM
	stop_music2

	xor a
	ld hl, wLCDCFlagsToFlip
	ld bc, $30
	call WriteAToHL_BCTimes

	call VBlank_9cc9c
	call Func_9c072

	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ldh [rSCX], a
	ld [wSCX], a
	ld [w2d801], a
	ld [w2d013], a
	ld [w2d014], a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a

	ld a, [wLCDCFlagsToFlip]
	ld b, a
	and a
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_WIN9C00 | LCDCF_ON
	jr z, .asm_9c067
	xor b
.asm_9c067
	ldh [rLCDC], a
	xor a
	ld [wLCDCFlagsToFlip], a

	ld hl, wSubState
	inc [hl]
	ret

Func_9c072:
	xor a
	ld [wLCDCFlagsToFlip], a
	call ClearVirtualOAM
	ld a, [w2d025]
	dec a
	jr z, .skip_load_tiles
	decompress_vram1 Cutscenes6Gfx, v1Tiles0
.skip_load_tiles
	ld a, [w2d025]
	ld [w2d01e], a
	jumptable

.table
	table_width 2
	dw Func_9c000  ; CUTSCENE_00
	dw .Func_9c15e ; CUTSCENE_01
	dw .InitCutscene02 ; CUTSCENE_02
	dw .InitCutscene03 ; CUTSCENE_03
	dw .InitCutscene04 ; CUTSCENE_04
	dw Func_9c000  ; CUTSCENE_05
	dw .Func_9c1b6 ; CUTSCENE_06
	dw .Func_9c209 ; CUTSCENE_07
	dw .Func_9c25c ; CUTSCENE_08
	dw .Func_9c28e ; CUTSCENE_09
	dw .Func_9c2a4 ; CUTSCENE_0A
	dw Func_9c000  ; CUTSCENE_0B
	dw .Func_9c2bd ; CUTSCENE_0C
	dw .Func_9c2d3 ; CUTSCENE_0D
	dw .Func_9c2ec ; CUTSCENE_0E
	dw Func_9c000  ; CUTSCENE_0F
	dw .Func_9c27a ; CUTSCENE_10
	dw .Func_9c305 ; CUTSCENE_11
	dw Func_9c000  ; CUTSCENE_12
	dw .Func_9c31e ; CUTSCENE_13
	dw .Func_9c339 ; CUTSCENE_14
	dw .Func_9c357 ; CUTSCENE_15
	dw Func_9c000  ; CUTSCENE_16
	dw .Func_9c284 ; CUTSCENE_17
	dw .Func_9c57a ; CUTSCENE_18
	dw .Func_9c386 ; CUTSCENE_19
	dw Func_9c000  ; CUTSCENE_1A
	dw .Func_9c39c ; CUTSCENE_1B
	dw Func_9c000  ; CUTSCENE_1C
	dw .Func_9c27f ; CUTSCENE_1D
	dw .Func_9c423 ; CUTSCENE_1E
	dw .Func_9c5a6 ; CUTSCENE_1F
	dw Func_9c000  ; CUTSCENE_20
	dw .Func_9c5c5 ; CUTSCENE_21
	dw .Func_9c476 ; CUTSCENE_22
	dw Func_9c000  ; CUTSCENE_23
	dw .Func_9c4b9 ; CUTSCENE_24
	dw .Func_9c289 ; CUTSCENE_25
	dw Func_9c000  ; CUTSCENE_26
	dw .Func_9c4e1 ; CUTSCENE_27
	dw Func_9c000  ; CUTSCENE_28
	dw Func_9c000  ; CUTSCENE_29
	dw Func_9c000  ; CUTSCENE_2A
	dw Func_9c000  ; CUTSCENE_2B
	dw Func_9c000  ; CUTSCENE_2C
	dw Func_9c000  ; CUTSCENE_2D
	dw Func_9c000  ; CUTSCENE_2E
	dw Func_9c000  ; CUTSCENE_2F
	dw .Func_9c60f ; CUTSCENE_30
	dw Func_9c000  ; CUTSCENE_31
	dw Func_9c000  ; CUTSCENE_32
	dw Func_9c000  ; CUTSCENE_33
	dw Func_9c000  ; CUTSCENE_34
	dw Func_9c000  ; CUTSCENE_35
	dw Func_9c000  ; CUTSCENE_36
	dw .Func_9c5e3 ; CUTSCENE_37
	dw .Func_9c5f9 ; CUTSCENE_38
	dw .Func_9c623 ; CUTSCENE_39
	dw .Func_9c636 ; CUTSCENE_3A
	dw Func_9c000  ; CUTSCENE_3B
	dw .Func_9c64d ; CUTSCENE_3C
	dw .Func_9c69d ; CUTSCENE_3D
	dw Func_9c000  ; CUTSCENE_3E
	dw Func_9c000  ; CUTSCENE_3F
	dw Func_9c000  ; CUTSCENE_40
	dw Func_9c000  ; CUTSCENE_41
	dw Func_9c000  ; CUTSCENE_42
	dw .Func_9c66e ; CUTSCENE_43
	dw .Func_9c7e8 ; CUTSCENE_44
	dw Func_9c000  ; CUTSCENE_45
	dw Func_9c000  ; CUTSCENE_46
	dw Func_9c000  ; CUTSCENE_47
	dw Func_9c000  ; CUTSCENE_48
	dw .Func_9c593 ; CUTSCENE_49
	dw .Func_9c6e7 ; CUTSCENE_4A
	dw Func_9c000  ; CUTSCENE_4B
	dw .Func_9c700 ; CUTSCENE_4C
	dw Func_9c000  ; CUTSCENE_4D
	dw .Func_9c731 ; CUTSCENE_4E
	dw .Func_9c742 ; CUTSCENE_4F
	dw Func_9c000  ; CUTSCENE_50
	dw .Func_9c760 ; CUTSCENE_51
	dw Func_9c000  ; CUTSCENE_52
	dw Func_9c000  ; CUTSCENE_53
	dw .Func_9c689 ; CUTSCENE_54
	dw .Func_9c7d9 ; CUTSCENE_55
	dw .Func_9c77f ; CUTSCENE_56
	dw .Func_9c796 ; CUTSCENE_57
	dw .Func_9c7a5 ; CUTSCENE_58
	dw Func_9c000  ; CUTSCENE_59
	dw Func_9c000  ; CUTSCENE_5A
	assert_table_length NUM_CUTSCENES

.Func_9c15e:
	farcall _InitPrologueSequence
	ret

.InitCutscene02:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c00)
	ld hl, Pals_b8c00
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca6a
	jp Func_9cba2

.InitCutscene03:
	ld b, BANK(Pals_b8240)
	ld hl, Pals_b8240
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b88c0)
	ld hl, Pals_b88c0
	call LoadFarPalsToTempPals2
	call LoadCutscenes3Gfx
	jp Func_9ca84

.InitCutscene04:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8ec0)
	ld hl, Pals_b8ec0
	call LoadFarPalsToTempPals2
	call LoadCutscenes8Gfx
	call Func_9ca6a
	jp Func_9cba2

.Func_9c1b6:
	call LoadCutscenes3Gfx

	decompress_vram1 BGMap_b956d, v1BGMap0
	decompress_vram0 BGMap_b951f, v0BGMap0

	ld b, BANK(Pals_b8080)
	ld hl, Pals_b8080
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8900)
	ld hl, Pals_b8900
	call LoadFarPalsToTempPals2
	jp Func_9d01a

.Func_9c209:
	call LoadCutscenes1Gfx

	decompress_vram1 BGMap_b9424, v1BGMap0
	decompress_vram0 BGMap_b93c8, v0BGMap0

	ld b, BANK(Pals_b8000)
	ld hl, Pals_b8000
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b89c0)
	ld hl, Pals_b89c0
	call LoadFarPalsToTempPals2
	jp Func_9d158

.Func_9c25c:
	ld hl, Pals_b8ac0
;	fallthrough

.Func_9c25f:
	ld b, BANK(Pals_b8ac0)
	call LoadFarPalsToTempPals2
	ld hl, Pals_b8200
	ld b, BANK(Pals_b8200)
	call LoadFarPalsToTempPals1

	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	call LoadCutscenes2Gfx
	call Func_9ca6a
	jp Func_9cbaf

.Func_9c27a:
	ld hl, Pals_b8b00
	jr .Func_9c25f

.Func_9c27f:
	ld hl, Pals_b8b80
	jr .Func_9c25f

.Func_9c284:
	ld hl, Pals_b8b40
	jr .Func_9c25f

.Func_9c289:
	ld hl, Pals_b8bc0
	jr .Func_9c25f

.Func_9c28e:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a80)
	ld hl, Pals_b8a80
	call LoadFarPalsToTempPals2
	call LoadCutscenes2Gfx
	jp Func_9ca77

.Func_9c2a4:
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a00)
	ld hl, Pals_b8a00
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca77
	jp Func_9d0e6

.Func_9c2bd:
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8d40)
	ld hl, Pals_b8d40
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca77

.Func_9c2d3:
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8dc0)
	ld hl, Pals_b8dc0
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	call Func_9ca6a
	jp Func_9cba2

.Func_9c2ec:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8980)
	ld hl, Pals_b8980
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca77
	jp Func_9cbe3

.Func_9c305:
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c40)
	ld hl, Pals_b8c40
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca77
	jp Func_9cbe3

.Func_9c31e:
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e00)
	ld hl, Pals_b8e00
	call LoadFarPalsToTempPals2
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	call LoadCutscenes4Gfx
	jp Func_9cbbc

.Func_9c339:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a40)
	ld hl, Pals_b8a40
	call LoadFarPalsToTempPals2
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	call LoadCutscenes2Gfx
	call Func_9ca6a
	jp Func_9cbbc

.Func_9c357:
	ld b, BANK(Pals_b81c0)
	ld hl, Pals_b81c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e80)
	ld hl, Pals_b8e80
	call LoadFarPalsToTempPals2
;	fallthrough

.Func_9c367:
	ld a, LCDCF_WINON
	ld [wLCDCFlagsToFlip], a
	ld a, $28
	ldh [rWY], a
	ld [w2d022], a
	ld a, $57
	ldh [rWX], a
	ld [w2d023], a
	call LoadCutscenes2Gfx
	call Func_9cbc9
	call Func_9ca9e
	jp Func_9da0e

.Func_9c386:
	ld b, BANK(Pals_b8140)
	ld hl, Pals_b8140
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8940)
	ld hl, Pals_b8940
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca91

.Func_9c39c:
	call LoadCutscenes4Gfx

	decompress_vram1 OwlGfx, v1Tiles0

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, BANK(LevelMainTiles28)
	ld hl, LevelMainTiles28
	call LoadFarTiles
	xor a
	ldh [rVBK], a

	call Func_9ca77

	decompress_vram1 BGMap_ba64e, v1BGMap1
	decompress_vram0 BGMap_ba5fd, v0BGMap1

	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c80)
	ld hl, Pals_b8c80
	call LoadFarPalsToTempPals2
	jp Func_9cc3c

.Func_9c423:
	ld b, BANK(Pals_b80c0)
	ld hl, Pals_b80c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8cc0)
	ld hl, Pals_b8cc0
	call LoadFarPalsToTempPals2

	call LoadCutscenes3Gfx

	decompress_vram1 BGMap_b9691, v1BGMap0
	decompress_vram0 BGMap_b9635, v0BGMap0

	jp Func_9d536

.Func_9c476:
	call LoadCutscenes3Gfx

	decompress_vram1 BGMap_b97c4, v1BGMap0
	decompress_vram0 BGMap_b9768, v0BGMap0

	jp ClearTempPals_Bank27

.Func_9c4b9:
	ld b, BANK(Pals_b82c0)
	ld hl, Pals_b82c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b82c0)
	ld hl, Pals_b82c0
	call LoadFarPalsToTempPals2
	call LoadCutscenes8Gfx
	call Func_9cb2d
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, BANK(SpecialTiles0)
	ld hl, SpecialTiles0
	call LoadFarTiles
	xor a
	ldh [rVBK], a
	jp Func_9db85

.Func_9c4e1:
	ld b, BANK(LevelMainTiles14)
	ld hl, LevelMainTiles14
	call LoadFarTiles
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, BANK(SpecialTiles1)
	ld hl, SpecialTiles1
	call LoadFarTiles
	xor a
	ldh [rVBK], a

	decompress_vram1 BGMap_b9859, v1BGMap0
	decompress_vram0 BGMap_b9816, v0BGMap0

	ld hl, Pals_cc5c0
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_cc5c0)
	call CopyFarBytes

	decompress_vram1 CartGfx, v0Tiles1

	ld hl, .palette
	ld de, wTempPals2 palette 6
	ld b, 1 palettes
	call CopyHLToDE

	jp Func_9d64b

.palette
	rgb  0, 25,  0
	rgb 31, 31, 25
	rgb  8,  8, 31
	rgb  3,  0,  0

.Func_9c57a:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8d80)
	ld hl, Pals_b8d80
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca6a
	jp Func_9cba2

.Func_9c593:
	ld b, BANK(Pals_b8180)
	ld hl, Pals_b8180
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e40)
	ld hl, Pals_b8e40
	call LoadFarPalsToTempPals2
	jp .Func_9c367

.Func_9c5a6:
	ld b, BANK(Pals_b8280)
	ld hl, Pals_b8280
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8f00)
	ld hl, Pals_b8f00
	call LoadFarPalsToTempPals2
	call Func_9c931
	call Func_9cab8
	call Func_9cc28
	call Func_9cc4f
	jp Func_9dc6a

.Func_9c5c5:
	ld b, BANK(Pals_b8300)
	ld hl, Pals_b8300
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8300)
	ld hl, Pals_b8300
	call LoadFarPalsToTempPals2
	call Func_9c977
	ld b, BANK(LevelMainTiles22)
	ld hl, LevelMainTiles22
	call LoadFarTiles
	jp Func_9cb54

.Func_9c5e3:
	ld b, BANK(Pals_b8240)
	ld hl, Pals_b8240
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8f40)
	ld hl, Pals_b8f40
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca91

.Func_9c5f9:
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8f80)
	ld hl, Pals_b8f80
	call LoadFarPalsToTempPals2
	call Func_9c931
	jp Func_9ca77

.Func_9c60f:
	ld b, BANK(LevelMainTiles7)
	ld hl, LevelMainTiles7
	call LoadFarTiles
	call Func_9c977
	call Func_9cb13
	call ClearTempPals_Bank27
	jp Func_9ded4

.Func_9c623:
	ld b, BANK(Pals_b8380)
	ld hl, Pals_b8380
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8fc0)
	ld hl, Pals_b8fc0
	call LoadFarPalsToTempPals2
	jp Func_9caab

.Func_9c636:
	call ClearTempPals_Bank27
	call Func_9c9a6
	ld b, BANK(LevelMainTiles30)
	ld hl, LevelMainTiles30
	call LoadFarTiles
	call Func_9cb88
	call Func_9cc0a
	jp Func_9e018

.Func_9c64d:
	ld b, BANK(Pals_b84c0)
	ld hl, Pals_b84c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b84c0)
	ld hl, Pals_b84c0
	call LoadFarPalsToTempPals2
	call Func_9c977
	ld b, BANK(LevelMainTiles31)
	ld hl, LevelMainTiles31
	call LoadFarTiles
	call Func_9caf9
	jp Func_9cc24

.Func_9c66e:
	ld b, BANK(Pals_b8440)
	ld hl, Pals_b8440
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8440)
	ld hl, Pals_b8440
	call LoadFarPalsToTempPals2
	ld b, BANK(LevelMainTiles36)
	ld hl, LevelMainTiles36
	call LoadFarTiles
	jp Func_9cadf

.Func_9c689:
	call Func_9c9a6
	ld b, BANK(LevelMainTiles24)
	ld hl, LevelMainTiles24
	call LoadFarTiles
	call Func_9cb7b
	call ClearTempPals_Bank27
	jp Func_9e2b8

.Func_9c69d:
	ld b, BANK(Pals_b8700)
	ld hl, Pals_b8700
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b9000)
	ld hl, Pals_b9000
	call LoadFarPalsToTempPals2
	call Func_9c9cb

	decompress_vram1 ParaGoomGfx, v1Tiles0 tile $40

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, BANK(LevelMainTiles30)
	ld hl, LevelMainTiles30
	call LoadFarTiles
	xor a
	ldh [rVBK], a
	call Func_9cb6e
	jp Func_9cbfd

.Func_9c6e7:
	ld b, BANK(Pals_b83c0)
	ld hl, Pals_b83c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b9040)
	ld hl, Pals_b9040
	call LoadFarPalsToTempPals2
	call Func_9c937
	call Func_9cac5
	jp Func_9e438

.Func_9c700:
	call ClearTempPals_Bank27
	call LoadCutscenes8Gfx

	decompress_vram1 FireGfx, v1Tiles1

	call Func_9ca28
	call Func_9cb61
	jp Func_9e4ae

.Func_9c731:
	call ClearTempPals_Bank27
	call Func_9c84f
	ld b, BANK(LevelMainTiles27)
	ld hl, LevelMainTiles27
	call LoadFarTiles
	jp Func_9cb47

.Func_9c742:
	ld b, BANK(Pals_b8480)
	ld hl, Pals_b8480
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8480)
	ld hl, Pals_b8480
	call LoadFarPalsToTempPals2
	ld b, BANK(LevelMainTiles23)
	ld hl, LevelMainTiles23
	call LoadFarTiles
	call Func_9caec
	jp Func_9e5a1

.Func_9c760:
	ld b, BANK(Pals_b8400)
	ld hl, Pals_b8400
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8400)
	ld hl, Pals_b8400
	call LoadFarPalsToTempPals2
	call Func_9c931
	call Func_9cad2
	call Func_9cbd6
	call Func_9cc28
	jp Func_9e655

.Func_9c77f:
	call ClearTempPals_Bank27
	ld b, BANK(LevelMainTiles11)
	ld hl, LevelMainTiles11
	call LoadFarTiles
	call Func_9c97d
	call Func_9cb06
	call Func_9cbf0
	jp Func_9e6ef

.Func_9c796:
	call ClearTempPals_Bank27
	call Func_9c937
	call Func_9cb3a
	call Func_9cc28
	jp Func_9e79a

.Func_9c7a5:
	call ClearTempPals_Bank27
	call Func_9c9cb

	decompress_vram1 WallCrackGfx, v1Tiles1

	call Func_9ca28
	call Func_9cb95
	call Func_9cc17
	jp Func_9e855

.Func_9c7d9:
	call ClearTempPals_Bank27
	call Func_9ca38
	call Func_9c90c
	call Func_9cb20
	jp Func_9e91a

.Func_9c7e8:
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b90c0)
	ld hl, Pals_b90c0
	call LoadFarPalsToTempPals2
	call Func_9c931

	decompress_vram1 OctohonGfx, v1Tiles1 tile $40

	call Func_9ca6a
	call Func_9cbaf
	call Func_9cc3c
	call Func_9cc28
	call Func_9cc4f
	ret

LoadCutscenes1Gfx:
	decompress_vram0 Cutscenes1Gfx, v0Tiles0
	jr LoadCutscenes5Gfx

Func_9c84f:
	decompress_vram1 Cutscenes1Gfx, v1Tiles0
	jr Func_9c8e9

LoadCutscenes2Gfx:
	decompress_vram0 Cutscenes2Gfx, v0Tiles0
	jp LoadCutscenes5Gfx ; can be jr

LoadCutscenes3Gfx:
	decompress_vram0 Cutscenes3Gfx, v0Tiles0
	jp LoadCutscenes5Gfx ; can be jr

LoadCutscenes4Gfx:
	decompress_vram0 Cutscenes4Gfx, v0Tiles0
	jp LoadCutscenes5Gfx ; unnecessary jump

LoadCutscenes5Gfx:
	decompress_vram0 Cutscenes5Gfx, v0Tiles2
	ret

Func_9c8e9:
	decompress_vram1 Cutscenes5Gfx, v1Tiles2
	ret

Func_9c90c:
	decompress_vram1 Cutscenes7Gfx, v1Tiles0
	jp Func_9c8e9

Func_9c931:
	call Func_9c93d
	jp LoadCutscenes5Gfx

Func_9c937:
	call Func_9c93d
	jp Func_9ca0c

Func_9c93d:
	decompress_vram0 Cutscenes7Gfx, v0Tiles0
	ret

LoadCutscenes8Gfx:
	decompress_vram0 Cutscenes8Gfx, v0Tiles0
	jp LoadCutscenes5Gfx

Func_9c977:
	call Func_9c983
	jp Func_9c8e9

Func_9c97d:
	call Func_9c983
	jp Func_9c9e9

Func_9c983:
	decompress_vram1 Cutscenes8Gfx, v1Tiles0
	ret

Func_9c9a6:
	decompress_vram1 Cutscenes9Gfx, v1Tiles0
	jp Func_9c9e9

Func_9c9cb:
	decompress_vram0 Cutscenes9Gfx, v0Tiles0
	jp Func_9ca0c

Func_9c9e9:
	decompress_vram1 Cutscenes10Gfx, v1Tiles2
	ret

Func_9ca0c:
	decompress_vram0 Cutscenes10Gfx, v0Tiles2
	ret

Func_9ca28:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, BANK(LevelMainTiles29)
	ld hl, LevelMainTiles29
	call LoadFarTiles
	xor a
	ldh [rVBK], a
	ret

Func_9ca38:
	ld b, BANK(LevelMainTiles29)
	ld hl, LevelMainTiles29
	call LoadFarTiles
	ret

LoadCutsceneAttrmap0:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
;	fallthrough
LoadCutsceneTilemap0:
	ld bc, v0BGMap0
;	fallthrough

LoadCutsceneBGMap:
	ld a, $2e
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	ret

LoadCutsceneAttrmap1:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
;	fallthrough
LoadCutsceneTilemap1:
	ld bc, v0BGMap1
	jr LoadCutsceneBGMap

Func_9ca6a:
	ld hl, BGMap_b9113
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9100
	call LoadCutsceneTilemap0
	ret

Func_9ca77:
	ld hl, BGMap_b9235
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b91e7
	call LoadCutsceneTilemap0
	ret

Func_9ca84:
	ld hl, BGMap_b94d1
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9475
	call LoadCutsceneTilemap0
	ret

Func_9ca91:
	ld hl, BGMap_b98d7
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b989c
	call LoadCutsceneTilemap0
	ret

Func_9ca9e:
	ld hl, BGMap_b996e
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9920
	call LoadCutsceneTilemap0
	ret

Func_9caab:
	ld hl, BGMap_b9a8c
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9a22
	call LoadCutsceneTilemap0
	ret

Func_9cab8:
	ld hl, BGMap_b9b2d
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9ae0
	call LoadCutsceneTilemap0
	ret

Func_9cac5:
	ld hl, BGMap_b9be0
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9b84
	call LoadCutsceneTilemap0
	ret

Func_9cad2:
	ld hl, BGMap_b9c75
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9c2c
	call LoadCutsceneTilemap0
	ret

Func_9cadf:
	ld hl, BGMap_b9da3
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9d48
	call LoadCutsceneTilemap0
	ret

Func_9caec:
	ld hl, BGMap_b9ed5
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9e7b
	call LoadCutsceneTilemap0
	ret

Func_9caf9:
	ld hl, BGMap_b9f73
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9f1e
	call LoadCutsceneTilemap0
	ret

Func_9cb06:
	ld hl, BGMap_b9fe6
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9fb1
	call LoadCutsceneTilemap0
	ret

Func_9cb13:
	ld hl, BGMap_ba0e6
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba0b4
	call LoadCutsceneTilemap0
	ret

Func_9cb20:
	ld hl, BGMap_ba19c
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba143
	call LoadCutsceneTilemap0
	ret

Func_9cb2d:
	ld hl, BGMap_ba286
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba221
	call LoadCutsceneTilemap0
	ret

Func_9cb3a:
	ld hl, BGMap_ba37b
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba31f
	call LoadCutsceneTilemap0
	ret

Func_9cb47:
	ld hl, BGMap_ba425
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba3d3
	call LoadCutsceneTilemap0
	ret

Func_9cb54:
	ld hl, BGMap_ba4c4
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba46a
	call LoadCutsceneTilemap0
	ret

Func_9cb61:
	ld hl, BGMap_ba5a0
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba544
	call LoadCutsceneTilemap0
	ret

Func_9cb6e:
	ld hl, BGMap_ba6e1
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba685
	call LoadCutsceneTilemap0
	ret

Func_9cb7b:
	ld hl, BGMap_ba82d
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba7f9
	call LoadCutsceneTilemap0
	ret

Func_9cb88:
	ld hl, BGMap_ba8a6
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba865
	call LoadCutsceneTilemap0
	ret

Func_9cb95:
	ld hl, BGMap_ba9b4
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba958
	call LoadCutsceneTilemap0
	ret

Func_9cba2:
	ld hl, BGMap_b919b
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b914a
	call LoadCutsceneTilemap1
	ret

Func_9cbaf:
	ld hl, BGMap_b92c2
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b926d
	call LoadCutsceneTilemap1
	ret

Func_9cbbc:
	ld hl, BGMap_b936c
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9310
	call LoadCutsceneTilemap1
	ret

Func_9cbc9:
	ld hl, BGMap_b99e8
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b99aa
	call LoadCutsceneTilemap1
	ret

Func_9cbd6:
	ld hl, BGMap_b9d01
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9cb8
	call LoadCutsceneTilemap1
	ret

Func_9cbe3:
	ld hl, BGMap_b9e3b
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9dea
	call LoadCutsceneTilemap1
	ret

Func_9cbf0:
	ld hl, BGMap_ba07d
	call LoadCutsceneAttrmap1
	ld hl, BGMap_ba02a
	call LoadCutsceneTilemap1
	ret

Func_9cbfd:
	ld hl, BGMap_ba79c
	call LoadCutsceneAttrmap1
	ld hl, BGMap_ba740
	call LoadCutsceneTilemap1
	ret

Func_9cc0a:
	ld hl, BGMap_ba925
	call LoadCutsceneAttrmap1
	ld hl, BGMap_ba8d2
	call LoadCutsceneTilemap1
	ret

Func_9cc17:
	ld hl, BGMap_baa6e
	call LoadCutsceneAttrmap1
	ld hl, BGMap_baa12
	call LoadCutsceneTilemap1
	ret

Func_9cc24:
	ld d, $88
	jr Func_9cc2a

Func_9cc28:
	ld d, $80
;	fallthrough
Func_9cc2a:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0
	ld bc, 5 * BG_MAP_WIDTH
	ld a, d
	call WriteAToHL_BCTimes
	xor a
	ldh [rVBK], a
	ret

Func_9cc3c:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap1
	ld bc, 5 * BG_MAP_WIDTH
	ld a, $80
	call WriteAToHL_BCTimes
	xor a
	ldh [rVBK], a
	ret

Func_9cc4f:
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld d, $80
	hlbgcoord 0, 5
	ld e, 7
.loop_outer
	ld b, 6
	ld a, d
.loop_inner
	ld [hli], a
	dec b
	jr nz, .loop_inner
	dec e
	jr z, .done
	ld a, BG_MAP_WIDTH - 6
	add l
	ld l, a
	ld a, $00
	adc h
	ld h, a
	jr .loop_outer
.done
	xor a
	ldh [rVBK], a
	ret

ClearTempPals_Bank27:
	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	ret

Func_9cc87:
	xor a
	ld hl, wTempBGPals
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempOBPals
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	ret

VBlank_9cc9c:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, [w2d022]
	ldh [rWY], a
	ld a, [w2d023]
	ldh [rWX], a

	ld a, [wLCDCFlagsToFlip]
	and a
	jr z, .asm_9cccf
	ld hl, rLCDC
	xor [hl]
	ld [hl], a
	xor a
	ld [wLCDCFlagsToFlip], a

.asm_9cccf
	ld b, BANK(ApplyPalConfig1)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [wPalConfig1Register]
	and a
	call nz, ApplyPalConfig1
	ld a, [wPalConfig2]
	and a
	call nz, ApplyPalConfig2
	pop af
	bankswitch

	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

; a = state
; d = y coord
; e = x coord
Func_9ccf9:
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	set 2, l
	call SetSceneObjState
	ret

AdvanceCutsceneFunc:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret

WaitCutsceneFunc:
	ld a, [w2d014]
	cp c
	ret c
	jr AdvanceCutsceneFunc

StartCutsceneDelay:
	ld c, 30
	jp WaitCutsceneFunc

Func_9cd16:
	ld hl, wSubState
	inc [hl]
	stop_sfx
	ret

EndCutsceneDelay_20Frames:
	ld e, 20
;	fallthrough
EndCutscene:
	ld a, [w2d014]
	cp e
	ret c
	jr Func_9cd16

EndCutsceneDelay_40Frames:
	ld e, 40
	jr EndCutscene

EndCutsceneDelay_60Frames:
	ld e, 60
	jr EndCutscene

EndCutsceneDelay_80Frames:
	ld e, 80
	jr EndCutscene

EndCutsceneDelay_100Frames:
	ld e, 100
	jr EndCutscene

EndCutsceneDelay_120Frames:
	ld e, 120
	jr EndCutscene

Func_9cd40:
	ld a, HIGH(wTempPals1)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals1)
	ld [wPalConfig1SourceLo], a
	ld a, BCPSF_AUTOINC | palette 0
	ld [wPalConfig1Index], a
	ld a, 8
	ld [wPalConfig1Number], a
	ld a, LOW(rBCPS)
	ld [wPalConfig1Register], a
	ret

Func_9cd5a:
	ld a, HIGH(wTempPals2)
	ld [wPalConfig2SourceHi], a
	ld a, LOW(wTempPals2)
	ld [wPalConfig2SourceLo], a
	ld a, OCPSF_AUTOINC | palette 0
	ld [wPalConfig2Index], a
	ld a, 8
	ld [wPalConfig2Number], a
	ld a, LOW(rOCPS)
	ld [wPalConfig2Register], a
	ret

Func_9cd74:
	push hl
	ld hl, wTempPals2
	ld de, wTempOBPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, wTempPals1
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE
	pop hl
	ret

Func_9cd8d:
	farcall Func_85046
	ret

Func_9cd9d:
	farcall Func_850b9
	ret

Func_9cdad:
	farcall Func_850ff
	ret

Func_9cdbd:
	farcall Func_84fff
	ret

Func_9cdcd:
	ld hl, wCollectionScrollMode
	inc [hl]
	ld a, [wCollectionLinkStateCounter]
	ld c, $fc
	and a
	jr z, .asm_9cdfb
	ld c, $04
	dec a
	jr z, .asm_9cdfb
	ld c, $fd
	dec a
	jr z, .asm_9cdfb
	ld c, $03
	dec a
	jr z, .asm_9cdfb
	ld c, $fe
	dec a
	jr z, .asm_9cdfb
	ld c, $02
	dec a
	jr z, .asm_9cdfb
	ld c, $ff
	dec a
	jr z, .asm_9cdfb
	ld c, $01
	jr .asm_9ce0c
.asm_9cdfb
	ld a, [hl]
	cp $06
	ret c
	ld hl, wSCY
	ld a, c
	add [hl]
	ld [hl], a
	ld hl, wCollectionScrollMode
	xor a
	ld [hld], a
	inc [hl]
	ret
.asm_9ce0c
	ld a, [hl]
	cp $06
	ret c
	ld hl, wSCY
	ld a, c
	add [hl]
	ld [hl], a
	ld hl, wCollectionScrollMode
	xor a
	ld [hld], a
	ld [hl], a
	jp AdvanceCutsceneFunc

Func_9ce1f:
	play_sfx SFX_112
	ret

Func_9ce28:
	call ProcessDPadRepeat
	ld hl, w2d014
	inc [hl]
	ld b, h
	ld c, l

	ld a, [w2d01e]
	cp NUM_CUTSCENES
	jp nc, .OutOfBoundsCutscene
	jumptable

.table
	table_width 2
	dw .InvalidCutscene ; CUTSCENE_00
	dw Cutscene01Func ; CUTSCENE_01
	dw Cutscene02Func ; CUTSCENE_02
	dw Cutscene03Func ; CUTSCENE_03
	dw Cutscene04Func ; CUTSCENE_04
	dw .InvalidCutscene ; CUTSCENE_05
	dw Cutscene06Func ; CUTSCENE_06
	dw Cutscene07Func ; CUTSCENE_07
	dw Cutscene08Func ; CUTSCENE_08
	dw Cutscene09Func ; CUTSCENE_09
	dw Cutscene0aFunc ; CUTSCENE_0A
	dw .InvalidCutscene ; CUTSCENE_0B
	dw Cutscene0cFunc ; CUTSCENE_0C
	dw Cutscene0dFunc ; CUTSCENE_0D
	dw Cutscene0eFunc ; CUTSCENE_0E
	dw .InvalidCutscene ; CUTSCENE_0F
	dw Cutscene10Func ; CUTSCENE_10
	dw Cutscene11Func ; CUTSCENE_11
	dw .InvalidCutscene ; CUTSCENE_12
	dw Cutscene13Func ; CUTSCENE_13
	dw Cutscene14Func ; CUTSCENE_14
	dw Cutscene15Func ; CUTSCENE_15
	dw .InvalidCutscene ; CUTSCENE_16
	dw Cutscene17Func ; CUTSCENE_17
	dw Cutscene18Func ; CUTSCENE_18
	dw Cutscene19Func ; CUTSCENE_19
	dw .InvalidCutscene ; CUTSCENE_1A
	dw Cutscene1bFunc ; CUTSCENE_1B
	dw .InvalidCutscene ; CUTSCENE_1C
	dw Cutscene1dFunc ; CUTSCENE_1D
	dw Cutscene1eFunc ; CUTSCENE_1E
	dw Cutscene1fFunc ; CUTSCENE_1F
	dw .InvalidCutscene ; CUTSCENE_20
	dw Cutscene21Func ; CUTSCENE_21
	dw Cutscene22Func ; CUTSCENE_22
	dw .InvalidCutscene ; CUTSCENE_23
	dw Cutscene24Func ; CUTSCENE_24
	dw Cutscene25Func ; CUTSCENE_25
	dw .InvalidCutscene ; CUTSCENE_26
	dw Cutscene27Func ; CUTSCENE_27
	dw .InvalidCutscene ; CUTSCENE_28
	dw .InvalidCutscene ; CUTSCENE_29
	dw .InvalidCutscene ; CUTSCENE_2A
	dw .InvalidCutscene ; CUTSCENE_2B
	dw .InvalidCutscene ; CUTSCENE_2C
	dw .InvalidCutscene ; CUTSCENE_2D
	dw .InvalidCutscene ; CUTSCENE_2E
	dw .InvalidCutscene ; CUTSCENE_2F
	dw Cutscene30Func ; CUTSCENE_30
	dw .InvalidCutscene ; CUTSCENE_31
	dw .InvalidCutscene ; CUTSCENE_32
	dw .InvalidCutscene ; CUTSCENE_33
	dw .InvalidCutscene ; CUTSCENE_34
	dw .InvalidCutscene ; CUTSCENE_35
	dw .InvalidCutscene ; CUTSCENE_36
	dw Cutscene37Func ; CUTSCENE_37
	dw Cutscene38Func ; CUTSCENE_38
	dw Cutscene39Func ; CUTSCENE_39
	dw Cutscene3aFunc ; CUTSCENE_3A
	dw .InvalidCutscene ; CUTSCENE_3B
	dw Cutscene3cFunc ; CUTSCENE_3C
	dw Cutscene3dFunc ; CUTSCENE_3D
	dw .InvalidCutscene ; CUTSCENE_3E
	dw .InvalidCutscene ; CUTSCENE_3F
	dw .InvalidCutscene ; CUTSCENE_40
	dw .InvalidCutscene ; CUTSCENE_41
	dw .InvalidCutscene ; CUTSCENE_42
	dw Cutscene43Func ; CUTSCENE_43
	dw Cutscene44Func ; CUTSCENE_44
	dw .InvalidCutscene ; CUTSCENE_45
	dw .InvalidCutscene ; CUTSCENE_46
	dw .InvalidCutscene ; CUTSCENE_47
	dw .InvalidCutscene ; CUTSCENE_48
	dw Cutscene49Func ; CUTSCENE_49
	dw Cutscene4aFunc ; CUTSCENE_4A
	dw .InvalidCutscene ; CUTSCENE_4B
	dw Cutscene4cFunc ; CUTSCENE_4C
	dw .InvalidCutscene ; CUTSCENE_4D
	dw Cutscene4eFunc ; CUTSCENE_4E
	dw Cutscene4fFunc ; CUTSCENE_4F
	dw .InvalidCutscene ; CUTSCENE_50
	dw Cutscene51Func ; CUTSCENE_51
	dw .InvalidCutscene ; CUTSCENE_52
	dw .InvalidCutscene ; CUTSCENE_53
	dw Cutscene54Func ; CUTSCENE_54
	dw Cutscene55Func ; CUTSCENE_55
	dw Cutscene56Func ; CUTSCENE_56
	dw Cutscene57Func ; CUTSCENE_57
	dw Cutscene58Func ; CUTSCENE_58
	dw .InvalidCutscene ; CUTSCENE_59
	dw .InvalidCutscene ; CUTSCENE_5A
	assert_table_length NUM_CUTSCENES

.OutOfBoundsCutscene
	debug_nop

.InvalidCutscene
	debug_nop

Cutscene01Func:
	farcall Func_adfa3
	ret

Cutscene03Func:
	call .Func_9cf0c
	jp Func_9f0e0

.Func_9cf0c:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9cf36
	dw .Func_9cf59
	dw .Func_9cf6c
	dw .Func_9cf71
	dw .Func_9cf8d
	dw .Func_9cf92
	dw .Func_9cfad
	dw .Func_9cfb5
	dw .Func_9cfba
	dw .Func_9cfc9
	dw .Func_9cfce
	dw .Func_9cfe5
	dw .Func_9cfea
	dw .Func_9d001
	dw .Func_9d00a
	dw .Func_9d015
	dw Func_9cd8d
	dw EndCutsceneDelay_40Frames

.Func_9cf36
	ld hl, wSceneObj2
	ld a, $3b
	ld [hli], a
	ld [hl], $28
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj3
	ld a, $3b
	ld [hli], a
	ld [hl], $78
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9cf59
	ld a, [bc]
	bit 0, a
	ret nz
	ld hl, wSceneObj3XCoord
	dec [hl]
	ld hl, wSceneObj2XCoord
	inc [hl]
	ld a, [hl]
	cp $4f
	ret nz
	jp AdvanceCutsceneFunc

.Func_9cf6c
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9cf71
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $50
	ld [wSceneObj2XCoord], a
	xor a
	ld [wSceneObj3State], a
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9cf8d
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9cf92
	ld hl, wSceneObj3YCoord
	ld a, $3b
	ld [hli], a
	ld [hl], $50
	ld a, $05
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_106
	jp AdvanceCutsceneFunc

.Func_9cfad
	ld a, [wSceneObj3State]
	and a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9cfb5
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9cfba
	ld a, [bc]
	bit 0, a
	ret z
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $54
	ret nz
	jp AdvanceCutsceneFunc

.Func_9cfc9
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9cfce
	ld a, $04
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj2XCoord
	inc [hl]
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9cfe5
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9cfea
	ld a, [wSceneObj2YCoord]
	ld [wSceneObj3YCoord], a
	ld a, [wSceneObj2XCoord]
	ld [wSceneObj3XCoord], a
	ld a, $06
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d001
	ld a, [wSceneObj3State]
	cp $07
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d00a
	play_sfx SFX_10C
	jp AdvanceCutsceneFunc

.Func_9d015
	ld c, $1e
	jp WaitCutsceneFunc

Func_9d01a:
	ld hl, wSceneObj2
	ld a, $48
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_9f11e

Cutscene06Func:
	call .Func_9d033
	jp Func_9f11e

.Func_9d033:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d04b
	dw .Func_9d071
	dw .Func_9d076
	dw .Func_9d071
	dw .Func_9d09c
	dw .Func_9d0af
	dw .Func_9d0bc
	dw .Func_9d0c1
	dw EndCutsceneDelay_40Frames

.Func_9d04b:
	ld a, [bc]
	cp $01
	jr z, .asm_9d068
	ld b, a
	and $03
	ret nz
	ld a, $ff
	bit 2, b
	jr nz, .asm_9d05c
	ld a, $01
.asm_9d05c
	ld hl, wSceneObj2YCoord
	add [hl]
	ld [hl], a
	ld a, b
	cp $20
	ret c
	jp AdvanceCutsceneFunc
.asm_9d068
	play_sfx SFX_102
	ret

.Func_9d071:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d076:
	ld a, [bc]
	cp $01
	jr z, .asm_9d093
	ld b, $ff
	cp $08
	jr c, .asm_9d087
	dec b
	cp $10
	jr c, .asm_9d087
	dec b
.asm_9d087
	ld a, b
	ld hl, wSceneObj2YCoord
	add [hl]
	ld [hl], a
	cp $20
	ret nc
	jp AdvanceCutsceneFunc
.asm_9d093
	play_sfx SFX_TEMPLE_ROCK
	ret

.Func_9d09c:
	ld hl, wSceneObj2YCoord
	ld a, $40
	ld [hli], a
	ld [hl], $50
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d0af:
	ld a, [wSceneObj2State]
	cp $03
	ret nz
	xor a
	ld [wColourFadeDiff], a
	jp AdvanceCutsceneFunc

.Func_9d0bc:
	ld c, $64
	jp WaitCutsceneFunc

.Func_9d0c1:
	call .Func_9d0d3
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $28
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d0d3:
	ld hl, wColourFadeDiff
	inc [hl]
	ld a, [hl]
	cp $0e
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_023
	ret

Func_9d0e6:
	ld a, $03
	ld [wSceneObj1YCoord], a
	ld hl, wSceneObj2
	ld a, $82
	ld [hli], a
	ld [hl], $71
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj3
	ld a, $82
	ld [hli], a
	ld [hl], $2f
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp Func_9f146

Cutscene0aFunc:
	call .Func_9d114
	jp Func_9f146

.Func_9d114:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d126
	dw .Func_9d140
	dw .Func_9d145
	dw .Func_9d153
	dw Func_9cd8d
	dw EndCutsceneDelay_20Frames

.Func_9d126:
	ld a, [bc]
	bit 0, a
	ret z
	call .Func_9d133
	cp $63
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d133:
	ld hl, wSceneObj2YCoord
	ld a, [hl]
	dec a
	ld [hli], a
	dec [hl]
	ld hl, wSceneObj3YCoord
	ld [hli], a
	inc [hl]
	ret

.Func_9d140:
	ld c, $32
	jp WaitCutsceneFunc

.Func_9d145:
	call .Func_9d133
	play_sfx SFX_106
	jp AdvanceCutsceneFunc
.Func_9d153:
	ld c, $1e
	jp WaitCutsceneFunc

Func_9d158:
	ld hl, wSceneObj2
	ld a, $58
	ld [hli], a
	ld [hl], $54
	ld a, $09
	ld hl, wSceneObj2State
	call SetSceneObjState

	ld hl, wSceneObj3
	ld a, $43
	ld [hli], a
	ld [hl], $40
	ld a, $03
	ld hl, wSceneObj3State
	call SetSceneObjState

	ld hl, wSceneObj4
	ld a, $58
	ld [hli], a
	ld [hl], $54
	ld a, $0a
	ld hl, wSceneObj4State
	call SetSceneObjState
	jp Func_9f174

Cutscene07Func:
	call .Func_9d191
	jp Func_9f174

.Func_9d191:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d1c5
	dw .Func_9d1e4
	dw .Func_9d1e9
	dw .Func_9d1fc
	dw .Func_9d201
	dw .Func_9d20c
	dw .Func_9d211
	dw .Func_9d21c
	dw .Func_9d22c
	dw .Func_9d21c
	dw .Func_9d22c
	dw .Func_9d21c
	dw .Func_9d22c
	dw .Func_9d21c
	dw .Func_9d234
	dw .Func_9d239
	dw .Func_9d244
	dw .Func_9d249
	dw .Func_9d25c
	dw .Func_9d264
	dw .Func_9d269
	dw .Func_9d274
	dw EndCutsceneDelay_60Frames

.Func_9d1c5:
	ld a, [bc]
	cp $14
	ret c
	ld hl, wSceneObj5
	ld a, $5a
	ld [hli], a
	ld [hl], $38
	ld a, $01
	ld hl, wSceneObj5State
	call SetSceneObjState
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9d1e4:
	ld c, $32
	jp WaitCutsceneFunc

.Func_9d1e9:
	ld a, $02
	ld hl, wSceneObj5State
	call SetSceneObjState
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9d1fc:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d201:
	ld a, $04
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d20c:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9d211:
	ld a, $06
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d21c:
	ld a, [wSceneObj2Frame]
	and a
	ret nz
	play_sfx SFX_109
	jp AdvanceCutsceneFunc

.Func_9d22c:
	ld a, [wSceneObj2Frame]
	and a
	ret z
	jp AdvanceCutsceneFunc

.Func_9d234:
	ld c, $32
	jp WaitCutsceneFunc

.Func_9d239:
	ld a, $05
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d244:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9d249:
	ld a, $08
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_035
	jp AdvanceCutsceneFunc

.Func_9d25c:
	ld a, [wSceneObj4State]
	and a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d264:
	ld c, $32
	jp WaitCutsceneFunc

.Func_9d269:
	play_sfx SFX_10B
	jp AdvanceCutsceneFunc

.Func_9d274:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $18
	ret nc
	jp AdvanceCutsceneFunc

Cutscene19Func:
	call .Func_9d285
	jp Func_9f1d8

.Func_9d285:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d2a9
	dw .Func_9d2bc
	dw .Func_9d2cc
	dw .Func_9d2d1
	dw .Func_9d2e4
	dw .Func_9d2e9
	dw .Func_9d2fa
	dw .Func_9d2ff
	dw .Func_9d326
	dw .Func_9d32b
	dw .Func_9d326
	dw .Func_9d330
	dw .Func_9d326
	dw .Func_9d335
	dw EndCutsceneDelay_60Frames

.Func_9d2a9:
	ld hl, wSceneObj2YCoord
	ld a, SCREEN_HEIGHT_PX
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d2bc:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $86
	jp z, Func_9ce1f
	cp $60
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d2cc:
	ld c, $5a
	jp WaitCutsceneFunc

.Func_9d2d1:
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_073
	jp AdvanceCutsceneFunc

.Func_9d2e4:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d2e9:
	ld a, [wSceneObj2Frame]
	cp $04
	ret nz
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d2fa:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9d2ff:
	ld hl, Pals_9fc8b
.asm_9d302
	ld de, wTempPals1 palette 2
	ld b, 1 palettes
	call CopyHLToDE
	ld a, HIGH(wTempPals1 palette 2)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals1 palette 2)
	ld [wPalConfig1SourceLo], a
	ld a, BCPSF_AUTOINC | palette 2
	ld [wPalConfig1Index], a
	ld a, 1
	ld [wPalConfig1Number], a
	ld a, LOW(rBCPS)
	ld [wPalConfig1Register], a
	jp AdvanceCutsceneFunc

.Func_9d326:
	ld c, $08
	jp WaitCutsceneFunc

.Func_9d32b:
	ld hl, Pals_9fc93
	jr .asm_9d302

.Func_9d330:
	ld hl, Pals_9fc9b
	jr .asm_9d302

.Func_9d335:
	ld hl, Pals_9fca3
	jr .asm_9d302

Cutscene0eFunc:
Cutscene11Func:
	call .Func_9d340
	jp Func_9f1f3

.Func_9d340:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d36a
	dw .Func_9d37a
	dw .Func_9d392
	dw .Func_9d3a2
	dw .Func_9d3a7
	dw .Func_9d3dc
	dw .Func_9d3e1
	dw .Func_9d3f9
	dw EndCutsceneDelay_60Frames

	dw .Func_9d37a
	dw .Func_9d392
	dw .Func_9d3a2
	dw .Func_9d409
	dw .Func_9d3dc
	dw .Func_9d40e
	dw .Func_9d413
	dw .Func_9d426
	dw EndCutsceneDelay_60Frames

.Func_9d36a:
	ld a, [w2d01e]
	cp $11
	jp nz, AdvanceCutsceneFunc
	ld a, $09
	ld [w2d013], a
	jp AdvanceCutsceneFunc

.Func_9d37a:
	ld hl, wSceneObj2YCoord
	ld a, $ac
	ld [hli], a
	ld [hl], $58
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $01
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d392:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $92
	jp z, Func_9ce1f
	cp $6c
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d3a2:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9d3a7:
	ld hl, Pals_b8040
.asm_9d3aa
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_b8040) ; aka BANK(Pals_b8200)
	call CopyFarBytes
	xor a
	ld [wSceneObj1YCoord], a
	ld [wSceneObj2State], a
	ld a, $08
	ld [wCollectionRow], a

	ld a, HIGH(wTempPals1)
	ld [wPalConfig1SourceHi], a
	ld a, LOW(wTempPals1)
	ld [wPalConfig1SourceLo], a
	ld a, BCPSF_AUTOINC | palette 0
	ld [wPalConfig1Index], a
	ld a, 8
	ld [wPalConfig1Number], a
	ld a, LOW(rBCPS)
	ld [wPalConfig1Register], a
	jp AdvanceCutsceneFunc

.Func_9d3dc:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d3e1:
	ld hl, wSceneObj2YCoord
	ld a, $b0
	ld [hli], a
	ld [hl], $32
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d3f9:
	ld hl, wSceneObj2YCoord
	dec [hl]
	dec [hl]
	ld a, [hl]
	cp $74
	jr z, .asm_9d438
	cp $68
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d409:
	ld hl, Pals_b8200
	jr .asm_9d3aa

.Func_9d40e:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d413:
	ld hl, wSceneObj2YCoord
	ld a, $a4
	ld [hli], a
	ld [hl], $f0
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d426:
	ld hl, wSceneObj2YCoord
	dec [hl]
	dec [hl]
	ld a, [hli]
	inc [hl]
	inc [hl]
	cp $70
	jr z, .asm_9d438
	cp $64
	ret nz
	jp AdvanceCutsceneFunc

.asm_9d438
	play_sfx SFX_113
	ret

Cutscene1bFunc:
	call .Func_9d44a
	call Func_9f225
	jp Func_9f244

.Func_9d44a:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d46c
	dw .Func_9d48f
	dw .Func_9d4ae
	dw Func_9cd9d
	dw .Func_9d4b3
	dw Func_9cdad
	dw .Func_9d4b8
	dw .Func_9d4bd
	dw .Func_9d4ec
	dw .Func_9d4ff
	dw .Func_9d504
	dw .Func_9d51d
	dw .Func_9d531
	dw EndCutsceneDelay_120Frames

.Func_9d46c:
	ld hl, wSceneObj2YCoord
	ld a, $32
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj3YCoord
	ld a, $82
	ld [hli], a
	ld [hl], $50
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d48f:
	ld a, [bc]
	bit 0, a
	ret z
	call .Func_9d4a4
	cp $5a
	ret nz
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9d4a4:
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	ld hl, wSceneObj3YCoord
	dec [hl]
	ret

.Func_9d4ae:
	ld c, $5a
	jp WaitCutsceneFunc

.Func_9d4b3:
	ld c, $08
	jp WaitCutsceneFunc

.Func_9d4b8:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9d4bd:
	xor a
	ld [wSceneObj2State], a
	ld [wSceneObj3State], a

	ld b, BANK(Pals_b8340)
	ld c, 8 palettes
	ld hl, Pals_b8340
	ld de, wTempPals1
	call CopyFarBytes
	call Func_9cd40

	ld b, BANK(Pals_b8340)
	ld c, 8 palettes
	ld hl, Pals_b8340
	ld de, wTempPals2
	call CopyFarBytes
	call Func_9cd5a

	ld a, $08
	ld [wCollectionRow], a
	jp AdvanceCutsceneFunc

.Func_9d4ec:
	ld hl, wSceneObj5
	ld a, $20
	ld [hli], a
	ld [hl], $50
	ld a, $02
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d4ff:
	ld c, $14
	jp WaitCutsceneFunc

.Func_9d504:
	ld b, $03
	ld hl, wSceneObj5
	ld a, [hl]
	cp $44
	jr c, .asm_9d510
	ld b, $07
.asm_9d510
	ld a, [w2d014]
	and b
	ret nz
	inc [hl]
	ld a, [hl]
	cp $4e
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d51d:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $01
	ld hl, wSceneObj5State
	call SetSceneObjState
	ld hl, wSceneObj5
	add [hl]
	ld [hl], a
	jp AdvanceCutsceneFunc

.Func_9d531:
	ld c, $64
	jp WaitCutsceneFunc

Func_9d536:
	ld hl, wSceneObj2
	ld a, $53
	ld [hli], a
	ld [hl], $50
	ld a, $04
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj3YCoord
	ld a, $36
	ld [hli], a
	ld [hl], $50
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	ld hl, wSceneObj4YCoord
	ld a, $53
	ld [hli], a
	ld [hl], $50
	ld a, $03
	ld hl, wSceneObj4State
	call SetSceneObjState
	jp Func_9f2a2

Cutscene1eFunc:
	call .Func_9d56f
	jp Func_9f2a2

.Func_9d56f:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d589
	dw .Func_9d58e
	dw .Func_9d5a1
	dw .Func_9d5a6
	dw .Func_9d5b9
	dw .Func_9d5be
	dw .Func_9d5c7
	dw .Func_9d5d2
	dw Func_9cd8d
	dw Func_9cd16

.Func_9d589:
	ld c, $0f
	jp WaitCutsceneFunc

.Func_9d58e:
	ld hl, wSceneObj3YCoord
	inc [hl]
	ld a, [hl]
	cp $3b
	ret nz
	play_sfx SFX_SWITCH
	jp AdvanceCutsceneFunc

.Func_9d5a1:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9d5a6:
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_10E
	jp AdvanceCutsceneFunc

.Func_9d5b9:
	ld c, $46
	jp WaitCutsceneFunc

.Func_9d5be:
	ld a, [wSceneObj2Frame]
	cp $03
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d5c7:
	ld a, $05
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d5d2:
	ld c, $1e
	jp WaitCutsceneFunc

Cutscene22Func:
	call .Func_9d5dd
	jp Func_9f2cd

.Func_9d5dd:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d5f1
	dw Func_9cdbd
	dw .Func_9d611
	dw .Func_9d616
	dw .Func_9d631
	dw .Func_9d642
	dw EndCutsceneDelay_20Frames

.Func_9d5f1:
	ld hl, Pals_b8100
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_b8100)
	call CopyFarBytes

	ld hl, Pals_b8d00
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_b8d00)
	call CopyFarBytes
	call Func_9cc87
	jp AdvanceCutsceneFunc

.Func_9d611:
	ld c, $2d
	jp WaitCutsceneFunc

.Func_9d616:
	ld hl, wSceneObj2YCoord
	ld a, $4c
	ld [hli], a
	ld [hl], $53
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_103
	jp AdvanceCutsceneFunc

.Func_9d631:
	ld a, [wSceneObj2Frame]
	cp $05
	ret nz
	play_sfx SFX_107
	jp AdvanceCutsceneFunc

.Func_9d642:
	ld a, [wSceneObj2State]
	cp $02
	ret nz
	jp AdvanceCutsceneFunc

Func_9d64b:
	ld hl, wSceneObj2
	ld a, $56
	ld [hli], a
	ld [hl], $58
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_9f2f3

Cutscene27Func:
	call .Func_9d664
	jp Func_9f2f3

.Func_9d664:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d674
	dw .Func_9d687
	dw .Func_9d68c
	dw .Func_9d69f
	dw Func_9cd16

.Func_9d674:
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9d687:
	ld c, $32
	jp WaitCutsceneFunc

.Func_9d68c:
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9d69f:
	ld c, $b4
	jp WaitCutsceneFunc

Cutscene09Func:
	call .Func_9d6aa
	jp Func_9fbfa

.Func_9d6aa:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d6b6
	dw .Func_9d6ce
	dw EndCutsceneDelay_60Frames

.Func_9d6b6:
	ld hl, wSceneObj2YCoord
	ld a, $b0
	ld [hli], a
	ld [hl], $4a
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $01
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d6ce:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $88
	jp z, Func_9ce1f
	cp $62
	ret nz
	jp AdvanceCutsceneFunc

Cutscene08Func:
	ld b, $01
	jr Func_9d6f0

Cutscene10Func:
	ld b, $03
	jr Func_9d6f0

Cutscene17Func:
	ld b, $05
	jr Func_9d6f0

Cutscene1dFunc:
	ld b, $07
	jr Func_9d6f0

Cutscene25Func:
	ld b, $09
;	fallthrough

Func_9d6f0:
	call .Func_9d6f6
	jp Func_9fc1d

.Func_9d6f6:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d70c
	dw .Func_9d723
	dw .Func_9d733
	dw .Func_9d738
	dw .Func_9d744
	dw .Func_9d749
	dw .Func_9d792
	dw EndCutsceneDelay_80Frames

.Func_9d70c:
	ld hl, wSceneObj2YCoord
	ld a, $b0
	ld [hli], a
	ld [hl], $4a
	ld a, b
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $01
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d723:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $88
	jp z, Func_9ce1f
	cp $62
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d733:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d738:
	ld hl, wSceneObj2State
	ld a, [hl]
	ld b, a
	inc a
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d744:
	ld c, $32
	jp WaitCutsceneFunc

.Func_9d749:
	call AdvanceCutsceneFunc
	ld a, [wSceneObj2State]
	dec a
	cp $01
	jr z, .asm_9d765
	cp $03
	jr z, .asm_9d76e
	cp $05
	jr z, .asm_9d777
	cp $07
	jr z, .asm_9d780
	cp $09
	jr z, .asm_9d789
	ret
.asm_9d765
	play_sfx SFX_11E
	ret
.asm_9d76e
	play_sfx SFX_11F
	ret
.asm_9d777
	play_sfx SFX_120
	ret
.asm_9d780
	play_sfx SFX_121
	ret
.asm_9d789
	play_sfx SFX_122
	ret

.Func_9d792:
	ld c, $fe
	jp WaitCutsceneFunc

Cutscene02Func:
	call .Func_9d79d
	jp Func_9fc58

.Func_9d79d:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d7b7
	dw .Func_9d7cf
	dw .Func_9d7e1
	dw .Func_9d7e6
	dw .Func_9d7ee
	dw .Func_9d7f3
	dw .Func_9d806
	dw .Func_9d80b
	dw .Func_9d826
	dw EndCutsceneDelay_40Frames

.Func_9d7b7
	ld hl, wSceneObj2
	ld a, SCREEN_HEIGHT_PX
	ld [hli], a
	ld [hl], $6c
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d7cf
	ld hl, wSceneObj2
	dec [hl]
	ld a, [hl]
	inc l
	dec [hl]
	cp $86
	jp z, Func_9ce1f
	cp $60
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d7e1
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d7e6
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	jp AdvanceCutsceneFunc

.Func_9d7ee
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9d7f3
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	xor a
	ld hl, wSceneObj2State
	call SetSceneObjState
	xor a
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d806
	ld c, $10
	jp WaitCutsceneFunc

.Func_9d80b
	ld hl, wSceneObj2
	ld a, $60
	ld [hli], a
	ld [hl], $42
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_101
	jp AdvanceCutsceneFunc

.Func_9d826
	ld a, [wSceneObj2State]
	and a
	ret nz
	jp AdvanceCutsceneFunc

Cutscene0cFunc:
	call .Func_9d834
	jp Func_9f323

.Func_9d834:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d840
	dw .Func_9d858
	dw EndCutsceneDelay_60Frames

.Func_9d840:
	ld hl, wSceneObj2YCoord
	ld a, $a4
	ld [hli], a
	ld [hl], $78
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d858:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hli]
	dec [hl]
	cp $8a
	jp z, Func_9ce1f
	cp $64
	ret nz
	jp AdvanceCutsceneFunc

Cutscene18Func:
	call .Func_9d86f
	jp Func_9f1f3

.Func_9d86f:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d87f
	dw .Func_9d897
	dw .Func_9d8a8
	dw .Func_9d8ad
	dw EndCutsceneDelay_60Frames

.Func_9d87f:
	ld hl, wSceneObj2YCoord
	ld a, $a4
	ld [hli], a
	ld [hl], $70
	ld a, $04
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d897:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hli]
	dec [hl]
	cp $8a
	jp z, Func_9ce1f
	cp $64
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d8a8:
	ld c, $14
	jp WaitCutsceneFunc

.Func_9d8ad:
	ld a, $08
	ld [wCollectionRow], a
	jp AdvanceCutsceneFunc

Cutscene0dFunc:
	call .Func_9d8bb
	jp Func_9f340

.Func_9d8bb:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d8d9
	dw .Func_9d8ec
	dw .Func_9d8fc
	dw .Func_9d901
	dw .Func_9d909
	dw .Func_9d90e
	dw .Func_9d929
	dw .Func_9d94c
	dw .Func_9d929
	dw .Func_9d973
	dw .Func_9d980
	dw EndCutsceneDelay_20Frames

.Func_9d8d9:
	ld hl, wSceneObj2YCoord
	ld a, $9c
	ld [hli], a
	ld [hl], $48
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d8ec:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $7a
	jp z, Func_9ce1f
	cp $54
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d8fc:
	ld c, $14
	jp WaitCutsceneFunc

.Func_9d901:
	ld a, $08
	ld [wCollectionRow], a
	jp AdvanceCutsceneFunc

.Func_9d909:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9d90e:
	ld hl, wSceneObj3YCoord
	ld a, $58
	ld [hli], a
	ld [hl], $40
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_117
	jp AdvanceCutsceneFunc

.Func_9d929:
	ld a, [bc]
	bit 0, a
	ret z
	ld hl, wSceneObj3XCoord
	dec [hl]
	ld a, [hl]
	cp $1c
	ret nz
	xor a
	ld [wSceneObj3State], a
	ld hl, wSceneObj4YCoord
	ld a, $50
	ld [hli], a
	ld [hl], $3c
	ld a, $03
	ld hl, wSceneObj4State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d94c:
	call .Func_9d967
	ret nz
	xor a
	ld [wSceneObj4State], a
	ld hl, wSceneObj3YCoord
	ld a, $58
	ld [hli], a
	ld [hl], $40
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9d967:
	ld a, [bc]
	bit 0, a
	ret nz
	ld hl, wSceneObj4XCoord
	dec [hl]
	ld a, [hl]
	cp $18
	ret

.Func_9d973:
	call .Func_9d967
	cp $18
	ret nz
	xor a
	ld [wSceneObj4State], a
	jp AdvanceCutsceneFunc

.Func_9d980:
	ld c, $50
	jp WaitCutsceneFunc

Cutscene13Func:
	call .Func_9d98b
	jp Func_9f367

.Func_9d98b:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9d9a1
	dw .Func_9d9c5
	dw .Func_9d9d8
	dw .Func_9d9e5
	dw .Func_9d9f4
	dw .Func_9d9f9
	dw Func_9cdcd
	dw EndCutsceneDelay_40Frames

.Func_9d9a1:
	ld hl, wSceneObj2YCoord
	ld a, $b0
	ld [hli], a
	ld [hl], $48
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, [wSceneObj2YCoord]
	ld [wSceneObj3YCoord], a
	ld a, [wSceneObj2XCoord]
	ld [wSceneObj3XCoord], a
	ld a, $01
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9d9c5:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	ld [wSceneObj3YCoord], a
	cp $86
	jp z, Func_9ce1f
	cp $60
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d9d8:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $40
	ret nc
	ld [hl], $40
	jp AdvanceCutsceneFunc

.Func_9d9e5:
	ld a, [bc]
	bit 0, a
	ret z
	ld hl, wSceneObj3YCoord
	inc [hl]
	ld a, [hl]
	cp SCREEN_HEIGHT_PX
	ret nz
	jp AdvanceCutsceneFunc

.Func_9d9f4:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9d9f9:
	ld hl, wSceneObj2YCoord
	inc [hl]
	inc [hl]
	inc [hl]
	ld a, [hl]
	cp $b0
	ret c
	play_sfx SFX_061
	jp AdvanceCutsceneFunc

Func_9da0e:
	ld a, $05
	ld hl, wSceneObj4State
	call SetSceneObjState
	ld hl, wSceneObj4
	ld a, $60
	ld [hli], a
	ld [hl], $50
	ld a, $06
	ld hl, wSceneObj5State
	call SetSceneObjState
	ld hl, wSceneObj5
	ld a, $60
	ld [hli], a
	ld [hl], $50
	jp Func_9f38d

Cutscene15Func:
Cutscene49Func:
	call .Func_9da37
	jp Func_9f38d

.Func_9da37:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9da4d
	dw .Func_9da52
	dw .Func_9da65
	dw .Func_9da7c
	dw .Func_9da8b
	dw .Func_9dac4
	dw .Func_9dac9
	dw EndCutsceneDelay_40Frames

.Func_9da4d:
	ld c, $14
	jp WaitCutsceneFunc

.Func_9da52:
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj2YCoord
	ld a, $00
	ld [hli], a
	ld [hl], $50
	jp AdvanceCutsceneFunc

.Func_9da65:
	ld a, [bc]
	bit 0, a
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $45
	ret nz
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9da7c:
	ld a, [bc]
	cp $14
	ret c
	ld a, $04
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9da8b:
	ld a, [wSceneObj2State]
	cp $01
	jr z, .asm_9daa6
	ld a, [wSceneObj2Frame]
	cp $03
	ret nz
	ld a, [wSceneObj2Duration]
	and a
	ret nz
	play_sfx SFX_12C
	ret
.asm_9daa6
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld hl, wSceneObj3State
	call SetSceneObjState
	ld hl, wSceneObj2YCoord
	ld a, [hli]
	ld [wSceneObj3YCoord], a
	ld a, [hl]
	ld [wSceneObj3XCoord], a
	jp AdvanceCutsceneFunc

.Func_9dac4:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9dac9:
	call .Func_9daf0
	ld a, [bc]
	and $07
	ret nz
	ld hl, w2d023
	inc [hl]
	ld hl, wSceneObj5XCoord
	inc [hl]
	ld hl, wSceneObj3XCoord
	inc [hl]
	ld hl, wSCX
	inc [hl]
	ld hl, wSceneObj4XCoord
	dec [hl]
	ld a, [hl]
	ld hl, wSceneObj2XCoord
	dec [hl]
	ld a, [hl]
	cp $40
	ret nz
	jp AdvanceCutsceneFunc

.Func_9daf0:
	ld hl, wSceneObj4Unk7
	inc [hl]
	ld a, [hl]
	cp $11
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_01F
	ret

Cutscene04Func:
	call .Func_9db09
	jp Func_9f3cd

.Func_9db09:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9db1b
	dw .Func_9db32
	dw .Func_9db46
	dw .Func_9db5d
	dw .Func_9db71
	dw EndCutsceneDelay_60Frames

.Func_9db1b:
	ld a, [bc]
	cp $14
	ret c
	ld hl, wSceneObj2YCoord
	ld a, $80
	ld [hli], a
	ld [hl], $50
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9db32:
	ld hl, wSceneObj2
	call .Func_9db43
	cp $70
	jp z, Func_9ce1f
	cp $4a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9db43:
	dec [hl]
	ld a, [hl]
	ret

.Func_9db46:
	ld a, [bc]
	cp $32
	ret c
	ld hl, wSceneObj3YCoord
	ld a, $80
	ld [hli], a
	ld [hl], $50
	ld a, $03
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9db5d:
	ld hl, wSceneObj3
	call .Func_9db43
	cp $4a
	ret nz
	play_sfx SFX_113
	jp AdvanceCutsceneFunc

.Func_9db71:
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	xor a
	ld [wSceneObj3State], a
	ld a, $08
	ld [wCollectionRow], a
	jp AdvanceCutsceneFunc

Func_9db85:
	ld hl, wSceneObj2
	ld a, $68
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_9f3ee

Cutscene24Func:
	call .Func_9db9e
	jp Func_9f3ee

.Func_9db9e:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9dbb2
	dw .Func_9dbc9
	dw .Func_9dbe5
	dw .Func_9dbf8
	dw .Func_9dbfd
	dw .Func_9dc63
	dw EndCutsceneDelay_40Frames

.Func_9dbb2:
	ld a, [bc]
	cp $28
	ret c
	ld hl, wSceneObj3YCoord
	ld a, $46
	ld [hli], a
	ld [hl], $10
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9dbc9:
	ld hl, wSceneObj3XCoord
	inc [hl]
	ld a, [hl]
	cp $30
	jr z, .asm_9dbdc
	cp SCREEN_WIDTH_PX
	ret nz
	xor a
	ld [wSceneObj3State], a
	jp AdvanceCutsceneFunc
.asm_9dbdc
	play_sfx SFX_128
	ret

.Func_9dbe5:
	ld a, [bc]
	cp $46
	ret c
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9dbf8:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9dbfd:
	ld hl, w2d014
	call .Func_9dc0e
	ld hl, wSceneObj2YCoord
	add [hl]
	ld [hl], a
	cp $88
	ret c
	jp AdvanceCutsceneFunc

.Func_9dc0e:
	ld a, [hl]
	cp $44
	jr c, .asm_9dc16
	ld a, $40
	ld [hl], a
.asm_9dc16
	ld e, a
	ld d, $00
	ld hl, .data_9dc1f
	add hl, de
	ld a, [hl]
	ret

.data_9dc1f
	db $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $01, $01, $01

.Func_9dc63:
	xor a
	ld [wSceneObj2State], a
	jp AdvanceCutsceneFunc

Func_9dc6a:
	ld hl, wSceneObj3
	ld a, $60
	ld [hli], a
	ld [hl], $70
	ld a, $04
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp Func_9f423

Cutscene1fFunc:
	call .Func_9dc83
	jp Func_9f423

.Func_9dc83:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9dc99
	dw .Func_9dcac
	dw .Func_9dcca
	dw .Func_9dcd5
	dw .Func_9dce4
	dw .Func_9dcf5
	dw .Func_9dcfe
	dw EndCutsceneDelay_120Frames

.Func_9dc99:
	ld hl, wSceneObj2YCoord
	ld a, $24
	ld [hli], a
	ld [hl], $2a
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9dcac:
	ld a, [bc]
	bit 0, a
	ret z
	ld hl, wSceneObj2YCoord
	inc [hl]
	inc l
	inc [hl]
	ld a, [hl]
	cp $2e
	jr z, .asm_9dcc1
	cp $4a
	ret nz
	jp AdvanceCutsceneFunc
.asm_9dcc1
	play_sfx SFX_11D
	ret

.Func_9dcca:
	ld a, [bc]
	cp $46
	ret c
	xor a
	ld [wSceneObj2State], a
	jp AdvanceCutsceneFunc

.Func_9dcd5:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9dce4:
	ld a, [wSceneObj3Frame]
	cp $0a
	ret nz
	play_sfx SFX_FAT_WALK
	jp AdvanceCutsceneFunc

.Func_9dcf5:
	ld a, [wSceneObj3State]
	cp $03
	ret nz
	jp AdvanceCutsceneFunc

.Func_9dcfe:
	ld c, $28
	jp WaitCutsceneFunc

Cutscene21Func:
	call .Func_9dd09
	jp Func_9f49c

.Func_9dd09:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9dd60
	dw .Func_9dd8b
	dw .Func_9dd9c
	dw .Func_9dda1
	dw .Func_9dda9
	dw .Func_9dd9c
	dw .Func_9ddb3
	dw .Func_9ddbb
	dw .Func_9dd9c
	dw .Func_9ddc2
	dw .Func_9ddca
	dw .Func_9ddd8
	dw .Func_9dd9c
	dw .Func_9dddf
	dw .Func_9dde3
	dw .Func_9dd9c
	dw .Func_9ddea
	dw .Func_9ddee
	dw .Func_9dd9c
	dw .Func_9ddf5
	dw .Func_9dd80
	dw .Func_9ddf9
	dw .Func_9de00
	dw EndCutsceneDelay_40Frames

.Func_9dd3f:
	ld hl, wSceneObj2YCoord
	ld a, [bc]
	and $03
	jr nz, .asm_9dd48
	dec [hl]

.asm_9dd48
	ld a, [hl]
	ret

.Func_9dd4a:
	ld hl, wSceneObj2XCoord
	ld a, [bc]
	bit 0, a
	jr z, .asm_9dd48
	inc [hl]
	jr .asm_9dd48

.Func_9dd55:
	ld hl, wSceneObj2XCoord
	ld a, [bc]
	bit 0, a
	jr z, .asm_9dd48
	dec [hl]
	jr .asm_9dd48

.Func_9dd60:
	ld hl, wSceneObj3YCoord
	ld a, $48
	ld [hli], a
	ld [hl], $48
	ld hl, wSceneObj4YCoord
	ld a, $48
	ld [hli], a
	ld [hl], $58
	ld hl, wSceneObj5YCoord
	ld a, $48
	ld [hli], a
	ld [hl], $68
	ld hl, wSceneObj2YCoord
	ld a, $80
	ld [hli], a
	ld [hl], $48

.Func_9dd80:
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9dd8b:
	call .Func_9dd3f
	cp $48
	ret nz
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9dd9c:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9dda1:
	ld a, $03
.asm_9dda3
	ld [wSceneObj3State], a
	jp AdvanceCutsceneFunc

.Func_9dda9:
	call .Func_9dd4a
	ld b, $58
.asm_9ddae
	cp b
	ret nz
	jp AdvanceCutsceneFunc

.Func_9ddb3:
	ld a, $03
.asm_9ddb5
	ld [wSceneObj4State], a
	jp AdvanceCutsceneFunc

.Func_9ddbb:
	call .Func_9dd4a
	ld b, $68
	jr .asm_9ddae

.Func_9ddc2:
	ld a, $03
.asm_9ddc4
	ld [wSceneObj5State], a
	jp AdvanceCutsceneFunc

.Func_9ddca:
	call .Func_9dd4a
	cp $88
	ret nz
	ld a, $38
	ld [wSceneObj2YCoord], a
	jp AdvanceCutsceneFunc

.Func_9ddd8:
	call .Func_9dd55
	ld b, $68
	jr .asm_9ddae

.Func_9dddf:
	ld a, $04
	jr .asm_9ddc4

.Func_9dde3:
	call .Func_9dd55
	ld b, $58
	jr .asm_9ddae

.Func_9ddea:
	ld a, $04
	jr .asm_9ddb5

.Func_9ddee:
	call .Func_9dd55
	ld b, $48
	jr .asm_9ddae

.Func_9ddf5:
	ld a, $04
	jr .asm_9dda3

.Func_9ddf9:
	call .Func_9dd3f
	ld b, $20
	jr .asm_9ddae

.Func_9de00:
	xor a
	ld [wSceneObj2State], a
	jp AdvanceCutsceneFunc

Cutscene37Func:
	call .Func_9de0d
	jp Func_9f508

.Func_9de0d:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9de1b
	dw .Func_9de33
	dw .Func_9de38
	dw EndCutsceneDelay_100Frames

.Func_9de1b:
	ld hl, wSceneObj2YCoord
	ld a, $c0
	ld [hli], a
	ld [hl], $32
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9de33:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9de38:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $8e
	jp z, Func_9ce1f
	cp $68
	ret nz
	jp AdvanceCutsceneFunc

Cutscene38Func:
	call .Func_9de4e
	jp Func_9f547

.Func_9de4e:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9de68
	dw .Func_9de87
	dw .Func_9de92
	dw .Func_9de9d
	dw .Func_9deae
	dw .Func_9debf
	dw .Func_9dec8
	dw Func_9cd8d
	dw .Func_9decd
	dw EndCutsceneDelay_40Frames

.Func_9de68:
	ld a, [bc]
	cp $1e
	ret c
	ld hl, wSceneObj2YCoord
	ld a, $98
	ld [hli], a
	ld [hl], $48
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $01
	ld [wSceneObj1YCoord], a
	call Func_9ce1f
	jp AdvanceCutsceneFunc

.Func_9de87:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $78
	ret nz
	jp AdvanceCutsceneFunc

.Func_9de92:
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9de9d:
	ld a, [wSceneObj2Frame]
	cp $01
	ret nz
	play_sfx SFX_SWITCH
	jp AdvanceCutsceneFunc

.Func_9deae:
	ld a, [wSceneObj2Frame]
	cp $05
	ret nz
	play_sfx SFX_106
	jp AdvanceCutsceneFunc

.Func_9debf:
	ld a, [wSceneObj2State]
	cp $03
	ret nz
	jp AdvanceCutsceneFunc

.Func_9dec8:
	ld c, $78
	jp WaitCutsceneFunc

.Func_9decd:
	xor a
	ld [wSceneObj2State], a
	jp AdvanceCutsceneFunc

Func_9ded4:
	ld hl, wSceneObj2
	ld a, $58
	ld [hli], a
	ld [hl], $62
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState

	ld hl, wSceneObj3
	ld a, $58
	ld [hli], a
	ld [hl], $46
	ld a, $01
	ld hl, wSceneObj3State
	call SetSceneObjState

	ld hl, wSceneObj4
	ld a, $48
	ld [hli], a
	ld [hl], $52
	ld hl, wSceneObj5
	ld a, $44
	ld [hli], a
	ld [hl], $46
	ld hl, wSceneObj6
	ld a, $3c
	ld [hli], a
	ld [hl], $34

	jp Func_9f5a0

Cutscene30Func:
	call .Func_9df15
	jp Func_9f5a0

.Func_9df15:
	call .Func_9dfb6
	call .Func_9dfa6
	call .Func_9dfae

	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9df3c
	dw Func_9cdbd
	dw .Func_9df52
	dw .Func_9df57
	dw .Func_9df62
	dw .Func_9df57
	dw .Func_9df62
	dw .Func_9df57
	dw .Func_9df62
	dw .Func_9df6b
	dw .Func_9df70
	dw EndCutsceneDelay_20Frames

.Func_9df3c:
	call Func_9cc87
	ld b, BANK(Pals_b8500)
	ld hl, Pals_b8500
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8500)
	ld hl, Pals_b8500
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9df52:
	ld c, $0a
	jp WaitCutsceneFunc

.Func_9df57:
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9df62:
	ld a, [wSceneObj2State]
	cp $03
	ret nz
	jp AdvanceCutsceneFunc

.Func_9df6b:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9df70:
	ld a, [w2d014]
	and $07
	ret nz
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld a, [hl]
	cp $48
	jr z, .asm_9df8d
	cp $44
	jr z, .asm_9df9c
	cp $3c
	jr z, .asm_9dfa1
	cp $20
	ret nz
	jp AdvanceCutsceneFunc

.asm_9df8d
	ld hl, wSceneObj4State
.asm_9df90
	ld a, $04
	ld [hl], a
	play_sfx SFX_00F
	ret

.asm_9df9c
	ld hl, wSceneObj5State
	jr .asm_9df90

.asm_9dfa1
	ld hl, wSceneObj6State
	jr .asm_9df90

.Func_9dfa6:
	ld de, wSceneObj5State
	ld hl, wSceneObj5
	jr .asm_9dfbc

.Func_9dfae:
	ld de, wSceneObj6State
	ld hl, wSceneObj6
	jr .asm_9dfbc

.Func_9dfb6:
	ld de, wSceneObj4State
	ld hl, wSceneObj4
.asm_9dfbc
	ld a, [de]
	and a
	ret z
	ld a, [w2d014]
	and $01
	ret nz
	dec [hl]
	ld a, [hl]
	cp $20
	ret nz
	xor a
	ld [de], a
	ret

Cutscene39Func:
	call .Func_9dfd3
	jp Func_9f607

.Func_9dfd3:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9dfe3
	dw .Func_9dff1
	dw .Func_9e004
	dw .Func_9e013
	dw EndCutsceneDelay_40Frames

.Func_9dfe3:
	ld hl, wSceneObj2
	lb de, $18, $54
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9dff1:
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $50
	ret nz
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9e004:
	ld a, [bc]
	cp $2d
	ret c
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e013:
	ld c, $64
	jp WaitCutsceneFunc

Func_9e018:
	ld hl, wSceneObj2
	lb de, $54, $46
	ld a, $01
	call Func_9ccf9

	ld hl, wSceneObj4
	ld a, $50
	ld [hli], a
	ld [hl], $38
	ld hl, wSceneObj5
	ld a, $50
	ld [hli], a
	ld [hl], $48
	ld hl, wSceneObj6
	ld a, $50
	ld [hli], a
	ld [hl], $58
	ld hl, wSceneObj7
	ld a, $50
	ld [hli], a
	ld [hl], $68
	jp Func_9f638

Cutscene3aFunc:
	call .Func_9e04c
	jp Func_9f638

.Func_9e04c:
	call .Func_9e153
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e07d
	dw Func_9cdbd
	dw .Func_9e093
	dw .Func_9e098
	dw .Func_9e0b6
	dw .Func_9e0c8
	dw .Func_9e103
	dw .Func_9e108
	dw .Func_9e112
	dw .Func_9e11d
	dw .Func_9e126
	dw .Func_9e12b
	dw .Func_9e130
	dw .Func_9e135
	dw .Func_9e13a
	dw .Func_9e13f
	dw .Func_9e144
	dw .Func_9e149
	dw .Func_9e14e
	dw EndCutsceneDelay_60Frames

.Func_9e07d:
	call Func_9cc87
	ld b, BANK(Pals_b8780)
	ld hl, Pals_b8780
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8780)
	ld hl, Pals_b8780
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e093:
	ld c, $2d
	jp WaitCutsceneFunc

.Func_9e098:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2YCoord
	dec [hl]
	dec [hl]
	ld a, [hli]
	inc [hl]
	cp $50
	jr z, .asm_9e0ad
	cp $4c
	ret nz
	jp AdvanceCutsceneFunc
.asm_9e0ad
	play_sfx SFX_SWITCH
	ret

.Func_9e0b6:
	ld a, [bc]
	cp $2d
	ret c
	ld hl, wSceneObj3
	lb de, $3d, $52
	ld a, $02
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e0c8:
	ld a, [bc]
	cp $8c
	ret c
	ld a, $08
	ld [wCollectionRow], a
	xor a
	ld [wSceneObj3State], a
	ld [wSceneObj2State], a

	stop_sfx

	ld a, $03
	ld hl, wSceneObj4State
	call SetSceneObjState
	ld a, $03
	ld hl, wSceneObj5State
	call SetSceneObjState
	ld a, $03
	ld hl, wSceneObj6State
	call SetSceneObjState
	ld a, $03
	ld hl, wSceneObj7State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e103:
	ld c, $50
	jp WaitCutsceneFunc

.Func_9e108:
	ld hl, wSceneObj4Frame
.asm_9e10b
	ld a, [hl]
	cp $0a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e112:
	ld hl, wSceneObj4State
.asm_9e115
	ld a, $04
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e11d:
	ld hl, wSceneObj4State
.asm_9e120
	ld a, [hl]
	and a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e126:
	ld hl, wSceneObj5Frame
	jr .asm_9e10b

.Func_9e12b:
	ld hl, wSceneObj5State
	jr .asm_9e115

.Func_9e130:
	ld hl, wSceneObj5State
	jr .asm_9e120

.Func_9e135:
	ld hl, wSceneObj6Frame
	jr .asm_9e10b

.Func_9e13a:
	ld hl, wSceneObj6State
	jr .asm_9e115

.Func_9e13f:
	ld hl, wSceneObj6State
	jr .asm_9e120

.Func_9e144:
	ld hl, wSceneObj7Frame
	jr .asm_9e10b

.Func_9e149:
	ld hl, wSceneObj7State
	jr .asm_9e115

.Func_9e14e:
	ld hl, wSceneObj7State
	jr .asm_9e120

.Func_9e153:
	ld a, [wSceneObj7State]
	cp $03
	ret nz
	ld hl, wSceneObj7Unk7
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, .asm_9e168
	cp $1b
	ret c
	xor a
	ld [hl], a
	ret
.asm_9e168
	play_sfx SFX_080
	ret

Cutscene3cFunc:
	call .Func_9e177
	jp Func_9f6a2

.Func_9e177:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e18f
	dw .Func_9e1a8
	dw .Func_9e1bc
	dw .Func_9e1cb
	dw .Func_9e1d4
	dw .Func_9e231
	dw .Func_9e239
	dw .Func_9e253
	dw EndCutsceneDelay_40Frames

.Func_9e18f:
	ld hl, wSceneObj2
	lb de, $20, $42
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $3e, $50
	ld a, $00
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e1a8:
	ld a, [bc]
	and $01
	ret z
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $27
	jp z, Func_9ce1f
	cp $3a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e1bc:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e1cb:
	ld a, [wSceneObj2State]
	cp $03
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e1d4:
	call .Func_9e1f4
	ld hl, wSceneObj3YCoord
	add [hl]
	ld [hl], a
	cp $58
	ret c
	ld [hl], $58
	ld a, $05
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_0A1
	jp AdvanceCutsceneFunc

.Func_9e1f4:
	ld a, [bc]
	cp $2c
	jr c, .asm_9e1fc
	ld a, $28
	ld [bc], a
.asm_9e1fc
	ld c, a
	ld b, $00
	ld hl, .data_9e205
	add hl, bc
	ld a, [hl]
	ret

.data_9e205
	db $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $01, $01, $00, $01, $01, $01, $00, $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02

.Func_9e231:
	ld a, [wSceneObj3State]
	and a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e239:
	ld a, [bc]
	cp $3c
	ret c
	ld hl, wSceneObj4
	lb de, $58, $50
	ld a, $06
	call Func_9ccf9
	play_sfx SFX_074
	jp AdvanceCutsceneFunc

.Func_9e253:
	ld a, [wSceneObj4State]
	cp $07
	ret nz
	jp AdvanceCutsceneFunc

Cutscene43Func:
	call .Func_9e262
	jp Func_9f6f8

.Func_9e262:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e272
	dw .Func_9e280
	dw .Func_9e297
	dw .Func_9e2a6
	dw EndCutsceneDelay_120Frames

.Func_9e272:
	ld hl, wSceneObj2
	lb de, $20, $50
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e280:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $50
	ret nz
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9e297:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e2a6:
	ld a, [bc]
	cp $2d
	ret c
	ld hl, wSceneObj3
	lb de, $48, $50
	ld a, $03
	call Func_9ccf9
	jp AdvanceCutsceneFunc

Func_9e2b8:
	ld hl, wSceneObj2
	lb de, $58, $50
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $70, $50
	ld a, $02
	call Func_9ccf9
	jp Func_9f73b

Cutscene54Func:
	call .Func_9e2d7
	jp Func_9f73b

.Func_9e2d7:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e2ed
	dw Func_9cdbd
	dw .Func_9e303
	dw .Func_9e308
	dw .Func_9e31c
	dw .Func_9e333
	dw .Func_9e338
	dw EndCutsceneDelay_20Frames

.Func_9e2ed:
	call Func_9cc87
	ld b, BANK(Pals_b8740)
	ld hl, Pals_b8740
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8740)
	ld hl, Pals_b8740
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e303:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9e308:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld a, [hl]
	cp $6b
	jp z, Func_9ce1f
	cp $58
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e31c:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $03
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9e333:
	ld c, $14
	jp WaitCutsceneFunc

.Func_9e338:
	ld a, [bc]
	and $03
	ret z
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $20
	ret nz
	jp AdvanceCutsceneFunc

Cutscene3dFunc:
	call .Func_9e350
	call Func_9f7a2
	jp Func_9f75c

.Func_9e350:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e376
	dw .Func_9e384
	dw .Func_9e391
	dw .Func_9e3a8
	dw .Func_9e3b0
	dw .Func_9e384
	dw .Func_9e391
	dw .Func_9e3a8
	dw .Func_9e3c2
	dw .Func_9e3e4
	dw .Func_9e3f3
	dw .Func_9e402
	dw .Func_9e40b
	dw .Func_9e41a
	dw .Func_9e429
	dw EndCutsceneDelay_20Frames

.Func_9e376
	ld hl, wSceneObj2
	lb de, $6c, $78
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e384
	ld hl, wSceneObj2YCoord
	dec [hl]
	inc l
	dec [hl]
	ld a, [hl]
	cp $44
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e391
	ld a, [bc]
	cp $1e
	ret c
	ld hl, wSceneObj2State
	ld a, [hl]
	inc a
	call SetSceneObjState
	play_sfx SFX_0C4
	jp AdvanceCutsceneFunc

.Func_9e3a8
	ld a, [wSceneObj2State]
	and a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e3b0
	ld a, [bc]
	cp $0a
	ret c
	ld hl, wSceneObj2
	lb de, $84, $78
	ld a, $03
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e3c2
	ld a, [bc]
	cp $3c
	ret c
	ld a, $08
	ld [wCollectionRow], a
	ld hl, wSceneObj4
	lb de, $50, $50
	ld a, $05
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $40, $50
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e3e4
	ld a, [bc]
	cp $5a
	ret c
	ld a, $06
	ld hl, wSceneObj4State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e3f3
	ld a, [bc]
	cp $04
	ret c
	play_sfx SFX_07A
	jp AdvanceCutsceneFunc

.Func_9e402
	ld a, [wSceneObj4State]
	cp $07
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e40b
	ld a, [bc]
	cp $08
	ret c
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e41a
	ld a, [bc]
	cp $14
	ret c
	play_sfx SFX_0AC
	jp AdvanceCutsceneFunc

.Func_9e429
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj3YCoord
	inc [hl]
	ld a, [hl]
	cp $80
	ret nz
	jp AdvanceCutsceneFunc

Func_9e438:
	ld hl, wSceneObj2
	lb de, $40, $b0
	ld a, $02
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $44, $50
	ld a, $01
	call Func_9ccf9
	jp Func_9f7bb

Cutscene4aFunc:
	call .Func_9e457
	jp Func_9f7bb

.Func_9e457:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e469
	dw .Func_9e474
	dw .Func_9e483
	dw .Func_9e494
	dw .Func_9e4a5
	dw EndCutsceneDelay_40Frames

.Func_9e469:
	ld hl, wSceneObj2XCoord
	dec [hl]
	ld a, [hl]
	cp $56
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e474:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e483:
	ld a, [wSceneObj2Frame]
	cp $04
	ret nz
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

.Func_9e494:
	ld a, [wSceneObj2Frame]
	cp $06
	ret nz
	play_sfx SFX_132
	jp AdvanceCutsceneFunc

.Func_9e4a5:
	ld a, [wSceneObj2Frame]
	cp $07
	ret nz
	jp AdvanceCutsceneFunc

Func_9e4ae:
	ld hl, wSceneObj2
	lb de, $80, $40
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $50, $5c
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3Attributes
	set 1, [hl]
	call Func_9f7dc
	jp Func_9f821

Cutscene4cFunc:
	call .Func_9e4d8
	call Func_9f7dc
	jp Func_9f821

.Func_9e4d8:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e4f0
	dw Func_9cdbd
	dw .Func_9e506
	dw .Func_9e50b
	dw .Func_9e51b
	dw .Func_9e52a
	dw .Func_9e532
	dw .Func_9e541
	dw EndCutsceneDelay_60Frames

.Func_9e4f0:
	call Func_9cc87
	ld b, BANK(Pals_b86c0)
	ld hl, Pals_b86c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b86c0)
	ld hl, Pals_b86c0
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e506:
	ld c, $28
	jp WaitCutsceneFunc

.Func_9e50b:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $7e
	jp z, Func_9ce1f
	cp $58
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e51b:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e52a:
	ld a, [wSceneObj2State]
	cp $03
	jp AdvanceCutsceneFunc

.Func_9e532:
	ld a, [bc]
	cp $64
	ret c
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e541:
	ld a, [bc]
	cp $3c
	ret c
	xor a
	ld [wSceneObj3State], a
	jp AdvanceCutsceneFunc

Cutscene4eFunc:
	call .Func_9e552
	jp Func_9f857

.Func_9e552:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e562
	dw Func_9cdbd
	dw .Func_9e578
	dw .Func_9e58a
	dw EndCutsceneDelay_80Frames

.Func_9e562:
	call Func_9cc87
	ld b, BANK(Pals_b8640)
	ld hl, Pals_b8640
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8640)
	ld hl, Pals_b8640
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e578:
	ld a, [bc]
	cp $14
	ret c
	ld hl, wSceneObj2
	lb de, $78, $50
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e58a:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $50
	ret nz
	play_sfx SFX_062
	jp AdvanceCutsceneFunc

Func_9e5a1:
	ld hl, wSceneObj2
	lb de, $20, $4c
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $50, $60
	ld a, $04
	call Func_9ccf9
	jp Func_9f86a

Cutscene4fFunc:
	call .Func_9e5c0
	jp Func_9f86a

.Func_9e5c0:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e5e2
	dw .Func_9e5f6
	dw .Func_9e605
	dw .Func_9e60a
	dw .Func_9e61a
	dw .Func_9e61f
	dw .Func_9e61a
	dw .Func_9e60a
	dw .Func_9e61a
	dw .Func_9e61f
	dw .Func_9e62e
	dw .Func_9e63d
	dw .Func_9e64c
	dw EndCutsceneDelay_40Frames

.Func_9e5e2:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $31
	jp z, Func_9ce1f
	cp $44
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e5f6:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e605:
	ld c, $2d
	jp WaitCutsceneFunc

.Func_9e60a:
	ld d, $5c
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp d
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e61a:
	ld c, $08
	jp WaitCutsceneFunc

.Func_9e61f:
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $44
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e62e:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e63d:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $03
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e64c:
	ld a, [wSceneObj3State]
	cp $05
	ret nz
	jp AdvanceCutsceneFunc

Func_9e655:
	ld hl, wSceneObj2
	lb de, $40, $58
	ld a, $02
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $58, $58
	ld a, $01
	call Func_9ccf9
	jp Func_9f8da

Cutscene51Func:
	call .Func_9e674
	jp Func_9f8da

.Func_9e674:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e688
	dw .Func_9e69c
	dw .Func_9e6a7
	dw .Func_9e6b8
	dw .Func_9e6c0
	dw .Func_9e6c5
	dw EndCutsceneDelay_60Frames

.Func_9e688:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $45
	jp z, Func_9ce1f
	cp $58
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e69c:
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e6a7:
	ld a, [wSceneObj2Frame]
	cp $04
	ret nz
	play_sfx SFX_0A1
	jp AdvanceCutsceneFunc

.Func_9e6b8:
	ld a, [wSceneObj2State]
	and a
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e6c0:
	ld c, $2d
	jp WaitCutsceneFunc

.Func_9e6c5:
	call .Func_9e6d7
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj3YCoord
	inc [hl]
	ld a, [hl]
	cp $78
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e6d7:
	ld hl, wSceneObj3Unk7
	inc [hl]
	ld a, [hl]
	cp $01
	jr z, .asm_9e6e6
	cp $10
	ret c
	xor a
	ld [hl], a
	ret
.asm_9e6e6
	play_sfx SFX_01F
	ret

Func_9e6ef:
	ld hl, wSceneObj2
	lb de, $56, $50
	ld a, $01
	call Func_9ccf9
	jp Func_9f91f

Cutscene56Func:
	call .Func_9e703
	jp Func_9f91f

.Func_9e703:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e71f
	dw Func_9cdbd
	dw .Func_9e735
	dw .Func_9e747
	dw .Func_9e750
	dw .Func_9e759
	dw .Func_9e779
	dw .Func_9e787
	dw .Func_9e78e
	dw .Func_9e793
	dw Func_9cd16

.Func_9e71f:
	call Func_9cc87
	ld b, BANK(Pals_b9080)
	ld hl, Pals_b9080
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b9080)
	ld hl, Pals_b9080
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e735:
	ld a, [bc]
	cp $2d
	ret c
	ld hl, wSceneObj2
	lb de, $56, $50
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e747:
	ld a, [wSceneObj2State]
	cp $02
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e750:
	ld a, [wSceneObj2State]
	cp $01
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e759:
	ld a, [bc]
	cp $14
	ret c
	xor a
	ld [wSceneObj2State], a
	ld a, $08
	ld [wCollectionRow], a
	ld b, BANK(Pals_b8800)
	ld c, 8 palettes
	ld hl, Pals_b8800
	ld de, wTempPals1
	call CopyFarBytes
	call Func_9cd40
	jp AdvanceCutsceneFunc

.Func_9e779:
	ld hl, Pals_b8840
.asm_9e77c
	call Func_9cd74
	ld b, BANK(Pals_b8840) ; aka BANK(Pals_b8880)
	call LoadFarPalsToTempPals1
	jp AdvanceCutsceneFunc

.Func_9e787:
	ld a, [bc]
	and $01
	ret nz
	jp Func_9cdbd

.Func_9e78e:
	ld hl, Pals_b8880
	jr .asm_9e77c

.Func_9e793:
	ld a, [bc]
	and $03
	ret nz
	jp Func_9cdbd

Func_9e79a:
	ld hl, wSceneObj3
	lb de, $4e, $54
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj2
	lb de, $10, $48
	ld a, $03
	call Func_9ccf9
	jp Func_9f991

Cutscene57Func:
	call .Func_9e7b9
	jp Func_9f991

.Func_9e7b9:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e7d9
	dw Func_9cdbd
	dw .Func_9e7ef
	dw .Func_9e7ff
	dw .Func_9e80e
	dw .Func_9e827
	dw .Func_9e836
	dw .Func_9e844
	dw .Func_9e84b
	dw .Func_9e844
	dw .Func_9e850
	dw .Func_9e844
	dw Func_9cd16

.Func_9e7d9:
	call Func_9cc87
	ld b, BANK(Pals_b8540)
	ld hl, Pals_b8540
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8540)
	ld hl, Pals_b8540
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e7ef:
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $2c
	jp z, Func_9ce1f
	cp $52
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e7ff:
	ld a, [bc]
	cp $32
	ret c
	ld a, $04
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e80e:
	ld a, [wSceneObj2State]
	cp $03
	ret nz
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_105
	jp AdvanceCutsceneFunc

.Func_9e827:
	ld a, [bc]
	cp $30
	ret c
	ld a, $01
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e836:
	ld hl, Pals_b8580
.asm_9e839
	call Func_9cd74
	ld b, BANK(Pals_b8580) ; aka BANK(Pals_b85c0) and BANK(Pals_b8600)
	call LoadFarPalsToTempPals1
	jp AdvanceCutsceneFunc

.Func_9e844:
	ld a, [bc]
	and $01
	ret nz
	jp Func_9cdbd

.Func_9e84b:
	ld hl, Pals_b85c0
	jr .asm_9e839

.Func_9e850:
	ld hl, Pals_b8600
	jr .asm_9e839

Func_9e855:
	ld hl, wSceneObj2
	lb de, SCREEN_HEIGHT_PX, $48
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $48, $58
	ld a, $01
	call Func_9ccf9
	call Func_9f9c1
	jp Func_9f9f5

Cutscene58Func:
	call .Func_9e87a
	call Func_9f9c1
	jp Func_9f9f5

.Func_9e87a:
	push bc
	call Func_9ea9e
	call Func_9eab4
	pop bc

	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e89c
	dw Func_9cdbd
	dw .Func_9e8b2
	dw .Func_9e8b7
	dw .Func_9e8b2
	dw .Func_9e8c7
	dw .Func_9e8d6
	dw .Func_9e8c7
	dw .Func_9e905
	dw EndCutsceneDelay_120Frames

.Func_9e89c:
	call Func_9cc87
	ld b, BANK(Pals_b87c0)
	ld hl, Pals_b87c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b87c0)
	ld hl, Pals_b87c0
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e8b2:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9e8b7:
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $76
	jp z, Func_9ce1f
	cp $50
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e8c7:
	ld a, [bc]
	cp $1a
	ret c
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9e8d6:
	ld a, [wSceneObj2State]
	cp $01
	ret nz
.asm_9e8dc
	ld hl, wSceneObj10
	lb de, $48, $54
	ld a, $03
	call Func_9ccf9
	ld hl, wSceneObj11
	lb de, $44, $58
	ld a, $03
	call Func_9ccf9
	ld a, $01
	ld [wSceneObj12YCoord], a
	ld [wSceneObj12XCoord], a
	play_sfx SFX_132
	jp AdvanceCutsceneFunc

.Func_9e905:
	ld a, [wSceneObj2State]
	cp $01
	ret nz
	ld a, $08
	ld [wCollectionRow], a
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	jr .asm_9e8dc

Func_9e91a:
	ld hl, wSceneObj3
	lb de, $58, $40
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj4
	lb de, $58, $50
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj5
	lb de, $58, $60
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj6
	lb de, $58, $40
	ld a, $04
	call Func_9ccf9
	ld hl, wSceneObj7
	lb de, $58, $50
	ld a, $04
	call Func_9ccf9
	ld hl, wSceneObj8
	lb de, $58, $60
	ld a, $04
	call Func_9ccf9
	jp Func_9fa48

Cutscene55Func:
	call .Func_9e965
	jp Func_9fa48

.Func_9e965:
	push bc
	call Func_9ea9e
	call Func_9eab4
	pop bc

	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9e9a3
	dw Func_9cdbd
	dw .Func_9e9b9
	dw .Func_9e9cb
	dw .Func_9e9da
	dw .Func_9e9df
	dw .Func_9e9f6
	dw .Func_9ea1b
	dw .Func_9ea2a
	dw .Func_9ea39
	dw .Func_9e9da
	dw .Func_9e9df
	dw .Func_9ea49
	dw .Func_9ea61
	dw .Func_9ea2a
	dw .Func_9ea70
	dw .Func_9e9da
	dw .Func_9e9df
	dw .Func_9ea74
	dw .Func_9ea7f
	dw .Func_9ea2a
	dw .Func_9ea8e
	dw .Func_9ea93
	dw EndCutsceneDelay_40Frames

.Func_9e9a3:
	call Func_9cc87
	ld b, BANK(Pals_b8680)
	ld hl, Pals_b8680
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8680)
	ld hl, Pals_b8680
	call LoadFarPalsToTempPals2
	jp AdvanceCutsceneFunc

.Func_9e9b9:
	ld a, [bc]
	cp $28
	ret c
	ld hl, wSceneObj2
	lb de, $46, $90
	ld a, $02
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9e9cb:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2XCoord
	dec [hl]
	ld a, [hl]
	cp $44
	ret nz
	jp AdvanceCutsceneFunc

.Func_9e9da:
	ld c, $2d
	jp WaitCutsceneFunc

.Func_9e9df:
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $4e
	ret nz
	play_sfx SFX_SWITCH
	jp AdvanceCutsceneFunc

.Func_9e9f6:
	xor a
	ld [wSceneObj3State], a
.Func_9e9fa:
	ld hl, wSceneObj10
	lb de, $4c, $40
	ld a, $03
	call Func_9ccf9
	ld hl, wSceneObj11
	lb de, $4c, $48
	ld a, $03
	call Func_9ccf9
	ld a, $01
	ld [wSceneObj12YCoord], a
	ld [wSceneObj12XCoord], a
	jp AdvanceCutsceneFunc

.Func_9ea1b:
	ld a, [bc]
	cp $14
	ret c
	ld a, $05
	ld hl, wSceneObj6State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9ea2a:
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld a, [hl]
	cp $46
	ret nz
	jp AdvanceCutsceneFunc

.Func_9ea39:
	ld e, $54
.asm_9ea3b
	ld a, [bc]
	and $03
	ret nz
	ld hl, wSceneObj2XCoord
	inc [hl]
	ld a, [hl]
	cp e
	ret nz
	jp AdvanceCutsceneFunc

.Func_9ea49:
	xor a
	ld [wSceneObj4State], a
	call .Func_9e9fa
	ld b, $10
.asm_9ea52
	ld a, [wSceneObj10XCoord]
	add b
	ld [wSceneObj10XCoord], a
	ld a, [wSceneObj11XCoord]
	add b
	ld [wSceneObj11XCoord], a
	ret

.Func_9ea61:
	ld a, [bc]
	cp $14
	ret c
	ld a, $05
	ld hl, wSceneObj7State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9ea70:
	ld e, $64
	jr .asm_9ea3b

.Func_9ea74:
	xor a
	ld [wSceneObj5State], a
	call .Func_9e9fa
	ld b, $20
	jr .asm_9ea52

.Func_9ea7f:
	ld a, [bc]
	cp $14
	ret c
	ld a, $05
	ld hl, wSceneObj8State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9ea8e:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9ea93:
	ld hl, wSceneObj2XCoord
	inc [hl]
	ld a, [hl]
	cp $90
	ret nz
	jp AdvanceCutsceneFunc

Func_9ea9e:
	ld a, [wSceneObj12YCoord]
	and a
	ret z
	ld de, Data_9ec16
	ld hl, wSceneObj10
	call ApplyOWMovement
	ret nz
	ld [wSceneObj12YCoord], a
	ld [wSceneObj10State], a
	ret

Func_9eab4:
	ld a, [wSceneObj12XCoord]
	and a
	ret z
	ld de, Data_9ec41
	ld hl, wSceneObj11
	call ApplyOWMovement
	ret nz
	ld [wSceneObj12XCoord], a
	ld [wSceneObj11State], a
	ret

Cutscene44Func:
	call .Func_9ead3
	call Func_9fab4
	jp Func_9faea

.Func_9ead3:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9eaf7
	dw .Func_9eb05
	dw .Func_9eb18
	dw .Func_9eb24
	dw .Func_9eb3d
	dw .Func_9eb47
	dw .Func_9eb5c
	dw .Func_9eb68
	dw .Func_9eb73
	dw .Func_9eb8a
	dw .Func_9eb9a
	dw .Func_9eb9f
	dw .Func_9ebad
	dw Func_9cdcd
	dw EndCutsceneDelay_60Frames

.Func_9eaf7:
	ld hl, wSceneObj2
	lb de, $20, $4c
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9eb05:
	ld a, [bc]
	and $01
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $a8
	ret nz
	xor a
	ld [wSceneObj2State], a
	jp AdvanceCutsceneFunc

.Func_9eb18:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $08
	ld [wCollectionRow], a
	jp AdvanceCutsceneFunc

.Func_9eb24:
	ld hl, wSceneObj2
	lb de, $20, $50
	ld a, $02
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $48, $20
	ld a, $01
	call Func_9ccf9
	jp AdvanceCutsceneFunc

.Func_9eb3d:
	ld a, [bc]
	cp $50
	call z, AdvanceCutsceneFunc
	call .Func_9ebbc
	ret

.Func_9eb47:
	call .Func_9ebbc
	call .Func_9ebc7
	ld a, [hl]
	cp $48
	ret nz
	play_sfx SFX_FAT_WALK
	jp AdvanceCutsceneFunc

.Func_9eb5c:
	ld a, [bc]
	cp $02
	ret c
	ld hl, wSceneObj3XCoord
	dec [hl]
	dec [hl]
	jp AdvanceCutsceneFunc

.Func_9eb68:
	ld a, [bc]
	cp $06
	ret c
	xor a
	ld [wSceneObj2State], a
	jp AdvanceCutsceneFunc

.Func_9eb73:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_11A
	jp AdvanceCutsceneFunc

.Func_9eb8a:
	ld a, [wSceneObj3State]
	cp $03
	ret nz
	xor a
	ld [wSceneObj3Unk7], a
	ld [wSceneObj4YCoord], a
	jp AdvanceCutsceneFunc

.Func_9eb9a:
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9eb9f:
	call .Func_9ebc7
	ld a, [hl]
	cp $88
	ret nz
	xor a
	ld [wSceneObj3State], a
	jp AdvanceCutsceneFunc

.Func_9ebad:
	ld a, [bc]
	cp $2d
	ret c
	play_sfx SFX_08D
	jp AdvanceCutsceneFunc

.Func_9ebbc:
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ret

.Func_9ebc7:
	ld hl, wSceneObj3Unk7
	call .Func_9ebd3
	ld hl, wSceneObj3XCoord
	add [hl]
	ld [hl], a
	ret

.Func_9ebd3:
	ld a, [hl]
	inc [hl]
	cp $30
	jr c, .asm_9ebdd
	xor a
	ld [hl], a
	jr .Func_9ebd3
.asm_9ebdd
	ld c, a
	ld b, $00
	ld hl, .data_9ebe6
	add hl, bc
	ld a, [hl]
	ret

.data_9ebe6
	db 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1

Data_9ec16:
	db  0,  0, -2,  0, -2, -1, -3,  0, -2, -1, -2, -1, -2, -1, -2, -1, -1, -1, -1, -2,  0, -3,  1, -1,  2, -2,  6, -4,  6, -3,  6, -2,  7, -2,  6, -2,  7, -2,  6, -2,  7, -1, $80

Data_9ec41:
	db  0,  0, -1,  1, -2,  1, -1,  1, -1,  1, -1,  1, -1,  1,  0,  2,  1,  1,  1,  2,  1,  0,  2,  1,  1,  1,  5,  2,  5,  1,  6,  1,  5,  1,  6,  0,  5,  1,  6,  0,  5,  0, $80

Cutscene14Func:
	call .Func_9ec73
	call Func_9fba9
	ret

.Func_9ec73:
	ld a, [w2d013]
	jumptable
	dw StartCutsceneDelay
	dw .Func_9ec9b
	dw .Func_9ecef
	dw .Func_9ed14
	dw .Func_9ed1c
	dw .Func_9ed3c
	dw .Func_9ed54
	dw .Func_9ed70
	dw .Func_9ed77
	dw .Func_9ed7c
	dw .Func_9ed9c
	dw .Func_9edb7
	dw .Func_9edc2
	dw .Func_9edf1
	dw .Func_9edf9
	dw .Func_9ee17
	dw .Func_9ee23
	dw .Func_9ee57

.Func_9ec9b:
	ld hl, wSceneObj2YCoord
	ld a, $78
	ld [hli], a
	ld [hl], $52
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj3YCoord
	ld a, $91
	ld [hli], a
	ld [hl], $44
	ld a, $02
	ld hl, wSceneObj3State
	call SetSceneObjState
	ld hl, wSceneObj4YCoord
	ld a, $91
	ld [hli], a
	ld [hl], $60
	ld a, $03
	ld hl, wSceneObj4State
	call SetSceneObjState
	ld hl, wCurSceneObj
	ld a, $bc
	ld [hli], a
	ld [hl], $50
	ld a, $02
	ld [wSceneObj1YCoord], a
	ld hl, wPalFade1
	ld [hl], $99
	inc l
	ld [hl], $6e
	inc l
	ld [hl], $e7
	inc l
	ld [hl], $6e
	inc l
	ld [hl], $33
	inc l
	ld [hl], $6f
	jp AdvanceCutsceneFunc

.Func_9ecef:
	call .Func_9ee5b
	ld a, [wGlobalCounter]
	and %1
	ret nz
	ld hl, wSceneObj2YCoord
	dec [hl]
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld hl, wSceneObj4YCoord
	dec [hl]
	ld hl, wCurSceneObj
	dec [hl]
	ld a, [hl]
	cp $87
	jp z, Func_9ce1f
	cp $74
	ret nz
	jp AdvanceCutsceneFunc

.Func_9ed14:
	call .Func_9ee5b
	ld c, $3c
	jp WaitCutsceneFunc

.Func_9ed1c:
	call .Func_9ee5b
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld hl, wSceneObj3YCoord
	inc [hl]
	ld hl, wSceneObj4YCoord
	inc [hl]
	ld hl, wCurSceneObj
	inc [hl]
	ld a, [hl]
	cp $82
	ret nz
	jp AdvanceCutsceneFunc

.Func_9ed3c:
	call .Func_9ee5b
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wCurSceneObj
	inc [hl]
	ld a, [hl]
	cp $92
	ret nz
	xor a
	ld [wSceneObj1YCoord], a
	jp AdvanceCutsceneFunc

.Func_9ed54:
	call .Func_9ee5b
	ret nc
	ld hl, wPalFade1
	ld a, $82
	ld [hli], a
	ld a, $6f
	ld [hli], a
	ld a, $e3
	ld [hli], a
	ld a, $6f
	ld [hli], a
	ld a, $44
	ld [hli], a
	ld a, $70
	ld [hli], a
	jp AdvanceCutsceneFunc

.Func_9ed70:
	call .Func_9ee5b
	ret nc
	jp AdvanceCutsceneFunc

.Func_9ed77:
	ld c, $1e
	jp WaitCutsceneFunc

.Func_9ed7c:
	ld hl, wSceneObj5
	ld a, $4c
	ld [hli], a
	ld [hl], $50
	ld a, $04
	ld hl, wSceneObj5State
	call SetSceneObjState
	xor a
	ld [wSceneObj2State], a
	ld [wSceneObj3State], a
	ld [wSceneObj4State], a
	ld [wColourFadeDiff], a
	jp AdvanceCutsceneFunc

.Func_9ed9c:
	call .Func_9eda4
	ld c, $78
	jp WaitCutsceneFunc

.Func_9eda4:
	ld hl, wColourFadeDiff
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_10F
	ret

.Func_9edb7:
	ld a, $05
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp AdvanceCutsceneFunc

.Func_9edc2:
	call .Func_9edce
	ld a, [wSceneObj5State]
	cp $06
	ret nz
	jp AdvanceCutsceneFunc

.Func_9edce:
	ld hl, wColourFadeDiff
	inc [hl]
	ld a, [hl]
	cp $0a
	ret c
	xor a
	ld [hl], a
	ld a, [wSceneObj5Frame]
	cp $09
	jr nc, .asm_9ede8
	play_sfx SFX_110
	ret
.asm_9ede8
	play_sfx SFX_111
	ret

.Func_9edf1:
	call .Func_9edce
	ld c, $5a
	jp WaitCutsceneFunc

.Func_9edf9:
	call .Func_9edce
	ld a, [w2d014]
	ld b, $01
	cp $08
	jr c, .asm_9ee0b
	inc b
	cp $10
	jr c, .asm_9ee0b
	inc b
.asm_9ee0b
	ld a, b
	ld hl, wSceneObj5
	add [hl]
	ld [hl], a
	cp $70
	ret c
	jp AdvanceCutsceneFunc

.Func_9ee17:
	call .Func_9edce
	ld a, [wColourFadeDiff]
	cp $09
	ret nz
	jp AdvanceCutsceneFunc

.Func_9ee23:
	call .Func_9ee2a
	call Func_9cd8d
	ret

.Func_9ee2a:
	ld hl, wColourFadeDiff
	inc [hl]
	ld a, [hl]
	cp $0a
	jr z, .asm_9ee3c
	cp $14
	jr z, .asm_9ee45
	cp $1e
	jr z, .asm_9ee4e
	ret
.asm_9ee3c
	play_sfx SFX_114
	ret
.asm_9ee45
	play_sfx SFX_115
	ret
.asm_9ee4e
	play_sfx SFX_116
	ret

.Func_9ee57:
	call Func_9cd16
	ret

.Func_9ee5b:
	ld bc, wPalFade1Colour1RedUnk1
	ld hl, wSceneObj4
	call .Func_9ee77
	ld bc, wPalFade1Colour1RedSign
	ld hl, wSceneObj3
	call .Func_9ee77
	ld bc, wPalFade1
	ld hl, wSceneObj2
	call .Func_9ee77
	ret

.Func_9ee77:
	ld a, [bc]
	ld e, a
	inc c
	ld a, [bc]
	ld d, a
	dec c
	ld a, [de]
	add [hl]
	ld [hli], a
	inc de
	ld a, [de]
	add [hl]
	ld [hl], a
	inc de
	ld a, [de]
	cp $80
	jr nz, .Func_9ee92
	ld de, .data_9ee99
	call .Func_9ee92
	scf
	ret

.Func_9ee92
	ld a, e
	ld [bc], a
	inc c
	ld a, d
	ld [bc], a
	and a
	ret

.data_9ee99
	db  0, -1,  0, -1,  0, -1,  0, -1,  1, -1,  0, -1,  0, -1,  0,  0,  1, -1,  0, -1,  1,  0,  0, -1,  1,  0,  0, -1,  1, -1,  1,  0,  0, -1,  1,  0,  0, -1,  1,  0,  1, -1,  0,  0,  1,  0,  1,  0,  1, -1,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  1,  1,  0,  1,  0,  0,  0,  1,  1,  1,  0,  0,  1,  1,  0,  0,  1,  1,  0,  1,  1,  0,  1,  1,  0,  0,  1,  1,  0,  0,  1,  1,  1,  0,  0,  0,  1,  0,  1,  1,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1,  0,  1, -1,  1,  0,  1,  0,  1,  0,  0, -1,  1,  0,  1, -1,  0,  0,  1, -1,  0,  0,  1, -1,  1, -1,  0,  0,  1, -1,  0,  0,  1, -1,  0, -1,  1,  0,  0, -1,  0, -1,  0, -1,  1, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1,  0, -1, -1, -1,  0, -1,  0,  0,  0, -1, -1, -1,  0,  0, -1, -1,  0,  0, -1, -1,  0, -1, -1,  0, -1, -1,  0,  0, -1, -1,  0,  0, -1, -1, -1,  0,  0,  0, -1,  0, -1, -1, -1,  0, -1,  0, -1,  0, -1,  0, -1, $80

; unreferenced
Data_9ef82:
	db  0,  0,  0, -1,  0,  0,  0, -1,  0,  0,  1, -1,  0,  0,  0, -1,  0,  0,  1, -1,  0,  0,  1, -1,  0,  0,  0,  0,  1, -1,  0,  0,  1,  0,  0,  0,  1, -1,  0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  1,  1,  0,  0,  1,  0,  0,  0,  1,  1,  0,  0,  0,  0,  1,  1,  0,  0,  1,  1,  0,  0,  0,  1,  0,  0,  1,  1,  0,  0,  0,  1,  0,  0,  0,  1,  0,  0, $80
	db  0,  1,  1,  0,  0,  1,  1,  0,  0,  0,  0,  1,  1,  0,  0,  1,  0,  0,  0,  1,  0,  0,  1,  1,  0,  0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  1,  0,  0,  0,  1, -1,  0,  0,  1,  0,  0,  0,  1,  0,  0, -1,  1,  0,  0,  0,  0, -1,  1,  0,  0, -1,  1,  0,  0, -1,  0,  0,  0, -1,  1,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0,  0, -1, -1,  0,  0,  0, $80
	db -1,  0,  0,  0, -1,  1,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0, -1,  0,  0,  0, -1, -1,  0,  0, -1,  0,  0,  0, -1, -1,  0,  0,  0,  0, -1, -1,  0,  0,  0,  0, -1, -1,  0,  0,  0,  0,  0,  0,  0, -1, -1,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  0,  0,  0, -1,  1,  0,  0, -1,  0,  0,  0,  0,  1, -1,  0,  0,  0,  0,  1, -1,  0, -1,  1,  0, $80

Func_9f0a5:
	dec a
	call GetPointerFromTableDE
	dec c
	dec c
	ld l, c
	ld h, b
	ret

Func_9f0ae:
	ld b, $2f
	call UpdateOWAnimation
	ld a, [bc]
	ret

Func_9f0b5:
	ld b, $1a
	call UpdateOWAnimation
	ld a, [bc]
	ret

; de = OAM
Func_9f0bc:
	ld b, $2f
	jp AddOWSprite

; de = OAM
Func_9f0c1:
	ld b, $62
	jp AddOWSprite

; de = OAM
Func_9f0c6:
	ld b, $60
	jp AddOWSprite

; de = OAM
Func_9f0cb:
	ld b, $63
	jp AddOWSprite

Func_9f0d0:
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	set 2, l
	xor a
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hl], a
	ld b, h
	ld c, l
	ret

Func_9f0e0:
	ld bc, wSceneObj3State
	call .asm_9f0e9
	ld bc, wSceneObj2State
.asm_9f0e9
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $05
	jr z, .asm_9f103
	cp $06
	jr z, .asm_9f107
.asm_9f0fd
	ld de, OAM_bd1fd
	jp Func_9f0bc
.asm_9f103
	ld b, $00
	jr .asm_9f109
.asm_9f107
	ld b, $07
.asm_9f109
	call Func_9f0d0
	jr z, .asm_9f0e9
	jr .asm_9f0fd

.framesets
	dw Frameset_bd348
	dw Frameset_bd34b
	dw Frameset_bd34e
	dw Frameset_bd351
	dw Frameset_bd354
	dw Frameset_bd363
	dw Frameset_bd372

Func_9f11e:
	ld bc, wSceneObj2State
.asm_9f121
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f137

.asm_9f131
	ld de, OAM_bd377
	jp Func_9f0bc

.asm_9f137
	ld b, $03
	call Func_9f0d0
	jr z, .asm_9f121 ; ?? this will never happen
	jr .asm_9f131

.framesets
	dw Frameset_bd43a
	dw Frameset_bd43d
	dw Frameset_bd44a

Func_9f146:
	ld bc, wSceneObj2State
	call .Func_9f15e
	ld bc, wSceneObj3State
	call .Func_9f15e
	ld de, wSceneObj2
	call Func_9fb97
	ld de, wSceneObj3
	jp Func_9fba0

.Func_9f15e
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bd453
	jp Func_9f0bc

.framesets
	dw Frameset_bd469 
	dw Frameset_bd46c

Func_9f174:
	ld bc, wSceneObj4State
	call .Func_9f189
	ld bc, wSceneObj2State
	call .Func_9f189
	ld bc, wSceneObj3State
	call .Func_9f189
	ld bc, wSceneObj5State
;	fallthrough

.Func_9f189
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $06
	jr z, .asm_9f1a8
	cp $08
	jr z, .asm_9f1ac
	cp $05
	call z, .Func_9f1b5
.asm_9f1a2
	ld de, OAM_bd46f
	jp Func_9f0bc
.asm_9f1a8
	ld b, $07
	jr .asm_9f1ae
.asm_9f1ac
	ld b, $00
.asm_9f1ae
	call Func_9f0d0
	jr z, .Func_9f189
	jr .asm_9f1a2

.Func_9f1b5
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_10A
	ret

.framesets
	dw Frameset_bd5c3
	dw Frameset_bd5cc
	dw Frameset_bd5d5
	dw Frameset_bd5d8
	dw Frameset_bd5dd
	dw Frameset_bd5e6
	dw Frameset_bd605
	dw Frameset_bd608
	dw Frameset_bd60f
	dw Frameset_bd612

Func_9f1d8:
	ld bc, wSceneObj2State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bd615
	jp Func_9f0bc

.framesets
	dw Frameset_bd790
	dw Frameset_bd793
	dw Frameset_bd79c

Func_9f1f3:
	ld de, wSceneObj2
	call Func_9fb75
	ld de, wSceneObj2
	call Func_9fb97
	ld bc, wSceneObj2State
	call .Func_9f20b
	ld de, wSceneObj2
	jp Func_9fb7e

.Func_9f20b:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bd7a1
	jp Func_9f0bc

.framesets
	dw Frameset_bd905
	dw Frameset_bd908
	dw Frameset_bd90b
	dw Frameset_bd90e

Func_9f225:
	ld bc, wSceneObj2State
	call .Func_9f22e
	ld bc, wSceneObj3State
.Func_9f22e:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bd911
	jp Func_9f0bc

.framesets
	dw Frameset_bd96b
	dw Frameset_bd96e

Func_9f244:
	ld bc, wSceneObj5State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0b5
	cp $02
	jr z, .asm_9f266
	cp $01
	jr z, .asm_9f27a
.asm_9f25b
	ld de, OAM_188e16
	call Func_9f0c1
	ret

.framesets
	dw Frameset_692e7
	dw Frameset_69335

.asm_9f266
	call .Func_9f26b
	jr .asm_9f25b

.Func_9f26b:
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_071
	ret

.asm_9f27a
	call .Func_9f27f
	jr .asm_9f25b

.Func_9f27f:
	ld d, h
	ld e, l
	set 1, e
	ld a, [de]
	ld c, a
	set 0, e
	set 2, e
	ld a, [de]
	and a
	ld a, $01
	jr nz, .asm_9f295
	cp c
	ret z
	ld a, $01
	ld [de], a
	ret
.asm_9f295
	cp c
	ret nz
	xor a
	ld [de], a
	play_sfx SFX_011
	ret

Func_9f2a2:
	ld bc, wSceneObj2State
	call .Func_9f2b1
	ld bc, wSceneObj4State
	call .Func_9f2b1
	ld bc, wSceneObj3State
.Func_9f2b1
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bd971
	jp Func_9f0bc

.framesets
	dw Frameset_bd9ec
	dw Frameset_bd9f5
	dw Frameset_bd9f8
	dw Frameset_bd9fb
	dw Frameset_bd9fe

Func_9f2cd:
	ld bc, wSceneObj2State
.asm_9f2d0
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $01
	jr z, .asm_9f2e6
.asm_9f2e0
	ld de, OAM_bda01
	jp Func_9f0bc
.asm_9f2e6
	ld b, $02
	call Func_9f0d0
	jr z, .asm_9f2d0
	jr .asm_9f2e0

.framesets
	dw Frameset_bdaa2
	dw Frameset_bdab9

Func_9f2f3:
	ld bc, wSceneObj2State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0b5
	cp $03
	call z, .Func_9f30e
	ld de, OAM_188279
	call Func_9f0c1
	ret

.Func_9f30e
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_06D
	ret

.framesets
	dw Frameset_691a7
	dw Frameset_691bc
	dw Frameset_691bf

Func_9f323:
	ld de, wSceneObj2
	call Func_9fb97
	ld bc, wSceneObj2State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bdabc
	jp Func_9f0bc

.framesets
	dw Frameset_bdb03

Func_9f340:
	ld bc, wSceneObj3State
	call .Func_9f34f
	ld bc, wSceneObj4State
	call .Func_9f34f
	ld bc, wSceneObj2State
.Func_9f34f:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bdb06
	jp Func_9f0bc

.framesets
	dw Frameset_bdc5f
	dw Frameset_bdc62
	dw Frameset_bdc7f

Func_9f367:
	ld de, wSceneObj3
	call Func_9fb4c
	ld bc, wSceneObj2State
	call .Func_9f379
	ld de, wSceneObj3
	jp Func_9fb6c

.Func_9f379:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bdc9c
	jp Func_9f0bc

.framesets
	dw Frameset_bdce3

Func_9f38d:
	ld bc, wSceneObj2State
	call .asm_9f3a2
	ld bc, wSceneObj3State
	call .asm_9f3a2
	ld bc, wSceneObj4State
	call .asm_9f3a2
	ld bc, wSceneObj5State
.asm_9f3a2
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $04
	jr z, .asm_9f3b8
.asm_9f3b2
	ld de, OAM_bdce6
	jp Func_9f0bc
.asm_9f3b8
	ld b, $01
	call Func_9f0d0
	jr z, .asm_9f3a2
	jr .asm_9f3b2

.framesets
	dw Frameset_bddcc
	dw Frameset_bddc3
	dw Frameset_bddc6
	dw Frameset_bdda9
	dw Frameset_bddc0
	dw Frameset_bddc9

Func_9f3cd:
	ld bc, wSceneObj3State
	call .Func_9f3d6
	ld bc, wSceneObj2State
.Func_9f3d6:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bddcf
	jp Func_9f0bc

.framesets
	dw Frameset_bde60
	dw Frameset_bde63
	dw Frameset_bde66

Func_9f3ee:
	ld bc, wSceneObj2State
	call .Func_9f3f7
	ld bc, wSceneObj3State
.Func_9f3f7
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $03
	call z, .Func_9f414
	ld de, OAM_bde69
	jp Func_9f0bc

.framesets
	dw Frameset_bdf92
	dw Frameset_bdf95
	dw Frameset_bdfa0

.Func_9f414
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_131
	ret

Func_9f423:
	ld bc, wSceneObj2State
	call .asm_9f42c
	ld bc, wSceneObj3State
.asm_9f42c
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f446
	cp $03
	jr z, .asm_9f47e
.asm_9f440
	ld de, OAM_bdfa5
	jp Func_9f0bc
.asm_9f446
	call .Func_9f45a
	ld b, $03
	call Func_9f0d0
	jr z, .asm_9f42c
	jr .asm_9f440

.framesets
	dw Frameset_be1b0
	dw Frameset_be1c3
	dw Frameset_be1fc
	dw Frameset_be203

.Func_9f45a
	ld a, [wSceneObj3Frame]
	ld c, a
	ld a, [wSceneObj3Unk7]
	ld b, a
	and a
	jr z, .asm_9f46b
	ld a, $08
	cp c
	ret nz
	jr .asm_9f46f
.asm_9f46b
	ld a, $07
	cp c
	ret nz
.asm_9f46f
	ld a, b
	xor $1
	ld [wSceneObj3Unk7], a
	play_sfx SFX_FAT_WALK
	ret
.asm_9f47e
	call .Func_9f483
	jr .asm_9f440

.Func_9f483
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f493
	cp $1a
	ret c
	xor a
	ld [de], a
	ret
.asm_9f493
	play_sfx SFX_076
	ret

Func_9f49c:
	ld bc, wSceneObj2State
	call .Func_9f4b1
	ld bc, wSceneObj3State
	call .Func_9f4b1
	ld bc, wSceneObj4State
	call .Func_9f4b1
	ld bc, wSceneObj5State

.Func_9f4b1:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $01
	jr z, .asm_9f4d3
	cp $02
	jr z, .asm_9f4ec
.asm_9f4c5
	ld de, OAM_be206
	jp Func_9f0bc

.framesets
	dw Frameset_be2b9
	dw Frameset_be2c2
	dw Frameset_be2d3
	dw Frameset_be2d6

.asm_9f4d3
	call .Func_9f4d8
	jr .asm_9f4c5

.Func_9f4d8:
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $0c
	ret c
	xor a
	ld [de], a
	play_sfx SFX_133
	ret

.asm_9f4ec
	call .Func_9f4d8
	call .Func_9f4f4
	jr .asm_9f4c5

.Func_9f4f4:
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $10
	ret c
	xor a
	ld [de], a
	play_sfx SFX_132
	ret

Func_9f508:
	ld de, wSceneObj2
	call Func_9fb97
	ld bc, wSceneObj2State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $01
	jr z, .asm_9f529
.asm_9f521
	ld de, OAM_be2d9
	jp Func_9f0bc

.framesets
	dw Frameset_be3c5

.asm_9f529
	call .Func_9f52e
	jr .asm_9f521

.Func_9f52e:
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f53e
	cp $0e
	ret c
	xor a
	ld [de], a
	ret
.asm_9f53e
	play_sfx SFX_01E
	ret

Func_9f547:
	ld de, wSceneObj2
	call Func_9fb4c
	ld bc, wSceneObj2State
	call .asm_9f559
	ld de, wSceneObj2
	jp Func_9fb6c

.asm_9f559
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f573
	cp $03
	jr z, .asm_9f582
.asm_9f56d
	ld de, OAM_be3ce
	jp Func_9f0bc

.asm_9f573
	ld b, $03
	call Func_9f0d0
	jr z, .asm_9f559
	jr .asm_9f56d

.framesets
	dw Frameset_be7e6
	dw Frameset_be7e9
	dw Frameset_be802

.asm_9f582
	call .Func_9f587
	jr .asm_9f56d

.Func_9f587:
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f597
	cp $10
	ret c
	xor a
	ld [de], a
	ret
.asm_9f597
	play_sfx SFX_040
	ret

Func_9f5a0:
	ld bc, wSceneObj4State
	call .Func_9f5bb
	ld bc, wSceneObj6State
	call .Func_9f5bb
	ld bc, wSceneObj2State
	call .Func_9f5bb
	ld bc, wSceneObj3State
	call .Func_9f5bb
	ld bc, wSceneObj5State
.Func_9f5bb
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f5d1
.asm_9f5cb
	ld de, OAM_be807
	jp Func_9f0bc
.asm_9f5d1
	call .Func_9f5e5
	ld b, $03
	call Func_9f0d0
	jr z, .Func_9f5bb
	jr .asm_9f5cb

.framesets
	dw Frameset_be8de
	dw Frameset_be8e1
	dw Frameset_be8ea
	dw Frameset_be8ed

.Func_9f5e5
	ld a, [wSceneObj2Frame]
	ld c, a
	ld a, [wSceneObj2Unk7]
	ld b, a
	and a
	ld a, $03
	jr z, .asm_9f5f6
	cp c
	ret z
	jr .asm_9f600
.asm_9f5f6
	cp c
	ret nz
	play_sfx SFX_0BA
.asm_9f600
	ld a, b
	xor $1
	ld [wSceneObj2Unk7], a
	ret

Func_9f607:
	ld bc, wSceneObj2State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f624
.asm_9f61a
	ld de, OAM_be8fe
	jp Func_9f0bc

.framesets
	dw Frameset_be9fa
	dw Frameset_be9fd

.asm_9f624
	call .Func_9f629
	jr .asm_9f61a

.Func_9f629:
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_085
	ret

Func_9f638:
	ld bc, wSceneObj2State
	call .asm_9f659
	ld bc, wSceneObj3State
	call .asm_9f659
	ld bc, wSceneObj4State
	call .asm_9f659
	ld bc, wSceneObj5State
	call .asm_9f659
	ld bc, wSceneObj6State
	call .asm_9f659
	ld bc, wSceneObj7State
.asm_9f659
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $04
	jr z, .asm_9f673
	cp $02
	jr z, .asm_9f684
.asm_9f66d
	ld de, OAM_bea06
	jp Func_9f0bc
.asm_9f673
	ld b, $00
	call Func_9f0d0
	jr z, .asm_9f659
	jr .asm_9f66d

.framesets
	dw Frameset_beacc
	dw Frameset_beacf
	dw Frameset_beae4
	dw Frameset_beaed

.asm_9f684
	call .Func_9f689
	jr .asm_9f66d

.Func_9f689
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f699
	cp $48
	ret c
	xor a
	ld [de], a
	ret
.asm_9f699
	play_sfx SFX_10E
	ret

Func_9f6a2:
	ld bc, wSceneObj4State
	call .asm_9f6b1
	ld bc, wSceneObj2State
	call .asm_9f6b1
	ld bc, wSceneObj3State
.asm_9f6b1
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f6cf
	cp $05
	jr z, .asm_9f6dd
	cp $06
	jr z, .asm_9f6e1
.asm_9f6c9
	ld de, OAM_beafc
	jp Func_9f0bc

.asm_9f6cf
	ld b, $03
	call Func_9f0d0
	jr nz, .asm_9f6c9
	ld a, $04
	ld [wSceneObj3State], a
	jr .asm_9f6b1
.asm_9f6dd
	ld b, $00
	jr .asm_9f6e3
.asm_9f6e1
	ld b, $07
.asm_9f6e3
	call Func_9f0d0
	jr z, .asm_9f6b1
	jr .asm_9f6c9

.framesets
	dw Frameset_bebda
	dw Frameset_bebcc
	dw Frameset_bebdd
	dw Frameset_bebe0
	dw Frameset_bebd3
	dw Frameset_bebe3
	dw Frameset_bebec

Func_9f6f8:
	ld bc, wSceneObj2State
	call .Func_9f701
	ld bc, wSceneObj3State
.Func_9f701:
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f71d
.asm_9f711
	ld de, OAM_bebef
	jp Func_9f0bc

.framesets
	dw Frameset_becc7
	dw Frameset_becca
	dw Frameset_becd3

.asm_9f71d
	call .Func_9f722
	jr .asm_9f711

.Func_9f722:
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f732
	cp $0c
	ret c
	xor a
	ld [de], a
	ret
.asm_9f732
	play_sfx SFX_07D
	ret

Func_9f73b:
	ld bc, wSceneObj2State
	call .asm_9f744
	ld bc, wSceneObj3State
.asm_9f744
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_becdc
	jp Func_9f0bc

.framesets
	dw Frameset_bed39
	dw Frameset_bed3c
	dw Frameset_bed3f

Func_9f75c:
	ld bc, wSceneObj2State
	call .asm_9f765
	ld bc, wSceneObj4State
.asm_9f765
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f783
	cp $04
	jr z, .asm_9f787
	cp $06
	jr z, .asm_9f78b
.asm_9f77d
	ld de, OAM_bed42
	jp Func_9f0bc
.asm_9f783
	ld b, $00
	jr .asm_9f78d
.asm_9f787
	ld b, $00
	jr .asm_9f78d
.asm_9f78b
	ld b, $07
.asm_9f78d
	call Func_9f0d0
	jr z, .asm_9f765
	jr .asm_9f77d

.framesets
	dw Frameset_bee4d
	dw Frameset_bee50
	dw Frameset_bee55
	dw Frameset_bee58
	dw Frameset_bee5d
	dw Frameset_bee60
	dw Frameset_bee6b

Func_9f7a2:
	ld bc, wSceneObj3State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0b5
	ld de, OAM_180b43
	jp Func_9f0c6

.framesets
	dw Frameset_68439
	dw Frameset_684ba

Func_9f7bb:
	ld bc, wSceneObj2State
	call .asm_9f7c4
	ld bc, wSceneObj3State
.asm_9f7c4
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bee6e
	jp Func_9f0bc

.framesets
	dw Frameset_befbe
	dw Frameset_befc1
	dw Frameset_befc4

Func_9f7dc:
	ld bc, wSceneObj2State
.asm_9f7df
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f7f9
	cp $03
	jr z, .asm_9f808
.asm_9f7f3
	ld de, OAM_befd5
	jp Func_9f0bc
.asm_9f7f9
	ld b, $03
	call Func_9f0d0
	jr z, .asm_9f7df
	jr .asm_9f7f3

.framesets
	dw Frameset_bf100
	dw Frameset_bf103
	dw Frameset_bf110

.asm_9f808
	call .Func_9f80d
	jr .asm_9f7f3

.Func_9f80d
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $1a
	ret c
	xor a
	ld [de], a
	play_sfx SFX_076
	ret

Func_9f821:
	ld bc, wSceneObj3State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0b5
	cp $01
	jr z, .asm_9f83e
.asm_9f834
	ld de, OAM_18aba0
	jp Func_9f0c1

.framesets
	dw Frameset_69c0a
	dw Frameset_69c13

.asm_9f83e
	call .Func_9f843
	jr .asm_9f834

.Func_9f843
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $0e
	ret c
	xor a
	ld [de], a
	play_sfx SFX_01E
	ret

Func_9f857:
	ld hl, wSceneObj2State
	ld a, [hld]
	and a
	ret z
	dec l
	ld de, Frameset_bf154
	call Func_9f0ae
	ld de, OAM_bf131
	jp Func_9f0bc

Func_9f86a:
	ld bc, wSceneObj2State
	call .asm_9f873
	ld bc, wSceneObj3State
.asm_9f873
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f8a3
	cp $03
	jr z, .asm_9f88d
.asm_9f887
	ld de, OAM_bf157
	jp Func_9f0bc
.asm_9f88d
	call .Func_9f8c1
	ld b, $05
	call Func_9f0d0
	jr z, .asm_9f873
	jr .asm_9f887

.framesets
	dw Frameset_bf28c
	dw Frameset_bf28f
	dw Frameset_bf298
	dw Frameset_bf2a5
	dw Frameset_bf2a8

.asm_9f8a3
	call .Func_9f8a8
	jr .asm_9f887

.Func_9f8a8
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f8b8
	cp $1a
	ret c
	xor a
	ld [de], a
	ret
.asm_9f8b8
	play_sfx SFX_076
	ret

.Func_9f8c1
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $01
	jr z, .asm_9f8d1
	cp $0a
	ret c
	xor a
	ld [de], a
	ret
.asm_9f8d1
	play_sfx SFX_0C4
	ret

Func_9f8da:
	ld bc, wSceneObj2State
	call .asm_9f8e3
	ld bc, wSceneObj3State
.asm_9f8e3
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $03
	jr z, .asm_9f8f9
	.asm_9f8f3
	ld de, OAM_bf2ab
	jp Func_9f0bc
.asm_9f8f9
	ld b, $00
	call .Func_9f912
	ld hl, wSceneObj2Unk7
	ld a, [hl]
	and a
	ret nz
	ld a, [wSceneObj2Frame]
	cp $07
	ret nz
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	ld [hl], $01
	ret

.Func_9f912
	call Func_9f0d0
	jr z, .asm_9f8e3
	jr .asm_9f8f3

.framesets
	dw Frameset_bf43b
	dw Frameset_bf45d
	dw Frameset_bf43e

Func_9f91f:
	ld bc, wSceneObj2State
.asm_9f922
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $01
	jr z, .asm_9f93c
	cp $02
	jr z, .asm_9f943
.asm_9f936
	ld de, OAM_bf460
	jp Func_9f0bc
.asm_9f93c
	call .Func_9f953
	ld b, $02
	jr .asm_9f948
.asm_9f943
	call .Func_9f953
	ld b, $01
.asm_9f948
	call Func_9f0d0
	jr z, .asm_9f922
	jr .asm_9f936

.framesets
	dw Frameset_bf5e0
	dw Frameset_bf5e0

.Func_9f953
	ld a, [wSceneObj2Frame]
	ld c, a
	ld a, [wSceneObj2Unk7]
	ld b, a
	and a
	jr z, .asm_9f96a
	ld a, c
	cp $02
	ret z
	cp $04
	ret z
	cp $05
	ret z
	jr .asm_9f98a
.asm_9f96a
	ld a, c
	cp $02
	jr z, .asm_9f978
	cp $04
	jr z, .asm_9f982
	cp $05
	jr z, .asm_9f982
	ret nz
.asm_9f978
	play_sfx SFX_011
	jr .asm_9f98a
.asm_9f982
	play_sfx SFX_0F1
.asm_9f98a
	ld a, b
	xor $01
	ld [wSceneObj2Unk7], a
	ret

Func_9f991:
	ld bc, wSceneObj2State
	call .asm_9f99a
	ld bc, wSceneObj3State
.asm_9f99a
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $04
	jr z, .asm_9f9b0
.asm_9f9aa
	ld de, OAM_bf611
	jp Func_9f0bc
.asm_9f9b0
	ld b, $03
	call Func_9f0d0
	jr z, .asm_9f99a
	jr .asm_9f9aa

.framesets
	dw Frameset_bf65d
	dw Frameset_bf660
	dw Frameset_bf665
	dw Frameset_bf668

Func_9f9c1:
	ld bc, wSceneObj11State
	call .asm_9f9d0
	ld bc, wSceneObj10State
	call .asm_9f9d0
	ld bc, wSceneObj2State
.asm_9f9d0
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9f9e6
.asm_9f9e0
	ld de, OAM_bf66d
	jp Func_9f0bc
.asm_9f9e6
	ld b, $01
	call Func_9f0d0
	jr z, .asm_9f9d0
	jr .asm_9f9e0

.framesets
	dw Frameset_bf6df
	dw Frameset_bf6e2
	dw Frameset_bf6ed

Func_9f9f5:
	ld bc, wSceneObj3State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0b5
	cp $01
	jr z, .asm_9fa16
	cp $02
	jr z, .asm_9fa2f
.asm_9fa0c
	ld de, OAM_18c806
	jp Func_9f0cb

.framesets
	dw Frameset_6a052
	dw Frameset_6a05f

.asm_9fa16
	call .Func_9fa1b
	jr .asm_9fa0c

.Func_9fa1b
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $1b
	ret c
	xor a
	ld [de], a
	play_sfx SFX_135
	ret
.asm_9fa2f
	call .Func_9fa34
	jr .asm_9fa0c

.Func_9fa34
	ld de, wSceneObj3Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $1b
	ret c
	xor a
	ld [de], a
	play_sfx SFX_080
	ret

Func_9fa48:
	ld bc, wSceneObj10State
	call .asm_9fa7b
	ld bc, wSceneObj11State
	call .asm_9fa7b
	ld bc, wSceneObj2State
	call .asm_9fa7b
	ld bc, wSceneObj3State
	call .asm_9fa7b
	ld bc, wSceneObj4State
	call .asm_9fa7b
	ld bc, wSceneObj5State
	call .asm_9fa7b
	ld bc, wSceneObj6State
	call .asm_9fa7b
	ld bc, wSceneObj7State
	call .asm_9fa7b
	ld bc, wSceneObj8State
.asm_9fa7b
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $02
	jr z, .asm_9fa9b
.asm_9fa8b
	ld de, OAM_bf6f0
	jp Func_9f0bc

.framesets
	dw Frameset_bf826
	dw Frameset_bf829
	dw Frameset_bf832
	dw Frameset_bf835
	dw Frameset_bf83e

.asm_9fa9b
	call .Func_9faa0
	jr .asm_9fa8b

.Func_9faa0
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $0c
	ret c
	xor a
	ld [de], a
	play_sfx SFX_PLANE1
	ret

Func_9fab4:
	ld bc, wSceneObj2State
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	cp $01
	jr z, .asm_9fad1
.asm_9fac7
	ld de, OAM_bf847
	jp Func_9f0bc

.framesets
	dw Frameset_bf923
	dw Frameset_bf92a

.asm_9fad1
	call .Func_9fad6
	jr .asm_9fac7

.Func_9fad6:
	ld de, wSceneObj2Unk7
	ld a, [de]
	inc a
	ld [de], a
	cp $30
	ret c
	xor a
	ld [de], a
	play_sfx SFX_08E
	ret

Func_9faea:
	ld bc, wSceneObj3State
.asm_9faed
	ld a, [bc]
	and a
	ret z
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0b5
	cp $01
	jr z, .asm_9fb1a
	cp $03
	jr z, .asm_9fb33
	cp $02
	jr z, .asm_9fb0b
.asm_9fb05
	ld de, OAM_18a895
	jp Func_9f0c1
.asm_9fb0b
	ld b, $03
	call Func_9f0d0
	jr z, .asm_9faed
	jr .asm_9fb05

.framesets
	dw Frameset_69b38
	dw Frameset_69ba0
	dw Frameset_69b60

.asm_9fb1a
	call .Func_9fb1f
	jr .asm_9fb05

.Func_9fb1f:
	ld de, wSceneObj4YCoord
	ld a, [de]
	inc a
	ld [de], a
	cp $28
	ret c
	xor a
	ld [de], a
	play_sfx SFX_08F
	ret

.asm_9fb33
	call .Func_9fb38
	jr .asm_9fb05

.Func_9fb38:
	ld de, wSceneObj4YCoord
	ld a, [de]
	inc a
	ld [de], a
	cp $28
	ret c
	xor a
	ld [de], a
	play_sfx SFX_083
	ret

Func_9fb4c:
	ld c, $00
	ld hl, wCurSceneObj
	ld b, $01
;	fallthrough

; b = y coord
; c = frame
Func_9fb53:
	ld a, [wSceneObj1YCoord]
	cp b
	ret nz
	ld a, [de]
	ld [hli], a ; y
	inc e
	ld a, [de]
	ld [hli], a ; x
	ld a, c
	ld [hli], a ; frame
	xor a
	ld [hl], a ; attributes
;	fallthrough

Func_9fb61:
	ld de, OAM_bc000
	ld a, $fc
	and l
	ld l, a
	call Func_9f0bc
	ret

Func_9fb6c:
	ld c, $01
	ld hl, wCurSceneObjDuration
	ld b, $01
	jr Func_9fb53

Func_9fb75:
	ld c, 2
	ld hl, wCurSceneObjDuration
	ld b, $01
	jr Func_9fb53

Func_9fb7e:
	ld c, 3
	ld hl, wCurSceneObjDuration
	ld b, $01
	jr Func_9fb53

Func_9fb87:
	ld a, [wSceneObj1YCoord]
	cp $02
	ret nz
	ld hl, wCurSceneObjFrame
	ld a, $04
	ld [hli], a
	xor a
	ld [hl], a
	jr Func_9fb61

; de = scene obj
Func_9fb97:
	ld hl, wCurSceneObj
	ld c, 5
	ld b, $03
	jr Func_9fb53

; de = scene obj
Func_9fba0:
	ld hl, wCurSceneObjDuration
	ld c, 6
	ld b, $03
	jr Func_9fb53

Func_9fba9:
	call Func_9fb87
	ld bc, wSceneObj4State
	call .Func_9fbc5
	ld bc, wSceneObj2State
	call .Func_9fbc5
	ld bc, wSceneObj3State
	call .Func_9fbc5
	ld bc, wSceneObj5State
	call .Func_9fbc5
	ret

.Func_9fbc5:
	ld a, [bc]
	and a
	ret z
	cp $05
	jr z, .asm_9fbdc
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
.asm_9fbd5
	ld de, OAM_bcfb3
	call Func_9f0bc
	ret
.asm_9fbdc
	ld hl, .framesets
	call Func_9f0a5
	call Func_9f0ae
	ld b, $06
	call Func_9f0d0
	jr z, .Func_9fbc5
	jr .asm_9fbd5

.framesets
	dw Frameset_bd1b7
	dw Frameset_bd1ba
	dw Frameset_bd1bd
	dw Frameset_bd1c0
	dw Frameset_bd1c5
	dw Frameset_bd1f8

Func_9fbfa:
	ld de, wSceneObj2
	call Func_9fb4c
	call .Func_9fc09
	ld de, wSceneObj2
	jp Func_9fb6c

.Func_9fc09:
	ld a, [wSceneObj2State]
	and a
	ret z
	ld de, Frameset_bd1b4
	ld hl, wSceneObj2Duration
	call Func_9f0ae
	ld de, OAM_bcfb3
	jp Func_9f0bc

Func_9fc1d:
	ld de, wSceneObj2
	call Func_9fb4c
	call .Func_9fc2c
	ld de, wSceneObj2
	jp Func_9fb6c

.Func_9fc2c:
	ld a, [wSceneObj2State]
	and a
	ret z
	dec a
	ld hl, .framesets
	call GetPointerFromTableDE
	ld hl, wSceneObj2Duration
	call Func_9f0ae
	ld de, OAM_bc1f6
	jp Func_9f0bc

.framesets
	dw Frameset_bcf15
	dw Frameset_bcf18
	dw Frameset_bcf21
	dw Frameset_bcf24
	dw Frameset_bcf35
	dw Frameset_bcf38
	dw Frameset_bcf49
	dw Frameset_bcf4c
	dw Frameset_bcf6d
	dw Frameset_bcf70

Func_9fc58:
.start
	ld de, wSceneObj2
	call Func_9fb97
	ld hl, wSceneObj2State
	ld a, [hld]
	and a
	ret z
	dec l
	ld b, $2f
	dec a
	jr z, .one
	dec a
	jr z, .two
	; invalid value
	debug_nop
.one
	ld de, Frameset_bc1f3
	call UpdateOWAnimation
	jr .asm_9fc85
.two
	ld de, Frameset_bc1e8
	call UpdateOWAnimation
	ld b, $00
	call Func_9f0d0
	jr z, .start
.asm_9fc85
	ld de, OAM_bc122
	jp Func_9f0bc

Pals_9fc8b:
	rgb  6,  7, 16
	rgb  2,  5, 17
	rgb  0,  4, 14
	rgb  0,  0, 11

Pals_9fc93:
	rgb 12, 15, 22
	rgb  4,  9, 21
	rgb  0,  5, 18
	rgb  0,  0, 11

Pals_9fc9b:
	rgb 16, 21, 26
	rgb  6, 15, 27
	rgb  0,  6, 21
	rgb  0,  0, 11

Pals_9fca3:
	rgb 21, 28, 31
	rgb  8, 19, 31
	rgb  0,  7, 23
	rgb  0,  0, 11

	ds $355, $00
