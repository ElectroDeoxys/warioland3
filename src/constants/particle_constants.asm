
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
	const PARTICLE_13               ; $13 (unused)
	const PARTICLE_14               ; $14 (unused)
	const PARTICLE_15               ; $15 (unused)
	const PARTICLE_16               ; $16 (unused)

; the maximum number of active particles
DEF NUM_PARTICLES EQU 4

; wObjects structs constants
RSRESET
PARTICLE_STRUCT_ID              rb ; $0
PARTICLE_STRUCT_INITIALISED     rb ; $1
PARTICLE_STRUCT_Y_POS           rw ; $2
PARTICLE_STRUCT_X_POS           rw ; $4
PARTICLE_STRUCT_DURATION        rb ; $6
PARTICLE_STRUCT_FRAMESET_OFFSET rb ; $7
PARTICLE_STRUCT_FRAME           rb ; $8
PARTICLE_STRUCT_UNUSED_09       rb ; $9
PARTICLE_STRUCT_UNUSED_0A       rb ; $a
PARTICLE_STRUCT_UNUSED_0B       rb ; $b
PARTICLE_STRUCT_UNUSED_0C       rb ; $c
PARTICLE_STRUCT_UNUSED_0D       rb ; $d
PARTICLE_STRUCT_UNUSED_0E       rb ; $e
PARTICLE_STRUCT_UNUSED_0F       rb ; $f
DEF PARTICLE_STRUCT_LENGTH EQU _RS
