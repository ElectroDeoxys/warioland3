MoveWarioRight::
	ld a, [wCameraXDelta]
	add b
	ld [wCameraXDelta], a
	ld a, [wWarioXPos + 1]
	add b
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	adc 0
	ld [wWarioXPos + 0], a
	ret

MoveWarioLeft::
	ld a, [wCameraXDelta]
	sub b
	ld [wCameraXDelta], a
	ld a, [wWarioXPos + 1]
	sub b
	ld [wWarioXPos + 1], a
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [wWarioXPos + 0], a
	ret

; b = y offset
MoveWarioDown::
	ld a, [wCameraYDelta]
	add b
	ld [wCameraYDelta], a
MoveWarioDown_WithoutCameraOffset::
	ld a, [wWarioYPos + 1]
	add b
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	adc 0
	ld [wWarioYPos + 0], a
	ret

; b = y offset
MoveWarioUp::
	ld a, [wCameraYDelta]
	sub b
	ld [wCameraYDelta], a
MoveWarioUp_WithoutCameraOffset::
	ld a, [wWarioYPos + 1]
	sub b
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [wWarioYPos + 0], a
	ret

; b = ground shake counter
DoGroundShake::
	ld a, [wGroundShakeCounter]
	and a
	ret nz
	ld a, b
	ld [wGroundShakeCounter], a
	xor a
	ld [wIsWarioGroundShaking], a
	ret

ClearParticles::
	ld hl, wParticles
	ld b, PARTICLE_STRUCT_LENGTH * MAX_NUM_PARTICLES + 2
	xor a
	call WriteAToHL_BTimes
	ret
