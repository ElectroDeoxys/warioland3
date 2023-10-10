hlbgcoord EQUS "bgcoord hl,"
bcbgcoord EQUS "bgcoord bc,"
debgcoord EQUS "bgcoord de,"

MACRO bgcoord
; register, x, y[, origin]
IF _NARG < 4
	ld \1, (\3) * BG_MAP_WIDTH + (\2) + v0BGMap0
ELSE
	ld \1, (\3) * BG_MAP_WIDTH + (\2) + \4
ENDC
ENDM

MACRO ldbgcoord
; x, y[, origin]
IF _NARG < 3
	ld [(\2) * BG_MAP_WIDTH + (\1) + v0BGMap0], a
ELSE
	ld [(\2) * BG_MAP_WIDTH + (\1) + \3], a
ENDC
ENDM
