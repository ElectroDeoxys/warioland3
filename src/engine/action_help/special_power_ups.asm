ExecuteSpecialPowerUpActionHelp: ; 1e4000 (79:4000)
	ld a, [wActionHelpPowerUp]
	sub POWER_UP_OWL
	jumptable

	dw OwlActionHelp     ; POWER_UP_OWL
	dw RailActionHelp    ; POWER_UP_RAIL
	dw VampireActionHelp ; POWER_UP_VAMPIRE
; 0x1e400c
