
ExecuteMainPowerUpActionHelp: ; 1f826d (7e:426d)
	ld a, [wActionHelpPowerUp]
	jumptable

	dw NoPowerUpActionHelp             ; POWER_UP_NONE
	dw LeadOverallsActionHelp          ; POWER_UP_LEAD_OVERALLS
	dw SwimmingFlippersActionHelp      ; POWER_UP_SWIMMING_FLIPPERS
	dw HeadSmashHelmetActionHelp       ; POWER_UP_HEAD_SMASH_HELMET
	dw GrabGloveActionHelp             ; POWER_UP_GRAB_GLOVE
	dw GarlicActionHelp                ; POWER_UP_GARLIC
	dw SuperJumpSlamOverallsActionHelp ; POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	dw HighJumpBootsActionHelp         ; POWER_UP_HIGH_JUMP_BOOTS
	dw PrinceFrogsGlovesActionHelp     ; POWER_UP_PRINCE_FROGS_GLOVES
	dw SuperGrabGloveActionHelp        ; POWER_UP_SUPER_GRAB_GLOVES
; 0x1f8285
