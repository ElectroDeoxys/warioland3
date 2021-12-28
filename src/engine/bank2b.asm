Func_ac000: ; ac000 (2b:4000)
	ld h, b
	ld l, c
	res 1, l
	ld b, $57
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac00b

	INCROM $ac00b, $ac02c

Func_ac02c: ; ac02c (2b:402c)
	ld h, b
	ld l, c
	res 1, l
	ld b, $01
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac037

Func_ac037: ; ac037 (2b:4037)
	ld h, b
	ld l, c
	res 1, l
	ld b, $2a
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac042

Func_ac042: ; ac042 (2b:4042)
	ld b, $57
	jp AddOWSpriteWithScroll
; 0xac047

	INCROM $ac047, $ac056

Func_ac056: ; ac056 (2b:4056)
	ld de, $76ca
	call Func_ac02c
	ld de, $75c3
	ld b, $01
	jp AddOWSprite
; 0xac064

; return nz if animation is not finished yet
Func_ac064: ; ac064 (2b:4064)
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	set 2, l
	xor a
	ld [hli], a
	ld [hli], a
	ld a, e
	ld [hl], a
	ld b, h
	ld c, l
	ret
; 0xac074

	INCROM $ac074, $ac3d9

Func_ac3d9: ; ac3d9 (2b:43d9)
	ld bc, w2d180Unk6
	call Func_ac409
	ld bc, wOWObj1Unk6
	call Func_ac409
	ld bc, wOWObj2Unk6
	call Func_ac409
	ld bc, wOWObj3Unk6
	call Func_ac409
	ld bc, wOWObj4Unk6
	call Func_ac409
	ld bc, wOWObj5Unk6
	jp Func_ac409
; 0xac3fd

Func_ac3fd: ; ac3fd (2b:43fd)
	ld bc, wOWObj8Unk6
	call Func_ac409
	ld bc, wOWObj9Unk6
	jp Func_ac409
; 0xac409

Func_ac409: ; ac409 (2b:4409)
	ld a, [bc]
	jumptable
	dw .Func_ac450
	dw Func_ac056
	dw .Func_ac451
	dw .Func_ac456
	dw .Func_ac45b
	dw .Func_ac460
	dw .Func_ac465
	dw .Func_ac46a
	dw .Func_ac46f
	dw .Func_ac474
	dw .Func_ac479
	dw .Func_ac48e
	dw .Func_ac493
	dw .Func_ac4a8
	dw .Func_ac4ad
	dw .Func_ac4b2
	dw .Func_ac4b7
	dw .Func_ac4bc
	dw .Func_ac4c1
	dw .Func_ac4c7
	dw .Func_ac4cd
	dw .Func_ac4e3
	dw .Func_ac4ee
	dw .Func_ac4f4

.Func_ac43b
	call Func_ac000
.Func_ac43e
	ld de, $644a
	jp Func_ac042

.Func_ac444
	call Func_ac000
	ld e, $00
.Func_ac449
	call Func_ac064
	jr nz, .Func_ac43e
	jr Func_ac409

.Func_ac450
	ret

.Func_ac451
	ld de, $6741
	jr .Func_ac43b

.Func_ac456
	ld de, $6748
	jr .Func_ac43b

.Func_ac45b
	ld de, $674b
	jr .Func_ac43b

.Func_ac460
	ld de, $6774
	jr .Func_ac43b

.Func_ac465
	ld de, $677d
	jr .Func_ac43b

.Func_ac46a
	ld de, $6780
	jr .Func_ac43b

.Func_ac46f
	ld de, $6793
	jr .Func_ac43b

.Func_ac474
	ld de, $67a3
	jr .Func_ac43b

.Func_ac479
	ld de, $67a6
	call .Func_ac43b
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_0F3
	ret

.Func_ac48e
	ld de, $67b7
	jr .Func_ac43b

.Func_ac493
	ld de, $67c4
	call .Func_ac43b
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_0F4
	ret

.Func_ac4a8
	ld de, $67ed
	jr .Func_ac43b

.Func_ac4ad
	ld de, $67b7
	jr .Func_ac444

.Func_ac4b2
	ld de, $6783
	jr .Func_ac43b

.Func_ac4b7
	ld de, $678a
	jr .Func_ac444

.Func_ac4bc
	ld de, $6796
	jr .Func_ac444

.Func_ac4c1
	ld de, $67f0
	jp .Func_ac43b

.Func_ac4c7
	ld de, $67f5
	jp .Func_ac43b

.Func_ac4cd
	ld de, $6d0b
	call Func_ac037
	ld e, $00
	call Func_ac064
	jp z, Func_ac409
	ld de, $6b5c
	ld b, $2a
	jp AddOWSpriteWithScroll

.Func_ac4e3
	ld de, $67fa
	call Func_ac000
	ld e, $16
	jp .Func_ac449

.Func_ac4ee
	ld de, Func_ae801
	jp .Func_ac43b

.Func_ac4f4
	ld de, $680a
	jp .Func_ac43b
; 0xac4fa

Func_ac4fa: ; ac4fa (2b:44fa)
	ld hl, w2d14c
	ld a, [hl]
	and a
	jr nz, .asm_ac509
	play_sfx SFX_12A
.asm_ac509
	inc [hl]
	ld c, $24
	ld a, [hl]
	cp c
	jr c, .asm_ac514
	xor a
	ld [w2d14c], a
.asm_ac514
	ret
; 0xac515

Func_ac515: ; ac515 (2b:4515)
	ld hl, w2d14c
	inc [hl]
	ld a, [hl]
	cp $08
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_137
	ret
; 0xac528

Func_ac528: ; ac528 (2b:4528)
	call Func_ac547
	ld a, [w2d146]
	and a
	ret z
	ld hl, w2d149
	ld e, [hl]
	inc l
	ld d, [hl]
	ld a, [w2d14b]
	ld b, a
	ld hl, w2d140
	ld a, [w2d14d]
	and a
	jp z, AddOWSpriteWithScroll
	jp AddOWSprite

Func_ac547: ; ac547 (2b:4547)
	ld a, [w2d146]
	jumptable
	dw .Func_ac5c5
	dw .Func_ac5c6
	dw .Func_ac5cb
	dw .Func_ac5d0
	dw .Func_ac5da
	dw .Func_ac5e4
	dw .Func_ac5ee
	dw .Func_ac60f
	dw .Func_ac618
	dw .Func_ac621
	dw .Func_ac62a
	dw .Func_ac62f
	dw .Func_ac63a
	dw .Func_ac63f
	dw .Func_ac644
	dw .Func_ac649
	dw .Func_ac654
	dw .Func_ac696
	dw .Func_ac6a1
	dw .Func_ac6a7
	dw .Func_ac6b4
	dw .Func_ac6c1
	dw .Func_ac6c7
	dw .Func_ac6d2
	dw .Func_ac6d8
	dw .Func_ac6e3
	dw .Func_ac6e9
	dw .Func_ac73c
	dw .Func_ac747
	dw .Func_ac74d
	dw .Func_ac758
	dw .Func_ac763
	dw .Func_ac769
	dw .Func_ac76f
	dw .Func_ac77a
	dw .Func_ac792
	dw .Func_ac79d
	dw .Func_ac7a3
	dw .Func_ac7a9
	dw .Func_ac7d0
	dw .Func_ac7db
	dw .Func_ac7e6
	dw .Func_ac7f1
	dw .Func_ac80e
	dw .Func_ac814
	dw .Func_ac81a
	dw .Func_ac825
	dw .Func_ac82b
	dw .Func_ac836
	dw .Func_ac841
	dw .Func_ac84c
	dw .Func_ac857
	dw .Func_ac862
	dw .Func_ac86d
	dw .Func_ac878
	dw .Func_ac883
	dw .Func_ac88e
	dw .Func_ac899
	dw .Func_ac8a4
	dw .Func_ac8ad
	dw .Func_ac8b2

.Func_ac5c5
	ret

.Func_ac5c6
	ld de, $4d18
	jr .asm_ac5f8

.Func_ac5cb
	ld de, $4d15
	jr .asm_ac5f8

.Func_ac5d0
	ld de, $4cbe
	call .asm_ac5f8
	ld b, $0c
	jr .asm_ac602

.Func_ac5da
	ld de, $4cc5
	call .asm_ac5f8
	ld b, $0d
	jr .asm_ac602

.Func_ac5e4
	ld de, $4d0b
	call .asm_ac5f8
	ld b, $02
	jr .asm_ac602

.Func_ac5ee
	ld de, $4d10
	call .asm_ac5f8
	ld b, $02
	jr .asm_ac602
.asm_ac5f8
	ld a, [w2d14b]
	ld b, a
	ld hl, w2d144
	jp UpdateOWAnimation
.asm_ac602
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	ld a, b
	call Func_ac8d4
	jp Func_ac547

.Func_ac60f
	ld de, $49b4
	call .asm_ac5f8
	jp Func_ac4fa

.Func_ac618
	ld de, $49c5
	call .asm_ac5f8
	jp Func_ac4fa

.Func_ac621
	ld de, $49fe
	call .asm_ac5f8
	jp Func_ac4fa

.Func_ac62a
	ld de, $4a20
	jr .asm_ac5f8

.Func_ac62f
	ld de, $63ec
	call .asm_ac5f8
	ld b, $0a
	jp .asm_ac602

.Func_ac63a
	ld de, $4252
	jr .asm_ac5f8

.Func_ac63f
	ld de, $425f
	jr .asm_ac5f8

.Func_ac644
	ld de, $4de4
	jr .asm_ac5f8

.Func_ac649
	ld de, $4de4
	call .asm_ac5f8
	ld b, $02
	jp .asm_ac602

.Func_ac654
	ld de, $66a5
	call .asm_ac5f8
	ld b, $11
	call .asm_ac602
.asm_ac65f
	ld a, [w2d146]
	cp $02
	ret z
	ld hl, w2d142
	ld a, [w2d14c]
	and a
	jr z, .asm_ac67e
	dec a
	jr z, .asm_ac672
	ret
.asm_ac672
	ld a, [hl]
	cp $00
	ret z
	cp $04
	ret z
	xor a
	ld [w2d14c], a
	ret
.asm_ac67e
	ld a, [hl]
	cp $00
	jr z, .asm_ac688
	cp $04
	jr z, .asm_ac688
	ret
.asm_ac688
	play_sfx SFX_0F1
	ld a, $01
	ld [w2d14c], a
	ret

.Func_ac696
	ld de, $66c2
	call .asm_ac5f8
	ld b, $12
	jp .asm_ac602

.Func_ac6a1
	ld de, $66c7
	jp .asm_ac5f8

.Func_ac6a7
	ld de, $66a5
	call .asm_ac5f8
	ld b, $38
	call .asm_ac602
	jr .asm_ac65f

.Func_ac6b4
	ld de, $66ca
	call .asm_ac5f8
	ld b, $39
	call .asm_ac602
	jr .asm_ac65f

.Func_ac6c1
	ld de, $68ec
	jp .asm_ac5f8

.Func_ac6c7
	ld de, $68f5
	call .asm_ac5f8
	ld b, $19
	jp .asm_ac602

.Func_ac6d2
	ld de, $6902
	jp .asm_ac5f8

.Func_ac6d8
	ld de, $6902
	call .asm_ac5f8
	ld b, $19
	jp .asm_ac602

.Func_ac6e3
	ld de, $690d
	jp .asm_ac5f8

.Func_ac6e9
	ld de, $6913
	call .asm_ac5f8
	ld b, $0d
	call .asm_ac602
	ld a, [w2d146]
	cp $0d
	ret z
	ld hl, w2d142
	ld a, [w2d14c]
	and a
	jr z, .asm_ac718
	dec a
	jr z, .asm_ac70a
	dec a
	jr z, .asm_ac713
	ret
.asm_ac70a
	ld a, [hl]
	cp $0d
.asm_ac70d
	ret z
	xor a
	ld [w2d14c], a
	ret
.asm_ac713
	ld a, [hl]
	cp $0c
	jr .asm_ac70d
.asm_ac718
	ld a, [hl]
	cp $0c
	jr z, .asm_ac730
	cp $0d
	jr z, .asm_ac722
	ret
.asm_ac722
	play_sfx SFX_0F2
	ld a, $01
.asm_ac72c
	ld [w2d14c], a
	ret
.asm_ac730
	play_sfx SFX_011
	ld a, $02
	jr .asm_ac72c

.Func_ac73c
	ld de, Func_ae924
	call .asm_ac5f8
	ld b, $1c
	jp .asm_ac602

.Func_ac747
	ld de, $6931
	jp .asm_ac5f8

.Func_ac74d
	ld de, $6b27
	call .asm_ac5f8
	ld b, $1f
	jp .asm_ac602

.Func_ac758
	ld de, $6b32
	call .asm_ac5f8
	ld b, $20
	jp .asm_ac602

.Func_ac763
	ld de, $6b3f
	jp .asm_ac5f8

.Func_ac769
	ld de, $6b42
	jp .asm_ac5f8

.Func_ac76f
	ld de, $6b45
	call .asm_ac5f8
	ld b, $0a
	jp .asm_ac602

.Func_ac77a
	ld de, $6ccb
	call .asm_ac5f8
	ld a, [wOWAnimationFinished]
	ld [w2d14e], a
	cp $ff
	ret nz
	play_sfx SFX_0F5
	ret

.Func_ac792
	ld de, $6ce2
	call .asm_ac5f8
	ld b, $25
	jp .asm_ac602

.Func_ac79d
	ld de, $6cf7
	jp .asm_ac5f8

.Func_ac7a3
	ld de, $6cfa
	jp .asm_ac5f8

.Func_ac7a9
	ld de, $703c
	call .asm_ac5f8
	call .Func_ac7b7
	ld b, $02
	jp .asm_ac602

.Func_ac7b7
	ld a, [w2d142]
	cp $07
	ret nz
	ld a, [w2d147]
	and a
	ret nz
	xor $01
	ld [w2d147], a
	play_sfx SFX_LAND
	ret

.Func_ac7d0
	ld de, $706b
	call .asm_ac5f8
	ld b, $02
	jp .asm_ac602

.Func_ac7db
	ld de, $708c
	call .asm_ac5f8
	ld b, $2d
	jp .asm_ac602

.Func_ac7e6
	ld de, $7098
	call .asm_ac5f8
	ld b, $02
	jp .asm_ac602

.Func_ac7f1
	ld de, $709d
	call .asm_ac5f8
	call .Func_ac7ff
	ld b, $02
	jp .asm_ac602

.Func_ac7ff
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_LAND
	ret

.Func_ac80e
	ld de, $709d
	jp .asm_ac5f8

.Func_ac814
	ld de, $70ac
	jp .asm_ac5f8

.Func_ac81a
	ld de, $714d
	call .asm_ac5f8
	ld b, $2e
	jp .asm_ac602

.Func_ac825
	ld de, $7160
	jp .asm_ac5f8

.Func_ac82b
	ld de, $7163
	call .asm_ac5f8
	ld b, $29
	jp .asm_ac602

.Func_ac836
	ld de, $4439
	call .asm_ac5f8
	ld b, $02
	jp .asm_ac602

.Func_ac841
	ld de, $4446
	call .asm_ac5f8
	ld b, $02
	jp .asm_ac602

.Func_ac84c
	ld de, $4453
	call .asm_ac5f8
	ld b, $0d
	jp .asm_ac602

.Func_ac857
	ld de, $445a
	call .asm_ac5f8
	ld b, $0c
	jp .asm_ac602

.Func_ac862
	ld de, $4461
	call .asm_ac5f8
	ld b, $01
	jp .asm_ac602

.Func_ac86d
	ld de, $446a
	call .asm_ac5f8
	ld b, $01
	jp .asm_ac602

.Func_ac878
	ld de, $4473
	call .asm_ac5f8
	ld b, $0c
	jp .asm_ac602

.Func_ac883
	ld de, $447c
	call .asm_ac5f8
	ld b, $0d
	jp .asm_ac602

.Func_ac88e
	ld de, $4485
	call .asm_ac5f8
	ld b, $0d
	jp .asm_ac602

.Func_ac899
	ld de, $4488
	call .asm_ac5f8
	ld b, $0c
	jp .asm_ac602

.Func_ac8a4
	ld de, $6b5a
.asm_ac8a7
	call .asm_ac5f8
	jp Func_ac515

.Func_ac8ad
	ld de, $6b63
	jr .asm_ac8a7

.Func_ac8b2
	ld de, $4316
	jp .asm_ac5f8
; 0xac8b8

	INCROM $ac8b8, $ac8d4

Func_ac8d4: ; ac8d4 (2b:48d4)
	ld [w2d146], a
	ld b, $00
	cp $07
	jr c, .asm_ac91e
	inc b
	cp $0b
	jr c, .asm_ac91e
	inc b
	cp $0c
	jr c, .asm_ac91e
	inc b
	cp $0e
	jr c, .asm_ac91e
	inc b
	cp $10
	jr c, .asm_ac91e
	inc b
	cp $15
	jr c, .asm_ac91e
	inc b
	cp $1d
	jr c, .asm_ac91e
	inc b
	cp $22
	jr c, .asm_ac91e
	inc b
	cp $26
	jr c, .asm_ac91e
	inc b
	cp $2d
	jr c, .asm_ac91e
	inc b
	cp $30
	jr c, .asm_ac91e
	inc b
	cp $3a
	jr c, .asm_ac91e
	inc b
	cp $3c
	jr c, .asm_ac91e
	inc b
	cp $3d
	jr c, .asm_ac91e ; unnecessary jump

.asm_ac91e
	ld hl, w2d148
	ld a, [hl]
	cp b
	call nz, .Func_ac930
	ld hl, w2d144
	xor a
	ld [hli], a
	ld [hl], a
	ld [w2d14c], a
	ret

.Func_ac930
	ld a, b
	ld [hli], a ; w2d148
	add a ; *2
	ld c, a
	add a ; *4
	add c ; *6
	ld de, .data
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, [de]
	ld [hli], a ; w2d149
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a ; w2d14b
	inc de
	ld a, [de]
	ld [wHDMABank], a

	ld hl, wHDMA
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $7f
	ld [hl], a

	xor a
	ld [w2d158], a
	ret

data_ac962: MACRO
	dw \1 ; sprite ptr
	db \2 ; sprite bank
	dba \3 ; tiles
ENDM

.data
	data_ac962 $4a82, $05, WarioIdleGfx
	data_ac962 $426c, $05, WarioWalkGfx
	data_ac962 $606a, $05, WarioThrowGfx
	data_ac962 $4000, $05, WarioIdleGfx
	data_ac962 $49cc, $35, WarioUnk1Gfx
	data_ac962 $65fe, $2a, WarioUnk1Gfx
	data_ac962 $66e7, $2a, WarioUnk2Gfx
	data_ac962 $6934, $2a, WarioUnk3Gfx
	data_ac962 $6b5c, $2a, WarioSleepGfx
	data_ac962 $6d1e, $2a, WarioUnk4Gfx
	data_ac962 $70c5, $2a, WarioUnk5Gfx
	data_ac962 $431b, $7f, WarioIdleGfx
	data_ac962 $673c, $05, WarioHotGfx
	data_ac962 $4000, $7f, WarioUnk1Gfx
; 0xac9b6

	ret ; stray ret
; 0xac9b7

	INCROM $ac9b7, $ac9ba

Func_ac9ba: ; ac9ba (2b:49ba)
	farcall Func_84e86
	ret
; 0xac9ca

	INCROM $ac9ca, $ac9e4

Func_ac9e4: ; ac9e4 (2b:49e4)
	ld hl, wPalConfig2
	jr Func_ac9ec

Func_ac9e9: ; ac9e9 (2b:49e9)
	ld hl, wPalConfig1
;	fallthrough

Func_ac9ec: ; ac9ec (2b:49ec)
	ld c, $5
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 0xac9f5

Data_ac9f5: ; ac9f5 (2b:49f5)
	db LOW(rBGPI), (1 << rBGPI_AUTO_INCREMENT)
	db 8 ; number of pals
	db HIGH(wTempPals1), LOW(wTempPals1) ; source pals

Data_ac9fa: ; ac9fa (2b:49fa)
	db LOW(rBGPI), (1 << rBGPI_AUTO_INCREMENT)
	db 8 ; number of pals
	db HIGH(wTempBGPals), LOW(wTempBGPals) ; source pals

Data_ac9ff: ; ac9ff (2b:49ff)
	db LOW(rOBPI), (1 << rBGPI_AUTO_INCREMENT)
	db 1 ; number of pals
	db HIGH(wTempOBPals), LOW(wTempOBPals) ; source pals

Data_aca04: ; aca04 (2b:4a04)
	db LOW(rOBPI), (1 << rBGPI_AUTO_INCREMENT)
	db 8 ; number of pals
	db HIGH(wTempPals2), LOW(wTempPals2) ; source pals
; 0xaca09

	INCROM $aca09, $aca34

Func_aca34: ; aca34 (2b:4a34)
	ld a, [wJoypadDown]
	swap a
	rra
	ld b, a
	ld a, [wGlobalCounter]
	or b
	ld hl, w2d141
	dec [hl]
	bit 0, a
	jr z, .asm_aca48
	dec [hl]
.asm_aca48
	ld a, [hl]
	and $fe
	ret
; 0xaca4c

Func_aca4c: ; aca4c (2b:4a4c)
	ld a, [wJoypadDown]
	swap a
	ld b, a
	ld a, [wGlobalCounter]
	or b
	ld hl, w2d141
	inc [hl]
	bit 0, a
	jr z, .asm_aca5f
	inc [hl]
.asm_aca5f
	ld a, [hl]
	and $fe
	ret
; 0xaca63

	INCROM $aca63, $aca6d

Func_aca6d: ; aca6d (2b:4a6d)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret
; 0xaca74

Func_aca74: ; aca74 (2b:4a74)
	call Func_ace9c
	ld de, w2db00
	ld hl, wTreasureTiles
	ld b, 1 tiles
	call CopyHLToDE
	xor a
	ld hl, w2da80
	ld bc, $10
	call WriteAToHL_BCTimes
	ld hl, wOWObj1
	ld a, $8e
	ld [hli], a
	ld a, $98
	ld [hli], a
	xor a
	ld hl, wOWObj1Unk6
	call Func_3b93
	jr Func_aca6d
; 0xaca9e

Func_aca9e: ; aca9e (2b:4a9e)
	call Func_acea8
	ld a, [w2da81]
	cp $80
	ret nz
	ld hl, w2da84
	inc [hl]
	jr Func_aca6d
; 0xacaad

Func_acaad: ; acaad (2b:4aad)
	ld a, [w2da84]
	ld b, $00
	swap a
	add a
	rl b
	add a
	rl b
	ld c, a
	ld hl, wTreasureTiles
	add hl, bc
	ld de, w2db00 tile 1
	ld b, 3 tiles
	call CopyHLToDE
	xor a
	ld [w2da81], a
	jr Func_aca6d
; 0xacacd

Func_acacd: ; acacd (2b:4acd)
	ld a, $01
	ld hl, w2da84
	cp [hl]
	jr z, .asm_acae2
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld hl, wOWObj1Unk6
	call Func_3b93
.asm_acae2
	call Func_ace66
	jr Func_aca6d
; 0xacae7

Func_acae7: ; acae7 (2b:4ae7)
	call Func_acec4
	ld a, [w2da81]
	cp $80
	ret nz
	jp Func_aca6d
; 0xacaf3

Func_acaf3: ; acaf3 (2b:4af3)
	ld hl, w2da84
	inc [hl]
	ld a, [hl]
	ld b, $00
	swap a
	add a
	rl b
	add a
	rl b
	ld c, a
	ld hl, wTreasureTiles
	add hl, bc
	ld a, [hl]
	cp $5d
	jp z, .asm_acb20 ; can be jr
	ld hl, wOWObj1Unk6
	ld a, $01
	call Func_3b93
	ld hl, w2d013
	dec [hl]
	dec [hl]
	dec [hl]
	xor a
	ld [w2d014], a
	ret

.asm_acb20
	call Func_aca6d
	scf
	ret
; 0xacb25

	INCROM $acb25, $acc9a

Func_acc9a: ; acc9a (2b:4c9a)
	ld hl, w2d800
	ld bc, $800
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xacca5

Func_acca5: ; acca5 (2b:4ca5)
	ld hl, w2d140
	ld bc, $c0
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xaccb0

VBlank_accb0: ; accb0 (2b:4cb0)
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

	ld a, [wHDMABank]
	and a
	jr z, .asm_accff
	ld b, a
	xor a
	ld [wHDMABank], a
	ld a, [wROMBank]
	push af
	ld a, b

	bankswitch
	ld a, [w2d158]
	ldh [rVBK], a
	ld hl, wHDMA
	ld a, [hli]
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a ; rHDMA1
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA2
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA3
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA4
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA5
	pop af
	bankswitch

.asm_accff
	ld hl, w2da88 + 0
	ld a, [hl]
	and a
	jr z, .asm_acd13
	ld e, a
	xor a
	ld [hli], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	ld [de], a
.asm_acd13
	xor a
	ldh [rVBK], a
	ld hl, wPalConfig1
	ld a, [hl]
	and a
	call nz, ApplyPalConfig

	ld hl, wPalConfig2
	ld a, [hl]
	and a
	call nz, ApplyPalConfig

	ld a, [w2d800]
	and a
	jr z, .dma_transfer
	ld hl, rLCDC
	xor [hl]
	ld [hl], a
	xor a
	ld [w2d800], a

.dma_transfer
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end
; 0xacd3a

	INCROM $acd3a, $ace60

Func_ace60: ; ace60 (2b:4e60)
	ld d, $c0
	ld e, $07
	jr Func_ace6a

Func_ace66: ; ace66 (2b:4e66)
	ld d, $e0
	ld e, $05
;	fallthrough

Func_ace6a: ; ace6a (2b:4e6a)
	ld b, $19
	ld a, [w2da85]
	and a
	jr z, .asm_ace74
	ld b, $1d
.asm_ace74
	ld hl, wHDMA
	ld a, HIGH(w2db80)
	ld [hli], a
	ld a, LOW(w2db80)
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hl], a
	ld a, $2b
	ld [wHDMABank], a

	xor a
	ld [w2d158], a
	ld [w2da88 + 0], a
	ret
; 0xace90

Func_ace90: ; ace90 (2b:4e90)
	ld hl, w2db80
	ld a, $7f
	ld bc, 8 tiles
	call WriteAToHL_BCTimes
	ret
; 0xace9c

Func_ace9c: ; ace9c (2b:4e9c)
	ld a, $7f
	ld hl, w2db00
	ld bc, 4 tiles
	call WriteAToHL_BCTimes
	ret
; 0xacea8

Func_acea8: ; acea8 (2b:4ea8)
	ld hl, w2da80
	inc [hl]
	ld a, [w2da81]
	and a
	jr z, Func_acedd.asm_acedd
	dec a
	jr z, Func_acedd.asm_aceef
	dec a
	jr z, Func_acedd.asm_acef3
	dec a
	jr z, Func_acedd.asm_acef7
	dec a
	jr z, Func_acedd.asm_acefb
	ld a, $80
	ld [w2da81], a
	ret

Func_acec4: ; acec4 (2b:4ec4)
	ld hl, w2da80
	inc [hl]
	ld a, [w2da81]
	and a
	jr z, Func_acedd.asm_acedd
	dec a
	jr z, Func_acedd.asm_acef3
	dec a
	jr z, Func_acedd.asm_acef7
	dec a
	jr z, Func_acedd.asm_acefb
	ld a, $80
	ld [w2da81], a
	ret

Func_acedd: ; acedd (2b:4edd)
.asm_acedd
	ld a, [w2da80]
	cp $0a
	ret c

.asm_acee3
	xor a
	ld [w2da83], a
	ld [w2da80], a
	ld hl, w2da81
	inc [hl]
	ret

.asm_aceef
	ld c, $00
	jr .asm_aceff
.asm_acef3
	ld c, $01
	jr .asm_aceff
.asm_acef7
	ld c, $02
	jr .asm_aceff
.asm_acefb
	ld c, $03
	jr .asm_aceff ; unnecessary jump
.asm_aceff
	ld a, [w2da88 + 0]
	and a
	ret nz
	ld b, $04
	ld a, [wJoypadDown]
	and A_BUTTON | D_DOWN
	jr z, .asm_acf0f
	srl b
.asm_acf0f
	ld a, [w2da80]
	cp b
	ret c
	xor a
	ld [w2da80], a
	ld a, c
	ld [w2da82], a
.asm_acf1c
	swap c
	ld e, c
	ld a, [w2da83]
	ld d, a
	add c
	ld c, a
	ld b, $00
	rl b
	ld hl, w2db00
	add hl, bc
	ld a, [hl]
	cp $7f
	jr z, .asm_acf79
	ld [w2da8a], a
	ld a, $09
	ld [w2da8b], a
	ld hl, v0BGMap0 + $1c2
	ld a, [w2da85]
	and a
	jr z, .asm_acf46
	ld hl, v0BGMap1 + $1c2
.asm_acf46
	sla e
	ld a, d
	add e
	ld e, a
	ld d, $00
	rl d
	ld a, [w2da82]
	and a
	jr nz, .asm_acf56
	dec l
.asm_acf56
	add hl, de
	ld a, l
	ld [w2da88 + 0], a
	ld a, h
	ld [w2da88 + 1], a
	ld a, [w2da8a]
	cp $7e
	jr z, .asm_acf6e
	play_sfx SFX_130
.asm_acf6e
	ld hl, w2da83
	inc [hl]
	ld a, [hl]
	cp $10
	ret nz
	jp .asm_acee3
.asm_acf79
	ld hl, w2da83
	inc [hl]
	ld a, [hl]
	cp $10
	jp z, .asm_acee3
	ld a, [w2da82]
	ld c, a
	jr .asm_acf1c
; 0xacf89

	INCROM $acf89, $ade49

_InitPrologueSequence: ; ade49 (2b:5e49)
	call Func_acc9a
	call Func_acca5
	call VBlank_accb0

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_b34c3)
	ld [wTempBank], a
	ld hl, BGMap_b34c3
	ld bc, v1BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ld a, BANK(BGMap_b330c)
	ld [wTempBank], a
	ld hl, BGMap_b330c
	ld bc, v0BGMap1
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, Tiles_b0f80
	ld b, BANK(Tiles_b0f80)
	call LoadFarTiles

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(FontGFX)
	ld [wTempBank], a
	ld hl, FontGFX
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	; unnecessary
	xor a
	ldh [rVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(PrologueGfx)
	ld [wTempBank], a
	ld hl, PrologueGfx
	ld bc, v1Tiles0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	; unnecessary
	xor a
	ldh [rVBK], a

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, BANK(BGMap_b3a5b)
	ld [wTempBank], a
	ld hl, BGMap_b3a5b
	ld bc, v1BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ldh [rVBK], a
	ld a, BANK(BGMap_b3a03)
	ld [wTempBank], a
	ld hl, BGMap_b3a03
	ld bc, v0BGMap0
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	ld hl, MusicBoxGfx
	ld de, v0Tiles1
	ld b, BANK(MusicBoxGfx)
	ld c, $3
	call CopyFarBytes_Long

	ld a, [wLanguage]
	and a
	jr z, .japanese
; english
	ld a, BANK(Data_b37f9)
	ld [wTempBank], a
	ld hl, Data_b37f9
	ld bc, wTreasureTiles
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jr .asm_adf63
.japanese
	ld a, BANK(Data_b3675)
	ld [wTempBank], a
	ld hl, Data_b3675
	ld bc, wTreasureTiles
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

.asm_adf63
	call Func_ace90

	; clear temp pals
	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes

	ld hl, w2d140
	ld a, $60
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $ff
	ld [w2d148], a
	xor a
	call Func_ac8d4
	ld a, $08
	ld [w2d800], a
	ret
; 0xadf92

Func_adf92: ; adf92 (2b:5f92)
	ld a, [w2d014]
	cp c
	ret c
;	fallthrough

Func_adf97: ; adf97 (2b:5f97)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret
; 0xadf9e

Func_adf9e: ; adf9e (2b:5f9e)
	ld hl, wSubState
	inc [hl]
	ret
; 0xadfa3

Func_adfa3: ; adfa3 (2b:5fa3)
	call Func_adfb0
	call Func_ac3d9
	call Func_ac528
	call Func_ac3fd
	ret
; 0xadfb0

Func_adfb0: ; adfb0 (2b:5fb0)
	ld a, [w2d013]
	jumptable
	dw Func_adf97
	dw Func_ae002
	dw Func_ae007
	dw Func_ac9ba
	dw Func_ae6d3
	dw Func_ae016
	dw Func_ae82a
	dw Func_ae021
	dw Func_ac9ba
	dw Func_ae025
	dw Func_ac9ba
	dw Func_ae22d
	dw Func_ae079
	dw Func_ae1de
	dw Func_ae0c4
	dw Func_ae31c
	dw Func_ae021
	dw Func_ac9ba
	dw Func_ae0f9
	dw Func_ae119
	dw Func_ae127
	dw Func_ae134
	dw Func_ae15b
	dw Func_ae55c
	dw Func_ae164
	dw Func_ae169
	dw Func_ae641
	dw Func_aca74
	dw Func_aca9e
	dw Func_ae17c
	dw Func_acaad
	dw Func_acacd
	dw Func_acae7
	dw Func_ae181
	dw Func_ae196
	dw Func_ae19e
	dw Func_ae1af
	dw Func_ae668
	dw Func_adf9e
; 0xae002

Func_ae002: ; ae002 (2b:6002)
	ld c, $3c
	jp Func_adf92
; 0xae007

Func_ae007: ; ae007 (2b:6007)
	ld a, $01
;	fallthrough

Func_ae009: ; ae009 (2b:6009)
	ld [w2d880], a
	xor a
	ld [w2d0d5], a
	ld [w2d0db], a
	jp Func_adf97
; 0xae016

Func_ae016: ; ae016 (2b:6016)
	ld hl, wSCX
	inc [hl]
	ld a, [hl]
	cp $28
	ret nz
	jp Func_adf97
; 0xae021

Func_ae021: ; ae021 (2b:6021)
	ld a, $00
	jr Func_ae009
; 0xae025

Func_ae025: ; ae025 (2b:6025)
	ld a, $70
	ld [wSCY], a
	xor a
	ld [wSCX], a
	ld hl, w2d140
	ld a, $d0
	ld [hli], a
	ld a, $f0
	ld [hl], a
	xor a
	call Func_ac8d4
	call Func_ae067
	ld hl, wOWObj1
	ld a, $bb
	ld [hli], a
	ld [wOWObj2YCoord], a
	ld a, $78
	ld [hl], a
	ld [wOWObj2XCoord], a
	xor a
	ld [w2d8b0], a
	ld hl, wOWObj1Unk6
	call Func_3b93
	play_music2 MUSIC_49
	ld a, $06
	jr Func_ae009
; 0xae067

Func_ae067: ; ae067 (2b:6067)
	ld hl, wOWObj3YCoord
	ld a, $c3
	ld [hli], a
	ld a, $78
	ld [hl], a
	ld hl, wOWObj3Unk6
	ld a, $09
	call Func_3b93
	ret
; 0xae079

Func_ae079: ; ae079 (2b:6079)
	xor a
	ld [wSCY], a
	ld [wSCX], a
	ld a, $08
	ld [w2d800], a
	ld a, $50
	ld hl, wOWObj7End
	ld [hli], a
	ld [hl], a
	ld a, $0d
	ld hl, wOWObj8Unk6
	call Func_3b93
	xor a
	ld hl, wOWObj3Unk6
	call Func_3b93

	ld hl, Pals_86a8d
	ld de, wTempOBPals
	ld c, 1 palettes
	ld b, BANK(Pals_86a8d)
	call CopyFarBytes
	ld hl, Pals_86a0d
	;	fallthrough

Func_ae0ab: ; ae0ab (2b:60ab)
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86a0d)
	call CopyFarBytes

	ld de, Data_ac9f5
	call Func_ac9e9
	ld de, Data_ac9ff
	call Func_ac9e4
	jp Func_adf97
; 0xae0c4

Func_ae0c4: ; ae0c4 (2b:60c4)
	ld a, $70
	ld [wSCY], a
	xor a
	ld [wSCX], a
	ld a, $08
	ld [w2d800], a
	ld a, $1f
	call Func_ac8d4
	call Func_ae067
	ld a, $0e
	ld hl, wOWObj1Unk6
	call Func_3b93
	xor a
	ld hl, wOWObj8Unk6
	call Func_3b93
	ld hl, wTempPals2
	ld de, wTempOBPals
	ld b, $08
	call CopyHLToDE
	ld hl, Pals_869cd
	jr Func_ae0ab
; 0xae0f9

Func_ae0f9: ; ae0f9 (2b:60f9)
	xor a
	ld [w2d158], a
	ld de, BGMap_b0300
	ld b, $18
	ld c, $23
;	fallthrough

Func_ae104: ; ae104 (2b:6104)
	ld a, BANK(BGMap_b0300)
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
	jp Func_adf97
; 0xae119

Func_ae119: ; ae119 (2b:6119)
	ld a, $01
	ld [w2d158], a
	ld de, BGMap_b0540
	ld b, $18
	ld c, $23
	jr Func_ae104
; 0xae127

Func_ae127: ; ae127 (2b:6127)
	xor a
	ld [w2d158], a
	ld de, BGMap_b0780
	ld b, $10
	ld c, $7f
	jr Func_ae104
; 0xae134

Func_ae134: ; ae134 (2b:6134)
	xor a
	ld [wSCY], a
	ld [wSCX], a
	ld a, $08
	ld [w2d800], a
	ld hl, w2d140
	ld a, $60
	ld [hli], a
	ld a, $40
	ld [hl], a
	ld a, $22
	call Func_ac8d4
	play_sfx SFX_0F5
	ld a, $05
	jp Func_ae009
; 0xae15b

Func_ae15b: ; ae15b (2b:615b)
	ld a, [w2d014]
	and $07
	ret nz
	jp Func_ac9ba
; 0xae164

Func_ae164: ; ae164 (2b:6164)
	ld a, $02
	jp Func_ae009
; 0xae169

Func_ae169: ; ae169 (2b:6169)
	ld c, $07
	ld a, [w2d0d5]
	cp $08
	jr c, .asm_ae174
	ld c, $01
.asm_ae174
	ld a, [w2d014]
	and c
	ret nz
	jp Func_ac9ba
; 0xae17c

Func_ae17c: ; ae17c (2b:617c)
	ld c, $1e
	jp Func_adf92
; 0xae181

Func_ae181: ; ae181 (2b:6181)
	call Func_acaf3
	call Func_ae188
	ret
; 0xae188

Func_ae188: ; ae188 (2b:6188)
	ld a, [w2da84]
	cp $02
	jr z, .asm_ae190
	ret
.asm_ae190
	ld a, $10
	call Func_ac8d4
	ret
; 0xae196

Func_ae196: ; ae196 (2b:6196)
	ld a, $0f
	call Func_ac8d4
	jp Func_adf97
; 0xae19e

Func_ae19e: ; ae19e (2b:619e)
	ld a, [w2d146]
	cp $02
	ret nz
	ld hl, wOWObj1Unk6
	ld a, $01
	call Func_3b93
	jp Func_adf97
; 0xae1af

Func_ae1af: ; ae1af (2b:61af)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wOWObj1Unk6
	xor a
	call Func_3b93
	call Func_ace60
	jp Func_adf97
; 0xae1c2

Func_ae1c2: ; ae1c2 (2b:61c2)
	ld a, [w2d146]
	cp b
	ret nz
	jr Func_ae1ce

Func_ae1c9: ; ae1c9 (2b:61c9)
	ld a, [w2d891]
	cp c
	ret c

Func_ae1ce: ; ae1ce (2b:61ce)
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl] ; w2d890
	ret
; 0xae1d5

Func_ae1d5: ; ae1d5 (2b:61d5)
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a ; w2d891
	jp Func_adf97
; 0xae1de

Func_ae1de: ; ae1de (2b:61de)
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae1f1
	dw Func_ae1f5
	dw Func_ae211
	dw Func_ae215
	dw Func_ae229
	dw Func_ae1d5
; 0xae1f1

Func_ae1f1: ; ae1f1 (2b:61f1)
	ld c, $14
	jr Func_ae1c9
; 0xae1f5

Func_ae1f5: ; ae1f5 (2b:61f5)
	ld hl, wOWObj4
	ld a, $38
	ld [hli], a
	ld a, $38
	ld [hl], a
	ld a, $0e
	ld hl, wOWObj4Unk6
	call Func_3b93
	play_sfx SFX_104
	jp Func_ae1ce
; 0xae211

Func_ae211: ; ae211 (2b:6211)
	ld c, $0a
	jr Func_ae1c9
; 0xae215

Func_ae215: ; ae215 (2b:6215)
	ld hl, wOWObj5
	ld a, $30
	ld [hli], a
	ld a, $78
	ld [hl], a
	ld a, $0e
	ld hl, wOWObj5Unk6
	call Func_3b93
	jp Func_ae1ce
; 0xae229

Func_ae229: ; ae229 (2b:6229)
	ld c, $5a
	jr Func_ae1c9
; 0xae22d

Func_ae22d: ; ae22d (2b:622d)
	call Func_ae2dd
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae251
	dw Func_ae259
	dw Func_ae272
	dw Func_ae27a
	dw Func_ae2a2
	dw Func_ae2aa
	dw Func_ae251
	dw Func_ae2af
	dw Func_ae2b8
	dw Func_ae2cb
	dw Func_ae2d3
	dw Func_ae2d8
	dw Func_ae1d5
; 0xae251

Func_ae251: ; ae251 (2b:6251)
	ld a, $08
	call Func_ac8d4
	jp Func_ae1ce
; 0xae259

Func_ae259: ; ae259 (2b:6259)
	call Func_aca4c
	cp $32
	jr z, Func_ae26c
	cp $40
	ret nz
	ld [hl], a

Func_ae264: ; ae264 (2b:6264)
	ld a, $0d
	call Func_ac8d4
	jp Func_ae1ce

Func_ae26c: ; ae26c (2b:626c)
	ld a, $01
	ld [w2d8b0], a
	ret
; 0xae272

Func_ae272: ; ae272 (2b:6272)
	ld a, [w2d8b0]
	and a
	ret nz
	jp Func_ae1ce
; 0xae27a

Func_ae27a: ; ae27a (2b:627a)
	ld a, [w2d891]
	cp $16
	ret c
	ld hl, w2d180
	ld a, [w2d140]
	sub $18
	ld [hli], a
	ld a, [w2d141]
	add $10
	ld [hl], a
	ld a, $11
	ld hl, w2d180Unk6
	call Func_3b93
	play_sfx SFX_106
	jp Func_ae1ce
; 0xae2a2

Func_ae2a2: ; ae2a2 (2b:62a2)
	ld a, [w2d180Unk6]
	and a
	ret nz
	jp Func_ae1ce
; 0xae2aa

Func_ae2aa: ; ae2aa (2b:62aa)
	ld c, $1a
	jp Func_ae1c9
; 0xae2af

Func_ae2af: ; ae2af (2b:62af)
	call Func_aca4c
	cp $66
	ret nz
	ld [hl], a
	jr Func_ae264
; 0xae2b8

Func_ae2b8: ; ae2b8 (2b:62b8)
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
; 0xae2cb

Func_ae2cb: ; ae2cb (2b:62cb)
	ld a, $1d
	call Func_ac8d4
	jp Func_ae1ce
; 0xae2d3

Func_ae2d3: ; ae2d3 (2b:62d3)
	ld b, $1f

Func_ae2d5: ; ae2d5 (2b:62d5)
	jp Func_ae1c2
; 0xae2d8

Func_ae2d8: ; ae2d8 (2b:62d8)
	ld c, $3c
	jp Func_ae1c9
; 0xae2dd

Func_ae2dd: ; ae2dd (2b:62dd)
	ld a, [w2d8b0]
	jumptable
	dw Func_ae2fb
	dw Func_ae2ed
	dw Func_ae303
	dw Func_ae2ed
	dw Func_ae2fc
	dw Func_ae30e
; 0xae2ed

Func_ae2ed: ; ae2ed (2b:62ed)
	ld a, $0e
	ld hl, wOWObj1Unk6
	call Func_3b93
Func_ae2f5: ; ae2f5 (2b:62f5)
	ld hl, w2d8b1
	xor a
	ld [hld], a
	inc [hl] ; w2d8b0
Func_ae2fb: ; ae2fb (2b:62fb)
	ret
; 0xae2fc

Func_ae2fc: ; ae2fc (2b:62fc)
	ld a, [wOWObj1Unk6]
	and a
	ret nz
	jr Func_ae2f5
; 0xae303

Func_ae303: ; ae303 (2b:6303)
	ld a, [wOWObj1Unk6]
	and a
	ret nz
	ld hl, w2d8b0
	ld [hli], a
	ld [hl], a
	ret
; 0xae30e

Func_ae30e: ; ae30e (2b:630e)
	ld hl, w2d8b1
	inc [hl]
	ld a, [hl]
	cp $14
	ret c
	ld hl, w2d8b0
	dec [hl]
	dec [hl]
	ret
; 0xae31c

Func_ae31c: ; ae31c (2b:631c)
	call Func_ae523
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae352
	dw Func_ae35a
	dw Func_ae36f
	dw Func_ae374
	dw Func_ae37c
	dw Func_ae38d
	dw Func_ae3a9
	dw Func_ae3d3
	dw Func_ae3d8
	dw Func_ae3e2
	dw Func_ae3fa
	dw Func_ae407
	dw Func_ae435
	dw Func_ae442
	dw Func_ae447
	dw Func_ae476
	dw Func_ae488
	dw Func_ae4a4
	dw Func_ae4a9
	dw Func_ae4e5
	dw Func_ae51e
	dw Func_ae1d5
; 0xae352

Func_ae352: ; ae352 (2b:6352)
	ld a, [wOWObj1Unk6]
	and a
	ret nz
	jp Func_ae1ce
; 0xae35a

Func_ae35a: ; ae35a (2b:635a)
	ld a, [w2d891]
	cp $14
	ret c
	stop_music2
	jp Func_ae1ce
; 0xae36f

Func_ae36f: ; ae36f (2b:636f)
	ld c, $1e
	jp Func_ae1c9
; 0xae374

Func_ae374: ; ae374 (2b:6374)
	ld a, $1e
	call Func_ac8d4
	jp Func_ae1ce
; 0xae37c

Func_ae37c: ; ae37c (2b:637c)
	ld a, [w2d891]
	cp $08
	ret nc
	ld hl, wOWObj3Unk6
	ld a, $0a
	call Func_3b93
	jp Func_ae1ce
; 0xae38d

Func_ae38d: ; ae38d (2b:638d)
	ld hl, w2d140
	ld a, [w2d891]
	cp $01
	jr z, .asm_ae3a1
	cp $05
	jr z, .asm_ae3a5
	cp $30
	ret c
	jp Func_ae1ce
.asm_ae3a1
	dec [hl] ; w2d140
	inc l
	dec [hl] ; w2d141
	ret
.asm_ae3a5
	inc [hl] ; w2d140
	inc l
	dec [hl] ; w2d141
	ret
; 0xae3a9

Func_ae3a9: ; ae3a9 (2b:63a9)
	ld a, [w2d891]
	and $07
	ret nz
	ld hl, wOWObj3YCoord
	dec [hl]
	ld a, [hl]
	ld b, a
	sub $08
	ld [wOWObj2YCoord], a
	ld a, b
	cp $b4
	jr z, .asm_ae3c5
	cp $a5
	ret nz
	jp Func_ae1ce
.asm_ae3c5
	ld hl, wOWObj2Unk6
	ld a, $0c
	call Func_3b93
	ld a, $01
	ld [w2d150], a
	ret
; 0xae3d3

Func_ae3d3: ; ae3d3 (2b:63d3)
	ld c, $78
	jp Func_ae1c9
; 0xae3d8

Func_ae3d8: ; ae3d8 (2b:63d8)
	xor a
	ld hl, wOWObj2Unk6
	call Func_3b93
	jp Func_ae1ce
; 0xae3e2

Func_ae3e2: ; ae3e2 (2b:63e2)
	ld hl, w2d180
	ld a, [w2d140]
	sub $08
	ld [hli], a
	ld a, [w2d141]
	ld [hl], a
	ld a, $0e
	ld hl, w2d180Unk6
	call Func_3b93
	jp Func_ae1ce
; 0xae3fa

Func_ae3fa: ; ae3fa (2b:63fa)
	ld a, [w2d180Unk6]
	and a
	ret nz
	ld a, $80
	ld [w2d150], a
	jp Func_ae1ce
; 0xae407

Func_ae407: ; ae407 (2b:6407)
	ld hl, w2d180
	ld a, [w2d140]
	sub $10
	ld [hli], a
	ld a, [w2d141]
	add $02
	ld [hl], a
	ld a, $15
	ld hl, w2d180Unk6
	call Func_3b93

	ld hl, wTempOBPals
	ld b, $04
.asm_ae423
	ld a, $9c
	ld [hli], a
	ld a, $73
	ld [hli], a
	dec b
	jr nz, .asm_ae423
	ld de, Data_ac9ff
	call Func_ac9e4
	jp Func_ae1ce
; 0xae435

Func_ae435: ; ae435 (2b:6435)
	ld a, [w2d180Unk6]
	cp $16
	ret nz
	xor a
	call Func_ac8d4
	jp Func_ae1ce
; 0xae442

Func_ae442: ; ae442 (2b:6442)
	ld c, $3c
	jp Func_ae1c9
; 0xae447

Func_ae447: ; ae447 (2b:6447)
	ld hl, w2d180
	ld a, [hli]
	cp $b5
	jr c, .asm_ae45e
	ld a, [w2d891]
	ld b, a
	and $03
	ret nz
	bit 2, b
	jr z, .asm_ae45b
	inc [hl] ; w2d181
.asm_ae45b
	dec l
	dec [hl] ; w2d180
	ret

.asm_ae45e
	inc [hl] ; w2d181
	dec l
	dec [hl] ; w2d180
	dec [hl]
	ld a, [hl]
	cp $a8
	jr z, .asm_ae46d
	cp $9c
	ret nz
	jp Func_ae1ce
.asm_ae46d
	ld a, $17
	ld hl, w2d180Unk6
	call Func_3b93
	ret
; 0xae476

Func_ae476: ; ae476 (2b:6476)
	ld a, $09
	ld hl, wOWObj3Unk6
	call Func_3b93
	xor a
	ld hl, w2d180Unk6
	call Func_3b93
	jp Func_ae1ce
; 0xae488

Func_ae488: ; ae488 (2b:6488)
	ld a, [w2d891]
	srl a
	ret c
	ld hl, wOWObj3XCoord
	cp $01
	jr z, .asm_ae49f
	cp $02
	jr z, .asm_ae4a1
	call .asm_ae49f
	jp Func_ae1ce
.asm_ae49f
	inc [hl]
	ret
.asm_ae4a1
	dec [hl]
	dec [hl]
	ret
; 0xae4a4

Func_ae4a4: ; ae4a4 (2b:64a4)
	ld c, $28
	jp Func_ae1c9
; 0xae4a9

Func_ae4a9: ; ae4a9 (2b:64a9)
	ld hl, w2d891
	call Func_ae4c0
	ld hl, wOWObj3YCoord
	add [hl]
	ld [hl], a
	cp $c3
	ret c
	ld a, $c3
	ld [hl], a
	call Func_ae515
	jp Func_ae1ce
; 0xae4c0

Func_ae4c0: ; ae4c0 (2b:64c0)
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
; 0xae4e5

Func_ae4e5: ; ae4e5 (2b:64e5)
	ld hl, w2d891
	call Func_ae4fe
	and a
	ret z
	ld hl, wOWObj3YCoord
	add [hl]
	ld [hl], a
	cp $c3
	call z, Func_ae515
	ld a, $80
	cp b
	ret nz
	jp Func_ae1ce
; 0xae4fe

Func_ae4fe: ; ae4fe (2b:64fe)
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
; 0xae515

Func_ae515: ; ae515 (2b:6515)
	play_sfx SFX_BUMP
	ret
; 0xae51e

Func_ae51e: ; ae51e (2b:651e)
	ld c, $78
	jp Func_ae1c9
; 0xae523

Func_ae523: ; ae523 (2b:6523)
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
	ld [w2d143], a
	ret

.data_ae54b
	db $00, $00, $01, $02, $03, $04, $05, $06, $07

.asm_ae554
	xor a
	ld [w2d143], a
	ld [w2d150], a
	ret
; 0xae55c

Func_ae55c: ; ae55c (2b:655c)
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
; 0xae585

Func_ae585: ; ae585 (2b:6585)
	ld a, [w2d14e]
	inc a
	ret nz
	jp Func_ae1ce
; 0xae58d

Func_ae58d: ; ae58d (2b:658d)
	ld a, [bc]
	cp $4b
	ret c
	ld a, $23
	call Func_ac8d4
	jp Func_ae1ce
; 0xae599

Func_ae599: ; ae599 (2b:6599)
	ld a, [bc]
	cp $14
	ret c
	play_sfx SFX_GRAB
	jp Func_ae1ce
; 0xae5a8

Func_ae5a8: ; ae5a8 (2b:65a8)
	ld a, [w2d146]
	cp $25
	ret nz
	jp Func_ae1ce
; 0xae5b1

Func_ae5b1: ; ae5b1 (2b:65b1)
	ld a, [bc]
	cp $05
	ret c
	ld a, [w2d140]
	sub $01
	ld [w2d180YCoord], a
	ld a, [w2d141]
	add $09
	ld [w2d180XCoord], a
	ld a, $14
	ld hl, w2d180Unk6
	call Func_3b93
	jp Func_ae1ce
; 0xae5d0

Func_ae5d0: ; ae5d0 (2b:65d0)
	ld a, [bc]
	cp $8c
	ret c
	ld a, $24
	call Func_ac8d4
	jp Func_ae1ce
; 0xae5dc

Func_ae5dc: ; ae5dc (2b:65dc)
	ld a, [bc]
	cp $10
	ret c
	ld a, $0d
	call Func_ac8d4
	play_sfx SFX_12A
	jp Func_ae1ce
; 0xae5f0

Func_ae5f0: ; ae5f0 (2b:65f0)
	ld c, $3c
	jp Func_ae1c9
; 0xae5f5

Func_ae5f5: ; ae5f5 (2b:65f5)
	ld a, $08
	call Func_ac8d4
	jp Func_ae1ce
; 0xae5fd

Func_ae5fd: ; ae5fd (2b:65fd)
	call Func_aca4c
	cp $50
	ret nz
	ld [hl], a
	ld a, $0d
	call Func_ac8d4
	jp Func_ae1ce
; 0xae60c

Func_ae60c: ; ae60c (2b:660c)
	ld a, [bc]
	cp $1e
	ret c
	ld a, $06
	call Func_ac8d4
	jp Func_ae1ce
; 0xae618

Func_ae618: ; ae618 (2b:6618)
	ld b, $02
	jp Func_ae1c2
; 0xae61d

Func_ae61d: ; ae61d (2b:661d)
	ld a, [bc]
	cp $1e
	ret c
	play_music2 MUSIC_THE_TEMPLE
	jp Func_ae1ce
; 0xae630

Func_ae630: ; ae630 (2b:6630)
	ld a, [bc]
	cp $1e
	ret c
	ld a, $10
	call Func_ac8d4
	jp Func_ae1ce
; 0xae63c

Func_ae63c: ; ae63c (2b:663c)
	ld c, $1e
	jp Func_ae1c9
; 0xae641

Func_ae641: ; ae641 (2b:6641)
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
; 0xae652

Func_ae652: ; ae652 (2b:6652)
	ld b, $12
	jp Func_ae1c2
; 0xae657

Func_ae657: ; ae657 (2b:6657)
	ld a, $26
	call Func_ac8d4
	xor a
	ld [w2d147], a
	jp Func_ae1ce
; 0xae663

Func_ae663: ; ae663 (2b:6663)
	ld b, $02
	jp Func_ae1c2
; 0xae668

Func_ae668: ; ae668 (2b:6668)
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
; 0xae683

Func_ae683: ; ae683 (2b:6683)
	ld a, $27
	call Func_ac8d4
	jp Func_ae1ce
; 0xae68b

Func_ae68b: ; ae68b (2b:668b)
	ld a, [w2d142]
	cp $0f
	ret nz
	play_sfx SFX_106
	jp Func_ae1ce
; 0xae69c

Func_ae69c: ; ae69c (2b:669c)
	ld b, $02
	jp Func_ae1c2
; 0xae6a1

Func_ae6a1: ; ae6a1 (2b:66a1)
	ld c, $1e
	jp Func_ae1c9
; 0xae6a6

Func_ae6a6: ; ae6a6 (2b:66a6)
	ld a, $33
	call Func_ac8d4
	jp Func_ae1ce
; 0xae6ae

Func_ae6ae: ; ae6ae (2b:66ae)
	ld b, $0c
	jp Func_ae1c2
; 0xae6b3

Func_ae6b3: ; ae6b3 (2b:66b3)
	ld a, [w2d891]
	cp $04
	ret c
	ld a, $07
	call Func_ac8d4
	jp Func_ae1ce
; 0xae6c1

Func_ae6c1: ; ae6c1 (2b:66c1)
	call Func_aca34
	cp $f0
	ret nz
	xor a
	call Func_ac8d4
	jp Func_ae1ce
; 0xae6ce

Func_ae6ce: ; ae6ce (2b:66ce)
	ld c, $1e
	jp Func_ae1c9
; 0xae6d3

Func_ae6d3: ; ae6d3 (2b:66d3)
	call Func_ae8bb
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae6f3
	dw Func_ae6f8
	dw Func_ae718
	dw Func_ae801
	dw Func_ae806
	dw Func_ae80e
	dw Func_ae813
	dw Func_ae818
	dw Func_ae820
	dw Func_ae825
	dw Func_ae1d5
; 0xae6f3

Func_ae6f3: ; ae6f3 (2b:66f3)
	ld c, $4a
	jp Func_ae1c9
; 0xae6f8

Func_ae6f8: ; ae6f8 (2b:66f8)
	ld hl, w2d140
	ld a, $3c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	ld a, $15
	call Func_ac8d4
	play_sfx SFX_019
	xor a
	ld [w2d894], a
	ld [w2d892], a
	jp Func_ae1ce
; 0xae718

Func_ae718: ; ae718 (2b:6718)
	call Func_ae724
	ld a, [w2d892]
	cp $80
	ret nz
	jp Func_ae1ce
; 0xae724

Func_ae724: ; ae724 (2b:6724)
	ld a, [w2d894]
	and a
	jr z, .asm_ae740
	ld a, [w2d891]
	and $03
	jr z, .asm_ae740
	ld de, Data_aed06
	ld hl, w2d140
	call Func_3c25
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
	jp z, Func_ae7f2
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
	ld a, [w2d140]
	cp $60
	ret nz
	ld a, $19
	call Func_ac8d4
	call Func_ae7f8
.asm_ae77f
	ld hl, w2d180
	ld a, [w2d140]
	ld [hli], a
	ld a, [w2d141]
	ld [hl], a
	ld a, $10
	ld hl, w2d180Unk6
	call Func_3b93
	jr .asm_ae768
.asm_ae794
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_ae768
.asm_ae79e
	ld a, $18
	call Func_ac8d4
	jr .asm_ae768
.asm_ae7a5
	ld a, [w2d140]
	cp $60
	ret nz
	ld a, $16
	call Func_ac8d4
	call Func_ae7f8
	jr .asm_ae77f
.asm_ae7b5
	ld a, [w2d140]
	cp $60
	ret nz
	ld a, $16
	call Func_ac8d4
	call Func_ae7f8
	jr .asm_ae768
.asm_ae7c5
	ld a, [w2d146]
	cp $19
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
	ld a, $0d
	call Func_ac8d4
	play_sfx SFX_12A
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret
; 0xae7f2

Func_ae7f2: ; ae7f2 (2b:67f2)
	ld a, $80
	ld [w2d892], a
	ret
; 0xae7f8

Func_ae7f8: ; ae7f8 (2b:67f8)
	play_sfx SFX_BUMP
	ret
; 0xae801

Func_ae801: ; ae801 (2b:6801)
	ld c, $3c
	jp Func_ae1c9
; 0xae806

Func_ae806: ; ae806 (2b:6806)
	ld a, $06
	call Func_ac8d4
	jp Func_ae1ce
; 0xae80e

Func_ae80e: ; ae80e (2b:680e)
	ld b, $02
	jp Func_ae1c2
; 0xae813

Func_ae813: ; ae813 (2b:6813)
	ld c, $26
	jp Func_ae1c9
; 0xae818

Func_ae818: ; ae818 (2b:6818)
	ld a, $13
	call Func_ac8d4
	jp Func_ae1ce
; 0xae820

Func_ae820: ; ae820 (2b:6820)
	ld b, $0d
	jp Func_ae1c2
; 0xae825

Func_ae825: ; ae825 (2b:6825)
	ld c, $2e
	jp Func_ae1c9
; 0xae82a

Func_ae82a: ; ae82a (2b:682a)
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl]
	jumptable
	dw Func_ae84b
	dw Func_ae8a0
	dw Func_ae850
	dw Func_ae85f
	dw Func_ae864
	dw Func_ae86c
	dw Func_ae871
	dw Func_ae893
	dw Func_ae89b
	dw Func_ae8a0
	dw Func_ae8a8
	dw Func_ae8b6
	dw Func_ae1d5
; 0xae84b

Func_ae84b: ; ae84b (2b:684b)
	ld c, $3c
	jp Func_ae1c9
; 0xae850

Func_ae850: ; ae850 (2b:6850)
	call Func_aca4c
	cp $78
	ret nz
	ld [hl], a
	ld a, $0d
	call Func_ac8d4
	jp Func_ae1ce
; 0xae85f

Func_ae85f: ; ae85f (2b:685f)
	ld c, $3c
	jp Func_ae1c9
; 0xae864

Func_ae864: ; ae864 (2b:6864)
	ld a, $1a
	call Func_ac8d4
	jp Func_ae1ce
; 0xae86c

Func_ae86c: ; ae86c (2b:686c)
	ld b, $0d
	jp Func_ae1c2
; 0xae871

Func_ae871: ; ae871 (2b:6871)
	ld hl, w2d180
	ld a, [w2d140]
	sub $18
	ld [hli], a
	ld a, [w2d141]
	add $10
	ld [hl], a
	ld a, $11
	ld hl, w2d180Unk6
	call Func_3b93
	play_sfx SFX_106
	jp Func_ae1ce
; 0xae893

Func_ae893: ; ae893 (2b:6893)
	ld a, [w2d180Unk6]
	and a
	ret nz
	jp Func_ae1ce
; 0xae89b

Func_ae89b: ; ae89b (2b:689b)
	ld c, $28
	jp Func_ae1c9
; 0xae8a0

Func_ae8a0: ; ae8a0 (2b:68a0)
	ld a, $08
	call Func_ac8d4
	jp Func_ae1ce
; 0xae8a8

Func_ae8a8: ; ae8a8 (2b:68a8)
	call Func_aca4c
	cp $d0
	ret nz
	ld [hl], a
	xor a
	call Func_ac8d4
	jp Func_ae1ce
; 0xae8b6

Func_ae8b6: ; ae8b6 (2b:68b6)
	ld c, $28
	jp Func_ae1c9
; 0xae8bb

Func_ae8bb: ; ae8bb (2b:68bb)
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

.Func_ae8d8
	ret

.Func_ae8d9
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a3
	call Func_ae915
	jp .asm_ae912

.Func_ae8e8
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a5
	call Func_ae915
	jr .asm_ae912

.Func_ae8f6
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a7
	call Func_ae915
	jr .asm_ae912

.Func_ae904
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a9
	call Func_ae915
	jr .asm_ae912 ; unnecessary jump
.asm_ae912
	ld hl, w2d8a1

Func_ae915: ; ae915 (2b:6915)
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xae919

Func_ae919: ; ae919 (2b:6919)
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, c
	call Func_3b93
	ret
; 0xae924

Func_ae924: ; ae924 (2b:6924)
	ld hl, w2d8a3
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a2
	and a
	ret z
	dec a
	jumptable
	dw Func_ae971
	dw Func_ae97e
	dw Func_ae983
	dw Func_ae989
	dw Func_ae98d
	dw Func_ae99a
	dw Func_ae99f
	dw Func_ae9a5
	dw Func_ae9a9
	dw Func_ae9b6
	dw Func_ae9bb
	dw Func_ae9c1
	dw Func_ae9c5
; 0xae948

Func_ae948: ; ae948 (2b:6948)
	play_sfx SFX_006

Func_ae950: ; ae950 (2b:6950)
	ld hl, w2d8a3
	jp Func_ae915
; 0xae956

Func_ae956: ; ae956 (2b:6956)
	ld a, [wOWObj3YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a2
	inc [hl]
	ret
; 0xae969

Func_ae969: ; ae969 (2b:6969)
	ld hl, w2d8a3
	ld a, [hl]
	cp c
	ret c
	jr Func_ae915
; 0xae971

Func_ae971: ; ae971 (2b:6971)
	ld hl, wOWObj3
	lb de, $2e, $f0
	ld c, $06
	call Func_ae919
	jr Func_ae950
; 0xae97e

Func_ae97e: ; ae97e (2b:697e)
	call Func_ae9d0
	jr Func_ae956
; 0xae983

Func_ae983: ; ae983 (2b:6983)
	call Func_ae9d0
	ret nz
	jr Func_ae948
; 0xae989

Func_ae989: ; ae989 (2b:6989)
	ld c, $08
	jr Func_ae969
; 0xae98d

Func_ae98d: ; ae98d (2b:698d)
	ld hl, wOWObj3
	lb de, $4d, $e0
	ld c, $05
	call Func_ae919
	jr Func_ae950
; 0xae99a

Func_ae99a: ; ae99a (2b:699a)
	call Func_ae9da
	jr Func_ae956
; 0xae99f

Func_ae99f: ; ae99f (2b:699f)
	call Func_ae9da
	ret nz
	jr Func_ae948
; 0xae9a5

Func_ae9a5: ; ae9a5 (2b:69a5)
	ld c, $28
	jr Func_ae969
; 0xae9a9

Func_ae9a9: ; ae9a9 (2b:69a9)
	ld hl, wOWObj3
	lb de, $3e, $f0
	ld c, $04
	call Func_ae919
	jr Func_ae950
; 0xae9b6

Func_ae9b6: ; ae9b6 (2b:69b6)
	call Func_ae9e4
	jr Func_ae956
; 0xae9bb

Func_ae9bb: ; ae9bb (2b:69bb)
	call Func_ae9e4
	ret nz
	jr Func_ae948
; 0xae9c1

Func_ae9c1: ; ae9c1 (2b:69c1)
	ld c, $08
	jr Func_ae969
; 0xae9c5

Func_ae9c5: ; ae9c5 (2b:69c5)
	xor a
	ld [w2d8a2], a
	ld hl, wOWObj3Unk6
	call Func_3b93
	ret
; 0xae9d0

Func_ae9d0: ; ae9d0 (2b:69d0)
	ld de, Data_aee09
	ld hl, wOWObj3
	call Func_3c25
	ret
; 0xae9da

Func_ae9da: ; ae9da (2b:69da)
	ld de, Data_aedba
	ld hl, wOWObj3
	call Func_3c25
	ret
; 0xae9e4

Func_ae9e4: ; ae9e4 (2b:69e4)
	ld de, Data_aed6d
	ld hl, wOWObj3
	call Func_3c25
	ret
; 0xae9ee

Func_ae9ee: ; ae9ee (2b:69ee)
	ld hl, w2d8a5
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a4
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

.Func_aea16
	play_sfx SFX_006
.Func_aea1e
	ld hl, w2d8a5
	jp Func_ae915

.Func_aea24
	ld a, [wOWObj4YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a4
	inc [hl]
	ret

.Func_aea37
	ld hl, w2d8a5
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aea40
	ld hl, wOWObj4
	lb de, $3e, $f0
	ld c, $02
	call Func_ae919
	xor a
	ld hl, wOWObj1Unk6
	call Func_3b93
	jr .Func_aea1e

.Func_aea54
	call .Func_aeaef
	jr .asm_aea95

.Func_aea59
	call .Func_aeaef
	ret nz
	jr .Func_aea16

.Func_aea5f
	ld c, $04
	jr .Func_aea37

.Func_aea63
	ld a, $12
	ld hl, wOWObj4Unk6
	call Func_3b93
	jr .Func_aea1e

.Func_aea6d
	ld c, $28
	jr .Func_aea37

.Func_aea71
	ld hl, wOWObj4
	lb de, $2e, $e0
	ld c, $08
	call Func_ae919

.Func_aea7c
	ld a, [wOWObj4YCoord]
	ld [wOWObj1YCoord], a
	ld a, [wOWObj4XCoord]
	ld [wOWObj1XCoord], a
	ld a, $0f
	ld hl, wOWObj1Unk6
	call Func_3b93
	jr .Func_aea1e

.Func_aea92
	call .Func_aeaf9

.asm_aea95
	ld a, [wOWObj4XCoord]
	ld [wOWObj1XCoord], a
	ld a, [wOWObj4YCoord]
	ld [wOWObj1YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wOWObj1Unk6
	call Func_3b93
	play_sfx SFX_006
	ld hl, w2d8a4
	inc [hl]
	ret

.Func_aeab9
	call .Func_aeaf9
	ret nz
	jp .Func_aea16

.Func_aeac0
	ld c, $08
	jp .Func_aea37

.Func_aeac5
	ld hl, wOWObj4
	lb de, $2e, $f4
	ld c, $04
	call Func_ae919
	jr .Func_aea7c

.Func_aead2
	call .Func_aeb03
	jp .Func_aea24

.Func_aead8
	call .Func_aeb03
	ret nz
	jp .Func_aea16

.Func_aeadf
	ld c, $08
	jp .Func_aea37

.Func_aeae4
	xor a
	ld [w2d8a4], a
	ld hl, wOWObj4Unk6
	call Func_3b93
	ret

.Func_aeaef
	ld de, Data_aed6d
	ld hl, wOWObj4
	call Func_3c25
	ret

.Func_aeaf9
	ld de, Data_aee09
	ld hl, wOWObj4
	call Func_3c25
	ret

.Func_aeb03
	ld de, Data_aee09
	ld hl, wOWObj4
	call Func_3c25
	ret
; 0xaeb0d

Func_aeb0d: ; aeb0d (2b:6b0d)
	ld hl, w2d8a7
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a6
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

.Func_aeb35
	play_sfx SFX_006
.Func_aeb3d
	ld hl, w2d8a7
	jp Func_ae915

.Func_aeb43
	ld a, [wOWObj5YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a6
	inc [hl]
	ret

.Func_aeb56
	ld hl, w2d8a7
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aeb5f
	ld hl, wOWObj5
	lb de, $3e, $e0
	ld c, $03
	call Func_ae919
	ld a, [wOWObj5YCoord]
	ld [wOWObj2YCoord], a
	ld a, [wOWObj5XCoord]
	ld [wOWObj2XCoord], a
	ld a, $0f
	ld hl, wOWObj2Unk6
	call Func_3b93
	jr .Func_aeb3d

.Func_aeb80
	call .Func_aec0b
	ld a, [wOWObj5XCoord]
	ld [wOWObj2XCoord], a
	ld a, [wOWObj5YCoord]
	ld [wOWObj2YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wOWObj2Unk6
	call Func_3b93
	play_sfx SFX_006
	ld hl, w2d8a6
	inc [hl]
	ret

.Func_aeba7
	call .Func_aec0b
	ret nz
	jr .Func_aeb35

.Func_aebad
	ld c, $08
	jr .Func_aeb56

.Func_aebb1
	ld hl, wOWObj5
	lb de, $2e, $f0
	ld c, $07
	call Func_ae919
	jp .Func_aeb3d

.Func_aebbf
	call .Func_aec15
	jp .Func_aeb43

.Func_aebc5
	call .Func_aec15
	ret nz
	jp .Func_aeb35

.Func_aebcc
	ld c, $04
	jr .Func_aeb56

.Func_aebd0
	ld a, $13
	ld hl, wOWObj5Unk6
	call Func_3b93
	jp .Func_aeb3d

.Func_aebdb
	ld c, $28
	jp .Func_aeb56

.Func_aebe0
	ld hl, wOWObj5
	lb de, $4d, $f8
	ld c, $05
	call Func_ae919
	jp .Func_aeb3d

.Func_aebee
	call .Func_aec1a
	jp .Func_aeb43

.Func_aebf4
	call .Func_aec1a
	ret nz
	jp .Func_aeb35

.Func_aebfb
	ld c, $08
	jp .Func_aeb56

.Func_aec00
	xor a
	ld [w2d8a6], a
	ld hl, wOWObj5Unk6
	call Func_3b93
	ret

.Func_aec0b
	ld de, Data_aed6d
.Func_aec0e
	ld hl, wOWObj5
	call Func_3c25
	ret

.Func_aec15
	ld de, Data_aee09
	jr .Func_aec0e

.Func_aec1a
	ld de, Data_aedba
	jr .Func_aec0e
; 0xaec1f

Func_aec1f: ; aec1f (2b:6c1f)
	ld hl, w2d8a9
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a8
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

.Func_aec3f
	play_sfx SFX_006
.Func_aec47
	ld hl, w2d8a9
	jp Func_ae915

.Func_aec4d
	ld a, [wOWObj9YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a8
	inc [hl]
	ret

.Func_aec60
	ld hl, w2d8a9
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aec69
	ld hl, wOWObj9
	lb de, $4d, $f0
	ld c, $07
	call Func_ae919
	jr .Func_aec47

.Func_aec76
	call .Func_aecf2
	jr .Func_aec4d

.Func_aec7b
	call .Func_aecf2
	ret nz
	jr .Func_aec3f

.Func_aec81
	ld c, $04
	jr .Func_aec60

.Func_aec85
	ld a, $13
	ld hl, wOWObj9Unk6
	call Func_3b93
	jr .Func_aec47

.Func_aec8f
	ld c, $28
	jr .Func_aec60

.Func_aec93
	ld hl, wOWObj9
	lb de, $3e, $f0
	ld c, $08
	call Func_ae919
	ld a, [wOWObj9YCoord]
	ld [wOWObj8YCoord], a
	ld a, [wOWObj9XCoord]
	ld [wOWObj8XCoord], a
	ld a, $0f
	ld hl, wOWObj8Unk6
	call Func_3b93
	jr .Func_aec47

.Func_aecb4
	call .Func_aecfc
	ld a, [wOWObj9XCoord]
	ld [wOWObj8XCoord], a
	ld a, [wOWObj9YCoord]
	ld [wOWObj8YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wOWObj8Unk6
	call Func_3b93
	play_sfx SFX_006
	ld hl, w2d8a8
	inc [hl]
	ret

.Func_aecdb
	call .Func_aecfc
	ret nz
	jp .Func_aec3f

.Func_aece2
	ld c, $08
	jp .Func_aec60

.Func_aece7
	xor a
	ld [w2d8a8], a
	ld hl, wOWObj9Unk6
	call Func_3b93
	ret

.Func_aecf2
	ld de, Data_aedba
.Func_aecf5
	ld hl, wOWObj9
	call Func_3c25
	ret

.Func_aecfc
	ld de, Data_aed6d
	jr .Func_aecf5

.Func_aed01
	ld de, Data_aee09
	jr .Func_aecf5
; 0xaed06

Data_aed06: ; aed06 (2b:6d06)
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
; 0xaed6d

Data_aed6d: ; aed6d (2b:6d6d)
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
; 0xaedba

Data_aedba: ; aedba (2b:6dba)
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
; 0xaee09

Data_aee09: ; aee09 (2b:6e09)
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
; 0xaee58

	INCROM $aee58, $b0000

