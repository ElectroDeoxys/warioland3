LanguageSelectionStateTable:
	push_wram BANK("GFX RAM")
	call .jump
	pop_wram
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
