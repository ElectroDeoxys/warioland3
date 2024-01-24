Func_19706:
	ld a, TRUE
	ld [wc0da], a
	call Func_19741
	xor a ; FALSE
	ld [wc0da], a
	ret

Func_19713:
	ld a, TRUE
	ld [wc0da], a
	call Func_197b1
	xor a ; FALSE
	ld [wc0da], a
	ret

Func_19720:
	ld a, TRUE
	ld [wc0da], a
	call CheckAirborneCollision
	xor a
	ld [wc0da], a
	ld a, b
	and a
	jp nz, TriggerFloorTransition
	jp TriggerDownwardsFloorTransition

; checks collision in side that Wario is facing
CheckFrontCollision:
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
	ld a, [wDirection]
	and a
	jr z, CheckBottomLeftCollision
	jr CheckBottomRightCollision

Func_19741:
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
;	fallthrough

CheckBottomRightCollision:
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .flat
	ld a, [wCollisionBoxRight]
	sub 1
	ld c, a
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
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 7
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .got_collision_coords

.flat
	ld a, [wCollisionBoxRight]
	sub 1
	ld c, a
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
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 1
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

.got_collision_coords
	ldh a, [hYPosLo]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jp z, Func_19832
	ld a, [wAttackCounter]
	and a
	jp nz, Func_19823
	ld a, b
	ret

Func_197b1:
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
;	fallthrough

CheckBottomLeftCollision:
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .flat
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 1
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 7
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .got_collision_coords

.flat
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 1
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxBottom]
	cpl
	inc a
	add 1
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

.got_collision_coords
	ldh a, [hYPosLo]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jr z, Func_19832
	ld a, [wAttackCounter]
	and a
	jr nz, Func_19823
	ld a, b
	ret

Func_19823:
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
	call Func_19bd3
	ld a, $01
	ld [wUnused_c18d], a
	ld b, a
	ret

Func_19832:
	ld a, [wIsCrouching]
	and a
	jp nz, .asm_198c1
	ld a, [wCollisionBoxTop]
	ld b, a
	ld a, [wWarioYPos + 1]
	add b
	add 2
	and $f0
	ld b, a
	ld a, [wc0dc]
	cp b
	jp z, .asm_198c1
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
	call Func_19bd3
	and $0f
	ret z
	ld a, [wJumpVelTable]
	and a
	jp nz, .done
	ld a, [wAttackCounter]
	and a
	jr nz, .done
	ld a, [wWaterInteraction]
	and a
	jr nz, .done
	ld a, [wIsCrouching]
	and a
	jr nz, .done
	ld a, [wIsOnSteppableObject]
	and a
	jr nz, .done
	ld a, [wTransformation]
	and a
	jr nz, .done
	ld a, [wIsInSand]
	and a
	jr nz, .done

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .add_offset
	bit D_LEFT_F, a
	jr nz, .sub_offset
	ld a, [wDirection]
	and a
	jr nz, .add_offset
.sub_offset
	ld b, 2
	call SubXOffset
	farcall CrouchOrSlide
	jr .asm_198c1
.add_offset
	ld b, 2
	call AddXOffset
	farcall CrouchOrSlide
	jr .asm_198c1

.done
	ret

.asm_198c1
	xor a
	ld [wUnused_c18d], a
	ld b, a
	ret

; resets wSlopeInteraction
Func_198c7:
	xor a
	ld [wSlopeInteraction], a
	get_pos
	call Func_19b51
	ret

CheckCentreCollision:
; collision in centre
	ld a, $01
	ld [wced3], a
	call Func_198c7
	and a
	ret nz
	xor a
	ld [wced3], a

; collision on left
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a ; -wCollisionBoxLeft - 3
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b8b
	and a
	ret nz

; collision on right
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
	call Func_19b8b
	and a
	ret nz

	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, a
	get_pos_y
	ld a, $01
	ret

Func_19942:
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_1994e
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
.asm_1994e
	ld a, [wCollisionBoxTop]
	cpl
	inc a
	add 2
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19beb
	ret

CheckUpCollision:
	ld a, $01
	ld [wced2], a
	call Func_19942
	and a
	ret nz
	xor a
	ld [wced2], a
	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_19988
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
.asm_19988
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wCollisionBoxTop]
	cpl
	inc a
	add 2
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	and a
	ret nz

	ld a, [wTransformation]
	cp TRANSFORMATION_PUFFY_WARIO
	jr z, .asm_199c0
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
.asm_199c0
	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a
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
	ld a, [wCollisionBoxTop]
	cpl
	inc a
	add 2
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	ret

CheckAirborneCollision:
	call .Func_19a53
	and a
	ret nz

	ld a, [wIsSmashAttacking]
	and a
	jr z, .no_smash_attack_1
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
.no_smash_attack_1
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub 3
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19bfb
	and a
	ret nz
	ld a, [wIsOnSteppableObject]
	and a
	jr z, .asm_19a22
	ld b, a
	ret

.asm_19a22
	ld a, [wIsSmashAttacking]
	and a
	jr z, .no_smash_attack_2
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
.no_smash_attack_2
	ld a, [wCollisionBoxRight]
	sub 3
	ld c, a
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
	call Func_19bfb
	and a
	ret nz
	ld a, [wIsOnSteppableObject]
	and a
	ret z
	ld b, a
	ret

.Func_19a53
	xor a
	ld [wSlopeInteraction], a
	ld a, [wIsSmashAttacking]
	and a
	jr z, .no_smash_attack_3
	ld a, TRUE
	ld [wCellFuncBreakFlag], a
.no_smash_attack_3
	get_pos
	call Func_19b7b
	ret

Func_19a77:
	xor a ; FALSE
	ld [wc1ca], a
	ld a, [wCollisionBoxLeft]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b3a
	and a
	jr z, .asm_19aa2
	ld a, [wc1ca]
	and a
	ret z

.asm_19aa2
	xor a ; FALSE
	ld [wc1ca], a
	ld a, [wCollisionBoxRight]
	sub $03
	ld c, a
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
	call Func_19b3a
	and a
	jr z, .asm_19ac7
	ret
.asm_19ac7
	ld a, TRUE
	ld [wc1ca], a
	ret

Func_19acd:
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

Func_19ae4:
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $1a
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

Func_19afb:
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
	jr Func_19b3a

; collision on centre
Func_19b12:
	get_pos
	jr Func_19b3a

; collision on top
Func_19b25:
	ld hl, wWarioXPos + 1
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub 4
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
;	fallthrough

Func_19b3a:
	xor a
	ld [wWaterInteraction], a
	ld [wLadderInteraction], a
	ld [wRoomTransitionParam], a
	ld [wIsInSand], a
	ld [wIsNearFence], a
	ld [wIsInAirCurrent], a
	call Func_19c0b
	ret

Func_19b51::
	ld hl, hPos
	call GetCell
	ld a, 1 << 0
	ld [wc0d6], a
;	fallthrough

Func_19b5c:
	call ProcessCellFunction
	ld b, a
	ret

Func_19b61::
	call DecrementXCell
	ld a, [hl]
	inc a
	ret z
	jr Func_19b5c

Func_19b69::
	call IncrementXCell
	ld a, [hl]
	and a
	ret z
	jr Func_19b5c

DecrementXCell:
	ld hl, wCellPtr + 1
	dec [hl]
	ret

IncrementXCell:
	ld hl, wCellPtr + 1
	inc [hl]
	ret

Func_19b7b::
	ld hl, hPos
	call GetCell
	ld a, 1 << 1
	ld [wc0d6], a
	call ProcessCellFunction
	ld b, a
	ret

Func_19b8b::
	ld hl, hPos
	call GetCell
	ld a, 1 << 2
	ld [wc0d6], a
	call ProcessCellFunction
	ld b, a
	ret

Func_19b9b::
	ld hl, hPos
	call GetCell
	ld a, 1 << 3
	ld [wc0d6], a
	call ProcessCellFunction
	ld b, a
	ret

; unreferenced
Func_19bab:
	ld hl, wCellPtr + 1
	dec [hl]
	ld a, [hld]
	ld h, [hl]
	ld l, a
	call ProcessCellFunction
	ld b, a
	ret

; unreferenced
Func_19bb7:
	ld hl, wCellPtr + 1
	inc [hl]
	ld a, [hld]
	ld h, [hl]
	ld l, a
	call ProcessCellFunction
	ld b, a
	ret

Func_19bc3::
	ld hl, hPos
	call GetCell
	ld a, 1 << 4
	ld [wc0d6], a
Func_19bce:
	call ProcessCellFunction
	ld b, a
	ret

Func_19bd3:
	ld hl, wCellPtr
	dec [hl]
	ld a, [hl]
	cp $a0 - 1
	jr nz, .asm_19be6
	ld a, [wCellPtrBank]
	dec a
	ld [wCellPtrBank], a
	ld a, $c0 - 1
	ld [hl], a

.asm_19be6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	jr Func_19bce

Func_19beb:
	ld hl, hPos
	call GetCell
	ld a, 1 << 5
	ld [wc0d6], a
	call ProcessCellFunction
	ld b, a
	ret

Func_19bfb:
	ld hl, hPos
	call GetCell
	ld a, 1 << 6
	ld [wc0d6], a
	call ProcessCellFunction
	ld b, a
	ret

Func_19c0b:
	ld hl, hPos
	call GetCell
	ld a, 1 << 7
	ld [wc0d6], a
	call ProcessCellFunction
	ld b, a
	ret
