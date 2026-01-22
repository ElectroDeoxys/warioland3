CartFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Waiting)
	ld [hld], a
	ld a, LOW(.Waiting)
	ld [hld], a
	ld de, Frameset_69199
	call SetObjectFramesetPtr
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0e
	ld [hld], a
	ld a, $f1
	ld [hld], a
	ld a, $f4
	ld [hl], a
	ret

.Waiting:
	call SetOneWayPlatformAction
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Moving)
	ld [hld], a
	ld a, LOW(.Moving)
	ld [hld], a
	ld de, Frameset_6919e
	call SetObjectFramesetPtr
	ret

.Moving:
	call SetOneWayPlatformAction
	ld a, [wGlobalCounter]
	ld b, a
	and $3f
	play_sfx z, SFX_06D
	srl b
	ret c
	ld a, [wCurObjId]
	cp CART_RIGHT
	jr z, .cart_right
; cart left
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $0f
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_48613
	call MoveObjectLeft
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	farcall Func_19713
	ld a, b
	and a
	ret nz
	ld b, $01
	jp MoveWarioLeft

.cart_right
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $0e
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_48613
	call MoveObjectRight
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	farcall Func_19706
	ld a, b
	and a
	ret nz
	ld b, $01
	jp MoveWarioRight
.asm_48613
	ld de, Frameset_69199
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(CartStoppedFunc)
	ld [hld], a
	ld a, LOW(CartStoppedFunc)
	ld [hld], a
	ret

CartStoppedFunc:
	jp SetOneWayPlatformAction

CartVariableFunc:
	push_wram $02
	ld a, TRUCK_WHEEL
	call IsTreasureCollected
	jr nz, .asm_4863b
	ld de, Frameset_691a7
	ld bc, CartStoppedFunc
	jr .asm_48641
.asm_4863b
	ld de, Frameset_691bf
	ld bc, .Waiting
.asm_48641
	pop_wram
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, b
	ld [hld], a
	ld [hl], c
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0e
	ld [hld], a
	ld a, $f1
	ld [hld], a
	ld a, $f4
	ld [hl], a
	jp SetObjectFramesetPtr

.Waiting:
	call SetOneWayPlatformAction
	ld hl, wCurObjFlags
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Moving)
	ld [hld], a
	ld a, LOW(.Moving)
	ld [hld], a
	ld a, [wCurObjId]
	cp CART_VARIABLE_RIGHT
	jr z, .asm_48682
	ld de, Frameset_691b3
	jp SetObjectFramesetPtr
.asm_48682
	ld de, Frameset_691aa
	jp SetObjectFramesetPtr

.Moving:
	call SetOneWayPlatformAction
	ld a, [wGlobalCounter]
	ld b, a
	and $3f
	play_sfx z, SFX_06D
	srl b
	ret c
	ld a, [wCurObjId]
	cp CART_VARIABLE_RIGHT
	jr z, .asm_486e3
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	sub $0f
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_48721
	call MoveObjectLeft
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	farcall Func_19713
	ld a, b
	and a
	ret nz
	ld b, $01
	jp MoveWarioLeft
.asm_486e3
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [hli]
	add $0e
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_48721
	call MoveObjectRight
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	ret z
	res OBJFLAG_STEPPED_F, [hl]
	farcall Func_19706
	ld a, b
	and a
	ret nz
	ld b, $01
	jp MoveWarioRight
.asm_48721
	ld de, Frameset_691bf
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(CartStoppedFunc)
	ld [hld], a
	ld a, LOW(CartStoppedFunc)
	ld [hld], a
	ret
