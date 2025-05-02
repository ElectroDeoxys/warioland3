OverworldStateTable::
	ld a, [wSubState]
	jumptable

	dw FastFadeToWhite
	dw InitOverworld
	dw SlowFadeFromWhite
	dw Func_804ec
	dw FastFadeToWhite

	dw Func_804f7           ; SST_OVERWORLD_OW_SCENE
	dw SlowFadeFromWhite
	dw Func_80540

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_08
	dw InitMapSide          ; SST_OVERWORLD_09
	dw DarkenBGToPal_Normal
	dw Func_805d7           ; SST_OVERWORLD_0B

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_COLLECTION
	dw InitTreasureCollection
	dw DarkenBGToPal_Normal
	dw TreasureCollection
	dw FadeBGToWhite_Normal

	dw InitCutscene           ; SST_OVERWORLD_CUTSCENE
	dw DarkenBGToPal_Normal
	dw UpdateCutscene
	dw FadeBGToWhite_Normal
	dw Func_80db1

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_BEST_TIME_LIST
	dw InitBestTimeList
	dw DarkenBGToPal_Normal
	dw BestTimeList

	dw FadeBGToWhite_Normal ; SST_OVERWORLD_1A
	dw InitTempleScene
	dw DarkenBGToPal_Normal
	dw UpdateTempleScene
	dw Func_80e33

	dw FadeBGToWhite_Normal
	dw GolfBuilding           ; SST_OVERWORLD_20
	dw DarkenBGToPal_Normal
	dw Func_80e55

	dw FastFadeToWhite ; SST_OVERWORLD_EPILOGUE
	dw InitEpilogue
	dw SlowFadeFromWhite
	dw Func_80e75
	dw Func_80e85
