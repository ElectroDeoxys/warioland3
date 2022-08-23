Func_9c000: ; 9c000 (27:4000)
	xor a
	ld [w2d01e], a
	ret
; 0x9c005

Func_9c005: ; 9c005 (27:4005)
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
; 0x9c021

Func_9c021: ; 9c021 (27:4021)
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
; 0x9c072

Func_9c072: ; 9c072 (27:4072)
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
	dw Func_9c000  ; CUTSCENE_00
	dw .Func_9c15e ; CUTSCENE_01
	dw .Func_9c16e ; CUTSCENE_02
	dw .Func_9c187 ; CUTSCENE_03
	dw .Func_9c19d ; CUTSCENE_04
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
; 0x9c15e

.Func_9c15e: ; 9c15e (27:415e)
	farcall _InitPrologueSequence
	ret
; 0x9c16e

.Func_9c16e: ; 9c16e (27:416e)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c00)
	ld hl, Pals_b8c00
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca6a
	jp Func_9cba2
; 0x9c187

.Func_9c187: ; 9c187 (27:4187)
	ld b, BANK(Pals_b8240)
	ld hl, Pals_b8240
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b88c0)
	ld hl, Pals_b88c0
	call LoadFarPalsToTempPals2
	call LoadCutscenes3Gfx
	jp Func_9ca84
; 0x9c19d

.Func_9c19d: ; 9c19d (27:419d)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8ec0)
	ld hl, Pals_b8ec0
	call LoadFarPalsToTempPals2
	call LoadCutscenes8Gfx
	call Func_9ca6a
	jp Func_9cba2
; 0x9c1b6

.Func_9c1b6: ; 9c1b6 (27:41b6)
	call LoadCutscenes3Gfx

	decompress_vram1 BGMap_b956d, v1BGMap0
	decompress BGMap_b951f, v0BGMap0

	ld b, BANK(Pals_b8080)
	ld hl, Pals_b8080
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8900)
	ld hl, Pals_b8900
	call LoadFarPalsToTempPals2
	jp Func_9d01a
; 0x9c209

.Func_9c209: ; 9c209 (27:4209)
	call LoadCutscenes1Gfx

	decompress_vram1 BGMap_b9424, v1BGMap0
	decompress BGMap_b93c8, v0BGMap0

	ld b, BANK(Pals_b8000)
	ld hl, Pals_b8000
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b89c0)
	ld hl, Pals_b89c0
	call LoadFarPalsToTempPals2
	jp Func_9d158
; 0x9c25c

.Func_9c25c: ; 9c25c (27:425c)
	ld hl, Pals_b8ac0
;	fallthrough

.Func_9c25f: ; 9c25f (27:425f)
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
; 0x9c27a

.Func_9c27a: ; 9c27a (27:427a)
	ld hl, Pals_b8b00
	jr .Func_9c25f
; 0x9c27f

.Func_9c27f: ; 9c27f (27:427f)
	ld hl, Pals_b8b80
	jr .Func_9c25f
; 0x9c284

.Func_9c284: ; 9c284 (27:4284)
	ld hl, Pals_b8b40
	jr .Func_9c25f
; 0x9c289

.Func_9c289: ; 9c289 (27:4289)
	ld hl, Pals_b8bc0
	jr .Func_9c25f
; 0x9c28e

.Func_9c28e: ; 9c28e (27:428e)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a80)
	ld hl, Pals_b8a80
	call LoadFarPalsToTempPals2
	call LoadCutscenes2Gfx
	jp Func_9ca77
; 0x9c2a4

.Func_9c2a4: ; 9c2a4 (27:42a4)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a00)
	ld hl, Pals_b8a00
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca77
	jp Func_9d0e6
; 0x9c2bd

.Func_9c2bd: ; 9c2bd (27:42bd)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8d40)
	ld hl, Pals_b8d40
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca77
; 0x9c2d3

.Func_9c2d3: ; 9c2d3 (27:42d3)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8dc0)
	ld hl, Pals_b8dc0
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	call Func_9ca6a
	jp Func_9cba2
; 0x9c2ec

.Func_9c2ec: ; 9c2ec (27:42ec)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8980)
	ld hl, Pals_b8980
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca77
	jp Func_9cbe3
; 0x9c305

.Func_9c305: ; 9c305 (27:4305)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c40)
	ld hl, Pals_b8c40
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca77
	jp Func_9cbe3
; 0x9c31e

.Func_9c31e: ; 9c31e (27:431e)
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
; 0x9c339

.Func_9c339: ; 9c339 (27:4339)
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
; 0x9c357

.Func_9c357: ; 9c357 (27:4357)
	ld b, BANK(Pals_b81c0)
	ld hl, Pals_b81c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e80)
	ld hl, Pals_b8e80
	call LoadFarPalsToTempPals2
;	fallthrough

.Func_9c367: ; 9c367 (27:4367)
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
; 0x9c386

.Func_9c386: ; 9c386 (27:4386)
	ld b, BANK(Pals_b8140)
	ld hl, Pals_b8140
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8940)
	ld hl, Pals_b8940
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca91
; 0x9c39c

.Func_9c39c: ; 9c39c (27:439c)
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
	decompress BGMap_ba5fd, v0BGMap1

	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c80)
	ld hl, Pals_b8c80
	call LoadFarPalsToTempPals2
	jp Func_9cc3c
; 0x9c423

.Func_9c423: ; 9c423 (27:4423)
	ld b, BANK(Pals_b80c0)
	ld hl, Pals_b80c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8cc0)
	ld hl, Pals_b8cc0
	call LoadFarPalsToTempPals2

	call LoadCutscenes3Gfx

	decompress_vram1 BGMap_b9691, v1BGMap0
	decompress BGMap_b9635, v0BGMap0

	jp Func_9d536
; 0x9c476

.Func_9c476: ; 9c476 (27:4476)
	call LoadCutscenes3Gfx

	decompress_vram1 BGMap_b97c4, v1BGMap0
	decompress BGMap_b9768, v0BGMap0

	jp ClearTempPals_Bank27
; 0x9c4b9

.Func_9c4b9: ; 9c4b9 (27:44b9)
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
; 0x9c4e1

.Func_9c4e1: ; 9c4e1 (27:44e1)
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
	decompress BGMap_b9816, v0BGMap0

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
; 0x9c57a

.Func_9c57a: ; 9c57a (27:457a)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8d80)
	ld hl, Pals_b8d80
	call LoadFarPalsToTempPals2
	call LoadCutscenes1Gfx
	call Func_9ca6a
	jp Func_9cba2
; 0x9c593

.Func_9c593: ; 9c593 (27:4593)
	ld b, BANK(Pals_b8180)
	ld hl, Pals_b8180
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e40)
	ld hl, Pals_b8e40
	call LoadFarPalsToTempPals2
	jp .Func_9c367
; 0x9c5a6

.Func_9c5a6: ; 9c5a6 (27:45a6)
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
; 0x9c5c5

.Func_9c5c5: ; 9c5c5 (27:45c5)
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
; 0x9c5e3

.Func_9c5e3: ; 9c5e3 (27:45e3)
	ld b, BANK(Pals_b8240)
	ld hl, Pals_b8240
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8f40)
	ld hl, Pals_b8f40
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca91
; 0x9c5f9

.Func_9c5f9: ; 9c5f9 (27:45f9)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8f80)
	ld hl, Pals_b8f80
	call LoadFarPalsToTempPals2
	call Func_9c931
	jp Func_9ca77
; 0x9c60f

.Func_9c60f: ; 9c60f (27:460f)
	ld b, BANK(LevelMainTiles7)
	ld hl, LevelMainTiles7
	call LoadFarTiles
	call Func_9c977
	call Func_9cb13
	call ClearTempPals_Bank27
	jp Func_9ded4
; 0x9c623

.Func_9c623: ; 9c623 (27:4623)
	ld b, BANK(Pals_b8380)
	ld hl, Pals_b8380
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8fc0)
	ld hl, Pals_b8fc0
	call LoadFarPalsToTempPals2
	jp Func_9caab
; 0x9c636

.Func_9c636: ; 9c636 (27:4636)
	call ClearTempPals_Bank27
	call Func_9c9a6
	ld b, BANK(LevelMainTiles30)
	ld hl, LevelMainTiles30
	call LoadFarTiles
	call Func_9cb88
	call Func_9cc0a
	jp Func_9e018
; 0x9c64d

.Func_9c64d: ; 9c64d (27:464d)
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
; 0x9c66e

.Func_9c66e: ; 9c66e (27:466e)
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
; 0x9c689

.Func_9c689: ; 9c689 (27:4689)
	call Func_9c9a6
	ld b, BANK(LevelMainTiles24)
	ld hl, LevelMainTiles24
	call LoadFarTiles
	call Func_9cb7b
	call ClearTempPals_Bank27
	jp Func_9e2b8
; 0x9c69d

.Func_9c69d: ; 9c69d (27:469d)
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
; 0x9c6e7

.Func_9c6e7: ; 9c6e7 (27:46e7)
	ld b, BANK(Pals_b83c0)
	ld hl, Pals_b83c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b9040)
	ld hl, Pals_b9040
	call LoadFarPalsToTempPals2
	call Func_9c937
	call Func_9cac5
	jp Func_9e438
; 0x9c700

.Func_9c700: ; 9c700 (27:4700)
	call ClearTempPals_Bank27
	call LoadCutscenes8Gfx

	decompress_vram1 FireGfx, v1Tiles1

	call Func_9ca28
	call Func_9cb61
	jp Func_9e4ae
; 0x9c731

.Func_9c731: ; 9c731 (27:4731)
	call ClearTempPals_Bank27
	call Func_9c84f
	ld b, BANK(LevelMainTiles27)
	ld hl, LevelMainTiles27
	call LoadFarTiles
	jp Func_9cb47
; 0x9c742

.Func_9c742: ; 9c742 (27:4742)
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
; 0x9c760

.Func_9c760: ; 9c760 (27:4760)
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
; 0x9c77f

.Func_9c77f: ; 9c77f (27:477f)
	call ClearTempPals_Bank27
	ld b, BANK(LevelMainTiles11)
	ld hl, LevelMainTiles11
	call LoadFarTiles
	call Func_9c97d
	call Func_9cb06
	call Func_9cbf0
	jp Func_9e6ef
; 0x9c796

.Func_9c796: ; 9c796 (27:4796)
	call ClearTempPals_Bank27
	call Func_9c937
	call Func_9cb3a
	call Func_9cc28
	jp Func_9e79a
; 0x9c7a5

.Func_9c7a5: ; 9c7a5 (27:47a5)
	call ClearTempPals_Bank27
	call Func_9c9cb

	decompress_vram1 WallCrackGfx, v1Tiles1

	call Func_9ca28
	call Func_9cb95
	call Func_9cc17
	jp Func_9e855
; 0x9c7d9

.Func_9c7d9: ; 9c7d9 (27:47d9)
	call ClearTempPals_Bank27
	call Func_9ca38
	call Func_9c90c
	call Func_9cb20
	jp Func_9e91a
; 0x9c7e8

.Func_9c7e8: ; 9c7e8 (27:47e8)
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
; 0x9c832

LoadCutscenes1Gfx: ; 9c832 (27:4832)
	decompress Cutscenes1Gfx, v0Tiles0
	jr LoadCutscenes5Gfx

Func_9c84f: ; 9c84f (27:484f)
	decompress_vram1 Cutscenes1Gfx, v1Tiles0
	jr Func_9c8e9
; 0x9c873

LoadCutscenes2Gfx: ; 9c873 (27:4873)
	decompress Cutscenes2Gfx, v0Tiles0
	jp LoadCutscenes5Gfx ; can be jr
; 0x9c891

LoadCutscenes3Gfx: ; 9c891 (27:4891)
	decompress Cutscenes3Gfx, v0Tiles0
	jp LoadCutscenes5Gfx ; can be jr
; 0x9c8af

LoadCutscenes4Gfx: ; 9c8af (27:48af)
	decompress Cutscenes4Gfx, v0Tiles0
	jp LoadCutscenes5Gfx ; unnecessary jump
; 0x9c8cd

LoadCutscenes5Gfx: ; 9c8cd (27:48cd)
	decompress Cutscenes5Gfx, v0Tiles2
	ret
; 0x9c8e9

Func_9c8e9: ; 9c8e9 (27:48e9)
	decompress_vram1 Cutscenes5Gfx, v1Tiles2
	ret
; 0x9c90c

Func_9c90c: ; 9c90c (27:490c)
	decompress_vram1 Cutscenes7Gfx, v1Tiles0
	jp Func_9c8e9
; 0x9c931

Func_9c931: ; 9c931 (27:4931)
	call Func_9c93d
	jp LoadCutscenes5Gfx
; 0x9c937

Func_9c937: ; 9c937 (27:4937)
	call Func_9c93d
	jp Func_9ca0c
; 0x9c93d

Func_9c93d: ; 9c93d (27:493d)
	decompress Cutscenes7Gfx, v0Tiles0
	ret
; 0x9c959

LoadCutscenes8Gfx: ; 9c959 (27:4959)
	decompress Cutscenes8Gfx, v0Tiles0
	jp LoadCutscenes5Gfx
; 0x9c977

Func_9c977: ; 9c977 (27:4977)
	call Func_9c983
	jp Func_9c8e9
; 0x9c97d

Func_9c97d: ; 9c97d (27:497d)
	call Func_9c983
	jp Func_9c9e9
; 0x9c983

Func_9c983: ; 9c983 (27:4983)
	decompress_vram1 Cutscenes8Gfx, v1Tiles0
	ret
; 0x9c9a6

Func_9c9a6: ; 9c9a6 (27:49a6)
	decompress_vram1 Cutscenes9Gfx, v1Tiles0
	jp Func_9c9e9
; 0x9c9cb

Func_9c9cb: ; 9c9cb (27:49cb)
	decompress Cutscenes9Gfx, v0Tiles0
	jp Func_9ca0c
; 0x9c9e9

Func_9c9e9: ; 9c9e9 (27:49e9)
	decompress_vram1 Cutscenes10Gfx, v1Tiles2
	ret
; 0x9ca0c

Func_9ca0c: ; 9ca0c (27:4a0c)
	decompress Cutscenes10Gfx, v0Tiles2
	ret
; 0x9ca28

Func_9ca28: ; 9ca28 (27:4a28)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld b, BANK(LevelMainTiles29)
	ld hl, LevelMainTiles29
	call LoadFarTiles
	xor a
	ldh [rVBK], a
	ret
; 0x9ca38

Func_9ca38: ; 9ca38 (27:4a38)
	ld b, BANK(LevelMainTiles29)
	ld hl, LevelMainTiles29
	call LoadFarTiles
	ret
; 0x9ca41

LoadCutsceneAttrmap0: ; 9ca41 (27:4a41)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
;	fallthrough
LoadCutsceneTilemap0: ; 9ca45 (27:4a45)
	ld bc, v0BGMap0
;	fallthrough

LoadCutsceneBGMap: ; 9ca48 (27:4a48)
	ld a, $2e
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	ret
; 0x9ca61

LoadCutsceneAttrmap1: ; 9ca61 (27:4a61)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
;	fallthrough
LoadCutsceneTilemap1: ; 9ca65 (27:4a65)
	ld bc, v0BGMap1
	jr LoadCutsceneBGMap
; 0x9ca6a

Func_9ca6a: ; 9ca6a (27:4a6a)
	ld hl, BGMap_b9113
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9100
	call LoadCutsceneTilemap0
	ret
; 0x9ca77

Func_9ca77: ; 9ca77 (27:4a77)
	ld hl, BGMap_b9235
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b91e7
	call LoadCutsceneTilemap0
	ret
; 0x9ca84

Func_9ca84: ; 9ca84 (27:4a84)
	ld hl, BGMap_b94d1
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9475
	call LoadCutsceneTilemap0
	ret
; 0x9ca91

Func_9ca91: ; 9ca91 (27:4a91)
	ld hl, BGMap_b98d7
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b989c
	call LoadCutsceneTilemap0
	ret
; 0x9ca9e

Func_9ca9e: ; 9ca9e (27:4a9e)
	ld hl, BGMap_b996e
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9920
	call LoadCutsceneTilemap0
	ret
; 0x9caab

Func_9caab: ; 9caab (27:4aab)
	ld hl, BGMap_b9a8c
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9a22
	call LoadCutsceneTilemap0
	ret
; 0x9cab8

Func_9cab8: ; 9cab8 (27:4ab8)
	ld hl, BGMap_b9b2d
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9ae0
	call LoadCutsceneTilemap0
	ret
; 0x9cac5

Func_9cac5: ; 9cac5 (27:4ac5)
	ld hl, BGMap_b9be0
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9b84
	call LoadCutsceneTilemap0
	ret
; 0x9cad2

Func_9cad2: ; 9cad2 (27:4ad2)
	ld hl, BGMap_b9c75
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9c2c
	call LoadCutsceneTilemap0
	ret
; 0x9cadf

Func_9cadf: ; 9cadf (27:4adf)
	ld hl, BGMap_b9da3
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9d48
	call LoadCutsceneTilemap0
	ret
; 0x9caec

Func_9caec: ; 9caec (27:4aec)
	ld hl, BGMap_b9ed5
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9e7b
	call LoadCutsceneTilemap0
	ret
; 0x9caf9

Func_9caf9: ; 9caf9 (27:4af9)
	ld hl, BGMap_b9f73
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9f1e
	call LoadCutsceneTilemap0
	ret
; 0x9cb06

Func_9cb06: ; 9cb06 (27:4b06)
	ld hl, BGMap_b9fe6
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9fb1
	call LoadCutsceneTilemap0
	ret
; 0x9cb13

Func_9cb13: ; 9cb13 (27:4b13)
	ld hl, BGMap_ba0e6
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba0b4
	call LoadCutsceneTilemap0
	ret
; 0x9cb20

Func_9cb20: ; 9cb20 (27:4b20)
	ld hl, BGMap_ba19c
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba143
	call LoadCutsceneTilemap0
	ret
; 0x9cb2d

Func_9cb2d: ; 9cb2d (27:4b2d)
	ld hl, BGMap_ba286
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba221
	call LoadCutsceneTilemap0
	ret
; 0x9cb3a

Func_9cb3a: ; 9cb3a (27:4b3a)
	ld hl, BGMap_ba37b
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba31f
	call LoadCutsceneTilemap0
	ret
; 0x9cb47

Func_9cb47: ; 9cb47 (27:4b47)
	ld hl, BGMap_ba425
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba3d3
	call LoadCutsceneTilemap0
	ret
; 0x9cb54

Func_9cb54: ; 9cb54 (27:4b54)
	ld hl, BGMap_ba4c4
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba46a
	call LoadCutsceneTilemap0
	ret
; 0x9cb61

Func_9cb61: ; 9cb61 (27:4b61)
	ld hl, BGMap_ba5a0
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba544
	call LoadCutsceneTilemap0
	ret
; 0x9cb6e

Func_9cb6e: ; 9cb6e (27:4b6e)
	ld hl, BGMap_ba6e1
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba685
	call LoadCutsceneTilemap0
	ret
; 0x9cb7b

Func_9cb7b: ; 9cb7b (27:4b7b)
	ld hl, BGMap_ba82d
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba7f9
	call LoadCutsceneTilemap0
	ret
; 0x9cb88

Func_9cb88: ; 9cb88 (27:4b88)
	ld hl, BGMap_ba8a6
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba865
	call LoadCutsceneTilemap0
	ret
; 0x9cb95

Func_9cb95: ; 9cb95 (27:4b95)
	ld hl, BGMap_ba9b4
	call LoadCutsceneAttrmap0
	ld hl, BGMap_ba958
	call LoadCutsceneTilemap0
	ret
; 0x9cba2

Func_9cba2: ; 9cba2 (27:4ba2)
	ld hl, BGMap_b919b
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b914a
	call LoadCutsceneTilemap1
	ret
; 0x9cbaf

Func_9cbaf: ; 9cbaf (27:4baf)
	ld hl, BGMap_b92c2
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b926d
	call LoadCutsceneTilemap1
	ret
; 0x9cbbc

Func_9cbbc: ; 9cbbc (27:4bbc)
	ld hl, BGMap_b936c
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9310
	call LoadCutsceneTilemap1
	ret
; 0x9cbc9

Func_9cbc9: ; 9cbc9 (27:4bc9)
	ld hl, BGMap_b99e8
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b99aa
	call LoadCutsceneTilemap1
	ret
; 0x9cbd6

Func_9cbd6: ; 9cbd6 (27:4bd6)
	ld hl, BGMap_b9d01
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9cb8
	call LoadCutsceneTilemap1
	ret
; 0x9cbe3

Func_9cbe3: ; 9cbe3 (27:4be3)
	ld hl, BGMap_b9e3b
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9dea
	call LoadCutsceneTilemap1
	ret
; 0x9cbf0

Func_9cbf0: ; 9cbf0 (27:4bf0)
	ld hl, BGMap_ba07d
	call LoadCutsceneAttrmap1
	ld hl, BGMap_ba02a
	call LoadCutsceneTilemap1
	ret
; 0x9cbfd

Func_9cbfd: ; 9cbfd (27:4bfd)
	ld hl, BGMap_ba79c
	call LoadCutsceneAttrmap1
	ld hl, BGMap_ba740
	call LoadCutsceneTilemap1
	ret
; 0x9cc0a

Func_9cc0a: ; 9cc0a (27:4c0a)
	ld hl, BGMap_ba925
	call LoadCutsceneAttrmap1
	ld hl, BGMap_ba8d2
	call LoadCutsceneTilemap1
	ret
; 0x9cc17

Func_9cc17: ; 9cc17 (27:4c17)
	ld hl, BGMap_baa6e
	call LoadCutsceneAttrmap1
	ld hl, BGMap_baa12
	call LoadCutsceneTilemap1
	ret
; 0x9cc24

Func_9cc24: ; 9cc24 (27:4c24)
	ld d, $88
	jr Func_9cc2a

Func_9cc28: ; 9cc28 (27:4c28)
	ld d, $80
;	fallthrough
Func_9cc2a: ; 9cc2a (27:4c2a)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap0
	ld bc, 5 * BG_MAP_WIDTH
	ld a, d
	call WriteAToHL_BCTimes
	xor a
	ldh [rVBK], a
	ret
; 0x9cc3c

Func_9cc3c: ; 9cc3c (27:4c3c)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v1BGMap1
	ld bc, 5 * BG_MAP_WIDTH
	ld a, $80
	call WriteAToHL_BCTimes
	xor a
	ldh [rVBK], a
	ret
; 0x9cc4f

Func_9cc4f: ; 9cc4f (27:4c4f)
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
; 0x9cc72

ClearTempPals_Bank27: ; 9cc72 (27:4c72)
	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	ret
; 0x9cc87

	INCROM $9cc87, $9cc9c

VBlank_9cc9c: ; 9cc9c (27:4c9c)
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
	ld a, [wPalConfig1]
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
; 0x9ccf9

Func_9ccf9: ; 9ccf9 (27:4cf9)
	ld [hl], d
	inc l
	ld [hl], e
	inc l
	set 2, l
	call SetSceneObjState
	ret
; 0x9cd03

Func_9cd03: ; 9cd03 (27:4d03)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0x9cd0a

Func_9cd0a: ; 9cd0a (27:4d0a)
	ld a, [w2d014]
	cp c
	ret c
	jr Func_9cd03
; 0x9cd11

Func_9cd11: ; 9cd11 (27:4d11)
	ld c, $1e
	jp Func_9cd0a
; 0x9cd16

Func_9cd16: ; 9cd16 (27:4d16)
	ld hl, wSubState
	inc [hl]
	stop_sfx
	ret
; 0x9cd23

	INCROM $9cd23, $9cd25

Func_9cd25: ; 9cd25 (27:4d25)
	ld a, [w2d014]
	cp e
	ret c
	jr Func_9cd16
; 0x9cd2c

Func_9cd2c: ; 9cd2c (27:4d2c)
	ld e, $28
	jr Func_9cd25
; 0x9cd30

	INCROM $9cd30, $9cd8d

Func_9cd8d: ; 9cd8d (27:4d8d)
	farcall Func_85046
	ret
; 0x9cd9d

	INCROM $9cd9d, $9ce1f

Func_9ce1f: ; 9ce1f (27:4e1f)
	play_sfx SFX_112
	ret
; 0x9ce28

Func_9ce28: ; 9ce28 (27:4e28)
	call ProcessDPadRepeat
	ld hl, w2d014
	inc [hl]
	ld b, h
	ld c, l

	ld a, [w2d01e]
	cp NUM_CUTSCENES + 1
	jp nc, .OutOfBoundsCutscene
	jumptable
	dw .InvalidCutscene ; CUTSCENE_00
	dw Func_9cef6 ; CUTSCENE_01
	dw Func_9d797 ; CUTSCENE_02
	dw Func_9cf06 ; CUTSCENE_03
	dw $5b03 ; CUTSCENE_04
	dw .InvalidCutscene ; CUTSCENE_05
	dw $502d ; CUTSCENE_06
	dw $518b ; CUTSCENE_07
	dw $56de ; CUTSCENE_08
	dw $56a4 ; CUTSCENE_09
	dw $510e ; CUTSCENE_0A
	dw .InvalidCutscene ; CUTSCENE_0B
	dw $582e ; CUTSCENE_0C
	dw $58b5 ; CUTSCENE_0D
	dw $533a ; CUTSCENE_0E
	dw .InvalidCutscene ; CUTSCENE_0F
	dw $56e2 ; CUTSCENE_10
	dw $533a ; CUTSCENE_11
	dw .InvalidCutscene ; CUTSCENE_12
	dw $5985 ; CUTSCENE_13
	dw $6c6c ; CUTSCENE_14
	dw $5a31 ; CUTSCENE_15
	dw .InvalidCutscene ; CUTSCENE_16
	dw $56e6 ; CUTSCENE_17
	dw $5869 ; CUTSCENE_18
	dw $527f ; CUTSCENE_19
	dw .InvalidCutscene ; CUTSCENE_1A
	dw $5441 ; CUTSCENE_1B
	dw .InvalidCutscene ; CUTSCENE_1C
	dw $56ea ; CUTSCENE_1D
	dw $5569 ; CUTSCENE_1E
	dw $5c7d ; CUTSCENE_1F
	dw .InvalidCutscene ; CUTSCENE_20
	dw $5d03 ; CUTSCENE_21
	dw $55d7 ; CUTSCENE_22
	dw .InvalidCutscene ; CUTSCENE_23
	dw $5b98 ; CUTSCENE_24
	dw $56ee ; CUTSCENE_25
	dw .InvalidCutscene ; CUTSCENE_26
	dw $565e ; CUTSCENE_27
	dw .InvalidCutscene ; CUTSCENE_28
	dw .InvalidCutscene ; CUTSCENE_29
	dw .InvalidCutscene ; CUTSCENE_2A
	dw .InvalidCutscene ; CUTSCENE_2B
	dw .InvalidCutscene ; CUTSCENE_2C
	dw .InvalidCutscene ; CUTSCENE_2D
	dw .InvalidCutscene ; CUTSCENE_2E
	dw .InvalidCutscene ; CUTSCENE_2F
	dw $5f0f ; CUTSCENE_30
	dw .InvalidCutscene ; CUTSCENE_31
	dw .InvalidCutscene ; CUTSCENE_32
	dw .InvalidCutscene ; CUTSCENE_33
	dw .InvalidCutscene ; CUTSCENE_34
	dw .InvalidCutscene ; CUTSCENE_35
	dw .InvalidCutscene ; CUTSCENE_36
	dw $5e07 ; CUTSCENE_37
	dw $5e48 ; CUTSCENE_38
	dw $5fcd ; CUTSCENE_39
	dw $6046 ; CUTSCENE_3A
	dw .InvalidCutscene ; CUTSCENE_3B
	dw $6171 ; CUTSCENE_3C
	dw $6347 ; CUTSCENE_3D
	dw .InvalidCutscene ; CUTSCENE_3E
	dw .InvalidCutscene ; CUTSCENE_3F
	dw .InvalidCutscene ; CUTSCENE_40
	dw .InvalidCutscene ; CUTSCENE_41
	dw .InvalidCutscene ; CUTSCENE_42
	dw $625c ; CUTSCENE_43
	dw $6aca ; CUTSCENE_44
	dw .InvalidCutscene ; CUTSCENE_45
	dw .InvalidCutscene ; CUTSCENE_46
	dw .InvalidCutscene ; CUTSCENE_47
	dw .InvalidCutscene ; CUTSCENE_48
	dw $5a31 ; CUTSCENE_49
	dw $6451 ; CUTSCENE_4A
	dw .InvalidCutscene ; CUTSCENE_4B
	dw $64cf ; CUTSCENE_4C
	dw .InvalidCutscene ; CUTSCENE_4D
	dw $654c ; CUTSCENE_4E
	dw $65ba ; CUTSCENE_4F
	dw .InvalidCutscene ; CUTSCENE_50
	dw $666e ; CUTSCENE_51
	dw .InvalidCutscene ; CUTSCENE_52
	dw .InvalidCutscene ; CUTSCENE_53
	dw $62d1 ; CUTSCENE_54
	dw $695f ; CUTSCENE_55
	dw $66fd ; CUTSCENE_56
	dw $67b3 ; CUTSCENE_57
	dw $6871 ; CUTSCENE_58
	dw .InvalidCutscene ; CUTSCENE_59
	dw .InvalidCutscene ; CUTSCENE_5A

.OutOfBoundsCutscene
	debug_nop

.InvalidCutscene
	debug_nop

Func_9cef6: ; 9cef6 (27:4ef6)
	farcall Func_adfa3
	ret
; 0x9cf06

Func_9cf06: ; 9cf06 (27:4f06)
	call Func_9cf0c
	jp Func_9f0e0
; 0x9cf0c

Func_9cf0c: ; 9cf0c (27:4f0c)
	ld a, [w2d013]
	jumptable
	dw Func_9cd11
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
	dw Func_9cd2c

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
	jp Func_9cd03

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
	jp Func_9cd03

.Func_9cf6c
	ld c, $1e
	jp Func_9cd0a

.Func_9cf71
	ld a, $03
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $50
	ld [wSceneObj2XCoord], a
	xor a
	ld [wSceneObj3State], a
	play_sfx SFX_062
	jp Func_9cd03

.Func_9cf8d
	ld c, $1e
	jp Func_9cd0a

.Func_9cf92
	ld hl, wSceneObj3YCoord
	ld a, $3b
	ld [hli], a
	ld [hl], $50
	ld a, $05
	ld hl, wSceneObj3State
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_9cd03

.Func_9cfad
	ld a, [wSceneObj3State]
	and a
	ret nz
	jp Func_9cd03

.Func_9cfb5
	ld c, $3c
	jp Func_9cd0a

.Func_9cfba
	ld a, [bc]
	bit 0, a
	ret z
	ld hl, wSceneObj2YCoord
	inc [hl]
	ld a, [hl]
	cp $54
	ret nz
	jp Func_9cd03

.Func_9cfc9
	ld c, $3c
	jp Func_9cd0a

.Func_9cfce
	ld a, $04
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld hl, wSceneObj2XCoord
	inc [hl]
	play_sfx SFX_062
	jp Func_9cd03

.Func_9cfe5
	ld c, $1e
	jp Func_9cd0a

.Func_9cfea
	ld a, [wSceneObj2YCoord]
	ld [wSceneObj3YCoord], a
	ld a, [wSceneObj2XCoord]
	ld [wSceneObj3XCoord], a
	ld a, $06
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp Func_9cd03

.Func_9d001
	ld a, [wSceneObj3State]
	cp $07
	ret nz
	jp Func_9cd03

.Func_9d00a
	play_sfx SFX_10C
	jp Func_9cd03

.Func_9d015
	ld c, $1e
	jp Func_9cd0a
; 0x9d01a

Func_9d01a: ; 9d01a (27:501a)
	ld hl, wSceneObj2
	ld a, $48
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_9f11e
; 0x9d02d

	INCROM $9d02d, $9d0e6

Func_9d0e6: ; 9d0e6 (27:50e6)
	ld a, $03
	ld [wSceneObj1], a
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
; 0x9d10e

	INCROM $9d10e, $9d158

Func_9d158: ; 9d158 (27:5158)
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
; 0x9d18b

	INCROM $9d18b, $9d536

Func_9d536: ; 9d536 (27:5536)
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
; 0x9d569

	INCROM $9d569, $9d64b

Func_9d64b: ; 9d64b (27:564b)
	ld hl, wSceneObj2
	ld a, $56
	ld [hli], a
	ld [hl], $58
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_9f2f3
; 0x9d65e

	INCROM $9d65e, $9d797

Func_9d797: ; 9d797 (27:5797)
	call Func_9d79d
	jp Func_9fc58
; 0x9d79d

Func_9d79d: ; 9d79d (27:579d)
	ld a, [w2d013]
	jumptable
	dw Func_9cd11
	dw .Func_9d7b7
	dw .Func_9d7cf
	dw .Func_9d7e1
	dw .Func_9d7e6
	dw .Func_9d7ee
	dw .Func_9d7f3
	dw .Func_9d806
	dw .Func_9d80b
	dw .Func_9d826
	dw Func_9cd2c

.Func_9d7b7
	ld hl, wSceneObj2
	ld a, $90
	ld [hli], a
	ld [hl], $6c
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	ld a, $03
	ld [wSceneObj1YCoord], a
	jp Func_9cd03

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
	jp Func_9cd03

.Func_9d7e1
	ld c, $1e
	jp Func_9cd0a

.Func_9d7e6
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	jp Func_9cd03

.Func_9d7ee
	ld c, $3c
	jp Func_9cd0a

.Func_9d7f3
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	xor a
	ld hl, wSceneObj2State
	call SetSceneObjState
	xor a
	ld [wSceneObj1YCoord], a
	jp Func_9cd03

.Func_9d806
	ld c, $10
	jp Func_9cd0a

.Func_9d80b
	ld hl, wSceneObj2
	ld a, $60
	ld [hli], a
	ld [hl], $42
	ld a, $02
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_101
	jp Func_9cd03

.Func_9d826
	ld a, [wSceneObj2State]
	and a
	ret nz
	jp Func_9cd03
; 0x9d82e

	INCROM $9d82e, $9da0e

Func_9da0e: ; 9da0e (27:5a0e)
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
; 0x9da31

	INCROM $9da31, $9db85

Func_9db85: ; 9db85 (27:5b85)
	ld hl, wSceneObj2
	ld a, $68
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_9f3ee
; 0x9db98

	INCROM $9db98, $9dc6a

Func_9dc6a: ; 9dc6a (27:5c6a)
	ld hl, wSceneObj3
	ld a, $60
	ld [hli], a
	ld [hl], $70
	ld a, $04
	ld hl, wSceneObj3State
	call SetSceneObjState
	jp Func_9f423
; 0x9dc7d

	INCROM $9dc7d, $9ded4

Func_9ded4: ; 9ded4 (27:5ed4)
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
; 0x9df0f

	INCROM $9df0f, $9e018

Func_9e018: ; 9e018 (27:6018)
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
; 0x9e046

	INCROM $9e046, $9e2b8

Func_9e2b8: ; 9e2b8 (27:62b8)
	ld hl, wSceneObj2
	lb de, $58, $50
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $70, $50
	ld a, $02
	call Func_9ccf9
	jp Func_9f73b
; 0x9e2d1

	INCROM $9e2d1, $9e438

Func_9e438: ; 9e438 (27:6438)
	ld hl, wSceneObj2
	lb de, $40, $b0
	ld a, $02
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $44, $50
	ld a, $01
	call Func_9ccf9
	jp Func_9f7bb
; 0x9e451

	INCROM $9e451, $9e4ae

Func_9e4ae: ; 9e4ae (27:64ae)
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
; 0x9e4cf

	INCROM $9e4cf, $9e5a1

Func_9e5a1: ; 9e5a1 (27:65a1)
	ld hl, wSceneObj2
	lb de, $20, $4c
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $50, $60
	ld a, $04
	call Func_9ccf9
	jp Func_9f86a
; 0x9e5ba

	INCROM $9e5ba, $9e655

Func_9e655: ; 9e655 (27:6655)
	ld hl, wSceneObj2
	lb de, $40, $58
	ld a, $02
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $58, $58
	ld a, $01
	call Func_9ccf9
	jp Func_9f8da
; 0x9e66e

	INCROM $9e66e, $9e6ef

Func_9e6ef: ; 9e6ef (27:66ef)
	ld hl, wSceneObj2
	lb de, $56, $50
	ld a, $01
	call Func_9ccf9
	jp Func_9f91f
; 0x9e6fd

	INCROM $9e6fd, $9e79a

Func_9e79a: ; 9e79a (27:679a)
	ld hl, wSceneObj3
	lb de, $4e, $54
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj2
	lb de, $10, $48
	ld a, $03
	call Func_9ccf9
	jp Func_9f991
; 0x9e7b3

	INCROM $9e7b3, $9e855

Func_9e855: ; 9e855 (27:6855)
	ld hl, wSceneObj2
	lb de, $90, $48
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj3
	lb de, $48, $58
	ld a, $01
	call Func_9ccf9
	call Func_9f9c1
	jp Func_9f9f5
; 0x9e871

	INCROM $9e871, $9e91a

Func_9e91a: ; 9e91a (27:691a)
	ld hl, wSceneObj3
	lb de, $58, $40
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj4
	lb de, $58, $50
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj4End
	lb de, $58, $60
	ld a, $01
	call Func_9ccf9
	ld hl, wSceneObj5End
	lb de, $58, $40
	ld a, $04
	call Func_9ccf9
	ld hl, wSceneObj6End
	lb de, $58, $50
	ld a, $04
	call Func_9ccf9
	ld hl, wSceneObj8
	lb de, $58, $60
	ld a, $04
	call Func_9ccf9
	jp Func_9fa48
; 0x9e95f

	INCROM $9e95f, $9f0a5

Func_9f0a5: ; 9f0a5 (27:70a5)
	dec a
	call GetPointerFromTableDE
	dec c
	dec c
	ld l, c
	ld h, b
	ret
; 0x9f0ae

Func_9f0ae: ; 9f0ae (27:70ae)
	ld b, $2f
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0x9f0b5

Func_9f0b5: ; 9f0b5 (27:70b5)
	ld b, $1a
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0x9f0bc

Func_9f0bc: ; 9f0bc (27:70bc)
	ld b, $2f
	jp AddOWSprite
; 0x9f0c1

Func_9f0c1: ; 9f0c1 (27:70c1)
	ld b, $62
	jp AddOWSprite
; 0x9f0c6

	INCROM $9f0c6, $9f0cb

Func_9f0cb: ; 9f0cb (27:70cb)
	ld b, $63
	jp AddOWSprite
; 0x9f0d0

Func_9f0d0: ; 9f0d0 (27:70d0)
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
; 0x9f0e0

Func_9f0e0: ; 9f0e0 (27:70e0)
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
; 0x9f11e

Func_9f11e: ; 9f11e (27:711e)
	ld bc, wSceneObj2State
.asm_9f121
	ld a, [bc]
	and a
	ret z
	ld hl, .PointerTable
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

.PointerTable
	dw $543a
	dw $543d
	dw $544a
; 0x9f146

Func_9f146: ; 9f146 (27:7146)
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
	ld hl, .PointerTable
	call Func_9f0a5
	call Func_9f0ae
	ld de, OAM_bd453
	jp Func_9f0bc

.PointerTable
	dw $5469 
	dw $546c
; 0x9f174

Func_9f174: ; 9f174 (27:7174)
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
; 0x9f1d8

	INCROM $9f1d8, $9f2a2

Func_9f2a2: ; 9f2a2 (27:72a2)
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
; 0x9f2cd

	INCROM $9f2cd, $9f2f3

Func_9f2f3: ; 9f2f3 (27:72f3)
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
; 0x9f323

	INCROM $9f323, $9f38d

Func_9f38d: ; 9f38d (27:738d)
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
; 0x9f3cd

	INCROM $9f3cd, $9f3ee

Func_9f3ee: ; 9f3ee (27:73ee)
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
; 0x9f423

Func_9f423: ; 9f423 (27:7423)
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
; 0x9f49c

	INCROM $9f49c, $9f5a0

Func_9f5a0: ; 9f5a0 (27:75a0)
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
; 0x9f607

	INCROM $9f607, $9f638

Func_9f638: ; 9f638 (27:7638)
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
; 0x9f6a2

	INCROM $9f6a2, $9f73b

Func_9f73b: ; 9f73b (27:773b)
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
; 0x9f75c

	INCROM $9f75c, $9f7bb

Func_9f7bb: ; 9f7bb (27:77bb)
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
; 0x9f7dc

Func_9f7dc: ; 9f7dc (27:77dc)
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
; 0x9f821

Func_9f821: ; 9f821 (27:7821)
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
; 0x9f857

	INCROM $9f857, $9f86a

Func_9f86a: ; 9f86a (27:786a)
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
; 0x9f8da

Func_9f8da: ; 9f8da (27:78da)
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
; 0x9f91f

Func_9f91f: ; 9f91f (27:791f)
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
; 0x9f991

Func_9f991: ; 9f991 (27:7991)
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
; 0x9f9c1

Func_9f9c1: ; 9f9c1 (27:79c1)
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
; 0x9f9f5

Func_9f9f5: ; 9f9f5 (27:79f5)
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
; 0x9fa48

Func_9fa48: ; 9fa48 (27:7a48)
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
; 0x9fab4

	INCROM $9fab4, $9fb53

Func_9fb53: ; 9fb53 (27:7b53)
	ld a, [wSceneObj1YCoord]
	cp b
	ret nz
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ld de, OAM_bc000
	ld a, $fc
	and l
	ld l, a
	call Func_9f0bc
	ret
; 0x9fb6c

	INCROM $9fb6c, $9fb97

Func_9fb97: ; 9fb97 (27:7b97)
	ld hl, w2d180
	ld c, $05
	ld b, $03
	jr Func_9fb53
; 0x9fba0

Func_9fba0: ; 9fba0 (27:7ba0)
	ld hl, w2d180Duration
	ld c, $06
	ld b, $03
	jr Func_9fb53
; 0x9fba9

	INCROM $9fba9, $9fc58

Func_9fc58: ; 9fc58 (27:7c58)
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
	ld de, $41f3
	call UpdateOWAnimation
	jr .asm_9fc85
.two
	ld de, $41e8
	call UpdateOWAnimation
	ld b, $00
	call Func_9f0d0
	jr z, .start
.asm_9fc85
	ld de, OAM_bc122
	jp Func_9f0bc
; 0x9fc8b

	INCROM $9fc8b, $a0000
