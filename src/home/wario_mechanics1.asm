ApplyJumpVelocity::
	ld a, [wJumpVelTable]
	dec a
	jr z, .knock_back ; JUMP_VEL_KNOCK_BACK
	dec a
	jr z, .normal_jump ; JUMP_VEL_NORMAL
	dec a
	jr z, .high_jump ; JUMP_VEL_HIGH_JUMP
	dec a
	jr z, .bouncy_jump ; JUMP_VEL_BOUNCY_JUMP
	dec a
	jr z, .bouncy_high_jump ; JUMP_VEL_BOUNCY_HIGH_JUMP
	ret

.bouncy_high_jump
	ld hl, JumpVelTable_BouncyHighJump
	jr .got_jump_table
.bouncy_jump
	ld hl, JumpVelTable_BouncyJump
	jr .got_jump_table
.high_jump
	ld hl, JumpVelTable_HighJump
	jr .got_jump_table
.normal_jump
	ld hl, JumpVelTable_Normal
	jr .got_jump_table
.knock_back
	ld hl, JumpVelTable_KnockBack

.got_jump_table
	ld a, [wJumpVelIndex]
	ld e, a
	ld d, $00
	add hl, de
	bit 7, [hl]
	jr z, .falling

; rising
	ld a, [hl]
	cpl
	inc a
	ld b, a
	call MoveWarioUp
	ld hl, wJumpVelIndex
	inc [hl]
	jr .done

.falling
	xor a
	ld [wDoFullJump], a
	ld b, [hl]
	call MoveWarioDown
	ld hl, wJumpVelIndex
	inc [hl]
	ld a, [hl]
	cp MAX_JUMP_VEL_INDEX
	jr c, .done
	ld [hl], MAX_JUMP_VEL_INDEX
.done
	ret

TriggerDownwardsFloorTransition::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .done
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .done
	jr c, .done
	jp StartDownwardsFloorTransition
.done
	ret

TriggerFloorTransition::
	update_pos_y
TriggerFloorTransition_SkipUpdateYPos::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .done
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .done
	jr c, .upwards
	call StartDownwardsFloorTransition
	jr .done
.upwards
	call StartUpwardsFloorTransition
.done
	ret

ApplyWalkVelocity_Right::
	ld a, [wDirection]
	and a
	jr nz, .dir_right
; dir left
	xor a
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

.dir_right
	ld a, [wWarioSlopeInteraction]
	bit RIGHT_SLOPE_F, a
	jr z, ApplyWalkVelocity
;	fallthrough

ApplySlopedWalkVelocity::
	ld a, [wWalkVelIndex]
	cp $08
	jr c, ApplyWalkVelocity
	ld a, $04
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

ApplyWalkVelocity_Left::
	ld a, [wDirection]
	and a
	jr z, .dir_left
; dir right
	xor a
	ld [wWalkVelIndex], a
	jr ApplyWalkVelocity

.dir_left
	ld a, [wWarioSlopeInteraction]
	bit LEFT_SLOPE_F, a
	jr z, ApplyWalkVelocity
	jr ApplySlopedWalkVelocity

ApplyWalkVelocity::
	ld a, [wWalkVelIndex]
	ld e, a
	ld d, $00
	ld hl, WalkVelTable
	add hl, de
	ld b, [hl]
	ld hl, wWalkVelIndex
	ld a, [hl]
	cp $1b
	jr z, .cap
	inc [hl]
	ret
.cap
	and $fc
	ld [hl], a
	ret

InvalidWarioStateReset::
	jp Init

RecoverFromTransformation::
	call ClearTransformationValues
	ld a, $10
	ld [wInvincibleCounter], a
	jr ResetLevelMusicWarioPalsAndState

RecoverFromTransformation_WithoutInvincibility::
	call ClearTransformationValues
;	fallthrough

ResetLevelMusicWarioPalsAndState::
	call UpdateLevelMusic
	ld hl, WarioDefaultPal
	call SetWarioPal
	ld a, [wJumpVelTable]
	and a
	jr nz, .fall
	farcall SetState_Idling
	jp PlayRecoverySFX
.fall
	farcall StartFall
	jp PlayRecoverySFX
