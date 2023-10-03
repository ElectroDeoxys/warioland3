_HandleTempleShakeAndRocks:
	call HandleTempleScreenShake
	call HandleTempleRock1Fall
	call HandleTempleRock2Fall
	call HandleTempleRock3Fall
	call HandleTempleRock4Fall
	call HandleTempleRock5Fall
	call HandleTempleRock6Fall
	call HandleTempleRock7Bounce
	call HandleTempleRock8Bounce
	call HandleTempleRock9Bounce
	call HandleTempleRock10Bounce
	ret

HandleTempleScreenShake:
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

Func_1580c8:
	ld a, [bc]
	cp [hl]
	ret c
	dec l
	ld a, [hld] ; size
	and a
	jr z, .asm_1580d6
	dec l
	ld a, $01
	ld [hl], a ; action
	jr StubTempleRockFunc
.asm_1580d6
	ld [hld], a ; counter
	ld [hl], a  ; action
StubTempleRockFunc:
	ret

SetTempleRockSize_WithLarge:
	cp TEMPLE_ROCK_SIZE_LARGE
	ld a, $9
	jr c, .set_state
	ld b, a
	ld a, c ; random seed
	and %11
	cp %11
	jr nz, .ok
	dec a
.ok
	; either 0, 1 or 2
	add b
.set_state
	jp SetSceneObjState

SetTempleRockSize_WithoutLarge:
	cp TEMPLE_ROCK_SIZE_LARGE
	ld a, $9
	jr c, .set_state
	ld b, a
	ld a, c
	and %1
	; either 0 or 1
	add b
.set_state
	jp SetSceneObjState

SpawnRock_Top:
	xor a
SpawnRock:
	ld [hli], a ; y
	ld a, d
	bit 3, c
	jr z, .got_x_coord
	ld a, e
.got_x_coord
	ld [hl], a ; x
	ret

SpawnRock_Bottom:
	ld a, $60
	jr SpawnRock

PlayFallingRockSFX:
	play_sfx SFX_TEMPLE_ROCK
	ret

; \1 = rock number
; \2 = scene object to use
; \3 = whether can be large or not
; \4 = x coordinate 1
; \5 = x coordinate 2
; \6 = max y coordinate
MACRO temple_rock_fall
HandleTempleRock\1Fall:
	ld hl, wTempleRock\1
	ld a, [hli] ; action
	inc [hl] ; counter
	ld b, h
	ld c, l
	jumptable

	dw StubTempleRockFunc
	dw .Spawn
	dw .Update
	dw .Reset

.Spawn
	ldh a, [rDIV]
	ld c, a
	ld hl, \2
	lb de, \4, \5
	call SpawnRock_Top
	ld a, [wTempleRock\1Size]
	ld hl, \2State
IF (\3) == TRUE
	call SetTempleRockSize_WithLarge
ELSE
	call SetTempleRockSize_WithoutLarge
ENDC
.Next
	ld hl, wTempleRock\1Counter
	xor a
	ld [hld], a
	inc [hl] ; action
	ret

.Update
	call GetRockYVel
	ld hl, \2YCoord
	add [hl]
	ld [hl], a
	cp \6
	ret c
	xor a
	ld [\2State], a

	ld c, %111111
	ld a, [wTempleRock\1Size]
	cp TEMPLE_ROCK_SIZE_LARGE
	jr nz, .not_large
	ld c, %11111
.not_large
	ldh a, [rDIV]
	and c
	ld [wTempleRock\1RespawnTime], a
	call PlayFallingRockSFX
	jr .Next

.Reset
	ld hl, wTempleRock\1RespawnTime
	jp Func_1580c8
ENDM

	temple_rock_fall 1, wSceneObj12, TRUE,   32,  48,  96
	temple_rock_fall 3, wSceneObj14, FALSE,  40,  56,  96
	temple_rock_fall 5, wSceneObj1,  FALSE,  16,  64, 160
	temple_rock_fall 2, wSceneObj13, TRUE,  112, 128,  96
	temple_rock_fall 4, wSceneObj15, FALSE, 104, 120,  96
	temple_rock_fall 6, wSceneObj2,  FALSE,  96, 144, 160

GetRockYVel:
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

; \1 = rock number
; \2 = scene object to use
; \3 = whether a fast bounce or not
; \4 = which direction to go
; \5 = x coordinate 1
; \6 = x coordinate 2
MACRO temple_rock_bounce
HandleTempleRock\1Bounce:
	ld a, [wTempleRock\1Action]
	jumptable
	
	dw StubTempleRockFunc
	dw .Spawn
	dw .Update
	dw .Reset

.Spawn
	ldh a, [rDIV]
	ld c, a
	ld hl, \2
	lb de, \5, \6
	call SpawnRock_Bottom
	ld a, [wTempleRock\1Size]
	ld hl, \2State
	call SetTempleRockSize_WithoutLarge
	call PlayFallingRockSFX
.Next
	ld hl, wTempleRock\1Counter
	xor a
	ld [hld], a
	inc [hl]
	ret

.Update
IF (\3) == TRUE

IF (\4) == DIRECTION_LEFT
REPT 2
	ld hl, \2
	call BounceTempleRockLeft
	jr z, .Next
ENDR
ELSE ; (\4) == DIRECTION_RIGHT
REPT 2
	ld hl, \2
	call BounceTempleRockRight
	jr z, .Next
ENDR
ENDC
	ret

ELSE ; (\3) == FALSE

	ld de, Data_158897
	ld hl, \2

IF (\4) == DIRECTION_LEFT
	call ApplyOWMovement
ELSE ; (\4) == DIRECTION_RIGHT
	call ApplyOWMovement_Mirrored
ENDC

	ret nz
	jr .Next

ENDC

.Reset
	ld a, [wTempleRock\1Size]
	and a
	jr z, .set_action
	ld a, $1 ; spawn
.set_action
	ld [wTempleRock\1Action], a
	xor a
	ld [\2State], a
	ret
ENDM

	temple_rock_bounce  7, wSceneObj8,  FALSE, DIRECTION_LEFT,   32,  40
	temple_rock_bounce  8, wSceneObj9,  FALSE, DIRECTION_RIGHT, 120, 128
	temple_rock_bounce  9, wSceneObj10, TRUE,  DIRECTION_LEFT,   24,  32
	temple_rock_bounce 10, wSceneObj11, TRUE,  DIRECTION_RIGHT, 128, 136

BounceTempleRockRight:
	ld de, Data_1588de
	jp ApplyOWMovement_Mirrored

BounceTempleRockLeft:
	ld de, Data_1588de
	jp ApplyOWMovement

Func_15848a:
	call .Func_15849a
	call .Func_1584da
	call .Func_158529
	call .Func_15858c
	call .Func_1585e1
	ret

.Func_15849a:
	ld hl, w2d8a0
	ld a, [hli]
	inc [hl]
	jumptable
	dw .Func_1584a6
	dw .Func_1584ab
	dw .Func_1584c4

.Func_1584a6:
	xor a
	ld [w2d8a1], a
	ret

.Func_1584ab:
	ld hl, wSceneObj1YCoord
	ld a, $18
	ld [hli], a
	ld a, [wSceneObj9XCoord]
	ld [hl], a
	ld a, $16
	ld hl, wSceneObj1State
	call SetSceneObjState
	ld hl, w2d8a1
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_1584c4:
	ld a, [w2d8a1]
	and $03
	ret nz
	ld hl, wSceneObj1YCoord
	inc [hl]
	ld a, [hl]
	cp $58
	ret nz
	xor a
	ld [wSceneObj1State], a
	ld [w2d8a0], a
	ret

.Func_1584da:
	ld hl, wTempleMusicBox1
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_1584e8
	dw .Func_1584f4
	dw .Func_15850d

.Func_1584e8:
	ld a, [wSceneObj1State]
	and a
	ret z
.asm_1584ed
	ld hl, wTempleMusicBox1Counter
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_1584f4:
	ld hl, wSceneObj5
	ld a, [wSceneObj1YCoord]
	sub $08
	ld [hli], a
	ld a, [wSceneObj1XCoord]
	sub $03
	ld [hl], a
	ld a, $15
	ld hl, wSceneObj5State
	call SetSceneObjState
	jr .asm_1584ed

.Func_15850d:
	call .Func_15864a
	jr z, .asm_158521
	ld hl, wSceneObj5
	add [hl]
	ld [hl], a
	ld a, [bc]
	cp $03
	ret nz
	ld a, $14
	ld [wSceneObj5State], a
	ret
.asm_158521
	xor a
	ld [wSceneObj5State], a
	ld [wTempleMusicBox1], a
	ret

.Func_158529:
	ld hl, wPlanePart2Counter
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_15853b
	dw .Func_158547
	dw .Func_15854d
	dw .Func_158566
	dw .Func_158580

.Func_15853b:
	ld a, [wSceneObj1State]
	and a
	ret z
.asm_158540
	ld hl, wTempleMusicBox3
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_158547:
	ld a, [bc]
	cp $0a
	ret c
	jr .asm_158540

.Func_15854d:
	ld hl, wSceneObj6
	ld a, [wSceneObj1YCoord]
	sub $08
	ld [hli], a
	ld a, [wSceneObj1XCoord]
	add $03
	ld [hl], a
	ld a, $15
	ld hl, wSceneObj6State
	call SetSceneObjState
	jr .asm_158540

.Func_158566:
	call .Func_15864a
	jr z, .asm_15857a
	ld hl, wSceneObj6
	add [hl]
	ld [hl], a
	ld a, [bc]
	cp $03
	ret nz
	ld a, $14
	ld [wSceneObj6State], a
	ret
.asm_15857a
	xor a
	ld [wSceneObj6State], a
	jr .asm_158540

.Func_158580:
	ld a, [wSceneObj1State]
	and a
	jr z, .asm_158588
	ld a, $02
.asm_158588
	ld [wPlanePart2Counter], a
	ret

.Func_15858c:
	ld hl, wTempleMusicBox4
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_15859a
	dw .Func_1585a6
	dw .Func_1585bf

.Func_15859a:
	ld a, [wSceneObj1State]
	and a
	ret z
.asm_15859f
	ld hl, wTempleMusicBox4Counter
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_1585a6:
	ld hl, wSceneObj7
	ld a, [wSceneObj1YCoord]
	sub $06
	ld [hli], a
	ld a, [wSceneObj1XCoord]
	sub $04
	ld [hl], a
	ld a, $15
	ld hl, wSceneObj7State
	call SetSceneObjState
	jr .asm_15859f

.Func_1585bf:
	call .Func_15866e
	jr z, .asm_1585d9
	ld hl, wSceneObj7
	add [hl]
	ld [hli], a
	ld a, [bc]
	and $01
	jr z, .asm_1585cf
	dec [hl]
.asm_1585cf
	ld a, [bc]
	cp $03
	ret nz
	ld a, $14
	ld [wSceneObj7State], a
	ret
.asm_1585d9
	xor a
	ld [wSceneObj7State], a
	ld [wTempleMusicBox4], a
	ret

.Func_1585e1:
	ld hl, wTempleMusicBox5Counter
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_1585f3
	dw .Func_1585ff
	dw .Func_158605
	dw .Func_15861e
	dw .Func_15863e

.Func_1585f3:
	ld a, [wSceneObj1State]
	and a
	ret z
.asm_1585f8
	ld hl, wPalFade2Colour3GreenUnk1
	xor a
	ld [hld], a
	inc [hl]
	ret

.Func_1585ff:
	ld a, [bc]
	cp $08
	ret c
	jr .asm_1585f8

.Func_158605:
	ld hl, wSceneObj8
	ld a, [wSceneObj1YCoord]
	sub $10
	ld [hli], a
	ld a, [wSceneObj1XCoord]
	add $06
	ld [hl], a
	ld a, $15
	ld hl, wSceneObj8State
	call SetSceneObjState
	jr .asm_1585f8

.Func_15861e:
	call .Func_15866e
	jr z, .asm_158638
	ld hl, wSceneObj8
	add [hl]
	ld [hli], a
	ld a, [bc]
	and $01
	jr z, .asm_15862e
	inc [hl]
.asm_15862e
	ld a, [bc]
	cp $03
	ret nz
	ld a, $14
	ld [wSceneObj8State], a
	ret
.asm_158638
	xor a
	ld [wSceneObj8State], a
	jr .asm_1585f8

.Func_15863e:
	ld a, [wSceneObj1State]
	and a
	jr z, .asm_158646
	ld a, $02
.asm_158646
	ld [wTempleMusicBox5Counter], a
	ret

.Func_15864a:
	ld hl, .data_1
	ld a, [bc]
	ld e, a
	ld d, $00
	ld hl, .data_1 ; redundant
	add hl, de
	ld a, [hl]
	cp $80
	ret

.data_1
	db -1, -1, -1, -1, -2, -1, -2, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, $80

.Func_15866e:
	ld hl, .data_2
	ld a, [bc]
	ld e, a
	ld d, $00
	ld hl, .data_2 ; redundant
	add hl, de
	ld a, [hl]
	cp $80
	ret

.data_2
	db -1, -1, -1, -1, -2, -1, -2, -1, -2, -2, -2, -2, -2, -2, -2, -2, $80

Func_15868e:
	call .Func_1586a1
	call .Func_158785
	call .Func_1586ed
	call .Func_1587d1
	call .Func_158739
	call .Func_15881d
	ret

.Func_1586a1:
	ld a, [w2d150]
	jumptable
	dw .Func_1586b5
	dw .Func_1586c1
	dw .Func_1586d1
	dw .Func_1586b6
	dw .Func_1586dd
	dw .Func_1586c9
	dw .Func_1586e2
	dw .Func_1586e7

.Func_1586b5:
	ret

.Func_1586b6:
	ld hl, wSceneObj2
	call .Func_158869
.asm_1586bc
	ld hl, w2d150
	inc [hl]
	ret

.Func_1586c1:
	ld hl, wSceneObj2
	call .Func_15887b
	jr .asm_1586bc

.Func_1586c9:
	ld hl, wSceneObj2
	call .Func_158889
	jr .asm_1586bc

.Func_1586d1:
	ld de, Data_158897
.asm_1586d4
	ld hl, wSceneObj2
	call ApplyOWMovement
	ret nz
	jr .asm_1586bc

.Func_1586dd:
	ld de, Data_1588de
	jr .asm_1586d4

.Func_1586e2:
	ld de, Data_158925
	jr .asm_1586d4

.Func_1586e7:
	ld a, $01
	ld [w2d150], a
	ret

.Func_1586ed:
	ld a, [wd152]
	jumptable
	dw .Func_158701
	dw .Func_158702
	dw .Func_158729
	dw .Func_158715
	dw .Func_15872e
	dw .Func_15870d
	dw .Func_15871d
	dw .Func_158733

.Func_158701:
	ret

.Func_158702:
	ld hl, wSceneObj5
	call .Func_158869
.asm_158708
	ld hl, wd152
	inc [hl]
	ret

.Func_15870d:
	ld hl, wSceneObj5
	call .Func_15887b
	jr .asm_158708

.Func_158715:
	ld hl, wSceneObj5
	call .Func_158889
	jr .asm_158708

.Func_15871d:
	ld de, Data_158897
.asm_158720
	ld hl, wSceneObj5
	call ApplyOWMovement
	ret nz
	jr .asm_158708

.Func_158729:
	ld de, Data_1588de
	jr .asm_158720

.Func_15872e:
	ld de, Data_158925
	jr .asm_158720

.Func_158733:
	ld a, $01
	ld [wd152], a
	ret

.Func_158739:
	ld a, [wd154]
	jumptable
	dw .Func_15874d
	dw .Func_158761
	dw .Func_15877a
	dw .Func_158759
	dw .Func_158769
	dw .Func_15874e
	dw .Func_158775
	dw .Func_15877f

.Func_15874d:
	ret

.Func_15874e:
	ld hl, wSceneObj9
	call .Func_158869
.asm_158754
	ld hl, wd154
	inc [hl]
	ret

.Func_158759:
	ld hl, wSceneObj9
	call .Func_15887b
	jr .asm_158754

.Func_158761:
	ld hl, wSceneObj9
	call .Func_158889
	jr .asm_158754

.Func_158769:
	ld de, Data_158897
.asm_15876c
	ld hl, wSceneObj9
	call ApplyOWMovement
	ret nz
	jr .asm_158754

.Func_158775:
	ld de, Data_1588de
	jr .asm_15876c

.Func_15877a:
	ld de, Data_158925
	jr .asm_15876c

.Func_15877f:
	ld a, $01
	ld [wd154], a
	ret

.Func_158785:
	ld a, [w2d151]
	jumptable
	dw .Func_158799
	dw .Func_1587a5
	dw .Func_1587b5
	dw .Func_15879a
	dw .Func_1587c1
	dw .Func_1587ad
	dw .Func_1587c6
	dw .Func_1587cb

.Func_158799:
	ret

.Func_15879a:
	ld hl, wSceneObj3
	call .Func_158869
.asm_1587a0
	ld hl, w2d151
	inc [hl]
	ret

.Func_1587a5:
	ld hl, wSceneObj3
	call .Func_158882
	jr .asm_1587a0

.Func_1587ad:
	ld hl, wSceneObj3
	call .Func_158890
	jr .asm_1587a0

.Func_1587b5:
	ld de, Data_158897
.asm_1587b8
	ld hl, wSceneObj3
	call ApplyOWMovement_Mirrored
	ret nz
	jr .asm_1587a0

.Func_1587c1:
	ld de, Data_1588de
	jr .asm_1587b8

.Func_1587c6:
	ld de, Data_158925
	jr .asm_1587b8

.Func_1587cb:
	ld a, $01
	ld [w2d151], a
	ret

.Func_1587d1:
	ld a, [wd153]
	jumptable
	dw .Func_1587e5
	dw .Func_1587e6
	dw .Func_15880d
	dw .Func_1587f9
	dw .Func_158812
	dw .Func_1587f1
	dw .Func_158801
	dw .Func_158817

.Func_1587e5:
	ret

.Func_1587e6:
	ld hl, wSceneObj8
	call .Func_158869
.asm_1587ec
	ld hl, wd153
	inc [hl]
	ret

.Func_1587f1:
	ld hl, wSceneObj8
	call .Func_158882
	jr .asm_1587ec

.Func_1587f9:
	ld hl, wSceneObj8
	call .Func_158890
	jr .asm_1587ec

.Func_158801:
	ld de, Data_158897
.asm_158804
	ld hl, wSceneObj8
	call ApplyOWMovement_Mirrored
	ret nz
	jr .asm_1587ec

.Func_15880d:
	ld de, Data_1588de
	jr .asm_158804

.Func_158812:
	ld de, Data_158925
	jr .asm_158804

.Func_158817:
	ld a, $01
	ld [wd153], a
	ret

.Func_15881d:
	ld a, [wd155]
	jumptable
	dw .Func_158831
	dw .Func_158845
	dw .Func_15885e
	dw .Func_158832
	dw .Func_158859
	dw .Func_15883d
	dw .Func_15884d
	dw .Func_158863

.Func_158831:
	ret

.Func_158832:
	ld hl, wSceneObj10
	call .Func_158869
.asm_158838
	ld hl, wd155
	inc [hl]
	ret

.Func_15883d:
	ld hl, wSceneObj10
	call .Func_158882
	jr .asm_158838

.Func_158845:
	ld hl, wSceneObj10
	call .Func_158890
	jr .asm_158838

.Func_15884d:
	ld de, Data_158897
.asm_158850
	ld hl, wSceneObj10
	call ApplyOWMovement_Mirrored
	ret nz
	jr .asm_158838

.Func_158859:
	ld de, Data_1588de
	jr .asm_158850

.Func_15885e:
	ld de, Data_158925
	jr .asm_158850

.Func_158863:
	ld a, $01
	ld [wd155], a
	ret

.Func_158869:
	ld a, $30
	ld [hli], a ; y
	ld a, $50
.asm_15886e
	ld [hli], a ; x
	set 2, l
	ldh a, [rDIV]
	and $01
	ld b, $29
	add b
	jp SetSceneObjState

.Func_15887b:
	ld a, $2e
	ld [hli], a ; y
	ld a, $4e
	jr .asm_15886e

.Func_158882:
	ld a, $2e
	ld [hli], a ; y
	ld a, $52
	jr .asm_15886e

.Func_158889:
	ld a, $31
	ld [hli], a ; y
	ld a, $4f
	jr .asm_15886e

.Func_158890:
	ld a, $31
	ld [hli], a ; y
	ld a, $51
	jr .asm_15886e

Data_158897:
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
    
Data_1588de:
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

Data_158925:
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

_InitBestTimeList:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	play_music2 MUSIC_TREASURE_COLLECTION

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ld a, [wObj1SubState]
	rra
	and a
	jr z, .asm_158990
	ld a, $70
.asm_158990
	ldh [rSCY], a
	ld [wSCY], a

	ld a, $02
	ldh [rSVBK], a
	call .VBlank_158a14
	call .Func_158a09

	ld hl, Pals_158b63
	call LoadPalsToTempPals1

	decompress BestTimeListGfx, v0Tiles1 + $200
	decompress_vram1 BGMap_b3143, v1BGMap0
	decompress BGMap_b2e72, v0BGMap0

	call PrintBestTimes
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_ON
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

.Func_158a09:
	ld hl, wCollectionRow
	ld bc, $800
	xor a
	call WriteAToHL_BCTimes
	ret

.VBlank_158a14:
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, $02
	ldh [rSVBK], a
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end

_BestTimeList:
	ld a, [wCollectionRow]
	and a
	jr nz, .asm_158a76
	ld hl, wSCY
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down

	; no input
	ld hl, wCollectionCol
	inc [hl]
	ld a, [hl]
	and a
	jr nz, .asm_158a5a
	ld hl, wCollectionRow
	inc [hl]
	xor a
	ld [wColourFadeDiff], a
.asm_158a5a
	ld a, [wJoypadPressed]
	and B_BUTTON | START
	ret z
	ld a, $08
	ld [wSubState], a
	ret
.d_up
	ld a, [hl]
	and a
	ret z
	dec [hl]
.asm_158a6a
	xor a
	ld [wCollectionCol], a
	ret
.d_down
	ld a, [hl]
	cp $70
	ret z
	inc [hl]
	jr .asm_158a6a
.asm_158a76
	call .Func_158ac2
	ret c
	ld a, [wColourFadeDiff]
	and a
	jr z, .asm_158a8c
	dec a
	jr z, .asm_158a9f
	dec a
	jr z, .asm_158aa9
	dec a
	jr z, .asm_158ab2
	debug_nop

.asm_158a8c
	ld hl, wSCY
	ld a, [hl]
	cp $70
	jr nc, .asm_158a96
	inc [hl]
	ret
.asm_158a96
	xor a
	ld [wCollectionLinkStateCounter], a
	ld hl, wColourFadeDiff
	inc [hl]
	ret

.asm_158a9f
	ld hl, wCollectionLinkStateCounter
	inc [hl]
	ld a, [hl]
	cp $b4
	ret c
	jr .asm_158a96
.asm_158aa9
	ld hl, wSCY
	ld a, [hl]
	and a
	jr z, .asm_158a96
	dec [hl]
	ret

.asm_158ab2
	ld hl, wCollectionLinkStateCounter
	inc [hl]
	ld a, [hl]
	cp $b4
	ret c
	xor a
	ld [wCollectionLinkStateCounter], a
	ld [wColourFadeDiff], a
	ret

.Func_158ac2:
	ld a, [wJoypadPressed]
	and A_BUTTON | B_BUTTON | START | D_UP | D_DOWN
	ret z
	xor a
	ld [wCollectionRow], a
	scf
	ret

PrintBestTimes:
	xor a ; LEVEL_OUT_OF_THE_WOODS
	ld [w2dfff], a
.loop_levels
	call .PrintLevelTime
	ld hl, w2dfff
	inc [hl]
	ld a, NUM_LEVELS - 1
	cp [hl]
	ret c
	jr .loop_levels

.PrintLevelTime:
	ld a, [w2dfff]
	ld hl, wLevelTimeAttackScores
	add a
	ld c, a
	ld b, $00
	add hl, bc
	ld a, [hli]
	ld d, a    ; minutes
	ld e, [hl] ; seconds
	ld b, 2
	ld hl, w2df00
.loop_get_tiles
	and $f0
	swap a
	add a
	add $a0
	ld [hli], a
	ld a, d
	and $0f
	add a
	add $a0 ; 0 digit
	ld [hli], a
	dec b
	jr z, .write_tiles
	ld a, $b6 ; colon
	ld [hli], a
	ld d, e
	ld a, e
	jr .loop_get_tiles

.write_tiles
	ld a, [w2dfff]
	ld hl, .bg_map_address_table
	call GetPointerFromTableDE
	ld b, $00
.loop_write_bg_map
	ld c, 5 ; num tiles wide
	ld hl, w2df00
.loop_write_tiles
	ld a, [hli]
	add b
	ld [de], a
	inc e
	dec c
	jr nz, .loop_write_tiles
	inc b
	ld a, b
	cp 2
	ret z
	ld a, BG_MAP_WIDTH - $5
	add e
	ld e, a
	ld a, d
	adc $00
	ld d, a
	jr .loop_write_bg_map

.bg_map_address_table
	dw v0BGMap0 +  $64 ; LEVEL_OUT_OF_THE_WOODS
	dw v0BGMap0 +  $a4 ; LEVEL_THE_PEACEFUL_VILLAGE
	dw v0BGMap0 +  $e4 ; LEVEL_THE_VAST_PLAIN
	dw v0BGMap0 + $124 ; LEVEL_BANK_OF_THE_WILD_RIVER
	dw v0BGMap0 + $164 ; LEVEL_THE_TIDAL_COAST
	dw v0BGMap0 + $1a4 ; LEVEL_SEA_TURTLE_ROCKS
	dw v0BGMap0 +  $6e ; LEVEL_DESERT_RUINS
	dw v0BGMap0 +  $ae ; LEVEL_THE_VOLCANOS_BASE
	dw v0BGMap0 +  $ee ; LEVEL_THE_POOL_OF_RAIN
	dw v0BGMap0 + $12e ; LEVEL_A_TOWN_IN_CHAOS
	dw v0BGMap0 + $16e ; LEVEL_BENEATH_THE_WAVES
	dw v0BGMap0 + $1ae ; LEVEL_THE_WEST_CRATER
	dw v0BGMap0 + $224 ; LEVEL_THE_GRASSLANDS
	dw v0BGMap0 + $264 ; LEVEL_THE_BIG_BRIDGE
	dw v0BGMap0 + $2a4 ; LEVEL_TOWER_OF_REVIVAL
	dw v0BGMap0 + $2e4 ; LEVEL_THE_STEEP_CANYON
	dw v0BGMap0 + $324 ; LEVEL_CAVE_OF_FLAMES
	dw v0BGMap0 + $364 ; LEVEL_ABOVE_THE_CLOUDS
	dw v0BGMap0 + $22e ; LEVEL_THE_STAGNANT_SWAMP
	dw v0BGMap0 + $26e ; LEVEL_THE_FRIGID_SEA
	dw v0BGMap0 + $2ae ; LEVEL_CASTLE_OF_ILLUSIONS
	dw v0BGMap0 + $2ee ; LEVEL_THE_COLOSSAL_HOLE
	dw v0BGMap0 + $32e ; LEVEL_THE_WARPED_VOID
	dw v0BGMap0 + $36e ; LEVEL_THE_EAST_CRATER
	dw v0BGMap0 + $3ae ; LEVEL_FOREST_OF_FEAR

Pals_158b63:
	rgb 31, 31, 31
	rgb 31, 20,  0
	rgb 29,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31,  5
	rgb  0, 10, 25
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 31, 15
	rgb 29,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 31, 31,  5
	rgb  0,  4, 14
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  0,  0,  0
