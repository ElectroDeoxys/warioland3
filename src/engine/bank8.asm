Func_20000: ; 20000 (8:4000)
	ld a, [wca8a]
	and a
	ret nz
	ld a, [wca73]
	and a
	ret nz
	ld a, [wca9b]
	and a
	ret nz
	xor a
	ld [wcac9], a

	ld hl, w1d000
.asm_20016
	ld a, h
	cp HIGH(w1d100)
	ret z
	ld [wc1b6 + 0], a
	ld a, l
	ld [wc1b6 + 1], a
	ld a, [hl]
	and $03
	cp $03
	jr z, .asm_20036
.asm_20028
	ld a, [wc1b6 + 0]
	ld h, a
	ld a, [wc1b6 + 1]
	ld l, a
	ld de, UNK_STRUCT2_LENGTH
	add hl, de
	jr .asm_20016

.asm_20036
	push hl
	ld e, UNK_STRUCT2_UNK_1D
	ld d, $00
	add hl, de
	ld a, [hld]
	ld [wc1b8], a
	ld a, [hl] ; UNK_STRUCT2_UNK_1c
	pop hl
	and a
	jr nz, .asm_20028

	ld e, UNK_STRUCT2_UNK_08
	ld d, $00
	add hl, de
	ld a, [hli] ; UNK_STRUCT2_UNK_08
	ld [wc1b9], a
	ld a, [hli] ; UNK_STRUCT2_UNK_09
	ld [wc1ba], a
	ld a, [hli] ; UNK_STRUCT2_UNK_0A
	ld [wc1bb], a
	ld a, [hli] ; UNK_STRUCT2_UNK_0B
	ld [wc1bc], a
	ld a, [hli] ; UNK_STRUCT2_UNK_0C
	ld [wc1bd], a
	ld a, [hli] ; UNK_STRUCT2_UNK_0D
	ld [wc1be], a
	ld a, [hl] ; UNK_STRUCT2_UNK_0E
	ld [wc1bf], a

	ld e, UNK_STRUCT2_UNK_1A - UNK_STRUCT2_UNK_0E
	ld d, $00
	add hl, de
	ld a, [hl] ; UNK_STRUCT2_UNK_1A
	bit 7, a
	jr nz, .asm_20074
	ld a, $00
	jr .asm_20076
.asm_20074
	ld a, $01
.asm_20076
	ld [wc1c6], a

	xor a
	ld [wc1c0], a
	ld a, $ff
	ld [wc1c2], a
	ld [wc1c1], a
	ld [wc1c3], a
	ld [wc1c4], a

	ld e, $d0
	ld hl, wc1ba
	ld a, [wc1be]
	add [hl]
	sub e
	ld b, a ; wc1ba + wc1be - $d0
	ld hl, wca70
	ld a, [wWarioYPos]
	add [hl]
	sub e
	sub b
	jp c, .asm_20028
	ld c, a
	ld hl, wca6f
	ld a, [wWarioYPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bb
	ld a, [wc1be]
	add [hl]
	sub e
	sub b
	jp c, .asm_20028
	ld d, a
	ld a, d
	sub c
	jr c, .asm_200c9
	jr z, .asm_200c5

	ld a, c
	ld [wc1c1], a
	jr .asm_200cd
.asm_200c5
	ld a, c
	ld [wc1c1], a
.asm_200c9
	ld a, d
	ld [wc1c2], a
.asm_200cd

	ld hl, wc1bc
	ld a, [wc1bf]
	add [hl]
	sub e
	ld b, a
	ld hl, wca72
	ld a, [wWarioXPos]
	add [hl]
	sub e
	sub b
	jp c, .asm_20028
	ld c, a
	ld hl, wca71
	ld a, [wWarioXPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bd
	ld a, [wc1bf]
	add [hl]
	sub e
	sub b
	jp c, .asm_20028
	ld d, a
	sub c
	jr c, .asm_20108
	jr z, .asm_20104

	ld a, c
	ld [wc1c3], a
	jr .asm_2010c
.asm_20104
	ld a, c
	ld [wc1c3], a
.asm_20108
	ld a, d
	ld [wc1c4], a
.asm_2010c

	ld hl, wc1c0
	ld a, $f0
	ld [hl], a
	ld a, [wc1c4]
	ld b, a
	ld a, [wc1c3]
	ld c, a
	cp b
	jr z, .asm_20126
	jr c, .asm_20123
	res 5, [hl]
	jr .asm_20126
.asm_20123
	res 4, [hl]
	ld b, c
.asm_20126
	ld a, [wc1c2]
	ld d, a
	ld a, [wc1c1]
	ld e, a
	cp d
	jr z, .asm_2013a
	jr c, .asm_20137
	res 6, [hl]
	jr .asm_2013a
.asm_20137
	res 7, [hl]
	ld d, e
.asm_2013a
	ld a, b
	cp d
	jr z, .asm_2014a
	jr c, .asm_20146
	res 4, [hl]
	res 5, [hl]
	jr .asm_2014a
.asm_20146
	res 6, [hl]
	res 7, [hl]
.asm_2014a
	ld a, [wc1b9]
	and $7f
	jumptable

	dw $4b6b
	dw $4d1d
	dw $4d20
	dw $4d47
	dw $4d6e
	dw $4d7e
	dw $4d81
	dw $4d8c
	dw $4deb
	dw $4e39
	dw $4e60
	dw $4e6a
	dw $4e77
	dw $4e82
	dw $4e97
	dw $4f6a
	dw $4fed
	dw $4ff4
	dw $4ffb
	dw $5002
	dw $501c
	dw $503c
	dw $505c
	dw $507c
	dw $5156
	dw $5245
	dw $5358
	dw $5433
	dw $5455
	dw $5548
	dw $5569
	dw $55a2
	dw $55e7
	dw $564f
	dw $5675
	dw $5774
	dw $57b9
	dw $5819
	dw $5853
	dw $5887
	dw $58e7
	dw $5999
	dw $4e0f
	dw $5a4f
	dw $5a47
	dw $5a52
	dw $5a8c
	dw $5a97
	dw $5ac3
	dw $5af1
	dw $5b08
	dw $5b0b
	dw $5b2b
	dw $5b42
	dw $5b78
	dw $5573
	dw $5b89
	dw $5c17
	dw $5c26
	dw $5c56
	dw $5c61
	dw $5c86
	dw $5c98
	dw $5ca8
	dw $5ccf
	dw $5ce9
	dw $5cf8
	dw $47ed
	dw $5cfd
	dw $5d17
	dw $5d3b
	dw $5d64
	dw $5d6f
	dw $5d88
	dw $5dd3
	dw $5df8
	dw $5e2e
	dw $5e3e
	dw $5e9c
	dw $5ea6
	dw $5ecd
	dw $5f01
	dw $5f28
	dw Func_20202
	dw Func_20202
	dw Func_20202
	dw Func_20202
	dw Func_20202
	dw Func_20202
; 0x20202

Func_20202: ; 20202 (8:4202)
	ret
; 0x20203

	INCROM $20203, $206eb

Func_206eb: ; 206eb (8:46eb)
	ld a, [wca8e]
	cp $0e
	call z, Func_16d9
	call Func_1079
	call Func_161a
	ld a, $01
	ld [wca8c], a

	load_sfx SFX_13

	ld a, ST_STUNG
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca9d], a
	ld [wIsSmashAttacking], a
	ld a, $6
	ld [wJumpVelIndex], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, [wca8b]
	and a
	jr z, .asm_20774
	ld a, $e5
	ld [wca6f], a

	ldh a, [hffa8]
	ldh [hffad], a
	ldh a, [hffa9]
	ldh [hffae], a
	ldh a, [hffaa]
	ldh [hffaf], a
	ldh a, [hffab]
	ldh [hffb0], a

	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_20780

	xor a
	ld [wca8b], a
	ldh a, [hffad]
	ldh [hffa8], a
	ldh a, [hffae]
	ldh [hffa9], a
	ldh a, [hffaf]
	ldh [hffaa], a
	ldh a, [hffb0]
	ldh [hffab], a

.asm_20774
	ld a, $e5
	ld [wca6f], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	jr .asm_20799

.asm_20780
	ld a, $f1
	ld [wca6f], a
	xor a ; JUMP_VEL_NONE
	ld [wJumpVelTable], a

	ldh a, [hffad]
	ldh [hffa8], a
	ldh a, [hffae]
	ldh [hffa9], a
	ldh a, [hffaf]
	ldh [hffaa], a
	ldh a, [hffb0]
	ldh [hffab], a

.asm_20799
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_15955

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_207d3
	load_frameset_ptr Frameset_15f7f
	jr .asm_207dd
.asm_207d3
	load_frameset_ptr Frameset_15f70
.asm_207dd
	update_anim_1
	ret
; 0x207ed

	INCROM $207ed, $20ed3

SetState_OnFire: ; 20ed3 (8:4ed3)
	ld a, ST_ON_FIRE
	ld [wWarioState], a

	xor a
	ld [wca8d], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCycles], a
	ld [wca9a], a
	ld [wca89], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wca9d], a
	ld [wIsSmashAttacking], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, [wWarioStateCounter]
	and a
	ret nz

	ld hl, Pals_c820
	call Func_1af6

	ld a, $09
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	load_oam_ptr OAM_1673c

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_20f50
	load_frameset_ptr Frameset_16b38
	jr .asm_20f5a
.asm_20f50
	load_frameset_ptr Frameset_16b49
.asm_20f5a
	update_anim_1
	ret
; 0x20f6a

	INCROM $20f6a, $21f51

Func_21f51: ; 21f51 (8:5f51)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jr nz, .asm_21fa3
	ld b, $10
.asm_21f69
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21f9f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21f9f
	dec b
	jr nz, .asm_21f69
	ret

.asm_21fa3
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21fd6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21fd6
	ld b, $10
.asm_21fd8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2200e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2200e
	dec b
	jr nz, .asm_21fd8
	ret
; 0x22012

Func_22012: ; 22012 (8:6012)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2208a
	ld b, $10
.asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22068
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22068
	dec b
	jr nz, .asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret
; 0x2208a

Func_2208a: ; 2208a (8:608a)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wce35
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl

	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220bd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220bd
	ld b, $10
.asm_220bf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220f5
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220f5
	dec b
	jr nz, .asm_220bf
	pop af
	ldh [rSVBK], a
	ret
; 0x220fc

Func_220fc: ; 220fc (8:60fc)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2214e
	ld b, $10
.asm_22115
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2214a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2214a
	dec b
	jr nz, .asm_22115
	ret
; 0x2214e

Func_2214e: ; 2214e (8:614e)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22180
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22180
	ld b, $10
.asm_22182
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_221b7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_221b7
	dec b
	jr nz, .asm_22182
	ret
; 0x221bb

Func_221bb: ; 221bb (8:61bb)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_22217
	ld b, $10
.asm_221db
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22210
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22210
	dec b
	jr nz, .asm_221db
	pop af
	ldh [rSVBK], a
	ret
; 0x22217

Func_22217: ; 22217 (8:6217)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22249
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22249
	ld b, $10
.asm_2224b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22280
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22280
	dec b
	jr nz, .asm_2224b
	pop af
	ldh [rSVBK], a
	ret
; 0x22287
