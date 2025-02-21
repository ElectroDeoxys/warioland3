
ExecuteMainPowerUpActionHelp:
	ld a, [wActionHelpPowerUp]
	jumptable

.table
	table_width 2
	dw NoPowerUpActionHelp             ; NO_POWER_UP
	dw LeadOverallsActionHelp          ; LEAD_OVERALLS
	dw SwimmingFlippersActionHelp      ; SWIMMING_FLIPPERS
	dw HeadSmashHelmetActionHelp       ; HEAD_SMASH_HELMET
	dw GrabGloveActionHelp             ; GRAB_GLOVE
	dw GarlicActionHelp                ; GARLIC
	dw SuperJumpSlamOverallsActionHelp ; SUPER_JUMP_SLAM_OVERALLS
	dw HighJumpBootsActionHelp         ; HIGH_JUMP_BOOTS
	dw PrinceFrogsGlovesActionHelp     ; PRINCE_FROGS_GLOVES
	dw SuperGrabGloveActionHelp        ; SUPER_GRAB_GLOVES
	assert_table_length NUM_MAIN_POWER_UPS
