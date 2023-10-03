ExecuteSpecialPowerUpActionHelp:
	ld a, [wActionHelpPowerUp]
	sub POWER_UP_OWL
	jumptable

	dw OwlActionHelp     ; POWER_UP_OWL
	dw RailActionHelp    ; POWER_UP_RAIL
	dw VampireActionHelp ; POWER_UP_VAMPIRE
