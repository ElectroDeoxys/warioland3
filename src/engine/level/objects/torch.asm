FlameBlockTorchUpdate: ; 40b14 (10:4b14)
	ld hl, wCurObjState
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hld], a
	set OBJSUBFLAG_UNK_4_F, [hl] ; OBJ_SUBSTATE
	play_sfx SFX_073
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_40b52)
	ld [hld], a
	ld a, LOW(.Func_40b52)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FIRE
	ld [hld], a
	ld de, Frameset_68360
	call SetObjectFramesetPtr
	xor a
	ld [hli], a ; OBJ_STATE_DURATION
	ld a, $02
	ld [hl], a ; OBJ_VAR_1

	ld hl, wNumLitTorches
	inc [hl]
	ld a, [hl]
	cp NUM_FLAME_BLOCK_TORCHES
	ret nz
	play_sfx SFX_0FA
	ret

.Func_40b52:
	ld a, [wNumLitTorches]
	cp NUM_FLAME_BLOCK_TORCHES
	ret z
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_40b6f
	xor a
	ld [hl], a
	ld l, OBJ_STATE_DURATION
	ld [hli], a ; aka $100
	ld a, $02
	ld [hl], a ; OBJ_VAR_1
	play_sfx SFX_073
.asm_40b6f
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	inc l
	dec [hl] ; OBJ_VAR_1
	ret nz
	ld l, OBJ_UNK_02
	farcall Func_baee
	ld hl, wNumLitTorches
	dec [hl]
	ret
; 0x40b8c

FlameBlockTorchFunc: ; 40b8c (10:4b8c)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(FlameBlockTorchUpdate)
	ld [hld], a
	ld a, LOW(FlameBlockTorchUpdate)
	ld [hld], a
	ld de, Frameset_68369
	call SetObjectFramesetPtr
	jr TorchFunc.got_frameset

TorchNoEmbersFunc: ; 40b9d (10:4b9d)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	jr TorchFunc.got_update_func

.Update:
	ret

TorchFunc: ; 40ba9 (10:4ba9)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
.got_update_func
	ld de, Frameset_68360
	call SetObjectFramesetPtr
.got_frameset
	xor a
	ld [hl], a ; OBJ_STATE_DURATION
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNK_5_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, 6
	ld [hld], a
	ld a, -7
	ld [hld], a ; OBJ_COLLBOX_LEFT
	ld a, -3
	ld [hl], a ; OBJ_COLLBOX_BOTTOM
	ret

.Update:
	ld a, [wCurObjStateDuration]
	and a
	jr z, .zero
	cp 1
	jr z, .one
	cp 2
	jr z, .two

; three
	xor a
	ld bc, ObjParams_TorchEmberRight2
	jr .create_ember

.zero
	ld a, [wGlobalCounter]
	and %01111111
	ret nz
	ld a, 1
	ld bc, ObjParams_TorchEmberLeft1
	jr .create_ember
.one
	ld a, 2
	ld bc, ObjParams_TorchEmberRight1
	jr .create_ember

.two
	ld a, [wGlobalCounter]
	and %01111111
	ret nz
	ld a, 3
	ld bc, ObjParams_TorchEmberLeft2

.create_ember
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	play_sfx nz, SFX_073
	jp CreateObjectFromCurObjPos
; 0x40c19

; unreferenced?
Func_40c19: ; 40c19 (10:4c19)
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_40c2c
	call MoveObjectLeft_Slow
	jr .asm_40c2f
.asm_40c2c
	call MoveObjectRight
.asm_40c2f
	ld bc, Data_60320
	call Func_34b7
	jr TorchEmberCommonFunc

; unreferenced?
	ld de, $4ec9
	call Func_3472
	jr TorchEmberCommonFunc

TorchEmberLeft1Func: ; 40c3f (10:4c3f)
	call MoveObjectLeft
	jr TorchEmberCommonFunc

TorchEmberRight1Func: ; 40c44 (10:4c44)
	call MoveObjectRight
	jr TorchEmberCommonFunc

TorchEmberLeft2Func: ; 40c49 (10:4c49)
	call MoveObjectLeft_Slow
	jr TorchEmberCommonFunc

TorchEmberRight2Func: ; 40c4e (10:4c4e)
	call MoveObjectRight_Slow
;	fallthrough

TorchEmberCommonFunc: ; 40c51 (10:4c51)
	ld bc, Data_60320
	call Func_34b7
	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [wCurObjState]
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
	ld de, Frameset_68359
	call SetObjectFramesetPtr
	ld a, 24
	ld [hli], a ; OBJ_STATE_DURATION
	ret

.Destroy:
	ld a, 1 | (1 << 7)
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ret
; 0x40ca1
