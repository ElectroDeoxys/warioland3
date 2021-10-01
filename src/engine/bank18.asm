Data_60000: ; 60000 (18:4000)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  1,  1,  1,  2,  2,  2,  3,  3,  4,  4,  4, $80
; 0x60020

Data_60020: ; 60020 (18:4020)
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

	INCROM $601c0, $60280

; y-offset values for falling light objects
Data_60280: ; 60280 (18:4280)
	db 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, $80
; 0x60290

; y-offset values for falling heavy objects
Data_60290: ; 60290 (18:4290)
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

	INCROM $60320, $611cb

Func_611cb: ; 611cb (18:51cb)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
	ld a, [hli]
	ld [wCurObjUnk01], a
	ld a, [hli]
	ld [wCurObjUnk02], a
	ld a, [hli]
	ld [wCurObjYPos], a
	ld a, [hli]
	ld [wCurObjYPos + 1], a
	ld a, [hli]
	ld [wCurObjXPos], a
	ld a, [hli]
	ld [wCurObjXPos + 1], a
	ld a, [hli]
	ld [wCurObjUnk07], a
	ld a, [hli]
	ld [wCurObjInteractionType], a
	ld a, [hli]
	ld [wCurObjUnk09], a
	ld a, [hli]
	ld [wCurObjUnk0a], a
	ld a, [hli]
	ld [wCurObjUnk0b], a
	ld a, [hli]
	ld [wCurObjUnk0c], a
	ld a, [hli]
	ld [wCurObjScreenYPos], a
	ld a, [hli]
	ld [wCurObjScreenXPos], a
	ld a, [hli]
	ld [wCurObjUnk0f], a
	ld a, [hli]
	ld [wCurObjUnk10 + 0], a
	ld a, [hli]
	ld [wCurObjUnk10 + 1], a
	ld a, [hli]
	ld [wCurObjUnk12 + 0], a
	ld a, [hli]
	ld [wCurObjUnk12 + 1], a
	ld a, [hli]
	ld [wCurObjUnk14 + 0], a
	ld a, [hli]
	ld [wCurObjUnk14 + 1], a
	ld a, [hli]
	ld [wCurObjUnk16], a
	ld a, [hli]
	ld [wCurObjUnk17], a
	ld a, [hli]
	ld [wCurObjUnk18], a
	ld a, [hli]
	ld [wCurObjUnk19], a
	ld a, [hli]
	ld [wCurObjUnk1a], a
	ld a, [hli]
	ld [wCurObjAction], a
	ld a, [hli]
	ld [wCurObjUnk1c], a
	ld a, [hli]
	ld [wCurObjUnk1d], a
	ld a, [hli]
	ld [wCurObjUpdateFunction], a
	ld a, [hl]
	ld [wCurObjUpdateFunction + 1], a
	call Func_61760

	farcall $13, wCurObjUpdateFunction

	call Func_312f
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wTempSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a

	ld hl, wc0bc
	ld a, [wc089]
	add [hl]
	ld [wTempSCY], a
	ld a, [wc08b]
	ld [wTempSCX], a
	pop hl

	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_UNK5)
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
	ld a, [wCurObjUnk09]
	ld [hli], a
	ld a, [wCurObjUnk0a]
	ld [hli], a
	ld a, [wCurObjUnk0b]
	ld [hli], a
	ld a, [wCurObjUnk0c]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjUnk0f]
	ld [hli], a
	ld a, [wCurObjUnk10 + 0]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjUnk12 + 0]
	ld [hli], a
	ld a, [wCurObjUnk12 + 1]
	ld [hli], a
	ld a, [wCurObjUnk14 + 0]
	ld [hli], a
	ld a, [wCurObjUnk14 + 1]
	ld [hli], a
	ld a, [wCurObjUnk16]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjUnk19]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x6130b

Func_6130b: ; 6130b (18:530b)
	call Func_618e2
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj2Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj3Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj4Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj5Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj6Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj7Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj8Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
	ret
; 0x61348

Func_61348: ; 61348 (18:5348)
	ld a, [wPowerUpLevel]
	ld e, a
	ld a, [wTransformation]
	rla
	jr nc, .asm_61354
	ld e, POWER_UP_SUPER_JUMP_SLAM_OVERALLS
.asm_61354
	ld a, e
	ld [w1d14a], a

	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, Func_6130b

	ld a, [wIsFloorTransition]
	and a
	jr nz, .asm_613a2
	call Func_618e2
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj2Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj3Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj4Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj5Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj6Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj7Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj8Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
	ret

.asm_613a2
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj2Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj3Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj4Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj5Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj6Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj7Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj8Flags)
	ld a, [hl]
	rra
	call c, Func_61513
	ret
; 0x613dc

Func_613dc: ; 613dc (18:53dc)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
	ld a, [hli]
	ld [wCurObjUnk01], a
	ld a, [hli]
	ld [wCurObjUnk02], a
	ld a, [hli]
	ld [wCurObjYPos], a
	ld a, [hli]
	ld [wCurObjYPos + 1], a
	ld a, [hli]
	ld [wCurObjXPos], a
	ld a, [hli]
	ld [wCurObjXPos + 1], a
	ld a, [hli]
	ld [wCurObjUnk07], a
	ld a, [hli]
	ld [wCurObjInteractionType], a
	ld a, [hli]
	ld [wCurObjUnk09], a
	ld a, [hli]
	ld [wCurObjUnk0a], a
	ld a, [hli]
	ld [wCurObjUnk0b], a
	ld a, [hli]
	ld [wCurObjUnk0c], a
	ld a, [hli]
	ld [wCurObjScreenYPos], a
	ld a, [hli]
	ld [wCurObjScreenXPos], a
	ld a, [hli]
	ld [wCurObjUnk0f], a
	ld a, [hli]
	ld [wCurObjUnk10 + 0], a
	ld a, [hli]
	ld [wCurObjUnk10 + 1], a
	ld a, [hli]
	ld [wCurObjUnk12 + 0], a
	ld a, [hli]
	ld [wCurObjUnk12 + 1], a
	ld a, [hli]
	ld [wCurObjUnk14 + 0], a
	ld a, [hli]
	ld [wCurObjUnk14 + 1], a
	ld a, [hli]
	ld [wCurObjUnk16], a
	ld a, [hli]
	ld [wCurObjUnk17], a
	ld a, [hli]
	ld [wCurObjUnk18], a
	ld a, [hli]
	ld [wCurObjUnk19], a
	ld a, [hli]
	ld [wCurObjUnk1a], a
	ld a, [hli]
	ld [wCurObjAction], a
	ld a, [hli]
	ld [wCurObjUnk1c], a
	ld a, [hli]
	ld [wCurObjUnk1d], a
	ld a, [hli]
	ld [wCurObjUpdateFunction], a
	ld a, [hl]
	ld [wCurObjUpdateFunction + 1], a

	call Func_61760
	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call Func_312f
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wTempSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_UNK5)
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
	ld a, [wCurObjUnk09]
	ld [hli], a
	ld a, [wCurObjUnk0a]
	ld [hli], a
	ld a, [wCurObjUnk0b]
	ld [hli], a
	ld a, [wCurObjUnk0c]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjUnk0f]
	ld [hli], a
	ld a, [wCurObjUnk10 + 0]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjUnk12 + 0]
	ld [hli], a
	ld a, [wCurObjUnk12 + 1]
	ld [hli], a
	ld a, [wCurObjUnk14 + 0]
	ld [hli], a
	ld a, [wCurObjUnk14 + 1]
	ld [hli], a
	ld a, [wCurObjUnk16]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjUnk19]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
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
	ld a, [hli]
	ld [wCurObjUnk01], a
	ld a, [hli]
	ld [wCurObjUnk02], a
	ld a, [hli]
	ld [wCurObjYPos], a
	ld a, [hli]
	ld [wCurObjYPos + 1], a
	ld a, [hli]
	ld [wCurObjXPos], a
	ld a, [hli]
	ld [wCurObjXPos + 1], a
	ld a, [hli]
	ld [wCurObjUnk07], a
	ld a, [hli]
	ld [wCurObjInteractionType], a
	ld a, [hli]
	ld [wCurObjUnk09], a
	ld a, [hli]
	ld [wCurObjUnk0a], a
	ld a, [hli]
	ld [wCurObjUnk0b], a
	ld a, [hli]
	ld [wCurObjUnk0c], a
	ld a, [hli]
	ld [wCurObjScreenYPos], a
	ld a, [hli]
	ld [wCurObjScreenXPos], a
	ld a, [hli]
	ld [wCurObjUnk0f], a
	ld a, [hli]
	ld [wCurObjUnk10 + 0], a
	ld a, [hli]
	ld [wCurObjUnk10 + 1], a
	ld a, [hli]
	ld [wCurObjUnk12 + 0], a
	ld a, [hli]
	ld [wCurObjUnk12 + 1], a
	ld a, [hli]
	ld [wCurObjUnk14 + 0], a
	ld a, [hli]
	ld [wCurObjUnk14 + 1], a
	ld a, [hli]
	ld [wCurObjUnk16], a
	ld a, [hli]
	ld [wCurObjUnk17], a
	ld a, [hli]
	ld [wCurObjUnk18], a
	ld a, [hli]
	ld [wCurObjUnk19], a
	ld a, [hli]
	ld [wCurObjUnk1a], a
	ld a, [hli]
	ld [wCurObjAction], a
	ld a, [hli]
	ld [wCurObjUnk1c], a
	ld a, [hli]
	ld [wCurObjUnk1d], a
	ld a, [hli]
	ld [wCurObjUpdateFunction], a
	ld a, [hl]
	ld [wCurObjUpdateFunction + 1], a
	ld hl, wCurObjUnk1a
	bit 5, [hl]
	jr z, .asm_615b4

	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.asm_615b4
	call Func_3104
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wTempSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_UNK5)
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
	ld a, [wCurObjUnk09]
	ld [hli], a
	ld a, [wCurObjUnk0a]
	ld [hli], a
	ld a, [wCurObjUnk0b]
	ld [hli], a
	ld a, [wCurObjUnk0c]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjUnk0f]
	ld [hli], a
	ld a, [wCurObjUnk10 + 0]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjUnk12 + 0]
	ld [hli], a
	ld a, [wCurObjUnk12 + 1]
	ld [hli], a
	ld a, [wCurObjUnk14 + 0]
	ld [hli], a
	ld a, [wCurObjUnk14 + 1]
	ld [hli], a
	ld a, [wCurObjUnk16]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjUnk19]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x6164e

Func_6164e: ; 6164e (18:564e)
	ld hl, wObj1Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_2
	ld e, LOW(wObj1ScreenYPos)
	ld l, LOW(wObj1Unk07)
	call UpdateObjSprite

.obj_2
	ld hl, wObj2Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_3
	ld e, LOW(wObj2ScreenYPos)
	ld l, LOW(wObj2Unk07)
	call UpdateObjSprite

.obj_3
	ld hl, wObj3Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_4
	ld e, LOW(wObj3ScreenYPos)
	ld l, LOW(wObj3Unk07)
	call UpdateObjSprite

.obj_4
	ld hl, wObj4Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_5
	ld e, LOW(wObj4ScreenYPos)
	ld l, LOW(wObj4Unk07)
	call UpdateObjSprite

.obj_5
	ld hl, wObj5Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_6
	ld e, LOW(wObj5ScreenYPos)
	ld l, LOW(wObj5Unk07)
	call UpdateObjSprite

.obj_6
	ld hl, wObj6Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_7
	ld e, LOW(wObj6ScreenYPos)
	ld l, LOW(wObj6Unk07)
	call UpdateObjSprite

.obj_7
	ld hl, wObj7Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .obj_8
	ld e, LOW(wObj7ScreenYPos)
	ld l, LOW(wObj7Unk07)
	call UpdateObjSprite

.obj_8
	ld hl, wObj8Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .done
	ld e, LOW(wObj8ScreenYPos)
	ld l, LOW(wObj8Unk07)
	call UpdateObjSprite

.done
	ret
; 0x616d7

Func_616d7: ; 616d7 (18:56d7)
	ld hl, wObj1
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_2
	ld e, LOW(wObj1ScreenYPos)
	ld l, LOW(wObj1Unk07)
	call UpdateObjSprite

.obj_2
	ld hl, wObj2
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_3
	ld e, LOW(wObj2ScreenYPos)
	ld l, LOW(wObj2Unk07)
	call UpdateObjSprite

.obj_3
	ld hl, wObj3
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_4
	ld e, LOW(wObj3ScreenYPos)
	ld l, LOW(wObj3Unk07)
	call UpdateObjSprite

.obj_4
	ld hl, wObj4
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_5
	ld e, LOW(wObj4ScreenYPos)
	ld l, LOW(wObj4Unk07)
	call UpdateObjSprite

.obj_5
	ld hl, wObj5
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_6
	ld e, LOW(wObj5ScreenYPos)
	ld l, LOW(wObj5Unk07)
	call UpdateObjSprite

.obj_6
	ld hl, wObj6
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_7
	ld e, LOW(wObj6ScreenYPos)
	ld l, LOW(wObj6Unk07)
	call UpdateObjSprite

.obj_7
	ld hl, wObj7
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_8
	ld e, LOW(wObj7ScreenYPos)
	ld l, LOW(wObj7Unk07)
	call UpdateObjSprite

.obj_8
	ld hl, wObj8
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .done
	ld e, LOW(wObj8ScreenYPos)
	ld l, LOW(wObj8Unk07)
	call UpdateObjSprite

.done
	ret
; 0x61760

Func_61760: ; 61760 (18:5760)
	ld a, [wCurObjUnk1c]
	and a
	ret z
	bit 7, a
	jr z, .jump
	dec a
	cp $80
	jr nz, .asm_6176f
	xor a
.asm_6176f
	ld [wCurObjUnk1c], a
	ret

.jump
	jumptable

	dw $57a6
	dw $57a7
	dw $57c1
	dw $57da
	dw $57f2
	dw $5809
	dw $581d
	dw $583e
	dw $58a5
	dw $5847
	dw $5851
	dw $5857
	dw $5861
	dw $586b
	dw $5875
	dw $587f
	dw $5889
	dw $5893
	dw $5819
	dw $579c
; 0x6179c

	INCROM $6179c, $6189d

Func_6189d: ; 6189d (18:589d)
	load_sfx SFX_018

	ld hl, wCurObjUpdateFunction + 1
	ld a, $48
	ld [hld], a
	ld a, $a2
	ld [hld], a
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	ld [hld], a
	ld a, $30
	ld [wCurObjUnk07], a

	ld hl, wCurObjUnk10
	ld a, $00
	ld [hli], a ; OBJ_UNK_10
	ld a, $40
	ld [hli], a
	ld a, $c5
	ld [hli], a ; OBJ_UNK_12
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_UNK_14
	ld [hli], a
	ld a, $21
	ld [hli], a ; OBJ_UNK_16

	ld l, OBJ_FLAGS
	res OBJFLAG_UNK2_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld a, $81
	ld [wCurObjUnk1c], a

	ld l, OBJ_Y_POS
	ld a, [hl]
	sub $08
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x618e2

Func_618e2: ; 618e2 (18:58e2)
	ld hl, wObj1
	ld e, %101
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj2)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj3)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj4)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj5)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj6)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj7)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wObj8)
	ld a, [hl]
	and e
	cp e
	ret nz

.asm_6191c
	push hl
	ld a, l
	add OBJ_INTERACTION_TYPE
	ld l, a
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ldh [hffa0], a
	ld a, [hli] ; OBJ_UNK_09
	ld b, a
	ld a, [hli] ; OBJ_UNK_0A
	ld c, a
	ld a, [hli] ; OBJ_UNK_0B
	ld d, a
	ld a, [hli] ; OBJ_UNK_0C
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
	ld a, l
	add OBJ_ACTION - OBJ_UNK_0F
	ld l, a
	ld a, [hl] ; OBJ_ACTION
	cp OBJ_ACTION_4C
	jr nc, .asm_6194d
	cp OBJ_ACTION_48
	jr nc, .asm_61992

.asm_6194d
	rra
	ld hl, hffa0
	ld a, [hli]
	jr c, .asm_61973
	rla
	jr c, .asm_61965
	ld a, $28
	ld [hli], a ; hffa1
	ld a, $29
	ld [hli], a ; hffa2
	ld a, $09
	ld [hli], a ; hffa3
	ld a, $29
	ld [hli], a ; hffa4
	jr .obj_1

.asm_61965
	ld a, $28
	ld [hli], a ; hffa1
	ld a, $08
	ld [hli], a ; hffa2
	ld a, $28
	ld [hli], a ; hffa3
	ld a, $29
	ld [hli], a ; hffa4
	jr .obj_1

.asm_61973
	rla
	jr c, .asm_61984
	ld a, $29
	ld [hli], a ; ; hffa1
	ld a, $28
	ld [hli], a ; ; hffa2
	ld a, $08
	ld [hli], a ; ; hffa3
	ld a, $28
	ld [hli], a ; ; hffa4
	jr .obj_1

.asm_61984
	ld a, $29
	ld [hli], a ; hffa1
	ld a, $09
	ld [hli], a ; hffa2
	ld a, $29
	ld [hli], a ; hffa3
	ld a, $28
	ld [hli], a ; hffa4
	jr .obj_1

.asm_61992
	rra
	ld hl, hffa1
	jr c, .asm_619a0
	ld a, $09
	ld [hli], a ; hffa1
	ld a, $08
	ld [hli], a ; hffa2
	jr .obj_1

.asm_619a0
	ld a, $08
	ld [hli], a ; hffa1
	ld a, $09
	ld [hli], a ; hffa2

.obj_1
	ld a, [wObj1Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_2
	ld a, [wObj1ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj1ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj1Unk0a]
	add h
	sub b
	jr c, .obj_2
	ld a, [wObj1Unk09]
	add h
	sub c
	jr nc, .obj_2
	ld a, [wObj1Unk0c]
	add l
	sub d
	jr c, .obj_2
	ld a, [wObj1Unk0b]
	add l
	sub e
	jr nc, .obj_2
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_ACTION
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61d28
	cp OBJ_ACTION_48
	jp z, Func_61d28
	ld a, [wObj1InteractionType]
	rla
	jp c, Func_61df0
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj1Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61a02
	cp OBJ_ACTION_48
	jr nz, .asm_61a06
.asm_61a02
	xor a
	ld [wGrabState], a
.asm_61a06
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj1Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_2
	ld a, [wObj2Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_3
	ld a, [wObj2ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj2ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj2Unk0a]
	add h
	sub b
	jr c, .obj_3
	ld a, [wObj2Unk09]
	add h
	sub c
	jr nc, .obj_3
	ld a, [wObj2Unk0c]
	add l
	sub d
	jr c, .obj_3
	ld a, [wObj2Unk0b]
	add l
	sub e
	jr nc, .obj_3
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61d41
	cp OBJ_ACTION_48
	jp z, Func_61d41
	ld a, [wObj2InteractionType]
	rla
	jp c, Func_61e14
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj2Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61a72
	cp OBJ_ACTION_48
	jr nz, .asm_61a76
.asm_61a72
	xor a
	ld [wGrabState], a
.asm_61a76
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj2Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_3
	ld a, [wObj3Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_4
	ld a, [wObj3ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj3ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj3Unk0a]
	add h
	sub b
	jr c, .obj_4
	ld a, [wObj3Unk09]
	add h
	sub c
	jr nc, .obj_4
	ld a, [wObj3Unk0c]
	add l
	sub d
	jr c, .obj_4
	ld a, [wObj3Unk0b]
	add l
	sub e
	jr nc, .obj_4
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61d5a
	cp OBJ_ACTION_48
	jp z, Func_61d5a
	ld a, [wObj3InteractionType]
	rla
	jp c, Func_61e38
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj3Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61ae2
	cp OBJ_ACTION_48
	jr nz, .asm_61ae6
.asm_61ae2
	xor a
	ld [wGrabState], a
.asm_61ae6
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj3Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_4
	ld a, [wObj4Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_5
	ld a, [wObj4ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj4ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj4Unk0a]
	add h
	sub b
	jr c, .obj_5
	ld a, [wObj4Unk09]
	add h
	sub c
	jr nc, .obj_5
	ld a, [wObj4Unk0c]
	add l
	sub d
	jr c, .obj_5
	ld a, [wObj4Unk0b]
	add l
	sub e
	jr nc, .obj_5
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61d73
	cp OBJ_ACTION_48
	jp z, Func_61d73
	ld a, [wObj4InteractionType]
	rla
	jp c, Func_61e5c
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj4Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61b52
	cp OBJ_ACTION_48
	jr nz, .asm_61b56
.asm_61b52
	xor a
	ld [wGrabState], a
.asm_61b56
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj4Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_5
	ld a, [wObj5Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_6
	ld a, [wObj5ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj5ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj5Unk0a]
	add h
	sub b
	jr c, .obj_6
	ld a, [wObj5Unk09]
	add h
	sub c
	jr nc, .obj_6
	ld a, [wObj5Unk0c]
	add l
	sub d
	jr c, .obj_6
	ld a, [wObj5Unk0b]
	add l
	sub e
	jr nc, .obj_6
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61d8c
	cp OBJ_ACTION_48
	jp z, Func_61d8c
	ld a, [wObj5InteractionType]
	rla
	jp c, Func_61e80
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj5Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61bc2
	cp OBJ_ACTION_48
	jr nz, .asm_61bc6
.asm_61bc2
	xor a
	ld [wGrabState], a
.asm_61bc6
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj5Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_6
	ld a, [wObj6Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_7
	ld a, [wObj6ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj6ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj6Unk0a]
	add h
	sub b
	jr c, .obj_7
	ld a, [wObj6Unk09]
	add h
	sub c
	jr nc, .obj_7
	ld a, [wObj6Unk0c]
	add l
	sub d
	jr c, .obj_7
	ld a, [wObj6Unk0b]
	add l
	sub e
	jr nc, .obj_7
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61da5
	cp OBJ_ACTION_48
	jp z, Func_61da5
	ld a, [wObj6InteractionType]
	rla
	jp c, Func_61ea4
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj6Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61c32
	cp OBJ_ACTION_48
	jr nz, .asm_61c36
.asm_61c32
	xor a
	ld [wGrabState], a
.asm_61c36
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj6Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_7
	ld a, [wObj7Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .obj_8
	ld a, [wObj7ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj7ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj7Unk0a]
	add h
	sub b
	jr c, .obj_8
	ld a, [wObj7Unk09]
	add h
	sub c
	jr nc, .obj_8
	ld a, [wObj7Unk0c]
	add l
	sub d
	jr c, .obj_8
	ld a, [wObj7Unk0b]
	add l
	sub e
	jr nc, .obj_8
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61dbe
	cp OBJ_ACTION_48
	jp z, Func_61dbe
	ld a, [wObj7InteractionType]
	rla
	jp c, Func_61ec8
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj7Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61ca2
	cp OBJ_ACTION_48
	jr nz, .asm_61ca6
.asm_61ca2
	xor a
	ld [wGrabState], a
.asm_61ca6
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj7Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.obj_8
	ld a, [wObj8Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .done
	ld a, [wObj8ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj8ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj8Unk0a]
	add h
	sub b
	jr c, .done
	ld a, [wObj8Unk09]
	add h
	sub c
	jr nc, .done
	ld a, [wObj8Unk0c]
	add l
	sub d
	jr c, .done
	ld a, [wObj8Unk0b]
	add l
	sub e
	jr nc, .done
	pop hl
	res 2, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_4A
	jp z, Func_61dd7
	cp OBJ_ACTION_48
	jp z, Func_61dd7
	ld a, [wObj8InteractionType]
	rla
	jp c, Func_61eec
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj8Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61d12
	cp OBJ_ACTION_48
	jr nz, .asm_61d16
.asm_61d12
	xor a
	ld [wGrabState], a
.asm_61d16
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj8Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret

.done
	pop hl
	ret
; 0x61d28

Func_61d28: ; 61d28 (18:5d28)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj1Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj1Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61d41

Func_61d41: ; 61d41 (18:5d41)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj2Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj2Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61d5a

Func_61d5a: ; 61d5a (18:5d5a)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj3Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj3Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61d73

Func_61d73: ; 61d73 (18:5d73)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj4Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj4Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61d8c

Func_61d8c: ; 61d8c (18:5d8c)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj5Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj5Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61da5

Func_61da5: ; 61da5 (18:5da5)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj6Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj6Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61dbe

Func_61dbe: ; 61dbe (18:5dbe)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj7Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj7Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61dd7

Func_61dd7: ; 61dd7 (18:5dd7)
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj8Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj8Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61df0

Func_61df0: ; 61df0 (18:5df0)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj1Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61e00
	cp OBJ_ACTION_48
	jr nz, .asm_61e04
.asm_61e00
	xor a
	ld [wGrabState], a
.asm_61e04
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj1Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61e14

Func_61e14: ; 61e14 (18:5e14)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj2Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61e24
	cp OBJ_ACTION_48
	jr nz, .asm_61e28
.asm_61e24
	xor a
	ld [wGrabState], a
.asm_61e28
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj2Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61e38

Func_61e38: ; 61e38 (18:5e38)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj3Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61e48
	cp OBJ_ACTION_48
	jr nz, .asm_61e4c
.asm_61e48
	xor a
	ld [wGrabState], a
.asm_61e4c
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj3Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61e5c

Func_61e5c: ; 61e5c (18:5e5c)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj4Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61e6c
	cp OBJ_ACTION_48
	jr nz, .asm_61e70
.asm_61e6c
	xor a
	ld [wGrabState], a
.asm_61e70
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj4Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61e80

Func_61e80: ; 61e80 (18:5e80)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj5Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61e90
	cp OBJ_ACTION_48
	jr nz, .asm_61e94
.asm_61e90
	xor a
	ld [wGrabState], a
.asm_61e94
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj5Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61ea4

Func_61ea4: ; 61ea4 (18:5ea4)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj6Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61eb4
	cp OBJ_ACTION_48
	jr nz, .asm_61eb8
.asm_61eb4
	xor a
	ld [wGrabState], a
.asm_61eb8
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj6Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61ec8

Func_61ec8: ; 61ec8 (18:5ec8)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj7Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61ed8
	cp OBJ_ACTION_48
	jr nz, .asm_61edc
.asm_61ed8
	xor a
	ld [wGrabState], a
.asm_61edc
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj7Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61eec

Func_61eec: ; 61eec (18:5eec)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj8Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .asm_61efc
	cp OBJ_ACTION_48
	jr nz, .asm_61f00
.asm_61efc
	xor a
	ld [wGrabState], a
.asm_61f00
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj8Flags)
	set OBJFLAG_UNK3_F, [hl]
	load_sfx SFX_016
	ret
; 0x61f10

Func_61f10: ; 61f10 (18:5f10)
	xor a
	call Func_61f41 ; clears whole wObjects
	call Func_61f4a ; clears whole w1d120
	ld [w1d140], a
	ld [w1d141], a
	ld [w1d142], a
	ld [w1d143], a
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
	ld [w1d143], a
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

	INCROM $61f54, $629a6

Func_629a6: ; 629a6 (18:69a6)
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_602a0)
	add LOW(Data_602a0)
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
	jr nz, .asm_629c2
	dec c
	ld a, [bc]
	jr .asm_629c3
.asm_629c2
	inc [hl] ; OBJ_UNK_19
.asm_629c3
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_629cd
	dec [hl]
.asm_629cd
	jp Func_312f.pop_af
; 0x629d0

Func_629d0: ; 629d0 (18:69d0)
	ld hl, wCurObjUnk14
	ld a, [hl]
	cp $03
	jr c, .asm_629db
	sub $03
	ld [hl], a
.asm_629db
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_60000)
	add LOW(Data_60000)
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
	jr nz, .asm_629f7
	dec c
	ld a, [bc]
	jr .asm_629f8
.asm_629f7
	inc [hl] ; OBJ_UNK_19
.asm_629f8
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_62a08
	add c
	ld [hli], a
	jr nc, .asm_62a0d
	inc [hl]
	jr .asm_62a0d
.asm_62a08
	add c
	ld [hli], a
	jr c, .asm_62a0d
	dec [hl]

.asm_62a0d
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
	jp z, Func_312f.pop_af
	ld a, OBJ_ACTION_0A
	ld [wCurObjAction], a
	jp Func_312f.pop_af

.asm_62a35
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_ACTION
	ld a, [wc18c]
	and a
	jr nz, .asm_62a4c
	ld a, OBJ_ACTION_13
	ld [hl], a
	jp Func_312f.pop_af
.asm_62a4c
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x62a5b

; handle gravity for falling objects
_ApplyObjectGravity: ; 62a5b (18:6a5b)
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_60280)
	add LOW(Data_60280)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_60290 - Data_60280
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62a77
	dec c ; use last entry
	ld a, [bc]
	jr .asm_62a78
.asm_62a77
	inc [hl]
.asm_62a78
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .asm_62a82
	inc [hl]
.asm_62a82
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
	jr nz, .asm_62aaa
	ld a, [wc0dd]
	and a
	jp z, Func_312f.pop_af
	ld a, OBJ_ACTION_0A
	ld [wCurObjAction], a
	jp Func_312f.pop_af
.asm_62aaa
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_ACTION
	ld a, [wc18c]
	and a
	jr nz, .asm_62ac1
	ld a, OBJ_ACTION_01
	ld [hl], a
	jp Func_312f.pop_af
.asm_62ac1
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x62ad0

	INCROM $62ad0, $62d57

; hl = OBJ_ACTION
Func_62d57: ; 62d57 (18:6d57)
	ldh a, [hffa0]
	cp $02
	jr c, .asm_62d6b
	cp $03
	jr c, .asm_62d71
	cp $04
	jr c, .asm_62d77
	ld a, OBJ_ACTION_24
	ld [hl], a
	jp Func_312f.pop_af
.asm_62d6b
	ld a, OBJ_ACTION_16
	ld [hl], a
	jp Func_312f.pop_af
.asm_62d71
	ld a, OBJ_ACTION_20
	ld [hl], a
	jp Func_312f.pop_af
.asm_62d77
	ld a, OBJ_ACTION_22
	ld [hl], a
	jp Func_312f.pop_af
; 0x62d7d

	INCROM $62d7d, $62e31

; hl = OBJ_ACTION
Func_62e31: ; 62e31 (18:6e31)
	ldh a, [hffa0]
	cp $02
	jr c, .asm_62e45
	cp $03
	jr c, .asm_62e4b
	cp $04
	jr c, .asm_62e51
	ld a, OBJ_ACTION_25
	ld [hl], a
	jp Func_312f.pop_af
.asm_62e45
	ld a, OBJ_ACTION_17
	ld [hl], a
	jp Func_312f.pop_af
.asm_62e4b
	ld a, OBJ_ACTION_21
	ld [hl], a
	jp Func_312f.pop_af
.asm_62e51
	ld a, OBJ_ACTION_23
	ld [hl], a
	jp Func_312f.pop_af
; 0x62e57

	INCROM $62e57, $6307b

Func_6307b: ; 6307b (18:707b)
	ld hl, wCurObjYPos
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wcac4
	ld a, [hli]
	ld l, [hl]
	ld h, a
	push bc
	push de
	push hl
	ld a, c
	add $18
	ld c, a
	jr nc, .asm_63097
	inc b
	jr z, .asm_630a3
.asm_63097
	ld a, b
	cp h
	jr c, .asm_630fd
	jr nz, .asm_630a3
	ld a, c
	cp l
	jr c, .asm_630fd
	jr z, .asm_630bf
.asm_630a3
	ld a, l
	add $90
	ld l, a
	jr nc, .asm_630aa
	inc h
.asm_630aa
	ld a, c
	sub $38
	ld c, a
	jr nc, .asm_630b5
	dec b
	ld a, b
	inc a
	jr z, .asm_630bf
.asm_630b5
	ld a, b
	cp h
	jr c, .asm_630bf
	jr nz, .asm_630fd
	ld a, c
	cp l
	jr nc, .asm_630fd
.asm_630bf
	ld hl, wcac6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add $18
	ld e, a
	jr nc, .asm_630ce
	inc d
	jr z, .asm_630f6
.asm_630ce
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
	ld a, [wCurObjAction]
	and $fe
	cp OBJ_ACTION_48
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
	add $5c
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
	jr z, .asm_631a0
.asm_63156
	ld a, d
	cp h
	jr c, .asm_6317e
	jr nz, .asm_63162
	ld a, e
	cp l
	jr c, .asm_6317e
	jr z, .asm_631a0
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
	jr z, .asm_631a0
.asm_63174
	ld a, d
	cp h
	jr c, .asm_631a0
	jr nz, .asm_6317e
	ld a, e
	cp l
	jr c, .asm_631a0
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
.asm_631a0
	ret
; 0x631a1

	INCROM $631a1, $631e8

Func_631e8: ; 631e8 (18:71e8)
	ld hl, wCurObjUnk19
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_631f7
	dec c
	ld a, [bc]
	jr .asm_631f8
.asm_631f7
	inc [hl]
.asm_631f8
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_63204
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_63204
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret
; 0x63209

	INCROM $63209, $632ac

Func_632ac: ; 632ac (18:72ac)
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

	INCROM $63339, $63936