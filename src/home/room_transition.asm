TriggerRoomTransition::
	xor a
	ld [wGrabState], a
	ld [wRoomPalCycleDuration], a
	ld [wRoomAnimatedPalsEnabled], a
	ld [wWaterCurrent], a
	ld [wLastWaterCurrent], a
	ld [wCurWaterCurrent], a
	ld [wBossState], a
	ld [wIsBossBattle], a
	inc a ; TRUE
	ld [wIsIntangible], a

	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONF_DELAY_F, a
	ret nz ; delayed, don't transition for now

	ld hl, wSubState
	ld a, [wRoomTransitionParam]
	bit ROOMTRANSITIONF_DOOR_F, a
	jr z, .not_door
	inc [hl] ; door transition
	farcall GetWarioBGPtr
	push_wram $03
	ld a, h
	ld [wWarioTileBGPtr + 1], a
	ld a, l
	ld [wWarioTileBGPtr + 0], a
	pop_wram
	ret

.not_door
	inc [hl]
	inc [hl]
	stop_music
	stop_sfx
	ret
