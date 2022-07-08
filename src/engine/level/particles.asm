Func_c9f0: ; c9f0 (3:49f0)
	call Func_ce3e
;	fallthrough

; b = PARTICLE_* constant
CreateParticle:: ; c9f3 (3:49f3)
	ld a, [wCurParticleIndex]
	add a
	add a
	add a
	add a ; *16
	ld e, a
	ld d, $00
	ld a, [wCurParticleIndex]
	inc a
	and %11
	ld [wCurParticleIndex], a

	ld hl, wParticles
	add hl, de
	ld a, [hl]
	and a
	jr nz, .skip_num_increase
	ld a, [wNumParticles]
	inc a
	ld [wNumParticles], a
.skip_num_increase
	ld [hl], b ; PARTICLE_STRUCT_ID
	inc l
	xor a
	ld [hli], a ; PARTICLE_STRUCT_INITIALISED
	ldh a, [hYPosHi]
	ld [hli], a
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hXPosHi]
	ld [hli], a
	ldh a, [hXPosLo]
	ld [hli], a
	ret
; 0xca26

UpdateParticles: ; ca26 (3:4a26)
	ld a, [wNumParticles]
	and a
	ret z

FOR n, 1, NUM_PARTICLES + 1
	ld hl, wParticle{u:n}
	ld a, [hl]
	and a
	jr z, :+
	call .DoParticleFunc
:
ENDR
	ret

.DoParticleFunc:
	ld b, h
	ld c, l
	ld a, [hl]
	jumptable

	dw ParticleFunc_None           ; PARTICLE_NONE
	dw ParticleFunc_Debris         ; PARTICLE_DEBRIS
	dw ParticleFunc_Stars          ; PARTICLE_STARS
	dw ParticleFunc_Splash         ; PARTICLE_SPLASH
	dw ParticleFunc_Dust           ; PARTICLE_DUST
	dw ParticleFunc_SlideDustRight ; PARTICLE_SLIDE_DUST_RIGHT
	dw ParticleFunc_SlideDustLeft  ; PARTICLE_SLIDE_DUST_LEFT
	dw ParticleFunc_SmokeLarge     ; PARTICLE_SMOKE_LARGE
	dw ParticleFunc_SmokeSmall     ; PARTICLE_SMOKE_SMALL
	dw ParticleFunc_Bubbles        ; PARTICLE_BUBBLES
	dw ParticleFunc_BouncyJump     ; PARTICLE_BOUNCY_JUMP
	dw ParticleFunc_BubbleBurst    ; PARTICLE_BUBBLE_BURST
	dw ParticleFunc_Ice            ; PARTICLE_ICE
	dw ParticleFunc_OD             ; PARTICLE_0D
	dw ParticleFunc_Owl            ; PARTICLE_OWL
	dw ParticleFunc_OF             ; PARTICLE_0F
	dw ParticleFunc_Magic1         ; PARTICLE_MAGIC_1
	dw ParticleFunc_Magic2         ; PARTICLE_MAGIC_2
	dw ParticleFunc_MagicStop      ; PARTICLE_MAGIC_STOP
	dw ParticleFunc_None           ; PARTICLE_13
	dw ParticleFunc_None           ; PARTICLE_14
	dw ParticleFunc_None           ; PARTICLE_15
	dw ParticleFunc_None           ; PARTICLE_16
; 0xca86

ParticleFunc_None: ; ca86 (3:4a86)
	ret
; 0xca87

ParticleFunc_Debris: ; ca87 (3:4a87)
	push bc
	inc c
	ld a, [bc] ; PARTICLE_STRUCT_INITIALISED
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a ; PARTICLE_STRUCT_DURATION
	inc c
	ld [bc], a ; PARTICLE_STRUCT_FRAMESET_OFFSET

	play_sfx SFX_BLOCK_BREAK

	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Debris
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcab8

ParticleFunc_Stars: ; cab8 (3:4ab8)
	push bc
	inc c
	ld a, [bc] ; PARTICLE_STRUCT_INITIALISED
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a ; PARTICLE_STRUCT_DURATION
	inc c
	ld [bc], a ; PARTICLE_STRUCT_FRAMESET_OFFSET
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Stars
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcae1

ParticleFunc_Splash: ; cae1 (3:4ae1)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Splash
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcb0a

ParticleFunc_Dust: ; cb0a (3:4b0a)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Dust
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcb33

ParticleFunc_SlideDustRight: ; cb33 (3:4b33)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	inc c
	ldh a, [hYPosHi]
	ld [bc], a
	inc c
	ldh a, [hYPosLo]
	ld [bc], a
	inc c
	ldh a, [hXPosHi]
	ld [bc], a
	inc c
	ldh a, [hXPosLo]
	ld [bc], a
	inc c
.update_anim
	call ParticleAnim_Dust
	pop bc

	ld a, [wWarioState]
	cp WST_SLIDING
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcb82

ParticleFunc_SlideDustLeft: ; cb82 (3:4b82)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add $0c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	inc c
	ldh a, [hYPosHi]
	ld [bc], a
	inc c
	ldh a, [hYPosLo]
	ld [bc], a
	inc c
	ldh a, [hXPosHi]
	ld [bc], a
	inc c
	ldh a, [hXPosLo]
	ld [bc], a
	inc c
.update_anim
	call ParticleAnim_Dust
	pop bc
	ld a, [wWarioState]
	cp WST_SLIDING
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcbd1

ParticleFunc_SmokeLarge: ; cbd1 (3:4bd1)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_SmokeLarge
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcbfa

ParticleFunc_SmokeSmall: ; cbfa (3:4bfa)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_SmokeSmall
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcc23

ParticleFunc_Bubbles: ; cc23 (3:4c23)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Bubbles
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcc4c

ParticleFunc_BouncyJump: ; cc4c (3:4c4c)
	ld a, [wWarioState]
	cp WST_BOUNCY_AIRBORNE
	jr nz, .deinit
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	ld hl, wPos
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc c
	ldh a, [hYPosHi]
	ld [bc], a
	inc c
	ldh a, [hYPosLo]
	ld [bc], a
	inc c
	ldh a, [hXPosHi]
	ld [bc], a
	inc c
	ldh a, [hXPosLo]
	ld [bc], a
	inc c
.update_anim
	call ParticleAnim_BouncyJump
	pop bc
	ld a, [wCurParticleAnimFinished]
	and a
	ret z

.deinit
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcc99

ParticleFunc_BubbleBurst: ; cc99 (3:4c99)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_BubbleBurst
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xccc2

ParticleFunc_Ice: ; ccc2 (3:4cc2)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Ice
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcceb

ParticleFunc_OD: ; cceb (3:4ceb)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_OD
	pop bc
	ret
; 0xcd09

ParticleFunc_Owl: ; cd09 (3:4d09)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	ld a, [bc]
	sub $02
	ld [bc], a
	dec c
	ld a, [bc]
	sbc $00
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_Owl
	pop bc

	ld a, [wCurSpriteYCoord]
	cp $c0
	ret c
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcd3d

ParticleFunc_OF: ; cd3d (3:4d3d)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	inc c
	inc c
	inc c
	inc c
	inc c
.update_anim
	call ParticleAnim_OF
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcd66

ParticleFunc_Magic1: ; cd66 (3:4d66)
	ld a, [wWarioState]
	cp WST_MAGIC_STOPPING
	jr z, .deinit

	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	ld hl, wPos
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc c
	ldh a, [hYPosHi]
	ld [bc], a
	inc c
	ldh a, [hYPosLo]
	ld [bc], a
	inc c
	ldh a, [hXPosHi]
	ld [bc], a
	inc c
	ldh a, [hXPosLo]
	ld [bc], a
	inc c
.update_anim
	call ParticleAnim_Magic1
	pop bc
	ret

.deinit
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcdaf

ParticleFunc_Magic2: ; cdaf (3:4daf)
	ld a, [wWarioState]
	cp WST_MAGIC_STOPPING
	jr z, .deinit

	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initalised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initalised
	ld hl, wPos
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc c
	ldh a, [hYPosHi]
	ld [bc], a
	inc c
	ldh a, [hYPosLo]
	ld [bc], a
	inc c
	ldh a, [hXPosHi]
	ld [bc], a
	inc c
	ldh a, [hXPosLo]
	ld [bc], a
	inc c
.update_anim
	call ParticleAnim_Magic2
	pop bc
	ret

.deinit
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xcdf8

ParticleFunc_MagicStop: ; cdf8 (3:4df8)
	push bc
	inc c
	ld a, [bc]
	and a
	jr nz, .initialised

; init
	inc a
	ld [bc], a
	inc c
	inc c
	inc c
	inc c
	inc c
	xor a
	ld [bc], a
	inc c
	ld [bc], a
	dec c
	jr .update_anim

.initialised
	ld hl, wPos
	ld de, hYPosHi
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc c
	ldh a, [hYPosHi]
	ld [bc], a
	inc c
	ldh a, [hYPosLo]
	ld [bc], a
	inc c
	ldh a, [hXPosHi]
	ld [bc], a
	inc c
	ldh a, [hXPosLo]
	ld [bc], a
	inc c
.update_anim
	call ParticleAnim_MagicStop
	pop bc

	ld a, [wCurParticleAnimFinished]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret
; 0xce3e

Func_ce3e: ; ce3e (3:4e3e)
	ld a, h
	sub $a0
	ld h, a
	and $f0
	swap a
	ld d, a
	ld a, [wFloorSRAMBank]
	dec a
	add a
	add d
	ldh [hYPosHi], a
	ld a, h
	and $0f
	swap a
	add $10
	ldh [hYPosLo], a
	ldh a, [hYPosHi]
	adc $00
	ldh [hYPosHi], a
	ld a, l
	and $f0
	swap a
	ldh [hXPosHi], a
	ld a, l
	and $0f
	swap a
	add $08
	ldh [hXPosLo], a
	ldh a, [hXPosHi]
	adc $00
	ldh [hXPosHi], a
	ret
; 0xce75

ParticleAnim_Bubbles: ; ce75 (3:4e75)
	ld h, b
	ld l, c
	ld a, [wDirection]
	and a
	jr nz, .right
; left
	ld de, Frameset_d502
	jr .got_frameset
.right
	ld de, Frameset_d50b
.got_frameset
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
	jp AddParticleSprite
; 0xcea1

ParticleAnim_Magic1: ; cea1 (3:4ea1)
	ld h, b
	ld l, c
	ld de, Frameset_d8e7
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticle], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d80d
	jp AddParticleSprite
; 0xcec2

ParticleAnim_Magic2: ; cec2 (3:4ec2)
	ld h, b
	ld l, c
	ld de, Frameset_d8f4
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticle], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d80d
	jp AddParticleSprite
; 0xcee3

ParticleAnim_MagicStop: ; cee3 (3:4ee3)
	ld h, b
	ld l, c
	ld de, Frameset_d901
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticle], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d80d
	jp AddParticleSprite
; 0xcf04

ParticleAnim_Owl: ; cf04 (3:4f04)
	ld h, b
	ld l, c
	ld de, Frameset_d7b4
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d763
	jp AddParticleSprite
; 0xcf25

ParticleAnim_OD: ; cf25 (3:4f25)
	ld h, b
	ld l, c
	ld de, Frameset_d75a
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d716
	jp AddParticleSprite
; 0xcf46

ParticleAnim_BubbleBurst: ; cf46 (3:4f46)
	ld h, b
	ld l, c
	ld de, Frameset_d622
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d5ae
	jp AddParticleSprite
; 0xcf67

ParticleAnim_BouncyJump: ; cf67 (3:4f67)
	ld h, b
	ld l, c
	ld de, Frameset_d591
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d532
	jp AddParticleSprite
; 0xcf88

ParticleAnim_OF: ; cf88 (3:4f88)
	ld h, b
	ld l, c
	ld de, Frameset_d806
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticle], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d7bd
	jp AddParticleSprite
; 0xcfa9

ParticleAnim_Ice: ; cfa9 (3:4fa9)
	ld h, b
	ld l, c
	ld a, [wDirection]
	and a
	jr nz, .right
	ld de, Frameset_d6fd
	jr .left
.right
	ld de, Frameset_d6e4
.left
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d62b
	jp AddParticleSprite
; 0xcfd5

ParticleAnim_Dust: ; cfd5 (3:4fd5)
	ld h, b
	ld l, c
	ld de, Frameset_d4c5
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
	jp AddParticleSprite
; 0xcff6

ParticleAnim_Debris: ; cff6 (3:4ff6)
	ld h, b
	ld l, c
	ld de, Frameset_d49a
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
	jr AddParticleSprite
; 0xd016

ParticleAnim_Stars: ; d016 (3:5016)
	ld h, b
	ld l, c
	ld de, Frameset_d525
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
	jr AddParticleSprite
; 0xd036

ParticleAnim_SmokeLarge: ; d036 (3:5036)
	ld h, b
	ld l, c
	ld de, Frameset_d4f3
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
	jr AddParticleSprite
; 0xd056

ParticleAnim_SmokeSmall: ; d056 (3:5056)
	ld h, b
	ld l, c
	ld de, Frameset_d4ea
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
	jr AddParticleSprite
; 0xd076

ParticleAnim_Splash: ; d076 (3:5076)
	ld h, b
	ld l, c
	ld de, Frameset_d4ba
	call UpdateParticleAnimation
	ld a, [hld]
	ld [wCurParticleFrame], a
	dec l
	dec l
	ld a, [hld]
	ld [wCurParticleXCoord], a
	dec l
	ld a, [hld]
	ld [wCurParticleYCoord], a
	xor a
	ld [wCurParticleAttributes], a
	ld hl, OAM_d20e
;	fallthrough

AddParticleSprite: ; d094 (3:5094)
	ld a, [wCameraConfigFlags]
	cp CAMCONFIG_XSCROLL2 | CAMCONFIG_TRANSITIONS | CAMCONFIG_EDGE_RIGHT | CAMCONFIG_EDGE_LEFT
	jr z, .asm_d0c5
	ld a, [wSCY]
	ld b, a
	ld a, [wCurParticleYCoord]
	add $10
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurParticleXCoord]
	add $08
	sub b
	ld [wCurSpriteXCoord], a
	ld a, [wCurParticleFrame]
	ld [wCurSpriteFrame], a
	ld a, [wCurParticleAttributes]
	ld [wCurSpriteAttributes], a
	call TryAddSprite
	ret

.asm_d0c5
	ld a, [wcac4 + 1]
	ld b, a
	ld a, [wCurParticleYCoord]
	add $10
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [wcac6 + 1]
	ld b, a
	ld a, [wCurParticleXCoord]
	add $08
	sub b
	ld [wCurSpriteXCoord], a
	ld a, [wCurParticleFrame]
	ld [wCurSpriteFrame], a
	ld a, [wCurParticleAttributes]
	ld [wCurSpriteAttributes], a
	call TryAddSprite
	ret
; 0xd0ef

; de = frameset
UpdateParticleAnimation: ; d0ef (3:50ef)
	xor a
	ld [wCurParticleAnimFinished], a
	ld a, [hl] ; duration
	sub 1
	ld [hli], a
	jr nc, .no_new_frame
	ld a, [hli] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset_anim
	ld [hld], a ; frame
	ld a, [hl] ; frameset offset
	add $2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hli], a ; duration
.no_new_frame
	inc hl
	ret

.reset_anim
	dec hl
	xor a
	ld [hld], a ; frameset offset
	ld [hli], a ; duration
	inc hl
	ld a, TRUE
	ld [wCurParticleAnimFinished], a
	ret
; 0xd11a
