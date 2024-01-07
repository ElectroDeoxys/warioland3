ShootFunc:
	ld a, TRUE
	ld [wIsBossBattle], a
	stop_music2
	xor a
	ld [wDollBoyActiveBarrels], a
	ld [w1d147], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56666)
	ld [hld], a
	ld a, LOW(.Func_56666)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, [hl]
	and OBJSUBFLAGS_MASK
	or $05
	ld [hl], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $f8
	ld [hl], a
	ld de, Frameset_69f7c
	call SetObjectFramesetPtr
	ld a, $50
	ld [hli], a
	ld a, $20
	ld [wCurObjVar2], a
	call MoveObjectUpByVar2
	ld a, $60
	ld [wCurObjVar2], a
	jp MoveObjectRightByVar2

.Func_56666:
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	ret z
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56675)
	ld [hld], a
	ld a, LOW(.Func_56675)
	ld [hld], a
	ret

.Func_56675:
	ld a, [wGlobalCounter]
	and %1111
	play_sfx z, SFX_0C6
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56717)
	ld [hld], a
	ld a, LOW(.Func_56717)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_4D
	ld [hli], a
	ld a, $01
	ld [w1d147], a
	ld a, $02
	ld [wcac3], a
	call UpdateLevelMusic
	jp .Func_56755

.asm_566a9
	play_sfx SFX_0C9
	ld a, [wCurObjSubState]
	rlca
	jr nc, .asm_566bd
.asm_566b7
	xor a
	ld [hld], a
	res 6, [hl]
	jr .asm_566c1
.asm_566bd
	xor a
	ld [hld], a
	set 6, [hl]
.asm_566c1
	ld a, [hld]
	rlca
	jr c, .asm_566ca
	ld de, Frameset_6a022 + $2
	jr .asm_566cd
.asm_566ca
	ld de, Frameset_6a03a + $2
.asm_566cd
	ld a, $02
	ld [wCurObjVar2], a
	jp .asm_56787

.asm_566d5
	xor a
	ld [hld], a
	dec l
	ld [hld], a
	ld a, $10
	ld [hl], a
	call MoveObjectUpByVar2
	ld de, Frameset_69ffd
	call SetObjectFramesetPtr
	inc l
	ld a, $05
	ld [hli], a
	ld a, $01
	ld [hl], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	add $10
	ld [wWarioYPos + 1], a
	ld a, [wWarioYPos + 0]
	adc $00
	ld [wWarioYPos + 0], a
	inc l
	ld a, [hli]
	ld [wWarioXPos + 1], a
	play_sfx SFX_FAT_WALK
	ld l, OBJ_SUBSTATE
	set OBJSUBFLAG_HDIR_F, [hl]
	cp $7b
	jr c, .asm_56714
	res 6, [hl]
	ret
.asm_56714
	set 6, [hl]
	ret

.Func_56717:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_5673d
	cp $0e
	jr z, .asm_566a9
	cp $04
	jr z, .asm_566bd
	cp $05
	jr z, .asm_566b7
	cp $2f
	jr z, .asm_566d5
	and $fe
	cp $08
	jp z, .asm_56a03
	cp $0a
	jp z, .asm_56a03
	xor a
	ld [hl], a
	ret
.asm_5673d
	ld a, [wCurObjVar1]
	jumptable
	dw .Func_56774
	dw .Func_5679c
	dw .Func_567b3
	dw .Func_568a3
	dw .Func_568ab
	dw .Func_568bd
	dw .Func_568f1
	dw .Func_5691a
	dw .Func_56951
	dw .Func_56986

.Func_56755:
	ld hl, wCurObjSubState
	ld a, [hl]
	rlca
	jr c, .asm_56763
	res 6, [hl]
	ld de, Frameset_6a022
	jr .asm_56768
.asm_56763
	set 6, [hl]
	ld de, Frameset_6a03a
.asm_56768
	call SetObjectFramesetPtr
	ld a, $1b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret

.Func_56774:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56784
	ld de, Frameset_6a02b
	jr .asm_56787
.asm_56784
	ld de, Frameset_6a043
.asm_56787
	call SetObjectFramesetPtr
	ld a, $16
	ld [hli], a
	ld a, $01
	ld [hli], a
	inc l
	xor a
	ld [hl], a
	play_sfx SFX_0C8
	ret

.Func_5679c:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_567ab
	ld bc, Data_603d0
	call ApplyObjYMovement
	jp .Func_569c7
.asm_567ab
	inc l
	ld a, $02
	ld [hli], a
	inc l
	xor a
	ld [hl], a
	ret

.Func_567b3:
	ld bc, Data_603e0
	call ApplyObjYMovement
	call .Func_569c7
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
	jr nz, .asm_56841
	ld hl, wCurObjYPos
	ld a, [hli]
	add $10
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	call Func_352b
	and a
	jr nz, .asm_5682f
	ld hl, wCurObjYPos
	ld a, [hli]
	add $20
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	call Func_352b
	and a
	jr nz, .asm_5681d
	ld hl, wCurObjYPos
	ld a, [hli]
	add $30
	ldh [hYPosLo], a
	ld a, [hli]
	adc $00
	ldh [hYPosHi], a
	call Func_352b
	and a
	jr nz, .asm_5680b
	ret
.asm_5680b
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56817
	ld de, Frameset_6a02e
	jp SetObjectFramesetPtr
.asm_56817
	ld de, Frameset_6a046
	jp SetObjectFramesetPtr
.asm_5681d
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_56829
	ld de, Frameset_6a031
	jp SetObjectFramesetPtr
.asm_56829
	ld de, Frameset_6a049
	jp SetObjectFramesetPtr
.asm_5682f
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_5683b
	ld de, Frameset_6a034
	jp SetObjectFramesetPtr
.asm_5683b
	ld de, Frameset_6a04c
	jp SetObjectFramesetPtr
.asm_56841
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
.asm_5684a
	ld hl, wCurObjSubState
	ld a, [wWarioXPos + 1]
	cp $c0
	jr nc, .asm_56863
	ld b, a
	ld a, [wCurObjXPos]
	cp b
	bit 7, [hl]
	jr nz, .asm_56861
	jr c, .asm_56889
	jr .asm_56863
.asm_56861
	jr nc, .asm_56889
.asm_56863
	ld a, [wDollBoyActiveBarrels]
	and a
	jr nz, .asm_56889
	ld a, [hl]
	rlca
	jr c, .asm_56872
	ld de, Frameset_6a037
	jr .asm_56875
.asm_56872
	ld de, Frameset_6a04f
.asm_56875
	call SetObjectFramesetPtr
	ld a, [wNumWarioGoals]
	and a
	jr nz, .asm_56882
	ld a, $19
	jr .asm_56884
.asm_56882
	ld a, $02
.asm_56884
	ld [hli], a
	ld a, $03
	ld [hli], a
	ret
.asm_56889
	ld a, [hl]
	rlca
	jr c, .asm_56892
	ld de, Frameset_69f35
	jr .asm_56895
.asm_56892
	ld de, Frameset_69f40
.asm_56895
	call SetObjectFramesetPtr
	ld a, $2a
	ld [hli], a
	ld a, $04
	ld [hli], a
	xor a
	ld [wDollBoyActiveBarrels], a
	ret

.Func_568a3:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	jp .Func_56755

.Func_568ab:
	ld hl, wCurObjStateDuration
	dec [hl]
	jp z, .Func_56755
	ld a, [hl]
	cp $15
	ret nz
	ld l, OBJ_SUBSTATE
	ld a, [hl]
	xor OBJSUBFLAG_HDIR
	ld [hl], a
	ret

.Func_568bd:
	call .Func_569b0
	ld bc, Data_54000
	call Func_57213
	ld hl, wCurObjYPos
	ld a, [hl]
	ld b, $e0
	cp b
	ret c
	ld de, Frameset_6a000
	call SetObjectFramesetPtr
	inc l
	ld a, $06
	ld [hli], a
	ld a, $10
	ld [hl], a
	call MoveObjectDownByVar2
	ld l, OBJ_Y_POS
	ld a, $f0
	ld [hli], a
	ld [wWarioYPos + 1], a
	ld a, [hli]
	ld [wWarioYPos + 0], a
	ld a, [hli]
	add $08
	ld [wWarioXPos + 1], a
	ret

.Func_568f1:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	cp $06
	jr z, .asm_56909
	cp $0a
	ret nz
	inc l
	ld a, $07
	ld [hl], a
	ld de, Frameset_69f54
	jp SetObjectFramesetPtr
.asm_56909
	ld a, [wWarioXPos + 1]
	add $08
	ld [wWarioXPos + 1], a
	play_sfx SFX_HANG_GRAB
	ret

.Func_5691a:
	ld a, [w1d147]
	cp $05
	call z, .Func_5698c
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	ld a, [hli]
	cp $04
	jr z, .asm_5693a
	cp $08
	ret nz
	inc l
	ld a, $08
	ld [hl], a
	ld de, Frameset_6a00b
	jp SetObjectFramesetPtr
.asm_5693a
	ld a, $05
	ld [w1d147], a
	xor a
	ld [wCurObjVar3], a
	ld a, $82
	ld [wAutoMoveState], a
	play_sfx SFX_034
	ret

.Func_56951:
	ld a, [w1d147]
	cp $06
	jp nz, .Func_5698c
	ld hl, wNumShootGoals
	ld a, [hl]
	cp $03
	jr z, .asm_56963
	inc [hl]
	ld b, [hl]
.asm_56963
	ld a, $81
	ld [wAutoMoveState], a
	play_sfx SFX_0C7
	ld a, $01
	ld [wDollBoyActiveBarrels], a
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	ld a, b
	cp $03
	jp nz, .asm_5684a
	ld a, $09
	ld [wCurObjVar1], a
	ret

.Func_56986:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_5698c:
	ld a, [wWarioXPos + 1]
	cp $ed
	jr nc, .asm_5699e
	ld bc, Data_54010
	call Func_57244
	ld b, $03
	jp AddXOffset
.asm_5699e
	ld a, [wWarioYPos + 1]
	cp $f0
	jr nc, .asm_569aa
	ld b, $03
	jp AddYOffset
.asm_569aa
	ld a, $06
	ld [w1d147], a
	ret

.Func_569b0:
	ld a, [wCurObjVar2]
	ld b, a
	ld hl, wCurObjSubState
	bit 6, [hl]
	jr nz, .asm_569c1
	call MoveObjectLeftByVar2
	jp SubXOffset
.asm_569c1
	call MoveObjectRightByVar2
	jp AddXOffset

.Func_569c7:
	ld a, [wCurObjSubState]
	rlca
	rlca
	ld a, [wCurObjXPos]
	jr c, .asm_569e8
	cp $1b
	jp nc, MoveObjectLeftByVar2
	play_sfx SFX_08D
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
	bit 7, [hl]
	ret nz
	jr .asm_569fd
.asm_569e8
	cp $db
	jp c, MoveObjectRightByVar2
	play_sfx SFX_08D
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	bit 7, [hl]
	ret z
.asm_569fd
	ld a, $01
	ld [wDollBoyActiveBarrels], a
	ret

.asm_56a03
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56a1c)
	ld [hld], a
	ld a, LOW(.Func_56a1c)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, $01
	ld [hli], a
	ld a, $ee
	ld [hli], a
	ld a, $00
	ld [hl], a
.Func_56a1c:
	ld hl, wCurObjFlags
	ld a, [wCurObjXPos]
	cp $db
	jr nc, .asm_56a2a
	set 2, [hl]
	jr .asm_56a2c
.asm_56a2a
	res 2, [hl]
.asm_56a2c
	ld a, [wCurObjState]
	jumptable
	dw .Func_56b20
	dw .Func_56b2a
	dw .Func_56bae
	dw .Func_56bb8
	dw .Func_56c1b
	dw .Func_56c3d
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56bae
	dw .Func_56bb8
	dw .Func_56b96
	dw .Func_56bae
	dw .Func_56bb8
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56bd1
	dw .Func_56bd1
	dw .Func_56b20
	dw .Func_56bdb
	dw .Func_56be3
	dw .Func_56bf1
	dw .Func_56bf8
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_56af0
	dw .Func_56af0
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56d1c
	dw .Func_56b20
	dw .Func_56b20
	dw ObjState_Fall
	dw .Func_56b47
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw .Func_56c49
	dw .Func_56c49
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_56b20
	dw Func_32cc
	dw Func_32db
	dw .Func_56bff
	dw .Func_56c0d
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw Func_31a0
	dw Func_31be
	dw Func_31dc
	dw Func_31fa
	dw Func_3218
	dw Func_3236
	dw Func_32cc
	dw Func_32db
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20
	dw .Func_56b20

.Func_56af0:
	ld a, $2d
	ld [wCurObjState], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld de, Frameset_69f5d
	jp SetObjectFramesetPtr

.asm_56b00
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56717)
	ld [hld], a
	ld a, LOW(.Func_56717)
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $05
	ld [hld], a
	res 7, [hl]
	ld l, OBJ_INTERACTION_TYPE
	ld a, $cd
	ld [hli], a
	ld a, $e0
	ld [hli], a
	ld a, $f8
	ld [hl], a
	ret

.Func_56b20:
	ld hl, wCurObjState
	ld a, $30
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ret

.Func_56b2a:
	ld hl, wCurObjState
	ld a, $31
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	dec l
	ld a, [wNumWarioGoals]
	cp 2
	jr nc, .asm_56b3e
	xor a
	jr .asm_56b40
.asm_56b3e
	ld a, $a0
.asm_56b40
	ld [hl], a
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
.Func_56b47:
	ld a, [wCurObjVar3]
	cp $22
	play_sfx z, SFX_075
	ld hl, wCurObjVar1
	dec [hl]
	jr z, .asm_56b00
	ld a, [hl]
	cp $12
	jr nz, .asm_56b71
	ld de, Frameset_69f93
	call SetObjectFramesetPtr
	play_sfx SFX_0B7
	jr .asm_56b90
.asm_56b71
	jr c, .asm_56b90
	cp $64
	jr nz, .asm_56b7f
	ld de, Frameset_69f66
	call SetObjectFramesetPtr
	jr .asm_56b81
.asm_56b7f
	jr nc, .asm_56b90
.asm_56b81
	ld a, [wGlobalCounter]
	and %1111
	play_sfx z, SFX_06A
.asm_56b90
	ld bc, Data_60e40
	jp ApplyObjYMovement_Loop

.Func_56b96:
	play_sfx SFX_014
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr nc, .Func_56bae
	jr .Func_56bb8
.Func_56bae:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $38
	jr .asm_56bc0
.Func_56bb8:
	ld hl, wCurObjAction
	ld a, $8f
	ld [hld], a
	ld a, $39
.asm_56bc0
	ld [hld], a
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
	ld a, $04
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ret

.Func_56bd1:
	ld hl, wCurObjState
	ld a, $41
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ret

.Func_56bdb:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_56be9
.Func_56be3:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_56be9
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ret

.Func_56bf1:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ret

.Func_56bf8:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ret

.Func_56bff:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_56c0d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_56c1b:
	ld a, $34
	ld de, Frameset_69f9f
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
.asm_56c25
	inc l
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ld a, [wCurObjYPos]
	cp $d8
	jr c, .asm_56c37
	ld a, $02
	ld [hld], a
	jp SetObjectFramesetPtr
.asm_56c37
	ld a, $04
	ld [hld], a
	jp SetObjectFramesetPtr

.Func_56c3d:
	ld a, $35
	ld de, Frameset_69fa4
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
	jr .asm_56c25

.Func_56c49:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wDollBoyActiveBarrels]
	and a
	jr z, .asm_56c5e
	xor a
	ld [wDollBoyActiveBarrels], a
	ld de, Frameset_69f5d
	call SetObjectFramesetPtr
.asm_56c5e
	call .Func_56cdb
	ld a, [wCurObjVar2]
	cp $04
	jr z, .asm_56c6d
	ld bc, Data_60e20
	jr .asm_56c70
.asm_56c6d
	ld bc, Data_60e70
.asm_56c70
	call ApplyObjYMovement
	ld hl, wCurObjYPos
	ld a, [hl]
	ld b, $f0
	cp b
	ret c
	ld [hl], b
	ld a, [w1d147]
	cp $04
	jr nz, .asm_56c93
	ld a, [wNumWarioGoals]
	cp $03
	jp z, .asm_56d4b
	ld a, $01
	ld [w1d147], a
	jp .asm_56b00
.asm_56c93
	ld l, OBJ_SUBSTATE
	bit OBJSUBFLAG_VDIR_F, [hl]
	jr nz, .asm_56c9e
	inc l
	ld a, $09
	ld [hl], a
	ret
.asm_56c9e
	ld a, [wCurObjXPos]
	cp $db
	jr nc, .asm_56caa
	inc l
	ld a, $08
	ld [hl], a
	ret
.asm_56caa
	inc l
	ld a, $2d
	ld [hl], a
	ld a, $02
	ld [w1d147], a
	play_sfx SFX_0C7
	ld hl, wNumWarioGoals
	ld a, [hl]
	cp $03
	jr z, .asm_56cd5
	inc [hl]
	ld a, [hl]
	cp $03
	jr nz, .asm_56cd5
	stop_music2
.asm_56cd5
	ld de, Frameset_69f9a
	jp SetObjectFramesetPtr

.Func_56cdb:
	ld a, [wCurObjSubState]
	rlca
	rlca
	jr c, .asm_56cf1
	ld a, [wCurObjXPos]
	cp $1b
	jp nc, MoveObjectLeftByVar2
	ld hl, wCurObjSubState
	set OBJSUBFLAG_VDIR_F, [hl]
	jr .asm_56d05
.asm_56cf1
	ld a, [wCurObjYPos]
	cp $d0
	jr nc, .asm_56d13
	ld a, [wCurObjXPos]
	cp $db
	jp c, MoveObjectRightByVar2
	ld hl, wCurObjSubState
	res OBJSUBFLAG_VDIR_F, [hl]
.asm_56d05
	ld a, $01
	ld [wDollBoyActiveBarrels], a
	play_sfx SFX_01A
	ret
.asm_56d13
	ld a, [wCurObjXPos]
	cp $f3
	jp c, MoveObjectRightByVar2
	ret

.Func_56d1c:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
	ld a, [w1d147]
	cp $04
	ret nz
	ld de, Frameset_69fa4
	call SetObjectFramesetPtr
	ld l, OBJ_STATE
	ld a, $35
	ld [hld], a
	res 6, [hl]
	dec l
	xor a
	ld [hld], a
	ld a, [wNumWarioGoals]
	cp $03
	jr nz, .asm_56d47
	ld a, $01
	jr .asm_56d49
.asm_56d47
	ld a, $03
.asm_56d49
	ld [hl], a
	ret

.asm_56d4b
	ld de, Frameset_69f8a
	call SetObjectFramesetPtr
	ld a, $1c
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56d88)
	ld [hld], a
	ld a, LOW(.Func_56d88)
	ld [hld], a
	ld l, OBJ_STATE
	ld a, $48
	ld [hld], a
	ld a, [hl]
	and $e0
	ld [hld], a
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld hl, wCurObjUnk02
	ld e, $09
	farcall Func_ba42
	play_sfx SFX_0A9
	ret

.Func_56d88:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_56d99
	ld bc, Data_60e90
	jp ApplyObjYMovement
.asm_56d99
	xor a
	ld [wCurObjVar3], a
	ld de, Frameset_69f6f
	call SetObjectFramesetPtr
	ld a, $46
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56daf)
	ld [hld], a
	ld a, LOW(.Func_56daf)
	ld [hld], a
	ret

.Func_56daf:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_56dc6
	dec [hl]
	ret nz
	play_sfx SFX_0A3
	ret
.asm_56dc6
	ld bc, Data_60ea0
	jp ApplyObjYMovement

GKTortoisePlatformFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56e01)
	ld [hld], a
	ld a, LOW(.Func_56e01)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld de, Frameset_69fdc
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
	ld a, $3c
	ld [hli], a
	ld a, $40
	ld [hl], a
	call MoveObjectRightByVar2
	ld a, $10
	ld [wCurObjVar2], a
	jp MoveObjectDownByVar2

.Func_56e01:
	call SetOneWayPlatformAction
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_56e14
	dec [hl]
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	jp MoveObjectLeft
.asm_56e14
	inc l
	dec [hl]
	ret nz
	dec l
	ld a, $b0
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56e24)
	ld [hld], a
	ld a, LOW(.Func_56e24)
	ld [hld], a
	ret

.Func_56e24:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar1
	ld a, [hld]
	and a
	jr z, .asm_56e4e
	inc [hl]
	ld a, [hli]
	cp $b0
	jr z, .asm_56e48
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call AddYOffset
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.asm_56e48
	xor a
	ld [hl], a
	ld [wCurObjState], a
	ret
.asm_56e4e
	dec [hl]
	jr z, .asm_56e65
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp
	res OBJFLAG_STEPPED_F, [hl]
	ld b, $01
	call SubYOffset
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.asm_56e65
	inc l
	ld a, $01
	ld [hl], a
	ret

GKTortoiseFunc:
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_56eac)
	ld [hld], a
	ld a, LOW(.Func_56eac)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $05
	ld [hld], a
	ld a, $fa
	ld [hld], a
	ld de, Frameset_69fed
	call SetObjectFramesetPtr
	inc l
	xor a
	ld [hli], a
	ld a, $40
	ld [hl], a
	call MoveObjectRightByVar2
	ld a, $10
	ld [wCurObjVar2], a
	jp MoveObjectDownByVar2

.asm_56e9c
	ld de, Frameset_6a017
	call SetObjectFramesetPtr
	inc l
	ld a, $07
	ld [hl], a
	ld a, $f6
	ld [wCurObjCollBoxTop], a
	ret

.Func_56eac:
	ld a, [wTransformation]
	and a
	jr z, .asm_56eb7
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
.asm_56eb7
	ld a, [w1d147]
	cp $05
	jr nz, .asm_56ec5
	ld a, [wCurObjVar1]
	cp $07
	jr nz, .asm_56e9c
.asm_56ec5
	ld a, [wCurObjVar1]
	jumptable
	dw .Func_56f27
	dw .Func_56f2e
	dw .Func_56fef
	dw .Func_57021
	dw .Func_5707b
	dw .Func_57039
	dw .Func_57198
	dw .Func_56f0c
	dw .Func_56edd
	dw .Func_5710f

.Func_56edd:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	xor a
	ld [wCurObjFlags], a
	ld hl, wCurObjUnk02
	ld e, $08
	farcall Func_ba42
	ld a, $03
	ld [wcac3], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	ret

.Func_56f0c:
	ld hl, wCurObjFramesetOffset
	ld a, [hld]
	cp $0a
	jr z, .asm_56f21
	cp $06
	ret c
	ld a, [w1d147]
	cp $06
	ret z
	ld a, $10
	ld [hl], a
	ret
.asm_56f21
	ld a, [hl]
	and a
	ret nz
	jp .asm_56fd2

.Func_56f27:
	ld a, [w1d147]
	and a
	jp nz, .asm_57009
.Func_56f2e
	ld a, [w1d147]
	cp $02
	jr z, .asm_56f93
	ld hl, wCurObjAction
	xor a
	ld [hld], a
	ld a, [hl]
	and a
	ret z
	cp $2f
	jr z, .asm_56fa3
	and $fe
	cp $08
	jr nz, .asm_56f7d
	xor a
	ld [hl], a
	ld de, Frameset_69ff2
	call SetObjectFramesetPtr
	inc l
	ld a, $09
	ld [hl], a
	ld a, $03
	ld [w1d147], a
	play_sfx SFX_FAT_WALK
	call .Func_57170
.asm_56f63
	call .Func_5714d
	ld de, wCurObjYPos
	ld a, [de]
	sub $10
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	inc e
	ld a, [de]
	sub $0b
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	ret
.asm_56f7d
	xor a
	ld [hl], a
	ld de, Frameset_69fcf
	call SetObjectFramesetPtr
	inc l
	ld a, $02
	ld [hl], a
	ld a, $f6
	ld [wCurObjCollBoxTop], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret
.asm_56f93
	ld a, $03
	ld [w1d147], a
	ld de, Frameset_69fba
	call SetObjectFramesetPtr
	inc l
	ld a, $04
	ld [hl], a
	ret
.asm_56fa3
	xor a
	ld [hl], a
	ld de, Frameset_69ff2
	call SetObjectFramesetPtr
	inc l
	ld a, $05
	ld [hl], a
	play_sfx SFX_FAT_WALK
.asm_56fb7
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub $10
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	sub $0b
	ld [wWarioXPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioXPos + 0], a
	ret

.asm_56fd2
	ld a, $07
	ld [w1d147], a
	ld de, Frameset_69fba
	call SetObjectFramesetPtr
	inc l
	ld a, $06
	ld [hl], a
	ld a, $ec
	ld [wCurObjCollBoxTop], a
	play_sfx SFX_FAT_WALK
	ret

.Func_56fef:
	ld a, [w1d147]
	cp $02
	jr z, .asm_56fff
	ld hl, wCurObjState
	ld a, [hl]
	and $fe
	jp nz, .asm_56f7d
.asm_56fff
	ld hl, wCurObjFramesetOffset
	ld a, [hld]
	cp $0c
	ret nz
	ld a, [hld]
	and a
	ret nz
.asm_57009
	ld de, Frameset_69fa9
	call SetObjectFramesetPtr
	inc l
	ld a, $01
	ld [hl], a
	xor a
	ld [wCurObjState], a
	ld a, $ec
	ld [wCurObjCollBoxTop], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ret

.Func_57021:
	ld hl, wCurObjFlags
	res 3, [hl]
	ld l, OBJ_STATE
	ld a, [hl]
	and $fe
	jp nz, .asm_56f7d
	ld l, OBJ_FRAMESET_OFFSET
	ld a, [hld]
	cp $06
	ret nz
	ld a, [hld]
	and a
	ret nz
	jr .asm_57009

.Func_57039:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	ld a, [hl]
	cp $02
	jr z, .asm_57052
	cp $04
	jp z, .asm_56fb7
	cp $06
	jr z, .asm_57069
	cp $0a
	ret nz
	jr .asm_57009
.asm_57052
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub $16
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hli]
	ld [wWarioXPos + 0], a
	ret
.asm_57069
	xor a
	ld [wAutoMoveState], a
	ld a, $8f
	ld [wCurObjAction], a
	play_sfx SFX_067
	ret

.Func_5707b:
	ld hl, wCurObjFlags
	set 3, [hl]
	ld l, OBJ_FRAME_DURATION
	ld a, [hli]
	and a
	ret nz
	ld a, [hl]
	cp $06
	jr z, .asm_570c1
	cp $08
	jr z, .asm_570df
	cp $0e
	jr z, .asm_570f5
	cp $10
	jr z, .asm_570b3
	cp $14
	ret nz
	ld a, [wNumWarioGoals]
	cp $03
	jp nz, .asm_57009
	ld de, Frameset_6a00e
	call SetObjectFramesetPtr
	ld a, $b4
	ld [hli], a
	ld a, $08
	ld [hl], a
	ld a, $f6
	ld [wCurObjCollBoxTop], a
	ret
.asm_570b3
	ld a, $04
	ld [w1d147], a
	play_sfx SFX_067
	ret
.asm_570c1
	play_sfx SFX_FAT_WALK
	call .Func_5714d
	ld de, wCurObjYPos
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	add $0c
	ld [hli], a
	inc e
	ld a, [de]
	adc $00
	ld [hli], a
	ret
.asm_570df
	call .Func_5714d
	ld de, wCurObjYPos
	ld a, [de]
	sub $16
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	ret
.asm_570f5
	call .Func_5714d
	ld de, wCurObjYPos
	ld a, [de]
	sub $10
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	inc e
	ld a, [de]
	sub $0b
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	ret

.Func_5710f:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	ld a, [hl]
	cp $02
	jr z, .asm_57129
	cp $04
	jp z, .asm_56f63
	cp $06
	jr z, .asm_5713f
	cp $0a
	ret nz
	jp .asm_57009
.asm_57129
	call .Func_5714d
	ld de, wCurObjYPos
	ld a, [de]
	sub $16
	ld [hli], a
	inc e
	ld a, [de]
	sbc $00
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	inc e
	ld a, [de]
	ld [hli], a
	ret
.asm_5713f
	ld a, $04
	ld [w1d147], a
	play_sfx SFX_067
	ret

.Func_5714d:
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_57153
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $50
	jr nz, .asm_57164
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_FLAGS
	rra
	jr c, .asm_5716d
.asm_57164
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_57153
.asm_5716d
	inc l
	inc l
	ret

.Func_57170:
	ld a, LOW(wObj1)
	ld b, LOW(wObj1)
	ld h, HIGH(wObj1)
.asm_57176
	ld l, OBJ_UNK_07
	add l
	ld l, a
	ld a, [hl] ; OBJ_UNK_07
	cp $50
	jr nz, .asm_57187
	ld a, l
	sub OBJ_UNK_07 - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_FLAGS
	rra
	jr c, .asm_57190
.asm_57187
	ld a, b
	cp LOW(wObj8)
	ret z
	add OBJ_STRUCT_LENGTH
	ld b, a
	jr .asm_57176
.asm_57190
	ld a, l
	add $1c
	ld l, a
	ld a, $88
	ld [hl], a
	ret

.Func_57198:
	ld hl, wCurObjFrameDuration
	ld a, [hli]
	and a
	ret nz
	ld a, [hl]
	cp $06
	jr z, .asm_571c7
	cp $08
	jr z, .asm_571df
	cp $0e
	jr z, .asm_571f7
	cp $10
	jr z, .asm_571b5
	cp $14
	ret nz
	jp .asm_57009
.asm_571b5
	ld a, $01
	ld [w1d147], a
	xor a
	ld [wAutoMoveState], a
	play_sfx SFX_067
	ret
.asm_571c7
	ld hl, wCurObjYPos
	ld a, [hli]
	ld [wWarioYPos + 1], a
	ld a, [hli]
	ld [wWarioYPos + 0], a
	ld a, [hli]
	add $0c
	ld [wWarioXPos + 1], a
	ld a, [hli]
	adc $00
	ld [wWarioXPos + 0], a
	ret
.asm_571df
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $16
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	ld [wWarioXPos + 1], a
	ld a, [hli]
	ld [wWarioXPos + 0], a
	ret
.asm_571f7
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $10
	ld [wWarioYPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioYPos + 0], a
	ld a, [hli]
	sub $0b
	ld [wWarioXPos + 1], a
	ld a, [hli]
	sbc $00
	ld [wWarioXPos + 0], a
	ret

Func_57213:
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_57222
	dec c
	ld a, [bc]
	jr .asm_57223
.asm_57222
	inc [hl]
.asm_57223
	ld b, a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_57236
	add c
	ld [hli], a
	jr nc, .asm_57230
	inc [hl]
.asm_57230
	call AddYOffset
	jp HandleDownwardsFloorTransition
.asm_57236
	add c
	ld [hli], a
	jr c, .asm_5723b
	dec [hl]
.asm_5723b
	xor a
	sub b
	ld b, a
	call SubYOffset
	jp HandleUpwardsFloorTransition

Func_57244:
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_57253
	dec c
	ld a, [bc]
	jr .asm_57254
.asm_57253
	inc [hl]
.asm_57254
	ld b, a
	call AddYOffset
	jp HandleDownwardsFloorTransition

; unreferenced
Func_5725b:
	xor a
	sub b
	ld b, a
	call SubYOffset
	jp HandleUpwardsFloorTransition

ShootGoalCounterFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_57284)
	ld [hld], a
	ld a, LOW(.Func_57284)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, $3c
	ld [wCurObjFrame], a
	ld a, $58
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.Func_57284:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $7f
	ld [wCurObjFrameDuration], a
	ld a, [wNumShootGoals]
	cp $01
	jr z, .asm_5729e
	cp $02
	jr z, .asm_572a4
	cp $03
	jr z, .asm_572aa
	ret
.asm_5729e
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ret
.asm_572a4
	ld a, $3d
	ld [wCurObjFrame], a
	ret
.asm_572aa
	ld a, $3e
	ld [wCurObjFrame], a
	xor a
	ld [wcac3], a
	ret

WarioGoalCounterFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_572d4)
	ld [hld], a
	ld a, LOW(.Func_572d4)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld a, $3c
	ld [wCurObjFrame], a
	ld a, $58
	ld [wCurObjVar2], a
	jp MoveObjectUpByVar2

.Func_572d4:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, $7f
	ld [wCurObjFrameDuration], a
	ld a, [wNumWarioGoals]
	cp $01
	jr z, .asm_572ee
	cp $02
	jr z, .asm_572f4
	cp $03
	jr z, .asm_572fa
	ret
.asm_572ee
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ret
.asm_572f4
	ld a, $3d
	ld [wCurObjFrame], a
	ret
.asm_572fa
	ld a, $3e
	ld [wCurObjFrame], a
	ret
