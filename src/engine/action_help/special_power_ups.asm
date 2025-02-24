ExecuteSpecialPowerUpActionHelp:
	ld a, [wActionHelpPowerUp]
	sub POWER_UP_OWL
	jumptable

	table_width 2
	dw OwlActionHelp     ; POWER_UP_OWL
	dw RailActionHelp    ; POWER_UP_RAIL
	dw VampireActionHelp ; POWER_UP_VAMPIRE
	assert_table_length NUM_SPECIAL_POWER_UPS
