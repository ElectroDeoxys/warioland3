; flags for wca3b
	const_def
	const MODE_DAY_NIGHT_F   ; 0
	const MODE_TIME_ATTACK_F ; 1
	const MODE_UNKNOWN_2_F   ; 2

; special wTransitionParam values
TRANSITION_RETURN_TO_MAP        EQU $f0
TRANSITION_EPILOGUE_NOT_PERFECT EQU $f1
TRANSITION_EPILOGUE_PERFECT     EQU $f2
TRANSITION_GAME_OVER            EQU $f3
TRANSITION_NEW_GAME             EQU $ff