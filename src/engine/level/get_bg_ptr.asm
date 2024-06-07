; outputs BG pointer to hl and wBGPtr
GetWarioBGPtr::
	ld a, [wWarioYPos + 1]
	sub $18
	ld l, a
	ld a, [wWarioYPos + 0]
	sbc $00
	ld h, a
; hl = ypos - 24
REPT 3
	srl h
	rr l
ENDR

REPT 5
	sla l
	rl h
ENDR
	ld a, h
	and $03
	ld d, a
	ld e, l

	ld a, [wWarioXPos + 0]
	ld h, a
	ld a, [wWarioXPos + 1]
	ld l, a
REPT 3
	srl h
	rr l
ENDR
	ld a, l
	and $1f
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wBGPtr + 0], a
	ld a, l
	ld [wBGPtr + 1], a
	ret

; outputs BG pointer to hl and wBGPtr
GetBlockBGPtr:
	ld a, [wBlockYPos + 0]
	ld h, a
	ld a, [wBlockYPos + 1]
	ld l, a
REPT 3
	srl h
	rr l
ENDR

REPT 5
	sla l
	rl h
ENDR
	ld a, h
	and $03
	ld d, a
	ld e, l
	ld a, [wBlockXPos + 0]
	ld h, a
	ld a, [wBlockXPos + 1]
	ld l, a
REPT 3
	srl h
	rr l
ENDR
	ld a, l
	and $1f
	ld l, a
	ld h, HIGH(v0BGMap0)
	add hl, de
	ld a, h
	ld [wBGPtr + 0], a
	ld a, l
	ld [wBGPtr + 1], a
	ret

; unreferenced
Func_8eac:
	srl l
	jr c, .asm_8eba
	ld a, l
	add $b0
	ld l, a
	ld a, [hl]
	swap a
	and $0f
	ret
.asm_8eba
	ld a, l
	add $b0
	ld l, a
	ld a, [hl]
	and $0f
	ret
