; draws Wario on screen unless he's invisible
DrawWario::
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr nz, .invincible
; show Wario if wInvisibleFrame
; has upper 4 bits set and bit 2 unset
	ld hl, wInvisibleFrame
	inc [hl]
	ld a, [hl]
	and %11110010
	cp %11110000
	jr z, .show_wario
	ret

.invincible
; show Wario if wInvisibleFrame is 0
	ld a, [wInvisibleFrame]
	and a
	ret nz

.show_wario
	ld a, [wOAMBank]
	ld [wTempBank], a
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, [wOAMPtr + 0]
	ld h, a
	ld a, [wOAMPtr + 1]
	ld l, a
	ld a, [wWarioScreenYPos]
	ld [wCurSpriteYCoord], a
	ld a, [wWarioScreenXPos]
	ld [wCurSpriteXCoord], a
	ld a, [wca65]
	ld [wCurSpriteFrame], a
	ld a, [wca66]
	ld [wCurSpriteAttributes], a
	call LoadSprite
	pop af
	bankswitch
	ret

; hl = OAM data pointer
; given an OAM pointer and a frame index in wCurSpriteFrame
; goes through each tile element and adds them to virtual OAM
LoadSprite::
	ld a, [wCurSpriteFrame]
	ld d, $00
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXCoord
	ld a, [hld]
	ld c, a    ; wCurSpriteXCoord
	ld a, [hld]
	ld b, a    ; wCurSpriteYCoord
	ld l, [hl] ; wVirtualOAMByteSize
	ld h, HIGH(wVirtualOAM)
.loop
	ld a, l
	cp OAM_COUNT * SPRITEOAMSTRUCT_LENGTH
	ret nc
	ld a, [de]
	cp $80
	ret z ; finished

	ld a, [de] ; SPRITEOAMSTRUCT_YCOORD
	add b
	ld [hli], a
	inc de
	ld a, [de] ; SPRITEOAMSTRUCT_XCOORD
	add c
	ld [hli], a
	inc de
	ld a, [de] ; SPRITEOAMSTRUCT_TILE_ID
	ld [hli], a
	inc de
	push hl
	ld hl, wCurSpriteAttributes
	ld a, [de] ; SPRITEOAMSTRUCT_ATTRIBUTES
	xor [hl]
	pop hl
	ld [hli], a
	ld a, l
	ld [wVirtualOAMByteSize], a
	inc de
	jr .loop

Func_e2b::
	ld a, [wCurObjFlags]
	bit OBJFLAG_ON_SCREEN_F, a
	ret z
;	fallthrough

Func_e31::
	ld a, [wBlockPtrBank]
	dec a
	add a
	add a
	add a
	add a
	add a
	add h ; = h + (wBlockPtrBank - 1) * $20
	ld b, a
	ld c, l
	ld hl, wc18e
	ld a, [wc19e]
	ld e, a
	ld d, $00
	add hl, de
	ld a, b
	ld [hli], a
	ld [hl], c
	ld a, e
	add 2
	and $0f
	ld [wc19e], a
	ret

UpdateAnimation::
	ld a, [wFramesetPtr + 0]
	ld d, a
	ld a, [wFramesetPtr + 1]
	ld e, a

	xor a ; FALSE
	ld [wAnimationEnded], a
	ld hl, wFrameDuration
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc ; return if duration hasn't elapsed yet

	ld a, [hl] ; wAnimationFrame
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .finished

; next frame
	ld [wca65], a
	ld a, [hl] ; wAnimationFrame
	add 2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; wFrameDuration
	ret

.finished
	xor a
	ld [hld], a ; wAnimationFrame
	ld [hl], a ; wFrameDuration
	ld a, TRUE
	ld [wAnimationEnded], a
	ret
