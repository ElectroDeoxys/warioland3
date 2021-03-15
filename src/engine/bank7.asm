Func_1c000: ; 1c000 (7:4000)
	ld hl, wcac2
	ld a, [hl]
	and a
	jr z, .asm_1c008
	dec [hl]
.asm_1c008
	call Func_1f6dc
	call Func_1f64a
	ld a, [wca83]
	cp $30
	jr c, .asm_1c04d
	cp $60
	jr c, .asm_1c03d
	cp $b0
	jr c, .asm_1c02d
	farcall Func_1ec000
	ret

.asm_1c02d
	farcall Func_28000
	ret

.asm_1c03d
	farcall Func_19c1b
	ret

.asm_1c04d
	jumptable

	dw $40b6
	dw $41ab
	dw $4244
	dw Func_156d
	dw $4369
	dw $46ed
	dw $47c3
	dw $48df
	dw $4bb9
	dw $4caf
	dw $4e42
	dw $4f53
	dw $5008
	dw $50ba
	dw $5297
	dw $5354
	dw $5395
	dw $5455
	dw $546d
	dw $54a7
	dw $5522
	dw $5627
	dw $5766
	dw $57c1
	dw $580d
	dw $585c
	dw $58f8
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw $5916
	dw $5943
	dw $5995
	dw $5a4f
	dw $5cfc
	dw $5d7f
	dw $5e88
	dw $5eaa
	dw $5ecc
	dw $5fd4
	dw $609d
	dw $61e9
	dw $62c5
	dw $6347
	dw $63e8
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
; 1c0b6

	INCROM $1c0b6, $1def1

Func_1def1: ; 1def1 (7:5ef1)
	ld a, $27
	ld [wca83], a
	xor a
	ld [wceed], a
	ld [wca8b], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wca84], a
	ld [wca85], a
	ld [wca86], a
	ld [wca9a], a
	ld a, $01
	ld [wca9d], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $09
	ld [wca7b], a
	ld a, $50
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $64
	ld [wca7f + 0], a
	ld a, $4a
	ld [wca7f + 1], a
	ld a, [wc189]
	bit 1, a
	jr nz, .asm_1df8b
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add $0c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $06
	farcall Func_c9f3

	ld a, $00
	ld [wca69], a
	ld a, $67
	ld [wFramesetPtr + 0], a
	ld a, $08
	ld [wFramesetPtr + 1], a
	jr .asm_1dfc4
.asm_1df8b
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, $05
	farcall Func_c9f3

	ld a, $01
	ld [wca69], a
	ld a, HIGH(Frameset_1671d)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1671d)
	ld [wFramesetPtr + 1], a
.asm_1dfc4
	ld a, BANK(Frameset_1671d)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1dfd4

	INCROM $1dfd4, $1e855

Func_1e855: ; 1e855 (7:6855)
	ld a, [wc189]
	and a
	jp nz, Func_1def1
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $12
	ld [wca83], a
	xor a
	ld [wca84], a
	ld [wca85], a
	ld [wca9a], a
	ld [wca89], a
	ld [wca86], a
	ld [wca74], a
	ld [wca75], a
	ld a, $01
	ld [wca8b], a
	ld a, [wc093]
	and $30
	jp nz, Func_1eb94

	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $42
	ld [wca7f + 0], a
	ld a, $6c
	ld [wca7f + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wca69]
	cp $01
	jr z, .asm_1e8d3
	ld a, HIGH(Frameset_14a38)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a38)
	ld [wFramesetPtr + 1], a
	jr .asm_1e8dd
.asm_1e8d3
	ld a, HIGH(Frameset_14a3b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a3b)
	ld [wFramesetPtr + 1], a
.asm_1e8dd
	ld a, BANK(Frameset_14a3b)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1e8ed

	INCROM $1e8ed, $1e99b

Func_1e99b: ; 1e99b (7:699b)
	xor a
	ld [wca86], a
	ld a, $00
	ld [wca83], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wca75], a
	ld [wca74], a
	ld [wca84], a
	ld [wca85], a
	ld [wca96], a
	ld [wca8b], a
	ld [wca89], a
	ld [wca9a], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a

	farcall Func_1996e
	ld a, [wca83]
	cp $00
	ret nz

	ld a, b
	and a
	jp nz, Func_1e855
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $40
	ld [wca7f + 0], a
	ld a, $00
	ld [wca7f + 1], a
	ld a, [wca69]
	and a
	jr nz, .asm_1ea24
	ld a, HIGH(Frameset_14252)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14252)
	ld [wFramesetPtr + 1], a
	jr .asm_1ea2e
.asm_1ea24
	ld a, HIGH(Frameset_1425f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_1425f)
	ld [wFramesetPtr + 1], a
.asm_1ea2e
	ld a, BANK(Frameset_1425f)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1ea3e

	INCROM $1ea3e, $1eb94

Func_1eb94: ; 1eb94 (7:6b94)
	ld a, $ff
	ld [wca70], a
	ld a, $f1
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $13
	ld [wca83], a
	ld a, $01
	ld [wca8b], a
	xor a
	ld [wceed], a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wca84], a
	ld [wca85], a
	ld [wca89], a
	ld [wca9a], a
	ld [wceed], a

	ld a, $05
	ld [wca7e], a
	ld a, $42
	ld [wca7f + 0], a
	ld a, $6c
	ld [wca7f + 1], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, [wca69]
	cp $01
	jr z, .asm_1ec0d
	ld a, HIGH(Frameset_14a26)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a26)
	ld [wFramesetPtr + 1], a
.asm_1ebfd
	ld a, BANK(Frameset_14a26)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
.asm_1ec0d
	ld a, HIGH(Frameset_14a2f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14a2f)
	ld [wFramesetPtr + 1], a
	jr .asm_1ebfd
; 0x1ec19

	INCROM $1ec19, $1f64a

Func_1f64a: ; 1f64a (7:764a)
	ld a, [wca8c]
	and a
	ret z

	cp $16
	jr nc, .asm_1f68b
	cp $10
	jr nc, .asm_1f67c
	ld a, [wca83]
	cp $15
	jr z, .asm_1f67b
	cp $16
	jr z, .asm_1f67b
	ld a, $10
	ld [wca8c], a
	ld a, [wca79 + 0]
	cp $48
	jr nz, .asm_1f67b
	ld a, [wca79 + 1]
	cp $10
	jr nz, .asm_1f67b

	ld hl, Pals_c800
	call Func_1af6
.asm_1f67b
	ret

.asm_1f67c
	ld a, [wc08f]
	and $03
	ret nz
	ld a, [wca8c]
	inc a
	ld [wca8c], a
	jr .asm_1f6b9

.asm_1f68b
	ld a, [wc08f]
	and $01
	ret nz
	ld a, [wca8c]
	inc a
	ld [wca8c], a
	cp $28
	jr c, .asm_1f6b9
	xor a
	ld [wca8c], a
	ld [wca8d], a
	ld a, [wc093]
	and $b0
	ret nz

	farcall Func_1996e
	ret

.asm_1f6b9
	ld a, [wca8d]
	xor $01
	ld [wca8d], a
	ret
; 0x1f6c2

	INCROM $1f6c2, $1f6dc

Func_1f6dc: ; 1f6dc (7:76dc)
	ld a, [wced4]
	and a
	ret nz

	ld hl, wca97
	ld a, [hl]
	and a
	jr z, .asm_1f726
	cp $10
	jr c, .asm_1f72b
	ld a, [wca99]
	and a
	jr nz, .asm_1f72b
	ld a, [wca98]
	and a
	jr nz, .asm_1f72b
	ld a, [wca74]
	and a
	jr nz, .asm_1f72b
	ld a, [wc0db]
	and a
	jr nz, .asm_1f72b
	ld a, [wca8e]
	and a
	jr nz, .asm_1f72b
	ld a, [wc0d7]
	and a
	jr nz, .asm_1f72b
	ld a, [wca8a]
	and a
	jr nz, .asm_1f72b
	ld a, [wcac9]
	and a
	jr nz, .asm_1f72b
	ld a, [wca83]
	cp $2b
	jr z, .asm_1f72b
	jr .asm_1f73c
	ret

.asm_1f726
	xor a
	ld [wca98], a
	ret

.asm_1f72b
	dec [hl]
	ld a, [hl]
	and $02
	jr nz, .asm_1f736
	xor a
	ld [wc0bc], a
	ret

.asm_1f736
	ld a, $02
	ld [wc0bc], a
	ret

.asm_1f73c
	ld a, [wca83]
	cp $3a
	jp z, Func_1f7e6
	cp $3b
	jp z, Func_1f7e6
	cp $4c
	jp z, Func_1f7e6
	ld a, $2b
	ld [wca83], a
	xor a
	ld [wca75], a
	ld [wca74], a
	ld [wca89], a
	ld [wca9d], a
	ld [wca9a], a
	ld a, $f1
	ld [wca6f], a
	ld a, [wca8b]
	and a
	jr nz, .asm_1f77d
	ld a, $e5
	ld [wca6f], a
	ld a, $0a
	ld [wca75], a
	ld a, $01
	ld [wca74], a
.asm_1f77d
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a

	xor a
	ld [wca84], a
	ld [wca85], a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $59
	ld [wca7f + 0], a
	ld a, $55
	ld [wca7f + 1], a

	ld a, [wca69]
	and a
	jr nz, .asm_1f7cc
	ld a, HIGH(Frameset_15f70)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f70)
	ld [wFramesetPtr + 1], a
	jr .asm_1f7d6
.asm_1f7cc
	ld a, HIGH(Frameset_15f7f)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15f7f)
	ld [wFramesetPtr + 1], a
.asm_1f7d6
	ld a, BANK(Frameset_15f7f)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1f7e6

Func_1f7e6: ; 1f7e6 (7:77e6)
	ld a, $3c
	ld [wca83], a
	ld a, $01
	ldh [hffb5], a
	ld a, $0c
	ldh [hffb6], a
	xor a
	ld [wceed], a
	ld [wca84], a
	ld [wca85], a
	ld [wca99], a
	inc a
	ld [wca74], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, HIGH(Frameset_15948)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_15948)
	ld [wFramesetPtr + 1], a
	ld a, BANK(Frameset_15948)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1f825

	INCROM $1f825, $20000
