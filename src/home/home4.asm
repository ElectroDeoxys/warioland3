; given the obj struct in hl
; update its sprite with its current position
UpdateObjSprite:: ; 3000 (0:3000)
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
; 0x305c

MoveObjectLeftByVar2:: ; 305c (0:305c)
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x3069

MoveObjectRightByVar2:: ; 3069 (0:3069)
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjXPos
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
; 0x3076

MoveObjectUpByVar2:: ; 3076 (0:3076)
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x3083

MoveObjectDownByVar2:: ; 3083 (0:3083)
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjYPos
	ld a, [hl]
	add b
	ld [hli], a
	ret nc
	inc [hl]
	ret
; 0x3090

MoveObjectLeft_Fast:: ; 3090 (0:3090)
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 2
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x309a

MoveObjectRight_Fast:: ; 309a (0:309a)
	ld hl, wCurObjXPos
	ld a, [hl]
	add 2
	ld [hli], a
	ret nc
	inc [hl]
	ret
; 0x30a4

MoveObjectDown_Fast:: ; 30a4 (0:30a4)
	ld hl, wCurObjYPos
	ld a, [hl]
	add 2
	ld [hli], a
	ret nc
	inc [hl]
	ret
; 0x30ae

MoveObjectUp_Fast:: ; 30ae (0:30ae)
	ld hl, wCurObjYPos
	ld a, [hl]
	sub 2
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30b8

; moves current object right
; by 0.5 pixel per frame
MoveObjectRight_Slow:: ; 30b8 (0:30b8)
	ld a, [wGlobalCounter]
	rra
	ret c
;	fallthrough

; moves current object right
; at 1 pixel per frame
MoveObjectRight:: ; 30bd (0:30bd)
	ld hl, wCurObjXPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret
; 0x30c5

; moves current object left
; by 0.5 pixel per frame
MoveObjectLeft_Slow:: ; 30c5 (0:30c5)
	ld a, [wGlobalCounter]
	rra
	ret nc
;	fallthrough

; moves current object left
; at 1 pixel per frame
MoveObjectLeft:: ; 30ca (0:30ca)
	ld hl, wCurObjXPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30d4

; moves current object down
; at 0.5 pixel per frame
MoveObjectDown_Slow:: ; 30d4 (0:30d4)
	ld a, [wGlobalCounter]
	rra
	ret c
;	fallthrough

; moves current object down
; at 1 pixel per frame
MoveObjectDown:: ; 30d9 (0:30d9)
	ld hl, wCurObjYPos
	inc [hl]
	ret nz
	inc l
	inc [hl]
	ret
; 0x30e1

MoveObjectUp_Slow:: ; 30e1 (0:30e1)
	ld a, [wGlobalCounter]
	rra
	ret nc
;	fallthrough

; moves current object up
; at 1 pixel per frame
MoveObjectUp:: ; 30e6 (0:30e6)
	ld hl, wCurObjYPos
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x30f0

; input:
; - de = frameset pointer
SetObjectFramesetPtr:: ; 30f0 (0:30f0)
	ld hl, wCurObjFramesetPtr
	ld a, e
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ret
; 0x30fb

Func_30fb:: ; 30fb (0:30fb)
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	dec a
	ret z
	dec [hl]
	ret
; 0x3104

UpdateObjectFrame:: ; 3104 (0:3104)
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
; 0x312f

UpdateObjectAnimation:: ; 312f (0:312f)
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

HomeJumpRet:: ; 316b (0:316b)
	pop af
	bankswitch
	ret
; 0x3173

Func_3173:: ; 3173 (0:3173)
	homejp Func_62e57
; 0x3182

VanishObject2:: ; 3182 (0:3182)
	homejp _VanishObject2
; 0x3191

Func_3191:: ; 3191 (0:3191)
	homejp Func_62e8f
; 0x31a0

Func_31a0:: ; 31a0 (0:31a0)
	homejp Func_62ea5
; 0x31af

Func_31af:: ; 31af (0:31af)
	homejp Func_62f76
; 0x31be

Func_31be:: ; 31be (0:31be)
	homejp Func_62f8c
; 0x31cd

Func_31cd:: ; 31cd (0:31cd)
	homejp Func_62eaa
; 0x31dc

Func_31dc:: ; 31dc (0:31dc)
	homejp Func_62ec0
; 0x31eb

Func_31eb:: ; 31eb (0:31eb)
	homejp Func_62f91
; 0x31fa

Func_31fa:: ; 31fa (0:31fa)
	homejp Func_62fa7
; 0x3209

Func_3209:: ; 3209 (0:3209)
	homejp Func_62e74
; 0x3218

Func_3218:: ; 3218 (0:3218)
	homejp Func_62e8a
; 0x3227

Func_3227:: ; 3227 (0:3227)
	homejp Func_62f5b
; 0x3236

Func_3236:: ; 3236 (0:3236)
	homejp Func_62f71
; 0x3245

Func_3245:: ; 3245 (0:3245)
	homejp Func_62c9f
; 0x3254

Func_3254:: ; 3254 (0:3254)
	homejp Func_62d7d
; 0x3263

Func_3263:: ; 3263 (0:3263)
	homejp Func_6303f
; 0x3272

Func_3272:: ; 3272 (0:3272)
	homejp Func_63050
; 0x3281

Func_3281:: ; 3281 (0:3281)
	homejp Func_6305f
; 0x3290

ObjState_Fall:: ; 3290 (0:3290)
	homejp _ObjState_Fall
; 0x329f

ObjState_StandingFall:: ; 329f (0:329f)
	homejp _ObjState_StandingFall
; 0x32ae

Func_32ae:: ; 32ae (0:32ae)
	homejp Func_62ae5
; 0x32bd

Func_32bd:: ; 32bd (0:32bd)
	homejp Func_62bce
; 0x32cc

Func_32cc:: ; 32cc (0:32cc)
	homejp Func_62ca8
; 0x32db

Func_32db:: ; 32db (0:32db)
	homejp Func_62d86
; 0x32ea

Func_32ea:: ; 32ea (0:32ea)
	homejp Func_628ea
; 0x32f9

Func_32f9:: ; 32f9 (0:32f9)
	homejp Func_629a6
; 0x3308

Func_3308:: ; 3308 (0:3308)
	homejp Func_62908
; 0x3317

Func_3317:: ; 3317 (0:3317)
	homejp Func_62898
; 0x3326

Func_3326:: ; 3326 (0:3326)
	homejp Func_62840
; 0x3335

Func_3335:: ; 3335 (0:3335)
	homejp Func_61f54
; 0x3344

Func_3344:: ; 3344 (0:3344)
	homejp Func_620a6
; 0x3353

Func_3353:: ; 3353 (0:3353)
	homejp Func_621fb
; 0x3362

Func_3362:: ; 3362 (0:3362)
	homejp Func_622bd
; 0x3371

Func_3371:: ; 3371 (0:3371)
	homejp Func_62926
; 0x3380

Func_3380:: ; 3380 (0:3380)
	homejp Func_62382
; 0x338f

Func_338f:: ; 338f (0:338f)
	homejp Func_6247b
; 0x339e

Func_339e:: ; 339e (0:339e)
	homejp Func_62574
; 0x33ad

Func_33ad:: ; 33ad (0:33ad)
	homejp Func_62605
; 0x33bc

ObjState_FullThrowLeft:: ; 33bc (0:33bc)
	homejp Func_626da
; 0x33cb

ObjState_FullThrowRight:: ; 33cb (0:33cb)
	homejp Func_62768
; 0x33da

ObjState_BumpLeft:: ; 33da (0:33da)
	homejp _ObjState_BumpLeft
; 0x33e9

ObjState_BumpRight:: ; 33e9 (0:33e9)
	homejp _ObjState_BumpRight
; 0x33f8

Func_33f8:: ; 33f8 (0:33f8)
	homejp Func_62892
; 0x3407

Func_3407:: ; 3407 (0:3407)
	homejp Func_6283a
; 0x3416

; bc = object creation data
CreateObjectAtRelativePos:: ; 3416 (0:3416)
	homecall _CreateObjectAtRelativePos
	ret
; 0x342d

; bc = object creation data
CreateObjectFromCurObjPos:: ; 342d (0:342d)
	homecall _CreateObjectFromCurObjPos
	ret
; 0x3444

Func_3444:: ; 3444 (0:3444)
	homecall Func_632ac
	ret
; 0x345b

; returns in e how many objects there are
; that are currently active and transient
CountActiveTransientObjects:: ; 345b (0:345b)
	homecall _CountActiveTransientObjects
	ret
; 0x3472

; de = start of data
ApplyObjSetMovement:: ; 3472 (0:3472)
	homecall _ApplyObjSetMovement
	ret
; 0x3489

ApplyObjYMovement_Loop:: ; 3489 (0:3489)
	homecall _ApplyObjYMovement_Loop
	ret
; 0x34a0

Func_34a0:: ; 34a0 (0:34a0)
	homecall Func_6328a
	ret
; 0x34b7

ApplyObjYMovement:: ; 34b7 (0:34b7)
	homecall _ApplyObjYMovement
	ret
; 0x34ce

ApplyObjXMovement:: ; 34ce (0:34ce)
	homecall _ApplyObjXMovement
	ret
; 0x34e5

VanishObject:: ; 34e5 (0:34e5)
	homecall _VanishObject
	ret
; 0x34fc

Func_34fc:: ; 34fc (0:34fc)
	homecall Func_63209
	ret
; 0x3513

Func_3513:: ; 3513 (0:3513)
	homecall Func_19bc3
	ld a, b
	ret
; 0x352b

Func_352b:: ; 352b (0:352b)
	homecall Func_19b7b
	ld a, b
	ret
; 0x3543

Func_3543:: ; 3543 (0:3543)
	homecall Func_19b51
	ld a, b
	ret
; 0x355b

Func_355b:: ; 355b (0:355b)
	homecall Func_19b61
	ld a, b
	ret
; 0x3573

Func_3573:: ; 3573 (0:3573)
	homecall Func_19b69
	ld a, b
	ret
; 0x358b

Func_358b:: ; 358b (0:358b)
	homecall Func_19b9b
	ld a, b
	ret
; 0x35a3

Func_35a3:: ; 35a3 (0:35a3)
	homecall Func_19b8b
	ld a, b
	ret
; 0x35bb

; c = OB pal index
; b = num of pals
; hl = pals
Func_35bb:: ; 35bb (0:35bb)
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
Func_35e5:: ; 35e5 (0:35e5)
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
; 0x360f

Func_360f:: ; 360f (0:360f)
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

Func_3632:: ; 3632 (0:3632)
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
; 0x3655

; if Wario is underneath a one-way platform,
; then don't process any actions for it
SetOneWayPlatformAction:: ; 3655 (0:3655)
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
; 0x3673
