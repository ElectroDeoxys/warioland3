
	const_def
	const PARTICLE_NONE             ; $00
	const PARTICLE_DEBRIS           ; $01
	const PARTICLE_STARS            ; $02
	const PARTICLE_SPLASH           ; $03
	const PARTICLE_DUST             ; $04
	const PARTICLE_SLIDE_DUST_RIGHT ; $05
	const PARTICLE_SLIDE_DUST_LEFT  ; $06
	const PARTICLE_SMOKE_LARGE      ; $07
	const PARTICLE_SMOKE_SMALL      ; $08
	const PARTICLE_BUBBLES          ; $09
	const PARTICLE_BOUNCY_JUMP      ; $0a
	const PARTICLE_BUBBLE_BURST     ; $0b
	const PARTICLE_ICE              ; $0c
	const PARTICLE_TREASURE_GLOW    ; $0d
	const PARTICLE_OWL              ; $0e
	const PARTICLE_SNOW             ; $0f
	const PARTICLE_MAGIC_1          ; $10
	const PARTICLE_MAGIC_2          ; $11
	const PARTICLE_MAGIC_STOP       ; $12
	const PARTICLE_UNUSED_13        ; $13
	const PARTICLE_UNUSED_14        ; $14
	const PARTICLE_UNUSED_15        ; $15
	const PARTICLE_UNUSED_16        ; $16
DEF NUM_PARTICLES EQU const_value

; the maximum number of active particles
DEF MAX_NUM_PARTICLES EQU 4

; wObjects structs constants
RSRESET
DEF PARTICLE_STRUCT_ID              rb ; $0
DEF PARTICLE_STRUCT_INITIALISED     rb ; $1
DEF PARTICLE_STRUCT_Y_POS           rw ; $2
DEF PARTICLE_STRUCT_X_POS           rw ; $4
DEF PARTICLE_STRUCT_DURATION        rb ; $6
DEF PARTICLE_STRUCT_FRAMESET_OFFSET rb ; $7
DEF PARTICLE_STRUCT_FRAME           rb ; $8
DEF PARTICLE_STRUCT_UNUSED_09       rb ; $9
DEF PARTICLE_STRUCT_UNUSED_0A       rb ; $a
DEF PARTICLE_STRUCT_UNUSED_0B       rb ; $b
DEF PARTICLE_STRUCT_UNUSED_0C       rb ; $c
DEF PARTICLE_STRUCT_UNUSED_0D       rb ; $d
DEF PARTICLE_STRUCT_UNUSED_0E       rb ; $e
DEF PARTICLE_STRUCT_UNUSED_0F       rb ; $f
DEF PARTICLE_STRUCT_LENGTH EQU _RS
