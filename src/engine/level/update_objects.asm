INCLUDE "data/object_movements.asm"

UpdateObject_Temple:
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
FOR n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
ENDR
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	call DoObjectAction

	ld a, BANK("Object Functions 4")
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer + 0], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call UpdateObjectAnimation
	call CheckObjectOnScreen

	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos + 0]
	add OAM_Y_OFS
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add OAM_X_OFS
	sub b
	ld [hli], a

	ld hl, wSCYShake
	ld a, [wHiddenFigureSCYShake]
	add [hl]
	ld [wSCY], a
	ld a, [wc08b]
	ld [wSCX], a
	pop hl

	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_STEPPED)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjCollBoxTop]
	ld [hli], a
	ld a, [wCurObjCollBoxBottom]
	ld [hli], a
	ld a, [wCurObjCollBoxLeft]
	ld [hli], a
	ld a, [wCurObjCollBoxRight]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 0]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjStateDuration]
	ld [hli], a
	ld a, [wCurObjVar1]
	ld [hli], a
	ld a, [wCurObjVar2]
	ld [hli], a
	ld a, [wCurObjVar3]
	ld [hli], a
	ld a, [wCurObjSubState]
	ld [hli], a
	ld a, [wCurObjState]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction + 0]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret

UpdateObjects_Temple:
	call HandleGrabbedObjectCollisions

	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, UpdateObject_Temple
FOR n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, UpdateObject_Temple ; OBJFLAG_ACTIVE_F set
ENDR
	ret

UpdateObjects:
	ld a, [wPowerUpLevel]
	ld e, a
	ld a, [wTransformation]
	rla
	jr nc, .got_effective_power_up
	; TRANSFORMATIONF_SUPER_SMASH_F is set
	ld e, SUPER_JUMP_SLAM_OVERALLS
.got_effective_power_up
	ld a, e
	ld [wEffectivePowerUp], a

	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, UpdateObjects_Temple
	ld a, [wIsFloorTransition]
	and a
	jr nz, .floor_transition

	call HandleGrabbedObjectCollisions
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, UpdateObject ; OBJFLAG_ACTIVE_F set
FOR n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, UpdateObject ; OBJFLAG_ACTIVE_F set
ENDR
	ret

.floor_transition
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, UpdateObjectDuringFloorTransition
FOR n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, UpdateObjectDuringFloorTransition ; OBJFLAG_ACTIVE_F set
ENDR
	ret

UpdateObject:
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
FOR n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
ENDR
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	call DoObjectAction

; call update function
	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or BANK("Object Functions 1")
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call UpdateObjectAnimation
	call CheckObjectOnScreen

	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos + 0]
	add OAM_Y_OFS
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add OAM_X_OFS
	sub b
	ld [hli], a
	pop hl

	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_STEPPED)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjCollBoxTop]
	ld [hli], a
	ld a, [wCurObjCollBoxBottom]
	ld [hli], a
	ld a, [wCurObjCollBoxLeft]
	ld [hli], a
	ld a, [wCurObjCollBoxRight]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 0]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjStateDuration]
	ld [hli], a
	ld a, [wCurObjVar1]
	ld [hli], a
	ld a, [wCurObjVar2]
	ld [hli], a
	ld a, [wCurObjVar3]
	ld [hli], a
	ld a, [wCurObjSubState]
	ld [hli], a
	ld a, [wCurObjState]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction + 0]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret

UpdateObjectDuringFloorTransition:
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
FOR n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
ENDR
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	; only run update function
	; on initialised objects
	ld hl, wCurObjSubState
	bit OBJSUBFLAG_UNINITIALISED_F, [hl]
	jr z, .skip_update_function
	; init object
	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or BANK("Object Functions 1")
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.skip_update_function
	call UpdateObjectFrame
	call CheckObjectOnScreen

	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos + 0]
	add OAM_Y_OFS
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add OAM_X_OFS
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_STEPPED)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjCollBoxTop]
	ld [hli], a
	ld a, [wCurObjCollBoxBottom]
	ld [hli], a
	ld a, [wCurObjCollBoxLeft]
	ld [hli], a
	ld a, [wCurObjCollBoxRight]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 0]
	ld [hli], a
	ld a, [wCurObjOAMPtr + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjStateDuration]
	ld [hli], a
	ld a, [wCurObjVar1]
	ld [hli], a
	ld a, [wCurObjVar2]
	ld [hli], a
	ld a, [wCurObjVar3]
	ld [hli], a
	ld a, [wCurObjSubState]
	ld [hli], a
	ld a, [wCurObjState]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret

DrawObjects_NoPriority:
FOR n, 1, NUM_OBJECTS + 1
	ld hl, wObj{u:n}Flags
	ld a, [hl]
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN | OBJFLAG_INVISIBLE | OBJFLAG_PRIORITY
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN | OBJFLAG_PRIORITY
	jr nz, :+
	; if (OBJFLAG_ACTIVE && OBJFLAG_ON_SCREEN && !OBJFLAG_INVISIBLE && OBJFLAG_PRIORITY)
	ld e, LOW(wObj{u:n}ScreenYPos)
	ld l, LOW(wObj{u:n}Unk07)
	call UpdateObjSprite
:
ENDR
	ret

DrawObjects_WithPriority:
FOR n, 1, NUM_OBJECTS + 1
	ld hl, wObj{u:n}Flags
	ld a, [hl]
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN | OBJFLAG_INVISIBLE | OBJFLAG_PRIORITY
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	jr nz, :+
	; if (OBJFLAG_ACTIVE && OBJFLAG_ON_SCREEN && !OBJFLAG_INVISIBLE && !OBJFLAG_PRIORITY)
	ld e, LOW(wObj{u:n}ScreenYPos)
	ld l, LOW(wObj{u:n}Unk07)
	call UpdateObjSprite
:
ENDR
	ret

DoObjectAction:
	ld a, [wCurObjAction]
	and a
	ret z
	bit NO_ACTIONS_F, a
	jr z, .jump
	dec a
	cp NO_ACTIONS_FOR 0
	jr nz, .asm_6176f
	xor a
.asm_6176f
	ld [wCurObjAction], a
	ret

.jump
	jumptable

.table
	table_width 2, DoObjectAction.table
	dw .None ; OBJACTION_NONE
	dw .Bump ; OBJACTION_BUMP
	dw .Attack ; OBJACTION_ATTACK
	dw .PickUp ; OBJACTION_PICK_UP
	dw .Wobble ; OBJACTION_WOBBLE
	dw .VanishTouch ; OBJACTION_VANISH_TOUCH
	dw .Action06 ; OBJACTION_06
	dw .Action07 ; OBJACTION_07
	dw VanishObject_NoSFX ; OBJACTION_VANISH_TREASURE
	dw .StepOn ; OBJACTION_STEP_ON
	dw .Action0a ; OBJACTION_0A
	dw .Flatten ; OBJACTION_FLATTEN
	dw .Action0c ; OBJACTION_0C
	dw .Action0d ; OBJACTION_0D
	dw .Action0e ; OBJACTION_0E
	dw .SmashAttackWalkable ; OBJACTION_SMASH_ATTACK_WALKABLE
	dw .Teleport ; OBJACTION_TELEPORT
	dw .Action11 ; OBJACTION_11
	dw .Action12 ; OBJACTION_12
	dw .Action13 ; OBJACTION_13
	assert_table_length NUM_OBJ_ACTIONS

.Action13:
	ld hl, wCurObjAction
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_SPECIAL_3
	ld [hl], a ; OBJ_STATE
	ret

.None:
	ret

.Bump:
	ld a, [wCurObjInteractionType]
	and INTERACTION_MASK
	jr z, .Wobble
	ld hl, wCurObjUnk1d
	ld a, [hld]
	and INTERACTION_RIGHT
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .bump_right
	ld a, OBJSTATE_BUMP_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.bump_right
	ld a, OBJSTATE_BUMP_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.Attack:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UNK_1D
	ld a, [hld]
	and INTERACTION_RIGHT
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .attack_right
	ld a, OBJSTATE_ATTACKED_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.attack_right
	ld a, OBJSTATE_ATTACKED_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.PickUp:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, [wDirection]
	and a
	ld l, OBJ_ACTION
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .pick_up_right
	ld a, OBJSTATE_PICKED_UP_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.pick_up_right
	ld a, OBJSTATE_PICKED_UP_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.Wobble:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_UNK_1D
	ld a, [hld]
	and INTERACTION_RIGHT
	ld a, 15 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jr z, .wobble_right
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hl], a ; OBJ_STATE
	ret
.wobble_right
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hl], a ; OBJ_STATE
	ret

.VanishTouch:
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_ACTION
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_VANISH_TOUCH
	ld [hl], a
	ret

.Action12:
	ld b, 7 | (1 << 7)
	jr .asm_6181f
.Action06:
	ld b, 15 | (1 << 7)
.asm_6181f
	ld hl, wCurObjUnk1d
	ld a, [hld]
	ld [hl], b ; OBJ_ACTION
	dec l
	rla
	jr nc, .check_interaction_up
; interaction down
	ld a, OBJSTATE_0E
	ld [hl], a ; OBJ_STATE
	ret
.check_interaction_up
	rla
	jr nc, .check_interaction_right
	ld a, OBJSTATE_0D
	ld [hl], a ; OBJ_STATE
	ret
.check_interaction_right
	rla
	jr nc, .interaction_left
	ld a, OBJSTATE_0B
	ld [hl], a ; OBJ_STATE
	ret
.interaction_left
	ld a, OBJSTATE_0C
	ld [hl], a ; OBJ_STATE
	ret

.Action07:
	ld hl, wCurObjAction
	xor a
	ld [hld], a
	ld a, OBJSTATE_18
	ld [hl], a ; OBJ_STATE
	ret

.StepOn:
	ld hl, wCurObjAction
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_STEPPED_F, [hl]
	ret

.Action0a:
	ld a, NO_ACTIONS_FOR 15
	ld [wCurObjAction], a
	ret

.Flatten:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a ; OBJ_STATE
	ret

.Action0c:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

.Action0d:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, OBJSTATE_19
	ld [hl], a
	ret

.Action0e:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

.SmashAttackWalkable:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 2
	ld [hld], a
	ld a, OBJSTATE_VANISH_TOUCH
	ld [hl], a
	ret

.Teleport:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

.Action11:
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, OBJSTATE_ACTIVATE
	ld [hl], a
	ret

_VanishObject::
	play_sfx SFX_VANISH
VanishObject_NoSFX:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(StarsFunc)
	ld [hld], a
	ld a, LOW(StarsFunc)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	ld [hld], a
Func_618b4:
	ld a, (BANK(StarsFunc) - BANK("Object Functions 1")) << 4
	ld [wCurObjUnk07], a

	ld hl, wCurObjOAMPtr
	ld a, LOW(OAM_18c000)
	ld [hli], a ; OBJ_OAM_PTR
	ld a, HIGH(OAM_18c000)
	ld [hli], a
	ld a, LOW(Frameset_680c5)
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, HIGH(Frameset_680c5)
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ld a, 33
	ld [hli], a ; OBJ_STATE_DURATION

	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a

	ld l, OBJ_Y_POS
	ld a, [hl]
	sub 8
	ld [hli], a
	ret nc
	dec [hl]
	ret

; handles the grabbed object collision
; with other objects
HandleGrabbedObjectCollisions:
	ld hl, wObj1Flags
	ld e, OBJFLAG_ACTIVE | OBJFLAG_GRABBED
	ld a, [hl]
	and e
	cp e
FOR n, 2, NUM_OBJECTS + 1
	jr z, .got_grabbed_obj
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	and e
	cp e
ENDR
	ret nz

.got_grabbed_obj
	push hl
	ld a, l
	add OBJ_INTERACTION_TYPE - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ldh [hThrownObjInteractionType], a
	ld a, [hli] ; OBJ_COLLBOX_TOP
	ld b, a
	ld a, [hli] ; OBJ_COLLBOX_BOTTOM
	ld c, a
	ld a, [hli] ; OBJ_COLLBOX_LEFT
	ld d, a
	ld a, [hli] ; OBJ_COLLBOX_RIGHT
	ld e, a
	ld a, [hl] ; OBJ_SCREEN_Y_POS
	add $2a
	add b
	ld b, a
	ld a, [hli] ; OBJ_SCREEN_Y_POS
	add $2a
	add c
	ld c, a
	ld a, [hl] ; OBJ_SCREEN_X_POS
	add $2a
	add d
	ld d, a
	ld a, [hli] ; OBJ_SCREEN_X_POS
	add $2a
	add e
	ld e, a

; b = collision top    + (screen y + $2a)
; c = collision bottom + (screen y + $2a)
; d = collision left   + (screen x + $2a)
; e = collision right  + (screen x + $2a)

	ld a, l
	add OBJ_STATE - (OBJ_SCREEN_X_POS + 1)
	ld l, a
	ld a, [hl] ; OBJ_STATE
	cp OBJSTATE_FULL_THROW_LEFT_START
	jr nc, .full_throw
	cp OBJSTATE_48
	jr nc, .asm_61992

.full_throw
	; >= OBJSTATE_FULL_THROW_LEFT_START
	rra
	ld hl, hThrownObjInteractionType
	ld a, [hli]
	jr c, .thrown_right

; thrown left
	rla
	jr c, .is_heavy1
	ld a, OBJSTATE_28
	ld [hli], a ; hCollidedObjState_Light
	ld a, OBJSTATE_29
	ld [hli], a ; hThrownObjState_Light
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hCollidedObjState_Heavy
	ld a, OBJSTATE_29
	ld [hli], a ; hThrownObjState_Heavy
	jr .check_objs

.is_heavy1
	ld a, OBJSTATE_28
	ld [hli], a ; hCollidedObjState_Light
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; hThrownObjState_Light
	ld a, OBJSTATE_28
	ld [hli], a ; hCollidedObjState_Heavy
	ld a, OBJSTATE_29
	ld [hli], a ; hThrownObjState_Heavy
	jr .check_objs

.thrown_right
	rla
	jr c, .is_heavy2
	ld a, OBJSTATE_29
	ld [hli], a ; ; hCollidedObjState_Light
	ld a, OBJSTATE_28
	ld [hli], a ; ; hThrownObjState_Light
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; ; hCollidedObjState_Heavy
	ld a, OBJSTATE_28
	ld [hli], a ; ; hThrownObjState_Heavy
	jr .check_objs

.is_heavy2
	ld a, OBJSTATE_29
	ld [hli], a ; hCollidedObjState_Light
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hThrownObjState_Light
	ld a, OBJSTATE_29
	ld [hli], a ; hCollidedObjState_Heavy
	ld a, OBJSTATE_28
	ld [hli], a ; hThrownObjState_Heavy
	jr .check_objs

.asm_61992
	; OBJSTATE_48 <= action <= OBJSTATE_4B
	rra
	ld hl, hCollidedObjState_Light
	jr c, .asm_619a0
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hCollidedObjState_Light
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; hThrownObjState_Light
	jr .check_objs

.asm_619a0
	ld a, OBJSTATE_WOBBLE_LEFT_START
	ld [hli], a ; hCollidedObjState_Light
	ld a, OBJSTATE_WOBBLE_RIGHT_START
	ld [hli], a ; hThrownObjState_Light

.check_objs

FOR n, 1, NUM_OBJECTS + 1
	ld a, [wObj{u:n}Flags]
	and OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN | OBJFLAG_GRABBED | OBJFLAG_NO_COLLISION | OBJFLAG_INVISIBLE
	cp OBJFLAG_ACTIVE | OBJFLAG_ON_SCREEN
	jr nz, .next_obj_{u:n}
	ld a, [wObj{u:n}ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj{u:n}ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj{u:n}CollBoxBottom]
	add h
	sub b
	jr c, .next_obj_{u:n}
	ld a, [wObj{u:n}CollBoxTop]
	add h
	sub c
	jr nc, .next_obj_{u:n}
	ld a, [wObj{u:n}CollBoxRight]
	add l
	sub d
	jr c, .next_obj_{u:n}
	ld a, [wObj{u:n}CollBoxLeft]
	add l
	sub e
	jr nc, .next_obj_{u:n}
	pop hl

; do collision
	res OBJFLAG_GRABBED_F, [hl]
	ld a, l
	add OBJ_STATE - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_STATE
	and $fe
	cp OBJSTATE_4A ; or OBJSTATE_4B
	jp z, .CollideWithObject{u:n}
	cp OBJSTATE_48 ; or OBJSTATE_49
	jp z, .CollideWithObject{u:n}
	ld a, [wObj{u:n}InteractionType]
	rla
	jp c, .CollideWithHeavyObject{u:n} ; heavy

	ldh a, [hThrownObjState_Light]
	ld [hl], a ; OBJ_STATE
	ld l, LOW(wObj{u:n}State)
	ld a, [hl]
	and $fe
	cp OBJSTATE_PICKED_UP_LEFT
	jr z, .reset_grab_{u:n}_1
	cp OBJSTATE_48
	jr nz, .skip_reset_grab_{u:n}_1
.reset_grab_{u:n}_1
	xor a
	ld [wGrabState], a
.skip_reset_grab_{u:n}_1
	ldh a, [hCollidedObjState_Light]
	ld [hl], a ; OBJ_STATE
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_016
	ret
.next_obj_{u:n}
ENDR
	pop hl
	ret

FOR n, 1, NUM_OBJECTS + 1
; hl = state of thrown object
; hThrownObjState_Light = new state for thrown object
; n = index of collided object
; hCollidedObjState_Light = new state for collided object
.CollideWithObject{u:n}
	xor a
	ld [wGrabState], a
	ldh a, [hThrownObjState_Light]
	ld [hl], a ; OBJ_STATE
	ld l, LOW(wObj{u:n}State)
	ldh a, [hCollidedObjState_Light]
	ld [hl], a
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_016
	ret
ENDR

FOR n, 1, NUM_OBJECTS + 1
; hl = state of thrown object
; hThrownObjState_Heavy = new state for thrown object
; n = index of collided object
; hCollidedObjState_Heavy = new state for collided object
.CollideWithHeavyObject{u:n}
	ldh a, [hThrownObjState_Heavy]
	ld [hl], a
	ld l, LOW(wObj{u:n}State)
	ld a, [hl]
	and $fe
	cp OBJSTATE_PICKED_UP_LEFT
	jr z, .reset_grab_{u:n}_2
	cp OBJSTATE_48
	jr nz, .skip_reset_grab_{u:n}_2
.reset_grab_{u:n}_2
	xor a
	ld [wGrabState], a
.skip_reset_grab_{u:n}_2
	ldh a, [hCollidedObjState_Heavy]
	ld [hl], a
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_NO_COLLISION_F, [hl]
	play_sfx SFX_016
	ret
ENDR

; clears objects and object data pointers
; and also some variables from level start
; such as whether the Flame Block is cleared
InitObjectVars_FromLevelStart:
	xor a
	call ClearObjects
	call ClearObjDataPointers
	ld [wFlameBlockCleared], a
	ld [wDollBoyNoFlashingBarrel], a
	ld [wDollBoyRemainingParts], a
	ld [wNumLitTorches], a
	ld [wShootGoals], a
	ld [wWarioGoals], a
	ret

; clears objects and object data pointers
; and also some variables from room start
InitObjectVars_FromTransition:
	xor a
	call ClearObjects
	call ClearObjDataPointers
	ld [wDollBoyNoFlashingBarrel], a
	ld [wDollBoyRemainingParts], a
	ld [wNumLitTorches], a
	ld [wShootGoals], a
	ld [wWarioGoals], a
	ret

ClearObjects:
	ld hl, wObjects
	ld c, a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

ClearObjDataPointers:
	ld hl, wObjDataPointers
	ld c, wObjDataPointersEnd - wObjDataPointers
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Func_61f54::
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a

	ld a, [wGrabState]
	and GRAB_STATE_MASK
	cp GRAB_PICK_UP
	jp z, .PickUp
	cp GRAB_IDLE
	jr z, .GrabIdle
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a ; *4
	ld e, a
	ld a, 30
	sub e
	ld e, a ; = 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub e
	ld [hli], a ; y
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	add 7
	ld [hli], a ; x
	ld a, [wWarioXPos + 0]
	adc 0
	ld [hl], a

	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a ; FALSE
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_61fd9
	ld a, [wc1ca]
	and a
	jr nz, .asm_61fd9
	ld hl, wCurObjYPos
	ld a, [hl] ; y
	add 16
	ld [hli], a
	jr nc, .drop_obj
	inc [hl]

.drop_obj
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjVar2], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_14
	ld [hld], a ; OBJ_STATE
	jp HomeJumpRet

.asm_61fd9
	ld a, OBJSTATE_19
	ld [wCurObjState], a
	jp HomeJumpRet

.PickUp
	ld hl, wCurObjVar1
	dec [hl]
	jp nz, HomeJumpRet
	inc l
	ld a, [hli] ; OBJ_VAR_2
	ld h, [hl] ; OBJ_VAR_3
	ld l, a
	ld a, [hli]
	and a
	jr nz, .asm_61ff5
	dec l
	dec l
	dec l
	dec l
	ld a, [hli]
.asm_61ff5
	ld [wCurObjVar1], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wCurObjVar2], a
	ld a, h
	ld [wCurObjVar3], a

	ld hl, hPickedUpObjPos
	ld a, c
	cp $80
	ld a, [wWarioYPos + 1]
	jr nc, .negative_y
	add c
	ld [hli], a
	ld a, [wWarioYPos + 0]
	jr nc, .got_hi_y
	inc a
	jr .got_hi_y
.negative_y
	add c
	ld [hli], a
	ld a, [wWarioYPos + 0]
	jr c, .got_hi_y
	dec a
.got_hi_y
	ld [hl], a
	inc l

	ld a, b
	cp $80
	ld a, [wWarioXPos + 1]
	jr nc, .negative_x
	add b
	ld [hli], a
	ld a, [wWarioXPos + 0]
	jr nc, .got_hi_x
	inc a
	jr .got_hi_x
.negative_x
	add b
	ld [hli], a
	ld a, [wWarioXPos + 0]
	jr c, .got_hi_x
	dec a
.got_hi_x
	ld [hl], a

	ld hl, hPickedUpObjPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a

	call Func_3513
	and $0f
	jr nz, .asm_62091
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, hPickedUpObjPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a

	call Func_358b
	and $0f
	jr nz, .asm_62091
	ld hl, hPickedUpObjPos
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet

.asm_62091
	ld a, [wCurObjInteractionType]
	and HEAVY_OBJ
	jp nz, .drop_obj
	or GRAB_UNK_02
	ld [wGrabState], a
	ld a, OBJSTATE_19
	ld [wCurObjState], a
	jp HomeJumpRet

Func_620a6::
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a

	ld a, [wGrabState]
	and GRAB_STATE_MASK
	cp GRAB_PICK_UP
	jp z, .PickUp
	cp GRAB_IDLE
	jr z, .GrabIdle
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a ; *4
	ld e, a
	ld a, 30
	sub e
	ld e, a ; = 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub e
	ld [hli], a ; y
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	sub 7
	ld [hli], a ; x
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [hl], a

	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a ; FALSE
	ld [wc1ca], a
	call Func_352b
	and a
	jr z, .asm_6212b
	ld a, [wc1ca]
	and a
	jr nz, .asm_6212b
	ld hl, wCurObjYPos
	ld a, [hl] ; y
	add 16
	ld [hli], a
	jr nc, .drop_obj
	inc [hl]

.drop_obj
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjVar2], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_15
	ld [hld], a ; OBJ_STATE
	jp HomeJumpRet

.asm_6212b
	ld a, OBJSTATE_18
	ld [wCurObjState], a
	jp HomeJumpRet

.PickUp
	ld hl, wCurObjVar1
	dec [hl]
	jp nz, HomeJumpRet
	inc l
	ld a, [hli] ; OBJ_VAR_2
	ld h, [hl] ; OBJ_VAR_3
	ld l, a
	ld a, [hli]
	and a
	jr nz, .asm_62147
	dec l
	dec l
	dec l
	dec l
	ld a, [hli]
.asm_62147
	ld [wCurObjVar1], a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wCurObjVar2], a
	ld a, h
	ld [wCurObjVar3], a

	ld hl, hPickedUpObjPos
	ld a, c
	cp $80
	ld a, [wWarioYPos + 1]
	jr nc, .negative_y
	add c
	ld [hli], a
	ld a, [wWarioYPos + 0]
	jr nc, .got_hi_y
	inc a
	jr .got_hi_y
.negative_y
	add c
	ld [hli], a
	ld a, [wWarioYPos + 0]
	jr c, .got_hi_y
	dec a
.got_hi_y
	ld [hl], a
	inc l

	ld a, b
	cp $80
	ld a, [wWarioXPos + 1]
	jr nc, .negative_x
	add b
	ld [hli], a
	ld a, [wWarioXPos + 0]
	jr nc, .got_hi_x
	inc a
	jr .got_hi_x
.negative_x
	add b
	ld [hli], a
	ld a, [wWarioXPos + 0]
	jr c, .got_hi_x
	dec a
.got_hi_x
	ld [hl], a

	ld hl, hPickedUpObjPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a

	call Func_3513
	and $0f
	jr nz, .asm_621e6
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, hPickedUpObjPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a

	call Func_358b
	and $0f
	jr nz, .asm_621e6
	ld hl, hPickedUpObjPos
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet

.asm_621e6
	ld a, [wCurObjInteractionType]
	and HEAVY_OBJ
	jp nz, .drop_obj
	or GRAB_UNK_02
	ld [wGrabState], a
	ld a, OBJSTATE_18
	ld [wCurObjState], a
	jp HomeJumpRet

Func_621fb::
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_IDLE
	jr z, .GrabIdle
	cp GRAB_CHARGE_THROW
	jr z, .GrabChargeThrow
	cp GRAB_THROW
	jp z, ThrowObject_Right

	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wIsCrouching]
	and a
	jr z, .not_crouching
; crouching
	ld a, $01
	ld [wCurObjVar2], a
	ld a, OBJSTATE_15
	ld [hl], a
	jp HomeJumpRet

.not_crouching
	ld a, OBJSTATE_12
	ld [hl], a
	jp HomeJumpRet

.GrabChargeThrow
	ld a, OBJSTATE_4B
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a ; 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub e
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	add 7
	ld [hli], a
	ld a, [wWarioXPos + 0]
	adc 0
	ld [hl], a
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_6229c

	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and a
	jp z, HomeJumpRet

.asm_6229c
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjVar2], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_14
	ld [hl], a ; OBJ_STATE
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	jp HomeJumpRet

Func_622bd::
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_IDLE
	jr z, .GrabIdle
	cp GRAB_CHARGE_THROW
	jr z, .GrabChargeThrow
	cp GRAB_THROW
	jp z, ThrowObject_Left

	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wIsCrouching]
	and a
	jr z, .not_crouching
; crouching
	ld a, $01
	ld [wCurObjVar2], a
	ld a, OBJSTATE_14
	ld [hl], a
	jp HomeJumpRet

.not_crouching
	ld a, OBJSTATE_12
	ld [hl], a
	jp HomeJumpRet

.GrabChargeThrow
	ld a, OBJSTATE_4A
	ld [wCurObjState], a
	jp HomeJumpRet

.GrabIdle
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a ; 26 if smash attacking, 30 otherwise
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub e
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	sub 7
	ld [hli], a
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [hl], a
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and a
	jr nz, .asm_62361
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, HomeJumpRet

.asm_62361
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	ld a, $02
	ld [wCurObjVar2], a
	ld hl, wCurObjAction
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJSTATE_15
	ld [hl], a ; OBJ_STATE
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	jp HomeJumpRet

Func_62382::
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_CHARGE_THROW
	jr z, .ChargeThrow
	cp GRAB_THROW_FULLY_CHARGED
	jr z, .ChargeThrow
	cp GRAB_HOLD_FULL_CHARGE
	jr z, .HoldFullCharge
	cp GRAB_THROW
	jp z, ThrowObject_Left

.asm_6239e
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.ChargeThrow
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub e
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	sub 7
	ld [hli], a
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [hl], a
	jp HomeJumpRet

.HoldFullCharge
	ld hl, hPickedUpObjPos
	ld a, [wWarioYPos + 1]
	sub 30
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	add 5
	ld [hli], a
	ld a, [wWarioXPos + 0]
	adc 0
	ld [hli], a
	ld hl, hPickedUpObjPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr z, .asm_62415
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	jr .asm_6239e

.asm_62415
	ld hl, hPickedUpObjPos
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet

ThrowObject_Left:
	play_sfx SFX_THROW
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hl], a
	rla
	ld l, OBJ_STATE_DURATION
	ld a, 0
	ld [hli], a
	inc l
	bit 6, b
	jr nz, .asm_62462
	ld b, $03
	jr nc, .asm_6244b
	ld b, $02
.asm_6244b
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_62454
	ld b, $01
.asm_62454
	ld a, b
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	inc l
	ld a, OBJSTATE_4E
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet

.asm_62462
	ld b, $04
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_6246d
	ld b, $01
.asm_6246d
	ld a, b
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	inc l
	ld a, OBJSTATE_FULL_THROW_LEFT_START
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet

Func_6247b::
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wGrabState]
	ld b, a
	and $0f
	cp GRAB_CHARGE_THROW
	jr z, .ChargeThrow
	cp GRAB_THROW_FULLY_CHARGED
	jr z, .ChargeThrow
	cp GRAB_HOLD_FULL_CHARGE
	jr z, .HoldFullCharge
	cp GRAB_THROW
	jp z, ThrowObject_Right

.asm_62497
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

.ChargeThrow
	ld a, [wIsSmashAttacking]
	add a
	add a
	ld e, a
	ld a, 30
	sub e
	ld e, a
	ld hl, wCurObjYPos
	ld a, [wWarioYPos + 1]
	sub e
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	add 7
	ld [hli], a
	ld a, [wWarioXPos + 0]
	adc 0
	ld [hl], a
	jp HomeJumpRet

.HoldFullCharge
	ld hl, hPickedUpObjPos
	ld a, [wWarioYPos + 1]
	sub 30
	ld [hli], a
	ld a, [wWarioYPos + 0]
	sbc 0
	ld [hli], a
	ld a, [wWarioXPos + 1]
	sub 5
	ld [hli], a
	ld a, [wWarioXPos + 0]
	sbc 0
	ld [hli], a
	ld hl, hPickedUpObjPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr z, .asm_6250e
	xor a
	ld [wGrabState], a
	play_sfx SFX_01A
	jr .asm_62497

.asm_6250e
	ld hl, hPickedUpObjPos
	ld de, wCurObjYPos
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	inc e
	ld a, [hli]
	ld [de], a
	jp HomeJumpRet

ThrowObject_Right:
	play_sfx SFX_THROW
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hl], a
	rla
	ld l, OBJ_STATE_DURATION
	ld a, 0
	ld [hli], a
	inc l
	bit 6, b
	jr nz, .asm_6255b
	ld b, $03
	jr nc, .asm_62544
	ld b, $02
.asm_62544
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_6254d
	ld b, $01
.asm_6254d
	ld a, b
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	inc l
	ld a, OBJSTATE_4F
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet

.asm_6255b
	ld b, $04
	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr z, .asm_62566
	ld b, $01
.asm_62566
	ld a, b
	ld [hli], a ; OBJ_VAR_2
	xor a
	ld [hli], a ; OBJ_VAR_3
	inc l
	ld a, OBJSTATE_FULL_THROW_RIGHT_START
	ld [hli], a ; OBJ_STATE
	ld a, 31 | (1 << 7)
	ld [hld], a ; OBJ_ACTION
	jp HomeJumpRet

Func_62574::
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .check_collision
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a ; FALSE
	ld [wc1ca], a
	inc a
	ld [wBlockFuncSpecialCollision], a ; COLLISION_THROWN_OBJ
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62d34
	ld a, [wIsInWaterOrSand]
	and a
	jr z, .check_collision
	; vanish when touching water or sand
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.check_collision
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_358b
	and a
	jr nz, .asm_625f7
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_3513
	and $0f
	jr z, .asm_625ff
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_625f7
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_625ff
	call MoveObjectLeftByVar2
	jp Func_62690

Func_62605::
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .check_collision
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a ; FALSE
	ld [wc1ca], a
	inc a
	ld [wBlockFuncSpecialCollision], a ; COLLISION_THROWN_OBJ
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62e0f
	ld a, [wIsInWaterOrSand]
	and a
	jr z, .check_collision
	; vanish when touching water or sand
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.check_collision
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_358b
	and a
	jr nz, .asm_62685
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_3513
	and $0f
	jr z, .asm_6268d
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62685
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_6268d
	call MoveObjectRightByVar2
;	fallthrough

Func_62690:
	ld l, OBJ_VAR_3
	ld a, [hl]
	dec b
	jr z, .asm_626d4
	ld b, HIGH(Data_60080)
	add LOW(Data_60080)
.asm_6269a
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_600a0 - Data_60080
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_626ae
	dec c
	ld a, [bc]
	jr .asm_626af
.asm_626ae
	inc [hl]
.asm_626af
	ldh [hffa0], a
	and a
	jr z, .asm_626d1
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_626c7
	add c
	ld [hli], a
	ld a, 1
	ld [wCurObjStateDuration], a
	jr nc, .asm_626d1
	inc [hl]
	jr .asm_626d1

.asm_626c7
	add c
	ld [hli], a
	ld a, 0
	ld [wCurObjStateDuration], a
	jr c, .asm_626d1
	dec [hl]
.asm_626d1
	jp HomeJumpRet

.asm_626d4
	ld b, HIGH(Data_60100)
	add LOW(Data_60100)
	jr .asm_6269a

Func_626da::
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .asm_62710
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a ; FALSE
	ld [wc1ca], a
	inc a
	ld [wBlockFuncSpecialCollision], a ; COLLISION_THROWN_OBJ
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62d34
	ld a, [wIsInWaterOrSand]
	and a
	jr z, .asm_62710
	; vanish when touching water or sand
.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62710
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_358b
	and a
	jr nz, .vanish
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_3513
	and $0f
	jr nz, .vanish
	call MoveObjectLeftByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62765
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62765
	jp Func_627f0

Func_62768::
	ld hl, wCurObjXPos + 1
	ld a, [hld]
	ldh [hXPosHi], a
	ld a, [hld]
	ldh [hXPosLo], a
	ld a, [wCurObjStateDuration]
	and a
	jr z, .check_collision
	ld a, [hld]
	ldh [hYPosHi], a
	ld a, [hl]
	ldh [hYPosLo], a
	xor a ; FALSE
	ld [wc1ca], a
	inc a
	ld [wBlockFuncSpecialCollision], a ; COLLISION_THROWN_OBJ
	call Func_352b
	and a
	ld a, $03
	ldh [hffa0], a
	jp nz, Func_62e0f
	ld a, [wIsInWaterOrSand]
	and a
	jr z, .check_collision
	; vanish when touching water or sand
.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.check_collision
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_358b
	and a
	jr nz, .vanish
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	ld a, COLLISION_THROWN_OBJ
	ld [wBlockFuncSpecialCollision], a
	call Func_3513
	and $0f
	jr nz, .vanish
	call MoveObjectRightByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, Func_627f0
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
;	fallthrough

Func_627f0:
	ld l, OBJ_VAR_3
	ld a, [hl]
	dec b
	jr z, .asm_62834
	ld b, $40
	add $c0
.asm_627fa
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $20
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_6280e
	dec c
	ld a, [bc]
	jr .asm_6280f
.asm_6280e
	inc [hl]
.asm_6280f
	ldh [hffa0], a
	and a
	jr z, .asm_62831
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ld a, $01
	ld [wCurObjStateDuration], a
	jr nc, .asm_62831
	inc [hl]
	jr .asm_62831
.negative
	add c
	ld [hli], a
	ld a, $00
	ld [wCurObjStateDuration], a
	jr c, .asm_62831
	dec [hl]
.asm_62831
	jp HomeJumpRet

.asm_62834
	ld b, $41
	add $40
	jr .asm_627fa

Func_6283a::
	ld a, [wCurObjVar2]
	ld b, a
	jr Func_6284f

Func_62840::
	ld a, [wCurObjVar2]
	ld b, a
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr c, Func_6284f
	sla b
	sla b ; *4
;	fallthrough

Func_6284f:
	ld hl, wCurObjXPos
	ld a, [hl]
	add b
	ld [hli], a
	jr nc, .no_overflow
	inc [hl]
.no_overflow
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(Data_60180)
	add LOW(Data_60180)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_601a0 - Data_60180
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62874
	dec c
	ld a, [bc]
	jr .asm_62875
.asm_62874
	inc [hl]
.asm_62875
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .asm_6288a
	inc [hl]
	jr .asm_6288a
.negative
	add c
	ld [hli], a
	jr c, .asm_6288a
	dec [hl]
.asm_6288a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	jp HomeJumpRet

Func_62892::
	ld a, [wCurObjVar2]
	ld b, a
	jr Func_628a7

Func_62898::
	ld a, [wCurObjVar2]
	ld b, a
	ld a, [wEffectivePowerUp]
	cp GARLIC
	jr c, Func_628a7
	sla b
	sla b
;	fallthrough

Func_628a7:
	ld hl, wCurObjXPos
	ld a, [hl]
	sub b
	ld [hli], a
	jr nc, .asm_628b0
	dec [hl]
.asm_628b0
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(Data_60180)
	add LOW(Data_60180)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_601a0 - Data_60180
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_628cc
	dec c
	ld a, [bc]
	jr .asm_628cd
.asm_628cc
	inc [hl]
.asm_628cd
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .asm_628e2
	inc [hl]
	jr .asm_628e2
.negative
	add c
	ld [hli], a
	jr c, .asm_628e2
	dec [hl]
.asm_628e2
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	jp HomeJumpRet

Func_628ea::
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	jp nz, HomeJumpRet
	ld a, OBJSTATE_12
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62908::
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_3543
	and a
	jp nz, HomeJumpRet
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62926::
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(Data_60040)
	add LOW(Data_60040)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_60060 - Data_60040
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62942
	dec c
	ld a, [bc]
	jr .asm_62943
.asm_62942
	inc [hl]
.asm_62943
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .asm_62958
	inc [hl]
	jr .asm_62958
.negative
	add c
	ld [hli], a
	jr c, .asm_62958
	dec [hl]
.asm_62958
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_62980
	ld a, [wIsInWaterOrSand]
	and a
	jp z, HomeJumpRet
	; vanish when touching water or sand
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62980
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, [wc18c]
	and a
	jr nz, .asm_62997
	ld a, OBJSTATE_0F
	ld [hl], a
	jp HomeJumpRet

.asm_62997
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjVar2], a
	jp z, Func_62d57
	jp Func_62e31

Func_629a6::
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(Data_602a0)
	add LOW(Data_602a0)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_602b0 - Data_602a0
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_629c2
	dec c
	ld a, [bc]
	jr .asm_629c3
.asm_629c2
	inc [hl] ; OBJ_VAR_3
.asm_629c3
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_629cd
	dec [hl]
.asm_629cd
	jp HomeJumpRet

_ObjState_StandingFall::
; speed up animation by 3x
	ld hl, wCurObjFrameDuration
	ld a, [hl]
	cp 3
	jr c, .done_anim_speedup
	sub 3
	ld [hl], a

.done_anim_speedup
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(StandingFallYVel_Light)
	add LOW(StandingFallYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add StandingFallYVel_Heavy - StandingFallYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc] ; use last entry
	jr .got_y_vel
.not_last
	inc [hl] ; OBJ_VAR_3
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
; positive
	add c
	ld [hli], a
	jr nc, .done_y_vel
	inc [hl]
	jr .done_y_vel
.negative
	add c
	ld [hli], a
	jr c, .done_y_vel
	dec [hl]

.done_y_vel
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_62a35
	ld a, [wIsInWaterOrSand]
	and a
	jp z, HomeJumpRet
	; vanish when touching water or sand
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.asm_62a35
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, [wc18c]
	and a
	jr nz, .asm_62a4c
	ld a, OBJSTATE_TURN_AROUND_START
	ld [hl], a
	jp HomeJumpRet

.asm_62a4c
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjVar2], a
	jp z, Func_62d57
	jp Func_62e31

; handle gravity for falling objects
_ObjState_Fall::
	ld hl, wCurObjVar3
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add FallingYVel_Heavy - FallingYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .incr_index
	dec c ; use last entry
	ld a, [bc]
	jr .got_y_vel
.incr_index
	inc [hl]
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .no_carry
	inc [hl]
.no_carry
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a

	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .land
	ld a, [wIsInWaterOrSand]
	and a
	jp z, HomeJumpRet
	; vanish when touching water or sand
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

.land
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE
	ld a, [wc18c]
	and a
	jr nz, .asm_62ac1
	ld a, OBJSTATE_LAND
	ld [hl], a
	jp HomeJumpRet

.asm_62ac1
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjVar2], a
	jp z, Func_62d57
	jp Func_62e31

_ObjState_BumpRight::
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jr nz, Func_62ae5
	dec l
	dec l
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, HomeJumpRet
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62ae5::
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp nz, .asm_62b70
	call MoveObjectLeftByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62b19
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]

.asm_62b19
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_3543
	cp $10

	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	jr z, .asm_62b9b
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62b7d
	ld hl, wCurObjXPos
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62b7d
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jr .asm_62b7d

.asm_62b70
	play_sfx SFX_01A
	ld a, OBJSTATE_STUN_RIGHT_START
	ld [wCurObjState], a

.asm_62b7d
	ld hl, wCurObjVar2
	ld a, [wCurObjInteractionType]
	rla
	ld a, [wGlobalCounter]
	jr c, .heavy
	and %111
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet
.heavy
	and %11
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet

.asm_62b9b
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wc18c]
	rra
	jr nc, .asm_62bb3
	ld a, [hl]
	cp OBJSTATE_STUN_LEFT
	jp z, HomeJumpRet
	ld a, OBJSTATE_14
	ld [hl], a
	jp HomeJumpRet
.asm_62bb3
	ld a, OBJSTATE_STUN_RIGHT_START
	ld [hl], a
	jp HomeJumpRet

_ObjState_BumpLeft::
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jr nz, Func_62bce
	dec l
	dec l
	dec [hl] ; OBJ_STATE_DURATION
	jp nz, HomeJumpRet
	ld a, OBJSTATE_TURN_AROUND_START
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62bce::
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp nz, .asm_62c56
	call MoveObjectRightByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, .asm_62bff
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]

.asm_62bff
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_3543
	cp $10

	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	jr z, .asm_62c81
	ld hl, wCurObjXPos
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62c63
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_35a3
	and a
	jr nz, .asm_62c63
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jr .asm_62c63

.asm_62c56
	play_sfx SFX_01A
	ld a, OBJSTATE_STUN_LEFT_START
	ld [wCurObjState], a

.asm_62c63
	ld hl, wCurObjVar2
	ld a, [wCurObjInteractionType]
	rla
	ld a, [wGlobalCounter]
	jr c, .heavy
	and %111
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet
.heavy
	and %11
	jp nz, HomeJumpRet
	dec [hl]
	jp HomeJumpRet

.asm_62c81
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_STATE
	ld a, [wc18c]
	rra
	jr c, .asm_62c99
	ld a, [hl]
	cp OBJSTATE_STUN_RIGHT
	jp z, HomeJumpRet
	ld a, OBJSTATE_15
	ld [hl], a
	jp HomeJumpRet
.asm_62c99
	ld a, OBJSTATE_STUN_LEFT_START
	ld [hl], a
	jp HomeJumpRet

Func_62c9f::
	ld hl, wCurObjState
	ld a, OBJSTATE_56
	ld [hld], a
	dec l
	xor a
	ld [hld], a
;	fallthrough

Func_62ca8::
	call MoveObjectLeftByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62cb8
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62cb8
	ld l, OBJ_VAR_3
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add FallingYVel_Heavy - FallingYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc]
	jr .got_y_vel
.not_last
	inc [hl]
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .no_cap
	inc [hl]
.no_cap
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	ld [wc1ca], a
	call Func_352b
	and a
	jr nz, Func_62d34
	ld a, [wIsInWaterOrSand]
	and a
	jr nz, .vanish ; vanish when touching water or sand

	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, HomeJumpRet
	ld a, OBJSTATE_15
	ld [wCurObjState], a
	jp HomeJumpRet

.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62d34:
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, [wc18c]
	and $0f
	cp $01
	jr z, .asm_62d55
	ld l, OBJ_VAR_2
	cp $02
	jr nz, .asm_62d50
	dec a
	ld [hl], a
	jr .asm_62d55
.asm_62d50
	ld a, [hl]
	and a
	jr z, .asm_62d55
	dec [hl]
.asm_62d55
	ld l, OBJ_STATE
;	fallthrough

; hl = OBJ_STATE
Func_62d57:
	ldh a, [hffa0] ; y vel
	cp 2
	jr c, .asm_62d6b
	cp 3
	jr c, .asm_62d71
	cp 4
	jr c, .asm_62d77
	ld a, OBJSTATE_24
	ld [hl], a
	jp HomeJumpRet
.asm_62d6b
	ld a, OBJSTATE_STUN_LEFT_START
	ld [hl], a
	jp HomeJumpRet
.asm_62d71
	ld a, OBJSTATE_20
	ld [hl], a
	jp HomeJumpRet
.asm_62d77
	ld a, OBJSTATE_22
	ld [hl], a
	jp HomeJumpRet

Func_62d7d::
	ld hl, wCurObjState
	ld a, OBJSTATE_57
	ld [hld], a
	dec l
	xor a
	ld [hld], a
;	fallthrough

Func_62d86::
	call MoveObjectRightByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, .asm_62d96
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62d96
	ld l, OBJ_VAR_3
	ld a, [hl]
	ld b, HIGH(FallingYVel_Light)
	add LOW(FallingYVel_Light)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add FallingYVel_Heavy - FallingYVel_Light
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc]
	jr .got_y_vel
.not_last
	inc [hl]
.got_y_vel
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .no_cap
	inc [hl]
.no_cap
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	ld [wc1ca], a
	call Func_352b
	and a
	jr nz, Func_62e0f
	ld a, [wIsInWaterOrSand]
	and a
	jr nz, .vanish ; vanish when touching water or sand

	ld hl, wCurObjYPos
	ld a, [hli]
	sub 4
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jp z, HomeJumpRet
	ld a, OBJSTATE_14
	ld [wCurObjState], a
	jp HomeJumpRet

.vanish
	ld a, OBJSTATE_VANISH_TOUCH
	ld [wCurObjState], a
	jp HomeJumpRet

Func_62e0f:
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, [wc18c]
	and $0f
	cp $02
	jr z, .asm_62e2f
	ld l, OBJ_VAR_2
	cp $01
	jr nz, .asm_62e2a
	ld [hl], a
	jr .asm_62e2f
.asm_62e2a
	ld a, [hl]
	and a
	jr z, .asm_62e2f
	dec [hl]
.asm_62e2f
	ld l, OBJ_STATE
;	fallthrough

; hl = OBJ_STATE
Func_62e31:
	ldh a, [hffa0] ; y vel
	cp 2
	jr c, .asm_62e45
	cp 3
	jr c, .asm_62e4b
	cp 4
	jr c, .asm_62e51
	ld a, OBJSTATE_25
	ld [hl], a
	jp HomeJumpRet
.asm_62e45
	ld a, OBJSTATE_STUN_RIGHT_START
	ld [hl], a
	jp HomeJumpRet
.asm_62e4b
	ld a, OBJSTATE_21
	ld [hl], a
	jp HomeJumpRet
.asm_62e51
	ld a, OBJSTATE_23
	ld [hl], a
	jp HomeJumpRet

Func_62e57::
	play_sfx SFX_VANISH

	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(Func_4c860)
	ld [hld], a
	ld a, LOW(Func_4c860)
	ld [hld], a
	call Func_618b4
	jp HomeJumpRet

_VanishObject2::
	call _VanishObject
	jp HomeJumpRet

Func_62e74::
	ld hl, wCurObjState
	ld a, OBJSTATE_54
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, [wCurObjInteractionType]
	rla
	ld a, $06
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62e8a::
	ld bc, Data_60300
	jr Func_62ec3

Func_62e8f::
	ld hl, wCurObjState
	ld a, OBJSTATE_50
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, [wCurObjInteractionType]
	rla
	ld a, $04
	jr nc, .not_heavy
	ld a, $01
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62ea5::
	ld bc, Data_602c0
	jr Func_62ec3

Func_62eaa::
	ld hl, wCurObjState
	ld a, OBJSTATE_52
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, [wCurObjInteractionType]
	rla
	ld a, $05
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62ec0::
	ld bc, Data_602e0
;	fallthrough

Func_62ec3:
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $10
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62edc
	dec c
	ld a, [bc]
	jr .asm_62edd
.asm_62edc
	inc [hl]
.asm_62edd
	and a
	jr z, .asm_62ee8
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_62ee8
	dec [hl]
.asm_62ee8
	call MoveObjectLeftByVar2

	ld a, [wCurObjScreenXPos]
	add $28
	cp $f0
	jr c, .asm_62ef8
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62ef8
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_62f4e
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxLeft]
	cpl
	inc a
	ld b, a
	ld a, [hli]
	sub b
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_62f4e
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, HomeJumpRet
	ld a, OBJSTATE_26
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	jp HomeJumpRet

.asm_62f4e
	ld a, OBJSTATE_27
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	jp HomeJumpRet

Func_62f5b::
	ld hl, wCurObjState
	ld a, OBJSTATE_55
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, [wCurObjInteractionType]
	rla
	ld a, $06
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62f71::
	ld bc, Data_60300
	jr Func_62faa

Func_62f76::
	ld hl, wCurObjState
	ld a, OBJSTATE_51
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, [wCurObjInteractionType]
	rla
	ld a, $04
	jr nc, .not_heavy
	ld a, $01
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62f8c::
	ld bc, Data_602c0
	jr Func_62faa

Func_62f91::
	ld hl, wCurObjState
	ld a, OBJSTATE_53
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, [wCurObjInteractionType]
	rla
	ld a, $05
	jr nc, .not_heavy
	ld a, $02
.not_heavy
	ld [wCurObjStateDuration], a
;	fallthrough

Func_62fa7::
	ld bc, Data_602e0
;	fallthrough

Func_62faa::
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $10
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62fc3
	dec c
	ld a, [bc]
	jr .asm_62fc4
.asm_62fc3
	inc [hl]
.asm_62fc4
	and a
	jr z, .asm_62fcf
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_62fcf
	dec [hl]
.asm_62fcf
	call MoveObjectRightByVar2
	ld a, [wCurObjScreenXPos]
	add $28
	cp $10
	jr nc, .asm_62fdf
	ld l, OBJ_FLAGS
	res OBJFLAG_GRABBED_F, [hl]
.asm_62fdf
	ld a, [wCurObjCollBoxTop]
	cpl
	inc a
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hli]
	sub b
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hli]
	ldh [hXPosHi], a
	call Func_358b
	and $0f
	jr nz, .asm_63032
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjCollBoxRight]
	add [hl]
	ldh [hXPosLo], a
	inc l
	ld a, [hl]
	adc 0
	ldh [hXPosHi], a
	call Func_3513
	and $0f
	jr nz, .asm_63032
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, HomeJumpRet
	ld a, OBJSTATE_27
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	jp HomeJumpRet

.asm_63032
	ld a, $26
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	jp HomeJumpRet

Func_6303f::
	ld hl, wCurObjState
	ld a, OBJSTATE_1B
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, $07
	ld [wCurObjStateDuration], a
	jp HomeJumpRet

Func_63050::
	ld hl, wCurObjStateDuration
	dec [hl]
	jp nz, Func_629a6
	ld a, OBJSTATE_STANDING_FALL_START
	ld [wCurObjState], a
	jp HomeJumpRet

Func_6305f::
	ldh a, [rDIV]
	rra
	jr c, .asm_63068
	ld a, OBJSTATE_WOBBLE_RIGHT
	jr .asm_6306a
.asm_63068
	ld a, OBJSTATE_WOBBLE_LEFT
.asm_6306a
	ld hl, wCurObjState
	ld [hld], a
	dec l
	xor a
	ld [hld], a ; OBJ_VAR_3
	ld a, $01
	ld [hld], a ; OBJ_VAR_2
	dec l
	ld a, $04
	ld [hli], a ; OBJ_STATE_DURATION
	jp HomeJumpRet

; seems to be a function to load/unload objects
; that are inside and outside the screen
CheckObjectOnScreen:
	ld hl, wCurObjYPos
	ld a, [hli] ; y lo
	ld c, a
	ld a, [hli] ; y hi
	ld b, a
	ld a, [hli] ; x lo
	ld e, a
	ld d, [hl]  ; x hi

; bc = y pos
; de = x pos

	ld hl, wCameraSCY
	ld a, [hli]
	ld l, [hl]
	ld h, a
	push bc
	push de
	push hl
	ld a, c
	add 24
	ld c, a
	jr nc, .no_overflow1
	inc b
	jr z, .skip_y1
.no_overflow1
	ld a, b
	cp h
	jr c, .asm_630fd
	jr nz, .skip_y1
	; b == h
	ld a, c
	cp l
	jr c, .asm_630fd
	jr z, .skip_y2
	; c > l

.skip_y1
	ld a, l
	add SCREEN_HEIGHT_PX
	ld l, a
	jr nc, .no_overflow2
	inc h
.no_overflow2
	ld a, c
	sub 56
	ld c, a
	jr nc, .no_underflow1
	dec b
	ld a, b
	inc a
	jr z, .skip_y2
.no_underflow1
	ld a, b
	cp h
	jr c, .skip_y2
	jr nz, .asm_630fd
	ld a, c
	cp l
	jr nc, .asm_630fd

.skip_y2
	ld hl, wCameraSCX
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add 24
	ld e, a
	jr nc, .no_overflow3
	inc d
	jr z, .on_screen
.no_overflow3
	ld a, d
	cp h
	jr c, .outside_screen
	jr nz, .asm_630da
	ld a, e
	cp l
	jr c, .outside_screen
	jr z, .on_screen
.asm_630da
	ld a, l
	add SCREEN_WIDTH_PX
	ld l, a
	jr nc, .asm_630e1
	inc h
.asm_630e1
	ld a, e
	sub $30
	ld e, a
	jr nc, .asm_630ec
	dec d
	ld a, d
	inc a
	jr z, .on_screen
.asm_630ec
	ld a, d
	cp h
	jr c, .on_screen
	jr nz, .outside_screen
	ld a, e
	cp l
	jr nc, .outside_screen
.on_screen
	ld hl, wCurObjFlags
	set OBJFLAG_ON_SCREEN_F, [hl]
	jr .asm_6310b

.asm_630fd
	ld a, [wCurObjState]
	and $fe
	cp OBJSTATE_48
	jr z, .asm_6310b
.outside_screen
	ld hl, wCurObjFlags
	res OBJFLAG_ON_SCREEN_F, [hl]
.asm_6310b
	pop hl
	pop de
	pop bc

	ld a, d
	rla
	jr c, .asm_6317e
	ld a, b
	rla
	jr c, .asm_6317e
	ld a, c
	add 92
	ld c, a
	jr nc, .asm_6311f
	inc b
	jr z, .asm_63147
.asm_6311f
	ld a, b
	cp h
	jr c, .asm_6317e
	jr nz, .asm_6312b
	ld a, c
	cp l
	jr c, .asm_6317e
	jr z, .asm_63147
.asm_6312b
	ld a, l
	add $90
	ld l, a
	jr nc, .asm_63132
	inc h
.asm_63132
	ld a, c
	sub $cb
	ld c, a
	jr nc, .asm_6313d
	dec b
	ld a, b
	inc a
	jr z, .asm_63147
.asm_6313d
	ld a, b
	cp h
	jr c, .asm_63147
	jr nz, .asm_6317e
	ld a, c
	cp l
	jr nc, .asm_6317e

.asm_63147
	ld hl, wCameraSCX
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add $6f
	ld e, a
	jr nc, .asm_63156
	inc d
	jr z, .done
.asm_63156
	ld a, d
	cp h
	jr c, .asm_6317e
	jr nz, .asm_63162
	ld a, e
	cp l
	jr c, .asm_6317e
	jr z, .done
.asm_63162
	ld a, l
	add SCREEN_WIDTH_PX
	ld l, a
	jr nc, .asm_63169
	inc h
.asm_63169
	ld a, e
	sub $de
	ld e, a
	jr nc, .asm_63174
	dec d
	ld a, d
	inc a
	jr z, .done
.asm_63174
	ld a, d
	cp h
	jr c, .done
	jr nz, .asm_6317e
	ld a, e
	cp l
	jr c, .done
.asm_6317e
	ld a, [wCurObjSubState]
	and $f | OBJSUBFLAG_UNK_4
	cp $0 | OBJSUBFLAG_UNK_4
	ret nc
	; OBJSUBFLAG_UNK_4 is not set
	ld hl, wCurObjUnk02
	and a
	jr z, .asm_6319c
	farcall DespawnObject
	ret
.asm_6319c
	xor a
	ld [wCurObjFlags], a
.done
	ret

_ApplyObjSetMovement::
	ld hl, wCurObjVar1
	dec [hl]
	ret nz
	inc l
	ld a, [hli] ; var2
	ld h, [hl]  ; var3
	ld l, a
	ld a, [hli]
	and a
	jr nz, .no_loop
; loop
	ld h, d
	ld l, e
	ld a, [hli]
.no_loop
	ld [wCurObjVar1], a ; duration
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wCurObjVar2], a
	ld a, h
	ld [wCurObjVar3], a

	ld hl, wCurObjYPos
	ld a, c
	cp $80
	jr nc, .negative_y
	ld a, [hl]
	add c
	ld [hli], a
	jr nc, .x_pos
	inc [hl]
	jr .x_pos
.negative_y
	ld a, [hl]
	add c
	ld [hli], a
	jr c, .x_pos
	dec [hl]

.x_pos
	inc l
	ld a, b
	cp $80
	jr nc, .negative_x
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
.negative_x
	ld a, [hl]
	add b
	ld [hli], a
	ret c
	dec [hl]
	ret

_ApplyObjYMovement::
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .not_last
	dec c
	ld a, [bc]
	jr .got_y_vel
.not_last
	inc [hl]
.got_y_vel
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.negative
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret

Func_63209::
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .next
	dec c
	ld a, [bc]
	jr .got_y_offset
.next
	inc [hl]
.got_y_offset
	ld b, a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	jr nc, .check_stepped
	inc [hl]
	jr .check_stepped
.negative
	add c
	ld [hli], a
	jr c, .check_stepped
	dec [hl]
.check_stepped
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	call AddYOffset
	farcall Func_19720
	ret

_ApplyObjXMovement::
	ld hl, wCurObjVar2
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_63256
	dec c
	ld a, [bc]
	jr .asm_63257
.asm_63256
	inc [hl]
.asm_63257
	ld l, OBJ_X_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_63263
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_63263
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret

_ApplyObjYMovement_Loop::
	ld e, c
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_63278
	xor a
	ld [hl], a
	ld c, e
	ld a, [bc]
.asm_63278
	inc [hl]
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_63285
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_63285
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret

_ApplyObjXMovement_Loop::
	ld e, c
	ld hl, wCurObjVar2
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_6329a
	; restart movement
	xor a
	ld [hl], a
	ld c, e
	ld a, [bc]
.asm_6329a
	inc [hl]
	ld l, OBJ_X_POS
	cp $80
	ld c, [hl]
	jr nc, .negative
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.negative
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret

Func_632ac::
	ld hl, wCurObjUnk01
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld e, $00
	ld d, OBJFLAG_ACTIVE | OBJFLAG_TRANSIENT
	ld h, HIGH(wObj1)
	ld l, OBJ_FLAGS
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632c8
	ld a, [hli]
	cp c
	jr nz, .asm_632c8
	ld a, [hl]
	cp b
	jr nz, .asm_632c8
	inc e
.asm_632c8
	ld l, $20
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632d8
	ld a, [hli]
	cp c
	jr nz, .asm_632d8
	ld a, [hl]
	cp b
	jr nz, .asm_632d8
	inc e
.asm_632d8
	ld l, $40
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632e8
	ld a, [hli]
	cp c
	jr nz, .asm_632e8
	ld a, [hl]
	cp b
	jr nz, .asm_632e8
	inc e
.asm_632e8
	ld l, $60
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632f8
	ld a, [hli]
	cp c
	jr nz, .asm_632f8
	ld a, [hl]
	cp b
	jr nz, .asm_632f8
	inc e
.asm_632f8
	ld l, $80
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63308
	ld a, [hli]
	cp c
	jr nz, .asm_63308
	ld a, [hl]
	cp b
	jr nz, .asm_63308
	inc e
.asm_63308
	ld l, $a0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63318
	ld a, [hli]
	cp c
	jr nz, .asm_63318
	ld a, [hl]
	cp b
	jr nz, .asm_63318
	inc e
.asm_63318
	ld l, $c0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63328
	ld a, [hli]
	cp c
	jr nz, .asm_63328
	ld a, [hl]
	cp b
	jr nz, .asm_63328
	inc e
.asm_63328
	ld l, $e0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63338
	ld a, [hli]
	cp c
	jr nz, .asm_63338
	ld a, [hl]
	cp b
	jr nz, .asm_63338
	inc e
.asm_63338
	ret

_CountActiveTransientObjects::
	ld e, 0
	ld d, OBJFLAG_ACTIVE | OBJFLAG_TRANSIENT
FOR n, 1, NUM_OBJECTS + 1
	ld a, [wObj{u:n}Flags]
	and d
	cp d
	jr nz, :+
	inc e
:
ENDR
	ret
