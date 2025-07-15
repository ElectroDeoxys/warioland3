; unreferenced
; probably a scrapped idea to access
; the Treasure Collection from the Pause menu
UnreferencedOpenTreasureCollection:
	ld a, [wSubState]
	jumptable
	dw FadeBGToWhite_Normal
	dw InitTreasureCollection
	dw DarkenBGToPal_Normal
	dw TreasureCollection
	dw FadeBGToWhite_Normal
	dw ReturnToPauseMenuFromActionHelp
