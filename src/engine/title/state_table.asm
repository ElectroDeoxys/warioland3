TitleStateTable::
	push_wram BANK("GFX RAM")
	call .jump
	pop_wram
	ret

.jump
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitIntroSequence
	dw SlowFadeFromWhite
	dw IntroSequencePhase1
	dw IntroSequencePhase2
	dw IntroSequencePhase3
	dw EndIntroSequence

	dw StartMenu ; SST_START_MENU
	dw SlowFadeBGToWhite
	dw InitTimeAttackDescription
	dw TimeAttackDescription

	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
	dw DebugReset
