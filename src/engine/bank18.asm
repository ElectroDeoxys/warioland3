	INCROM $60000, $611cb

Func_611cb: ; 611cb (18:51cb)
	push hl
	inc l
	rla
	ld [w1d100 + $00], a
	ld a, [hli]
	ld [w1d100 + $01], a
	ld a, [hli]
	ld [w1d100 + $02], a
	ld a, [hli]
	ld [w1d100 + $03], a
	ld a, [hli]
	ld [w1d100 + $04], a
	ld a, [hli]
	ld [w1d100 + $05], a
	ld a, [hli]
	ld [w1d100 + $06], a
	ld a, [hli]
	ld [w1d100 + $07], a
	ld a, [hli]
	ld [w1d100 + $08], a
	ld a, [hli]
	ld [w1d100 + $09], a
	ld a, [hli]
	ld [w1d100 + $0a], a
	ld a, [hli]
	ld [w1d100 + $0b], a
	ld a, [hli]
	ld [w1d100 + $0c], a
	ld a, [hli]
	ld [w1d100 + $0d], a
	ld a, [hli]
	ld [w1d100 + $0e], a
	ld a, [hli]
	ld [w1d100 + $0f], a
	ld a, [hli]
	ld [w1d100 + $10], a
	ld a, [hli]
	ld [w1d100 + $11], a
	ld a, [hli]
	ld [w1d100 + $12], a
	ld a, [hli]
	ld [w1d100 + $13], a
	ld a, [hli]
	ld [w1d100 + $14], a
	ld a, [hli]
	ld [w1d100 + $15], a
	ld a, [hli]
	ld [w1d100 + $16], a
	ld a, [hli]
	ld [w1d100 + $17], a
	ld a, [hli]
	ld [w1d100 + $18], a
	ld a, [hli]
	ld [w1d100 + $19], a
	ld a, [hli]
	ld [w1d100 + $1a], a
	ld a, [hli]
	ld [w1d100 + $1b], a
	ld a, [hli]
	ld [w1d100 + $1c], a
	ld a, [hli]
	ld [w1d100 + $1d], a
	ld a, [hli]
	ld [w1d100 + $1e], a
	ld a, [hl]
	ld [w1d100 + $1f], a
	call Func_61760

	farcall $13, w1d100 + $1e

	call Func_312f
	call Func_6307b
	ld hl, w1d100 + $d
	ld a, [wTempSCY]
	ld b, a
	ld a, [w1d100 + $03]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [w1d100 + $05]
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
	ld a, [w1d100 + $00]
	and $df
	ld [hli], a
	inc l
	inc l
	ld a, [w1d100 + $03]
	ld [hli], a
	ld a, [w1d100 + $04]
	ld [hli], a
	ld a, [w1d100 + $05]
	ld [hli], a
	ld a, [w1d100 + $06]
	ld [hli], a
	ld a, [w1d100 + $07]
	ld [hli], a
	ld a, [w1d100 + $08]
	ld [hli], a
	ld a, [w1d100 + $09]
	ld [hli], a
	ld a, [w1d100 + $0a]
	ld [hli], a
	ld a, [w1d100 + $0b]
	ld [hli], a
	ld a, [w1d100 + $0c]
	ld [hli], a
	ld a, [w1d100 + $0d]
	ld [hli], a
	ld a, [w1d100 + $0e]
	ld [hli], a
	ld a, [w1d100 + $0f]
	ld [hli], a
	ld a, [w1d100 + $10]
	ld [hli], a
	ld a, [w1d100 + $11]
	ld [hli], a
	ld a, [w1d100 + $12]
	ld [hli], a
	ld a, [w1d100 + $13]
	ld [hli], a
	ld a, [w1d100 + $14]
	ld [hli], a
	ld a, [w1d100 + $15]
	ld [hli], a
	ld a, [w1d100 + $16]
	ld [hli], a
	ld a, [w1d100 + $17]
	ld [hli], a
	ld a, [w1d100 + $18]
	ld [hli], a
	ld a, [w1d100 + $19]
	ld [hli], a
	ld a, [w1d100 + $1a]
	ld [hli], a
	ld a, [w1d100 + $1b]
	ld [hli], a
	ld a, [w1d100 + $1c]
	ld [hli], a
	inc l
	ld a, [w1d100 + $1e]
	ld [hli], a
	ld a, [w1d100 + $1f]
	ld [hl], a
	ret
; 0x6130b

Func_6130b: ; 6130b (18:530b)
	call Func_618e2
	ld hl, w1d000
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $20
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $40
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $60
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $80
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $a0
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $c0
	ld a, [hl]
	rra
	call c, Func_611cb
	ld l, $e0
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
	cp LEVEL_HIDDEN_FIGURE_BATTLE
	jr z, Func_6130b
	ld a, [wca73]
	and a
	jr nz, .asm_613a2
	call Func_618e2
	ld hl, w1d000
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $20
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $40
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $60
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $80
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $a0
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $c0
	ld a, [hl]
	rra
	call c, Func_613dc
	ld l, $e0
	ld a, [hl]
	rra
	call c, Func_613dc
	ret
.asm_613a2
	ld hl, w1d000
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $20
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $40
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $60
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $80
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $a0
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $c0
	ld a, [hl]
	rra
	call c, Func_61513
	ld l, $e0
	ld a, [hl]
	rra
	call c, Func_61513
	ret
; 0x613dc

Func_613dc: ; 613dc (18:53dc)
	push hl
	inc l
	rla
	ld [w1d100 + $00], a
	ld a, [hli]
	ld [w1d100 + $01], a
	ld a, [hli]
	ld [w1d100 + $02], a
	ld a, [hli]
	ld [w1d100 + $03], a
	ld a, [hli]
	ld [w1d100 + $04], a
	ld a, [hli]
	ld [w1d100 + $05], a
	ld a, [hli]
	ld [w1d100 + $06], a
	ld a, [hli]
	ld [w1d100 + $07], a
	ld a, [hli]
	ld [w1d100 + $08], a
	ld a, [hli]
	ld [w1d100 + $09], a
	ld a, [hli]
	ld [w1d100 + $0a], a
	ld a, [hli]
	ld [w1d100 + $0b], a
	ld a, [hli]
	ld [w1d100 + $0c], a
	ld a, [hli]
	ld [w1d100 + $0d], a
	ld a, [hli]
	ld [w1d100 + $0e], a
	ld a, [hli]
	ld [w1d100 + $0f], a
	ld a, [hli]
	ld [w1d100 + $10], a
	ld a, [hli]
	ld [w1d100 + $11], a
	ld a, [hli]
	ld [w1d100 + $12], a
	ld a, [hli]
	ld [w1d100 + $13], a
	ld a, [hli]
	ld [w1d100 + $14], a
	ld a, [hli]
	ld [w1d100 + $15], a
	ld a, [hli]
	ld [w1d100 + $16], a
	ld a, [hli]
	ld [w1d100 + $17], a
	ld a, [hli]
	ld [w1d100 + $18], a
	ld a, [hli]
	ld [w1d100 + $19], a
	ld a, [hli]
	ld [w1d100 + $1a], a
	ld a, [hli]
	ld [w1d100 + $1b], a
	ld a, [hli]
	ld [w1d100 + $1c], a
	ld a, [hli]
	ld [w1d100 + $1d], a
	ld a, [hli]
	ld [w1d100 + $1e], a
	ld a, [hl]
	ld [w1d100 + $1f], a

	call Func_61760
	ld a, [w1d100 + $07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [w1d100 + $1e]
	ldh [hCallFuncPointer], a
	ld a, [w1d100 + $1f]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call Func_312f
	call Func_6307b
	ld hl, w1d100 + $d
	ld a, [wTempSCY]
	ld b, a
	ld a, [w1d100 + $03]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [w1d100 + $05]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [w1d100 + $00]
	and $df
	ld [hli], a
	inc l
	inc l
	ld a, [w1d100 + $03]
	ld [hli], a
	ld a, [w1d100 + $04]
	ld [hli], a
	ld a, [w1d100 + $05]
	ld [hli], a
	ld a, [w1d100 + $06]
	ld [hli], a
	ld a, [w1d100 + $07]
	ld [hli], a
	ld a, [w1d100 + $08]
	ld [hli], a
	ld a, [w1d100 + $09]
	ld [hli], a
	ld a, [w1d100 + $0a]
	ld [hli], a
	ld a, [w1d100 + $0b]
	ld [hli], a
	ld a, [w1d100 + $0c]
	ld [hli], a
	ld a, [w1d100 + $0d]
	ld [hli], a
	ld a, [w1d100 + $0e]
	ld [hli], a
	ld a, [w1d100 + $0f]
	ld [hli], a
	ld a, [w1d100 + $10]
	ld [hli], a
	ld a, [w1d100 + $11]
	ld [hli], a
	ld a, [w1d100 + $12]
	ld [hli], a
	ld a, [w1d100 + $13]
	ld [hli], a
	ld a, [w1d100 + $14]
	ld [hli], a
	ld a, [w1d100 + $15]
	ld [hli], a
	ld a, [w1d100 + $16]
	ld [hli], a
	ld a, [w1d100 + $17]
	ld [hli], a
	ld a, [w1d100 + $18]
	ld [hli], a
	ld a, [w1d100 + $19]
	ld [hli], a
	ld a, [w1d100 + $1a]
	ld [hli], a
	ld a, [w1d100 + $1b]
	ld [hli], a
	ld a, [w1d100 + $1c]
	ld [hli], a
	inc l
	ld a, [w1d100 + $1e]
	ld [hli], a
	ld a, [w1d100 + $1f]
	ld [hl], a
	ret
; 0x61513

Func_61513: ; 61513 (18:5513)
	push hl
	inc l
	rla
	ld [w1d100 + $00], a
	ld a, [hli]
	ld [w1d100 + $01], a
	ld a, [hli]
	ld [w1d100 + $02], a
	ld a, [hli]
	ld [w1d100 + $03], a
	ld a, [hli]
	ld [w1d100 + $04], a
	ld a, [hli]
	ld [w1d100 + $05], a
	ld a, [hli]
	ld [w1d100 + $06], a
	ld a, [hli]
	ld [w1d100 + $07], a
	ld a, [hli]
	ld [w1d100 + $08], a
	ld a, [hli]
	ld [w1d100 + $09], a
	ld a, [hli]
	ld [w1d100 + $0a], a
	ld a, [hli]
	ld [w1d100 + $0b], a
	ld a, [hli]
	ld [w1d100 + $0c], a
	ld a, [hli]
	ld [w1d100 + $0d], a
	ld a, [hli]
	ld [w1d100 + $0e], a
	ld a, [hli]
	ld [w1d100 + $0f], a
	ld a, [hli]
	ld [w1d100 + $10], a
	ld a, [hli]
	ld [w1d100 + $11], a
	ld a, [hli]
	ld [w1d100 + $12], a
	ld a, [hli]
	ld [w1d100 + $13], a
	ld a, [hli]
	ld [w1d100 + $14], a
	ld a, [hli]
	ld [w1d100 + $15], a
	ld a, [hli]
	ld [w1d100 + $16], a
	ld a, [hli]
	ld [w1d100 + $17], a
	ld a, [hli]
	ld [w1d100 + $18], a
	ld a, [hli]
	ld [w1d100 + $19], a
	ld a, [hli]
	ld [w1d100 + $1a], a
	ld a, [hli]
	ld [w1d100 + $1b], a
	ld a, [hli]
	ld [w1d100 + $1c], a
	ld a, [hli]
	ld [w1d100 + $1d], a
	ld a, [hli]
	ld [w1d100 + $1e], a
	ld a, [hl]
	ld [w1d100 + $1f], a
	ld hl, w1d100 + $1a
	bit 5, [hl]
	jr z, .asm_615b4

	ld a, [w1d100 + $07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [w1d100 + $1e]
	ldh [hCallFuncPointer], a
	ld a, [w1d100 + $1f]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.asm_615b4
	call Func_3104
	call Func_6307b
	ld hl, w1d100 + $d
	ld a, [wTempSCY]
	ld b, a
	ld a, [w1d100 + $03]
	add $10
	sub b
	ld [hli], a
	ld a, [wTempSCX]
	ld b, a
	ld a, [w1d100 + $05]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [w1d100 + $00]
	and $df
	ld [hli], a
	inc l
	inc l
	ld a, [w1d100 + $03]
	ld [hli], a
	ld a, [w1d100 + $04]
	ld [hli], a
	ld a, [w1d100 + $05]
	ld [hli], a
	ld a, [w1d100 + $06]
	ld [hli], a
	ld a, [w1d100 + $07]
	ld [hli], a
	ld a, [w1d100 + $08]
	ld [hli], a
	ld a, [w1d100 + $09]
	ld [hli], a
	ld a, [w1d100 + $0a]
	ld [hli], a
	ld a, [w1d100 + $0b]
	ld [hli], a
	ld a, [w1d100 + $0c]
	ld [hli], a
	ld a, [w1d100 + $0d]
	ld [hli], a
	ld a, [w1d100 + $0e]
	ld [hli], a
	ld a, [w1d100 + $0f]
	ld [hli], a
	ld a, [w1d100 + $10]
	ld [hli], a
	ld a, [w1d100 + $11]
	ld [hli], a
	ld a, [w1d100 + $12]
	ld [hli], a
	ld a, [w1d100 + $13]
	ld [hli], a
	ld a, [w1d100 + $14]
	ld [hli], a
	ld a, [w1d100 + $15]
	ld [hli], a
	ld a, [w1d100 + $16]
	ld [hli], a
	ld a, [w1d100 + $17]
	ld [hli], a
	ld a, [w1d100 + $18]
	ld [hli], a
	ld a, [w1d100 + $19]
	ld [hli], a
	ld a, [w1d100 + $1a]
	ld [hli], a
	ld a, [w1d100 + $1b]
	ld [hli], a
	ld a, [w1d100 + $1c]
	ld [hli], a
	inc l
	ld a, [w1d100 + $1e]
	ld [hli], a
	ld a, [w1d100 + $1f]
	ld [hl], a
	ret
; 0x6164e

Func_6164e: ; 6164e (18:564e)
	ld hl, w1d000
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_6165f
	ld e, $0d
	ld l, $07
	call Func_3000

.asm_6165f
	ld hl, w1d020Unk00
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_61670
	ld e, $2d
	ld l, $27
	call Func_3000

.asm_61670
	ld hl, w1d040
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_61681
	ld e, $4d
	ld l, $47
	call Func_3000

.asm_61681
	ld hl, w1d060Unk00
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_61692
	ld e, $6d
	ld l, $67
	call Func_3000

.asm_61692
	ld hl, w1d080Unk00
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_616a3
	ld e, $8d
	ld l, $87
	call Func_3000

.asm_616a3
	ld hl, w1d0a0Unk00
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_616b4
	ld e, $ad
	ld l, $a7
	call Func_3000

.asm_616b4
	ld hl, w1d0c0Unk00
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_616c5
	ld e, $cd
	ld l, $c7
	call Func_3000

.asm_616c5
	ld hl, w1d0e0
	ld a, [hl]
	and $93
	cp $83
	jr nz, .asm_616d6
	ld e, $ed
	ld l, $e7
	call Func_3000

.asm_616d6
	ret
; 0x616d7

Func_616d7: ; 616d7 (18:56d7)
	ld hl, w1d000
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_616e8
	ld e, $0d
	ld l, $07
	call Func_3000

.asm_616e8
	ld hl, w1d020Unk00
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_616f9
	ld e, $2d
	ld l, $27
	call Func_3000

.asm_616f9
	ld hl, w1d040
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_6170a
	ld e, $4d
	ld l, $47
	call Func_3000

.asm_6170a
	ld hl, w1d060Unk00
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_6171b
	ld e, $6d
	ld l, $67
	call Func_3000

.asm_6171b
	ld hl, w1d080Unk00
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_6172c
	ld e, $8d
	ld l, $87
	call Func_3000

.asm_6172c
	ld hl, w1d0a0Unk00
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_6173d
	ld e, $ad
	ld l, $a7
	call Func_3000

.asm_6173d
	ld hl, w1d0c0Unk00
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_6174e
	ld e, $cd
	ld l, $c7
	call Func_3000

.asm_6174e
	ld hl, w1d0e0
	ld a, [hl]
	and $93
	cp $03
	jr nz, .asm_6175f
	ld e, $ed
	ld l, $e7
	call Func_3000

.asm_6175f
	ret
; 0x61760

Func_61760: ; 61760 (18:5760)
	ld a, [w1d100 + $1c]
	and a
	ret z
	bit 7, a
	jr z, .jump
	dec a
	cp $80
	jr nz, .asm_6176f
	xor a
.asm_6176f
	ld [w1d100 + $1c], a
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
	ld hl, w1d000
	ld e, $05
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $20
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $40
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $60
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $80
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $a0
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $c0
	ld a, [hl]
	and e
	cp e
	jr z, .asm_6191c
	ld l, $e0
	ld a, [hl]
	and e
	cp e
	ret nz

.asm_6191c
	push hl
	ld a, l
	add $08
	ld l, a
	ld a, [hli]
	ldh [hffa0], a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	add $2a
	add b
	ld b, a
	ld a, [hli]
	add $2a
	add c
	ld c, a
	ld a, [hl]
	add $2a
	add d
	ld d, a
	ld a, [hli]
	add $2a
	add e
	ld e, a
	ld a, l
	add $0c
	ld l, a
	ld a, [hl]
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
	ld [hli], a
	ld a, $29
	ld [hli], a
	ld a, $09
	ld [hli], a
	ld a, $29
	ld [hli], a
	jr .asm_619a6
.asm_61965
	ld a, $28
	ld [hli], a
	ld a, $08
	ld [hli], a
	ld a, $28
	ld [hli], a
	ld a, $29
	ld [hli], a
	jr .asm_619a6
.asm_61973
	rla
	jr c, .asm_61984
	ld a, $29
	ld [hli], a
	ld a, $28
	ld [hli], a
	ld a, $08
	ld [hli], a
	ld a, $28
	ld [hli], a
	jr .asm_619a6
.asm_61984
	ld a, $29
	ld [hli], a
	ld a, $09
	ld [hli], a
	ld a, $29
	ld [hli], a
	ld a, $28
	ld [hli], a
	jr .asm_619a6
.asm_61992
	rra
	ld hl, $ffa1
	jr c, .asm_619a0
	ld a, $09
	ld [hli], a
	ld a, $08
	ld [hli], a
	jr .asm_619a6
.asm_619a0
	ld a, $08
	ld [hli], a
	ld a, $09
	ld [hli], a
.asm_619a6
	ld a, [w1d000]
	and $1f
	cp $03
	jr nz, .asm_61a16
	ld a, [$d00d]
	add $2a
	ld h, a
	ld a, [$d00e]
	add $2a
	ld l, a
	ld a, [$d00a]
	add h
	sub b
	jr c, .asm_61a16
	ld a, [$d009]
	add h
	sub c
	jr nc, .asm_61a16
	ld a, [$d00c]
	add l
	sub d
	jr c, .asm_61a16
	ld a, [$d00b]
	add l
	sub e
	jr nc, .asm_61a16
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d28
	cp $48
	jp z, Func_61d28
	ld a, [$d008]
	rla
	jp c, Func_61df0
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $1b
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $00
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61a16
	ld a, [$d020]
	and $1f
	cp $03
	jr nz, .asm_61a86
	ld a, [$d02d]
	add $2a
	ld h, a
	ld a, [$d02e]
	add $2a
	ld l, a
	ld a, [$d02a]
	add h
	sub b
	jr c, .asm_61a86
	ld a, [$d029]
	add h
	sub c
	jr nc, .asm_61a86
	ld a, [$d02c]
	add l
	sub d
	jr c, .asm_61a86
	ld a, [$d02b]
	add l
	sub e
	jr nc, .asm_61a86
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d41
	cp $48
	jp z, Func_61d41
	ld a, [$d028]
	rla
	jp c, Func_61e14
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $3b
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $20
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61a86
	ld a, [$d040]
	and $1f
	cp $03
	jr nz, .asm_61af6
	ld a, [$d04d]
	add $2a
	ld h, a
	ld a, [$d04e]
	add $2a
	ld l, a
	ld a, [$d04a]
	add h
	sub b
	jr c, .asm_61af6
	ld a, [$d049]
	add h
	sub c
	jr nc, .asm_61af6
	ld a, [$d04c]
	add l
	sub d
	jr c, .asm_61af6
	ld a, [$d04b]
	add l
	sub e
	jr nc, .asm_61af6
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d5a
	cp $48
	jp z, Func_61d5a
	ld a, [$d048]
	rla
	jp c, Func_61e38
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $5b
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $40
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61af6
	ld a, [$d060]
	and $1f
	cp $03
	jr nz, .asm_61b66
	ld a, [$d06d]
	add $2a
	ld h, a
	ld a, [$d06e]
	add $2a
	ld l, a
	ld a, [$d06a]
	add h
	sub b
	jr c, .asm_61b66
	ld a, [$d069]
	add h
	sub c
	jr nc, .asm_61b66
	ld a, [$d06c]
	add l
	sub d
	jr c, .asm_61b66
	ld a, [$d06b]
	add l
	sub e
	jr nc, .asm_61b66
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d73
	cp $48
	jp z, Func_61d73
	ld a, [$d068]
	rla
	jp c, Func_61e5c
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $7b
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $60
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61b66
	ld a, [$d080]
	and $1f
	cp $03
	jr nz, .asm_61bd6
	ld a, [$d08d]
	add $2a
	ld h, a
	ld a, [$d08e]
	add $2a
	ld l, a
	ld a, [$d08a]
	add h
	sub b
	jr c, .asm_61bd6
	ld a, [$d089]
	add h
	sub c
	jr nc, .asm_61bd6
	ld a, [$d08c]
	add l
	sub d
	jr c, .asm_61bd6
	ld a, [$d08b]
	add l
	sub e
	jr nc, .asm_61bd6
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61d8c
	cp $48
	jp z, Func_61d8c
	ld a, [$d088]
	rla
	jp c, Func_61e80
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $9b
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $80
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61bd6
	ld a, [$d0a0]
	and $1f
	cp $03
	jr nz, .asm_61c46
	ld a, [$d0ad]
	add $2a
	ld h, a
	ld a, [$d0ae]
	add $2a
	ld l, a
	ld a, [$d0aa]
	add h
	sub b
	jr c, .asm_61c46
	ld a, [$d0a9]
	add h
	sub c
	jr nc, .asm_61c46
	ld a, [$d0ac]
	add l
	sub d
	jr c, .asm_61c46
	ld a, [$d0ab]
	add l
	sub e
	jr nc, .asm_61c46
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61da5
	cp $48
	jp z, Func_61da5
	ld a, [$d0a8]
	rla
	jp c, Func_61ea4
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $bb
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $a0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61c46
	ld a, [$d0c0]
	and $1f
	cp $03
	jr nz, .asm_61cb6
	ld a, [$d0cd]
	add $2a
	ld h, a
	ld a, [$d0ce]
	add $2a
	ld l, a
	ld a, [$d0ca]
	add h
	sub b
	jr c, .asm_61cb6
	ld a, [$d0c9]
	add h
	sub c
	jr nc, .asm_61cb6
	ld a, [$d0cc]
	add l
	sub d
	jr c, .asm_61cb6
	ld a, [$d0cb]
	add l
	sub e
	jr nc, .asm_61cb6
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61dbe
	cp $48
	jp z, Func_61dbe
	ld a, [$d0c8]
	rla
	jp c, Func_61ec8
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $db
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $c0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
.asm_61cb6
	ld a, [$d0e0]
	and $1f
	cp $03
	jr nz, .asm_61d26
	ld a, [$d0ed]
	add $2a
	ld h, a
	ld a, [$d0ee]
	add $2a
	ld l, a
	ld a, [$d0ea]
	add h
	sub b
	jr c, .asm_61d26
	ld a, [$d0e9]
	add h
	sub c
	jr nc, .asm_61d26
	ld a, [$d0ec]
	add l
	sub d
	jr c, .asm_61d26
	ld a, [$d0eb]
	add l
	sub e
	jr nc, .asm_61d26
	pop hl
	res 2, [hl]
	ld a, l
	add $1b
	ld l, a
	ld a, [hl]
	and $fe
	cp $4a
	jp z, Func_61dd7
	cp $48
	jp z, Func_61dd7
	ld a, [$d0e8]
	rla
	jp c, Func_61eec
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $fb
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
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $e0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret

.asm_61d26
	pop hl
	ret
; 0x61d28

Func_61d28: ; 61d28 (18:5d28)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $1b
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $00
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61d41

Func_61d41: ; 61d41 (18:5d41)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $3b
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $20
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61d5a

Func_61d5a: ; 61d5a (18:5d5a)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $5b
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $40
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61d73

Func_61d73: ; 61d73 (18:5d73)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $7b
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $60
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61d8c

Func_61d8c: ; 61d8c (18:5d8c)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $9b
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $80
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61da5

Func_61da5: ; 61da5 (18:5da5)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $bb
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $a0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61dbe

Func_61dbe: ; 61dbe (18:5dbe)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $db
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $c0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61dd7

Func_61dd7: ; 61dd7 (18:5dd7)
	xor a
	ld [wca9a], a
	ldh a, [$ffa2]
	ld [hl], a
	ld l, $fb
	ldh a, [$ffa1]
	ld [hl], a
	ld l, $e0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61df0

Func_61df0: ; 61df0 (18:5df0)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $1b
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $00
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61e14

Func_61e14: ; 61e14 (18:5e14)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $3b
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $20
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61e38

Func_61e38: ; 61e38 (18:5e38)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $5b
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $40
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61e5c

Func_61e5c: ; 61e5c (18:5e5c)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $7b
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $60
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61e80

Func_61e80: ; 61e80 (18:5e80)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $9b
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $80
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61ea4

Func_61ea4: ; 61ea4 (18:5ea4)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $bb
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $a0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61ec8

Func_61ec8: ; 61ec8 (18:5ec8)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $db
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $c0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61eec

Func_61eec: ; 61eec (18:5eec)
	ldh a, [$ffa4]
	ld [hl], a
	ld l, $fb
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
	ldh a, [$ffa3]
	ld [hl], a
	ld l, $e0
	set 3, [hl]
	ld a, $01
	ldh [hSoundID + 0], a
	ld a, $16
	ldh [hSoundID + 1], a
	ret
; 0x61f10

Func_61f10: ; 61f10 (18:5f10)
	xor a
	call Func_61f41 ; clears whole w1d000
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
	call Func_61f41 ; clears whole w1d000
	call Func_61f4a ; clears whole w1d120
	ld [w1d141], a
	ld [w1d142], a
	ld [w1d143], a
	ld [wNumShootGoals], a
	ld [w1d145], a
	ret
; 0x61f41

Func_61f41: ; 61f41 (18:5f41)
	ld hl, w1d000
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
	ld hl, $d103
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
	ld hl, $d100
	set 1, [hl]
	jr .asm_6310b
.asm_630fd
	ld a, [$d11b]
	and $fe
	cp $48
	jr z, .asm_6310b
.asm_63106
	ld hl, $d100
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
	ld a, [$d11a]
	and $1f
	cp $10
	ret nc
	ld hl, $d102
	and a
	jr z, .asm_6319c
	farcall Func_baee
	ret
.asm_6319c
	xor a
	ld [$d100], a
.asm_631a0
	ret
; 0x631a1

	INCROM $631a1, $63936