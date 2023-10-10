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
