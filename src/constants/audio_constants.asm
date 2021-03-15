; pitch
; FrequencyTable indexes (see audio/notes.asm)
	const_def 1
	const C_ ; 1
	const C# ; 2
	const D_ ; 3
	const D# ; 4
	const E_ ; 5
	const F_ ; 6
	const F# ; 7
	const G_ ; 8
	const G# ; 9
	const A_ ; a
	const A# ; b
	const B_ ; c

; channel
; ChannelPointers indexes (see audio/engine.asm)
	const_def
	const CHAN1 ; 0
	const CHAN2 ; 1
	const CHAN3 ; 2
	const CHAN4 ; 3
NUM_MUSIC_CHANS EQU const_value
	const CHAN5 ; 4
	const CHAN6 ; 5
	const CHAN7 ; 6
	const CHAN8 ; 7
NUM_NOISE_CHANS EQU const_value - NUM_MUSIC_CHANS
NUM_CHANNELS EQU const_value

; channel struct members
rsreset
CHANNEL_FLAGS1     rb
CHANNEL_UNK_01     rb
CHANNEL_UNK_02     rw
CHANNEL_SOUND_BANK rb
CHANNEL_UNK_05     rb
CHANNEL_SOUND_ID   rw
CHANNEL_UNK_08     rb
CHANNEL_UNK_09     rb
CHANNEL_UNK_0A     rb
CHANNEL_UNK_0B     rb
CHANNEL_DUTY_CYCLE rb
CHANNEL_UNK_0D     rb
CHANNEL_SWEEP      rb
CHANNEL_UNK_0F     rb
CHANNEL_UNK_10     rb
CHANNEL_UNK_11     rb
CHANNEL_UNK_12     rb
CHANNEL_UNK_13     rb
CHANNEL_UNK_14     rb
CHANNEL_UNK_15     rb
CHANNEL_UNK_16     rb
CHANNEL_UNK_17     rb
CHANNEL_UNK_18     rb
CHANNEL_UNK_19     rb
CHANNEL_UNK_1A     rb
CHANNEL_UNK_1B     rb
CHANNEL_UNK_1C     rb
CHANNEL_UNK_1D     rb
CHANNEL_UNK_1E     rb
CHANNEL_UNK_1F     rb
CHANNEL_UNK_20     rb
CHANNEL_UNK_21     rb
CHANNEL_UNK_22     rb
CHANNEL_UNK_23     rb
CHANNEL_UNK_24     rb
CHANNEL_UNK_25     rb
CHANNEL_UNK_26     rb
CHANNEL_UNK_27     rb
CHANNEL_UNK_28     rb
CHANNEL_UNK_29     rb
CHANNEL_UNK_2A     rb
CHANNEL_UNK_2B     rb
CHANNEL_UNK_2C     rb
CHANNEL_UNK_2D     rb
CHANNEL_UNK_2E     rb
CHANNEL_UNK_2F     rb
CHANNEL_UNK_30     rb
CHANNEL_UNK_31     rb
CHANNEL_UNK_32     rb
CHANNEL_UNK_33     rb
CHANNEL_UNK_34     rb
CHANNEL_UNK_35     rb
CHANNEL_UNK_36     rb
CHANNEL_UNK_37     rb
CHANNEL_UNK_38     rb
CHANNEL_UNK_39     rb
CHANNEL_UNK_3A     rb
CHANNEL_UNK_3B     rb

CHANNEL_STRUCT_LENGTH EQU _RS

; wVolume
VOLUME_SO1_F     EQU 3
VOLUME_SO2_F     EQU 7
VOLUME_SO1_LEVEL EQU %00000111
VOLUME_SO2_LEVEL EQU %01110000
MAX_VOLUME       EQU $77
