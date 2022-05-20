; channel
	const_def
	const CHAN1 ; 0
	const CHAN2 ; 1
	const CHAN3 ; 2
	const CHAN4 ; 3
DEF NUM_SFX_CHANS EQU const_value
	const CHAN5 ; 4
	const CHAN6 ; 5
	const CHAN7 ; 6
	const CHAN8 ; 7
DEF NUM_MUSIC_CHANS EQU const_value - NUM_SFX_CHANS
DEF NUM_CHANNELS EQU const_value

; channel struct members
rsreset
CHANNEL_FLAGS             rb
CHANNEL_DURATION          rb
CHANNEL_CMD_PTR           rw
CHANNEL_SOUND_BANK        rb
CHANNEL_UNK_05            rb
CHANNEL_SOUND_ID          rw
CHANNEL_PRIORITY          rb
CHANNEL_PITCH             rb
CHANNEL_UNK_0A            rb
CHANNEL_UNK_0B            rb
CHANNEL_TIMBRE            rb
CHANNEL_LENGTH            rb
CHANNEL_SWEEP             rb
CHANNEL_FADE_IN_SPEED     rb
CHANNEL_FADE_OUT_SPEED    rb
CHANNEL_ACTIVE_COMMAND            rb
CHANNEL_PITCH_OFFSET      rb
CHANNEL_UNK_13            rw
CHANNEL_UNK_15            rb
CHANNEL_UNK_16            rb
CHANNEL_SO1               rb
CHANNEL_SO2               rb
CHANNEL_UNK_19            rb
CHANNEL_UNK_1A            rb
CHANNEL_UNK_1B            rw
CHANNEL_UNK_1D            rb
CHANNEL_UNK_1E            rb
CHANNEL_VIBRATO_SPEED     rb
CHANNEL_UNK_VIBRATO_VALUE rb
CHANNEL_VIBRATO_AMPLITUDE rb
CHANNEL_UNK_22            rb
CHANNEL_VIBRATO_DISABLED  rb
CHANNEL_UNK_24            rw
CHANNEL_UNK_26            rb
CHANNEL_UNK_27            rb
CHANNEL_UNK_28            rb
CHANNEL_UNK_29            rb
CHANNEL_VIBRATO_DELAY     rb
CHANNEL_VIBRATO_COUNTER   rb
CHANNEL_UNK_2C            rw
CHANNEL_SO_FLAGS          rb
CHANNEL_UNK_2F            rb
CHANNEL_UNK_30            rb
CHANNEL_UNK_31            rb
CHANNEL_UNK_32            rb
CHANNEL_UNK_33            rb
CHANNEL_UNK_34            rb
CHANNEL_UNK_35            rb
CHANNEL_UNK_36            rb
CHANNEL_UNK_37            rb
CHANNEL_UNK_38            rb
CHANNEL_UNK_39            rb
CHANNEL_UNK_3A            rb
CHANNEL_UNK_3B            rb
DEF CHANNEL_STRUCT_LENGTH EQU _RS

	const_def
	const CHANNEL_FLAGS_0_F      ; 0
	const CHANNEL_FLAGS_1_F      ; 1
	const CHANNEL_FLAGS_2_F      ; 2
	const CHANNEL_FLAGS_3_F      ; 3
	const CHANNEL_FLAGS_4_F      ; 4
	const CHANNEL_FLAGS_5_F      ; 5
	const CHANNEL_FLAGS_6_F      ; 6
	const CHANNEL_FLAGS_ACTIVE_F ; 7

DEF CHANNEL_FLAGS_0      EQU (1 << CHANNEL_FLAGS_0_F)
DEF CHANNEL_FLAGS_1      EQU (1 << CHANNEL_FLAGS_1_F)
DEF CHANNEL_FLAGS_2      EQU (1 << CHANNEL_FLAGS_2_F)
DEF CHANNEL_FLAGS_3      EQU (1 << CHANNEL_FLAGS_3_F)
DEF CHANNEL_FLAGS_4      EQU (1 << CHANNEL_FLAGS_4_F)
DEF CHANNEL_FLAGS_5      EQU (1 << CHANNEL_FLAGS_5_F)
DEF CHANNEL_FLAGS_6      EQU (1 << CHANNEL_FLAGS_6_F)
DEF CHANNEL_FLAGS_ACTIVE EQU (1 << CHANNEL_FLAGS_ACTIVE_F)

DEF NUM_TRACKS EQU 4

; track struct members
rsreset
TRACK_UNK00           rb
TRACK_UNK01           rb
TRACK_UNK02           rb
TRACK_UNK03           rb
TRACK_CHANNEL         rw
TRACK_UNK06           rb
TRACK_DURATION        rb
TRACK_TIMBRE          rb
TRACK_LENGTH          rb
TRACK_SWEEP           rb
TRACK_FADE_IN_SPEED   rb
TRACK_FADE_OUT_SPEED  rb
TRACK_UNK0D           rb
TRACK_UNK0E           rb
TRACK_UNK0F           rb
TRACK_UNK10           rb
TRACK_VOLUME_ENVELOPE rb
DEF TRACK_FREQUENCY       rw
TRACK_UNK14           rb
TRACK_UNK15           rb
TRACK_UNK16           rb
TRACK_UNK17           rb
DEF TRACK_STRUCT_LENGTH EQU _RS

; wVolume
DEF VOLUME_SO1_F     EQU 3
DEF VOLUME_SO2_F     EQU 7
DEF VOLUME_SO1_LEVEL EQU %00000111
DEF VOLUME_SO2_LEVEL EQU %01110000
DEF MAX_VOLUME       EQU VOLUME_SO1_LEVEL | VOLUME_SO2_LEVEL

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
