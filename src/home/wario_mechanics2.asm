OpenActionHelp::
	ld hl, wState
	ld a, ST_ACTION_HELP
	ld [hli], a
	ld [hl], $00 ; wSubState
	ret

ReleaseOwl::
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $18
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	ld b, PARTICLE_OWL
	farcall CreateParticle
	ret

; returns nz if standing on slippery ground
IsOnSlipperyGround::
	xor a
	ld [wIsOnSlipperyGround], a

	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a ; - wCollisionBoxLeft - 3
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc 0
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret nz

	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a ; wCollisionBoxRight - 3
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	farcall Func_19b51
	ld a, [wIsOnSlipperyGround]
	and a
	ret

Func_1762::
	ld a, [wJumpVelIndex]
	cp FALLING_JUMP_VEL_INDEX
	jr nc, .asm_1776
	ld a, [wWalkVelIndex]
	cp $10
	jr c, .asm_1775
	ld a, $0c
	ld [wWalkVelIndex], a
.asm_1775
	ret

.asm_1776
	ld a, [wWalkVelIndex]
	cp $08
	jr c, .asm_1782
	ld a, $04
	ld [wWalkVelIndex], a
.asm_1782
	ret
