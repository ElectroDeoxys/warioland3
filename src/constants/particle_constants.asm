
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
	const PARTICLE_0D               ; $0d
	const PARTICLE_OWL              ; $0e
	const PARTICLE_0F               ; $0f
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
rsreset
PARTICLE_STRUCT_ID              rb ; $00
PARTICLE_STRUCT_INITIALISED     rb ; $01
PARTICLE_STRUCT_Y_POS           rw ; $02
PARTICLE_STRUCT_X_POS           rw ; $04
PARTICLE_STRUCT_DURATION        rb ; $06
PARTICLE_STRUCT_FRAMESET_OFFSET rb ; $07
PARTICLE_STRUCT_FRAME           rb ; $08
PARTICLE_STRUCT_UNUSED_09       rb ; $09
PARTICLE_STRUCT_UNUSED_0A       rb ; $0a
PARTICLE_STRUCT_UNUSED_0B       rb ; $0b
PARTICLE_STRUCT_UNUSED_0C       rb ; $0c
PARTICLE_STRUCT_UNUSED_0D       rb ; $0d
PARTICLE_STRUCT_UNUSED_0E       rb ; $0e
PARTICLE_STRUCT_UNUSED_0F       rb ; $0f
DEF PARTICLE_STRUCT_LENGTH EQU _RS
