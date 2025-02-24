UpdateObjAnim::
	xor a
	ld [wObjAnimWasReset], a
	ld a, [hld] ;
	ld e, a     ; frameset pointer
	ld a, [hld] ;
	ld d, a     ;
	ld a, [hl] ; duration
	sub 1
	ld [hld], a
	ret nc

	; new frame
	ld a, [hl] ; frameset offset
	add e
	ld c, a
	ld a, d
	adc 0
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset_anim
	dec l
	dec l
	ld [hli], a ; frame
	inc l
	ld a, [hl] ; frameset offset
	add $2
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a ; duration
	ret

.reset_anim
	xor a
	ld [hli], a ; frameset offset
	ld [hl], a ; duration
	ld a, TRUE
	ld [wObjAnimWasReset], a
	ret
