WormwouldFunc: ; 54020 (15:4020)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_54044)
	ld [hld], a
	ld a, LOW(.Func_54044)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $4 | OBJSUBFLAG_UNK_4 | OBJSUBFLAG_HDIR
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $1e
	ld [hld], a
	ld de, Frameset_696ce
	jp SetObjectFramesetPtr

.Func_54044:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wYPosLo]
	ld c, a
	ld hl, wCurObjYPos
	ld a, [hli]
	cp c
	ret nz
	ld c, [hl]
	ld a, [wYPosHi]
	ret nz
	ld a, $20
	ld [wCurObjVar2], a
	call MoveObjectDownByVar2
	ld a, $02
	ld [wcac3], a
	call UpdateLevelMusic
	ld a, TRUE
	ld [wIsBossBattle], a
.asm_5406d:
	ld hl, wCurObjSubState
	ld a, [hl]
	rlca
	jr nc, .asm_540a2
	ld a, [wCurObjFlags]
	rra
	rra
	jr nc, .asm_5408d
	ld a, [wCurObjScreenXPos]
	add $2a
	ld b, a
	ld a, [wWarioScreenXPos]
	add $2a
	sub b
	jr c, .asm_54092
	cp $38
	jr c, .asm_54092
.asm_5408d
	ld de, Frameset_696ce
	jr .asm_540ce
.asm_54092
	res 7, [hl]
	ld de, Frameset_6970a
	ld l, OBJ_X_POS
	ld a, [hl]
	add $70
	ld [hli], a
	jr nc, .asm_540ce
	inc [hl]
	jr .asm_540ce
.asm_540a2
	ld a, [wCurObjFlags]
	rra
	rra
	jr nc, .asm_540bb
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	sub b
	jr c, .asm_540c0
	cp $38
	jr c, .asm_540c0
.asm_540bb
	ld de, Frameset_6970a
	jr .asm_540ce
.asm_540c0
	set 7, [hl]
	ld de, Frameset_696ce
	ld l, OBJ_X_POS
	ld a, [hl]
	sub $70
	ld [hli], a
	jr nc, .asm_540ce
	dec [hl]
.asm_540ce
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_541b5)
	ld [hld], a
	ld a, LOW(.Func_541b5)
	ld [hld], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_STATE_DURATION
	xor a
	ld [hli], a
	ld a, [wCurObjYPos + 0]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, $41
	ld [hl], a
	ld a, $2d
	ld [wCurObjState], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_34
	ld [hli], a
	play_sfx SFX_11A
	ret

.Func_54103:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.asm_54109
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld a, [hl]
	ld l, OBJ_SUBSTATE
	cp $0a
	jr z, .asm_54119
	and a
	ret nz
	ld l, OBJ_STATE
	jr .asm_5414b
.asm_54119
	play_sfx SFX_TEMPLE_ROCK
	ld a, [hld]
	rlca
	jr c, .asm_5412b
	ld bc, ObjParams_LowRollingRockLeft
	jp CreateObjectAtRelativePos
.asm_5412b
	ld bc, ObjParams_LowRollingRockRight
	jp CreateObjectAtRelativePos
.asm_54131
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5413c
	ld de, Frameset_696bc
	jr .asm_5413f
.asm_5413c
	ld de, Frameset_696c5
.asm_5413f
	call SetObjectFramesetPtr
	ld a, $22
	ld [hli], a
	ld a, $5b
	ld [wCurObjState], a
	ret
.asm_5414b
	ld a, $01
	ld [wCurObjStateDuration], a
.asm_54150
	ld a, $5c
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_5415d
	ld de, Frameset_69734
	jp SetObjectFramesetPtr
.asm_5415d
	ld de, Frameset_69701
	jp SetObjectFramesetPtr

.asm_54163
	ld a, $34
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_5416f
	ld de, Frameset_6971c
	jr .asm_54172
.asm_5416f
	ld de, Frameset_696e0
.asm_54172
	call SetObjectFramesetPtr
	ld a, $1a
	ld [hli], a
	ret

.asm_54179
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	cp $10
	jr nz, .asm_54188
	play_sfx SFX_0A6
.asm_54188
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	jr .asm_54150

.asm_5418e
	ld l, OBJ_VAR_3
	ld a, [wCurObjSubState]
	and $0f
	cp $03
	jr nc, .asm_5419e
	ld a, [hl]
	cp $1e
	jr z, .asm_54131
.asm_5419e
	dec [hl]
	jp nz, MoveObjectUp
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	and $0f
	cp $04
	jr c, .asm_54209
.asm_541ab
	xor a
	ld [wCurObjState], a
	ld a, $2b
	ld [wCurObjStateDuration], a
	ret

.Func_541b5:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_541e9
	cp $34
	jr z, .asm_54179
	cp $5a
	jr z, .asm_54221
	cp $2d
	jr z, .asm_5418e
	cp $5b
	jp z, .asm_54109
	cp $5c
	jp z, .asm_542cb
	and $fe
	cp $04
	jr z, .asm_54163
	cp $08
	jp z, .asm_5414b
	cp $0a
	jr z, .asm_54257
	cp $3a
	jp z, .asm_54286
	xor a
	ld [hl], a
	ret
.asm_541e9
	ld a, [wCurObjScreenYPos]
	add $20
	cp $20
	jr nc, .asm_54203
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54103)
	ld [hld], a
	ld a, LOW(.Func_54103)
	ld [hld], a
	ld a, $00
	ld [wcac3], a
	call UpdateLevelMusic
	ret
.asm_54203
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
.asm_54209
	ld a, [hld]
	rlca
	jr c, .asm_54212
	ld de, Frameset_69713
	jr .asm_54215
.asm_54212
	ld de, Frameset_696d7
.asm_54215
	call SetObjectFramesetPtr
	ld a, $45
	ld [hli], a
	ld a, $5a
	ld [wCurObjState], a
	ret
.asm_54221
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ld a, [hl]
	ld l, OBJ_SUBSTATE
	cp $15
	jr z, .asm_5423f
	and a
	ret nz
	ld a, [hld]
	rlca
	jr c, .asm_54236
	ld de, Frameset_6970a
	jr .asm_54239
.asm_54236
	ld de, Frameset_696ce
.asm_54239
	call SetObjectFramesetPtr
	jp .asm_541ab
.asm_5423f
	play_sfx SFX_TEMPLE_ROCK
	ld a, [hld]
	rlca
	jr c, .asm_54251
	ld bc, ObjParams_HighRollingRockLeft
	jp CreateObjectAtRelativePos
.asm_54251
	ld bc, ObjParams_HighRollingRockRight
	jp CreateObjectAtRelativePos
.asm_54257
	ld a, $3a
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_54263
	ld de, Frameset_69721
	jr .asm_54266
.asm_54263
	ld de, Frameset_696e5
.asm_54266
	call SetObjectFramesetPtr
	ld a, $32
	ld [hli], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, $f0
	ld [hl], a
	call Func_30fb
	dec l
	xor a
	ld [hl], a
	play_sfx SFX_VANISH
	ret

.asm_54286
	ld bc, $4dd0
	call ApplyObjYMovement
	ld hl, wCurObjStateDuration
	ld a, [hl]
	cp $1e
	jr nz, .asm_5429c
	play_sfx SFX_0A7
.asm_5429c
	dec [hl]
	ret nz
	ld l, OBJ_STATE
	ld a, $5c
	ld [hld], a
	ld a, [hl]
	and $0f
	dec a
	jr nz, .asm_542b6
	stop_music2
	ret
.asm_542b6
	ld a, $e6
	ld [wCurObjCollBoxTop], a
	ld a, [hld]
	rlca
	jr c, .asm_542c5
	ld de, Frameset_69726
	jp SetObjectFramesetPtr
.asm_542c5
	ld de, Frameset_696ea
	jp SetObjectFramesetPtr

.asm_542cb
	ld l, OBJ_VAR_1
	ld a, [wCurObjSubState]
	and $0f
	cp $04
	jr c, .asm_542e0
	dec l
	ld a, [hli]
	and a
	jr nz, .asm_542e0
	ld a, [wGlobalCounter]
	rra
	ret nc
.asm_542e0
	ld a, [wCurObjYPos + 0]
	ld c, a
	ld a, [hli]
	cp c
	jp nz, MoveObjectDown
	ld a, [wCurObjYPos + 1]
	ld c, [hl]
	cp c
	jp nz, MoveObjectDown
	ld a, [wCurObjSubState]
	and $0f
	dec a
	jr z, .asm_5430b
	ld a, $1e
	ld [wCurObjStateDuration], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54335)
	ld [hld], a
	ld a, LOW(.Func_54335)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_INVISIBLE_F, [hl]
	ret
.asm_5430b
	ld a, $21
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5435f)
	ld [hld], a
	ld a, LOW(.Func_5435f)
	ld [hld], a
	ld hl, wCurObjUnk02
	ld e, $05
	farcall Func_ba42
	play_sfx SFX_0A7
	ret

.Func_54335:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $3a
	jr nc, .asm_54353
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_54103)
	ld [hld], a
	ld a, LOW(.Func_54103)
	ld [hld], a
	ld a, $00
	ld [wcac3], a
	call UpdateLevelMusic
	ret
.asm_54353
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_FLAGS
	res OBJFLAG_INVISIBLE_F, [hl]
	jp .asm_5406d

.Func_5435f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjVar3
	dec [hl]
	jp nz, MoveObjectUp_Fast
	inc l
	ld a, [hld]
	rlca
	jr c, .asm_54375
	ld de, Frameset_6972f
	jr .asm_54378
.asm_54375
	ld de, Frameset_696f3
.asm_54378
	call SetObjectFramesetPtr
	ld a, $1e
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_54387)
	ld [hld], a
	ld a, LOW(.Func_54387)
	ld [hld], a
	ret

.Func_54387:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_543c4
	dec [hl]
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_543a9
	res 7, [hl]
	jr .asm_543ab
.asm_543a9
	set 7, [hl]
.asm_543ab
	res 4, [hl]
	ld a, [hl]
	and $80
	ld [hld], a
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld a, $03
	ld [wcac3], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ret
.asm_543c4
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_543d4)
	ld [hld], a
	ld a, LOW(.Func_543d4)
	ld [hld], a
	play_sfx SFX_0A3
.Func_543d4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, $4180
	call ApplyObjYMovement
	ld a, [wCurObjSubState]
	rlca
	jp nc, MoveObjectRight
	jp MoveObjectLeft
; 0x543e9

RollingRockFunc_Left: ; 543e9 (15:43e9)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .MoveLeft
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveLeft)
	ld [hld], a
	ld a, LOW(.MoveLeft)
	ld [hld], a
.MoveLeft
	call MoveObjectLeft_Fast
	jr RollingRockFunc

RollingRockFunc_Right: ; 54401 (15:4401)
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .MoveRight
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveRight)
	ld [hld], a
	ld a, LOW(.MoveRight)
	ld [hld], a
.MoveRight
	call MoveObjectRight_Fast
;	fallthrough

RollingRockFunc: ; 54417 (15:4417)
	ld a, [wCurObjVar1]
	and a
	jr nz, .asm_54422
	ld bc, $48b0
	jr .asm_54425
.asm_54422
	ld bc, $4900
.asm_54425
	ld a, [wCurObjState]
	and a
	jp z, ApplyObjYMovement
	xor a
	ld [wCurObjVar3], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Hit)
	ld [hld], a
	ld a, LOW(.Hit)
	ld [hld], a
	play_sfx SFX_016
	ret

.Hit:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, $4180
	call ApplyObjYMovement
	ld a, [wCurObjSubState]
	rlca
	jp c, MoveObjectRight_Fast
	jp MoveObjectLeft_Fast
; 0x54456

PalmTreeSpawnerFunc: ; 54456 (15:4456)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.SpawnTrees)
	ld [hld], a
	ld a, LOW(.SpawnTrees)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, 240
	ld [wCurObjStateDuration], a
	jr .Wait

.SpawnTrees:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .tall
	ld a, [hl]
	cp 180
	jr nc, .Wait
	cp 60
	jr z, .medium
	cp 120
	jr nz, .Wait
; short
	ld bc, ObjParams_PalmTreeShort
	jr .create
.medium
	ld bc, ObjParams_PalmTreeMedium
	jr .create
.tall
	ld bc, ObjParams_PalmTreeTall
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Wait)
	ld [hld], a
	ld a, LOW(.Wait)
	ld [hld], a
.create
	call CreateObjectAtRelativePos
.Wait
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
; 0x544a2

PalmTreeFunc: ; 544a2 (15:44a2)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld hl, Pals_544dd
	ld de, wTempPals2 palette 7
	ld c, 7
	ld b, 1
	jp CopyAndApplyOBPals

.Update:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar1
	ld a, [hl]
	and a
	jr z, .open
; grow
	dec [hl]
	call MoveObjectUp
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.set_frame_duration
	ld a, 10
	ld [wCurObjFrameDuration], a
	ret
.open
	inc l
	ld a, [hl] ; var2
	and a
	jr z, .set_frame_duration
	dec [hl]
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret
; 0x544dd

Pals_544dd: ; 544dd (15:44dd)
	rgb 31, 31, 31
	rgb  0, 23,  5
	rgb  0, 12,  5
	rgb  0,  5,  0
; 0x544e5
