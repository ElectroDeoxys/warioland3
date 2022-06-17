Func_158000: ; 158000 (56:4000)
	call Func_158022
	call Func_158111
	call Func_158216
	call Func_158168
	call Func_15826d
	call Func_1581bf
	call Func_1582c4
	call Func_158358
	call Func_15839f
	call Func_1583e6
	call Func_158432
	ret
; 0x158022

Func_158022: ; 158022 (56:4022)
	ld hl, w2d896
	ld a, [hli]
	and a
	ret z
	inc [hl]
	ld b, h
	ld c, l
	dec a
	jumptable
; 0x15802d

	INCROM $15802d, $158111

Func_158111: ; 158111 (56:4111)
	ld hl, w2d8b0
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
; 0x158119

	INCROM $158119, $158168

Func_158168: ; 158168 (56:4168)
	ld hl, w2d8b8
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
; 0x158170

	INCROM $158170, $1581bf

Func_1581bf: ; 1581bf (56:41bf)
	ld hl, w2d8c0
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
; 0x1581c7

	INCROM $1581c7, $158216

Func_158216: ; 158216 (56:4216)
	ld hl, w2d8b4
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
; 0x15821e

	INCROM $15821e, $15826d

Func_15826d: ; 15826d (56:426d)
	ld hl, w2d8bc
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
; 0x158275

	INCROM $158275, $1582c4

Func_1582c4: ; 1582c4 (56:42c4)
	ld hl, w2d8c4
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
; 0x1582cc

	INCROM $1582cc, $158358

Func_158358: ; 158358 (56:4358)
	ld a, [w2d8c8]
	jumptable
; 0x15835c

	INCROM $15835c, $15839f

Func_15839f: ; 15839f (56:439f)
	ld a, [w2d8cc]
	jumptable
; 0x1583a3

	INCROM $1583a3, $1583e6

Func_1583e6: ; 1583e6 (56:43e6)
	ld a, [w2d8d0]
	jumptable
; 0x1583ea

	INCROM $1583ea, $158432

Func_158432: ; 158432 (56:4432)
	ld a, [w2d8d4]
	jumptable
; 0x158436

	INCROM $158436, $158ba3
