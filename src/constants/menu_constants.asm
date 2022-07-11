; flags for wca3b
	const_def
	const MODE_GAME_CLEARED_F           ; 0
	const MODE_TIME_ATTACK_F            ; 1
	const MODE_FOUGHT_A_HIDDEN_FIGURE_F ; 2

; special wTransitionParam values
DEF TRANSITION_RETURN_TO_MAP        EQU $f0
DEF TRANSITION_EPILOGUE_NOT_PERFECT EQU $f1
DEF TRANSITION_EPILOGUE_PERFECT     EQU $f2
DEF TRANSITION_GAME_OVER            EQU $f3
DEF TRANSITION_NEW_GAME             EQU $ff

; wTimeAttackResult constants
	const_def
	const TIME_ATTACK_NOT_COMPLETED  ; $0
	const TIME_ATTACK_NO_HIGH_SCORE  ; $1
	const TIME_ATTACK_GOT_HIGH_SCORE ; $2
