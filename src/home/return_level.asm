ReturnToLevelFromGolf::
	call DisableLCD
	push_wram $03
	ld a, [wTempAnimatedTilesFrameDuration]
	ld [wAnimatedTilesFrameDuration], a
	ld a, [wTempAnimatedTilesGroup]
	ld [wAnimatedTilesGfx], a
	pop_wram
	xor a
	ld [wAnimatedTilesFrameCount], a
	ld [wAnimatedTilesFrame], a
	ld a, TRUE
	ld [wRoomAnimatedTilesEnabled], a
	call LoadBackupVRAM
	ld a, [wRoomTransitionParam]
	and ROOMTRANSITION_FLAGS_MASK
	or ROOMTRANSITION_DOOR
	ld [wRoomTransitionParam], a
	farcall DrawLevelObjectsAfterLevelReturn
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
;	fallthrough

ReturnToPendingLevelState::
	ld hl, wState
	ld [hl], ST_LEVEL
	ld a, [wPendingSubState]
	ld [wSubState], a
	ret

ReturnToMapFromLevel::
	ld hl, wDayNight
	set 7, [hl]
ReturnToMap::
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a
	farcall StartOverworldState
	ret

ReturnToPauseMenuFromActionHelp::
	push_wram $03
	farcall _ReturnToPauseMenuFromActionHelp
	pop_wram
	ret
