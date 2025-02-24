UpdateFloor::
	call GetFloorForYPos
	ld a, c
	ld [wFloor], a
	ret

; returns in c:
; 6 if   $0 <= ypos <  $80
; 5 if  $80 <= ypos < $100
; 4 if $100 <= ypos < $180
; 3 if $180 <= ypos < $200
; 2 if $200 <= ypos < $280
; 1 if $280 <= ypos < $300
GetFloorForYPos::
	ld a, [wWarioYPos + 0]
	dec a
	jr z, .asm_115b ; == 1
	dec a
	jr z, .asm_115f ; == 2
	ld c, 5
	jr .asm_1161
.asm_115b
	ld c, 3
	jr .asm_1161
.asm_115f
	ld c, 1

.asm_1161
	ld a, [wWarioYPos + 1]
	cp $80
	ret nc
	; < $80
	inc c
	ret

HandleDownwardsFloorTransition::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .skip
	jr c, .skip
	jr StartDownwardsFloorTransition
.skip
	ret

; unreferenced?
Func_1180::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr z, .skip
	jr c, StartUpwardsFloorTransition
	jr StartDownwardsFloorTransition
.skip
	ret

HandleUpwardsFloorTransition::
	ld a, [wCameraConfigFlags]
	and CAM_SCROLLING_MASK
	cp CAM_TRANSITIONS
	jr c, .skip
	call GetFloorForYPos
	ld a, [wFloor]
	sub c
	jr c, .do_transition
	jr .skip
.do_transition
	jr StartUpwardsFloorTransition

.skip
	ret

; c = new floor
StartDownwardsFloorTransition::
	ld a, c
	ld [wFloor], a
	cp 5
	jr z, .asm_11ba
	ld a, $80
	jr .asm_11bc
.asm_11ba
	ld a, $68
.asm_11bc
	ld [wFloorTransitionTimer], a
	play_sfx SFX_PIPE_EXIT
	ld a, FLOOR_TRANSITION_UP
	ld [wFloorTransitionDir], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	xor a
	ld [wCameraRoomYScrollLimit], a
	ret

; c = new floor
StartUpwardsFloorTransition::
	ld a, c
	ld [wFloor], a
	play_sfx SFX_PIPE_EXIT
	ld a, FLOOR_TRANSITION_DOWN
	ld [wFloorTransitionDir], a
	ld a, TRUE
	ld [wIsFloorTransition], a
	ld a, $80
	ld [wFloorTransitionTimer], a
	xor a
	ld [wCameraRoomYScrollLimit], a
	ret
