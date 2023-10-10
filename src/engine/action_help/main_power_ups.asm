
ExecuteMainPowerUpActionHelp:
	ld a, [wActionHelpPowerUp]
	jumptable

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
