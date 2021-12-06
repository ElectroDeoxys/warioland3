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
	ld [wTempSCY], a
	ldh [rSCX], a
	ld [wTempSCX], a
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
	ld a, BANK(Cutscenes1Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes1Gfx
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
	dw LoadPrologueGfx ; CUTSCENE_02
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
	dw $427a ; CUTSCENE_10
	dw $4305 ; CUTSCENE_11
	dw Func_9c000 ; CUTSCENE_12
	dw $431e ; CUTSCENE_13
	dw $4339 ; CUTSCENE_14
	dw $4357 ; CUTSCENE_15
	dw Func_9c000 ; CUTSCENE_16
	dw $4284 ; CUTSCENE_17
	dw $457a ; CUTSCENE_18
	dw $4386 ; CUTSCENE_19
	dw Func_9c000 ; CUTSCENE_1A
	dw $439c ; CUTSCENE_1B
	dw Func_9c000 ; CUTSCENE_1C
	dw $427f ; CUTSCENE_1D
	dw $4423 ; CUTSCENE_1E
	dw $45a6 ; CUTSCENE_1F
	dw Func_9c000 ; CUTSCENE_20
	dw $45c5 ; CUTSCENE_21
	dw $4476 ; CUTSCENE_22
	dw Func_9c000 ; CUTSCENE_23
	dw $44b9 ; CUTSCENE_24
	dw $4289 ; CUTSCENE_25
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

LoadPrologueGfx: ; 9c16e (27:416e)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8c00)
	ld hl, Pals_b8c00
	call LoadFarPalsToTempPals2

	call Func_9c832
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
	call LoadCutscenes8Gfx
	jp Func_9ca84
; 0x9c19d

Func_9c19d: ; 9c19d (27:419d)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8ec0)
	ld hl, Pals_b8ec0
	call LoadFarPalsToTempPals2
	call Func_9c959
	call Func_9ca6a
	jp Func_9cba2
; 0x9c1b6

Func_9c1b6: ; 9c1b6 (27:41b6)
	call LoadCutscenes8Gfx
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
	call Func_9c832
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
	ld b, BANK(Pals_b8ac0)
	call LoadFarPalsToTempPals2
	ld hl, Pals_b8200
	ld b, BANK(Pals_b8200)
	call LoadFarPalsToTempPals1

	ld a, $08
	ld [w2d800], a
	call LoadCutscenes7Gfx
	call Func_9ca6a
	jp Func_9cbaf
; 0x9c27a

	INCROM $9c27a, $9c28e

Func_9c28e: ; 9c28e (27:428e)
	ld b, BANK(Pals_b8200)
	ld hl, Pals_b8200
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a80)
	ld hl, Pals_b8a80
	call LoadFarPalsToTempPals2
	call LoadCutscenes7Gfx
	jp Func_9ca77
; 0x9c2a4

Func_9c2a4: ; 9c2a4 (27:42a4)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8a00)
	ld hl, Pals_b8a00
	call LoadFarPalsToTempPals2
	call Func_9c832
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
	call LoadCutscenes9Gfx
	jp Func_9ca77
; 0x9c2d3

Func_9c2d3: ; 9c2d3 (27:42d3)
	ld b, BANK(Pals_b8040)
	ld hl, Pals_b8040
	call LoadFarPalsToTempPals1
	ld b, BANK(Pals_b8dc0)
	ld hl, Pals_b8dc0
	call LoadFarPalsToTempPals2
	call LoadCutscenes9Gfx
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
	call Func_9c832
	call Func_9ca77
	jp Func_9cbe3
; 0x9c305

	INCROM $9c305, $9c832

Func_9c832: ; 9c832 (27:4832)
	ld a, BANK(Cutscenes6Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes6Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jr Func_9c8cd

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
	jr Func_9c8e9
; 0x9c873

LoadCutscenes7Gfx: ; 9c873 (27:4873)
	ld a, BANK(Cutscenes7Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes7Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp Func_9c8cd ; can be jr
; 0x9c891

LoadCutscenes8Gfx: ; 9c891 (27:4891)
	ld a, BANK(Cutscenes8Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes8Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp Func_9c8cd ; can be jr
; 0x9c8af

LoadCutscenes9Gfx: ; 9c8af (27:48af)
	ld a, BANK(Cutscenes9Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes9Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp Func_9c8cd ; unnecessary jump
; 0x9c8cd

Func_9c8cd: ; 9c8cd (27:48cd)
	ld a, BANK(Cutscenes10Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes10Gfx
	ld bc, v0Tiles2
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	ret
; 0x9c8e9

Func_9c8e9: ; 9c8e9 (27:48e9)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(Cutscenes10Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes10Gfx
	ld bc, v1Tiles2
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ret
; 0x9c90c

	INCROM $9c90c, $9c959

Func_9c959: ; 9c959 (27:4959)
	ld a, BANK(Cutscenes3Gfx)
	ld [wTempBank], a
	ld hl, Cutscenes3Gfx
	ld bc, v0Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jp Func_9c8cd
; 0x9c977

	INCROM $9c977, $9ca41

Func_9ca41: ; 9ca41 (27:4a41)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
;	fallthrough
Func_9ca45: ; 9ca45 (27:4a45)
	ld bc, v0BGMap0
;	fallthrough
Func_9ca48: ; 9ca48 (27:4a48)
	ld a, $2e
	ld [wTempBank], a
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	xor a
	ldh [rVBK], a
	ret
; 0x9ca61

Func_9ca61: ; 9ca61 (27:4a61)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
;	fallthrough
Func_9ca65: ; 9ca65 (27:4a65)
	ld bc, v0BGMap1
	jr Func_9ca48
; 0x9ca6a

Func_9ca6a: ; 9ca6a (27:4a6a)
	ld hl, BGMap_b9113
	call Func_9ca41
	ld hl, BGMap_b9100
	call Func_9ca45
	ret
; 0x9ca77

Func_9ca77: ; 9ca77 (27:4a77)
	ld hl, BGMap_b9235
	call Func_9ca41
	ld hl, BGMap_b91e7
	call Func_9ca45
	ret
; 0x9ca84

Func_9ca84: ; 9ca84 (27:4a84)
	ld hl, BGMap_b94d1
	call Func_9ca41
	ld hl, BGMap_b9475
	call Func_9ca45
	ret
; 0x9ca91

	INCROM $9ca91, $9cba2

Func_9cba2: ; 9cba2 (27:4ba2)
	ld hl, BGMap_b919b
	call Func_9ca61
	ld hl, BGMap_b914a
	call Func_9ca65
	ret
; 0x9cbaf

Func_9cbaf: ; 9cbaf (27:4baf)
	ld hl, BGMap_b92c2
	call Func_9ca61
	ld hl, BGMap_b926d
	call Func_9ca65
	ret
; 0x9cbbc

	INCROM $9cbbc, $9cbe3

Func_9cbe3: ; 9cbe3 (27:4be3)
	ld hl, BGMap_b9e3b
	call Func_9ca61
	ld hl, BGMap_b9dea
	call Func_9ca65
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
	ld a, [wTempSCY]
	ldh [rSCY], a
	ld a, [wTempSCX]
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
	ld b, BANK(Func_854cc)
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [w2d0d0]
	and a
	call nz, Func_854cc
	ld a, [w2d0d6]
	and a
	call nz, Func_854c7
	pop af
	bankswitch

	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0x9ccf9

	INCROM $9ccf9, $9d01a

Func_9d01a: ; 9d01a (27:501a)
	ld hl, wOWObj2
	ld a, $48
	ld [hli], a
	ld [hl], $50
	ld a, $01
	ld hl, wOWObj2Unk6
	call Func_3b93
	jp Func_9f11e
; 0x9d02d

	INCROM $9d02d, $9d0e6

Func_9d0e6: ; 9d0e6 (27:50e6)
	ld a, $03
	ld [wOWObj1], a
	ld hl, wOWObj2
	ld a, $82
	ld [hli], a
	ld [hl], $71
	ld a, $01
	ld hl, wOWObj2Unk6
	call Func_3b93
	ld hl, wOWObj3
	ld a, $82
	ld [hli], a
	ld [hl], $2f
	ld a, $02
	ld hl, wOWObj3Unk6
	call Func_3b93
	jp Func_9f146
; 0x9d10e

	INCROM $9d10e, $9d158

Func_9d158: ; 9d158 (27:5158)
	ld hl, wOWObj2
	ld a, $58
	ld [hli], a
	ld [hl], $54
	ld a, $09
	ld hl, wOWObj2Unk6
	call Func_3b93

	ld hl, wOWObj3
	ld a, $43
	ld [hli], a
	ld [hl], $40
	ld a, $03
	ld hl, wOWObj3Unk6
	call Func_3b93

	ld hl, wOWObj4
	ld a, $58
	ld [hli], a
	ld [hl], $54
	ld a, $0a
	ld hl, wOWObj4Unk6
	call Func_3b93
	jp Func_9f174
; 0x9d18b

	INCROM $9d18b, $9f0a5

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

	INCROM $9f0e0, $9f11e

Func_9f11e: ; 9f11e (27:711e)
	ld bc, wOWObj2Unk6
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
	ld bc, wOWObj2Unk6
	call .Func_9f15e
	ld bc, wOWObj3Unk6
	call .Func_9f15e
	ld de, wOWObj2
	call Func_9fb97
	ld de, wOWObj3
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
	ld bc, wOWObj4Unk6
	call .Func_9f189
	ld bc, wOWObj2Unk6
	call .Func_9f189
	ld bc, wOWObj3Unk6
	call .Func_9f189
	ld bc, wOWObj5Unk6
;	fallthrough

.Func_9f189
	ld a, [bc]
	and a
	ret z
	ld hl, $71c4
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
; 0x9f1c4

	INCROM $9f1c4, $9fb53

Func_9fb53: ; 9fb53 (27:7b53)
	ld a, [wOWObj1]
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
	ld hl, w2d184
	ld c, $06
	ld b, $03
	jr Func_9fb53
; 0x9fba9

	INCROM $9fba9, $a0000
