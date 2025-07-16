InitTimeAttackClearScreen:
	ld a, TRUE
	ld [wResetDisabled], a

	call DisableLCD
	call ClearBGMap0
	call ClearVirtualOAM

	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a

	farcall Func_1e000d
	farcall LoadClearScreenGfx
	farcall Func_1e005f
	call VBlank_ClearScreen

	xor a
	ld [wSCX], a
	ldh [rSCX], a
	ld a, $04
	ld [wSCY], a
	ldh [rSCY], a
	farcall Func_1e028a

	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_d42d3
	ld hl, wMenuObj8FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj8
	call LoadClearScreenSprite

.asm_d42d3
	ld hl, wClearScreenWarioFramesetPtr + 1
	call UpdateObjAnim
	ld hl, wClearScreenWario
	call LoadClearScreenWarioSprite

	ld hl, wMenuObj2FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj2
	call LoadClearScreenSprite

	ld hl, wMenuObj3FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj3
	call LoadClearScreenSprite

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj4
	call LoadClearScreenSprite

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj5
	call LoadClearScreenSprite

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj6
	call LoadClearScreenSprite

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .done_keys
	ld hl, wMenuObj7FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj7
	call LoadClearScreenSprite

.done_keys
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, wSubState
	inc [hl]
	ret

Func_d434c:
	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_d435f
	ld hl, wMenuObj8FramesetPtr + 1
	call UpdateObjAnim
	ld hl, wMenuObj8
	call LoadClearScreenSprite

.asm_d435f
	ld hl, wClearScreenWarioFramesetPtr + 1
	call UpdateObjAnim
	ld a, [wActionHelpWarioVar]
	and a
	jr nz, .asm_d4394
	ld a, [wObjAnimWasReset]
	and a
	jr z, .asm_d4394
	ld a, $01
	ld [wActionHelpWarioVar], a
	ld hl, wClearScreenWarioFramesetOffset
	xor a
	ld [hli], a
	ld [hli], a

	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_d438b
	ld a, HIGH(Frameset_d4d1b)
	ld [hli], a
	ld a, LOW(Frameset_d4d1b)
	ld [hl], a
	jr .asm_d4391
.asm_d438b
	ld a, HIGH(Frameset_d4d5f)
	ld [hli], a
	ld a, LOW(Frameset_d4d5f)
	ld [hl], a
.asm_d4391
	call UpdateObjAnim
.asm_d4394
	ld hl, wClearScreenWario
	call LoadClearScreenWarioSprite

	ld hl, wMenuObj2
	call LoadClearScreenSprite
	ld hl, wMenuObj3
	call LoadClearScreenSprite

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	call LoadClearScreenSprite

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	call LoadClearScreenSprite

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	call LoadClearScreenSprite

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .done_keys
	ld hl, wMenuObj7
	call LoadClearScreenSprite
.done_keys
	call ClearUnusedVirtualOAM

	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	jp OpenMusicalCoinsScreen
