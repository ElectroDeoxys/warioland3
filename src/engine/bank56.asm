_HandleTempleShakeAndRocks: ; 158000 (56:4000)
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
; 0x158022

HandleTempleScreenShake: ; 158022 (56:4022)
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
StubTempleRockFunc: ; 1580d8 (56:40d8)
	ret
; 0x1580d9

SetTempleRockSize_WithLarge: ; 1580d9 (56:40d9)
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
; 0x1580ec

SetTempleRockSize_WithoutLarge: ; 1580ec (56:40ec)
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

PlayFallingRockSFX: ; 158108 (56:4108)
	play_sfx SFX_TEMPLE_ROCK
	ret
; 0x158111

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

BounceTempleRockRight: ; 15847e (56:447e)
	ld de, Data_1588de
	jp ApplyOWMovement_Mirrored
; 0x158484

BounceTempleRockLeft: ; 158484 (56:4484)
	ld de, Data_1588de
	jp ApplyOWMovement
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
