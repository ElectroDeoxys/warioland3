SetTreasureTransitionParam:
	ld a, [wLevelEndScreen]
	cp LVLEND_NO_TREASURE
	jr z, .no_treasure
	dec a
	ld b, a
	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a
	add a
	add b
	ld e, a
	ld d, $00
	ld hl, LevelTreasureIDs_WithoutTemple
	add hl, de
	ld a, [hl]
	ld [wTransitionParam], a
	cp LEAD_OVERALLS_T
	jr z, .lead_overalls
	cp SWIMMING_FLIPPERS_T
	jr z, .swimming_flippers
	cp HEAD_SMASH_HELMET_T
	jr z, .head_smash
	cp GRAB_GLOVE_T
	jr z, .grab_glove
	cp GARLIC_T
	jr z, .garlic
	cp SUPER_JUMP_SLAM_OVERALLS_T
	jr z, .super_jump_slam_overalls
	cp HIGH_JUMP_BOOTS_T
	jr z, .high_jump_boots
	cp PRINCE_FROGS_GLOVES_T
	jr z, .prince_frogs_gloves
	cp SUPER_GRAB_GLOVES_T
	jr z, .super_grab_gloves
	ret
.no_treasure
	ld a, TRANSITION_RETURN_TO_MAP
	ld [wTransitionParam], a
	ret

.lead_overalls
	ld a, LEAD_OVERALLS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.swimming_flippers
	ld a, SWIMMING_FLIPPERS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.head_smash
	ld a, HEAD_SMASH_HELMET | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.grab_glove
	ld a, GRAB_GLOVE | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.garlic
	ld a, GARLIC | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.super_jump_slam_overalls
	ld a, SUPER_JUMP_SLAM_OVERALLS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.high_jump_boots
	ld a, HIGH_JUMP_BOOTS | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.prince_frogs_gloves
	ld a, PRINCE_FROGS_GLOVES | ACTION_HELP_LEVEL_CLEAR
	jr .set_power_up_level
.super_grab_gloves
	ld a, SUPER_GRAB_GLOVES | ACTION_HELP_LEVEL_CLEAR
.set_power_up_level
	ld [wPowerUpLevel], a
	ret
