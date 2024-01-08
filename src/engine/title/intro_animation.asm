; decreases wIntroBGXOffsetFar every 4 ticks
; decreases wIntroBGXOffsetCentre by 1
; decreases wIntroBGXOffsetNear by 2
ScrollIntroBackgroundLayers:
	ld a, [wGlobalCounter]
	and %11
	jr nz, .asm_4cc6
	ld hl, wIntroBGXOffsetFar
	dec [hl]
.asm_4cc6
	ld hl, wIntroBGXOffsetCentre
	dec [hl]
	ld hl, wIntroBGXOffsetNear
	dec [hl]
	dec [hl]
	ret

; scrolls the intro background layers
; until they align to the centre
FinishIntroBackgroundScroll:
; only update far layer evert 4 ticks
	ld a, [wGlobalCounter]
	and %11
	jr nz, .centre_layer
	ld hl, wIntroBGXOffsetFar
	ld a, [hl]
	and %11111
	jr nz, .scroll_far
	ld a, [wSCX]
	ld [hl], a
	jr .centre_layer
.scroll_far
	dec [hl]

.centre_layer
	ld hl, wIntroBGXOffsetCentre
	ld a, [hl]
	and %11111
	jr nz, .scroll_centre
	ld a, [wSCX]
	ld [hl], a
	jr .far_layer
.scroll_centre
	dec [hl]

.far_layer
	ld hl, wIntroBGXOffsetNear
	ld a, [hl]
	cp 224
	jr z, .asm_4cff
	jr .scroll_near
.asm_4cff
	ld a, 224
	ld [hl], a
	jr .done
.scroll_near
	dec [hl]
	dec [hl]
.done
	ret

; pans the background of the intro airplane scene
; each horizontal layer scrolls at different speed
PanIntroBackgroundLayers:
	ld a, [wceef]
	and a
	ret nz
.sky
	ldh a, [rLY]
	cp $5b
	jr c, .sky
	call WaitVBlank

	ld a, [wIntroBGXOffsetFar]
	ldh [rSCX], a
.far_layer
	ldh a, [rLY]
	cp $63
	jr c, .far_layer
	call WaitVBlank

	ld a, [wIntroBGXOffsetCentre]
	ldh [rSCX], a
.centre_layer
	ldh a, [rLY]
	cp $73
	jr c, .centre_layer
	call WaitVBlank

	ld a, [wIntroBGXOffsetNear]
	ldh [rSCX], a
.near_layer
	ldh a, [rLY]
	cp $83
	jr c, .near_layer
	call WaitVBlank

	ld a, [wSCX]
	ldh [rSCX], a
	ret

Func_4d45:
	ld a, [wGlobalCounter]
	and %1
	jr z, .asm_4d66

	ld hl, wMenuObj5XCoord
	ld a, [hl]
	cp 176
	jr c, .incr_x1
	ld a, [wSubState]
	cp $05
	jr nc, .asm_4d66
	cp $04
	jr c, .incr_x1
	ld a, [wPlaneWarioVar]
	and a
	jr nz, .asm_4d66
.incr_x1
	inc [hl]

.asm_4d66
	ld hl, wMenuObj4XCoord
	ld a, [hl]
	cp 176
	jr c, .incr_x2
	ld a, [wSubState]
	cp $05
	ret nc
	cp $04
	jr c, .incr_x2
	ld a, [wPlaneWarioVar]
	and a
	ret nz
.incr_x2
	inc [hl]
	ret
