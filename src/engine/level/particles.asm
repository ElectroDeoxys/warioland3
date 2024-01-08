; b = PARTICLE_* constant
; hl = cell
CreateParticleInCell:
	call Func_ce3e
;	fallthrough

; b = PARTICLE_* constant
CreateParticle::
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

UpdateParticles:
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
	dw ParticleFunc_TreasureGlow   ; PARTICLE_TREASURE_GLOW
	dw ParticleFunc_Owl            ; PARTICLE_OWL
	dw ParticleFunc_Snow            ; PARTICLE_SNOW
	dw ParticleFunc_Magic1         ; PARTICLE_MAGIC_1
	dw ParticleFunc_Magic2         ; PARTICLE_MAGIC_2
	dw ParticleFunc_MagicStop      ; PARTICLE_MAGIC_STOP
	dw ParticleFunc_None           ; PARTICLE_13
	dw ParticleFunc_None           ; PARTICLE_14
	dw ParticleFunc_None           ; PARTICLE_15
	dw ParticleFunc_None           ; PARTICLE_16

ParticleFunc_None:
	ret

ParticleFunc_Debris:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_Stars:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_Splash:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_Dust:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_SlideDustRight:
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
	ld hl, wWarioXPos + 1
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

ParticleFunc_SlideDustLeft:
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
	ld hl, wWarioXPos + 1
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

ParticleFunc_SmokeLarge:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_SmokeSmall:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_Bubbles:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_BouncyJump:
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
	ld hl, wWarioPos
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
	ld a, [wCurParticleAnimEnded]
	and a
	ret z

.deinit
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_BubbleBurst:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_Ice:
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_TreasureGlow:
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
	call ParticleAnim_TreasureGlow
	pop bc
	ret

ParticleFunc_Owl:
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

ParticleFunc_Snow:
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
	call ParticleAnim_Snow
	pop bc

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

ParticleFunc_Magic1:
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
	ld hl, wWarioPos
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

ParticleFunc_Magic2:
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
	ld hl, wWarioPos
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

ParticleFunc_MagicStop:
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
	ld hl, wWarioPos
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

	ld a, [wCurParticleAnimEnded]
	and a
	ret z
	xor a
	ld [bc], a
	ld hl, wNumParticles
	dec [hl]
	ret

Func_ce3e:
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

ParticleAnim_Bubbles:
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

ParticleAnim_Magic1:
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

ParticleAnim_Magic2:
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

ParticleAnim_MagicStop:
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

ParticleAnim_Owl:
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

ParticleAnim_TreasureGlow:
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

ParticleAnim_BubbleBurst:
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

ParticleAnim_BouncyJump:
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

ParticleAnim_Snow:
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

ParticleAnim_Ice:
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

ParticleAnim_Dust:
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

ParticleAnim_Debris:
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

ParticleAnim_Stars:
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

ParticleAnim_SmokeLarge:
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

ParticleAnim_SmokeSmall:
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

ParticleAnim_Splash:
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

AddParticleSprite:
	ld a, [wCameraConfigFlags]
	cp CAM_XSCROLL2 | CAM_TRANSITIONS | CAM_BORDER_RIGHT | CAM_BORDER_LEFT
	jr z, .asm_d0c5
	ld a, [wSCY]
	ld b, a
	ld a, [wCurParticleYCoord]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurParticleXCoord]
	add OAM_X_OFS
	sub b
	ld [wCurSpriteXCoord], a
	ld a, [wCurParticleFrame]
	ld [wCurSpriteFrame], a
	ld a, [wCurParticleAttributes]
	ld [wCurSpriteAttributes], a
	call TryAddSprite
	ret

.asm_d0c5
	ld a, [wCameraSCY + 1]
	ld b, a
	ld a, [wCurParticleYCoord]
	add OAM_Y_OFS
	sub b
	ld [wCurSpriteYCoord], a
	ld a, [wCameraSCX + 1]
	ld b, a
	ld a, [wCurParticleXCoord]
	add OAM_X_OFS
	sub b
	ld [wCurSpriteXCoord], a
	ld a, [wCurParticleFrame]
	ld [wCurSpriteFrame], a
	ld a, [wCurParticleAttributes]
	ld [wCurSpriteAttributes], a
	call TryAddSprite
	ret

; de = frameset
UpdateParticleAnimation:
	xor a
	ld [wCurParticleAnimEnded], a
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
	ld [wCurParticleAnimEnded], a
	ret
