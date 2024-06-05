MACRO dn ; nybbles
REPT _NARG / 2
	db ((\1) << 4) | (\2)
	shift 2
ENDR
ENDM

MACRO dbw
	db \1
	dw \2
ENDM

MACRO dwb
	dw \1
	db \2
ENDM

MACRO dab
	dw \1
	db BANK(\1)
ENDM

MACRO dba
	db BANK(\1)
	dw \1
ENDM

MACRO dx
x = 8 * ((\1) - 1)
	REPT \1
	db ((\2) >> x) & $ff
x = x - 8
	ENDR
	ENDM

MACRO dt ; three-byte (big-endian)
	dx 3, \1
	ENDM

MACRO dd ; four-byte (big-endian)
	dx 4, \1
	ENDM

MACRO bigdw ; big-endian word
	dx 2, \1
	ENDM

MACRO sgb
	db \1 << 3 + \2 ; sgb_command * 8 + length
ENDM

MACRO rgb
	dw (\3 << 10 | \2 << 5 | \1)
ENDM

MACRO room_data
	dn \2, \1 ; y, x
	dn \3, \4 ; y limits
	dn \5, \6 ; x limits
	db \7 ; cam configuration
	db \8 ; enemy group
	db \9 ; animated tiles group
	SHIFT 9
	db \1 ; initial pal cycle
	db \2 ; room ID
ENDM
