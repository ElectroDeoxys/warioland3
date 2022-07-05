HebariiFunc: ; 49fc4 (12:5fc4)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ret

.Init:
	ld hl, wCurObjFlags
	res OBJFLAG_UNK4_F, [hl]
	ld l, OBJ_UNK_1A
	res 5, [hl]

	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -7
	ld [hld], a
	ld a, -12
	ld [hl], a

	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.AttachedUpdate)
	ld [hld], a
	ld a, LOW(.AttachedUpdate)
	ld [hld], a

	ld de, Frameset_683e4
	call SetObjectFramesetPtr

	ld a, 20
	ld [hli], a ; OBJ_ACTION_DURATION
	xor a
	ld [hl], a ; OBJ_UNK_17
	ld l, OBJ_UNK_1A
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .set_right
; set left
	res 7, [hl]
	ret
.set_right
	set 7, [hl]
	ret

.StartAction04:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp .Action04

.StartAction05:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp .Action05

.StartAction28:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp .Action28

.StartAction29:
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	jp z, .Action29

.AttachedUpdate:
; for when Hebarii is still attached to the ceiling
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake1
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.DetachedUpdate)
	ld [hld], a
	ld a, LOW(.DetachedUpdate)
	ld [hld], a
	ld de, Frameset_683f8
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 5
	ld [hld], a
	ld a, -6
	ld [hld], a
	ld a, -1
	ld [hld], a
	ld a, -14
	ld [hld], a
	ld a, [hl] ; OBJ_INTERACTION_TYPE
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hld], a
	ld a, OBJACTION_SPECIAL_1
	ld [wCurObjAction], a
	xor a
	ld [wCurObjMovementIndex], a
	ret

.no_shake1
	ld hl, wCurObjAction
	ld a, [hl]
	and a
	jr z, .asm_4a08d
	cp OBJACTION_04
	jr z, .StartAction04
	cp OBJACTION_05
	jr z, .StartAction05
	cp OBJACTION_28
	jr z, .StartAction28
	cp OBJACTION_29
	jr z, .StartAction29
	cp OBJACTION_VANISH
	jp z, ObjAction_Vanish2
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_UNK3_F, [hl]
.asm_4a08d
	ld l, OBJ_UNK_17
	ld a, [hld]
	dec a
	jr z, .asm_4a0fd
	dec [hl]
	jr nz, .asm_4a0a3
	ld de, Frameset_683ed
	call SetObjectFramesetPtr
	ld a, 41
	ld [hli], a ; OBJ_ACTION_DURATION
	ld a, $01
	ld [hl], a ; OBJ_UNK_17
	ret

.asm_4a0a3
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 18
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	ld a, [wCurObjUnk1a]
	rlca
	jr c, .asm_4a0c8
	ld a, [hli]
	sub 11
	ldh [hXPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hXPosHi], a
	jr .asm_4a0d2
.asm_4a0c8
	ld a, [hli]
	add 9
	ldh [hXPosLo], a
	ld a, [hli]
	adc 0
	ldh [hXPosHi], a
.asm_4a0d2
	call Func_3513
	and a
	jr z, .switch_direction
	ld hl, wCurObjYPos
	ld a, [hli]
	sub 8
	ldh [hYPosLo], a
	ld a, [hli]
	sbc 0
	ldh [hYPosHi], a
	call Func_3513
	and a
	jr nz, .switch_direction
	ld a, [wCurObjUnk1a]
	rlca
	jp c, MoveObjectRight
	jp MoveObjectLeft

.switch_direction
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80
	ld [hl], a
	ret

.asm_4a0fd
	ld a, [hl] ; OBJ_ACTION_DURATION
	cp 30
	jr z, .asm_4a10f
	dec [hl]
	ret nz
	ld a, 126
	ld [hli], a
	xor a
	ld [hl], a ; OBJ_UNK_17
	ld de, Frameset_683e4
	jp SetObjectFramesetPtr

.asm_4a10f
	dec [hl]
	ld l, OBJ_FLAGS
	bit OBJFLAG_UNK1_F, [hl]
	ret z
	ld bc, ObjParams_HebariiProjectile
	jp CreateObjectAtRelativePos

.DetachedUpdate:
; functions for when Hebarii is detached from the ceiling 
	ld a, [wCurObjAction]
	jumptable

	dw .Vanish ; OBJACTION_00
	dw .Vanish ; OBJACTION_LAND
	dw .Func_4a26d ; OBJACTION_BUMP_LEFT_START
	dw .Func_4a277 ; OBJACTION_BUMP_RIGHT_START
	dw .Action04 ; OBJACTION_04
	dw .Action05 ; OBJACTION_05
	dw .GrabLeftStart ; OBJACTION_GRAB_LEFT_START
	dw .GrabRightStart ; OBJACTION_GRAB_RIGHT_START
	dw .Func_4a26d ; OBJACTION_08
	dw .Func_4a277 ; OBJACTION_09
	dw .Vanish ; OBJACTION_VANISH
	dw .Vanish ; OBJACTION_0B
	dw .Vanish ; OBJACTION_0C
	dw .Vanish ; OBJACTION_0D
	dw .Vanish ; OBJACTION_0E
	dw .Action0f ; OBJACTION_0F
	dw .Vanish ; OBJACTION_10
	dw .Vanish ; OBJACTION_STANDING_FALL_START
	dw .Action12 ; OBJACTION_12
	dw .Func_4a224 ; OBJACTION_TURN_AROUND_START
	dw .Action14 ; OBJACTION_14
	dw .Action15 ; OBJACTION_15
	dw .StunLeftStart ; OBJACTION_STUN_LEFT_START
	dw .StunRightStart ; OBJACTION_STUN_RIGHT_START
	dw .Action18 ; OBJACTION_18
	dw .Action19 ; OBJACTION_19
	dw .Vanish ; OBJACTION_1A
	dw .Vanish ; OBJACTION_1B
	dw .Vanish ; OBJACTION_1C
	dw .Vanish ; OBJACTION_1D
	dw .Vanish ; OBJACTION_1E
	dw .Vanish ; OBJACTION_1F
	dw Func_3191 ; OBJACTION_20
	dw Func_31af ; OBJACTION_21
	dw Func_31cd ; OBJACTION_22
	dw Func_31eb ; OBJACTION_23
	dw Func_3209 ; OBJACTION_24
	dw Func_3227 ; OBJACTION_25
	dw Func_3245 ; OBJACTION_26
	dw Func_3254 ; OBJACTION_27
	dw .Action28 ; OBJACTION_28
	dw .Action29 ; OBJACTION_29
	dw .Vanish ; OBJACTION_2A
	dw .Vanish ; OBJACTION_2B
	dw .Vanish ; OBJACTION_2C
	dw .FallFromCeiling ; OBJACTION_SPECIAL_1
	dw .Vanish ; OBJACTION_SPECIAL_2
	dw .Vanish ; OBJACTION_SPECIAL_3
	dw .Vanish ; OBJACTION_FALL
	dw .Func_4a224 ; OBJACTION_WALK
	dw ObjAction_BumpLeft ; OBJACTION_BUMP_LEFT
	dw ObjAction_BumpRight ; OBJACTION_BUMP_RIGHT
	dw .Vanish ; OBJACTION_34
	dw .Vanish ; OBJACTION_35
	dw Func_3335 ; OBJACTION_36
	dw Func_3344 ; OBJACTION_37
	dw Func_31fa ; OBJACTION_38
	dw Func_31dc ; OBJACTION_39
	dw .Vanish ; OBJACTION_3A
	dw .Vanish ; OBJACTION_3B
	dw .Vanish ; OBJACTION_3C
	dw .Vanish ; OBJACTION_3D
	dw .Vanish ; OBJACTION_3E
	dw .Action3f ; OBJACTION_3F
	dw .Vanish ; OBJACTION_40
	dw .Vanish ; OBJACTION_STANDING_FALL
	dw Func_3371 ; OBJACTION_42
	dw .Vanish ; OBJACTION_TURN_AROUND
	dw Func_32cc ; OBJACTION_44
	dw Func_32db ; OBJACTION_45
	dw .StunLeft ; OBJACTION_STUN_LEFT
	dw .StunRight ; OBJACTION_STUN_RIGHT
	dw .Action48 ; OBJACTION_48
	dw .Action49 ; OBJACTION_49
	dw Func_3380 ; OBJACTION_4A
	dw Func_338f ; OBJACTION_4B
	dw .FullThrowLeftStart ; OBJACTION_FULL_THROW_LEFT_START
	dw .FullThrowRightStart ; OBJACTION_FULL_THROW_RIGHT_START
	dw Func_339e ; OBJACTION_4E
	dw Func_33ad ; OBJACTION_4F
	dw Func_31a0 ; OBJACTION_50
	dw Func_31be ; OBJACTION_51
	dw Func_31dc ; OBJACTION_52
	dw Func_31fa ; OBJACTION_53
	dw Func_3218 ; OBJACTION_54
	dw Func_3236 ; OBJACTION_55
	dw Func_32cc ; OBJACTION_56
	dw Func_32db ; OBJACTION_57
	dw .Vanish ; OBJACTION_58
	dw .Vanish ; OBJACTION_59
	dw .Vanish ; OBJACTION_5A
	dw .Vanish ; OBJACTION_5B
	dw .Vanish ; OBJACTION_5C
	dw .Vanish ; OBJACTION_5D
	dw ObjAction_FullThrowLeft ; OBJACTION_FULL_THROW_LEFT
	dw ObjAction_FullThrowRight ; OBJACTION_FULL_THROW_RIGHT

.Vanish:
	jp ObjAction_Vanish2

.FallFromCeiling:
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	jr nz, .asm_4a204
	ld a, [wc0dd]
	and a
	jp nz, ObjAction_Vanish2
	ld bc, FallingYVel_Light
	jp Func_34b7

.asm_4a204
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld a, OBJACTION_WALK
	ld [wCurObjAction], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld a, 160
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hli], a
	ret

.Func_4a224:
	ld a, [wGroundShakeCounter]
	cp $10
	jr c, .no_shake2
	ldh a, [rDIV]
	rra
	ld a, OBJACTION_08 >> 1
	rla ; either OBJACTION_08 or OBJACTION_09
	ld [wCurObjAction], a
	ret

.no_shake2
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
.Action0f:
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a ; redundant, already done below
	ld a, OBJACTION_3F
	ld [wCurObjAction], a
	ld de, Frameset_68430
	call SetObjectFramesetPtr
	ld a, 35
	ld [hli], a
	ld l, OBJ_FLAGS
	res 2, [hl]
.Action3f:
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	ld l, OBJ_UNK_02
	farcall Func_baee
	ret

.Func_4a26d:
	ld hl, wCurObjUnk1c
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJACTION_38
	jr .asm_4a27f
.Func_4a277:
	ld hl, wCurObjUnk1c
	ld a, 15 | (1 << 7)
	ld [hld], a
	ld a, OBJACTION_39
.asm_4a27f
	ld [hld], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld a, 4
	ld [hli], a ; OBJ_ACTION_DURATION
	inc l
	ld a, $02
	ld [hli], a ; OBJ_UNK_18
	xor a
	ld [hli], a ; OBJ_MOVEMENT_INDEX
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hld], a
	ret

.StunLeftStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STUN_LEFT
	ld [hld], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
.StunLeft:
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, OBJACTION_0F
	ld [wCurObjAction], a
	ret

.StunRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_STUN_RIGHT
	ld [hld], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
.StunRight:
	ld hl, wCurObjUnk18
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, OBJACTION_0F
	ld [wCurObjAction], a
	ret

.Action14:
	ld a, OBJACTION_44
	jr .asm_4a2d2
.Action15:
	ld a, OBJACTION_45
.asm_4a2d2
	ld [wCurObjAction], a
	xor a
	ld [wCurObjMovementIndex], a
	ld a, $02
	ld [wCurObjUnk18], a
	ret

.GrabLeftStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_36
	ld [hld], a
	dec l
	ld a, 65
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $c0
	ld [hld], a ; OBJ_UNK_18
	ld a, $01
	ld [hld], a ; OBJ_UNK_17
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	jp Func_3335

.GrabRightStart:
	ld hl, wCurObjAction
	ld a, OBJACTION_37
	ld [hld], a
	dec l
	ld a, 65
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld a, $e0
	ld [hld], a ; OBJ_UNK_18
	ld a, $01
	ld [hld], a ; OBJ_UNK_17
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	jp Func_3344

.Action19:
	ld a, OBJACTION_49
	ld [wCurObjAction], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_UNK2_F, [hl]
.Action49:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
; change direction
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80
	ld [hl], a
	jr .Action18 ; useless jump

.Action18:
	ld a, OBJACTION_48
	ld [wCurObjAction], a
	ld de, Frameset_683fb
	call SetObjectFramesetPtr
	ld l, OBJ_FLAGS
	set OBJFLAG_UNK2_F, [hl]
.Action48:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	ld hl, wCurObjUnk1a
	ld a, [hl]
	xor $80
	ld [hl], a
	jp .Action19

.Action12:
	ld hl, wCurObjUnk1c
	ld a, 31 | (1 << 7)
	ld [hld], a
	ld a, OBJACTION_42
	ld [hld], a ; OBJ_ACTION
	dec l
	xor a
	ld [hl], a ; OBJ_MOVEMENT_INDEX
	ret

.FullThrowLeftStart:
	ld a, OBJACTION_FULL_THROW_LEFT
	ld [wCurObjAction], a
	ld de, Frameset_68421
	call SetObjectFramesetPtr
	jp ObjAction_FullThrowLeft

.FullThrowRightStart:
	ld a, OBJACTION_FULL_THROW_RIGHT
	ld [wCurObjAction], a
	ld de, Frameset_68418
	call SetObjectFramesetPtr
	jp ObjAction_FullThrowRight

.Action28:
	ld de, Frameset_6842d
	call SetObjectFramesetPtr
	ld a, HIGH(Func_33f8)
	ld c, LOW(Func_33f8)
	ld b, $02
	jr .asm_4a3af

.Action29:
	ld de, Frameset_6842a
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3407)
	ld c, LOW(Func_3407)
	ld b, $02
	jr .asm_4a3af

.Action05:
	ld de, Frameset_6842d
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3317)
	ld c, LOW(Func_3317)
	ld b, $02
	jr .asm_4a3af

.Action04:
	ld de, Frameset_6842a
	call SetObjectFramesetPtr
	ld a, HIGH(Func_3326)
	ld c, LOW(Func_3326)
	ld b, $02
.asm_4a3af
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld [hld], a
	ld [hl], c
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a ; OBJ_MOVEMENT_INDEX
	ld [hl], b ; OBJ_UNK_18
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ret
; 0x4a3c2

HebariiProjectileFunc: ; 4a3c2 (12:63c2)
	ld hl, wCurObjFlags
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_ACTION_DURATION
	dec [hl]
	ret nz
	ld a, 100
	ld [hl], a
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	cp $18
	jr c, .straight_down
	cp $e8
	jr nc, .straight_down
	cp $80
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.MoveWithLateral)
	ld [hld], a
	ld a, LOW(.MoveWithLateral)
	ld [hld], a
	ld l, OBJ_UNK_1A
	jr nc, .set_right
; set left
	res 7, [hl]
	ret
.set_right
	set 7, [hl]
	ret
.straight_down
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.MoveWithoutLateral)
	ld [hld], a
	ld a, LOW(.MoveWithoutLateral)
	ld [hld], a
	ret

.MoveWithLateral:
	ld a, [wCurObjUnk1a]
	rlca
	jr c, .move_right
; move left
	call MoveObjectLeft_Slow
	jr .MoveWithoutLateral
.move_right
	call MoveObjectRight_Slow

.MoveWithoutLateral:
	call MoveObjectDown_Slow

	ld hl, wCurObjActionDuration
	dec [hl]
	jr z, .set_destroy
	ld a, [wCurObjAction]
	and a
	jr nz, .set_destroy
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	call Func_352b
	and a
	ret z
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
.set_destroy
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Destroy)
	ld [hld], a
	ld a, LOW(.Destroy)
	ld [hld], a
	ld de, Frameset_6840d
	call SetObjectFramesetPtr
	ld a, $18
	ld [hli], a
	ret

.Destroy:
	ld a, 1 | (1 << 7)
	ld [wCurObjUnk1c], a
	ld hl, wCurObjActionDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x4a45d
