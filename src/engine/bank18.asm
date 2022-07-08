StandingFallYVel_Light: ; 60000 (18:4000)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  1,  1,  1,  2,  2,  2,  3,  3,  4,  4,  4, $80
; 0x60020

StandingFallYVel_Heavy: ; 60020 (18:4020)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  1,  2,  2,  3,  3,  4,  4,  5,  5,  5,  5, $80
; 0x60040

Data_60040: ; 60040 (18:4040)
	db -3, -2, -1,  0,  1,  1,  1,  1,  1,  1,  2,  2,  2,  3,  3,  3
	db  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4, $80
; 0x60060

Data_60060: ; 60060 (18:4060)
	db -2, -1,  1,  2,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  4,  4
	db  4,  4,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5, $80
; 0x60080

Data_60080: ; 60080 (18:4080)
	db  0,  0,  1,  1,  1,  2,  2,  2,  2,  3,  3,  3,  3,  4,  3,  4
	db  4,  4,  4,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5, $80
; 0x600a0

Data_600a0: ; 600a0 (18:40a0)
	db  0,  0,  0,  0,  0,  0,  1,  1,  1,  2,  2,  2,  2,  3,  3,  3
	db  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  5,  5,  5,  5,  5, $80
; 0x600c0

Data_600c0: ; 600c0 (18:40c0)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  1,  0,  1,  1,  1,  1,  2,  2,  2,  3,  3,  4, $80
; 0x600e0

Data_600e0: ; 600e0 (18:40e0)
	db  0,  0,  0,  0,  0,  0,  1,  0,  1,  1,  1,  1,  2,  2,  2,  2
	db  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  4, $80
; 0x60100

Data_60100: ; 60100 (18:4100)
	db -4, -4, -4, -4, -4, -4, -3, -3, -3, -3, -3, -3, -2, -2, -1, -1
	db  0,  0,  0,  1,  1,  1,  2,  2,  2,  3,  3,  3,  4,  4,  5, $80
; 0x60120

Data_60120: ; 60120 (18:4120)
	db -4, -4, -4, -3, -3, -3, -2, -2, -1, -1,  0,  0,  0,  1,  1,  1
	db  2,  2,  3,  3,  3,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5, $80
; 0x60140

Data_60140: ; 60140 (18:4140)
	db -7, -7, -7, -7, -6, -6, -6, -6, -5, -5, -5, -5, -4, -4, -4, -3
	db -3, -3, -2, -2, -1,  0,  0,  0,  0,  1,  1,  2,  3,  4,  5, $80
; 0x60160

Data_60160: ; 60160 (18:4160)
	db -7, -6, -5, -5, -5, -4, -4, -4, -3, -3, -3, -3, -2, -2, -1, -1
	db  0,  0,  0,  1,  1,  2,  2,  3,  3,  4,  4,  5,  5,  6,  6, $80
; 0x60180

Data_60180: ; 60180 (18:4180)
	db -7, -6, -5, -4, -3, -3, -2, -2, -1, -1,  0,  0,  0,  0,  0,  0
	db  0,  1,  0,  1,  2,  2,  3,  2,  3,  3,  4,  4,  5,  6,  7, $80
; 0x601a0

Data_601a0: ; 601a0 (18:41a0)
	db -4, -3, -3, -3, -2, -2, -1, -1, -1,  0,  0,  1,  0,  1,  0,  1
	db  1,  2,  1,  2,  2,  3,  3,  3,  4,  5,  6,  7,  8,  9, 10, $80
; 0x601c0

Data_601c0: ; 601c0 (18:41c0)
	db   3,  -7,  16
	db   4, -18,  14
	db   3, -28,   6
	db   0,   0,   0
	db   0,   0,   0
	db   0
; 0x601d0

	INCROM $601d0, $601e0

Data_601e0: ; 601e0 (18:41e0)
	db   3,  -7, -17
	db   4, -18, -15
	db   3, -28,  -7
	db   0,   0,   0
	db   0,   0,   0
	db   0
; 0x601f0

	INCROM $601f0, $60280

; y-offset values for falling light objects
FallingYVel_Light: ; 60280 (18:4280)
	db 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, $80
; 0x60290

; y-offset values for falling heavy objects
FallingYVel_Heavy: ; 60290 (18:4290)
	db 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, $80
; 0x602a0

Data_602a0: ; 602a0 (18:42a0)
	db -4, -3, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, $80
; 0x602b0

Data_602b0: ; 602b0 (18:42b0)
	db -3, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, $80
; 0x602c0

Data_602c0: ; 602c0 (18:42c0)
	db -2, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x602d0

Data_602d0: ; 602d0 (18:42d0)
	db -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x602e0

Data_602e0: ; 602e0 (18:42e0)
	db -3, -2, -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x602f0

Data_602f0: ; 602f0 (18:42f0)
	db -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x60300

Data_60300: ; 60300 (18:4300)
	db -4, -3, -3, -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x60310

Data_60310: ; 60310 (18:4310)
	db -3, -2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x60320

Data_60320: ; 60320 (18:4320)
	db -1, -1, -1, -1,  0, -1,  0, -1,  0, -1,  0,  0,  1,  0,  1,  0
	db  1,  1,  1,  2,  2,  2,  3,  3,  4,  4,  4,  4,  4,  4,  4, $80
; 0x60340

	INCROM $60340, $603d0

Data_603d0: ; 603d0 (18:43d0)
	db -6, -5, -5, -5, -4, -4, -4, -3, -3, -3, -2, -1, -1, -1,  0, $80
; 0x603e0

Data_603e0: ; 603e0 (18:43e0)
	db 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, $80
; 0x603f0

Data_603f0: ; 603f0 (18:43f0)
	db 1, 2, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $80
; 0x60400

	INCROM $60400, $60490

Data_60490: ; 60490 (18:4490)
	db  2,  4,  6,  8, 10,  9,  8,  7,  6,  5,  4,  3,  2,  1,  0, $80
; 0x604a0

Data_604a0: ; 604a0 (18:44a0)
	db 1, 2, 3, 4, 4, 4, 4, 4, 3, 2, 1, 0, 0, 0, 0, $80
; 0x604b0

Data_604b0: ; 604b0 (18:44b0)
	db -3, -2, -1, -1, -1,  0,  0,  0,  0,  1,  1,  1,  2,  3,  0, $80
; 0x604c0

	INCROM $604c0, $605e0

Data_605e0: ; 605e0 (18:45e0)
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3
	db 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, $80
; 0x60600

	INCROM $60600, $611cb

Func_611cb: ; 611cb (18:51cb)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
FOR n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
ENDR
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	call DoObjectAction

	ld a, BANK("Object Update Functions 4")
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer + 0], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call UpdateObjectAnimation
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a

	ld hl, wc0bc
	ld a, [wc089]
	add [hl]
	ld [wSCY], a
	ld a, [wc08b]
	ld [wSCX], a
	pop hl

	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_STEPPED)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjCollBoxTop]
	ld [hli], a
	ld a, [wCurObjCollBoxBottom]
	ld [hli], a
	ld a, [wCurObjCollBoxLeft]
	ld [hli], a
	ld a, [wCurObjCollBoxRight]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 0]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjStateDuration]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjMovementIndex]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjState]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction + 0]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x6130b

Func_6130b: ; 6130b (18:530b)
	call HandleGrabbedObjectCollisions

	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_611cb
FOR n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, Func_611cb ; OBJFLAG_UNK0_F set
ENDR
	ret
; 0x61348

Func_61348: ; 61348 (18:5348)
	ld a, [wPowerUpLevel]
	ld e, a
	ld a, [wTransformation]
	rla
	jr nc, .got_effective_power_up
	ld e, POWER_UP_SUPER_JUMP_SLAM_OVERALLS
.got_effective_power_up
	ld a, e
	ld [wEffectivePowerUp], a

	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, Func_6130b

	ld a, [wIsFloorTransition]
	and a
	jr nz, .floor_transition

	call HandleGrabbedObjectCollisions
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_613dc ; OBJFLAG_UNK0_F set
FOR n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, Func_613dc ; OBJFLAG_UNK0_F set
ENDR
	ret

.floor_transition
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_61513
FOR n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, Func_61513 ; OBJFLAG_UNK0_F set
ENDR
	ret
; 0x613dc

Func_613dc: ; 613dc (18:53dc)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
FOR n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
ENDR
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	call DoObjectAction

; call update function
	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or BANK("Object Update Functions 1")
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call UpdateObjectAnimation
	call Func_6307b

	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a
	pop hl

	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_STEPPED)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjCollBoxTop]
	ld [hli], a
	ld a, [wCurObjCollBoxBottom]
	ld [hli], a
	ld a, [wCurObjCollBoxLeft]
	ld [hli], a
	ld a, [wCurObjCollBoxRight]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 0]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjStateDuration]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjMovementIndex]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjState]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction + 0]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x61513

Func_61513: ; 61513 (18:5513)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
FOR n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
ENDR
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	ld hl, wCurObjUnk1a
	bit 5, [hl]
	jr z, .skip_update_function

	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or BANK("Object Update Functions 1")
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.skip_update_function
	call UpdateObjectFrame
	call Func_6307b

	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add 16
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add 8
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_STEPPED)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjCollBoxTop]
	ld [hli], a
	ld a, [wCurObjCollBoxBottom]
	ld [hli], a
	ld a, [wCurObjCollBoxLeft]
	ld [hli], a
	ld a, [wCurObjCollBoxRight]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 0]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjStateDuration]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjMovementIndex]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjState]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x6164e

Func_6164e: ; 6164e (18:564e)
FOR n, 1, NUM_OBJECTS + 1
	ld hl, wObj{u:n}Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, :+
	ld e, LOW(wObj{u:n}ScreenYPos)
	ld l, LOW(wObj{u:n}Unk07)
	call UpdateObjSprite
:
ENDR
	ret
; 0x616d7

Func_616d7: ; 616d7 (18:56d7)
FOR n, 1, NUM_OBJECTS + 1
	ld hl, wObj{u:n}Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, :+
	ld e, LOW(wObj{u:n}ScreenYPos)
	ld l, LOW(wObj{u:n}Unk07)
	call UpdateObjSprite
:
ENDR
	ret
; 0x61760

DoObjectAction: ; 61760 (18:5760)
	ld a, [wCurObjAction]
	and a
	ret z
	bit 7, a
	jr z, .jump
	dec a
	cp $80
	jr nz, .asm_6176f
	xor a
.asm_6176f
	ld [wCurObjAction], a
	ret

.jump
	jumptable

	dw .None ; OBJACTION_NONE
	dw .Bump ; OBJACTION_BUMP
	dw .Attack ; OBJACTION_ATTACK
	dw .PickUp ; OBJACTION_PICK_UP
	dw .Wobble ; OBJACTION_WOBBLE
	dw .VanishTouch ; OBJACTION_VANISH_TOUCH
	dw .Action06 ; OBJACTION_06
	dw .Action07 ; OBJACTION_07
	dw VanishObject_NoSFX ; OBJACTION_VANISH_TREASURE
	dw .StepOn ; OBJACTION_STEP_ON
	dw .Action0a ; OBJACTION_0A
	dw .Flatten ; OBJACTION_FLATTEN
	dw .Action0c ; OBJACTION_0C
	dw .Action0d ; OBJACTION_0D
	dw .Action0e ; OBJACTION_0E
	dw .SmashAttackWalkable ; OBJ_ACTION_SMASH_ATTACK_WALKABLE
	dw .Teleport ; OBJ_ACTION_TELEPORT
	dw .Action11 ; OBJACTION_11
	dw .Action12 ; OBJACTION_12
	dw .Func_6179c ; OBJACTION_13

.Func_6179c:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_SPECIAL_3
	ld [hl], a ; OBJ_STATE
	ret

.None:
	ret

.Bump:
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .Wobble
	ld hl, wCurObjUnk1d
	ld a, [hld]
	and INTERACTION_RIGHT
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .bump_right
	ld a, OBJSTATE_BUMP_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.bump_right
	ld a, OBJSTATE_BUMP_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.Attack:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UNK_1D
	ld a, [hld]
	and INTERACTION_RIGHT
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .attack_right
	ld a, OBJSTATE_ATTACKED_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.attack_right
	ld a, OBJSTATE_ATTACKED_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.PickUp:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, [wDirection]
	and a
	ld l, OBJ_ACTION
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .pick_up_right
	ld a, OBJSTATE_PICKED_UP_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.pick_up_right
	ld a, OBJSTATE_PICKED_UP_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.Wobble:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_UNK_1D
	ld a, [hld]
	and INTERACTION_RIGHT
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .wobble_right
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.wobble_right
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.VanishTouch:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_ACTION
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_VANISH_TOUCH
	ld [hl], a
	ret

.Action12:
	ld b, 7 | (1 << 7)
	jr .asm_6181f
.Action06:
	ld b, 15 | (1 << 7)
.asm_6181f
	ld hl, wCurObjUnk1d
	ld a, [hld]
	ld [hl], b ; OBJ_ACTION
	dec l
	rla
	jr nc, .check_interaction_up
; interaction down
	ld a, OBJSTATE_0E
	ld [hl], a ; OBJ_STATE
	ret
.check_interaction_up
	rla
	jr nc, .check_interaction_right
	ld a, OBJSTATE_0D
	ld [hl], a ; OBJ_STATE
	ret
.check_interaction_right
	rla
	jr nc, .interaction_left
	ld a, OBJSTATE_0B
	ld [hl], a ; OBJ_STATE
	ret
.interaction_left
	ld a, OBJSTATE_0C
	ld [hl], a ; OBJ_STATE
	ret

.Action07:
	ld hl, wCurObjAction
	xor a
	ld [hld], a
	ld a, OBJSTATE_18
	ld [hl], a ; OBJ_STATE
	ret

.StepOn:
	ld hl, wCurObjAction
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_STEPPED_F, [hl]
	ret

.Action0a:
	ld a, 15 | (1 << 7)
	ld [wCurObjAction], a
	ret

.Flatten:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a ; OBJ_STATE
	ret

.Action0c:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

.Action0d:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_19
	ld [hl], a
	ret

.Action0e:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

.SmashAttackWalkable:
	ld hl, wCurObjAction
	ld a, 2 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_VANISH_TOUCH
	ld [hl], a
	ret

.Teleport:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

.Action11:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret
; 0x6189d

_VanishObject:: ; 6189d (18:589d)
	play_sfx SFX_VANISH
VanishObject_NoSFX: ; 618a5 (18:58a5)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(VanishStarsFunc)
	ld [hld], a
	ld a, LOW(VanishStarsFunc)
	ld [hld], a
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	ld [hld], a
Func_618b4: ; 618b4 (18:58b4)
	ld a, (BANK(VanishStarsFunc) - BANK("Object Update Functions 1")) << 4
	ld [wCurObjUnk07], a

	ld hl, wCurObjOAMPtr
	ld a, LOW(OAM_18c000)
	ld [hli], a ; OBJ_OAM_PTR
	ld a, HIGH(OAM_18c000)
	ld [hli], a
	ld a, LOW(Frameset_680c5)
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, HIGH(Frameset_680c5)
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ld a, 33
	ld [hli], a ; OBJ_STATE_DURATION

	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a

	ld l, OBJ_Y_POS
	ld a, [hl]
	sub 8
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x618e2

; handles the grabbed object collision
; with other objects
HandleGrabbedObjectCollisions: ; 618e2 (18:58e2)
	ld hl, wObj1Flags
	ld e, OBJFLAG_UNK0 | OBJFLAG_GRABBED
	ld a, [hl]
	and e
	cp e
FOR n, 2, NUM_OBJECTS + 1
	jr z, .got_grabbed_obj
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	and e
	cp e
ENDR
	ret nz

.got_grabbed_obj
	push hl
	ld a, l
	add OBJ_INTERACTION_TYPE - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ldh [hffa0], a
	ld a, [hli] ; OBJ_COLLBOX_TOP
	ld b, a
	ld a, [hli] ; OBJ_COLLBOX_BOTTOM
	ld c, a
	ld a, [hli] ; OBJ_COLLBOX_LEFT
	ld d, a
	ld a, [hli] ; OBJ_COLLBOX_RIGHT
	ld e, a
	ld a, [hl] ; OBJ_SCREEN_Y_POS
	add $2a
	add b
	ld b, a
	ld a, [hli] ; OBJ_SCREEN_Y_POS
	add $2a
	add c
	ld c, a
	ld a, [hl] ; OBJ_SCREEN_X_POS
	add $2a
	add d
	ld d, a
	ld a, [hli] ; OBJ_SCREEN_X_POS
	add $2a
	add e
	ld e, a

; b = collision top    + (screen y + $2a)
; c = collision bottom + (screen y + $2a)
; d = collision left   + (screen x + $2a)
; e = collision right  + (screen x + $2a)

	ld a, l
	add OBJ_STATE - (OBJ_SCREEN_X_POS + 1)
	ld l, a
	ld a, [hl] ; OBJ_STATE
	cp OBJSTATE_FULL_THROW_LEFT_START
	jr nc, .full_throw
	cp OBJSTATE_48
	jr nc, .asm_61992

.full_throw
	; >= OBJSTATE_FULL_THROW_LEFT_START
	rra
	ld hl, hffa0
	ld a, [hli]
	jr c, .thrown_right

; thrown left
	rla
	jr c, .is_heavy1
	ld a, OBJSTATE_28
	ld [hli], a ; hffa1
	ld a, OBJSTATE_29
	ld [hli], a ; hffa2
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hffa3
	ld a, OBJSTATE_29
	ld [hli], a ; hffa4
	jr .check_objs

.is_heavy1
	ld a, OBJSTATE_28
	ld [hli], a ; hffa1
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; hffa2
	ld a, OBJSTATE_28
	ld [hli], a ; hffa3
	ld a, OBJSTATE_29
	ld [hli], a ; hffa4
	jr .check_objs

.thrown_right
	rla
	jr c, .is_heavy2
	ld a, OBJSTATE_29
	ld [hli], a ; ; hffa1
	ld a, OBJSTATE_28
	ld [hli], a ; ; hffa2
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; ; hffa3
	ld a, OBJSTATE_28
	ld [hli], a ; ; hffa4
	jr .check_objs

.is_heavy2
	ld a, OBJSTATE_29
	ld [hli], a ; hffa1
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hffa2
	ld a, OBJSTATE_29
	ld [hli], a ; hffa3
	ld a, OBJSTATE_28
	ld [hli], a ; hffa4
	jr .check_objs

.asm_61992
	; OBJSTATE_48 <= action <= OBJSTATE_4B
	rra
	ld hl, hffa1
	jr c, .asm_619a0
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hffa1
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; hffa2
	jr .check_objs

.asm_619a0
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; hffa1
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hffa2

.check_objs

FOR n, 1, NUM_OBJECTS + 1
	ld a, [wObj{u:n}Flags]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_GRABBED | OBJFLAG_UNK3 | OBJFLAG_UNK4
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .next_obj_{u:n}
	ld a, [wObj{u:n}ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj{u:n}ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj{u:n}CollBoxBottom]
	add h
	sub b
	jr c, .next_obj_{u:n}
	ld a, [wObj{u:n}CollBoxTop]
	add h
	sub c
	jr nc, .next_obj_{u:n}
	ld a, [wObj{u:n}CollBoxRight]
	add l
	sub d
	jr c, .next_obj_{u:n}
	ld a, [wObj{u:n}CollBoxLeft]
	add l
	sub e
	jr nc, .next_obj_{u:n}
	pop hl

; do collision
	res OBJFLAG_GRABBED_F, [hl]
	ld a, l
	add OBJ_STATE - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_STATE
	and $fe
	cp OBJSTATE_4A ; or OBJSTATE_4B
	jp z, .CollideWithObject{u:n}
	cp OBJSTATE_48 ; or OBJSTATE_49
	jp z, .CollideWithObject{u:n}
	ld a, [wObj{u:n}InteractionType]
	rla
	jp c, .CollideWithHeavyObject{u:n} ; heavy

	ldh a, [hffa2]
	ld [hl], a ; OBJ_STATE
	ld l, LOW(wObj{u:n}State)
	ld a, [hl]
	and $fe
	cp OBJSTATE_PICKED_UP_LEFT
	jr z, .reset_grab_{u:n}_1
	cp OBJSTATE_48
	jr nz, .skip_reset_grab_{u:n}_1
.reset_grab_{u:n}_1
	xor a
	ld [wGrabState], a
.skip_reset_grab_{u:n}_1
	ldh a, [hffa1]
	ld [hl], a ; OBJ_STATE
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_UNK3_F, [hl]
	play_sfx SFX_016
	ret
.next_obj_{u:n}
ENDR
	pop hl
	ret

FOR n, 1, NUM_OBJECTS + 1
; hl = state of thrown object
; hffa2 = new state for thrown object
; n = index of collided object
; hffa1 = new state for collided object
.CollideWithObject{u:n}
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a ; OBJ_STATE
	ld l, LOW(wObj{u:n}State)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_UNK3_F, [hl]
	play_sfx SFX_016
	ret
ENDR

FOR n, 1, NUM_OBJECTS + 1
; hl = state of thrown object
; hffa4 = new state for thrown object
; n = index of collided object
; hffa3 = new state for collided object
.CollideWithHeavyObject{u:n}
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj{u:n}State)
	ld a, [hl]
	and $fe
	cp OBJSTATE_PICKED_UP_LEFT
	jr z, .reset_grab_{u:n}_2
	cp OBJSTATE_48
	jr nz, .skip_reset_grab_{u:n}_2
.reset_grab_{u:n}_2
	xor a
	ld [wGrabState], a
.skip_reset_grab_{u:n}_2
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_UNK3_F, [hl]
	play_sfx SFX_016
	ret
ENDR
; 0x61f10

Func_61f10: ; 61f10 (18:5f10)
	xor a
	call Func_61f41 ; clears whole wObjects
	call Func_61f4a ; clears whole w1d120
	ld [w1d140], a
	ld [w1d141], a
	ld [w1d142], a
	ld [wNumLitTorches], a
	ld [wNumShootGoals], a
	ld [w1d145], a
	ret
; 0x61f2a

Func_61f2a: ; 61f2a (18:5f2a)
	xor a
	call Func_61f41 ; clears whole wObjects
	call Func_61f4a ; clears whole w1d120
	ld [w1d141], a
	ld [w1d142], a
	ld [wNumLitTorches], a
	ld [wNumShootGoals], a
	ld [w1d145], a
	ret
; 0x61f41

Func_61f41: ; 61f41 (18:5f41)
	ld hl, wObjects
	ld c, a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 0x61f4a

Func_61f4a: ; 61f4a (18:5f4a)
	ld hl, w1d120
	ld c, $20
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 0x61f54

Func_61f54:: ; 61f54 (18:5f54)
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a

	ld a, [wGrabState]
	and GRAB_STATE_MASK
	cp GRAB_PICK_UP
	jp z, .PickUp
	cp GRAB_IDLE
	jr z, .GrabIdle
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a ; *4
	ld e, a
	ld a, 30
	sub e
	ld e, a ; = 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub e
	ld [hli], a ; y
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	add 7
	ld [hli], a ; x
	ld a, [wXPosHi]
	adc 0
	ld [hl], a

	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_61fd9
	ld a, [wc1ca]
	and a
	jr nz, .asm_61fd9
	ld hl, wCurObjYPos
	ld a, [hl] ; y
	add 16
	ld [hli], a
	jr nc, .drop_obj
	inc [hl]

.drop_obj
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjUnk18], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_14
	ld [hld], a ; OBJ_STATE
	jp HomeJumpRet

.asm_61fd9
	ld a, OBJSTATE_19
	ld [wCurObjState], a
	jp HomeJumpRet

.PickUp
	ld hl, wCurObjUnk17
	dec [hl]
	jp nz, HomeJumpRet
	inc l
	ld a, [hli] ; OBJ_UNK_18
	ld h, [hl] ; OBJ_MOVEMENT_INDEX
	ld l, a
	ld a, [hli]
	and a
	jr nz, .asm_61ff5
	dec l
	dec l
	dec l
	dec l
	ld a, [hli]
.asm_61ff5
	ld [wCurObjUnk17], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wCurObjUnk18], a
	ld a, h
	ld [wCurObjMovementIndex], a

	ld hl, hffa0
	ld a, c
	cp $80
	ld a, [wYPosLo]
	jr nc, .negative_y
	add c
	ld [hli], a
	ld a, [wYPosHi]
	jr nc, .got_hi_y
	inc a
	jr .got_hi_y
.negative_y
	add c
	ld [hli], a
	ld a, [wYPosHi]
	jr c, .got_hi_y
	dec a
.got_hi_y
	ld [hl], a
	inc l

	ld a, b
	cp $80
	ld a, [wXPosLo]
	jr nc, .negative_x
	add b
	ld [hli], a
	ld a, [wXPosHi]
	jr nc, .got_hi_x
	inc a
	jr .got_hi_x
.negative_x
	add b
	ld [hli], a
	ld a, [wXPosHi]
	jr c, .got_hi_x
	dec a
.got_hi_x
	ld [hl], a

	ld hl, hffa0
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a

	call Func_3513
	and $0f
	jr nz, .asm_62091
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, hffa0
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a

	call Func_358b
	and $0f
	jr nz, .asm_62091
	ld hl, hffa0
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet

.asm_62091
	ld a, [wCurObjInteractionType]
	and HEAVY_OBJ
	jp nz, .drop_obj
	or GRAB_UNK_02
	ld [wGrabState], a
	ld a, OBJSTATE_19
	ld [wCurObjState], a
	jp HomeJumpRet
; 0x620a6

Func_620a6:: ; 620a6 (18:60a6)
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a

	ld a, [wGrabState]
	and GRAB_STATE_MASK
	cp GRAB_PICK_UP
	jp z, .PickUp
	cp GRAB_IDLE
	jr z, .GrabIdle
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a ; *4
	ld e, a
	ld a, 30
	sub e
	ld e, a ; = 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub e
	ld [hli], a ; y
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	sub 7
	ld [hli], a ; x
	ld a, [wXPosHi]
	sbc 0
	ld [hl], a

	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_6212b
	ld a, [wc1ca]
	and a
	jr nz, .asm_6212b
	ld hl, wCurObjYPos
	ld a, [hl] ; y
	add 16
	ld [hli], a
	jr nc, .drop_obj
	inc [hl]

.drop_obj
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjUnk18], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_15
	ld [hld], a ; OBJ_STATE
	jp HomeJumpRet

.asm_6212b
	ld a, OBJSTATE_18
	ld [wCurObjState], a
	jp HomeJumpRet

.PickUp
	ld hl, wCurObjUnk17
	dec [hl]
	jp nz, HomeJumpRet
	inc l
	ld a, [hli] ; OBJ_UNK_18
	ld h, [hl] ; OBJ_MOVEMENT_INDEX
	ld l, a
	ld a, [hli]
	and a
	jr nz, .asm_62147
	dec l
	dec l
	dec l
	dec l
	ld a, [hli]
.asm_62147
	ld [wCurObjUnk17], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wCurObjUnk18], a
	ld a, h
	ld [wCurObjMovementIndex], a

	ld hl, hffa0
	ld a, c
	cp $80
	ld a, [wYPosLo]
	jr nc, .negative_y
	add c
	ld [hli], a
	ld a, [wYPosHi]
	jr nc, .got_hi_y
	inc a
	jr .got_hi_y
.negative_y
	add c
	ld [hli], a
	ld a, [wYPosHi]
	jr c, .got_hi_y
	dec a
.got_hi_y
	ld [hl], a
	inc l

	ld a, b
	cp $80
	ld a, [wXPosLo]
	jr nc, .negative_x
	add b
	ld [hli], a
	ld a, [wXPosHi]
	jr nc, .got_hi_x
	inc a
	jr .got_hi_x
.negative_x
	add b
	ld [hli], a
	ld a, [wXPosHi]
	jr c, .got_hi_x
	dec a
.got_hi_x
	ld [hl], a

	ld hl, hffa0
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a

	call Func_3513
	and $0f
	jr nz, .asm_621e6
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, hffa0
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a

	call Func_358b
	and $0f
	jr nz, .asm_621e6
	ld hl, hffa0
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet

.asm_621e6
	ld a, [wCurObjInteractionType]
	and HEAVY_OBJ
	jp nz, .drop_obj
	or GRAB_UNK_02
	ld [wGrabState], a
	ld a, OBJSTATE_18
	ld [wCurObjState], a
	jp HomeJumpRet
; 0x621fb

Func_621fb:: ; 621fb (18:61fb)
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_IDLE
	jr z, .GrabIdle
	cp GRAB_CHARGE_THROW
	jr z, .GrabChargeThrow
	cp GRAB_THROW
	jp z, ThrowObject_Right

	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wIsCrouching]
	and a
	jr z, .not_crouching
; crouching
	ld a, $01
	ld [wCurObjUnk18], a
	ld a, OBJSTATE_15
	ld [hl], a
	jp HomeJumpRet

.not_crouching
	ld a, OBJSTATE_12
	ld [hl], a
	jp HomeJumpRet

.GrabChargeThrow
	ld a, OBJSTATE_4B
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a ; 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub e
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	add 7
	ld [hli], a
	ld a, [wXPosHi]
	adc 0
	ld [hl], a
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_6229c

	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, HomeJumpRet

.asm_6229c
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjUnk18], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_14
	ld [hl], a ; OBJ_STATE
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	jp HomeJumpRet
; 0x622bd

Func_622bd:: ; 622bd (18:62bd)
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_IDLE
	jr z, .GrabIdle
	cp GRAB_CHARGE_THROW
	jr z, .GrabChargeThrow
	cp GRAB_THROW
	jp z, ThrowObject_Left

	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wIsCrouching]
	and a
	jr z, .not_crouching
; crouching
	ld a, $01
	ld [wCurObjUnk18], a
	ld a, OBJSTATE_14
	ld [hl], a
	jp HomeJumpRet

.not_crouching
	ld a, OBJSTATE_12
	ld [hl], a
	jp HomeJumpRet

.GrabChargeThrow
	ld a, OBJSTATE_4A
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a ; 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub e
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	sub 7
	ld [hli], a
	ld a, [wXPosHi]
	sbc 0
	ld [hl], a
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and a
	jr nz, .asm_62361
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, HomeJumpRet

.asm_62361
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjUnk18], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_15
	ld [hl], a ; OBJ_STATE
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	jp HomeJumpRet
; 0x62382

Func_62382:: ; 62382 (18:6382)
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_CHARGE_THROW
	jr z, .ChargeThrow
	cp GRAB_THROW_FULLY_CHARGED
	jr z, .ChargeThrow
	cp GRAB_HOLD_FULL_CHARGE
	jr z, .HoldFullCharge
	cp GRAB_THROW
	jp z, ThrowObject_Left

.asm_6239e
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.ChargeThrow
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub e
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	sub 7
	ld [hli], a
	ld a, [wXPosHi]
	sbc 0
	ld [hl], a
	jp HomeJumpRet

.HoldFullCharge
	ld hl, hffa0
	ld a, [wYPosLo]
	sub 30
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	add 5
	ld [hli], a
	ld a, [wXPosHi]
	adc 0
	ld [hli], a
	ld hl, hffa0
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr z, .asm_62415
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	jr .asm_6239e

.asm_62415
	ld hl, hffa0
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet
; 0x62429

ThrowObject_Left: ; 62429 (18:6429)
	play_sfx SFX_THROW
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hl], a
	rla
	ld l, OBJ_STATE_DURATION
	ld a, 0
	ld [hli], a
	inc l
	bit 6, b
	jr nz, .asm_62462
	ld b, $03
	jr nc, .asm_6244b
	ld b, $02
.asm_6244b
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_62454
	ld b, $01
.asm_62454
	ld a, b
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	inc l
	ld a, OBJSTATE_4E
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet

.asm_62462
	ld b, $04
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_6246d
	ld b, $01
.asm_6246d
	ld a, b
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	inc l
	ld a, OBJSTATE_FULL_THROW_LEFT_START
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet
; 0x6247b

Func_6247b:: ; 6247b (18:647b)
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_CHARGE_THROW
	jr z, .ChargeThrow
	cp GRAB_THROW_FULLY_CHARGED
	jr z, .ChargeThrow
	cp GRAB_HOLD_FULL_CHARGE
	jr z, .HoldFullCharge
	cp GRAB_THROW
	jp z, ThrowObject_Right

.asm_62497
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.ChargeThrow
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a
	ld hl, wCurObjYPos
	ld a, [wYPosLo]
	sub e
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	add 7
	ld [hli], a
	ld a, [wXPosHi]
	adc 0
	ld [hl], a
	jp HomeJumpRet

.HoldFullCharge
	ld hl, hffa0
	ld a, [wYPosLo]
	sub 30
	ld [hli], a
	ld a, [wYPosHi]
	sbc 0
	ld [hli], a
	ld a, [wXPosLo]
	sub 5
	ld [hli], a
	ld a, [wXPosHi]
	sbc 0
	ld [hli], a
	ld hl, hffa0
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr z, .asm_6250e
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	jr .asm_62497

.asm_6250e
	ld hl, hffa0
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet
; 0x62522

ThrowObject_Right: ; 62522 (18:6522)
	play_sfx SFX_THROW
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hl], a
	rla
	ld l, OBJ_STATE_DURATION
	ld a, 0
	ld [hli], a
	inc l
	bit 6, b
	jr nz, .asm_6255b
	ld b, $03
	jr nc, .asm_62544
	ld b, $02
.asm_62544
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_6254d
	ld b, $01
.asm_6254d
	ld a, b
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	inc l
	ld a, OBJSTATE_4F
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet

.asm_6255b
	ld b, $04
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_62566
	ld b, $01
.asm_62566
	ld a, b
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	inc l
	ld a, OBJSTATE_FULL_THROW_RIGHT_START
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet
; 0x62574

Func_62574:: ; 62574 (18:6574)
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .asm_625aa
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a
	ld [wc1ca], a
	inc a
	ld [wc0d9], a
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62d34
	ld a, [wc0dd]
	and a
	jr z, .asm_625aa
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_625aa
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_358b
	and a
	jr nz, .asm_625f7
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_3513
	and $0f
	jr z, .asm_625ff
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_625f7
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_625ff
	call Func_305c
	jp Func_62690
; 0x62605

Func_62605:: ; 62605 (18:6605)
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .asm_6263b
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a
	ld [wc1ca], a
	inc a
	ld [wc0d9], a
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62e0f
	ld a, [wc0dd]
	and a
	jr z, .asm_6263b
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_6263b
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_358b
	and a
	jr nz, .asm_62685
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_3513
	and $0f
	jr z, .asm_6268d
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62685
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_6268d
	call Func_3069
;	fallthrough

Func_62690: ; 62690 (18:6690)
	ld l, OBJ_MOVEMENT_INDEX
	ld a, [hl]
	dec b
	jr z, .asm_626d4
	ld b, HIGH(Data_60080)
	add LOW(Data_60080)
.asm_6269a
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_600a0 - Data_60080
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_626ae
	dec c
	ld a, [bc]
	jr .asm_626af
.asm_626ae
	inc [hl]
.asm_626af
	ldh [hffa0], a
	and a
	jr z, .asm_626d1
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_626c7
	add c
	ld [hli], a
	ld a, 1
	ld [wCurObjStateDuration], a
	jr nc, .asm_626d1
	inc [hl]
	jr .asm_626d1

.asm_626c7
	add c
	ld [hli], a
	ld a, 0
	ld [wCurObjStateDuration], a
	jr c, .asm_626d1
	dec [hl]
.asm_626d1
	jp HomeJumpRet

.asm_626d4
	ld b, HIGH(Data_60100)
	add LOW(Data_60100)
	jr .asm_6269a
; 0x626da

Func_626da:: ; 626da (18:66da)
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .asm_62710
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a
	ld [wc1ca], a
	inc a
	ld [wc0d9], a
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62d34
	ld a, [wc0dd]
	and a
	jr z, .asm_62710
.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62710
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_358b
	and a
	jr nz, .vanish
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_3513
	and $0f
	jr nz, .vanish
	call Func_305c
	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62765
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62765
	jp Func_627f0
; 0x62768

Func_62768:: ; 62768 (18:6768)
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .asm_6279e
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a
	ld [wc1ca], a
	inc a
	ld [wc0d9], a
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62e0f
	ld a, [wc0dd]
	and a
	jr z, .asm_6279e
.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_6279e
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_358b
	and a
	jr nz, .vanish
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	ld a, $01
	ld [wc0d9], a
	call Func_3513
	and $0f
	jr nz, .vanish
	call Func_3069
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, Func_627f0
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
;	fallthrough

Func_627f0: ; 627f0 (18:67f0)
	ld l, OBJ_MOVEMENT_INDEX
	ld a, [hl]
	dec b
	jr z, .asm_62834
	ld b, $40
	add $c0
.asm_627fa
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $20
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_6280e
	dec c
	ld a, [bc]
	jr .asm_6280f
.asm_6280e
	inc [hl]
.asm_6280f
	ldh [hffa0], a
	and a
	jr z, .asm_62831
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ld a, $01
	ld [wCurObjStateDuration], a
	jr nc, .asm_62831
	inc [hl]
	jr .asm_62831
.negative
	add c
	ld [hli], a
	ld a, $00
	ld [wCurObjStateDuration], a
	jr c, .asm_62831
	dec [hl]
.asm_62831
	jp HomeJumpRet

.asm_62834
	ld b, $41
	add $40
	jr .asm_627fa
; 0x6283a

Func_6283a:: ; 6283a (18:683a)
	ld a, [wCurObjUnk18]
	ld b, a
	jr Func_6284f

Func_62840:: ; 62840 (18:6840)
	ld a, [wCurObjUnk18]
	ld b, a
	ld a, [wEffectivePowerUp]
	cp POWER_UP_GARLIC
	jr c, Func_6284f
	sla b
	sla b ; *4
;	fallthrough

Func_6284f: ; 6284f (18:684f)
	ld hl, wCurObjXPos
	ld a, [hl]
	add b
	ld [hli], a
	jr nc, .no_overflow
	inc [hl]
.no_overflow
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(Data_60180)
	add LOW(Data_60180)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_601a0 - Data_60180
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62874
	dec c
	ld a, [bc]
	jr .asm_62875
.asm_62874
	inc [hl]
.asm_62875
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .asm_6288a
	inc [hl]
	jr .asm_6288a
.negative
	add c
	ld [hli], a
	jr c, .asm_6288a
	dec [hl]
.asm_6288a
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	jp HomeJumpRet
; 0x62892

Func_62892:: ; 62892 (18:6892)
	ld a, [wCurObjUnk18]
	ld b, a
	jr Func_628a7

Func_62898:: ; 62898 (18:6898)
	ld a, [wCurObjUnk18]
	ld b, a
	ld a, [wEffectivePowerUp]
	cp POWER_UP_GARLIC
	jr c, Func_628a7
	sla b
	sla b
;	fallthrough

Func_628a7: ; 628a7 (18:68a7)
	ld hl, wCurObjXPos
	ld a, [hl]
	sub b
	ld [hli], a
	jr nc, .asm_628b0
	dec [hl]
.asm_628b0
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(Data_60180)
	add LOW(Data_60180)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_601a0 - Data_60180
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_628cc
	dec c
	ld a, [bc]
	jr .asm_628cd
.asm_628cc
	inc [hl]
.asm_628cd
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .asm_628e2
	inc [hl]
	jr .asm_628e2
.negative
	add c
	ld [hli], a
	jr c, .asm_628e2
	dec [hl]
.asm_628e2
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	jp HomeJumpRet
; 0x628ea

Func_628ea:: ; 628ea (18:68ea)
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	jp nz, HomeJumpRet
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet
; 0x62908

Func_62908:: ; 62908 (18:6908)
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	jp nz, HomeJumpRet
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	jp HomeJumpRet
; 0x62926

Func_62926:: ; 62926 (18:6926)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(Data_60040)
	add LOW(Data_60040)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_60060 - Data_60040
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62942
	dec c
	ld a, [bc]
	jr .asm_62943
.asm_62942
	inc [hl]
.asm_62943
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .asm_62958
	inc [hl]
	jr .asm_62958
.negative
	add c
	ld [hli], a
	jr c, .asm_62958
	dec [hl]
.asm_62958
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_62980
	ld a, [wc0dd]
	and a
	jp z, HomeJumpRet
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62980
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, [wc18c]
	and a
	jr nz, .asm_62997
	ld a, OBJSTATE_0F
	ld [hl], a
	jp HomeJumpRet

.asm_62997
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x629a6

Func_629a6:: ; 629a6 (18:69a6)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(Data_602a0)
	add LOW(Data_602a0)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_602b0 - Data_602a0
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_629c2
	dec c
	ld a, [bc]
	jr .asm_629c3
.asm_629c2
	inc [hl] ; OBJ_MOVEMENT_INDEX
.asm_629c3
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_629cd
	dec [hl]
.asm_629cd
	jp HomeJumpRet
; 0x629d0

_ObjState_StandingFall:: ; 629d0 (18:69d0)
; speed up animation by 3x
	ld hl, wCurObjFrameDuration
	ld a, [hl]
	cp 3
	jr c, .done_anim_speedup
	sub 3
	ld [hl], a

.done_anim_speedup
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(StandingFallYVel_Light)
	add LOW(StandingFallYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add StandingFallYVel_Heavy - StandingFallYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc] ; use last entry
	jr .got_y_vel
.not_last
	inc [hl] ; OBJ_MOVEMENT_INDEX
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
; positive
	add c
	ld [hli], a
	jr nc, .done_y_vel
	inc [hl]
	jr .done_y_vel
.negative
	add c
	ld [hli], a
	jr c, .done_y_vel
	dec [hl]

.done_y_vel
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_62a35
	ld a, [wc0dd]
	and a
	jp z, HomeJumpRet
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62a35
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, [wc18c]
	and a
	jr nz, .asm_62a4c
	ld a, OBJSTATE_TURN_AROUND_START
	ld [hl], a
	jp HomeJumpRet

.asm_62a4c
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x62a5b

; handle gravity for falling objects
_ObjState_Fall:: ; 62a5b (18:6a5b)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add FallingYVel_Heavy - FallingYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .incr_index
	dec c ; use last entry
	ld a, [bc]
	jr .got_y_vel
.incr_index
	inc [hl]
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .no_carry
	inc [hl]
.no_carry
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a

	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .land
	ld a, [wc0dd]
	and a
	jp z, HomeJumpRet
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.land
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, [wc18c]
	and a
	jr nz, .asm_62ac1
	ld a, OBJSTATE_LAND
	ld [hl], a
	jp HomeJumpRet

.asm_62ac1
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x62ad0

_ObjState_BumpRight:: ; 62ad0 (18:6ad0)
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jr nz, Func_62ae5
	dec l
	dec l
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, HomeJumpRet
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62ae5:: ; 62ae5 (18:6ae5)
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp nz, .asm_62b70
	call Func_305c
	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62b19
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]

.asm_62b19
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_3543
	cp $10

	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	jr z, .asm_62b9b
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62b7d
	ld hl, wCurObjXPos
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62b7d
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jr .asm_62b7d

.asm_62b70
	play_sfx SFX_01A
	ld a, OBJSTATE_STUN_RIGHT_START
	ld [wCurObjState], a

.asm_62b7d
	ld hl, wCurObjUnk18
	ld a, [wCurObjInteractionType]
	rla
	ld a, [wGlobalCounter]
	jr c, .heavy
	and %111
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet
.heavy
	and %11
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet

.asm_62b9b
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wc18c]
	rra
	jr nc, .asm_62bb3
	ld a, [hl]
	cp OBJSTATE_STUN_LEFT
	jp z, HomeJumpRet
	ld a, OBJSTATE_14
	ld [hl], a
	jp HomeJumpRet
.asm_62bb3
	ld a, OBJSTATE_STUN_RIGHT_START
	ld [hl], a
	jp HomeJumpRet
; 0x62bb9

_ObjState_BumpLeft:: ; 62bb9 (18:6bb9)
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jr nz, Func_62bce
	dec l
	dec l
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, HomeJumpRet
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62bce:: ; 62bce (18:6bce)
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp nz, .asm_62c56
	call Func_3069
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, .asm_62bff
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]

.asm_62bff
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_3543
	cp $10

	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	jr z, .asm_62c81
	ld hl, wCurObjXPos
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62c63
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62c63
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jr .asm_62c63

.asm_62c56
	play_sfx SFX_01A
	ld a, OBJSTATE_STUN_LEFT_START
	ld [wCurObjState], a

.asm_62c63
	ld hl, wCurObjUnk18
	ld a, [wCurObjInteractionType]
	rla
	ld a, [wGlobalCounter]
	jr c, .heavy
	and %111
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet
.heavy
	and %11
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet

.asm_62c81
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wc18c]
	rra
	jr c, .asm_62c99
	ld a, [hl]
	cp OBJSTATE_STUN_RIGHT
	jp z, HomeJumpRet
	ld a, OBJSTATE_15
	ld [hl], a
	jp HomeJumpRet
.asm_62c99
	ld a, OBJSTATE_STUN_LEFT_START
	ld [hl], a
	jp HomeJumpRet
; 0x62c9f

Func_62c9f:: ; 62c9f (18:6c9f)
	ld hl, wCurObjState
	ld a, OBJSTATE_56
	ld [hld], a
	dec l
	xor a
	ld [hld], a
;	fallthrough

Func_62ca8:: ; 62ca8 (18:6ca8)
	call Func_305c
	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62cb8
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62cb8
	ld l, OBJ_MOVEMENT_INDEX
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add FallingYVel_Heavy - FallingYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc]
	jr .got_y_vel
.not_last
	inc [hl]
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .no_cap
	inc [hl]
.no_cap
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	ld [wc1ca], a
	call Func_352b
	and a
	jr nz, Func_62d34
	ld a, [wc0dd]
	and a
	jr nz, .vanish

	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, HomeJumpRet
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jp HomeJumpRet

.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62d34: ; 62d34 (18:6d34)
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, [wc18c]
	and $0f
	cp $01
	jr z, .asm_62d55
	ld l, OBJ_UNK_18
	cp $02
	jr nz, .asm_62d50
	dec a
	ld [hl], a
	jr .asm_62d55
.asm_62d50
	ld a, [hl]
	and a
	jr z, .asm_62d55
	dec [hl]
.asm_62d55
	ld l, OBJ_STATE
;	fallthrough

; hl = OBJ_STATE
Func_62d57: ; 62d57 (18:6d57)
	ldh a, [hffa0] ; y vel
	cp 2
	jr c, .asm_62d6b
	cp 3
	jr c, .asm_62d71
	cp 4
	jr c, .asm_62d77
	ld a, OBJSTATE_24
	ld [hl], a
	jp HomeJumpRet
.asm_62d6b
	ld a, OBJSTATE_STUN_LEFT_START
	ld [hl], a
	jp HomeJumpRet
.asm_62d71
	ld a, OBJSTATE_20
	ld [hl], a
	jp HomeJumpRet
.asm_62d77
	ld a, OBJSTATE_22
	ld [hl], a
	jp HomeJumpRet
; 0x62d7d

Func_62d7d:: ; 62d7d (18:6d7d)
	ld hl, wCurObjState
	ld a, OBJSTATE_57
	ld [hld], a
	dec l
	xor a
	ld [hld], a
;	fallthrough

Func_62d86:: ; 62d86 (18:6d86)
	call Func_3069
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, .asm_62d96
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62d96
	ld l, OBJ_MOVEMENT_INDEX
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add FallingYVel_Heavy - FallingYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc]
	jr .got_y_vel
.not_last
	inc [hl]
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .no_cap
	inc [hl]
.no_cap
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	ld [wc1ca], a
	call Func_352b
	and a
	jr nz, Func_62e0f
	ld a, [wc0dd]
	and a
	jr nz, .vanish

	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, HomeJumpRet
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jp HomeJumpRet

.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62e0f: ; 62e0f (18:6e0f)
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, [wc18c]
	and $0f
	cp $02
	jr z, .asm_62e2f
	ld l, OBJ_UNK_18
	cp $01
	jr nz, .asm_62e2a
	ld [hl], a
	jr .asm_62e2f
.asm_62e2a
	ld a, [hl]
	and a
	jr z, .asm_62e2f
	dec [hl]
.asm_62e2f
	ld l, OBJ_STATE
;	fallthrough

; hl = OBJ_STATE
Func_62e31: ; 62e31 (18:6e31)
	ldh a, [hffa0] ; y vel
	cp 2
	jr c, .asm_62e45
	cp 3
	jr c, .asm_62e4b
	cp 4
	jr c, .asm_62e51
	ld a, OBJSTATE_25
	ld [hl], a
	jp HomeJumpRet
.asm_62e45
	ld a, OBJSTATE_STUN_RIGHT_START
	ld [hl], a
	jp HomeJumpRet
.asm_62e4b
	ld a, OBJSTATE_21
	ld [hl], a
	jp HomeJumpRet
.asm_62e51
	ld a, OBJSTATE_23
	ld [hl], a
	jp HomeJumpRet
; 0x62e57

Func_62e57:: ; 62e57 (18:6e57)
	play_sfx SFX_VANISH

	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(Func_4c860)
	ld [hld], a
	ld a, LOW(Func_4c860)
	ld [hld], a
	call Func_618b4
	jp HomeJumpRet
; 0x62e6e

_VanishObject2:: ; 62e6e (18:6e6e)
	call _VanishObject
	jp HomeJumpRet
; 0x62e74

Func_62e74:: ; 62e74 (18:6e74)
	ld hl, wCurObjState
	ld a, OBJSTATE_54
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, [wCurObjInteractionType]
	rla
	ld a, $06
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62e8a:: ; 62e8a (18:6e8a)
	ld bc, Data_60300
	jr Func_62ec3

Func_62e8f:: ; 62e8f (18:6e8f)
	ld hl, wCurObjState
	ld a, OBJSTATE_50
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, [wCurObjInteractionType]
	rla
	ld a, $04
	jr nc, .not_heavy
	ld a, $01
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62ea5:: ; 62ea5 (18:6ea5)
	ld bc, Data_602c0
	jr Func_62ec3

Func_62eaa:: ; 62eaa (18:6eaa)
	ld hl, wCurObjState
	ld a, OBJSTATE_52
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, [wCurObjInteractionType]
	rla
	ld a, $05
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62ec0:: ; 62ec0 (18:6ec0)
	ld bc, Data_602e0
;	fallthrough

Func_62ec3: ; 62ec3 (18:6ec3)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	add c
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $10
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62edc
	dec c
	ld a, [bc]
	jr .asm_62edd
.asm_62edc
	inc [hl]
.asm_62edd
	and a
	jr z, .asm_62ee8
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_62ee8
	dec [hl]
.asm_62ee8
	call Func_305c

	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62ef8
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62ef8
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_62f4e
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_62f4e
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, HomeJumpRet
	ld a, OBJSTATE_26
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_UNK3_F, [hl]
	jp HomeJumpRet

.asm_62f4e
	ld a, OBJSTATE_27
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_UNK3_F, [hl]
	jp HomeJumpRet
; 0x62f5b

Func_62f5b:: ; 62f5b (18:6f5b)
	ld hl, wCurObjState
	ld a, OBJSTATE_55
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, [wCurObjInteractionType]
	rla
	ld a, $06
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62f71:: ; 62f71 (18:6f71)
	ld bc, Data_60300
	jr Func_62faa

Func_62f76:: ; 62f76 (18:6f76)
	ld hl, wCurObjState
	ld a, OBJSTATE_51
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, [wCurObjInteractionType]
	rla
	ld a, $04
	jr nc, .not_heavy
	ld a, $01
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62f8c:: ; 62f8c (18:6f8c)
	ld bc, Data_602c0
	jr Func_62faa

Func_62f91:: ; 62f91 (18:6f91)
	ld hl, wCurObjState
	ld a, OBJSTATE_53
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, [wCurObjInteractionType]
	rla
	ld a, $05
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62fa7:: ; 62fa7 (18:6fa7)
	ld bc, Data_602e0
;	fallthrough

Func_62faa:: ; 62faa (18:6faa)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	add c
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $10
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62fc3
	dec c
	ld a, [bc]
	jr .asm_62fc4
.asm_62fc3
	inc [hl]
.asm_62fc4
	and a
	jr z, .asm_62fcf
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_62fcf
	dec [hl]
.asm_62fcf
	call Func_3069
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, .asm_62fdf
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62fdf
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_63032
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_63032
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, HomeJumpRet
	ld a, OBJSTATE_27
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_UNK3_F, [hl]
	jp HomeJumpRet

.asm_63032
	ld a, $26
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_UNK3_F, [hl]
	jp HomeJumpRet
; 0x6303f

Func_6303f:: ; 6303f (18:703f)
	ld hl, wCurObjState
	ld a, OBJSTATE_1B
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $07
	ld [wCurObjStateDuration], a
	jp HomeJumpRet
; 0x63050

Func_63050:: ; 63050 (18:7050)
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_629a6
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	jp HomeJumpRet
; 0x6305f

Func_6305f:: ; 6305f (18:705f)
	ldh a, [rDIV]
	rra
	jr c, .asm_63068
	ld a, OBJSTATE_WOBBLE_RIGHT
	jr .asm_6306a
.asm_63068
	ld a, OBJSTATE_WOBBLE_LEFT
.asm_6306a
	ld hl, wCurObjState
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $01
	ld [hld], a ; OBJ_UNK_18
	dec l
	ld a, $04
	ld [hli], a ; OBJ_STATE_DURATION
	jp HomeJumpRet
; 0x6307b

; seems to be a function to load/unload objects
; that are inside and outside the screen
Func_6307b: ; 6307b (18:707b)
	ld hl, wCurObjYPos
	ld a, [hli] ; y lo
	ld c, a
	ld a, [hli] ; y hi
	ld b, a
	ld a, [hli] ; x lo
	ld e, a
	ld d, [hl]  ; x hi

; bc = y pos
; de = x pos

	ld hl, wcac4
	ld a, [hli]
	ld l, [hl]
	ld h, a
	push bc
	push de
	push hl
	ld a, c
	add 24
	ld c, a
	jr nc, .no_overflow1
	inc b
	jr z, .skip_y1
.no_overflow1
	ld a, b
	cp h
	jr c, .asm_630fd
	jr nz, .skip_y1
	; b == h
	ld a, c
	cp l
	jr c, .asm_630fd
	jr z, .skip_y2
	; c > l

.skip_y1
	ld a, l
	add 144
	ld l, a
	jr nc, .no_overflow2
	inc h
.no_overflow2
	ld a, c
	sub 56
	ld c, a
	jr nc, .no_underflow1
	dec b
	ld a, b
	inc a
	jr z, .skip_y2
.no_underflow1
	ld a, b
	cp h
	jr c, .skip_y2
	jr nz, .asm_630fd
	ld a, c
	cp l
	jr nc, .asm_630fd

.skip_y2
	ld hl, wcac6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add 24
	ld e, a
	jr nc, .no_overflow3
	inc d
	jr z, .asm_630f6
.no_overflow3
	ld a, d
	cp h
	jr c, .asm_63106
	jr nz, .asm_630da
	ld a, e
	cp l
	jr c, .asm_63106
	jr z, .asm_630f6
.asm_630da
	ld a, l
	add $a0
	ld l, a
	jr nc, .asm_630e1
	inc h
.asm_630e1
	ld a, e
	sub $30
	ld e, a
	jr nc, .asm_630ec
	dec d
	ld a, d
	inc a
	jr z, .asm_630f6
.asm_630ec
	ld a, d
	cp h
	jr c, .asm_630f6
	jr nz, .asm_63106
	ld a, e
	cp l
	jr nc, .asm_63106
.asm_630f6
	ld hl, wCurObjFlags
	set OBJFLAG_UNK1_F, [hl]
	jr .asm_6310b

.asm_630fd
	ld a, [wCurObjState]
	and $fe
	cp OBJSTATE_48
	jr z, .asm_6310b
.asm_63106
	ld hl, wCurObjFlags
	res OBJFLAG_UNK1_F, [hl]
.asm_6310b
	pop hl
	pop de
	pop bc

	ld a, d
	rla
	jr c, .asm_6317e
	ld a, b
	rla
	jr c, .asm_6317e
	ld a, c
	add 92
	ld c, a
	jr nc, .asm_6311f
	inc b
	jr z, .asm_63147
.asm_6311f
	ld a, b
	cp h
	jr c, .asm_6317e
	jr nz, .asm_6312b
	ld a, c
	cp l
	jr c, .asm_6317e
	jr z, .asm_63147
.asm_6312b
	ld a, l
	add $90
	ld l, a
	jr nc, .asm_63132
	inc h
.asm_63132
	ld a, c
	sub $cb
	ld c, a
	jr nc, .asm_6313d
	dec b
	ld a, b
	inc a
	jr z, .asm_63147
.asm_6313d
	ld a, b
	cp h
	jr c, .asm_63147
	jr nz, .asm_6317e
	ld a, c
	cp l
	jr nc, .asm_6317e

.asm_63147
	ld hl, wcac6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add $6f
	ld e, a
	jr nc, .asm_63156
	inc d
	jr z, .done
.asm_63156
	ld a, d
	cp h
	jr c, .asm_6317e
	jr nz, .asm_63162
	ld a, e
	cp l
	jr c, .asm_6317e
	jr z, .done
.asm_63162
	ld a, l
	add $a0
	ld l, a
	jr nc, .asm_63169
	inc h
.asm_63169
	ld a, e
	sub $de
	ld e, a
	jr nc, .asm_63174
	dec d
	ld a, d
	inc a
	jr z, .done
.asm_63174
	ld a, d
	cp h
	jr c, .done
	jr nz, .asm_6317e
	ld a, e
	cp l
	jr c, .done
.asm_6317e
	ld a, [wCurObjUnk1a]
	and $1f
	cp $10
	ret nc
	ld hl, wCurObjUnk02
	and a
	jr z, .asm_6319c
	farcall Func_baee
	ret
.asm_6319c
	xor a
	ld [wCurObjFlags], a
.done
	ret
; 0x631a1

Func_631a1:: ; 631a1 (18:71a1)
	ld hl, wCurObjUnk17
	dec [hl]
	ret nz
	inc l
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and a
	jr nz, .asm_631b1
	ld h, d
	ld l, e
	ld a, [hli]
.asm_631b1
	ld [wCurObjUnk17], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wCurObjUnk18], a
	ld a, h
	ld [wCurObjMovementIndex], a
	ld hl, wCurObjYPos
	ld a, c
	cp $80
	jr nc, .asm_631d0
	ld a, [hl]
	add c
	ld [hli], a
	jr nc, .asm_631d6
	inc [hl]
	jr .asm_631d6
.asm_631d0
	ld a, [hl]
	add c
	ld [hli], a
	jr c, .asm_631d6
	dec [hl]
.asm_631d6
	inc l
	ld a, b
	cp $80
	jr nc, .asm_631e2
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_631e2
	ld a, [hl]
	add b
	ld [hli], a
	ret c
	dec [hl]
	ret
; 0x631e8

Func_631e8:: ; 631e8 (18:71e8)
	ld hl, wCurObjMovementIndex
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc]
	jr .got_y_vel
.not_last
	inc [hl]
.got_y_vel
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.negative
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret
; 0x63209

	INCROM $63209, $632ac

Func_632ac:: ; 632ac (18:72ac)
	ld hl, wCurObjUnk01
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld e, $00
	ld d, $41
	ld h, $d0
	ld l, $00
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632c8
	ld a, [hli]
	cp c
	jr nz, .asm_632c8
	ld a, [hl]
	cp b
	jr nz, .asm_632c8
	inc e
.asm_632c8
	ld l, $20
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632d8
	ld a, [hli]
	cp c
	jr nz, .asm_632d8
	ld a, [hl]
	cp b
	jr nz, .asm_632d8
	inc e
.asm_632d8
	ld l, $40
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632e8
	ld a, [hli]
	cp c
	jr nz, .asm_632e8
	ld a, [hl]
	cp b
	jr nz, .asm_632e8
	inc e
.asm_632e8
	ld l, $60
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632f8
	ld a, [hli]
	cp c
	jr nz, .asm_632f8
	ld a, [hl]
	cp b
	jr nz, .asm_632f8
	inc e
.asm_632f8
	ld l, $80
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63308
	ld a, [hli]
	cp c
	jr nz, .asm_63308
	ld a, [hl]
	cp b
	jr nz, .asm_63308
	inc e
.asm_63308
	ld l, $a0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63318
	ld a, [hli]
	cp c
	jr nz, .asm_63318
	ld a, [hl]
	cp b
	jr nz, .asm_63318
	inc e
.asm_63318
	ld l, $c0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63328
	ld a, [hli]
	cp c
	jr nz, .asm_63328
	ld a, [hl]
	cp b
	jr nz, .asm_63328
	inc e
.asm_63328
	ld l, $e0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63338
	ld a, [hli]
	cp c
	jr nz, .asm_63338
	ld a, [hl]
	cp b
	jr nz, .asm_63338
	inc e
.asm_63338
	ret
; 0x63339

	INCROM $63339, $6337e

DummyObjectFunc: ; 6337e (18:737e)
	xor a
	ld [wCurObjFlags], a
	ret
; 0x63383

	INCROM $63383, $63936