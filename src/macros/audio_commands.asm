; audio commands

audiocmd_unk: MACRO
	db \1
	db \2
ENDM

audio_wait_12: MACRO
	db $8c
ENDM

audio_wait_18: MACRO
	db $92
ENDM

audio_wait_96: MACRO
	db $b0
ENDM

audiocmd_jump: MACRO
	db $b2
	dw \1 ; address
ENDM

audiocmd_call: MACRO
	db $b3
	dw \1 ; address
ENDM

audiocmd_ret: MACRO
	db $b4
ENDM

audiocmd_loop: MACRO
	db $b5
	db \1 ; number of times + 1
	dw \2 ; address
ENDM

tempo: MACRO
	db $bc
	db \1
ENDM

pitch_offset: MACRO
	db $bd
	db \1
ENDM

wave: MACRO
	db $be
	db \1
ENDM

audiocmd_bf: MACRO
	db $bf
	db \1
ENDM

vibrato_speed: MACRO
	db $c3
	db \1
ENDM

vibrato_delay: MACRO
	db $c4
	db \1
ENDM

vibrato_amplitude: MACRO
	db $c5
	db \1
ENDM

set_vibrato_disabled: MACRO
	db $c6
	db \1
ENDM

audiocmd_ca: MACRO
	db $ca
	db \1
ENDM

set_timbre: MACRO
	db $d1
	db \1
ENDM

fade_in: MACRO
	db $d2
	db \1 ; speed
ENDM

fade_out: MACRO
	db $d5
	db \1 ; speed
ENDM

audiocmd_d6: MACRO
	db $d6
	db \1
ENDM

audiocmd_d7: MACRO
	db $d7
	db \1
ENDM

set_duration: MACRO
	db $da
	db \1
ENDM

set_sweep: MACRO
	db $db
	db \1
ENDM

NOTE_DURATION_0  EQU $cf
NOTE_DURATION_1  EQU $d0
NOTE_DURATION_2  EQU $d1
NOTE_DURATION_3  EQU $d2
NOTE_DURATION_4  EQU $d3
NOTE_DURATION_5  EQU $d4
NOTE_DURATION_6  EQU $d5
NOTE_DURATION_7  EQU $d6
NOTE_DURATION_8  EQU $d7
NOTE_DURATION_9  EQU $d8
NOTE_DURATION_10 EQU $d9
NOTE_DURATION_11 EQU $da
NOTE_DURATION_12 EQU $db
NOTE_DURATION_13 EQU $dc
NOTE_DURATION_14 EQU $dd
NOTE_DURATION_15 EQU $de
NOTE_DURATION_16 EQU $df
NOTE_DURATION_17 EQU $d0
NOTE_DURATION_18 EQU $d1
NOTE_DURATION_19 EQU $d2
NOTE_DURATION_20 EQU $d3
NOTE_DURATION_21 EQU $d4
NOTE_DURATION_22 EQU $d5
NOTE_DURATION_23 EQU $d6
NOTE_DURATION_24 EQU $d7
NOTE_DURATION_28 EQU $d8
NOTE_DURATION_30 EQU $d9
NOTE_DURATION_32 EQU $da
NOTE_DURATION_36 EQU $db
NOTE_DURATION_40 EQU $dc
NOTE_DURATION_42 EQU $dd
NOTE_DURATION_44 EQU $de
NOTE_DURATION_48 EQU $df
NOTE_DURATION_52 EQU $d0
NOTE_DURATION_54 EQU $d1
NOTE_DURATION_56 EQU $d2
NOTE_DURATION_60 EQU $d3
NOTE_DURATION_64 EQU $d4
NOTE_DURATION_66 EQU $d5
NOTE_DURATION_68 EQU $d6
NOTE_DURATION_72 EQU $d7
NOTE_DURATION_76 EQU $d8
NOTE_DURATION_78 EQU $d9
NOTE_DURATION_80 EQU $da
NOTE_DURATION_84 EQU $db
NOTE_DURATION_88 EQU $dc
NOTE_DURATION_90 EQU $dd
NOTE_DURATION_92 EQU $de
NOTE_DURATION_96 EQU $df

C_0 EQU $24
C#0 EQU $25
D_0 EQU $26
D#0 EQU $27
E_0 EQU $28
F_0 EQU $29
F#0 EQU $2a
G_0 EQU $2b
G#0 EQU $2c
A_0 EQU $2d
A#0 EQU $2e
B_0 EQU $2f
C_1 EQU $30
C#1 EQU $31
D_1 EQU $32
D#1 EQU $33
E_1 EQU $34
F_1 EQU $35
F#1 EQU $36
G_1 EQU $37
G#1 EQU $38
A_1 EQU $39
A#1 EQU $3a
B_1 EQU $3b
C_2 EQU $3c
C#2 EQU $3d
D_2 EQU $3e
D#2 EQU $3f
E_2 EQU $40
F_2 EQU $41
F#2 EQU $42
G_2 EQU $43
G#2 EQU $44
A_2 EQU $45
A#2 EQU $46
B_2 EQU $47
C_3 EQU $48
C#3 EQU $49
D_3 EQU $4a
D#3 EQU $4b
E_3 EQU $4c
F_3 EQU $4d
F#3 EQU $4e
G_3 EQU $4f
G#3 EQU $50
A_3 EQU $51
A#3 EQU $52
B_3 EQU $53
C_4 EQU $54
C#4 EQU $55
D_4 EQU $56
D#4 EQU $57
E_4 EQU $58
F_4 EQU $59
F#4 EQU $5a
G_4 EQU $5b
G#4 EQU $5c
A_4 EQU $5d
A#4 EQU $5e
B_4 EQU $5f
C_5 EQU $60
C#5 EQU $61
D_5 EQU $62
D#5 EQU $63
E_5 EQU $64
F_5 EQU $65
F#5 EQU $66
G_5 EQU $67
G#5 EQU $68
A_5 EQU $69
A#5 EQU $6a
B_5 EQU $6b
C_6 EQU $6c
C#6 EQU $6d
D_6 EQU $6e
D#6 EQU $6f
E_6 EQU $70
F_6 EQU $71
F#6 EQU $72
G_6 EQU $73
G#6 EQU $74
A_6 EQU $75
A#6 EQU $76
B_6 EQU $77
C_7 EQU $78
C#7 EQU $79
D_7 EQU $7a
D#7 EQU $7b
E_7 EQU $7c
F_7 EQU $7d
F#7 EQU $7e
G_7 EQU $7f

note: MACRO
	assert \1 >= NOTE_DURATION_0 && \1 <= NOTE_DURATION_96
	db \1 ; duration
if _NARG == 2
	db \2
elif _NARG == 3
	db \2, \3
elif _NARG == 4
	db \2, \3, \4
endc
ENDM
