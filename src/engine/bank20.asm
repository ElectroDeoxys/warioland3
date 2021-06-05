	INCROM $80000, $80366

Func_80366: ; 80366 (20:4366)
	ld hl, w2d00b + 1
	ld a, [hld]
	ld c, [hl]
	sla c
	rla
	sla c
	rla
	res 7, a ; 4 * w2d00b
	ld [w2d057], a
	ret
; 0x80377

	INCROM $80377, $80392

Func_80392: ; 80392 (20:4392)
	ld a, [wSubSequence]
	jumptable

	dw FastFadeToWhite
	dw Func_803f9
	dw SlowFadeFromWhite
	dw $44ec
	dw FastFadeToWhite
	dw $44f7
	dw SlowFadeFromWhite
	dw $4540
	dw FadeBGToWhite_Normal
	dw $455f
	dw DarkenBGToPal_Normal
	dw $45d7
	dw FadeBGToWhite_Normal
	dw $4dc0
	dw DarkenBGToPal_Normal
	dw $4dd0
	dw FadeBGToWhite_Normal
	dw Func_80d6c
	dw DarkenBGToPal_Normal
	dw $4d7c
	dw FadeBGToWhite_Normal
	dw $4db1
	dw FadeBGToWhite_Normal
	dw $4df3
	dw DarkenBGToPal_Normal
	dw $4e03
	dw FadeBGToWhite_Normal
	dw $4e13
	dw DarkenBGToPal_Normal
	dw $4e23
	dw $4e33
	dw FadeBGToWhite_Normal
	dw $4e45
	dw DarkenBGToPal_Normal
	dw $4e55
	dw FastFadeToWhite
	dw $4e65
	dw SlowFadeFromWhite
	dw $4e75
	dw $4e85
; 0x803e6

Func_803e6: ; 803e6 (20:43e6)
	ld a, [wcee3]
	and a
	ret z
	ld a, [w2d050]
	and a
	ret nz
	ld a, [w2d01d]
	cp $0e
	ret nc
	jp Func_15dc
; 0x803f9

Func_803f9: ; 803f9 (20:43f9)
	ld a, BANK("WRAM2")
	ldh [rSVBK], a
	ld a, $ff
	ldh [hffb3 + 0], a
	ldh [hMusicID + 0], a
	ld a, $00
	ldh [hffb3 + 1], a
	ldh [hMusicID + 1], a

	ld a, [wcee3]
	ld [w2d01b], a
	xor a
	ld [wced8], a
	ld a, [w2d01b]
	inc a
	jr nz, .asm_8041e
; w2d01b == $ff
	ld hl, w2d000
	set 0, [hl]
.asm_8041e
	call Func_80366

	ld a, [w2d050]
	cp $04
	jr z, .asm_8043c
	ld a, [w2d00f]
	cp $1a
	jp nc, .asm_804b9

	ld b, a
	call Func_81278
	ld a, b
	ld [w2d012], a
	ld a, d
	ld [w2d01d], a
.asm_8043c
	call Func_80b29
	ld a, [w2d01b]
	and a
	jr z, .asm_8048a
	cp $f0
	jr z, .asm_8048a
	cp $f1
	jr z, .asm_804a9
	cp $f2
	jr z, .asm_804a9
	cp $f3
	jr z, .asm_804b5
	inc a
	jr nz, .asm_8045f

; w2d01b == $ff
	ld a, $01
	ld [w2d025], a
	jr .asm_80466
.asm_8045f
	call Func_8197e
	jr nz, .asm_80466
	jr .asm_8048a
.asm_80466
	call .Func_804c9
	farcall Func_9c005
	ld a, [w2d01e]
	and a
	jr z, .asm_80480
	jr .asm_804a0
.asm_80480
	ld a, [w2d025]
	call Func_81b0d
	jr z, .asm_8048a
	jr .asm_80497
.asm_8048a
	xor a
	ld [w2d025], a
	ld a, $09
	ld [wSubSequence], a
	call Func_803e6
	ret

.asm_80497
	call .Func_804d4
	ld a, $05
	ld [wSubSequence], a
	ret

.asm_804a0
	call .Func_804d4
	ld a, $11
	ld [wSubSequence], a
	ret

.asm_804a9
	ld a, $f0
	ld [w2d00d], a
	ld a, $5a
	ld [w2d025], a
	jr .asm_80480
.asm_804b5
	call Func_803e6
	ret

.asm_804b9
	xor a
	ld [w2d012], a
	ld [w2d01d], a
	ld a, $20
	ld [wSubSequence], a
	call Func_803e6
	ret

.Func_804c9
	ld a, [w2d050]
	and a
	ret nz
	ld a, $f0
	ld [w2d00d], a
	ret

.Func_804d4
	ld a, [w2d050]
	and a
	ret nz
	ld a, [w2d028]
	cp $04
	ret z
	ld a, [w2d01b]
	cp $f1
	ret z
	cp $f2
	ret z
	ld [w2d00d], a
	ret
; 0x804ec

	INCROM $804ec, $80b29

; clears w2d060 onwards
; seems like level-related stuff
Func_80b29: ; 80b29 (20:4b29)
	ld hl, w2d060
	ld bc, $7a0
	xor a
	call WriteAToHL_BCTimes
	ret
; 0x80b34

	INCROM $80b34, $80d6c

Func_80d6c: ; 80d6c (20:4d6c)
	farcall Func_9c021
	ret
; 0x80d7c

	INCROM $80d7c, $81278

; input:
; - b = ???
; output:
; - d = ???
; - c = ???
Func_81278: ; 81278 (20:5278)
	ld hl, $52ac
	ld c, $ff
.loop
	ld e, [hl]
	inc hl
	inc c
	ld a, [hl]
	dec a
	cp b
	jr c, .loop
	ld a, b
	sub e
	ld d, a
	ld b, c
	ret
; 0x8128a

	INCROM $8128a, $8197e

Func_8197e: ; 8197e (20:597e)
	ld a, [w2d01b]
	ld b, a
	xor a
	ld c, a
	ld [w2d025], a
	ld hl, $59fb
.asm_8198a
	ld a, [hli]
	cp $ed
	jr z, .asm_819a7
	cp b
	jr z, .asm_8199d
	ld a, [hli]
	cp b
	jr z, .asm_8199d
	ld a, [hli]
	cp b
	jr z, .asm_8199d
	inc c
	jr .asm_8198a
.asm_8199d
	ld a, c
	ld [w2d025], a
	call .Func_819ac
	jr z, .asm_819a7
	ret
.asm_819a7
	xor a
	ld [w2d025], a
	ret

.Func_819ac
	call Func_819e3
	ld c, $01
	ld a, [$dffd]
	call Func_819cb
	ret c
	ld a, [$dffe]
	call Func_819cb
	ret c
	ld a, [$dfff]
	call Func_819cb
	ret
; 0x819c6

	INCROM $819c6, $819cb

Func_819cb: ; 819cb (20:59cb)
	cp $80
	jr z, .asm_819df
	ld hl, w2d01b
	cp [hl]
	jr z, .asm_819dd
	call Func_3aac
	jr nz, .asm_819df
	xor a
	scf
	ret
.asm_819dd
	ld c, $00
.asm_819df
	ld a, $01
	and a
	ret
; 0x819e3

Func_819e3: ; 819e3 (20:59e3)
	ld c, a
	add a
	add c ; *3
	ld e, a
	ld d, $00
	rl d
	ld hl, .data
	add hl, de
	ld de, $dfff
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	dec e
	ld [de], a
	ld a, [hl]
	dec e
	ld [de], a
	ret

.data
	db $80, $80, $80
	db $00, $80, $80
	db $1b, $80, $80
	db $1f, $20, $80
	db $22, $23, $80
	db $0c, $80, $80
	db $15, $80, $80
	db $12, $13, $80
	db $01, $80, $80
	db $48, $80, $80
	db $1e, $1d, $80
	db $07, $80, $80
	db $21, $80, $80
	db $3e, $80, $80
	db $17, $1c, $80
	db $0e, $80, $80
	db $02, $80, $80
	db $1a, $19, $80
	db $0b, $80, $80
	db $3f, $80, $80
	db $24, $25, $26
	db $42, $43, $80
	db $0a, $80, $80
	db $03, $80, $80
	db $44, $80, $80
	db $0f, $10, $80
	db $0d, $80, $80
	db $45, $46, $80
	db $08, $80, $80
	db $04, $80, $80
	db $2f, $80, $80
	db $49, $47, $80
	db $06, $80, $80
	db $2e, $80, $80
	db $16, $80, $80
	db $09, $80, $80
	db $3b, $80, $80
	db $05, $80, $80
	db $63, $80, $80
	db $3d, $80, $80
	db $50, $80, $80
	db $62, $80, $80
	db $57, $80, $80
	db $4c, $80, $80
	db $64, $80, $80
	db $58, $80, $80
	db $38, $80, $80
	db $59, $80, $80
	db $29, $80, $80
	db $37, $80, $80
	db $60, $80, $80
	db $80, $80, $80
	db $56, $80, $80
	db $4d, $80, $80
	db $5a, $80, $80
	db $11, $80, $80
	db $14, $80, $80
	db $39, $80, $80
	db $32, $80, $80
	db $5f, $80, $80
	db $3a, $80, $80
	db $33, $34, $80
	db $53, $80, $80
	db $5b, $80, $80
	db $5c, $80, $80
	db $4b, $80, $80
	db $5e, $80, $80
	db $2c, $80, $80
	db $2a, $80, $80
	db $4f, $80, $80
	db $80, $80, $80
	db $80, $80, $80
	db $3c, $80, $80
	db $41, $40, $80
	db $18, $80, $80
	db $61, $80, $80
	db $5d, $80, $80
	db $54, $80, $80
	db $31, $80, $80
	db $2d, $80, $80
	db $52, $80, $80
	db $28, $27, $80
	db $4e, $80, $80
	db $51, $80, $80
	db $30, $80, $80
	db $35, $80, $80
	db $2b, $80, $80
	db $4a, $80, $80
	db $36, $80, $80
	db $55, $80, $80
	db $80, $80, $80
; 0x81b0c

; stray data
	db $ed
; 0x81b0d

Func_81b0d: ; 81b0d (20:5b0d)
	ld hl, .ptr_table
	call GetPointerFromTableHL
	ld a, [hli]
	ld [w2d028], a
	cp $80
	ret z
	ld a, [hli]
	ld [w2d016], a
	ld a, [hli]
	ld [w2d017], a
	ld a, l
	ld [w2d026], a
	ld a, h
	ld [w2d027], a
	ret

.ptr_table
	dw $5be1
	dw $5be2
	dw $5be6
	dw $5bf0
	dw $5bfa
	dw $5c01
	dw $5c08
	dw $5c12
	dw $5c1c
	dw $5c23
	dw $5c30
	dw $5c37
	dw $5c3e
	dw $5c48
	dw $5c52
	dw $5c59
	dw $5c60
	dw $5c6a
	dw $5c71
	dw $5c7b
	dw $5c85
	dw $5c92
	dw $5c96
	dw $5ca3
	dw $5caa
	dw $5cb4
	dw $5cbb
	dw $5cc8
	dw $5cd5
	dw $5cdf
	dw $5ce6
	dw $5ced
	dw $5cf1
	dw $5cfb
	dw $5d02
	dw $5d06
	dw $5d10
	dw $5d14
	dw $5d1b
	dw $5d1f
	dw $5d23
	dw $5d24
	dw $5d28
	dw $5d29
	dw $5d2a
	dw $5d2e
	dw $5d2f
	dw $5d30
	dw $5d34
	dw $5d3b
	dw $5d3c
	dw $5d40
	dw $5d41
	dw $5d42
	dw $5d46
	dw $5d47
	dw $5d54
	dw $5d5b
	dw $5d5f
	dw $5d63
	dw $5d67
	dw $5d6b
	dw $5d6f
	dw $5d70
	dw $5d71
	dw $5d72
	dw $5d73
	dw $5d77
	dw $5d7b
	dw $5d82
	dw $5d83
	dw $5d84
	dw $5d85
	dw $5d86
	dw $5d8a
	dw $5d8e
	dw $5d92
	dw $5d99
	dw $5d9a
	dw $5d9e
	dw $5da8
	dw $5da9
	dw $5db0
	dw $5db1
	dw $5db2
	dw $5db6
	dw $5dba
	dw $5dbe
	dw $5dc5
	dw $5dc9
	dw $5dca
; 0x81be1

	INCROM $81be1, $82cb8
