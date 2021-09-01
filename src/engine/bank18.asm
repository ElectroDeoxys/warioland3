	INCROM $60000, $611cb

Func_611cb: ; 611cb (18:51cb)
	push hl
	inc l
	rla
	ld [wCurEnemyUnk00], a
	ld a, [hli]
	ld [wCurEnemyUnk01], a
	ld a, [hli]
	ld [wCurEnemyUnk02], a
	ld a, [hli]
	ld [wCurEnemyYPos], a
	ld a, [hli]
	ld [wCurEnemyYPos + 1], a
	ld a, [hli]
	ld [wCurEnemyXPos], a
	ld a, [hli]
	ld [wCurEnemyXPos + 1], a
	ld a, [hli]
	ld [wCurEnemyUnk07], a
	ld a, [hli]
	ld [wCurEnemyInteractionType], a
	ld a, [hli]
	ld [wCurEnemyUnk09], a
	ld a, [hli]
	ld [wCurEnemyUnk0a], a
	ld a, [hli]
	ld [wCurEnemyUnk0b], a
	ld a, [hli]
	ld [wCurEnemyUnk0c], a
	ld a, [hli]
	ld [wCurEnemyUnk0d], a
	ld a, [hli]
	ld [wCurEnemyUnk0e], a
	ld a, [hli]
	ld [wCurEnemyUnk0f], a
	ld a, [hli]
	ld [wCurEnemyUnk10], a
	ld a, [hli]
	ld [wCurEnemyUnk10 + 1], a
	ld a, [hli]
	ld [wCurEnemyUnk12], a
	ld a, [hli]
	ld [wCurEnemyUnk13], a
	ld a, [hli]
	ld [wCurEnemyUnk14], a
	ld a, [hli]
	ld [wCurEnemyUnk15], a
	ld a, [hli]
	ld [wCurEnemyUnk16], a
	ld a, [hli]
	ld [wCurEnemyUnk17], a
	ld a, [hli]
	ld [wCurEnemyUnk18], a
	ld a, [hli]
	ld [wCurEnemyUnk19], a
	ld a, [hli]
	ld [wCurEnemyUnk1a], a
	ld a, [hli]
	ld [wCurEnemyUnk1b], a
	ld a, [hli]
	ld [wCurEnemyUnk1c], a
	ld a, [hli]
	ld [wCurEnemyUnk1d], a
	ld a, [hli]
	ld [wCurEnemyUnk1e], a
	ld a, [hl]
	ld [wCurEnemyUnk1e + 1], a
	call Func_61760

	farcall $13, wCurEnemyUnk1e

	call Func_312f
	call Func_6307b
	ld hl, wCurEnemyUnk0d
	ld a, [wTempSCY]
	ld b, a
	ld a, [wCurEnemyYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [wCurEnemyXPos]
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

	ld a, [wCurEnemyUnk00]
	and $df
	ld [hli], a
	inc l
	inc l
	ld a, [wCurEnemyYPos]
	ld [hli], a
	ld a, [wCurEnemyYPos + 1]
	ld [hli], a
	ld a, [wCurEnemyXPos]
	ld [hli], a
	ld a, [wCurEnemyXPos + 1]
	ld [hli], a
	ld a, [wCurEnemyUnk07]
	ld [hli], a
	ld a, [wCurEnemyInteractionType]
	ld [hli], a
	ld a, [wCurEnemyUnk09]
	ld [hli], a
	ld a, [wCurEnemyUnk0a]
	ld [hli], a
	ld a, [wCurEnemyUnk0b]
	ld [hli], a
	ld a, [wCurEnemyUnk0c]
	ld [hli], a
	ld a, [wCurEnemyUnk0d]
	ld [hli], a
	ld a, [wCurEnemyUnk0e]
	ld [hli], a
	ld a, [wCurEnemyUnk0f]
	ld [hli], a
	ld a, [wCurEnemyUnk10]
	ld [hli], a
	ld a, [wCurEnemyUnk10 + 1]
	ld [hli], a
	ld a, [wCurEnemyUnk12]
	ld [hli], a
	ld a, [wCurEnemyUnk13]
	ld [hli], a
	ld a, [wCurEnemyUnk14]
	ld [hli], a
	ld a, [wCurEnemyUnk15]
	ld [hli], a
	ld a, [wCurEnemyUnk16]
	ld [hli], a
	ld a, [wCurEnemyUnk17]
	ld [hli], a
	ld a, [wCurEnemyUnk18]
	ld [hli], a
	ld a, [wCurEnemyUnk19]
	ld [hli], a
	ld a, [wCurEnemyUnk1a]
	ld [hli], a
	ld a, [wCurEnemyUnk1b]
	ld [hli], a
	ld a, [wCurEnemyUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurEnemyUnk1e]
	ld [hli], a
	ld a, [wCurEnemyUnk1e + 1]
	ld [hl], a
	ret
; 0x6130b

Func_6130b: ; 6130b (18:530b)
	call Func_618e2
	ld hl, wEnemy1Unk00
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy2Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy3Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy4Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy5Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy6Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy7Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, LOW(wEnemy8Unk00)
	ld a, [hl]
	rra
	call c, Func_611cb
	ret
; 0x61348

Func_61348: ; 61348 (18:5348)
	ld a, [wPowerUpLevel]
	ld e, a
	ld a, [wca8e]
	rla
	jr nc, .asm_61354
	ld e, $06
.asm_61354
	ld a, e

	ld [w1d14a], a
	ld a, [wLevel]
	cp LEVEL_HIDDEN_FIGURE_ROOM
	jr z, Func_6130b

	ld a, [wca73]
	and a
	jr nz, .asm_613a2
	call Func_618e2
	ld hl, wEnemy1Unk00
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy2Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy3Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy4Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy5Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy6Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy7Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, LOW(wEnemy8Unk00)
	ld a, [hl]
	rra
	call c, Func_613dc
	ret

.asm_613a2
	ld hl, wEnemy1Unk00
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy2Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy3Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy4Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy5Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy6Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy7Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, LOW(wEnemy8Unk00)
	ld a, [hl]
	rra
	call c, Func_61513
	ret
; 0x613dc

Func_613dc: ; 613dc (18:53dc)
	push hl
	inc l
	rla
	ld [wCurEnemyUnk00], a
	ld a, [hli]
	ld [wCurEnemyUnk01], a
	ld a, [hli]
	ld [wCurEnemyUnk02], a
	ld a, [hli]
	ld [wCurEnemyYPos], a
	ld a, [hli]
	ld [wCurEnemyYPos + 1], a
	ld a, [hli]
	ld [wCurEnemyXPos], a
	ld a, [hli]
	ld [wCurEnemyXPos + 1], a
	ld a, [hli]
	ld [wCurEnemyUnk07], a
	ld a, [hli]
	ld [wCurEnemyInteractionType], a
	ld a, [hli]
	ld [wCurEnemyUnk09], a
	ld a, [hli]
	ld [wCurEnemyUnk0a], a
	ld a, [hli]
	ld [wCurEnemyUnk0b], a
	ld a, [hli]
	ld [wCurEnemyUnk0c], a
	ld a, [hli]
	ld [wCurEnemyUnk0d], a
	ld a, [hli]
	ld [wCurEnemyUnk0e], a
	ld a, [hli]
	ld [wCurEnemyUnk0f], a
	ld a, [hli]
	ld [wCurEnemyUnk10], a
	ld a, [hli]
	ld [wCurEnemyUnk10 + 1], a
	ld a, [hli]
	ld [wCurEnemyUnk12], a
	ld a, [hli]
	ld [wCurEnemyUnk13], a
	ld a, [hli]
	ld [wCurEnemyUnk14], a
	ld a, [hli]
	ld [wCurEnemyUnk15], a
	ld a, [hli]
	ld [wCurEnemyUnk16], a
	ld a, [hli]
	ld [wCurEnemyUnk17], a
	ld a, [hli]
	ld [wCurEnemyUnk18], a
	ld a, [hli]
	ld [wCurEnemyUnk19], a
	ld a, [hli]
	ld [wCurEnemyUnk1a], a
	ld a, [hli]
	ld [wCurEnemyUnk1b], a
	ld a, [hli]
	ld [wCurEnemyUnk1c], a
	ld a, [hli]
	ld [wCurEnemyUnk1d], a
	ld a, [hli]
	ld [wCurEnemyUnk1e], a
	ld a, [hl]
	ld [wCurEnemyUnk1e + 1], a

	call Func_61760
	ld a, [wCurEnemyUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurEnemyUnk1e + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurEnemyUnk1e + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call Func_312f
	call Func_6307b
	ld hl, wCurEnemyUnk0d
	ld a, [wTempSCY]
	ld b, a
	ld a, [wCurEnemyYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [wCurEnemyXPos]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurEnemyUnk00]
	and $df
	ld [hli], a
	inc l
	inc l
	ld a, [wCurEnemyYPos]
	ld [hli], a
	ld a, [wCurEnemyYPos + 1]
	ld [hli], a
	ld a, [wCurEnemyXPos]
	ld [hli], a
	ld a, [wCurEnemyXPos + 1]
	ld [hli], a
	ld a, [wCurEnemyUnk07]
	ld [hli], a
	ld a, [wCurEnemyInteractionType]
	ld [hli], a
	ld a, [wCurEnemyUnk09]
	ld [hli], a
	ld a, [wCurEnemyUnk0a]
	ld [hli], a
	ld a, [wCurEnemyUnk0b]
	ld [hli], a
	ld a, [wCurEnemyUnk0c]
	ld [hli], a
	ld a, [wCurEnemyUnk0d]
	ld [hli], a
	ld a, [wCurEnemyUnk0e]
	ld [hli], a
	ld a, [wCurEnemyUnk0f]
	ld [hli], a
	ld a, [wCurEnemyUnk10]
	ld [hli], a
	ld a, [wCurEnemyUnk10 + 1]
	ld [hli], a
	ld a, [wCurEnemyUnk12]
	ld [hli], a
	ld a, [wCurEnemyUnk13]
	ld [hli], a
	ld a, [wCurEnemyUnk14]
	ld [hli], a
	ld a, [wCurEnemyUnk15]
	ld [hli], a
	ld a, [wCurEnemyUnk16]
	ld [hli], a
	ld a, [wCurEnemyUnk17]
	ld [hli], a
	ld a, [wCurEnemyUnk18]
	ld [hli], a
	ld a, [wCurEnemyUnk19]
	ld [hli], a
	ld a, [wCurEnemyUnk1a]
	ld [hli], a
	ld a, [wCurEnemyUnk1b]
	ld [hli], a
	ld a, [wCurEnemyUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurEnemyUnk1e]
	ld [hli], a
	ld a, [wCurEnemyUnk1e + 1]
	ld [hl], a
	ret
; 0x61513

Func_61513: ; 61513 (18:5513)
	push hl
	inc l
	rla
	ld [wCurEnemyUnk00], a
	ld a, [hli]
	ld [wCurEnemyUnk01], a
	ld a, [hli]
	ld [wCurEnemyUnk02], a
	ld a, [hli]
	ld [wCurEnemyYPos], a
	ld a, [hli]
	ld [wCurEnemyYPos + 1], a
	ld a, [hli]
	ld [wCurEnemyXPos], a
	ld a, [hli]
	ld [wCurEnemyXPos + 1], a
	ld a, [hli]
	ld [wCurEnemyUnk07], a
	ld a, [hli]
	ld [wCurEnemyInteractionType], a
	ld a, [hli]
	ld [wCurEnemyUnk09], a
	ld a, [hli]
	ld [wCurEnemyUnk0a], a
	ld a, [hli]
	ld [wCurEnemyUnk0b], a
	ld a, [hli]
	ld [wCurEnemyUnk0c], a
	ld a, [hli]
	ld [wCurEnemyUnk0d], a
	ld a, [hli]
	ld [wCurEnemyUnk0e], a
	ld a, [hli]
	ld [wCurEnemyUnk0f], a
	ld a, [hli]
	ld [wCurEnemyUnk10], a
	ld a, [hli]
	ld [wCurEnemyUnk10 + 1], a
	ld a, [hli]
	ld [wCurEnemyUnk12], a
	ld a, [hli]
	ld [wCurEnemyUnk13], a
	ld a, [hli]
	ld [wCurEnemyUnk14], a
	ld a, [hli]
	ld [wCurEnemyUnk15], a
	ld a, [hli]
	ld [wCurEnemyUnk16], a
	ld a, [hli]
	ld [wCurEnemyUnk17], a
	ld a, [hli]
	ld [wCurEnemyUnk18], a
	ld a, [hli]
	ld [wCurEnemyUnk19], a
	ld a, [hli]
	ld [wCurEnemyUnk1a], a
	ld a, [hli]
	ld [wCurEnemyUnk1b], a
	ld a, [hli]
	ld [wCurEnemyUnk1c], a
	ld a, [hli]
	ld [wCurEnemyUnk1d], a
	ld a, [hli]
	ld [wCurEnemyUnk1e], a
	ld a, [hl]
	ld [wCurEnemyUnk1e + 1], a
	ld hl, wCurEnemyUnk1a
	bit 5, [hl]
	jr z, .asm_615b4

	ld a, [wCurEnemyUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurEnemyUnk1e + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurEnemyUnk1e + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.asm_615b4
	call Func_3104
	call Func_6307b
	ld hl, wCurEnemyUnk0d
	ld a, [wTempSCY]
	ld b, a
	ld a, [wCurEnemyYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [wCurEnemyXPos]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurEnemyUnk00]
	and $df
	ld [hli], a
	inc l
	inc l
	ld a, [wCurEnemyYPos]
	ld [hli], a
	ld a, [wCurEnemyYPos + 1]
	ld [hli], a
	ld a, [wCurEnemyXPos]
	ld [hli], a
	ld a, [wCurEnemyXPos + 1]
	ld [hli], a
	ld a, [wCurEnemyUnk07]
	ld [hli], a
	ld a, [wCurEnemyInteractionType]
	ld [hli], a
	ld a, [wCurEnemyUnk09]
	ld [hli], a
	ld a, [wCurEnemyUnk0a]
	ld [hli], a
	ld a, [wCurEnemyUnk0b]
	ld [hli], a
	ld a, [wCurEnemyUnk0c]
	ld [hli], a
	ld a, [wCurEnemyUnk0d]
	ld [hli], a
	ld a, [wCurEnemyUnk0e]
	ld [hli], a
	ld a, [wCurEnemyUnk0f]
	ld [hli], a
	ld a, [wCurEnemyUnk10]
	ld [hli], a
	ld a, [wCurEnemyUnk10 + 1]
	ld [hli], a
	ld a, [wCurEnemyUnk12]
	ld [hli], a
	ld a, [wCurEnemyUnk13]
	ld [hli], a
	ld a, [wCurEnemyUnk14]
	ld [hli], a
	ld a, [wCurEnemyUnk15]
	ld [hli], a
	ld a, [wCurEnemyUnk16]
	ld [hli], a
	ld a, [wCurEnemyUnk17]
	ld [hli], a
	ld a, [wCurEnemyUnk18]
	ld [hli], a
	ld a, [wCurEnemyUnk19]
	ld [hli], a
	ld a, [wCurEnemyUnk1a]
	ld [hli], a
	ld a, [wCurEnemyUnk1b]
	ld [hli], a
	ld a, [wCurEnemyUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurEnemyUnk1e]
	ld [hli], a
	ld a, [wCurEnemyUnk1e + 1]
	ld [hl], a
	ret
; 0x6164e

Func_6164e: ; 6164e (18:564e)
	ld hl, wEnemy1
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_2
	ld e, LOW(wEnemy1Unk0d)
	ld l, LOW(wEnemy1Unk07)
	call UpdateEnemySprite

.enemy_2
	ld hl, wEnemy2
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_3
	ld e, LOW(wEnemy2Unk0d)
	ld l, LOW(wEnemy2Unk07)
	call UpdateEnemySprite

.enemy_3
	ld hl, wEnemy3
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_4
	ld e, LOW(wEnemy3Unk0d)
	ld l, LOW(wEnemy3Unk07)
	call UpdateEnemySprite

.enemy_4
	ld hl, wEnemy4
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_5
	ld e, LOW(wEnemy4Unk0d)
	ld l, LOW(wEnemy4Unk07)
	call UpdateEnemySprite

.enemy_5
	ld hl, wEnemy5
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_6
	ld e, LOW(wEnemy5Unk0d)
	ld l, LOW(wEnemy5Unk07)
	call UpdateEnemySprite

.enemy_6
	ld hl, wEnemy6
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_7
	ld e, LOW(wEnemy6Unk0d)
	ld l, LOW(wEnemy6Unk07)
	call UpdateEnemySprite

.enemy_7
	ld hl, wEnemy7
	ld a, [hl]
	and $93
	cp $83
	jr nz, .enemy_8
	ld e, LOW(wEnemy7Unk0d)
	ld l, LOW(wEnemy7Unk07)
	call UpdateEnemySprite

.enemy_8
	ld hl, wEnemy8
	ld a, [hl]
	and $93
	cp $83
	jr nz, .done
	ld e, LOW(wEnemy8Unk0d)
	ld l, LOW(wEnemy8Unk07)
	call UpdateEnemySprite

.done
	ret
; 0x616d7

Func_616d7: ; 616d7 (18:56d7)
	ld hl, wEnemy1
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_2
	ld e, LOW(wEnemy1Unk0d)
	ld l, LOW(wEnemy1Unk07)
	call UpdateEnemySprite

.enemy_2
	ld hl, wEnemy2
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_3
	ld e, LOW(wEnemy2Unk0d)
	ld l, LOW(wEnemy2Unk07)
	call UpdateEnemySprite

.enemy_3
	ld hl, wEnemy3
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_4
	ld e, LOW(wEnemy3Unk0d)
	ld l, LOW(wEnemy3Unk07)
	call UpdateEnemySprite

.enemy_4
	ld hl, wEnemy4
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_5
	ld e, LOW(wEnemy4Unk0d)
	ld l, LOW(wEnemy4Unk07)
	call UpdateEnemySprite

.enemy_5
	ld hl, wEnemy5
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_6
	ld e, LOW(wEnemy5Unk0d)
	ld l, LOW(wEnemy5Unk07)
	call UpdateEnemySprite

.enemy_6
	ld hl, wEnemy6
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_7
	ld e, LOW(wEnemy6Unk0d)
	ld l, LOW(wEnemy6Unk07)
	call UpdateEnemySprite

.enemy_7
	ld hl, wEnemy7
	ld a, [hl]
	and $93
	cp $03
	jr nz, .enemy_8
	ld e, LOW(wEnemy7Unk0d)
	ld l, LOW(wEnemy7Unk07)
	call UpdateEnemySprite

.enemy_8
	ld hl, wEnemy8
	ld a, [hl]
	and $93
	cp $03
	jr nz, .done
	ld e, LOW(wEnemy8Unk0d)
	ld l, LOW(wEnemy8Unk07)
	call UpdateEnemySprite

.done
	ret
; 0x61760

Func_61760: ; 61760 (18:5760)
	ld a, [wCurEnemyUnk1c]
	and a
	ret z
	bit 7, a
	jr z, .jump
	dec a
	cp $80
	jr nz, .asm_6176f
	xor a
.asm_6176f
	ld [wCurEnemyUnk1c], a
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
	ld hl, wEnemy1
	ld e, %101
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy2)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy3)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy4)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy5)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy6)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy7)
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, LOW(wEnemy8)
	ld a, [hl]
	and e
	cp e
	ret nz

.asm_6191c
	push hl
	ld a, l
	add ENEMY_INTERACTION_TYPE
	ld l, a
	ld a, [hli] ; ENEMY_INTERACTION_TYPE
	ldh [hffa0], a
	ld a, [hli] ; ENEMY_UNK_09
	ld b, a
	ld a, [hli] ; ENEMY_UNK_0A
	ld c, a
	ld a, [hli] ; ENEMY_UNK_0B
	ld d, a
	ld a, [hli] ; ENEMY_UNK_0C
	ld e, a
	ld a, [hl] ; ENEMY_UNK_0D
	add $2a
	add b
	ld b, a
	ld a, [hli] ; ENEMY_UNK_0D
	add $2a
	add c
	ld c, a
	ld a, [hl] ; ENEMY_UNK_0E
	add $2a
	add d
	ld d, a
	ld a, [hli] ; ENEMY_UNK_0E
	add $2a
	add e
	ld e, a
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_0F
	ld l, a
	ld a, [hl] ; ENEMY_UNK_1B
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
	jr .enemy_1

.asm_61965
	ld a, $28
	ld [hli], a ; hffa1
	ld a, $08
	ld [hli], a ; hffa2
	ld a, $28
	ld [hli], a ; hffa3
	ld a, $29
	ld [hli], a ; hffa4
	jr .enemy_1

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
	jr .enemy_1

.asm_61984
	ld a, $29
	ld [hli], a ; hffa1
	ld a, $09
	ld [hli], a ; hffa2
	ld a, $29
	ld [hli], a ; hffa3
	ld a, $28
	ld [hli], a ; hffa4
	jr .enemy_1

.asm_61992
	rra
	ld hl, hffa1
	jr c, .asm_619a0
	ld a, $09
	ld [hli], a ; hffa1
	ld a, $08
	ld [hli], a ; hffa2
	jr .enemy_1

.asm_619a0
	ld a, $08
	ld [hli], a ; hffa1
	ld a, $09
	ld [hli], a ; hffa2

.enemy_1
	ld a, [wEnemy1Unk00]
	and $1f
	cp %11
	jr nz, .enemy_2
	ld a, [wEnemy1Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy1Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy1Unk0a]
	add h
	sub b
	jr c, .enemy_2
	ld a, [wEnemy1Unk09]
	add h
	sub c
	jr nc, .enemy_2
	ld a, [wEnemy1Unk0c]
	add l
	sub d
	jr c, .enemy_2
	ld a, [wEnemy1Unk0b]
	add l
	sub e
	jr nc, .enemy_2
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d28
	cp $48
	jp z, Func_61d28
	ld a, [wEnemy1InteractionType]
	rla
	jp c, Func_61df0
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy1Unk1b)
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
	ld l, LOW(wEnemy1Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_2
	ld a, [wEnemy2Unk00]
	and $1f
	cp $03
	jr nz, .enemy_3
	ld a, [wEnemy2Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy2Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy2Unk0a]
	add h
	sub b
	jr c, .enemy_3
	ld a, [wEnemy2Unk09]
	add h
	sub c
	jr nc, .enemy_3
	ld a, [wEnemy2Unk0c]
	add l
	sub d
	jr c, .enemy_3
	ld a, [wEnemy2Unk0b]
	add l
	sub e
	jr nc, .enemy_3
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d41
	cp $48
	jp z, Func_61d41
	ld a, [wEnemy2InteractionType]
	rla
	jp c, Func_61e14
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy2Unk1b)
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
	ld l, LOW(wEnemy2Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_3
	ld a, [wEnemy3Unk00]
	and $1f
	cp $03
	jr nz, .enemy_4
	ld a, [wEnemy3Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy3Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy3Unk0a]
	add h
	sub b
	jr c, .enemy_4
	ld a, [wEnemy3Unk09]
	add h
	sub c
	jr nc, .enemy_4
	ld a, [wEnemy3Unk0c]
	add l
	sub d
	jr c, .enemy_4
	ld a, [wEnemy3Unk0b]
	add l
	sub e
	jr nc, .enemy_4
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d5a
	cp $48
	jp z, Func_61d5a
	ld a, [wEnemy3InteractionType]
	rla
	jp c, Func_61e38
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy3Unk1b)
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
	ld l, LOW(wEnemy3Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_4
	ld a, [wEnemy4Unk00]
	and $1f
	cp $03
	jr nz, .enemy_5
	ld a, [wEnemy4Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy4Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy4Unk0a]
	add h
	sub b
	jr c, .enemy_5
	ld a, [wEnemy4Unk09]
	add h
	sub c
	jr nc, .enemy_5
	ld a, [wEnemy4Unk0c]
	add l
	sub d
	jr c, .enemy_5
	ld a, [wEnemy4Unk0b]
	add l
	sub e
	jr nc, .enemy_5
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d73
	cp $48
	jp z, Func_61d73
	ld a, [wEnemy4InteractionType]
	rla
	jp c, Func_61e5c
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy4Unk1b)
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
	ld l, LOW(wEnemy4Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_5
	ld a, [wEnemy5Unk00]
	and $1f
	cp $03
	jr nz, .enemy_6
	ld a, [wEnemy5Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy5Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy5Unk0a]
	add h
	sub b
	jr c, .enemy_6
	ld a, [wEnemy5Unk09]
	add h
	sub c
	jr nc, .enemy_6
	ld a, [wEnemy5Unk0c]
	add l
	sub d
	jr c, .enemy_6
	ld a, [wEnemy5Unk0b]
	add l
	sub e
	jr nc, .enemy_6
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d8c
	cp $48
	jp z, Func_61d8c
	ld a, [wEnemy5InteractionType]
	rla
	jp c, Func_61e80
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy5Unk1b)
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
	ld l, LOW(wEnemy5Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_6
	ld a, [wEnemy6Unk00]
	and $1f
	cp $03
	jr nz, .enemy_7
	ld a, [wEnemy6Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy6Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy6Unk0a]
	add h
	sub b
	jr c, .enemy_7
	ld a, [wEnemy6Unk09]
	add h
	sub c
	jr nc, .enemy_7
	ld a, [wEnemy6Unk0c]
	add l
	sub d
	jr c, .enemy_7
	ld a, [wEnemy6Unk0b]
	add l
	sub e
	jr nc, .enemy_7
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61da5
	cp $48
	jp z, Func_61da5
	ld a, [wEnemy6InteractionType]
	rla
	jp c, Func_61ea4
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy6Unk1b)
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
	ld l, LOW(wEnemy6Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_7
	ld a, [wEnemy7Unk00]
	and $1f
	cp $03
	jr nz, .enemy_8
	ld a, [wEnemy7Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy7Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy7Unk0a]
	add h
	sub b
	jr c, .enemy_8
	ld a, [wEnemy7Unk09]
	add h
	sub c
	jr nc, .enemy_8
	ld a, [wEnemy7Unk0c]
	add l
	sub d
	jr c, .enemy_8
	ld a, [wEnemy7Unk0b]
	add l
	sub e
	jr nc, .enemy_8
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61dbe
	cp $48
	jp z, Func_61dbe
	ld a, [wEnemy7InteractionType]
	rla
	jp c, Func_61ec8
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy7Unk1b)
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
	ld l, LOW(wEnemy7Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret

.enemy_8
	ld a, [wEnemy8Unk00]
	and $1f
	cp $03
	jr nz, .done
	ld a, [wEnemy8Unk0d]
	add $2a
	ld h, a
	ld a, [wEnemy8Unk0e]
	add $2a
	ld l, a
	ld a, [wEnemy8Unk0a]
	add h
	sub b
	jr c, .done
	ld a, [wEnemy8Unk09]
	add h
	sub c
	jr nc, .done
	ld a, [wEnemy8Unk0c]
	add l
	sub d
	jr c, .done
	ld a, [wEnemy8Unk0b]
	add l
	sub e
	jr nc, .done
	pop hl
	res 2, [hl]
	ld a, l
	add ENEMY_UNK_1B - ENEMY_UNK_00
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61dd7
	cp $48
	jp z, Func_61dd7
	ld a, [wEnemy8InteractionType]
	rla
	jp c, Func_61eec
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy8Unk1b)
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
	ld l, LOW(wEnemy8Unk00)
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
	ld l, LOW(wEnemy1Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy1Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d41

Func_61d41: ; 61d41 (18:5d41)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy2Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy2Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d5a

Func_61d5a: ; 61d5a (18:5d5a)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy3Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy3Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d73

Func_61d73: ; 61d73 (18:5d73)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy4Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy4Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61d8c

Func_61d8c: ; 61d8c (18:5d8c)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy5Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy5Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61da5

Func_61da5: ; 61da5 (18:5da5)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy6Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy6Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61dbe

Func_61dbe: ; 61dbe (18:5dbe)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy7Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy7Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61dd7

Func_61dd7: ; 61dd7 (18:5dd7)
	xor a
	ld [wca9a], a
	ldh a, [hffa2]
	ld [hl], a
	ld l, LOW(wEnemy8Unk1b)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wEnemy8Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61df0

Func_61df0: ; 61df0 (18:5df0)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy1Unk1b)
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
	ld l, LOW(wEnemy1Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e14

Func_61e14: ; 61e14 (18:5e14)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy2Unk1b)
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
	ld l, LOW(wEnemy2Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e38

Func_61e38: ; 61e38 (18:5e38)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy3Unk1b)
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
	ld l, LOW(wEnemy3Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e5c

Func_61e5c: ; 61e5c (18:5e5c)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy4Unk1b)
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
	ld l, LOW(wEnemy4Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61e80

Func_61e80: ; 61e80 (18:5e80)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy5Unk1b)
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
	ld l, LOW(wEnemy5Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61ea4

Func_61ea4: ; 61ea4 (18:5ea4)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy6Unk1b)
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
	ld l, LOW(wEnemy6Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61ec8

Func_61ec8: ; 61ec8 (18:5ec8)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy7Unk1b)
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
	ld l, LOW(wEnemy7Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61eec

Func_61eec: ; 61eec (18:5eec)
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wEnemy8Unk1b)
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
	ld l, LOW(wEnemy8Unk00)
	set 3, [hl]
	load_sfx SFX_016
	ret
; 0x61f10

Func_61f10: ; 61f10 (18:5f10)
	xor a
	call Func_61f41 ; clears whole wEnemies
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
	call Func_61f41 ; clears whole wEnemies
	call Func_61f4a ; clears whole w1d120
	ld [w1d141], a
	ld [w1d142], a
	ld [w1d143], a
	ld [wNumShootGoals], a
	ld [w1d145], a
	ret
; 0x61f41

Func_61f41: ; 61f41 (18:5f41)
	ld hl, wEnemies
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
	ld hl, wCurEnemyYPos
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
	ld hl, wCurEnemyUnk00
	set 1, [hl]
	jr .asm_6310b
.asm_630fd
	ld a, [wCurEnemyUnk1b]
	and $fe
	cp $48
	jr z, .asm_6310b
.asm_63106
	ld hl, wCurEnemyUnk00
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
	ld a, [wCurEnemyUnk1a]
	and $1f
	cp $10
	ret nc
	ld hl, wCurEnemyUnk02
	and a
	jr z, .asm_6319c
	farcall Func_baee
	ret
.asm_6319c
	xor a
	ld [wCurEnemyUnk00], a
.asm_631a0
	ret
; 0x631a1

	INCROM $631a1, $63936