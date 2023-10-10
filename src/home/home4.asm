; given the obj struct in hl
; update its sprite with its current position
UpdateObjSprite::
	ld a, [wROMBank]
	push af
	ld a, [hl] ; unk7
	swap a
	and %111
	or BANK("Objects OAM 1")
	bankswitch
	ld l, e
	ld a, [hli] ; screen y pos
	ld [wCurSpriteYCoord], a
	ld a, [hli] ; screen x pos
	ld [wCurSpriteXCoord], a
	ld a, [hli] ; frame
	ld [wCurSpriteFrame], a
	ld a, [hli] ; OAM ptr
	ld h, [hl]
	ld l, a
	ld a, [wCurSpriteFrame]
	ld d, $00
	add a ; *2
	ld e, a
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	ld hl, wCurSpriteXCoord
	ld a, [hld]
	ld c, a
	ld a, [hld] ; wCurSpriteYCoord
	ld b, a
	ld l, [hl] ; wVirtualOAMByteSize
	ld h, HIGH(wVirtualOAM)
.loop_sprites
	ld a, l
	cp LOW(wVirtualOAMEnd)
	jr nc, .done
	ld a, [de]
	cp $80
	jr z, .done
	ld a, [de]
	add b
	ld [hli], a ; SPRITEOAMSTRUCT_YCOORD
	inc de
	ld a, [de]
	add c
	ld [hli], a ; SPRITEOAMSTRUCT_XCOORD
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEOAMSTRUCT_TILE_ID
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEOAMSTRUCT_ATTRIBUTES
	ld a, l
	ld [wVirtualOAMByteSize], a
	inc de
	jr .loop_sprites
.done
	pop af
	bankswitch
	ret

MoveObjectLeftByVar2::
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

MoveObjectRightByVar2::
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret

MoveObjectUpByVar2::
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

MoveObjectDownByVar2::
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret

MoveObjectLeft_Fast::
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 2
	ld [hli], a
	ret nc
	dec [hl]
	ret

MoveObjectRight_Fast::
	ld hl, wCurObjXPos
	ld a, [hl]
	add 2
	ld [hli], a
	ret nc
	inc [hl]
	ret

MoveObjectDown_Fast::
	ld hl, wCurObjYPos
	ld a, [hl]
	add 2
	ld [hli], a
	ret nc
	inc [hl]
	ret

MoveObjectUp_Fast::
	ld hl, wCurObjYPos
	ld a, [hl]
	sub 2
	ld [hli], a
	ret nc
	dec [hl]
	ret

; moves current object right
; by 0.5 pixel per frame
MoveObjectRight_Slow::
	ld a, [wGlobalCounter]
	rra
	ret c
;	fallthrough

; moves current object right
; at 1 pixel per frame
MoveObjectRight::
	ld hl, wCurObjXPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret

; moves current object left
; by 0.5 pixel per frame
MoveObjectLeft_Slow::
	ld a, [wGlobalCounter]
	rra
	ret nc
;	fallthrough

; moves current object left
; at 1 pixel per frame
MoveObjectLeft::
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

; moves current object down
; at 0.5 pixel per frame
MoveObjectDown_Slow::
	ld a, [wGlobalCounter]
	rra
	ret c
;	fallthrough

; moves current object down
; at 1 pixel per frame
MoveObjectDown::
	ld hl, wCurObjYPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret

MoveObjectUp_Slow::
	ld a, [wGlobalCounter]
	rra
	ret nc
;	fallthrough

; moves current object up
; at 1 pixel per frame
MoveObjectUp::
	ld hl, wCurObjYPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

; input:
; - de = frameset pointer
SetObjectFramesetPtr::
	ld hl, wCurObjFramesetPtr
	ld a, e
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ret

Func_30fb::
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	dec a
	ret z
	dec [hl]
	ret

UpdateObjectFrame::
	ld hl, wCurObjFrameDuration
	ld a, [hld]
	sub 1
	ret nc
	ld a, [wROMBank]
	push af
	ld a, BANK("Object Framesets")
	bankswitch
	dec l
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr nz, .asm_312a
	ld a, [de] ; first frame
.asm_312a
	ld [wCurObjFrame], a
	jr HomeJumpRet

UpdateObjectAnimation::
	ld hl, wCurObjFrameDuration
	ld a, [hl]
	sub 1
	ld [hld], a
	ret nc
	ld a, [wROMBank]
	push af
	ld a, BANK("Object Framesets")
	bankswitch
	dec l
	ld a, [hli] ; OBJ_FRAMESET_PTR
	ld e, a
	ld a, [hli]
	ld d, a
	inc l
	ld a, [hl] ; OBJ_FRAMESET_OFFSET
	add e
	ld c, a
	ld a, d
	adc $00
	ld b, a
	ld a, [bc]
	cp $ff
	jr z, .reset
	ld [wCurObjFrame], a
	ld a, [hl]
	add $2
	ld [hld], a
	inc bc
	ld a, [bc]
	ld [hl], a ; OBJ_FRAME_DURATION
	jr HomeJumpRet
.reset
	ld a, $2
	ld [hld], a ; OBJ_FRAMESET_OFFSET
	ld a, [de] ; first frame
	ld [wCurObjFrame], a
	inc de
	ld a, [de] ; first duration
	ld [hl], a ; OBJ_FRAME_DURATION
;	fallthrough

HomeJumpRet::
	pop af
	bankswitch
	ret

Func_3173::
	homejp Func_62e57

VanishObject2::
	homejp _VanishObject2

Func_3191::
	homejp Func_62e8f

Func_31a0::
	homejp Func_62ea5

Func_31af::
	homejp Func_62f76

Func_31be::
	homejp Func_62f8c

Func_31cd::
	homejp Func_62eaa

Func_31dc::
	homejp Func_62ec0

Func_31eb::
	homejp Func_62f91

Func_31fa::
	homejp Func_62fa7

Func_3209::
	homejp Func_62e74

Func_3218::
	homejp Func_62e8a

Func_3227::
	homejp Func_62f5b

Func_3236::
	homejp Func_62f71

Func_3245::
	homejp Func_62c9f

Func_3254::
	homejp Func_62d7d

Func_3263::
	homejp Func_6303f

Func_3272::
	homejp Func_63050

Func_3281::
	homejp Func_6305f

ObjState_Fall::
	homejp _ObjState_Fall

ObjState_StandingFall::
	homejp _ObjState_StandingFall

Func_32ae::
	homejp Func_62ae5

Func_32bd::
	homejp Func_62bce

Func_32cc::
	homejp Func_62ca8

Func_32db::
	homejp Func_62d86

Func_32ea::
	homejp Func_628ea

Func_32f9::
	homejp Func_629a6

Func_3308::
	homejp Func_62908

Func_3317::
	homejp Func_62898

Func_3326::
	homejp Func_62840

Func_3335::
	homejp Func_61f54

Func_3344::
	homejp Func_620a6

Func_3353::
	homejp Func_621fb

Func_3362::
	homejp Func_622bd

Func_3371::
	homejp Func_62926

Func_3380::
	homejp Func_62382

Func_338f::
	homejp Func_6247b

Func_339e::
	homejp Func_62574

Func_33ad::
	homejp Func_62605

ObjState_FullThrowLeft::
	homejp Func_626da

ObjState_FullThrowRight::
	homejp Func_62768

ObjState_BumpLeft::
	homejp _ObjState_BumpLeft

ObjState_BumpRight::
	homejp _ObjState_BumpRight

Func_33f8::
	homejp Func_62892

Func_3407::
	homejp Func_6283a

; bc = object creation data
CreateObjectAtRelativePos::
	homecall _CreateObjectAtRelativePos
	ret

; bc = object creation data
CreateObjectFromCurObjPos::
	homecall _CreateObjectFromCurObjPos
	ret

Func_3444::
	homecall Func_632ac
	ret

; returns in e how many objects there are
; that are currently active and transient
CountActiveTransientObjects::
	homecall _CountActiveTransientObjects
	ret

; de = start of data
ApplyObjSetMovement::
	homecall _ApplyObjSetMovement
	ret

ApplyObjYMovement_Loop::
	homecall _ApplyObjYMovement_Loop
	ret

Func_34a0::
	homecall Func_6328a
	ret

ApplyObjYMovement::
	homecall _ApplyObjYMovement
	ret

ApplyObjXMovement::
	homecall _ApplyObjXMovement
	ret

VanishObject::
	homecall _VanishObject
	ret

Func_34fc::
	homecall Func_63209
	ret

Func_3513::
	homecall Func_19bc3
	ld a, b
	ret

Func_352b::
	homecall Func_19b7b
	ld a, b
	ret

Func_3543::
	homecall Func_19b51
	ld a, b
	ret

Func_355b::
	homecall Func_19b61
	ld a, b
	ret

Func_3573::
	homecall Func_19b69
	ld a, b
	ret

Func_358b::
	homecall Func_19b9b
	ld a, b
	ret

Func_35a3::
	homecall Func_19b8b
	ld a, b
	ret

; c = OB pal index
; b = num of pals
; hl = pals
Func_35bb::
	ld a, c
	add a
	add a
	add a ; *8
	or OCPSF_AUTOINC
	ldh [rOCPS], a
	ld c, LOW(rOCPD)
.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on
	ret

; c = BG pal index
; b = num of pals
; hl = pals
Func_35e5::
	ld a, c
	add a
	add a
	add a ; *8
	or BCPSF_AUTOINC
	ldh [rBCPS], a
	ld c, LOW(rBCPD)
.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	ld a, [hli]
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on
	ret

Func_360f::
	ld a, c
	add a
	add a
	add a ; *8
	or OCPSF_AUTOINC
	ldh [rOCPS], a
	ld c, LOW(rOCPD)
.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off
	xor a ; black
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on
	ret

Func_3632::
	ld a, c
	add a
	add a
	add a ; *8
	or BCPSF_AUTOINC
	ldh [rBCPS], a
	ld c, LOW(rBCPD)
.wait_lcd_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, .wait_lcd_on
.wait_lcd_off
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait_lcd_off
	xor a ; black
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	ld [$ff00+c], a
	dec b
	jr nz, .wait_lcd_on
	ret

; if Wario is underneath a one-way platform,
; then don't process any actions for it
SetOneWayPlatformAction::
	ld a, [wCurObjFlags]
	and OBJFLAG_STEPPED
	ret nz
	ld a, [wCurObjCollBoxTop]
	ld b, a
	ld a, [wCurObjScreenYPos]
	add $2a + 3
	add b
	ld b, a ; wCurObjCollBoxTop + wCurObjScreenYPos + $2a + 3
	ld a, [wWarioScreenYPos]
	add $2a
	cp b
	ret c ; return if Wario is over collision box
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
