; audio commands

audiocmd_b0: MACRO
	db $b0
ENDM

audiocmd_bc: MACRO
	db $bc
	db \1
ENDM

audiocmd_bd: MACRO
	db $bd
	db \1
ENDM

audiocmd_be: MACRO
	db $be
	db \1
ENDM

audiocmd_bf: MACRO
	db $bf
	db \1
ENDM

audiocmd_c3: MACRO
	db $c3
	db \1
ENDM

audiocmd_c4: MACRO
	db $c4
	db \1
ENDM

audiocmd_c5: MACRO
	db $c5
	db \1
ENDM

audiocmd_c6: MACRO
	db $c6
	db \1
ENDM

audiocmd_ca: MACRO
	db $ca
	db \1
ENDM

audiocmd_set_timbre: MACRO
	db $d1
	db \1
ENDM

audiocmd_d6: MACRO
	db $d6
	db \1
ENDM

audiocmd_d7: MACRO
	db $d7
	db \1
ENDM

audiocmd_set_duration: MACRO
	db $da
	db \1
ENDM

audiocmd_set_sweep: MACRO
	db $db
	db \1
ENDM
