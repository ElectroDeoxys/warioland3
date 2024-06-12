LanguageSelectionStateTable:
	ldh a, [rSVBK]
	push af
	ld a, BANK("GFX RAM")
	ldh [rSVBK], a
	call .jump
	pop af
	ldh [rSVBK], a
	ret

.jump
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitLanguageSelection
	dw SlowFadeFromWhite
	dw LanguageSelection

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
