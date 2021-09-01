	INCROM $60000, $611cb

Func_611cb: ; 611cb (18:51cb)
	push hl
	inc l
	rla
	ld [wCurObjUnk00], a
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
	ld [wCurObjUnk0d], a
	ld a, [hli]
	ld [wCurObjUnk0e], a
	ld a, [hli]
	ld [wCurObjUnk0f], a
	ld a, [hli]
	ld [wCurObjUnk10], a
	ld a, [hli]
	ld [wCurObjUnk10 + 1], a
	ld a, [hli]
	ld [wCurObjUnk12], a
	ld a, [hli]
	ld [wCurObjUnk13], a
	ld a, [hli]
	ld [wCurObjUnk14], a
	ld a, [hli]
	ld [wCurObjUnk15], a
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
	ld [wCurObjUnk1b], a
	ld a, [hli]
	ld [wCurObjUnk1c], a
	ld a, [hli]
	ld [wCurObjUnk1d], a
	ld a, [hli]
	ld [wCurObjUnk1e], a
	ld a, [hl]
	ld [wCurObjUnk1e + 1], a
	call Func_61760

	farcall $13, wCurObjUnk1e

	call Func_312f
	call Func_6307b
	ld hl, wCurObjUnk0d
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

	ld a, [wCurObjUnk00]
	and $df
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
	ld a, [wCurObjUnk0d]
	ld [hli], a
	ld a, [wCurObjUnk0e]
	ld [hli], a
	ld a, [wCurObjUnk0f]
	ld [hli], a
	ld a, [wCurObjUnk10]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjUnk12]
	ld [hli], a
	ld a, [wCurObjUnk13]
	ld [hli], a
	ld a, [wCurObjUnk14]
	ld [hli], a
	ld a, [wCurObjUnk15]
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
	ld a, [wCurObjUnk1b]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUnk1e]
	ld [hli], a
	ld a, [wCurObjUnk1e + 1]
	ld [hl], a
	ret
; 0x6130b

Func_6130b: ; 6130b (18:530b)
	call Func_618e2
	ld hl, wObj1Unk00
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj2Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj3Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj4Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj5Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj6Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj7Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wObj8Unk00)
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
	cp LEVEL_HIDDEN_FIGURE_ROOM
	jr z, Func_6130b

	ld a, [wIsFloorTransition]
	and a
	jr nz, .asm_613a2
	call Func_618e2
	ld hl, wObj1Unk00
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj2Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj3Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj4Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj5Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj6Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj7Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wObj8Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ret

.asm_613a2
	ld hl, wObj1Unk00
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj2Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj3Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj4Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj5Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj6Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj7Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wObj8Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ret
; 0x613dc

Func_613dc: ; 613dc (18:53dc)
	push hl
	inc l
	rla
	ld [wCurObjUnk00], a
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
	ld [wCurObjUnk0d], a
	ld a, [hli]
	ld [wCurObjUnk0e], a
	ld a, [hli]
	ld [wCurObjUnk0f], a
	ld a, [hli]
	ld [wCurObjUnk10], a
	ld a, [hli]
	ld [wCurObjUnk10 + 1], a
	ld a, [hli]
	ld [wCurObjUnk12], a
	ld a, [hli]
	ld [wCurObjUnk13], a
	ld a, [hli]
	ld [wCurObjUnk14], a
	ld a, [hli]
	ld [wCurObjUnk15], a
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
	ld [wCurObjUnk1b], a
	ld a, [hli]
	ld [wCurObjUnk1c], a
	ld a, [hli]
	ld [wCurObjUnk1d], a
	ld a, [hli]
	ld [wCurObjUnk1e], a
	ld a, [hl]
	ld [wCurObjUnk1e + 1], a

	call Func_61760
	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurObjUnk1e + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUnk1e + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call Func_312f
	call Func_6307b
	ld hl, wCurObjUnk0d
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
	ld a, [wCurObjUnk00]
	and $df
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
	ld a, [wCurObjUnk0d]
	ld [hli], a
	ld a, [wCurObjUnk0e]
	ld [hli], a
	ld a, [wCurObjUnk0f]
	ld [hli], a
	ld a, [wCurObjUnk10]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjUnk12]
	ld [hli], a
	ld a, [wCurObjUnk13]
	ld [hli], a
	ld a, [wCurObjUnk14]
	ld [hli], a
	ld a, [wCurObjUnk15]
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
	ld a, [wCurObjUnk1b]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUnk1e]
	ld [hli], a
	ld a, [wCurObjUnk1e + 1]
	ld [hl], a
	ret
; 0x61513

Func_61513: ; 61513 (18:5513)
	push hl
	inc l
	rla
	ld [wCurObjUnk00], a
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
	ld [wCurObjUnk0d], a
	ld a, [hli]
	ld [wCurObjUnk0e], a
	ld a, [hli]
	ld [wCurObjUnk0f], a
	ld a, [hli]
	ld [wCurObjUnk10], a
	ld a, [hli]
	ld [wCurObjUnk10 + 1], a
	ld a, [hli]
	ld [wCurObjUnk12], a
	ld a, [hli]
	ld [wCurObjUnk13], a
	ld a, [hli]
	ld [wCurObjUnk14], a
	ld a, [hli]
	ld [wCurObjUnk15], a
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
	ld [wCurObjUnk1b], a
	ld a, [hli]
	ld [wCurObjUnk1c], a
	ld a, [hli]
	ld [wCurObjUnk1d], a
	ld a, [hli]
	ld [wCurObjUnk1e], a
	ld a, [hl]
	ld [wCurObjUnk1e + 1], a
	ld hl, wCurObjUnk1a
	bit 5, [hl]
	jr z, .asm_615b4

	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurObjUnk1e + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUnk1e + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.asm_615b4
	call Func_3104
	call Func_6307b
	ld hl, wCurObjUnk0d
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
	ld a, [wCurObjUnk00]
	and $df
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
	ld a, [wCurObjUnk0d]
	ld [hli], a
	ld a, [wCurObjUnk0e]
	ld [hli], a
	ld a, [wCurObjUnk0f]
	ld [hli], a
	ld a, [wCurObjUnk10]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjUnk12]
	ld [hli], a
	ld a, [wCurObjUnk13]
	ld [hli], a
	ld a, [wCurObjUnk14]
	ld [hli], a
	ld a, [wCurObjUnk15]
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
	ld a, [wCurObjUnk1b]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUnk1e]
	ld [hli], a
	ld a, [wCurObjUnk1e + 1]
	ld [hl], a
	ret
; 0x6164e

Func_6164e: ; 6164e (18:564e)
	ld hl, wObj1
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_2
	ld e, LOW(wObj1Unk0d)
	ld l, LOW(wObj1Unk07)
	call UpdateObjSprite

.obj_2
	ld hl, wObj2
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_3
	ld e, LOW(wObj2Unk0d)
	ld l, LOW(wObj2Unk07)
	call UpdateObjSprite

.obj_3
	ld hl, wObj3
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_4
	ld e, LOW(wObj3Unk0d)
	ld l, LOW(wObj3Unk07)
	call UpdateObjSprite

.obj_4
	ld hl, wObj4
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_5
	ld e, LOW(wObj4Unk0d)
	ld l, LOW(wObj4Unk07)
	call UpdateObjSprite

.obj_5
	ld hl, wObj5
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_6
	ld e, LOW(wObj5Unk0d)
	ld l, LOW(wObj5Unk07)
	call UpdateObjSprite

.obj_6
	ld hl, wObj6
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_7
	ld e, LOW(wObj6Unk0d)
	ld l, LOW(wObj6Unk07)
	call UpdateObjSprite

.obj_7
	ld hl, wObj7
	ld a, [hl]
	and $93
	cp $83
	jr nz, .obj_8
	ld e, LOW(wObj7Unk0d)
	ld l, LOW(wObj7Unk07)
	call UpdateObjSprite

.obj_8
	ld hl, wObj8
	ld a, [hl]
	and $93
	cp $83
	jr nz, .done
	ld e, LOW(wObj8Unk0d)
	ld l, LOW(wObj8Unk07)
	call UpdateObjSprite

.done
	ret
; 0x616d7

Func_616d7: ; 616d7 (18:56d7)
	ld hl, wObj1
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_2
	ld e, LOW(wObj1Unk0d)
	ld l, LOW(wObj1Unk07)
	call UpdateObjSprite

.obj_2
	ld hl, wObj2
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_3
	ld e, LOW(wObj2Unk0d)
	ld l, LOW(wObj2Unk07)
	call UpdateObjSprite

.obj_3
	ld hl, wObj3
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_4
	ld e, LOW(wObj3Unk0d)
	ld l, LOW(wObj3Unk07)
	call UpdateObjSprite

.obj_4
	ld hl, wObj4
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_5
	ld e, LOW(wObj4Unk0d)
	ld l, LOW(wObj4Unk07)
	call UpdateObjSprite

.obj_5
	ld hl, wObj5
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_6
	ld e, LOW(wObj5Unk0d)
	ld l, LOW(wObj5Unk07)
	call UpdateObjSprite

.obj_6
	ld hl, wObj6
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_7
	ld e, LOW(wObj6Unk0d)
	ld l, LOW(wObj6Unk07)
	call UpdateObjSprite

.obj_7
	ld hl, wObj7
	ld a, [hl]
	and $93
	cp $03
	jr nz, .obj_8
	ld e, LOW(wObj7Unk0d)
	ld l, LOW(wObj7Unk07)
	call UpdateObjSprite

.obj_8
	ld hl, wObj8
	ld a, [hl]
	and $93
	cp $03
	jr nz, .done
	ld e, LOW(wObj8Unk0d)
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

	INCROM $6179c, $618e2

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
	ld a, [hl] ; OBJ_UNK_0D
	add $2a
	add b
	ld b, a
	ld a, [hli] ; OBJ_UNK_0D
	add $2a
	add c
	ld c, a
	ld a, [hl] ; OBJ_UNK_0E
	add $2a
	add d
	ld d, a
	ld a, [hli] ; OBJ_UNK_0E
	add $2a
	add e
	ld e, a
	ld a, l
	add OBJ_UNK_1B - OBJ_UNK_0F
	ld l, a
	ld a, [hl] ; OBJ_UNK_1B
	cp $4c
	jr nc, .asm_6194d
	cp $48
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
	ld a, [wObj1Unk00]
	and $1f
	cp %11
	jr nz, .obj_2
	ld a, [wObj1Unk0d]
	add $2a
	ld h, a
	ld a, [wObj1Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d28
	cp $48
	jp z, Func_61d28
	ld a, [wObj1InteractionType]
	rla
	jp c, Func_61df0
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj1Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61a02
	cp $48
	jr nz, .asm_61a06
.asm_61a02
	xor a
	ld [wca9a], a
.asm_61a06
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj1Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_2
	ld a, [wObj2Unk00]
	and $1f
	cp $03
	jr nz, .obj_3
	ld a, [wObj2Unk0d]
	add $2a
	ld h, a
	ld a, [wObj2Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d41
	cp $48
	jp z, Func_61d41
	ld a, [wObj2InteractionType]
	rla
	jp c, Func_61e14
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj2Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61a72
	cp $48
	jr nz, .asm_61a76
.asm_61a72
	xor a
	ld [wca9a], a
.asm_61a76
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj2Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_3
	ld a, [wObj3Unk00]
	and $1f
	cp $03
	jr nz, .obj_4
	ld a, [wObj3Unk0d]
	add $2a
	ld h, a
	ld a, [wObj3Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d5a
	cp $48
	jp z, Func_61d5a
	ld a, [wObj3InteractionType]
	rla
	jp c, Func_61e38
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj3Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61ae2
	cp $48
	jr nz, .asm_61ae6
.asm_61ae2
	xor a
	ld [wca9a], a
.asm_61ae6
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj3Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_4
	ld a, [wObj4Unk00]
	and $1f
	cp $03
	jr nz, .obj_5
	ld a, [wObj4Unk0d]
	add $2a
	ld h, a
	ld a, [wObj4Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d73
	cp $48
	jp z, Func_61d73
	ld a, [wObj4InteractionType]
	rla
	jp c, Func_61e5c
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj4Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61b52
	cp $48
	jr nz, .asm_61b56
.asm_61b52
	xor a
	ld [wca9a], a
.asm_61b56
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj4Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_5
	ld a, [wObj5Unk00]
	and $1f
	cp $03
	jr nz, .obj_6
	ld a, [wObj5Unk0d]
	add $2a
	ld h, a
	ld a, [wObj5Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d8c
	cp $48
	jp z, Func_61d8c
	ld a, [wObj5InteractionType]
	rla
	jp c, Func_61e80
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj5Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61bc2
	cp $48
	jr nz, .asm_61bc6
.asm_61bc2
	xor a
	ld [wca9a], a
.asm_61bc6
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj5Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_6
	ld a, [wObj6Unk00]
	and $1f
	cp $03
	jr nz, .obj_7
	ld a, [wObj6Unk0d]
	add $2a
	ld h, a
	ld a, [wObj6Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61da5
	cp $48
	jp z, Func_61da5
	ld a, [wObj6InteractionType]
	rla
	jp c, Func_61ea4
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj6Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61c32
	cp $48
	jr nz, .asm_61c36
.asm_61c32
	xor a
	ld [wca9a], a
.asm_61c36
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj6Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_7
	ld a, [wObj7Unk00]
	and $1f
	cp $03
	jr nz, .obj_8
	ld a, [wObj7Unk0d]
	add $2a
	ld h, a
	ld a, [wObj7Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61dbe
	cp $48
	jp z, Func_61dbe
	ld a, [wObj7InteractionType]
	rla
	jp c, Func_61ec8
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj7Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61ca2
	cp $48
	jr nz, .asm_61ca6
.asm_61ca2
	xor a
	ld [wca9a], a
.asm_61ca6
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj7Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.obj_8
	ld a, [wObj8Unk00]
	and $1f
	cp $03
	jr nz, .done
	ld a, [wObj8Unk0d]
	add $2a
	ld h, a
	ld a, [wObj8Unk0e]
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
	add OBJ_UNK_1B - OBJ_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61dd7
	cp $48
	jp z, Func_61dd7
	ld a, [wObj8InteractionType]
	rla
	jp c, Func_61eec
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj8Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61d12
	cp $48
	jr nz, .asm_61d16
.asm_61d12
	xor a
	ld [wca9a], a
.asm_61d16
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj8Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.done
	pop hl
	ret
; 0x61d28

Func_61d28: ; 61d28 (18:5d28)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj1Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj1Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d41

Func_61d41: ; 61d41 (18:5d41)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj2Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj2Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d5a

Func_61d5a: ; 61d5a (18:5d5a)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj3Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj3Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d73

Func_61d73: ; 61d73 (18:5d73)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj4Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj4Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d8c

Func_61d8c: ; 61d8c (18:5d8c)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj5Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj5Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61da5

Func_61da5: ; 61da5 (18:5da5)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj6Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj6Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61dbe

Func_61dbe: ; 61dbe (18:5dbe)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj7Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj7Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61dd7

Func_61dd7: ; 61dd7 (18:5dd7)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wObj8Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj8Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61df0

Func_61df0: ; 61df0 (18:5df0)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj1Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61e00
	cp $48
	jr nz, .asm_61e04
.asm_61e00
	xor a
	ld [wca9a], a
.asm_61e04
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj1Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e14

Func_61e14: ; 61e14 (18:5e14)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj2Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61e24
	cp $48
	jr nz, .asm_61e28
.asm_61e24
	xor a
	ld [wca9a], a
.asm_61e28
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj2Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e38

Func_61e38: ; 61e38 (18:5e38)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj3Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61e48
	cp $48
	jr nz, .asm_61e4c
.asm_61e48
	xor a
	ld [wca9a], a
.asm_61e4c
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj3Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e5c

Func_61e5c: ; 61e5c (18:5e5c)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj4Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61e6c
	cp $48
	jr nz, .asm_61e70
.asm_61e6c
	xor a
	ld [wca9a], a
.asm_61e70
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj4Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e80

Func_61e80: ; 61e80 (18:5e80)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj5Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61e90
	cp $48
	jr nz, .asm_61e94
.asm_61e90
	xor a
	ld [wca9a], a
.asm_61e94
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj5Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61ea4

Func_61ea4: ; 61ea4 (18:5ea4)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj6Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61eb4
	cp $48
	jr nz, .asm_61eb8
.asm_61eb4
	xor a
	ld [wca9a], a
.asm_61eb8
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj6Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61ec8

Func_61ec8: ; 61ec8 (18:5ec8)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj7Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61ed8
	cp $48
	jr nz, .asm_61edc
.asm_61ed8
	xor a
	ld [wca9a], a
.asm_61edc
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj7Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61eec

Func_61eec: ; 61eec (18:5eec)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj8Unk1b)
	ld a, [hl]
	and $fe
	cp $36
	jr z, .asm_61efc
	cp $48
	jr nz, .asm_61f00
.asm_61efc
	xor a
	ld [wca9a], a
.asm_61f00
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj8Unk00)
	set 3, [hl]
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

	INCROM $61f54, $6307b

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
	ld hl, wCurObjUnk00
	set 1, [hl]
	jr .asm_6310b
.asm_630fd
	ld a, [wCurObjUnk1b]
	and $fe
	cp $48
	jr z, .asm_6310b
.asm_63106
	ld hl, wCurObjUnk00
	res 1, [hl]
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
	ld [wCurObjUnk00], a
.asm_631a0
	ret
; 0x631a1

	INCROM $631a1, $63936