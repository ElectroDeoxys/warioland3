HiddenFigureFunc: ; 4cb51 (13:4b51)
	ld a, TRUE
	ld [wIsBossBattle], a

	xor a
	ld hl, $d14b
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, $d15a
	ld a, $04
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $02
	ld [hli], a

	ld hl, wCurObjFlags
	set OBJFLAG_NO_COLLISION_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4cb9e)
	ld [hld], a
	ld a, LOW(.Func_4cb9e)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld de, Frameset_6a06c
	call SetObjectFramesetPtr
	ld a, 20
	ld [hli], a
	ld bc, ObjParams_HiddenFigureFace
	call CreateObjectAtRelativePos
	ld bc, ObjParams_HiddenFigureLeftHand
	call CreateObjectAtRelativePos
	ld bc, ObjParams_HiddenFigureRightHand
	jp CreateObjectAtRelativePos

.Func_4cb9e:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hli], a
	ld a, $00
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4cbc4)
	ld [hld], a
	ld a, LOW(.Func_4cbc4)
	ld [hld], a
	ld a, $01
	ld [wcac3], a
	call UpdateLevelMusic
	ret

.Func_4cbc4:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjVar1]
	jumptable
	dw .Func_4cbf5
	dw .Func_4cc05
	dw .Func_4cce2
	dw .Func_4ccf6
	dw .Func_4cd45
	dw .Func_4cd59
	dw .Func_4cc3c
	dw .Func_4cc87
	dw .Func_4cbe8
	dw .Func_4cd28
	dw .Func_4cd8b

.Func_4cbe8:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	xor a
	ld [wAutoMoveState], a
	ret

.Func_4cbf5:
	ld hl, wCurObjStateDuration
	ld a, [$d15e]
	and a
	jr nz, .asm_4cc00
	dec [hl]
	ret nz
.asm_4cc00
	inc l
	ld a, $01
	ld [hli], a
	ret

.Func_4cc05:
	ld hl, wCurObjStateDuration
	ld a, $01
	ld [hli], a
	ld a, [$d160]
	cp $02
	jr nc, .asm_4cc19
	ld e, a
	ld a, [$d15e]
	and a
	jr z, .asm_4cc24
.asm_4cc19
	xor a
	ld [$d15e], a
	ld [$d160], a
	ld b, $06
	jr .asm_4cc36
.asm_4cc24
	ld a, [wWarioScreenXPos]
	cp $58
	jr nc, .asm_4cc2f
	ld b, $02
	jr .asm_4cc31
.asm_4cc2f
	ld b, $04
.asm_4cc31
	inc e
	ld a, e
	ld [$d160], a
.asm_4cc36
	ld [hl], b
	ld hl, $d161
	inc [hl]
	ret

.Func_4cc3c:
	ld a, [$d15c]
	and a
	ret nz
	ld a, [$d15b]
	and a
	ret nz
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $80
	ld [hli], a
	ld a, $07
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	ld b, $03
	ld a, [$d15a]
	cp $04
	jr z, .asm_4cc82
	cp $03
	jr nc, .asm_4cc7b
	ld a, [wWarioScreenXPos]
	cp $30
	jr c, .asm_4cc7b
	cp $80
	jr nc, .asm_4cc7b
	ld a, [$d161]
	rra
	jr c, .asm_4cc7b
	ld a, $60
	ld [wCurObjStateDuration], a
	ld b, $08
	jr .asm_4cc82
.asm_4cc7b
	ldh a, [rDIV]
	rra
	jr c, .asm_4cc82
	ld b, $07
.asm_4cc82
	ld a, b
	ld [$d14b], a
	ret

.Func_4cc87:
	ld hl, $d14e
	ld a, [hl]
	and a
	jr z, .asm_4cc9e
	cp $80
	jr z, .asm_4cc94
	dec [hl]
	ret
.asm_4cc94
	ld hl, wCurObjStateDuration
	ld a, $a0
	ld [hli], a
	ld a, $08
	ld [hl], a
	ret
.asm_4cc9e
	ld a, [$d14b]
	cp $07
	jr z, .asm_4ccae
	cp $08
	jr z, .asm_4ccb3
	ld bc, $4180
	jr .asm_4ccb6
.asm_4ccae
	ld bc, $4580
	jr .asm_4ccb6
.asm_4ccb3
	ld bc, $4680
.asm_4ccb6
	call Func_4cf70
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hli], a
	ld a, $00
	ld [hl], a
	ld a, $00
	ld [$d14b], a
	ld a, [$d15a]
	dec a
	ret nz
	ld hl, $d162
	dec [hl]
	jr z, .asm_4ccde
	ld a, $06
	ld [wCurObjVar1], a
	ld hl, $d161
	inc [hl]
	ret
.asm_4ccde
	ld a, $02
	ld [hl], a
	ret

.Func_4cce2:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $80
	ld [hli], a
	ld a, $03
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	ld a, $01
	ld [$d14b], a
	ret

.Func_4ccf6:
	ld bc, $4000
	call Func_4cf70
	ld bc, $4080
	call Func_4cf87
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $00
	ld [$d14b], a
	ld a, [$d14c]
	and a
	jr nz, .asm_4cd19
	ld a, $1e
	ld [hli], a
	ld a, $00
	ld [hl], a
	ret
.asm_4cd19
	ld hl, wCurObjStateDuration
	ld a, $04
	ld [hli], a
	ld a, $09
	ld [hl], a
	ld a, $04
	ld [$d14b], a
	ret

.Func_4cd28:
	ld a, [$d15a]
	and a
	jp z, .asm_4cda8
	ld a, [$d14c]
	and a
	ret nz
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hli], a
	ld a, $06
	ld [hl], a
	ld a, $00
	ld [$d14b], a
	ret

.Func_4cd45:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $80
	ld [hli], a
	ld a, $05
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	ld a, $02
	ld [$d14b], a
	ret

.Func_4cd59:
	ld bc, $4000
	call Func_4cf70
	ld bc, $4100
	call Func_4cf87
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $00
	ld [$d14b], a
	ld a, [$d14d]
	and a
	jr nz, .asm_4cd7c
	ld a, $1e
	ld [hli], a
	ld a, $00
	ld [hl], a
	ret
.asm_4cd7c
	ld hl, wCurObjStateDuration
	ld a, $04
	ld [hli], a
	ld a, $0a
	ld [hl], a
	ld a, $05
	ld [$d14b], a
	ret

.Func_4cd8b:
	ld a, [$d15a]
	and a
	jp z, .asm_4cda8
	ld a, [$d14d]
	and a
	ret nz
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, $1e
	ld [hli], a
	ld a, $06
	ld [hl], a
	ld a, $00
	ld [$d14b], a
	ret

.asm_4cda8
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4cdbc)
	ld [hld], a
	ld a, LOW(.Func_4cdbc)
	ld [hld], a
	ld a, $82
	ld [wCurObjStateDuration], a
	ld a, $06
	ld [$d14b], a
	ret

.Func_4cdbc:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	call Func_4cfe0
	ld a, [$d14c]
	and a
	ret nz
	ld a, [$d14d]
	and a
	ret nz
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .asm_4cdf4
	ld a, $82
	ld [hli], a
	xor a
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4ce01)
	ld [hld], a
	ld a, LOW(.Func_4ce01)
	ld [hld], a
	ld a, $01
	ld [$d15f], a
	play_sfx SFX_0CF
	ret
.asm_4cdf4
	ld a, [hl]
	and $3f
	ret nz
	play_sfx SFX_0CE
	ret

.Func_4ce01:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjVar1
	ld a, [hl]
	and $07
	jr nz, .asm_4ce1b
	play_sfx SFX_01F
.asm_4ce1b
	inc [hl]
	dec l
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr z, .asm_4ce31
	call Func_4cfe0
	ld a, [wCurObjStateDuration]
	and $03
	ret nz
	ld hl, wc089
	dec [hl]
	ret
.asm_4ce31
	ld a, LVLEND_EPILOGUE
	ld [wLevelEndScreen], a
	jp Func_4d005

Func_4ce39: ; 4ce39 (13:4e39)
	ld a, $3c
	ld [wCurObjStateDuration], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(HiddenFigureFaceFunc.Func_4cf55)
	ld [hld], a
	ld a, LOW(HiddenFigureFaceFunc.Func_4cf55)
	ld [hld], a
	ret

HiddenFigureFaceFunc: ; 4ce47 (13:4e47)
.Func_4ce47:
	ld hl, $d14e
	ld a, [hl]
	cp $80
	jr z, Func_4ce39
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4ce63
	and $fe
	cp $28
	jr z, .asm_4ceba
	xor a
	ld [hl], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	ret
.asm_4ce63
	ld a, [wCurObjFramesetOffset]
	cp $04
	ret nz
	ld a, [wCurObjFrameDuration]
	and a
	ret nz
	ld a, [$d14c]
	and a
	jr nz, .asm_4ce9d
	ld a, [$d14d]
	and a
	jr nz, .asm_4ce9d
	ld a, [$d15a]
	dec a
	jr z, .asm_4ce9d
	ld a, [wWarioScreenXPos]
	cp $38
	jr nc, .asm_4ce8d
	ld de, Frameset_6a07a
	jp SetObjectFramesetPtr
.asm_4ce8d
	cp $78
	jr nc, .asm_4ce97
	ld de, Frameset_6a06c
	jp SetObjectFramesetPtr
.asm_4ce97
	ld de, Frameset_6a07f
	jp SetObjectFramesetPtr
.asm_4ce9d
	ld a, [wWarioScreenXPos]
	cp $38
	jr nc, .asm_4ceaa
	ld de, Frameset_6a092
	jp SetObjectFramesetPtr
.asm_4ceaa
	cp $78
	jr nc, .asm_4ceb4
	ld de, Frameset_6a08d
	jp SetObjectFramesetPtr
.asm_4ceb4
	ld de, Frameset_6a097
	jp SetObjectFramesetPtr
.asm_4ceba
	xor a
	ld [hl], a
	ld de, Frameset_6a084
	call SetObjectFramesetPtr
	ld a, $3c
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4cf13)
	ld [hld], a
	ld a, LOW(.Func_4cf13)
	ld [hld], a
	ld a, $01
	ld [$d151], a
	ld hl, $d15a
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr nz, .asm_4cf03
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4cf3f)
	ld [hld], a
	ld a, LOW(.Func_4cf3f)
	ld [hld], a
	ld l, OBJ_FLAGS
	set 3, [hl]
	xor a
	ld [$d151], a
	stop_music2
	ld a, $10
	ld [wCurObjStateDuration], a
	ld a, $02
	ld [wAutoMoveState], a
	ret

.asm_4cf03
	ld a, [hl]
	dec a
	ret nz
	play_music2 MUSIC_HIDDEN_FIGURE_BATTLE_2
	ret

.Func_4cf13:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_4cf29
	ld a, [hl]
	cp $2c
	jr nz, .asm_4cf26
	play_sfx SFX_0CE
.asm_4cf26
	jp Func_4cfe0
.asm_4cf29
	xor a
	ld [$d151], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4ce47)
	ld [hld], a
	ld a, LOW(.Func_4ce47)
	ld [hld], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	call Func_4d005
	jp .asm_4ce9d

.Func_4cf3f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	play_sfx SFX_0CE
	ret

.Func_4cf55:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
	play_sfx SFX_HIDDEN_FIGURE_LAUGH
	ld de, Frameset_6a071
	jp SetObjectFramesetPtr

Func_4cf70: ; 4cf70 (13:4f70)
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_4cf7f
	dec c
	ld a, [bc]
	jr .asm_4cf80
.asm_4cf7f
	inc [hl]
.asm_4cf80
	ld hl, wc089
	ld c, [hl]
	add c
	ld [hl], a
	ret

Func_4cf87: ; 4cf87 (13:4f87)
	ld hl, wCurObjVar2
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_4cf96
	dec c
	ld a, [bc]
	jr .asm_4cf97
.asm_4cf96
	inc [hl]
.asm_4cf97
	ld hl, wc08b
	ld c, [hl]
	add c
	ld [hl], a
	ret

Func_4cf9e: ; 4cf9e (13:4f9e)
	ld hl, wCurObjVar3
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_4cfad
	dec c
	ld a, [bc]
	jr .asm_4cfae
.asm_4cfad
	inc [hl]
.asm_4cfae
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_4cfba
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_4cfba
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret

Func_4cfbf: ; 4cfbf (13:4fbf)
	ld hl, wCurObjVar2
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_4cfce
	dec c
	ld a, [bc]
	jr .asm_4cfcf
.asm_4cfce
	inc [hl]
.asm_4cfcf
	ld l, OBJ_X_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_4cfdb
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_4cfdb
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret

Func_4cfe0: ; 4cfe0 (13:4fe0)
	ld a, [wGlobalCounter]
	and $0f
	jr z, .asm_4cfef
	cp $08
	ret nz
	ld hl, Pals_4d04b
	jr .asm_4cffe
.asm_4cfef
	ld a, [$d15a]
	cp $02
	jr c, .asm_4cffb
	ld hl, Pals_4d07b
	jr .asm_4cffe
.asm_4cffb
	ld hl, Pals_4d01b
.asm_4cffe
	ld c, 0
	ld b, 6
	jp Func_35e5

Func_4d005: ; 4d005 (13:5005)
	ld a, [$d15a]
	cp $02
	jr c, .asm_4d011
	ld hl, Pals_4d07b
	jr .asm_4d014
.asm_4d011
	ld hl, Pals_4d01b
.asm_4d014
	ld c, 0
	ld b, 6
	jp Func_35e5

Pals_4d01b: ; 4d01b (13:501b)
	rgb  1,  4,  9
	rgb 31,  0,  0
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 30, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 18, 13, 31
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 28, 20,  6
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 11, 21
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0
; 0x4d04b

Pals_4d04b: ; 4d04b (13:504b)
	rgb  0,  0,  4
	rgb 31,  0,  0
	rgb 19, 22, 23
	rgb  0,  0,  0

	rgb  0,  0,  4
	rgb  0,  0,  9
	rgb 19, 22, 23
	rgb  0,  0,  0

	rgb  0,  0,  4
	rgb  0, 31, 18
	rgb 19, 22, 23
	rgb  0,  0,  0

	rgb  0,  0,  4
	rgb 28, 20,  6
	rgb 19, 22, 23
	rgb  0,  0,  0

	rgb  0,  0,  4
	rgb  0, 31, 31
	rgb 31, 31, 30
	rgb  0,  0,  5

	rgb  0,  0,  4
	rgb 31, 12,  3
	rgb 31, 31, 30
	rgb  5,  0,  0
; 0x4d07b

Pals_4d07b: ; 4d07b (13:507b)
	rgb  1,  4,  9
	rgb 31,  0,  0
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 30, 31
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 31, 18
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 28, 20,  6
	rgb  6, 10, 10
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb  0, 11, 21
	rgb 31, 25,  0
	rgb  0,  0,  0

	rgb  1,  4,  9
	rgb 15,  0,  0
	rgb 31, 25,  0
	rgb  0,  0,  0

HiddenFigureLeftHandFunc: ; 4d0ab (13:50ab)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4d0c7)
	ld [hld], a
	ld a, LOW(.Func_4d0c7)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld [$d152], a
	ld a, [hli]
	ld [$d153], a
	ld a, [hli]
	ld [$d154], a
	ld a, [hli]
	ld [$d155], a
	ret

.Func_4d0c7:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [$d14b]
	cp $01
	jr z, .asm_4d0f3
	cp $03
	jr z, .asm_4d100
	cp $07
	jr z, .asm_4d100
	cp $08
	jr z, .asm_4d100
	cp $05
	jr z, .asm_4d11d
	cp $06
	jr z, .asm_4d142
	ld a, [$d151]
	and a
	ret z
	jr .asm_4d14c
.asm_4d0f3
	ld a, $01
	ld [$d151], a
	ld bc, .Func_4d2c8
	ld de, Frameset_6a13a
	jr .asm_4d154
.asm_4d100
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_4F
	ld [hli], a
	ld a, $e0
	ld [hli], a
	ld a, $00
	ld [hli], a
	ld a, $f4
	ld [hli], a
	ld a, $00
	ld [hli], a
	ld bc, .Func_4d1b1
	ld de, Frameset_6a0bc
	jr .asm_4d154
.asm_4d11d
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FULL_STING
	ld [hli], a
	ld a, $01
	ld [$d15c], a
	ld a, [$d15a]
	dec a
	jr z, .asm_4d135
	ld a, $3c
	jr .asm_4d137
.asm_4d135
	ld a, $1e
.asm_4d137
	ld [wCurObjStateDuration], a
	ld bc, .Func_4d164
	ld de, Frameset_6a0d4
	jr .asm_4d154
.asm_4d142
	set 3, [hl]
	ld bc, .Func_4d37f
	ld de, Frameset_6a0d4
	jr .asm_4d154
.asm_4d14c
	ld bc, .Func_4d19e
	ld de, Frameset_6a0d4
	jr .asm_4d154
.asm_4d154
	ld hl, wCurObjUpdateFunction + 1
	ld a, b
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_2
	xor a
	ld [hli], a
	ld [hli], a
	inc l
	ld [hl], a
	jp SetObjectFramesetPtr

.Func_4d164:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_4d17a
	dec [hl]
	ld a, [$d15a]
	and a
	jr z, .asm_4d197
	ld a, [$d14b]
	cp $00
	jr z, .asm_4d197
	ret
.asm_4d17a
	ld bc, $4540
	call Func_4cf9e
	ld a, [wCurObjVar3]
	cp $0a
	jr nz, .asm_4d194
	play_sfx SFX_063
	ld b, $18
	jp DoGroundShake
.asm_4d194
	cp $3f
	ret nz
.asm_4d197
	xor a
	ld [$d15c], a
	jp .asm_4d34c

.Func_4d19e:
	ld bc, $4500
	call Func_4cf9e
	ld a, [wCurObjVar3]
	cp $3a
	ret nz
	xor a
	ld [$d151], a
	jp .asm_4d34c

.Func_4d1b1:
	ld hl, $d14f
	ld a, [hl]
	and a
	jr z, .asm_4d1f8
	cp $80
	jr z, .asm_4d1be
	dec [hl]
	ret
.asm_4d1be
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4d379)
	ld [hld], a
	ld a, LOW(.Func_4d379)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	sub $01
	ld [wYPosLo], a
	ld a, [hli]
	sbc $00
	ld [wYPosHi], a
	ld a, [hli]
	add $06
	ld [wXPosLo], a
	ld a, [hli]
	adc $00
	ld [wXPosHi], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld de, Frameset_6a0f2
	call SetObjectFramesetPtr
	stop_music2
	ret
.asm_4d1f8
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4d225
	cp $2f
	jr nz, .asm_4d20f
	play_sfx SFX_0CD
	ld a, $80
	jr .asm_4d217
.asm_4d20f
	and $fe
	cp $04
	jr nz, .asm_4d223
	ld a, $0a
.asm_4d217
	ld [$d14e], a
	ld [$d14f], a
	ld [$d150], a
	xor a
	ld [hl], a
	ret
.asm_4d223
	xor a
	ld [hl], a
.asm_4d225
	ld a, [$d14b]
	cp $08
	jr z, .asm_4d280
	ld bc, $4380
	call Func_4cfbf
	ld a, [$d14b]
	cp $07
	jr z, .asm_4d23e
	ld bc, $4400
	jr .asm_4d241
.asm_4d23e
	ld bc, $4600
.asm_4d241
	call Func_4cf9e
	ld a, [wCurObjVar2]
	cp $13
	jr nz, .asm_4d251
	ld de, Frameset_6a0ef
	jp SetObjectFramesetPtr
.asm_4d251
	cp $62
	jr nz, .asm_4d264
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_4F
	ld [hld], a
	ld de, Frameset_6a0c3
	jp SetObjectFramesetPtr
.asm_4d264
	cp $61
	jr nz, .asm_4d27a
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_50
	ld [hld], a
	play_sfx SFX_FAT_WALK
	ret
.asm_4d27a
	cp $7f
	ret nz
	jp .asm_4d34c
.asm_4d280
	ld bc, $4700
	call Func_4cfbf
	ld bc, $4800
	call Func_4cf9e
	ld a, [wCurObjVar2]
	cp $13
	jr nz, .asm_4d299
	ld de, Frameset_6a0ef
	jp SetObjectFramesetPtr
.asm_4d299
	cp $4e
	jr nz, .asm_4d2ac
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_4F
	ld [hld], a
	ld de, Frameset_6a0c3
	jp SetObjectFramesetPtr
.asm_4d2ac
	cp $4d
	jr nz, .asm_4d2c2
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_50
	ld [hld], a
	play_sfx SFX_FAT_WALK
	ret
.asm_4d2c2
	cp $5f
	ret nz
	jp .asm_4d34c

.Func_4d2c8:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4d316
	cp $0a
	jr nz, .asm_4d30f
	ld a, $2e
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(HiddenFigureRightHandFunc.Func_4d655)
	ld [hld], a
	ld a, LOW(HiddenFigureRightHandFunc.Func_4d655)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hli], a
	ld a, $ec
	ld [hli], a
	ld a, $fe
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $07
	ld [hli], a
	xor a
	ld [wCurObjVar3], a
	inc a
	ld [$d14c], a
	ld [wCurObjStateDuration], a
	stop_sfx
	ld de, Frameset_6a0b2
	jp SetObjectFramesetPtr
.asm_4d30f
	ld a, $01
	ld [$d15e], a
	xor a
	ld [hl], a
.asm_4d316
	ld bc, $4200
	call Func_4cfbf
	ld bc, $4280
	call Func_4cf9e
	ld a, [wCurObjVar2]
	cp $10
	jr nz, .asm_4d333
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_48
	ld [hld], a
	ret
.asm_4d333
	cp $3c
	jr nz, .asm_4d349
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_52
	ld [hld], a
	play_sfx SFX_0CB
	ret
.asm_4d349
	cp $7f
	ret nz

.asm_4d34c
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4d0c7)
	ld [hld], a
	ld a, LOW(.Func_4d0c7)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, $e8
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $07
	ld [hli], a
	xor a
	ld [wCurObjState], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	res 4, [hl]
	ld de, Frameset_6a128
	jp SetObjectFramesetPtr

.Func_4d379:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_4d37f:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [$d15f]
	and a
	ret z
	ld de, Frameset_6a0bc
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4d39b)
	ld [hld], a
	ld a, LOW(.Func_4d39b)
	ld [hld], a
	ret

.Func_4d39b:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	rra
	jp nc, MoveObjectUp
	ret

HiddenFigureRightHandFunc: ; 4d3ac (13:53ac)
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4d3c8)
	ld [hld], a
	ld a, LOW(.Func_4d3c8)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld [$d156], a
	ld a, [hli]
	ld [$d157], a
	ld a, [hli]
	ld [$d158], a
	ld a, [hli]
	ld [$d159], a
	ret

.Func_4d3c8:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjFlags
	res OBJFLAG_NO_COLLISION_F, [hl]
	ld a, [$d14b]
	cp $02
	jr z, .asm_4d3f4
	cp $03
	jr z, .asm_4d401
	cp $07
	jr z, .asm_4d401
	cp $08
	jr z, .asm_4d401
	cp $04
	jr z, .asm_4d41e
	cp $06
	jr z, .asm_4d443
	ld a, [$d151]
	and a
	ret z
	jr .asm_4d44d
.asm_4d3f4
	ld a, $01
	ld [$d151], a
	ld bc, .Func_4d571
	ld de, Frameset_6a145
	jr .asm_4d455
.asm_4d401
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_4F
	ld [hli], a
	ld a, $e0
	ld [hli], a
	ld a, $00
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld a, $0b
	ld [hli], a
	ld bc, .Func_4d4b2
	ld de, Frameset_6a0c8
	jr .asm_4d455
.asm_4d41e
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_FULL_STING
	ld [hli], a
	ld a, $01
	ld [$d15b], a
	ld a, [$d15a]
	dec a
	jr z, .asm_4d436
	ld a, $3c
	jr .asm_4d438
.asm_4d436
	ld a, $1e
.asm_4d438
	ld [wCurObjStateDuration], a
	ld bc, .Func_4d465
	ld de, Frameset_6a0fe
	jr .asm_4d455
.asm_4d443
	set 3, [hl]
	ld bc, .Func_4d628
	ld de, Frameset_6a0fe
	jr .asm_4d455
.asm_4d44d
	ld bc, .Func_4d49f
	ld de, Frameset_6a0fe
	jr .asm_4d455
.asm_4d455
	ld hl, wCurObjUpdateFunction + 1
	ld a, b
	ld [hld], a
	ld [hl], c
	ld l, OBJ_VAR_2
	xor a
	ld [hli], a
	ld [hl], a
	inc l
	ld [hl], a
	jp SetObjectFramesetPtr

.Func_4d465:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_4d47b
	dec [hl]
	ld a, [$d15a]
	and a
	jr z, .asm_4d498
	ld a, [$d14b]
	cp $00
	jr z, .asm_4d498
	ret
.asm_4d47b
	ld bc, $4540
	call Func_4cf9e
	ld a, [wCurObjVar3]
	cp $0a
	jr nz, .asm_4d495
	play_sfx SFX_063
	ld b, $18
	jp DoGroundShake
.asm_4d495
	cp $3f
	ret nz
.asm_4d498
	xor a
	ld [$d15b], a
	jp .asm_4d5f5

.Func_4d49f:
	ld bc, $4500
	call Func_4cf9e
	ld a, [wCurObjVar3]
	cp $3a
	ret nz
	xor a
	ld [$d151], a
	jp .asm_4d5f5

.Func_4d4b2:
	ld hl, $d150
	ld a, [hl]
	and a
	jr z, .asm_4d4d2
	cp $80
	jr z, .asm_4d4bf
	dec [hl]
	ret
.asm_4d4bf
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4d622)
	ld [hld], a
	ld a, LOW(.Func_4d622)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld de, Frameset_6a11c
	jp SetObjectFramesetPtr
.asm_4d4d2
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4d4ef
	and $fe
	cp $04
	jr nz, .asm_4d4ed
	ld a, $0a
	ld [$d14e], a
	ld [$d14f], a
	ld [$d150], a
	xor a
	ld [hl], a
	ret
.asm_4d4ed
	xor a
	ld [hl], a
.asm_4d4ef
	ld a, [$d14b]
	cp $08
	jr z, .asm_4d540
	ld bc, $4480
	call Func_4cfbf
	ld a, [$d14b]
	cp $07
	jr z, .asm_4d508
	ld bc, $4400
	jr .asm_4d50b
.asm_4d508
	ld bc, $4600
.asm_4d50b
	call Func_4cf9e
	ld a, [wCurObjVar2]
	cp $13
	jr nz, .asm_4d523
	play_sfx SFX_0D1
	ld de, Frameset_6a119
	jp SetObjectFramesetPtr
.asm_4d523
	cp $62
	jr nz, .asm_4d52d
	ld de, Frameset_6a0cf
	jp SetObjectFramesetPtr
.asm_4d52d
	cp $32
	jr nz, .asm_4d53a
	play_sfx SFX_0D0
	ret
.asm_4d53a
	cp $7f
	ret nz
	jp .asm_4d5f5
.asm_4d540
	ld bc, $4760
	call Func_4cfbf
	ld bc, $4800
	call Func_4cf9e
	ld a, [wCurObjVar2]
	cp $13
	jr nz, .asm_4d561
	play_sfx SFX_0D0
	ld de, Frameset_6a119
	jp SetObjectFramesetPtr
.asm_4d561
	cp $4e
	jr nz, .asm_4d56b
	ld de, Frameset_6a0cf
	jp SetObjectFramesetPtr
.asm_4d56b
	cp $5f
	ret nz
	jp .asm_4d5f5

.Func_4d571:
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr z, .asm_4d5bf
	cp $0a
	jr nz, .asm_4d5b8
	ld a, $2e
	ld [hl], a
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4d655)
	ld [hld], a
	ld a, LOW(.Func_4d655)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_00
	ld [hli], a
	ld a, $ec
	ld [hli], a
	ld a, $fe
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $07
	ld [hli], a
	xor a
	ld [wCurObjVar3], a
	inc a
	ld [$d14d], a
	ld [wCurObjStateDuration], a
	stop_sfx
	ld de, Frameset_6a0b7
	jp SetObjectFramesetPtr
.asm_4d5b8
	ld a, $01
	ld [$d15e], a
	xor a
	ld [hl], a
.asm_4d5bf
	ld bc, $4300
	call Func_4cfbf
	ld bc, $4280
	call Func_4cf9e
	ld a, [wCurObjVar2]
	cp $10
	jr nz, .asm_4d5dc
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_48
	ld [hld], a
	ret
.asm_4d5dc
	cp $3c
	jr nz, .asm_4d5f2
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_52
	ld [hld], a
	play_sfx SFX_0CB
	ret
.asm_4d5f2
	cp $7f
	ret nz
.asm_4d5f5
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_4d3c8)
	ld [hld], a
	ld a, LOW(.Func_4d3c8)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, $e8
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld a, $07
	ld [hli], a
	xor a
	ld [wCurObjState], a
	ld l, OBJ_FLAGS
	res OBJFLAG_NO_COLLISION_F, [hl]
	res 4, [hl]
	ld de, Frameset_6a131
	jp SetObjectFramesetPtr

.Func_4d622:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_4d628:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [$d15f]
	and a
	ret z
	ld de, Frameset_6a0c8
	call SetObjectFramesetPtr
	ld a, $1e
	ld [hli], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_4d644)
	ld [hld], a
	ld a, LOW(.Func_4d644)
	ld [hld], a
	ret

.Func_4d644:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	ret z
	dec [hl]
	rra
	jp c, MoveObjectDown
	ret

.Func_4d655:
	ld hl, wSCYShake
	ld a, [wc08a]
	add [hl]
	ld [wSCY], a
	ld a, [wc08c]
	ld [wSCX], a
	ld a, [wCurObjState]
	ld e, a
	cp $2d
	jr z, .asm_4d67c
	ld a, [wGlobalCounter]
	and $0f
	jr nz, .asm_4d67c
	play_sfx SFX_06A
.asm_4d67c
	ld a, e
	jumptable
	dw .Func_4d7dc
	dw .Func_4d7e6
	dw .Func_4d83a
	dw .Func_4d844
	dw .Func_4d83a
	dw .Func_4d844
	dw .Func_4d899
	dw .Func_4d8b1
	dw .Func_4d83a
	dw .Func_4d844
	dw .Func_4d824
	dw .Func_4d83a
	dw .Func_4d844
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d859
	dw .Func_4d861
	dw .Func_4d86f
	dw .Func_4d876
	dw .Func_4d8e1
	dw .Func_4d8c9
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw Func_3191
	dw Func_31af
	dw Func_31cd
	dw Func_31eb
	dw Func_3209
	dw Func_3227
	dw Func_3245
	dw Func_3254
	dw .Func_4d844
	dw .Func_4d83a
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d750
	dw .Func_4d73e
	dw .Func_4d7dc
	dw ObjState_Fall
	dw .Func_4d7fd
	dw ObjState_BumpLeft
	dw ObjState_BumpRight
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw Func_3335
	dw Func_3344
	dw Func_31fa
	dw Func_31dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw ObjState_StandingFall
	dw Func_3371
	dw .Func_4d7dc
	dw Func_32cc
	dw Func_32db
	dw .Func_4d87d
	dw .Func_4d88b
	dw .Func_4d8f0
	dw .Func_4d8d8
	dw Func_3380
	dw Func_338f
	dw ObjState_FullThrowLeft
	dw ObjState_FullThrowRight
	dw Func_339e
	dw Func_33ad
	dw Func_31a0
	dw Func_31be
	dw Func_31dc
	dw Func_31fa
	dw Func_3218
	dw Func_3236
	dw Func_32cc
	dw Func_32db
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc
	dw .Func_4d7dc

.Func_4d73e:
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jp z, ObjState_Fall
	dec [hl]
	play_sfx SFX_VANISH
	ret

.Func_4d750:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjUnk07]
	cp $3d
	jr z, .asm_4d780
	ld hl, $d152
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wCurObjYPos
	ld a, [hli]
	cp e
	jr nz, .asm_4d7a4
	ld a, [hli]
	cp d
	jr nz, .asm_4d7a4
	ld a, [hli]
	cp c
	jr nz, .asm_4d7a4
	ld a, [hli]
	cp b
	jr nz, .asm_4d7a4
	xor a
	ld [$d14c], a
	jp HiddenFigureLeftHandFunc.asm_4d34c
.asm_4d780
	ld hl, $d156
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wCurObjYPos
	ld a, [hli]
	cp e
	jr nz, .asm_4d7a4
	ld a, [hli]
	cp d
	jr nz, .asm_4d7a4
	ld a, [hli]
	cp c
	jr nz, .asm_4d7a4
	ld a, [hli]
	cp b
	jr nz, .asm_4d7a4
	xor a
	ld [$d14d], a
	jp .asm_4d5f5
.asm_4d7a4
	ld l, OBJ_Y_POS
	ld a, [hli]
	cp e
	jr nz, .asm_4d7ae
	ld a, [hl]
	cp d
	jr z, .asm_4d7b1
.asm_4d7ae
	call MoveObjectUp
.asm_4d7b1
	ld l, OBJ_X_POS + 1
	ld a, [hld]
	cp b
	jr z, .asm_4d7bb
	jr c, .asm_4d7c6
	jr .asm_4d7c1
.asm_4d7bb
	ld a, [hl]
	cp c
	jr z, .asm_4d7c9
	jr c, .asm_4d7c6
.asm_4d7c1
	call MoveObjectLeft
	jr .asm_4d7c9
.asm_4d7c6
	call MoveObjectRight
.asm_4d7c9
	ld a, [wGlobalCounter]
	and $03
	ld hl, wCurObjFlags
	ld a, [hl]
	jr nz, .asm_4d7d8
	set 4, a
	ld [hl], a
	ret
.asm_4d7d8
	res 4, a
	ld [hl], a
	ret

.Func_4d7dc:
	ld hl, wCurObjState
	ld a, $30
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	ret

.Func_4d7e6:
	ld hl, wCurObjState
	ld a, $31
	ld [hld], a
	ld a, [$d15d]
	cp $01
	jr z, .asm_4d7f5
	ld a, $46
.asm_4d7f5
	ld [wCurObjStateDuration], a
	ld hl, wCurObjFlags
	res OBJFLAG_GRABBED_F, [hl]
.Func_4d7fd
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld l, OBJ_FLAGS
	res OBJFLAG_PRIORITY_F, [hl]
	xor a
	ld [$d15d], a
	ld l, OBJ_STATE
	ld a, $2d
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_4d81e
	ld de, Frameset_6a0fe
	jp SetObjectFramesetPtr
.asm_4d81e
	ld de, Frameset_6a0d4
	jp SetObjectFramesetPtr

.Func_4d824:
	play_sfx SFX_VANISH
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .Func_4d844
.Func_4d83a
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, $38
	jr .asm_4d84c
.Func_4d844
	ld hl, wCurObjAction
	ld a, NO_ACTIONS_FOR 15
	ld [hld], a
	ld a, $39
.asm_4d84c
	ld [hld], a
	ld l, OBJ_STATE_DURATION
	ld a, $04
	ld [hli], a
	inc l
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ret

.Func_4d859:
	ld hl, wCurObjState
	ld a, $44
	ld [hld], a
	jr .asm_4d867
.Func_4d861:
	ld hl, wCurObjState
	ld a, $45
	ld [hld], a
.asm_4d867
	ld l, OBJ_VAR_2
	ld a, $02
	ld [hli], a
	xor a
	ld [hli], a
	ret

.Func_4d86f:
	ld hl, wCurObjState
	ld a, $46
	ld [hld], a
	ret

.Func_4d876:
	ld hl, wCurObjState
	ld a, $47
	ld [hld], a
	ret

.Func_4d87d:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32ae
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_4d88b:
	ld hl, wCurObjVar2
	ld a, [hl]
	and a
	jp nz, Func_32bd
	ld a, $0f
	ld [wCurObjState], a
	ret

.Func_4d899:
	ld a, $01
	ld [$d15d], a
	ld hl, wCurObjState
	ld a, $36
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a
	ld a, $c0
	ld [hld], a
	ld a, $01
	ld [hld], a
	jp Func_3335

.Func_4d8b1:
	ld a, $01
	ld [$d15d], a
	ld hl, wCurObjState
	ld a, $37
	ld [hld], a
	dec l
	ld a, $41
	ld [hld], a
	ld a, $e0
	ld [hld], a
	ld a, $01
	ld [hld], a
	jp Func_3344

.Func_4d8c9:
	ld a, $01
	ld [$d15d], a
	ld hl, wCurObjState
	ld a, $49
	ld [hld], a
	ld l, OBJ_FLAGS
	set 2, [hl]
.Func_4d8d8:
	ld a, [wDirection]
	and a
	jp nz, Func_3353
	jr .Func_4d8e1
.Func_4d8e1:
	ld a, $01
	ld [$d15d], a
	ld hl, wCurObjState
	ld a, $48
	ld [hld], a
	ld l, OBJ_FLAGS
	set 2, [hl]
.Func_4d8f0:
	ld a, [wDirection]
	and a
	jp z, Func_3362
	jp .Func_4d8c9
; 0x4d8fa
