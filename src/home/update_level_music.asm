SaveGameOrEnterPerfectScreen::
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jr nz, .dont_set_perfect
	ld a, [wTransitionParam]
	cp TRANSITION_EPILOGUE_NOT_PERFECT
	jr z, .dont_set_perfect
	cp TRANSITION_EPILOGUE_PERFECT
	jr z, .dont_set_perfect
	cp TRANSITION_GAME_OVER
	jr z, .dont_set_perfect
	ld a, [wGameModeFlags]
	and MODE_GAME_CLEARED
	jr z, .dont_set_perfect
	ld a, [wNumCollectedTreasures]
	dec a
	jr z, SetPerfectState
.dont_set_perfect
	ld a, [wSubState]
	ld [wPendingSubState], a
	ld a, ST_PAUSE_MENU
	ld [wState], a
	ld a, SST_PAUSE_18
	ld [wSubState], a
	ret

SetPerfectState::
	ld hl, wState
	ld [hl], ST_PERFECT
	xor a
	ld [wSubState], a
	ret

; loads a music ID to hMusicID, depending on wLevel
; and whether there's a new transformation music
UpdateLevelMusic::
	ld a, [wBossBattleMusic]
	and a
	jr nz, .boss_music
	ld a, [wTransformation]
	and a
	jr nz, .transformation

	ld a, [wROMBank]
	push af
	ld a, BANK(LevelMusic)
	bankswitch
.level_music
	ld a, [wLevel]
	ld d, $00
	add a
	ld e, a
	rl d
	ld hl, LevelMusic
	add hl, de
	ld a, [hli]
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	pop af
	bankswitch
	ret

.boss_music
	dec a
	ld d, $00
	add a
	ld e, a
	ld hl, .BossMusicIDs
	add hl, de
	ld a, [hli]
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	ret

.transformation
	ld a, [wTransformation]
	and %11111
	ld d, $00
	add a ; *2
	ld e, a
	rl d
	ld a, [wROMBank]
	push af
	ld a, BANK(TransformationMusicIDs)
	bankswitch
	ld hl, TransformationMusicIDs
	add hl, de
	ld a, [hli]
	cp $ff
	jr z, .level_music ; jump if null
	ldh [hMusicID + 1], a
	ld a, [hl]
	ldh [hMusicID + 0], a
	pop af
	bankswitch
	ret

.BossMusicIDs
	dw MUSIC_HIDDEN_FIGURE_BATTLE_1
	dw MUSIC_BOSS_BATTLE
	dw MUSIC_BOSS_DEFEAT

; set game state to Title
InitGameState::
	xor a ; ST_TITLE
	ld [wState], a
	ld [wSubState], a
	ret
