; audio commands

MACRO audiocmd_unk
	db \1
	db \2
ENDM

MACRO audio_wait_6
	db $86
ENDM

MACRO audio_wait_12
	db $8c
ENDM

MACRO audio_wait_18
	db $92
ENDM

MACRO audio_wait_24
	db $98
ENDM

MACRO audio_wait_36
	db $9c
ENDM

MACRO audio_wait_48
	db $a0
ENDM

MACRO audio_wait_60
	db $a4
ENDM

MACRO audio_wait_84
	db $ac
ENDM

MACRO audio_wait_96
	db $b0
ENDM

MACRO audio_clear
	db $b1
ENDM

MACRO audio_jump
	db $b2
	dw \1 ; address
ENDM

MACRO audio_call
	db $b3
	dw \1 ; address
ENDM

MACRO audio_ret
	db $b4
ENDM

MACRO audiocmd_loop
	db $b5
	db \1 ; number of times + 1
	dw \2 ; address
ENDM

MACRO tempo
	db $bc
	db \1
ENDM

MACRO pitch_offset
	db $bd
	db \1
ENDM

MACRO wave
	db $be
	db \1
ENDM

MACRO volume
	db $bf
	db \1
ENDM

MACRO vibrato_speed
	db $c3
	db \1
ENDM

MACRO vibrato_delay
	db $c4
	db \1
ENDM

MACRO vibrato_amplitude
	db $c5
	db \1
ENDM

MACRO set_vibrato_disabled
	db $c6
	db \1
ENDM

MACRO audiocmd_ca
	db $ca
	db \1
ENDM

MACRO set_timbre
	db $d1
	db \1
ENDM

MACRO audiocmd_d6
	db $d6
	db \1
ENDM

MACRO audiocmd_d7
	db $d7
	db \1
ENDM

MACRO set_duration
	db $da
	db \1
ENDM

MACRO set_sweep
	db $db
	db \1
ENDM

MACRO note
REPT _NARG
	db \1
	shift 1
ENDR
ENDM
