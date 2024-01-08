MainStateTable::
	ld a, [wState]
	jumptable

	dw TitleStateTable             ; ST_TITLE
	dw HandleOverworld             ; ST_OVERWORLD
	dw LevelStateTable             ; ST_LEVEL
	dw ClearScreenStateTable       ; ST_CLEAR
	dw PauseMenuStateTable         ; ST_PAUSE_MENU
	dw GolfStateTable              ; ST_GOLF
	dw EpilogueStateTable          ; ST_EPILOGUE
	dw ActionHelpStateTable        ; ST_ACTION_HELP
	dw CollectKeyDelay             ; ST_COLLECT_KEY
	dw CreditsStateTable           ; ST_CREDITS
	dw GolfBuildingStateTable      ; ST_GOLF_BUILDING
	dw GBIncompatibleStateTable    ; ST_GB_INCOMPATIBLE
	dw GameOverStateTable          ; ST_GAME_OVER
	dw PerfectStateTable           ; ST_PERFECT
	dw LanguageSelectionStateTable ; ST_LANGUAGE_SELECTION
	dw InvalidState                ; ST_UNUSED_0F
	dw InvalidState                ; ST_UNUSED_10
	dw InvalidState                ; ST_UNUSED_11

InvalidState:
	jp Init
