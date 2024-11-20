DoorTransition::
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wDoorTransitionOrientation]
	ld c, a
	ld a, [wDoorTransitionCounter]
	or c
	jr nz, .already_started

	ld a, $01
	ld [wUnused_c186], a

	; set VBlank function
	call VBlank_DoorTransition

	; toggle wDoorTransitionOrientation
	ld a, [wDoorTransitionOrientation]
	xor $1
	ld [wDoorTransitionOrientation], a

	ld a, 1
	ld [wTransitionEffectStep], a
	; start wDoorTransitionEffectBGPtr with Wario's current tile
	ld a, [wWarioTileBGPtr + 0]
	ld [wDoorTransitionEffectBGPtr + 0], a
	ld a, [wWarioTileBGPtr + 1]
	ld [wDoorTransitionEffectBGPtr + 1], a

.done
	pop af
	ldh [rSVBK], a
	ret

.already_started
	; toggle wDoorTransitionOrientation
	ld a, [wDoorTransitionOrientation]
	xor $1
	ld [wDoorTransitionOrientation], a
	jr z, .skip_incr_step
	call .PrepareNextStepInTransitionEffect
	jr .done
.skip_incr_step
	ld hl, wDoorTransitionCounter
	inc [hl]
	ld a, [hl]
	cp 17
	jr c, .done

	; restore backed up VBlank function
	di
	ld hl, wBackupVBlankFunc
	ld de, wVBlankFunc
	ld b, 3
	call CopyHLToDE
	ei

	; finish door transition and advance level state
	xor a
	ld [wDoorTransitionCounter], a
	ld [wUnused_c186], a
	ld [wDoorTransitionOrientation], a
	stop_music
	stop_sfx
	ld hl, wSubState
	inc [hl]
	jr .done

.PrepareNextStepInTransitionEffect:
	ld a, [wDoorTransitionCounter]
	cp 16
	ret nc ; >= 16
	ld hl, wTransitionEffectStep
	ld a, [hl]
	add 2
	ld [hli], a
	ld a, [hl] ; wDoorTransitionEffectBGPtr
	; one row below
	add BG_MAP_WIDTH
	ld [hli], a
	ld a, [hl]
	adc $00
	cp HIGH(v0BGMap0 + $400)
	jr c, .no_wrap_up
	; wrap up
	sub HIGH($400)
.no_wrap_up
	ld [hld], a

	; one column left
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	cp $1f
	ret nz
	; wrap right
	ld a, [hl]
	add BG_MAP_WIDTH
	ld [hl], a
	ret

VBlank_DoorTransition::
	di
	; back up current VBlank function
	ld hl, wVBlankFunc
	ld de, wBackupVBlankFunc
	ld b, 3
	call CopyHLToDE

	; then overwrite it
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ei
	ret

.Func:
	jp .DoTransitionEffect
.end

.DoTransitionEffect:
	; apply scroll
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld de, -BG_MAP_WIDTH
	ld a, [wDoorTransitionOrientation]
	and a
	jr z, .left_then_up

; up then left
	ld hl, wTransitionEffectStep
	ld a, [hli]
	ld b, a
	ld c, a
	ld a, [hli] ; wDoorTransitionEffectBGPtr
	ld h, [hl]
	ld l, a
	
	; do wTransitionEffectStep tiles up
.loop_fill_upwards_1
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a ; BANK("VRAM0")
	ldh [rVBK], a
	ld [hl], $7f ; overwrite tile

	; go up a row (-BG_MAP_WIDTH)
	add hl, de
	ld a, h
	cp HIGH(v0BGMap0)
	jr nc, .no_wrap_up_1
	; wrap down
	add HIGH($400)
	ld h, a
.no_wrap_up_1
	dec b
	jr nz, .loop_fill_upwards_1

	; do wTransitionEffectStep+1 tiles left
	ld b, c
	inc b
.loop_fill_left_1
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a ; BANK("VRAM0")
	ldh [rVBK], a
	ld a, $7f
	ld [hli], a ; overwrite tile
	ld a, l
	and $1f
	jr nz, .no_wrap_left_1
	; wrap left
	ld a, l
	sub BG_MAP_WIDTH
	ld l, a
	ld a, h
	sbc $00
	ld h, a
.no_wrap_left_1
	dec b
	jr nz, .loop_fill_left_1
	jr .asm_a8e

	; do wTransitionEffectStep tiles left
.left_then_up
	ld hl, wTransitionEffectStep
	ld a, [hli]
	ld b, a
	ld c, a
	ld a, [hli] ; wDoorTransitionEffectBGPtr
	ld h, [hl]
	ld l, a
.loop_fill_left_2
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a ; BANK("VRAM0")
	ldh [rVBK], a
	ld a, $7f
	ld [hli], a ; overwrite tile
	ld a, l
	and $1f
	jr nz, .no_wrap_left_2
	; wrap left
	ld a, l
	sub BG_MAP_WIDTH
	ld l, a
	ld a, h
	sbc $00
	ld h, a
.no_wrap_left_2
	dec b
	jr nz, .loop_fill_left_2

	; do wTransitionEffectStep tiles up
	ld b, c
.loop_fill_upwards_2
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl]
	and $7f
	or $0f
	ld [hl], a
	xor a ; BANK("VRAM0")
	ldh [rVBK], a
	ld [hl], $7f ; overwrite tile

	; go up a row (-BG_MAP_WIDTH)
	add hl, de
	ld a, h
	cp HIGH(v0BGMap0)
	jr nc, .no_wrap_up_2
	; wrap down
	add HIGH($400)
	ld h, a
.no_wrap_up_2
	dec b
	jr nz, .loop_fill_upwards_2
.asm_a8e
	pop af
	ldh [rSVBK], a
	ret
