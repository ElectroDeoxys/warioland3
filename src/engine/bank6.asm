Func_18000: ; 18000 (6:4000)
	xor a
	ld [wc0dd], a
	ld a, [wcce9]
	sramswitch
	ld hl, wccea
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	add a
	ld e, a
	ld d, $00
	ld hl, wPermissionMap
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 0x18020

Func_18020: ; 18020 (6:4020)
	xor a ; SRAM0
	sramswitch
	xor a
	ld [wc0d8], a
	ld [wc0d9], a
	ld [wc18d], a
	ret
; 0x18032

	INCROM $18032, $19942

Func_19942: ; 19942 (6:5942)
	ld a, [wca8e]
	cp $07
	jr z, .asm_1994e
	ld a, $01
	ld [wc0d8], a
.asm_1994e
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19beb
	ret
; 0x1996e

Func_1996e: ; 1996e (6:596e)
	ld a, $01
	ld [wced2], a
	call Func_19942
	and a
	ret nz
	xor a
	ld [wced2], a
	ld a, [wca8e]
	cp $07
	jr z, .asm_19988
	ld a, $01
	ld [wc0d8], a
.asm_19988
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	and a
	ret nz
	ld a, [wca8e]
	cp $07
	jr z, .asm_199c0
	ld a, $01
	ld [wc0d8], a
.asm_199c0
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	ret
; 0x199e9

	INCROM $199e9, $19b9b

Func_19b9b: ; 19b9b (6:5b9b)
	ld hl, hffa8
	call Func_bdb
	ld a, $08
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bab

	INCROM $19bab, $19beb

Func_19beb: ; 19beb (6:5beb)
	ld hl, hffa8
	call Func_bdb
	ld a, $20
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bfb

	INCROM $19bfb, $19c1b

Func_19c1b: ; 19c1b (6:5c1b)
	ld a, [wca83]
	sub $30
	jumptable

	dw $5ce7
	dw $5ef1
	dw $6046
	dw $6077
	dw $60b4
	dw $617e
	dw $61c5
	dw $6296
	dw $62d6
	dw $6394
	dw $6436
	dw $651d
	dw $655c
	dw $6617
	dw $66b6
	dw $67d6
	dw $689e
	dw $68ff
	dw $6980
	dw $69e9
	dw $6a5c
	dw $6ac9
	dw $6b44
	dw $68ff
	dw $6980
	dw $6bb1
	dw $6bf4
	dw $6c73
	dw $6d7d
	dw $6dfb
	dw $6ed0
	dw $6f98
	dw $700f
	dw $70a9
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
; 0x19c81

	INCROM $19c81, $1ad9a

Func_1ad9a: ; 1ad9a (6:6d9a)
	ld a, $4d
	ld [wca83], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wca84], a
	ld a, $03
	ld [wca9b], a

	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wca7e], a
	ld a, $4a
	ld [wca7f + 0], a
	ld a, $82
	ld [wca7f + 1], a

	ld a, [wca69]
	and a
	jr nz, .asm_1ade1
	ld a, HIGH(Frameset_14d0b)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d0b)
	ld [wFramesetPtr + 1], a
	jr .asm_1adeb
.asm_1ade1
	ld a, HIGH(Frameset_14d10)
	ld [wFramesetPtr + 0], a
	ld a, LOW(Frameset_14d10)
	ld [wFramesetPtr + 1], a
.asm_1adeb
	ld a, BANK(Frameset_14d10)
	ldh [hCallFuncBank], a
	call_hram Func_e53
	ret
; 0x1adfb

	INCROM $1adfb, $1c000
