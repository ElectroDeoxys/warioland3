MACRO lb ; r, hi, lo
	ld \1, (\2) << 8 + ((\3) & $ff)
ENDM

MACRO bankswitch
	ld [wROMBank], a
	ld [rROMB0 + $100], a
ENDM

MACRO sramswitch
	ld [wSRAMBank], a
	ld [rRAMB + $100], a
ENDM

MACRO jumptable
	rst JumpTable
ENDM

MACRO hcall
	ld a, LOW(\1)
	ldh [hCallFuncPointer + 0], a
	ld a, HIGH(\1)
	ldh [hCallFuncPointer + 1], a
	call hCallFunc
ENDM

MACRO farcall
IF _NARG == 1
	ld a, BANK(\1)
	ldh [hCallFuncBank], a
	hcall \1
;assert warn, BANK(\1) != BANK(@), "farcall can be call"
ELSE
	ld a, \1
	ldh [hCallFuncBank], a
	hcall \2
;assert warn, \1 != BANK(@), "farcall can be call"
ENDC
ENDM

MACRO homecall
	ld a, [wROMBank]
	push af
	ld a, BANK(\1)
	bankswitch
	call \1
	pop af
	bankswitch
ENDM

MACRO homejp
	ld a, [wROMBank]
	push af
	ld a, BANK(\1)
	bankswitch
	jp \1
ENDM

MACRO debug_nop
:
	nop
	jr :-
ENDM

MACRO debug_assert_not
	cp \1
	jr nz, :+
	jp Init
:
ENDM

MACRO maskbits
; masks just enough bits to cover values 0 to \1 - 1
; \2 is an optional shift amount
; e.g. "maskbits 26" becomes "and %00011111" (since 26 - 1 = %00011001)
; and "maskbits 3, 2" becomes "and %00001100" (since "maskbits 3" becomes %00000011)
; example usage in rejection sampling:
; .loop
; 	call Random
; 	maskbits 26
; 	cp 26
; 	jr nc, .loop
	assert 0 < (\1) && (\1) <= $100, "bitmask must be 8-bit"
	DEF x = 1
	rept 8
		if x + 1 < (\1)
			DEF x = (x << 1) | 1
		endc
	endr
	if _NARG == 2
		and x << (\2)
	else
		and x
	endc
ENDM

; \1 = frameset when facing left
; \2 = frameset when facing right
MACRO ld_obj_frameset
	jr c, :+
	ld de, \1
	jr :++
:
	ld de, \2
:
ENDM
