Func_158000: ; 158000 (56:4000)
	call Func_158022
	call Func_158111
	call Func_158216
	call Func_158168
	call Func_15826d
	call Func_1581bf
	call Func_1582c4
	call Func_158358
	call Func_15839f
	call Func_1583e6
	call Func_158432
	ret
; 0x158022

Func_158022: ; 158022 (56:4022)
	ld hl, w2d896
	ld a, [hli]
	and a
	ret z
	inc [hl] ; w2d897
	ld b, h
	ld c, l
	dec a
	jumptable

	dw .Init
	dw .Next
	dw .SlowScrollLeftWithSFX
	dw .SlowScrollRight
	dw .SlowScrollLeft
	dw .SlowScrollRight
	dw .SlowScrollLeft
	dw .SlowScrollRight
	dw .SlowScrollLeft
	dw .SlowScrollRightAndReset
	dw .Next
	dw .SlowScrollLeft
	dw .FastScrollRightWithSFX
	dw .FastScrollLeft
	dw .FastScrollRight
	dw .FastScrollLeft
	dw .FastScrollRight
	dw .FastScrollLeft
	dw .FastScrollRight
	dw .FastScrollLeftAndReset

.Init
	ld hl, w2d897
	xor a
	ld [hld], a
	ld [hl], a
	ld [wSCX], a
	ld [wSCY], a
	ret

.Next
	ld hl, w2d897
	xor a
	ld [hld], a
	inc [hl]
	ret

.SlowScrollLeftWithSFX
	play_sfx SFX_01F
.SlowScrollLeft
	ld a, [bc]
	cp 2
	ret c
	ld hl, wSCX
	dec [hl]
	jr .Next

.SlowScrollRight
	ld a, [bc]
	cp 2
	ret c
	ld hl, wSCX
	inc [hl]
	jr .Next

.SlowScrollRightAndReset
	ld a, [bc]
	cp 2
	ret c
	ld hl, wSCX
	inc [hl]
	ld hl, w2d897
	xor a
	ld [hld], a
	ld a, [hl] ; w2d896
	sub $07
	ld [hl], a
	ret

.FastScrollRightWithSFX
	play_sfx SFX_01F
.FastScrollRight
	ld a, [bc]
	cp 2
	ret c
	ld hl, wSCX
	inc [hl]
	inc [hl]
	jr .Next

.FastScrollLeft
	ld a, [bc]
	cp 2
	ret c
	ld hl, wSCX
	dec [hl]
	dec [hl]
	jr .Next

.FastScrollLeftAndReset
	ld a, [bc]
	cp 2
	ret c
	ld hl, wSCX
	dec [hl]
	dec [hl]
	ld hl, w2d897
	xor a
	ld [hld], a
	ld a, [hl]
	sub $07
	ld [hl], a
	ret
; 0x1580c8

Func_1580c8: ; 1580c8 (56:40c8)
	ld a, [bc]
	cp [hl]
	ret c
	dec l
	ld a, [hld]
	and a
	jr z, .asm_1580d6
	dec l
	ld a, $01
	ld [hl], a
	jr Func_1580d8
.asm_1580d6
	ld [hld], a
	ld [hl], a
Func_1580d8: ; 1580d8 (56:40d8)
	ret
; 0x1580d9

Func_1580d9: ; 1580d9 (56:40d9)
	cp $02
	ld a, $09
	jr c, .set_state
	ld b, a
	ld a, c
	and %11
	cp %11
	jr nz, .asm_1580e8
	dec a
.asm_1580e8
	add b
.set_state
	jp SetSceneObjState
; 0x1580ec

Func_1580ec: ; 1580ec (56:40ec)
	cp $02
	ld a, $09
	jr c, .set_state
	ld b, a
	ld a, c
	and %1
	add b
.set_state
	jp SetSceneObjState
; 0x1580fa

SpawnRock_Top: ; 1580fa (56:40fa)
	xor a
SpawnRock: ; 1580fb (56:40fb)
	ld [hli], a ; y
	ld a, d
	bit 3, c
	jr z, .got_x_coord
	ld a, e
.got_x_coord
	ld [hl], a ; x
	ret
; 0x158104

SpawnRock_Bottom: ; 158104 (56:4104)
	ld a, $60
	jr SpawnRock
; 0x158108

Func_158108: ; 158108 (56:4108)
	play_sfx SFX_10D
	ret
; 0x158111

Func_158111: ; 158111 (56:4111)
	ld hl, w2d8b0
	ld a, [hli]
	inc [hl] ; w2d8b1
	ld b, h
	ld c, l
	jumptable

	dw Func_1580d8
	dw .Func_158121
	dw .Func_15813d
	dw .Func_158162

.Func_158121
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj12
	lb de, $20, $30
	call SpawnRock_Top
	ld a, [w2d8b2]
	ld hl, wSceneObj12State
	call Func_1580d9
.Func_158136
	ld hl, w2d8b1
	xor a
	ld [hld], a
	inc [hl] ; w2d8b0
	ret

.Func_15813d
	call GetRockYVel
	ld hl, wSceneObj12YCoord
	add [hl]
	ld [hl], a
	cp $60
	ret c
	xor a
	ld [wSceneObj12State], a

	ld c, %111111
	ld a, [w2d8b2]
	cp $02
	jr nz, .asm_158157
	ld c, %11111
.asm_158157
	ldh a, [rDIV]
	and c
	ld [w2d8b3], a
	call Func_158108
	jr .Func_158136

.Func_158162
	ld hl, w2d8b3
	jp Func_1580c8
; 0x158168

Func_158168: ; 158168 (56:4168)
	ld hl, w2d8b8
	ld a, [hli]
	inc [hl] ; w2d8b9
	ld b, h
	ld c, l
	jumptable

	dw Func_1580d8
	dw .Func_158178
	dw .Func_158194
	dw .Func_1581b9

.Func_158178
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj14
	lb de, $28, $38
	call SpawnRock_Top
	ld a, [w2d8ba]
	ld hl, wSceneObj14State
	call Func_1580ec
.Func_15818d
	ld hl, w2d8b9
	xor a
	ld [hld], a
	inc [hl] ; w2d8b8
	ret

.Func_158194
	call GetRockYVel
	ld hl, wSceneObj14YCoord
	add [hl]
	ld [hl], a
	cp $60
	ret c
	xor a
	ld [wSceneObj14State], a
	ld c, %111111
	ld a, [w2d8ba]
	cp $02
	jr nz, .asm_1581ae
	ld c, %11111
.asm_1581ae
	ldh a, [rDIV]
	and c
	ld [w2d8bb], a
	call Func_158108
	jr .Func_15818d

.Func_1581b9
	ld hl, w2d8bb
	jp Func_1580c8
; 0x1581bf

Func_1581bf: ; 1581bf (56:41bf)
	ld hl, w2d8c0
	ld a, [hli]
	inc [hl] ; w2d8c1
	ld b, h
	ld c, l
	jumptable

	dw Func_1580d8
	dw .Func_1581cf
	dw .Func_1581eb
	dw .Func_158210

.Func_1581cf
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj1
	lb de, $10, $40
	call SpawnRock_Top
	ld a, [w2d8c2]
	ld hl, wSceneObj1State
	call Func_1580ec
.Func_1581e4
	ld hl, w2d8c1
	xor a
	ld [hld], a
	inc [hl] ; w2d8c0
	ret

.Func_1581eb
	call GetRockYVel
	ld hl, wSceneObj1YCoord
	add [hl]
	ld [hl], a
	cp $a0
	ret c
	xor a
	ld [wSceneObj1State], a
	ld c, %111111
	ld a, [w2d8c2]
	cp $02
	jr nz, .asm_158205
	ld c, %11111
.asm_158205
	ldh a, [rDIV]
	and c
	ld [w2d8c3], a
	call Func_158108
	jr .Func_1581e4

.Func_158210
	ld hl, w2d8c3
	jp Func_1580c8
; 0x158216

Func_158216: ; 158216 (56:4216)
	ld hl, w2d8b4
	ld a, [hli]
	inc [hl] ; w2d8b5
	ld b, h
	ld c, l
	jumptable

	dw Func_1580d8
	dw .Func_158226
	dw .Func_158242
	dw .Func_158267

.Func_158226
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj13
	lb de, $70, $80
	call SpawnRock_Top
	ld a, [w2d8b6]
	ld hl, wSceneObj13State
	call Func_1580d9
.Func_15823b
	ld hl, w2d8b5
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_158242
	call GetRockYVel
	ld hl, wSceneObj13YCoord
	add [hl]
	ld [hl], a
	cp $60
	ret c
	xor a
	ld [wSceneObj13State], a
	ld c, %111111
	ld a, [w2d8b6]
	cp $02
	jr nz, .asm_15825c
	ld c, %11111
.asm_15825c
	ldh a, [rDIV]
	and c
	ld [w2d8b7], a
	call Func_158108
	jr .Func_15823b

.Func_158267
	ld hl, w2d8b7
	jp Func_1580c8
; 0x15826d

Func_15826d: ; 15826d (56:426d)
	ld hl, w2d8bc
	ld a, [hli]
	inc [hl] ; w2d8bd
	ld b, h
	ld c, l
	jumptable

	dw Func_1580d8
	dw .Func_15827d
	dw .Func_158299
	dw .Func_1582be

.Func_15827d
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj15
	lb de, $68, $78
	call SpawnRock_Top
	ld a, [w2d8be]
	ld hl, wSceneObj15State
	call Func_1580ec
.Func_158292
	ld hl, w2d8bd
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_158299
	call GetRockYVel
	ld hl, wSceneObj15
	add [hl]
	ld [hl], a
	cp $60
	ret c
	xor a
	ld [wSceneObj15State], a
	ld c, %111111
	ld a, [w2d8be]
	cp $02
	jr nz, .asm_1582b3
	ld c, %11111
.asm_1582b3
	ldh a, [rDIV]
	and c
	ld [w2d8bf], a
	call Func_158108
	jr .Func_158292

.Func_1582be
	ld hl, w2d8bf
	jp Func_1580c8
; 0x1582c4

Func_1582c4: ; 1582c4 (56:42c4)
	ld hl, w2d8c4
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable

	dw Func_1580d8
	dw .Func_1582d4
	dw .Func_1582f0
	dw .Func_158315

.Func_1582d4
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj2
	lb de, $60, $90
	call SpawnRock_Top
	ld a, [w2d8c6]
	ld hl, wSceneObj2State
	call Func_1580ec
.Func_1582e9
	ld hl, w2d8c5
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_1582f0
	call GetRockYVel
	ld hl, wSceneObj2YCoord
	add [hl]
	ld [hl], a
	cp $a0
	ret c
	xor a
	ld [wSceneObj2State], a
	ld c, %111111
	ld a, [w2d8c6]
	cp $02
	jr nz, .asm_15830a
	ld c, %11111
.asm_15830a
	ldh a, [rDIV]
	and c
	ld [w2d8c7], a
	call Func_158108
	jr .Func_1582e9

.Func_158315
	ld hl, w2d8c7
	jp Func_1580c8
; 0x15831b

GetRockYVel: ; 15831b (56:431b)
	ld a, [bc]
	cp $2c
	jr c, .no_cap
	ld a, $28
	ld [bc], a
.no_cap
	ld e, a
	ld d, $00
	ld hl, .y_vel_table
	add hl, de
	ld a, [hl]
	ret

.y_vel_table
	db $01, $00, $01, $00, $01, $00, $01, $00
	db $01, $01, $01, $01, $01, $01, $01, $01
	db $02, $01, $02, $01, $02, $01, $02, $01
	db $02, $02, $02, $02, $02, $02, $02, $02
	db $02, $02, $02, $02, $02, $02, $02, $02
	db $03, $03, $03, $03
; 0x158358

Func_158358: ; 158358 (56:4358)
	ld a, [w2d8c8]
	jumptable
	
	dw Func_1580d8
	dw .Func_158364
	dw .Func_158383
	dw .Func_15838f

.Func_158364
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj8
	lb de, $20, $28
	call SpawnRock_Bottom
	ld a, [w2d8ca]
	ld hl, wSceneObj8State
	call Func_1580ec
	call Func_158108
.Func_15837c
	ld hl, w2d8c9
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_158383
	ld de, Data_158897
	ld hl, wSceneObj8
	call ApplyMovement
	ret nz
	jr .Func_15837c

.Func_15838f
	ld a, [w2d8ca]
	and a
	jr z, .asm_158397
	ld a, $01
.asm_158397
	ld [w2d8c8], a
	xor a
	ld [wSceneObj8State], a
	ret
; 0x15839f

Func_15839f: ; 15839f (56:439f)
	ld a, [w2d8cc]
	jumptable

	dw Func_1580d8
	dw .Func_1583ab
	dw .Func_1583ca
	dw .Func_1583d6

.Func_1583ab
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj9
	lb de, $78, $80
	call SpawnRock_Bottom
	ld a, [w2d8ce]
	ld hl, wSceneObj9State
	call Func_1580ec
	call Func_158108
.Func_1583c3
	ld hl, w2d8cd
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_1583ca
	ld de, Data_158897
	ld hl, wSceneObj9
	call ApplyMovement_Mirrored
	ret nz
	jr .Func_1583c3

.Func_1583d6
	ld a, [w2d8ce]
	and a
	jr z, .asm_1583de
	ld a, $01
.asm_1583de
	ld [w2d8cc], a
	xor a
	ld [wSceneObj9State], a
	ret
; 0x1583e6

Func_1583e6: ; 1583e6 (56:43e6)
	ld a, [w2d8d0]
	jumptable

	dw Func_1580d8
	dw .Func_1583f2
	dw .Func_158411
	dw .Func_158422

.Func_1583f2
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj10
	lb de, $18, $20
	call SpawnRock_Bottom
	ld a, [w2d8d2]
	ld hl, wSceneObj10State
	call Func_1580ec
	call Func_158108
.Func_15840a
	ld hl, w2d8d1
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_158411
	ld hl, wSceneObj10
	call Func_158484
	jr z, .Func_15840a
	ld hl, wSceneObj10
	call Func_158484
	jr z, .Func_15840a
	ret

.Func_158422
	ld a, [w2d8d2]
	and a
	jr z, .asm_15842a
	ld a, $01
.asm_15842a
	ld [w2d8d0], a
	xor a
	ld [wSceneObj10State], a
	ret
; 0x158432

Func_158432: ; 158432 (56:4432)
	ld a, [w2d8d4]
	jumptable

	dw Func_1580d8
	dw .Func_15843e
	dw .Func_15845d
	dw .Func_15846e

.Func_15843e
	ldh a, [rDIV]
	ld c, a
	ld hl, wSceneObj11
	lb de, $80, $88
	call SpawnRock_Bottom
	ld a, [w2d8d6]
	ld hl, wSceneObj11State
	call Func_1580ec
	call Func_158108
.Func_158456
	ld hl, w2d8d5
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_15845d
	ld hl, wSceneObj11
	call Func_15847e
	jr z, .Func_158456
	ld hl, wSceneObj11
	call Func_15847e
	jr z, .Func_158456
	ret

.Func_15846e
	ld a, [w2d8d6]
	and a
	jr z, .asm_158476
	ld a, $01
.asm_158476
	ld [w2d8d4], a
	xor a
	ld [wSceneObj11State], a
	ret
; 0x15847e

Func_15847e: ; 15847e (56:447e)
	ld de, Data_1588de
	jp ApplyMovement_Mirrored
; 0x158484

Func_158484: ; 158484 (56:4484)
	ld de, Data_1588de
	jp ApplyMovement
; 0x15848a

	INCROM $15848a, $158897

Data_158897: ; 158897 (56:4897)
	db  0,  0
	db -2,  0
	db -2, -1
	db -1,  0
	db -2, -1
	db -2, -1
	db -1, -1
	db -2, -1
	db -1, -1
	db -2, -1
	db -1, -1
	db -2, -2
	db -1, -1
	db -1, -1
	db -1, -2
	db -2, -1
	db -1, -2
	db -1, -1
	db -1, -2
	db -1, -1
	db -2, -2
	db -1, -2
	db -1, -2
	db -1, -1
	db -1, -2
	db -1, -2
	db  0, -2
	db -1, -2
	db -1, -2
	db  0, -2
	db -1, -2
	db  0, -2
	db -1, -2
	db  0, -2
	db  0, -2
	db $80
    
Data_1588de: ; 1588de (56:48de)
    db  0,  0
	db -1,  0
	db -2,  0
	db -1,  0
	db -2, -1
	db -1,  0
	db -2,  0
	db -1,  0
	db -1,  0
	db -2, -1
	db -1,  0
	db -2,  0
	db -1, -1
	db -1,  0
	db -2,  0
	db -1,  0
	db -2, -1
	db -1,  0
	db -1,  0
	db -1,  0
	db -1, -1
	db -1,  0
	db -1,  0
	db  0,  0
	db -1, -1
	db -1,  0
	db -1,  0
	db -1,  0
	db -1, -1
	db -1,  0
	db -1,  0
	db -1, -1
	db  0,  0
	db -1,  0
	db -1, -1
	db $80

Data_158925: ; 158925 (56:4925)
	db  0,  0
	db -1,  0
	db -2, -1
	db -1, -1
	db -2,  0
	db -1, -1
	db -2, -1
	db -1,  0
	db -1, -1
	db -2, -1
	db -1, -1
	db -1, -1
	db -2,  0
	db -1, -1
	db -1, -1
	db -2, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db -1,  0
	db -1, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db  0, -1
	db -1,  0
	db -1, -1
	db -1, -1
	db  0, -2
	db -1, -1
	db -1, -1
	db  0, -1
	db $80
; 0x15896c

	INCROM $15896c, $158ba3
