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
	jr nz, .asm_9c01c
	ld a, l
	cp LOW(Func_9c000)
	ret z
.asm_9c01c
	ld a, b
	ld [w2d01e], a
	ret
; 0x9c021

Func_9c021: ; 9c021 (27:4021)
	call DisableLCD
	call ClearWholeVirtualOAM
	stop_music2

	xor a
	ld hl, w2d800
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
	ld [w2d0d5], a
	ld [w2d0db], a

	ld a, [w2d800]
	ld b, a
	and a
	ld a, LCDC_BGON | LCDC_OBJON | LCDC_OBJ16 | LCDC_WIN9C00 | LCDC_ON
	jr z, .asm_9c067
	xor b
.asm_9c067
	ldh [rLCDC], a
	xor a
	ld [w2d800], a

	ld hl, wSubState
	inc [hl]
	ret
; 0x9c072

Func_9c072: ; 9c072 (27:4072)
	xor a
	ld [w2d800], a
	call ClearWholeVirtualOAM
	ld a, [w2d025]
	dec a
	jr z, .skip_load_tiles

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(Cutscenes6Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes6Gfx
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a

.skip_load_tiles
	ld a, [w2d025]
	ld [w2d01e], a
	jumptable

.table
	dw Func_9c000 ; CUTSCENE_00
	dw InitPrologueSequence ; CUTSCENE_01
	dw Func_9c16e ; CUTSCENE_02
	dw Func_9c187 ; CUTSCENE_03
	dw Func_9c19d ; CUTSCENE_04
	dw Func_9c000 ; CUTSCENE_05
	dw Func_9c1b6 ; CUTSCENE_06
	dw Func_9c209 ; CUTSCENE_07
	dw Func_9c25c ; CUTSCENE_08
	dw Func_9c28e ; CUTSCENE_09
	dw Func_9c2a4 ; CUTSCENE_0A
	dw Func_9c000 ; CUTSCENE_0B
	dw Func_9c2bd ; CUTSCENE_0C
	dw Func_9c2d3 ; CUTSCENE_0D
	dw Func_9c2ec ; CUTSCENE_0E
	dw Func_9c000 ; CUTSCENE_0F
	dw Func_9c27a ; CUTSCENE_10
	dw Func_9c305 ; CUTSCENE_11
	dw Func_9c000 ; CUTSCENE_12
	dw Func_9c31e ; CUTSCENE_13
	dw Func_9c339 ; CUTSCENE_14
	dw Func_9c357 ; CUTSCENE_15
	dw Func_9c000 ; CUTSCENE_16
	dw Func_9c284 ; CUTSCENE_17
	dw $457a ; CUTSCENE_18
	dw $4386 ; CUTSCENE_19
	dw Func_9c000 ; CUTSCENE_1A
	dw $439c ; CUTSCENE_1B
	dw Func_9c000 ; CUTSCENE_1C
	dw Func_9c27f ; CUTSCENE_1D
	dw $4423 ; CUTSCENE_1E
	dw $45a6 ; CUTSCENE_1F
	dw Func_9c000 ; CUTSCENE_20
	dw $45c5 ; CUTSCENE_21
	dw $4476 ; CUTSCENE_22
	dw Func_9c000 ; CUTSCENE_23
	dw $44b9 ; CUTSCENE_24
	dw Func_9c289 ; CUTSCENE_25
	dw Func_9c000 ; CUTSCENE_26
	dw $44e1 ; CUTSCENE_27
	dw Func_9c000 ; CUTSCENE_28
	dw Func_9c000 ; CUTSCENE_29
	dw Func_9c000 ; CUTSCENE_2A
	dw Func_9c000 ; CUTSCENE_2B
	dw Func_9c000 ; CUTSCENE_2C
	dw Func_9c000 ; CUTSCENE_2D
	dw Func_9c000 ; CUTSCENE_2E
	dw Func_9c000 ; CUTSCENE_2F
	dw $460f ; CUTSCENE_30
	dw Func_9c000 ; CUTSCENE_31
	dw Func_9c000 ; CUTSCENE_32
	dw Func_9c000 ; CUTSCENE_33
	dw Func_9c000 ; CUTSCENE_34
	dw Func_9c000 ; CUTSCENE_35
	dw Func_9c000 ; CUTSCENE_36
	dw $45e3 ; CUTSCENE_37
	dw $45f9 ; CUTSCENE_38
	dw $4623 ; CUTSCENE_39
	dw $4636 ; CUTSCENE_3A
	dw Func_9c000 ; CUTSCENE_3B
	dw $464d ; CUTSCENE_3C
	dw $469d ; CUTSCENE_3D
	dw Func_9c000 ; CUTSCENE_3E
	dw Func_9c000 ; CUTSCENE_3F
	dw Func_9c000 ; CUTSCENE_40
	dw Func_9c000 ; CUTSCENE_41
	dw Func_9c000 ; CUTSCENE_42
	dw $466e ; CUTSCENE_43
	dw $47e8 ; CUTSCENE_44
	dw Func_9c000 ; CUTSCENE_45
	dw Func_9c000 ; CUTSCENE_46
	dw Func_9c000 ; CUTSCENE_47
	dw Func_9c000 ; CUTSCENE_48
	dw $4593 ; CUTSCENE_49
	dw $46e7 ; CUTSCENE_4A
	dw Func_9c000 ; CUTSCENE_4B
	dw $4700 ; CUTSCENE_4C
	dw Func_9c000 ; CUTSCENE_4D
	dw $4731 ; CUTSCENE_4E
	dw $4742 ; CUTSCENE_4F
	dw Func_9c000 ; CUTSCENE_50
	dw $4760 ; CUTSCENE_51
	dw Func_9c000 ; CUTSCENE_52
	dw Func_9c000 ; CUTSCENE_53
	dw $4689 ; CUTSCENE_54
	dw $47d9 ; CUTSCENE_55
	dw $477f ; CUTSCENE_56
	dw $4796 ; CUTSCENE_57
	dw $47a5 ; CUTSCENE_58
	dw Func_9c000 ; CUTSCENE_59
	dw Func_9c000 ; CUTSCENE_5A
; 0x9c15e

InitPrologueSequence: ; 9c15e (27:415e)
	farcall _InitPrologueSequence
	ret
; 0x9c16e

Func_9c16e: ; 9c16e (27:416e)
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

Func_9c187: ; 9c187 (27:4187)
	ld b, BANK(Pals_b8240)
	ld hl, Pals_b8240
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b88c0)
	ld hl, Pals_b88c0
	call LoadFarPalsToTempPals2
	call LoadCutscenes3Gfx
	jp Func_9ca84
; 0x9c19d

Func_9c19d: ; 9c19d (27:419d)
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

Func_9c1b6: ; 9c1b6 (27:41b6)
	call LoadCutscenes3Gfx
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_b956d)
	ld [wTempBank], a
	ld hl, BGMap_b956d
	ld bc, v1BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ld a, BANK(BGMap_b951f)
	ld [wTempBank], a
	ld hl, BGMap_b951f
	ld bc, v0BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld b, BANK(Pals_b8080)
	ld hl, Pals_b8080
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8900)
	ld hl, Pals_b8900
	call LoadFarPalsToTempPals2
	jp Func_9d01a
; 0x9c209

Func_9c209: ; 9c209 (27:4209)
	call LoadCutscenes1Gfx
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_b9424)
	ld [wTempBank], a
	ld hl, BGMap_b9424
	ld bc, v1BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ld a, BANK(BGMap_b93c8)
	ld [wTempBank], a
	ld hl, BGMap_b93c8
	ld bc, v0BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld b, BANK(Pals_b8000)
	ld hl, Pals_b8000
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b89c0)
	ld hl, Pals_b89c0
	call LoadFarPalsToTempPals2
	jp Func_9d158
; 0x9c25c

Func_9c25c: ; 9c25c (27:425c)
	ld hl, Pals_b8ac0
;	fallthrough

Func_9c25f: ; 9c25f (27:425f)
	ld b, BANK(Pals_b8ac0)
	call LoadFarPalsToTempPals2
	ld hl, Pals_b8200
	ld b, BANK(Pals_b8200)
	call LoadFarPalsToTempPals1

	ld a, LCDC_BG9C00
	ld [w2d800], a
	call LoadCutscenes2Gfx
	call Func_9ca6a
	jp Func_9cbaf
; 0x9c27a

Func_9c27a: ; 9c27a (27:427a)
	ld hl, Pals_b8b00
	jr Func_9c25f
; 0x9c27f

Func_9c27f: ; 9c27f (27:427f)
	ld hl, Pals_b8b80
	jr Func_9c25f
; 0x9c284

Func_9c284: ; 9c284 (27:4284)
	ld hl, Pals_b8b40
	jr Func_9c25f
; 0x9c289

Func_9c289: ; 9c289 (27:4289)
	ld hl, Pals_b8bc0
	jr Func_9c25f
; 0x9c28e

Func_9c28e: ; 9c28e (27:428e)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a80)
	ld hl, Pals_b8a80
	call LoadFarPalsToTempPals2
	call LoadCutscenes2Gfx
	jp Func_9ca77
; 0x9c2a4

Func_9c2a4: ; 9c2a4 (27:42a4)
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

Func_9c2bd: ; 9c2bd (27:42bd)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8d40)
	ld hl, Pals_b8d40
	call LoadFarPalsToTempPals2
	call LoadCutscenes4Gfx
	jp Func_9ca77
; 0x9c2d3

Func_9c2d3: ; 9c2d3 (27:42d3)
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

Func_9c2ec: ; 9c2ec (27:42ec)
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

Func_9c305: ; 9c305 (27:4305)
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

Func_9c31e: ; 9c31e (27:431e)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e00)
	ld hl, Pals_b8e00
	call LoadFarPalsToTempPals2
	ld a, LCDC_BG9C00
	ld [w2d800], a
	call LoadCutscenes4Gfx
	jp Func_9cbbc
; 0x9c339

Func_9c339: ; 9c339 (27:4339)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a40)
	ld hl, Pals_b8a40
	call LoadFarPalsToTempPals2
	ld a, LCDC_BG9C00
	ld [w2d800], a
	call LoadCutscenes2Gfx
	call Func_9ca6a
	jp Func_9cbbc
; 0x9c357

Func_9c357: ; 9c357 (27:4357)
	ld b, BANK(Pals_b81c0)
	ld hl, Pals_b81c0
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8e80)
	ld hl, Pals_b8e80
	call LoadFarPalsToTempPals2
	ld a, LCDC_WINON
	ld [w2d800], a
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

	INCROM $9c386, $9c832

LoadCutscenes1Gfx: ; 9c832 (27:4832)
	ld a, BANK(Cutscenes1Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes1Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jr LoadCutscenes5Gfx

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(Cutscenes1Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes1Gfx
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	jr Func_9c8e9
; 0x9c873

LoadCutscenes2Gfx: ; 9c873 (27:4873)
	ld a, BANK(Cutscenes2Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes2Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp LoadCutscenes5Gfx ; can be jr
; 0x9c891

LoadCutscenes3Gfx: ; 9c891 (27:4891)
	ld a, BANK(Cutscenes3Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes3Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp LoadCutscenes5Gfx ; can be jr
; 0x9c8af

LoadCutscenes4Gfx: ; 9c8af (27:48af)
	ld a, BANK(Cutscenes4Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes4Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp LoadCutscenes5Gfx ; unnecessary jump
; 0x9c8cd

LoadCutscenes5Gfx: ; 9c8cd (27:48cd)
	ld a, BANK(Cutscenes5Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes5Gfx
	ld bc, v0Tiles2
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x9c8e9

Func_9c8e9: ; 9c8e9 (27:48e9)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(Cutscenes5Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes5Gfx
	ld bc, v1Tiles2
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ret
; 0x9c90c

	INCROM $9c90c, $9c959

LoadCutscenes8Gfx: ; 9c959 (27:4959)
	ld a, BANK(Cutscenes8Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes8Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp LoadCutscenes5Gfx
; 0x9c977

	INCROM $9c977, $9ca41

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

	INCROM $9ca91, $9ca9e

Func_9ca9e: ; 9ca9e (27:4a9e)
	ld hl, BGMap_b996e
	call LoadCutsceneAttrmap0
	ld hl, BGMap_b9920
	call LoadCutsceneTilemap0
	ret
; 0x9caab

	INCROM $9caab, $9cba2

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

	INCROM $9cbd6, $9cbe3

Func_9cbe3: ; 9cbe3 (27:4be3)
	ld hl, BGMap_b9e3b
	call LoadCutsceneAttrmap1
	ld hl, BGMap_b9dea
	call LoadCutsceneTilemap1
	ret
; 0x9cbf0

	INCROM $9cbf0, $9cc9c

VBlank_9cc9c: ; 9cc9c (27:4c9c)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
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

	ld a, [w2d800]
	and a
	jr z, .asm_9cccf
	ld hl, rLCDC
	xor [hl]
	ld [hl], a
	xor a
	ld [w2d800], a

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
.func_end
; 0x9ccf9

	INCROM $9ccf9, $9cd03

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

	INCROM $9d18b, $9d797

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
	ld a, LCDC_BG9C00
	ld [w2d800], a
	jp Func_9cd03

.Func_9d7ee
	ld c, $3c
	jp Func_9cd0a

.Func_9d7f3
	ld a, LCDC_BG9C00
	ld [w2d800], a
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

	INCROM $9da31, $9f0a5

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

	INCROM $9f0b5, $9f0bc

Func_9f0bc: ; 9f0bc (27:70bc)
	ld b, $2f
	jp AddOWSprite
; 0x9f0c1

	INCROM $9f0c1, $9f0d0

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
	ld de, $51fd
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
	dw $5348
	dw $534b
	dw $534e
	dw $5351
	dw $5354
	dw $5363
	dw $5372
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
	ld de, Data_bd377
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
	ld de, $5453
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
	ld de, $546f
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
	dw $55c3
	dw $55cc
	dw $55d5
	dw $55d8
	dw $55dd
	dw $55e6
	dw $5605
	dw $5608
	dw $560f
	dw $5612
; 0x9f1d8

	INCROM $9f1d8, $9f38d

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
	ld de, $5ce6
	jp Func_9f0bc
.asm_9f3b8
	ld b, $01
	call Func_9f0d0
	jr z, .asm_9f3a2
	jr .asm_9f3b2

.framesets
	dw $5dcc
	dw $5dc3
	dw $5dc6
	dw $5da9
	dw $5dc0
	dw $5dc9
; 0x9f3cd

	INCROM $9f3cd, $9fb53

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
	ld de, $4000
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
	ld de, $4122
	jp Func_9f0bc
; 0x9fc8b

	INCROM $9fc8b, $a0000
