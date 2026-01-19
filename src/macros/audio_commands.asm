; audio commands

DEF _wait_len_const = $80
DEF _note_len_const = $cf

MACRO def_duration
DEF _duration_val = \1
DEF AUDIO_WAIT_{u:_duration_val} EQU _wait_len_const
DEF NOTE_DURATION_{u:_duration_val} EQU _note_len_const

DEF _wait_len_const = _wait_len_const + 1
DEF _note_len_const = _note_len_const + 1
ENDM

	def_duration  0 ; $80
	def_duration  1 ; $81
	def_duration  2 ; $82
	def_duration  3 ; $83
	def_duration  4 ; $84
	def_duration  5 ; $85
	def_duration  6 ; $86
	def_duration  7 ; $87
	def_duration  8 ; $88
	def_duration  9 ; $89
	def_duration 10 ; $8a
	def_duration 11 ; $8b
	def_duration 12 ; $8c
	def_duration 13 ; $8d
	def_duration 14 ; $8e
	def_duration 15 ; $8f
	def_duration 16 ; $90
	def_duration 17 ; $91
	def_duration 18 ; $92
	def_duration 19 ; $93
	def_duration 20 ; $94
	def_duration 21 ; $95
	def_duration 22 ; $96
	def_duration 23 ; $97
	def_duration 24 ; $98
	def_duration 28 ; $99
	def_duration 30 ; $9a
	def_duration 32 ; $9b
	def_duration 36 ; $9c
	def_duration 40 ; $9d
	def_duration 42 ; $9e
	def_duration 44 ; $9f
	def_duration 48 ; $a0
	def_duration 52 ; $a1
	def_duration 54 ; $a2
	def_duration 56 ; $a3
	def_duration 60 ; $a4
	def_duration 64 ; $a5
	def_duration 66 ; $a6
	def_duration 68 ; $a7
	def_duration 72 ; $a8
	def_duration 76 ; $a9
	def_duration 78 ; $aa
	def_duration 80 ; $ab
	def_duration 84 ; $ac
	def_duration 88 ; $ad
	def_duration 90 ; $ae
	def_duration 92 ; $af
	def_duration 96 ; $b0

MACRO? audio_wait
DEF _wait_val = \1
	db AUDIO_WAIT_{u:_wait_val}
ENDM

	const_def $b1

	const AUDIOCMD_END
MACRO? audio_end
	db AUDIOCMD_END
ENDM

	const AUDIOCMD_JUMP
MACRO? audio_jump
	db AUDIOCMD_JUMP
	dw \1 ; address
ENDM

	const AUDIOCMD_CALL
MACRO? audio_call
	db AUDIOCMD_CALL
	dw \1 ; address
ENDM

	const AUDIOCMD_RET
MACRO? audio_ret
	db AUDIOCMD_RET
ENDM

	const AUDIOCMD_LOOP
MACRO? audio_loop
	db AUDIOCMD_LOOP
	db \1 - 1 ; number of times
	dw \2 ; address
ENDM

	const AUDIOCMD_UNUSED_B6
	const AUDIOCMD_UNUSED_B7
	const AUDIOCMD_UNUSED_B8
	const AUDIOCMD_UNUSED_B9
	const AUDIOCMD_UNUSED_BA
	const AUDIOCMD_UNUSED_BB

	const AUDIOCMD_TEMPO
MACRO? tempo
	db AUDIOCMD_TEMPO
	db \1
ENDM

	const AUDIOCMD_SEMITONE_OFFSET
MACRO? semitone_offset
	db AUDIOCMD_SEMITONE_OFFSET
	db \1
ENDM

	const AUDIOCMD_WAVE
MACRO? wave
	db AUDIOCMD_WAVE
	db \1
ENDM

	const AUDIOCMD_VOLUME
MACRO? volume
	db AUDIOCMD_VOLUME
	db \1
ENDM

DEF PAN_LEFT_F  EQU 7
DEF PAN_RIGHT_F EQU 6
DEF PAN_LEFT    EQU (1 << PAN_LEFT_F)
DEF PAN_RIGHT   EQU (1 << PAN_RIGHT_F)

	const AUDIOCMD_PAN
MACRO? pan
	db AUDIOCMD_PAN
	db (\1 + $80) >> 1
ENDM

	const AUDIOCMD_PITCH_OFFSET
MACRO? pitch_offset
	assert -128 <= (\1) && (\1) <= 127, "offset must be between -128 and 127"
	db AUDIOCMD_PITCH_OFFSET
	db (\1 + $80) >> 1
ENDM

	const AUDIOCMD_PITCH_OFFSET_MULT
MACRO? pitch_offset_mult
	db AUDIOCMD_PITCH_OFFSET_MULT
	db \1
ENDM

	const AUDIOCMD_VIBRATO_SPEED
MACRO? vibrato_speed
	db AUDIOCMD_VIBRATO_SPEED
	db \1
ENDM

	const AUDIOCMD_VIBRATO_DELAY
MACRO? vibrato_delay
	db AUDIOCMD_VIBRATO_DELAY
	db \1
ENDM

	const AUDIOCMD_VIBRATO_AMPLITUDE
MACRO? vibrato_amplitude
	db AUDIOCMD_VIBRATO_AMPLITUDE
	db \1
ENDM

	const AUDIOCMD_VIBRATO_DISABLED
MACRO? vibrato_disabled
	db AUDIOCMD_VIBRATO_DISABLED
	db \1
ENDM

	const AUDIOCMD_UNUSED_C7
	const AUDIOCMD_UNUSED_C8

	const AUDIOCMD_UNK_C9
MACRO? audiocmd_c9
	db AUDIOCMD_UNK_C9
	db (\1 + $80) >> 1
ENDM

	const AUDIOCMD_UNK_CA
MACRO? audiocmd_ca
	db AUDIOCMD_UNK_CA
	db \1
ENDM

	const AUDIOCMD_UNUSED_CB
	const AUDIOCMD_UNUSED_CC

	const AUDIOCMD_SPECIAL

MACRO? note_sustain
	db $ce
REPT _NARG
	db \1
	shift 1
ENDR
ENDM

; commands to be used with AUDIOCMD_SPECIAL
	const_def

	const AUDIOCMDSPECIAL_UNUSED_0

	const AUDIOCMDSPECIAL_TIMBRE
MACRO? timbre
	db AUDIOCMD_SPECIAL
	db AUDIOCMDSPECIAL_TIMBRE
	db \1
ENDM

	const AUDIOCMDSPECIAL_FADE_IN_ENVELOPE
MACRO? fade_in_envelope
	db AUDIOCMD_SPECIAL
	db AUDIOCMDSPECIAL_FADE_IN_ENVELOPE
	db \1
ENDM

MACRO? note
REPT _NARG
	db \1
	shift 1
ENDR
ENDM
