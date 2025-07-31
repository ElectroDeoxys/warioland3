InitGameOverScreen:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	call LoadGameOverPals
	call LoadGameOverGfx
	call Func_db4cf
	call VBlank_GameOver

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ld a, $60
	ldh [rSCY], a
	ld [wSCY], a

	ld hl, wGameOverWario
	ld a, $80
	ld [hli], a ; y
	ld a, $50
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wGameOverWarioVar], a
	ld [wSFXTimer], a
	ld a, HIGH(Frameset_aaccb)
	ld [hli], a ; frameset pointer
	ld a, LOW(Frameset_aaccb)
	ld [hl], a
	farcall BANK(Frameset_aaccb), UpdateObjAnim
	ld hl, wGameOverWario
	call LoadGameOverSprite

	ld hl, wMenuObj1
	ld a, $18
	ld [hli], a ; y
	ld a, $18
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_dbbf5)
	ld [hli], a ; frameset pointer
	ld a, LOW(Frameset_dbbf5)
	ld [hl], a
	call UpdateObjAnim
	ld hl, wMenuObj1
	call Func_db4e9

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld a, 64
	ld [wTimer], a
	ld hl, wSubState
	inc [hl]
	ret

UpdateGameOverScreen:
	ld a, [wGameOverWarioVar]
	dec a
	jr z, .asm_db338
	dec a
	jr z, .asm_db35b
	dec a
	jr z, .asm_db38a
	ld hl, wTimer
	dec [hl]
	jp nz, .asm_db3a9

	play_sfx SFX_134
	ld hl, wGameOverWarioVar
	inc [hl]
	jr .asm_db3a9

.asm_db338
	ld hl, wSCY
	dec [hl]
	dec [hl]
	dec [hl]
	jr nz, .asm_db3a9
	play_sfx SFX_061
	play_music MUSIC_GOLF_GAME_OVER
	ld a, 6
	ld [wTimer], a
	ld hl, wGameOverWarioVar
	inc [hl]
	jr .asm_db3a9

.asm_db35b
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wTimer
	dec [hl]
	ld a, [hl]
	and $01
	jr z, .asm_db371
	ld hl, wSCY
	inc [hl]
	inc [hl]
	jr .asm_db3a9
.asm_db371
	ld hl, wSCY
	dec [hl]
	dec [hl]
	ld a, [wTimer]
	and a
	jr nz, .asm_db3a9
	play_music MUSIC_GAME_OVER
	ld hl, wGameOverWarioVar
	inc [hl]
	jr .asm_db3a9

.asm_db38a
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	jr z, .asm_db3a9
	play_sfx SFX_SELECTION
	ld hl, wGameOverWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a ; duration
	ld a, HIGH(Frameset_aace2)
	ld [hli], a ; frameset pointer
	ld a, LOW(Frameset_aace2)
	ld [hl], a
	ld hl, wSubState
	inc [hl]
.asm_db3a9
	ld hl, wGameOverWarioFramesetPtr + 1
	farcall BANK(Frameset_aace2), UpdateObjAnim

	ld a, [wObjAnimWasReset]
	ld [wGameOverWarioAnimationEnded], a
	and a
	call nz, .Func_db3db
	ld hl, wGameOverWario
	call LoadGameOverSprite
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call Func_db4e9
	call ClearUnusedVirtualOAM
	ret

.Func_db3db:
	play_sfx SFX_SNORE
	ret

Func_db3e4:
	ld hl, wGameOverWarioFramesetPtr + 1
	farcall BANK(Frameset_aaccb), UpdateObjAnim

	ld a, [wObjAnimWasReset]
	ld [wGameOverWarioAnimationEnded], a
	ld hl, wGameOverWario
	call LoadGameOverSprite
	ld hl, wMenuObj1FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj1
	call Func_db4e9
	call ClearUnusedVirtualOAM
	ld a, [wGameOverWarioAnimationEnded]
	and a
	ret z
	ld hl, wSubState
	inc [hl]
	ret

GameOverReset:
	jp Init
