_GolfStateTable::
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitGolfLobby
	dw SlowFadeFromWhite
	dw HandleGolfLobby

	dw FastFadeToWhite ; SST_GOLF_HOLE
	dw InitGolfHole
	dw SlowFadeFromWhite
	dw HandleGolfHole

	dw FastFadeToWhite ; SST_GOLF_EXIT
	dw ReturnToLevelFromGolf

	dw FastFadeToWhite ; SST_GOLF_CLEAR
	dw InitGolfClearCutscene
	dw SlowFadeFromWhite
	dw UpdateGolfClearCutscene
