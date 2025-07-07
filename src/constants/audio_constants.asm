; channel
	const_def
	const CHAN1_F ; 0
	const CHAN2_F ; 1
	const CHAN3_F ; 2
	const CHAN4_F ; 3
DEF NUM_SFX_CHANNELS EQU const_value
	const CHAN5_F ; 4
	const CHAN6_F ; 5
	const CHAN7_F ; 6
	const CHAN8_F ; 7
DEF NUM_MUSIC_CHANNELS EQU const_value - NUM_SFX_CHANNELS
DEF NUM_CHANNELS EQU const_value

DEF CHAN1 EQU (1 << CHAN1_F)
DEF CHAN2 EQU (1 << CHAN2_F)
DEF CHAN3 EQU (1 << CHAN3_F)
DEF CHAN4 EQU (1 << CHAN4_F)
DEF CHAN5 EQU (1 << CHAN5_F)
DEF CHAN6 EQU (1 << CHAN6_F)
DEF CHAN7 EQU (1 << CHAN7_F)
DEF CHAN8 EQU (1 << CHAN8_F)

DEF SFX_CHANNELS   EQU CHAN1 | CHAN2 | CHAN3 | CHAN4
DEF MUSIC_CHANNELS EQU CHAN5 | CHAN6 | CHAN7 | CHAN8

; wAudioEngineFlags constants
	const_def 5
	const AUDIOENG_UNK5_F            ; 5
	const AUDIOENG_HAS_CALLBACK_F    ; 6
	const AUDIOENG_HAS_BACKUP_BANK_F ; 7

DEF AUDIOENG_UNK5            EQU (1 << AUDIOENG_UNK5_F)
DEF AUDIOENG_HAS_CALLBACK    EQU (1 << AUDIOENG_HAS_CALLBACK_F)
DEF AUDIOENG_HAS_BACKUP_BANK EQU (1 << AUDIOENG_HAS_BACKUP_BANK_F)

; channel struct members
RSRESET
DEF CHANNEL_FLAGS             rb
DEF CHANNEL_DURATION          rb
DEF CHANNEL_CMD_PTR           rw
DEF CHANNEL_SOUND_BANK        rb
DEF CHANNEL_UNUSED_05         rb
DEF CHANNEL_SOUND_ID          rw
DEF CHANNEL_PRIORITY          rb
DEF CHANNEL_PITCH             rb
DEF CHANNEL_UNK_0A            rb
DEF CHANNEL_UNK_0B            rb
DEF CHANNEL_TIMBRE            rb
DEF CHANNEL_LENGTH            rb
DEF CHANNEL_SWEEP             rb
DEF CHANNEL_FADE_IN_ENVELOPE  rb
DEF CHANNEL_FADE_OUT_ENVELOPE rb
DEF CHANNEL_ACTIVE_COMMAND    rb
DEF CHANNEL_SEMITONE_OFFSET   rb
DEF CHANNEL_PITCH_OFFSET_MOD  rw
DEF CHANNEL_VOLUME            rb
DEF CHANNEL_VOLUME_MOD        rb
DEF CHANNEL_SO1               rb
DEF CHANNEL_SO2               rb
DEF CHANNEL_PITCH_OFFSET      rb ; signed integer
DEF CHANNEL_PITCH_OFFSET_MULT rb ; multiplier for pitch offset
DEF CHANNEL_PITCH_PRODUCT     rw ; result from pitch offset product
DEF CHANNEL_UNK_1D            rb
DEF CHANNEL_UNK_1E            rb
DEF CHANNEL_VIBRATO_SPEED     rb
DEF CHANNEL_UNK_VIBRATO_VALUE rb
DEF CHANNEL_VIBRATO_AMPLITUDE rb
DEF CHANNEL_VIBRATO_AMPLITUDE_MOD rb
DEF CHANNEL_VIBRATO_DISABLED  rb
DEF CHANNEL_UNK_24            rw
DEF CHANNEL_UNK_26            rb
DEF CHANNEL_UNK_27            rb
DEF CHANNEL_UNK_28            rb
DEF CHANNEL_UNK_29            rb
DEF CHANNEL_VIBRATO_DELAY     rb
DEF CHANNEL_VIBRATO_COUNTER   rb
DEF CHANNEL_FREQUENCY         rw
DEF CHANNEL_SO_FLAGS          rb
DEF CHANNEL_UNK_2F            rb
DEF CHANNEL_UNK_30            rb
DEF CHANNEL_UNK_31            rb
DEF CHANNEL_UNK_32            rb
DEF CHANNEL_UNK_33            rb
DEF CHANNEL_UNK_34            rb
DEF CHANNEL_UNK_35            rb
DEF CHANNEL_UNK_36            rb
DEF CHANNEL_UNK_37            rb
DEF CHANNEL_UNK_38            rb
DEF CHANNEL_UNK_39            rb
DEF CHANNEL_UNK_3A            rb
DEF CHANNEL_UNK_3B            rb
DEF CHANNEL_STRUCT_LENGTH EQU _RS

	const_def
	const CHANFLAGS_UPDATE_SO_F         ; 0
	const CHANFLAGS_UPDATE_VOLUME_F     ; 1
	const CHANFLAGS_UPDATE_FREQUENCY_F  ; 2
	const CHANFLAGS_3_F                 ; 3
	const CHANFLAGS_UPDATE_PERCUSSION_F ; 4
	const CHANFLAGS_5_F                 ; 5
	const CHANFLAGS_6_F                 ; 6
	const CHANFLAGS_ACTIVE_F            ; 7

DEF CHANFLAGS_UPDATE_SO         EQU (1 << CHANFLAGS_UPDATE_SO_F)
DEF CHANFLAGS_UPDATE_VOLUME     EQU (1 << CHANFLAGS_UPDATE_VOLUME_F)
DEF CHANFLAGS_UPDATE_FREQUENCY  EQU (1 << CHANFLAGS_UPDATE_FREQUENCY_F)
DEF CHANFLAGS_3                 EQU (1 << CHANFLAGS_3_F)
DEF CHANFLAGS_UPDATE_PERCUSSION EQU (1 << CHANFLAGS_UPDATE_PERCUSSION_F)
DEF CHANFLAGS_5                 EQU (1 << CHANFLAGS_5_F)
DEF CHANFLAGS_6                 EQU (1 << CHANFLAGS_6_F)
DEF CHANFLAGS_ACTIVE            EQU (1 << CHANFLAGS_ACTIVE_F)

DEF NUM_TRACKS EQU 4

; track struct members
RSRESET
DEF TRACK_FLAGS             rb
DEF TRACK_PRIORITY          rb
DEF TRACK_UNK02             rb
DEF TRACK_UNK03             rb
DEF TRACK_CHANNEL_PTR       rw
DEF TRACK_UNK06             rb
DEF TRACK_DURATION          rb
DEF TRACK_TIMBRE            rb
DEF TRACK_LENGTH            rb
DEF TRACK_SWEEP             rb
DEF TRACK_FADE_IN_ENVELOPE  rb
DEF TRACK_FADE_OUT_ENVELOPE rb
DEF TRACK_UNK0D             rb
DEF TRACK_UNK0E             rb
DEF TRACK_UNK0F             rb
DEF TRACK_VOLUME            rb
DEF TRACK_VOLUME_ENVELOPE   rb
DEF TRACK_FREQUENCY         rw
DEF TRACK_UNK14             rb
DEF TRACK_UNK15             rb
DEF TRACK_UNK16             rb
DEF TRACK_UNK17             rb
DEF TRACK_STRUCT_LENGTH EQU _RS

	const_def
	const TRACKFLAGS_0_F      ; 0
	const TRACKFLAGS_1_F      ; 1
	const TRACKFLAGS_2_F      ; 2
	const TRACKFLAGS_3_F      ; 3
	const TRACKFLAGS_4_F      ; 4
	const TRACKFLAGS_5_F      ; 5
	const TRACKFLAGS_6_F      ; 6
	const TRACKFLAGS_7_F      ; 7

DEF TRACKFLAGS_0      EQU (1 << TRACKFLAGS_0_F)
DEF TRACKFLAGS_1      EQU (1 << TRACKFLAGS_1_F)
DEF TRACKFLAGS_2      EQU (1 << TRACKFLAGS_2_F)
DEF TRACKFLAGS_3      EQU (1 << TRACKFLAGS_3_F)
DEF TRACKFLAGS_4      EQU (1 << TRACKFLAGS_4_F)
DEF TRACKFLAGS_5      EQU (1 << TRACKFLAGS_5_F)
DEF TRACKFLAGS_6      EQU (1 << TRACKFLAGS_6_F)
DEF TRACKFLAGS_7      EQU (1 << TRACKFLAGS_7_F)

; wVolume
DEF VOLUME_SO1_F     EQU 3
DEF VOLUME_SO2_F     EQU 7
DEF VOLUME_SO1_LEVEL EQU %00000111
DEF VOLUME_SO2_LEVEL EQU %01110000
DEF MAX_VOLUME       EQU VOLUME_SO1_LEVEL | VOLUME_SO2_LEVEL


; duty cycle values for rect audio tracks
DEF RECTWAVE_1_8 EQU %00
DEF RECTWAVE_1_4 EQU %01
DEF RECTWAVE_1_2 EQU %10
DEF RECTWAVE_3_4 EQU %11

; which rectangle audio track
DEF RECT_TRACK1 EQU (0 << 3)
DEF RECT_TRACK2 EQU (1 << 3)

; waveforms for wave audio track
	const_def $10
	const WAVEFORM_SINE                ; $10 (sine)
	const WAVEFORM_TRIANGLE            ; $11 (triangle)
	const WAVEFORM_SAWTOOTH            ; $12 (sawtooth)
	const WAVEFORM_STEP                ; $13 (step)
	const WAVEFORM_SQUARE_1_8          ; $14 (square 1/8 duty cycle)
	const WAVEFORM_SQUARE_2_8          ; $15 (square 2/8 duty cycle)
	const WAVEFORM_SQUARE_3_8          ; $16 (square 3/8 duty cycle)
	const WAVEFORM_SQUARE_4_8          ; $17 (square 4/8 duty cycle)
	const WAVEFORM_SQUARE_1_2_SAWTOOTH ; $18 (square & sawtooth)
	const WAVEFORM_SQUARE_1_4_SAWTOOTH ; $19 (square & sawtooth)
	const WAVEFORM_SPIKY               ; $1a (spiky)
	const WAVEFORM_SQUISHED_SINE       ; $1b (squished sine)
DEF NUM_WAVEFORMS EQU const_value - $10

DEF NOISE_POLYCOUNTER_15 EQU 0
DEF NOISE_POLYCOUNTER_07 EQU 1
DEF NOISE_TRACK EQU (1 << 6)

; sweep constants
DEF SWEEP_INCR EQU (0 << 3)
DEF SWEEP_DECR EQU (1 << 3)

DEF NO_SWEEP     EQU (%000 << 4)
DEF SWEEP_TIME_1 EQU (%001 << 4) ;  7.8 ms
DEF SWEEP_TIME_2 EQU (%010 << 4) ; 15.6 ms
DEF SWEEP_TIME_3 EQU (%011 << 4) ; 23.4 ms
DEF SWEEP_TIME_4 EQU (%100 << 4) ; 31.3 ms
DEF SWEEP_TIME_5 EQU (%101 << 4) ; 39.1 ms
DEF SWEEP_TIME_6 EQU (%110 << 4) ; 46.9 ms
DEF SWEEP_TIME_7 EQU (%111 << 4) ; 54.7 ms

	const_def
	const WAVE_00 ; $00
	const WAVE_01 ; $01
	const WAVE_02 ; $02
	const WAVE_03 ; $03
	const WAVE_04 ; $04
	const WAVE_05 ; $05
	const WAVE_06 ; $06
	const WAVE_07 ; $07
	const WAVE_08 ; $08
	const WAVE_09 ; $09
	const WAVE_0A ; $0a
	const WAVE_0B ; $0b
	const WAVE_0C ; $0c
	const WAVE_0D ; $0d
	const WAVE_0E ; $0e
	const WAVE_0F ; $0f
	const WAVE_10 ; $10
	const WAVE_11 ; $11
	const WAVE_12 ; $12
	const WAVE_13 ; $13
	const WAVE_14 ; $14
	const WAVE_15 ; $15
	const WAVE_16 ; $16
	const WAVE_17 ; $17
	const WAVE_18 ; $18
	const WAVE_19 ; $19
	const WAVE_1A ; $1a
	const WAVE_1B ; $1b
	const WAVE_1C ; $1c
	const WAVE_1D ; $1d
	const WAVE_1E ; $1e
	const WAVE_1F ; $1f
	const WAVE_20 ; $20
	const WAVE_21 ; $21
	const WAVE_22 ; $22
	const WAVE_23 ; $23
	const WAVE_24 ; $24
	const WAVE_25 ; $25
	const WAVE_26 ; $26
	const WAVE_27 ; $27
	const WAVE_28 ; $28
	const WAVE_29 ; $29
	const WAVE_2A ; $2a
	const WAVE_2B ; $2b
	const WAVE_2C ; $2c
	const WAVE_2D ; $2d
	const WAVE_2E ; $2e
	const WAVE_2F ; $2f
	const WAVE_30 ; $30
	const WAVE_31 ; $31
	const WAVE_32 ; $32
	const WAVE_33 ; $33
	const WAVE_34 ; $34
	const WAVE_35 ; $35
	const WAVE_36 ; $36
	const WAVE_37 ; $37
	const WAVE_38 ; $38
	const WAVE_39 ; $39
	const WAVE_3A ; $3a
	const WAVE_3B ; $3b
	const WAVE_3C ; $3c
	const WAVE_3D ; $3d
	const WAVE_3E ; $3e
	const WAVE_3F ; $3f
	const WAVE_40 ; $40
	const WAVE_41 ; $41
	const WAVE_42 ; $42
	const WAVE_43 ; $43
	const WAVE_44 ; $44
	const WAVE_45 ; $45
	const WAVE_46 ; $46
	const WAVE_47 ; $47
	const WAVE_48 ; $48
	const WAVE_49 ; $49
	const WAVE_4A ; $4a
	const WAVE_4B ; $4b
	const WAVE_4C ; $4c
	const WAVE_4D ; $4d
	const WAVE_4E ; $4e
	const WAVE_4F ; $4f
	const WAVE_50 ; $50
	const WAVE_51 ; $51
	const WAVE_52 ; $52
	const WAVE_53 ; $53
	const WAVE_54 ; $54
	const WAVE_55 ; $55
	const WAVE_56 ; $56
	const WAVE_57 ; $57
	const WAVE_58 ; $58
	const WAVE_59 ; $59
	const WAVE_5A ; $5a
	const WAVE_5B ; $5b
	const WAVE_5C ; $5c
	const WAVE_5D ; $5d
	const WAVE_5E ; $5e
	const WAVE_5F ; $5f
	const WAVE_60 ; $60
	const WAVE_61 ; $61
	const WAVE_62 ; $62
	const WAVE_63 ; $63
	const WAVE_64 ; $64
	const WAVE_65 ; $65
	const WAVE_66 ; $66
	const WAVE_67 ; $67
	const WAVE_68 ; $68
	const WAVE_69 ; $69
	const WAVE_6A ; $6a
	const WAVE_6B ; $6b
	const WAVE_6C ; $6c
	const WAVE_6D ; $6d
	const WAVE_6E ; $6e
	const WAVE_6F ; $6f
	const WAVE_70 ; $70
	const WAVE_71 ; $71
	const WAVE_72 ; $72
	const WAVE_73 ; $73
	const WAVE_74 ; $74
	const WAVE_75 ; $75
	const WAVE_76 ; $76
	const WAVE_77 ; $77
	const WAVE_78 ; $78
	const WAVE_79 ; $79
	const WAVE_7A ; $7a
DEF NUM_WAVES EQU const_value

	const_def $cf
	const NOTE_DURATION_0  ; $cf
	const NOTE_DURATION_1  ; $d0
	const NOTE_DURATION_2  ; $d1
	const NOTE_DURATION_3  ; $d2
	const NOTE_DURATION_4  ; $d3
	const NOTE_DURATION_5  ; $d4
	const NOTE_DURATION_6  ; $d5
	const NOTE_DURATION_7  ; $d6
	const NOTE_DURATION_8  ; $d7
	const NOTE_DURATION_9  ; $d8
	const NOTE_DURATION_10 ; $d9
	const NOTE_DURATION_11 ; $da
	const NOTE_DURATION_12 ; $db
	const NOTE_DURATION_13 ; $dc
	const NOTE_DURATION_14 ; $dd
	const NOTE_DURATION_15 ; $de
	const NOTE_DURATION_16 ; $df
	const NOTE_DURATION_17 ; $e0
	const NOTE_DURATION_18 ; $e1
	const NOTE_DURATION_19 ; $e2
	const NOTE_DURATION_20 ; $e3
	const NOTE_DURATION_21 ; $e4
	const NOTE_DURATION_22 ; $e5
	const NOTE_DURATION_23 ; $e6
	const NOTE_DURATION_24 ; $e7
	const NOTE_DURATION_28 ; $e8
	const NOTE_DURATION_30 ; $e9
	const NOTE_DURATION_32 ; $ea
	const NOTE_DURATION_36 ; $eb
	const NOTE_DURATION_40 ; $ec
	const NOTE_DURATION_42 ; $ed
	const NOTE_DURATION_44 ; $ee
	const NOTE_DURATION_48 ; $ef
	const NOTE_DURATION_52 ; $f0
	const NOTE_DURATION_54 ; $f1
	const NOTE_DURATION_56 ; $f2
	const NOTE_DURATION_60 ; $f3
	const NOTE_DURATION_64 ; $f4
	const NOTE_DURATION_66 ; $f5
	const NOTE_DURATION_68 ; $f6
	const NOTE_DURATION_72 ; $f7
	const NOTE_DURATION_76 ; $f8
	const NOTE_DURATION_78 ; $f9
	const NOTE_DURATION_80 ; $fa
	const NOTE_DURATION_84 ; $fb
	const NOTE_DURATION_88 ; $fc
	const NOTE_DURATION_90 ; $fd
	const NOTE_DURATION_92 ; $fe
	const NOTE_DURATION_96 ; $ff

	const_def $24
	const C_0 ; $24
	const C#0 ; $25
	const D_0 ; $26
	const D#0 ; $27
	const E_0 ; $28
	const F_0 ; $29
	const F#0 ; $2a
	const G_0 ; $2b
	const G#0 ; $2c
	const A_0 ; $2d
	const A#0 ; $2e
	const B_0 ; $2f
	const C_1 ; $30
	const C#1 ; $31
	const D_1 ; $32
	const D#1 ; $33
	const E_1 ; $34
	const F_1 ; $35
	const F#1 ; $36
	const G_1 ; $37
	const G#1 ; $38
	const A_1 ; $39
	const A#1 ; $3a
	const B_1 ; $3b
	const C_2 ; $3c
	const C#2 ; $3d
	const D_2 ; $3e
	const D#2 ; $3f
	const E_2 ; $40
	const F_2 ; $41
	const F#2 ; $42
	const G_2 ; $43
	const G#2 ; $44
	const A_2 ; $45
	const A#2 ; $46
	const B_2 ; $47
	const C_3 ; $48
	const C#3 ; $49
	const D_3 ; $4a
	const D#3 ; $4b
	const E_3 ; $4c
	const F_3 ; $4d
	const F#3 ; $4e
	const G_3 ; $4f
	const G#3 ; $50
	const A_3 ; $51
	const A#3 ; $52
	const B_3 ; $53
	const C_4 ; $54
	const C#4 ; $55
	const D_4 ; $56
	const D#4 ; $57
	const E_4 ; $58
	const F_4 ; $59
	const F#4 ; $5a
	const G_4 ; $5b
	const G#4 ; $5c
	const A_4 ; $5d
	const A#4 ; $5e
	const B_4 ; $5f
	const C_5 ; $60
	const C#5 ; $61
	const D_5 ; $62
	const D#5 ; $63
	const E_5 ; $64
	const F_5 ; $65
	const F#5 ; $66
	const G_5 ; $67
	const G#5 ; $68
	const A_5 ; $69
	const A#5 ; $6a
	const B_5 ; $6b
	const C_6 ; $6c
	const C#6 ; $6d
	const D_6 ; $6e
	const D#6 ; $6f
	const E_6 ; $70
	const F_6 ; $71
	const F#6 ; $72
	const G_6 ; $73
	const G#6 ; $74
	const A_6 ; $75
	const A#6 ; $76
	const B_6 ; $77
	const C_7 ; $78
	const C#7 ; $79
	const D_7 ; $7a
	const D#7 ; $7b
	const E_7 ; $7c
	const F_7 ; $7d
	const F#7 ; $7e
	const G_7 ; $7f

; constants related to functions used to "dynamically" modify
; some properties in audio channels (check AudioModFunctionTable)
	const_def

	; change SFX or Music tempo by some modifier
	; - wSoundEngineParam2 = modifier (Q6 precision)
	; - wSoundEngineParam3 = bool, whether to apply to SFX
	; - wSoundEngineParam4 = bool, whether to apply to Music
	const AUDIOMOD_TEMPO             ; $0

	; change SFX or Music pitch by an offset
	; - wSoundEngineParam1 = pitch offset (16-bit)
	; - wSoundEngineParam3 = music channel bitmask
	; - wSoundEngineParam4 = SFX channel bitmask
	const AUDIOMOD_PITCH             ; $1

	; change SFX or Music volume by some modifier
	; - wSoundEngineParam2 = modifier (Q6 precision)
	; - wSoundEngineParam3 = music channel bitmask
	; - wSoundEngineParam4 = SFX channel bitmask
	const AUDIOMOD_VOLUME            ; $2

	; change SFX or Music pan by some modifier
	; - wSoundEngineParam2 = pan SO (8-bit)
	; - wSoundEngineParam3 = music channel bitmask
	; - wSoundEngineParam4 = SFX channel bitmask
	const AUDIOMOD_PAN               ; $3

	; change SFX or Music vibrato amplitude by some modifier
	; - wSoundEngineParam2 = modifier (Q8 precision)
	; - wSoundEngineParam3 = music channel bitmask
	; - wSoundEngineParam4 = SFX channel bitmask
	const AUDIOMOD_VIBRATO_AMPLITUDE ; $4

	; change SFX or Music vibrato speed to a value
	; - wSoundEngineParam1 = speed value (8-bit)
	; - wSoundEngineParam2 = ? (8-bit)
	; - wSoundEngineParam3 = music channel bitmask
	; - wSoundEngineParam4 = SFX channel bitmask
	const AUDIOMOD_VIBRATO_SPEED     ; $5

	const AUDIOMOD_UNK               ; $6
DEF NUM_AUDIOMOD_FUNCTIONS EQU const_value
