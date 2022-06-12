; audio commands

MACRO audiocmd_unk
	db \1
	db \2
ENDM

MACRO audio_wait_1
	db $81
ENDM

MACRO audio_wait_2
	db $82
ENDM

MACRO audio_wait_3
	db $83
ENDM

MACRO audio_wait_4
	db $84
ENDM

MACRO audio_wait_5
	db $85
ENDM

MACRO audio_wait_6
	db $86
ENDM

MACRO audio_wait_7
	db $87
ENDM

MACRO audio_wait_8
	db $88
ENDM

MACRO audio_wait_9
	db $89
ENDM

MACRO audio_wait_10
	db $8a
ENDM

MACRO audio_wait_11
	db $8b
ENDM

MACRO audio_wait_12
	db $8c
ENDM

MACRO audio_wait_13
	db $8d
ENDM

MACRO audio_wait_14
	db $8e
ENDM

MACRO audio_wait_15
	db $8f
ENDM

MACRO audio_wait_16
	db $90
ENDM

MACRO audio_wait_18
	db $92
ENDM

MACRO audio_wait_19
	db $93
ENDM

MACRO audio_wait_20
	db $94
ENDM

MACRO audio_wait_21
	db $95
ENDM

MACRO audio_wait_22
	db $96
ENDM

MACRO audio_wait_24
	db $98
ENDM

MACRO audio_wait_28
	db $99
ENDM

MACRO audio_wait_30
	db $9a
ENDM

MACRO audio_wait_32
	db $9b
ENDM

MACRO audio_wait_36
	db $9c
ENDM

MACRO audio_wait_40
	db $9d
ENDM

MACRO audio_wait_42
	db $9e
ENDM

MACRO audio_wait_44
	db $9f
ENDM

MACRO audio_wait_48
	db $a0
ENDM

MACRO audio_wait_52
	db $a1
ENDM

MACRO audio_wait_54
	db $a2
ENDM

MACRO audio_wait_56
	db $a3
ENDM

MACRO audio_wait_60
	db $a4
ENDM

MACRO audio_wait_64
	db $a5
ENDM

MACRO audio_wait_66
	db $a6
ENDM

MACRO audio_wait_68
	db $a7
ENDM

MACRO audio_wait_72
	db $a8
ENDM

MACRO audio_wait_80
	db $ab
ENDM

MACRO audio_wait_84
	db $ac
ENDM

MACRO audio_wait_88
	db $ad
ENDM

MACRO audio_wait_90
	db $ae
ENDM

MACRO audio_wait_92
	db $af
ENDM

MACRO audio_wait_96
	db $b0
ENDM

MACRO audio_end
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

MACRO audio_loop
	db $b5
	db \1 - 1 ; number of times
	dw \2 ; address
ENDM

MACRO tempo
	db $bc
	db \1
ENDM

MACRO semitone_offset
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

MACRO pitch_offset
	assert -128 <= (\1) && (\1) <= 127, "offset must be between -128 and 127"
	db $c1
	db (\1 + $80) >> 1 
ENDM

MACRO pitch_offset_mult
	db $c2
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

MACRO vibrato_disabled
	db $c6
	db \1
ENDM

MACRO note_sustain
	db $ce
REPT _NARG
	db \1
	shift 1
ENDR
ENDM

MACRO note
REPT _NARG
	db \1
	shift 1
ENDR
ENDM
