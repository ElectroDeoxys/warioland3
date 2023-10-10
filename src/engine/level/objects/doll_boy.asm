; wDollBoyActiveBarrels flags
DEF DOLLBOY_BARREL1 EQU 1 << 0
DEF DOLLBOY_BARREL2 EQU 1 << 1
DEF DOLLBOY_BARREL3 EQU 1 << 2
DEF DOLLBOY_DOLL    EQU 1 << 3

; wDollBoyHammerStage constants
	const_def
	const DOLLBOY_HAMMER_SHORT     ; 0
	const DOLLBOY_HAMMER_MID_SHORT ; 1
	const DOLLBOY_HAMMER_MID_LONG  ; 2
	const DOLLBOY_HAMMER_LONG      ; 3
DEF NUM_DOLLBOY_HAMMER_STAGES EQU const_value

DollBoyFunc:
	ld a, TRUE
	ld [wIsBossBattle], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	ld a, [hl]
	and $f0
	or $85
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50af8)
	ld [hld], a
	ld a, LOW(.Func_50af8)
	ld [hld], a
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $0b
	ld [hld], a
	ld a, $f4
	ld [hld], a
	ld a, $00
	ld [hld], a
	ld a, $e4
	ld [hld], a
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	ld a, $28
	ld [hli], a
	ret

.Func_50af8:
	ld a, [wCurObjFlags]
	rra
	rra
	ret nc
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_50b29)
	ld [hld], a
	ld a, LOW(.Func_50b29)
	ld [hld], a
	ld a, TRUE
	ld [w1d141], a
	xor a
	ld [wCurObjVar1], a
	ld [w1d147], a
	ld [wDollBoyHammerStage], a ; DOLLBOY_HAMMER_SHORT
	ld a, DOLLBOY_BARREL1 | DOLLBOY_BARREL2 | DOLLBOY_BARREL3
	ld [wDollBoyActiveBarrels], a
	ld a, $02
	ld [wcac3], a
	call UpdateLevelMusic
	ret

.Func_50b29:
	ld a, [wCurObjVar1]
	and a
	jp z, .asm_50c21
	cp $01
	jp z, .asm_50beb
	cp $08
	jr z, .asm_50b3e
	cp $09
	jr z, .asm_50b4b
	ret

.asm_50b3e
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	inc l
	ld a, $09
	ld [hli], a
	inc l
	xor a
	ld [hl], a
.asm_50b4b
	ld a, [wCurObjSubState]
	and $0f
	cp $04
	jr nz, .asm_50b61
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1 | DOLLBOY_BARREL2
	jr z, .asm_50b98
	cp DOLLBOY_BARREL1 | DOLLBOY_BARREL3
	jr z, .asm_50b76
	jr .asm_50bbf
.asm_50b61
	cp $03
	jr nz, .asm_50bbf
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1
	jr z, .asm_50b76
	cp DOLLBOY_BARREL3
	jr z, .asm_50bbf
	ld a, [w1d147]
	and a
	jr nz, .asm_50bbf
.asm_50b76
	ld a, [wCurObjVar3]
	cp $12
	jr nz, .asm_50b85
	ld de, Frameset_69646
	call SetObjectFramesetPtr
	jr .asm_50b92
.asm_50b85
	cp $1a
	jr nz, .asm_50b8e
	call DollBoyGroundShake
	jr .asm_50b92
.asm_50b8e
	cp $1e
	jr z, .asm_50be1
.asm_50b92
	ld bc, Data_60b80
	jp ApplyObjYMovement
.asm_50b98
	ld a, $01
	ld [w1d147], a
	ld a, [wCurObjVar3]
	cp $22
	jr nz, .asm_50bac
	ld de, Frameset_69646
	call SetObjectFramesetPtr
	jr .asm_50bb9
.asm_50bac
	cp $2a
	jr nz, .asm_50bb5
	call DollBoyGroundShake
	jr .asm_50bb9
.asm_50bb5
	cp $2e
	jr z, .asm_50be1
.asm_50bb9
	ld bc, Data_60ba0
	jp ApplyObjYMovement
.asm_50bbf
	ld a, [wCurObjVar3]
	cp $02
	jr nz, .asm_50bce
	ld de, Frameset_69646
	call SetObjectFramesetPtr
	jr .asm_50bdb
.asm_50bce
	cp $0a
	jr nz, .asm_50bd7
	call DollBoyGroundShake
	jr .asm_50bdb
.asm_50bd7
	cp $0e
	jr z, .asm_50be1
.asm_50bdb
	ld bc, Data_60880
	jp ApplyObjYMovement
.asm_50be1
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	inc l
	xor a
	ld [hl], a
	ret

.asm_50beb
	call Func_511a5
	ld a, [wCurObjVar1]
	cp $08
	ret z
	ld hl, wCurObjStateDuration
	dec [hl]
	jr z, .asm_50c17
	ld a, [hl]
	cp $13
	ret nz
	ld hl, wDollBoyHammerStage
	ld a, [hl]
	cp NUM_DOLLBOY_HAMMER_STAGES
	jr nz, .asm_50c08
	xor a ; DOLLBOY_HAMMER_SHORT
	ld [hl], a
.asm_50c08
	inc [hl]
	play_sfx SFX_0A2
	ld bc, ObjParams_DollBoyHammer
	jp CreateObjectAtRelativePos
.asm_50c17
	ld de, Frameset_69632
	call SetObjectFramesetPtr
	inc l
	xor a
	ld [hl], a
	ret

.asm_50c21
	ld a, [wTransformation]
	cp TRANSFORMATION_BOUNCY_WARIO
	jr nz, .asm_50c36
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_50fad)
	ld [hld], a
	ld a, LOW(.Func_50fad)
	ld [hld], a
	xor a
	ld [wcac3], a
	ret

.asm_50c36
	ld a, [wCurObjSubState]
	cp $82
	jr z, .asm_50c58
	call Func_511a5
	ld a, [wCurObjVar1]
	cp $08
	ret z
	ldh a, [rDIV]
	cp $fa
	ret c
	ld de, Frameset_6963b
	call SetObjectFramesetPtr
	ld a, $38
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret

.asm_50c58
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_50c6f)
	ld [hld], a
	ld a, LOW(.Func_50c6f)
	ld [hld], a
	ld l, OBJ_INTERACTION_TYPE
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_0B
	ld [hli], a
	ld a, $50
	ld [wCurObjStateDuration], a
	ret

.Func_50c6f:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_6964d
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50d88)
	ld [hld], a
	ld a, LOW(.Func_50d88)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ld [wCurObjVar1], a
	ld hl, Pals_51336
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	jp CopyAndApplyOBPals

.asm_50c96
	ld de, Frameset_696b9
	ld bc, ObjParams_DollBoyUnkObjLeft
	jr .asm_50ca4
.asm_50c9e
	ld de, Frameset_696b6
	ld bc, ObjParams_DollBoyUnkObjRight
.asm_50ca4
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50f49)
	ld [hld], a
	ld a, LOW(.Func_50f49)
	ld [hld], a
	xor a
	ld [wCurObjVar3], a
	ld [wcac3], a
	stop_sfx
	call SetObjectFramesetPtr
	ld a, $01
	ld [hli], a
	jp CreateObjectAtRelativePos

.asm_50cc4
	ld a, $32
	ld [hld], a
	jr .asm_50ccc
.asm_50cc9
	ld a, $33
	ld [hld], a
.asm_50ccc
	ld a, $0c
	ld [wCurObjStateDuration], a
	ld a, $02
	ld [wCurObjVar2], a
	ret

.asm_50cd7
	play_sfx SFX_0A4
	ld a, $5c
	ld [hld], a
	ld a, [hld]
	rlca
	jr c, .asm_50ceb
	ld de, Frameset_6967a
	jr .asm_50cee
.asm_50ceb
	ld de, Frameset_69675
.asm_50cee
	xor a
	ld [hl], a
	call SetObjectFramesetPtr
	ld a, $78
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld hl, Pals_51346
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	jp CopyAndApplyOBPals

.asm_50d06
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
	ld bc, FallingYVel_Light
	jp z, ApplyObjYMovement
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_50d3e
	ld a, [hl]
	cp $0a
	ret nz
	ld hl, Pals_51336
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	jp CopyAndApplyOBPals
.asm_50d3e
	ld l, OBJ_STATE
	xor a
	ld [hld], a
	ld a, [hl]
	rlca
	jr c, .asm_50d62
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_50d5b
	ld de, Frameset_69656
	ld b, $00
	jr .asm_50d7c
.asm_50d5b
	ld de, Frameset_6966a
	ld b, $20
	jr .asm_50d7c
.asm_50d62
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .asm_50d77
	ld de, Frameset_6965f
	ld b, $20
	jr .asm_50d7c
.asm_50d77
	ld de, Frameset_6964d
	ld b, $00
.asm_50d7c
	call SetObjectFramesetPtr
	ld [hl], b
	xor a
	ld [wCurObjVar1], a
	ld [wCurObjVar3], a
	ret

.Func_50d88:
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_01
	ld [hli], a
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jp z, .asm_50e4e
	cp $5a
	jp z, .asm_50e26
	cp $5b
	jp z, .asm_50e2b
	cp $5c
	jp z, .asm_50d06
	cp $02
	jp z, .asm_50cc4
	cp $03
	jp z, .asm_50cc9
	cp $32
	jp z, ObjState_BumpLeft
	cp $33
	jp z, ObjState_BumpRight
	cp $0b
	jp z, .asm_50c96
	cp $0c
	jp z, .asm_50c9e
	and $fe
	cp $08
	jp z, .asm_50cd7
	cp $04
	jr z, .asm_50de0
	ld a, [wCurObjVar1]
	inc a
	jp z, .asm_50cd7
	ld a, $01
	ld [wCurObjStateDuration], a
	jp .asm_50d06
.asm_50de0
	ld a, [wCurObjVar1]
	inc a
	jp nz, .asm_50cd7
	ld a, $48
	ld [hld], a
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld a, $2b
	ld [wCurObjStateDuration], a
	ld bc, .Func_50fb3
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, b
	ld [hld], a
	ld [hl], c
	ld l, OBJ_FLAGS
	set OBJFLAG_PRIORITY_F, [hl]
	ld l, OBJ_UNK_02
	ld e, $05
	farcall Func_ba42
	stop_music2
	ld de, Frameset_6967f
	jp SetObjectFramesetPtr

.asm_50e26
	ld bc, Data_60890
	jr .asm_50e2e
.asm_50e2b
	ld bc, Data_608a0
.asm_50e2e
	ld l, OBJ_STATE_DURATION
	ld a, [hl]
	and a
	jr z, .asm_50e36
	dec [hl]
	ret

.asm_50e36
	call ApplyObjYMovement
	ld a, [wCurObjVar3]
	cp $0a
	call z, DollBoyGroundShake
	ld hl, wCurObjVar1
	dec [hl]
	ret nz
	ld a, $3c
	ld [hl], a
	xor a
	ld [wCurObjState], a
	ret

.asm_50e4e
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_50e7e
	dec [hl]
	jr z, .asm_50e6c
	ld l, OBJ_VAR_3
	ld a, [hli]
	cp $17
	jr nz, .asm_50e66
	ld a, [hl]
	xor $80
	ld [hl], a
	call DollBoyGroundShake
.asm_50e66
	ld bc, Data_60c00
	jp ApplyObjYMovement
.asm_50e6c
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50e78
	ld de, Frameset_69656
	jp SetObjectFramesetPtr
.asm_50e78
	ld de, Frameset_6964d
	jp SetObjectFramesetPtr
.asm_50e7e
	inc l
	ld a, [hl]
	and a
	jr z, .asm_50e86
	dec [hl]
	jr .asm_50ebf
.asm_50e86
	ld a, [wCurObjScreenXPos]
	cp $78
	jr nc, .asm_50ebf
	cp $18
	jr c, .asm_50ebf
	ld a, [wWarioScreenYPos]
	cp $28
	jr c, .asm_50ebf
	ld b, a
	ld a, [wCurObjScreenYPos]
	cp $a0
	jr nc, .asm_50ebf
	sub b
	jr nc, .asm_50eab
	cp $e1
	jr nc, .asm_50ebf
	ld a, $5a
	jr .asm_50eb1
.asm_50eab
	cp $20
	jr c, .asm_50ebf
	ld a, $5b
.asm_50eb1
	ld l, OBJ_STATE
	ld [hld], a
	dec l
	xor a
	ld [hld], a
	dec l
	ld a, $1e
	ld [hld], a
	ld a, $14
	ld [hl], a
	ret

.asm_50ebf
	ld a, [wCurObjFramesetOffset]
	cp $06
	jr nz, .asm_50ed5
	ld a, [wCurObjFrameDuration]
	cp $01
	play_sfx z, SFX_0A2
.asm_50ed5
	ld hl, wCurObjYPos
	ld a, [hli]
	sub $04
	ldh [hYPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hYPosHi], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50f14
	ld a, [hli]
	sub $0c
	ldh [hXPosLo], a
	ld a, [hli]
	sbc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_50f0f
	ld a, [wCurObjFramesetOffset]
	cp $06
	jr c, .asm_50f0b
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_BOUNCY
	ld [hli], a
	jp MoveObjectLeft
.asm_50f0b
	ret
	jp MoveObjectLeft
.asm_50f0f
	ld de, Frameset_6966a
	jr .asm_50f3e
.asm_50f14
	ld a, [hli]
	add $0b
	ldh [hXPosLo], a
	ld a, [hli]
	adc $00
	ldh [hXPosHi], a
	call Func_3513
	and a
	jr nz, .asm_50f3b
	ld a, [wCurObjFramesetOffset]
	cp $06
	jr c, .asm_50f37
	ld hl, wCurObjInteractionType
	ld a, [hl]
	and HEAVY_OBJ
	or OBJ_INTERACTION_BOUNCY
	ld [hli], a
	jp MoveObjectRight
.asm_50f37
	ret
	jp MoveObjectRight
.asm_50f3b
	ld de, Frameset_6965f
.asm_50f3e
	call SetObjectFramesetPtr
	ld a, $20
	ld [hli], a
	xor a
	ld [wCurObjVar3], a
	ret

.Func_50f49:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_50f5e
	dec [hl]
	play_sfx SFX_049
.asm_50f5e
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
	ld bc, FallingYVel_Light
	jp z, ApplyObjYMovement
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_50f8e)
	ld [hld], a
	ld a, LOW(.Func_50f8e)
	ld [hld], a
	ld a, $3c
	ld [wCurObjStateDuration], a
	ret

.Func_50f8e:
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, $4f
	ld [hld], a
	ld a, $ad
	ld [hld], a
	ld a, [wCurObjSubState]
	rlca
	jr c, .asm_50fa7
	ld de, Frameset_6969a
	jp SetObjectFramesetPtr
.asm_50fa7
	ld de, Frameset_69695
	jp SetObjectFramesetPtr

.Func_50fad:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

.Func_50fb3:
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld a, [wCurObjScreenYPos]
	cp $d0
	jr nc, .asm_50ff3
	ld hl, wCurObjStateDuration
	ld a, [hl]
	and a
	jr z, .asm_50fed
	cp $1b
	jr nz, .asm_50fe2
	stop_sfx
	ld hl, Pals_51346
	ld de, wTempPals2 palette 4
	ld c, 4
	ld b, 2
	call CopyAndApplyOBPals
	ld hl, wCurObjStateDuration
.asm_50fe2
	dec [hl]
	play_sfx z, SFX_0A3
.asm_50fed
	ld bc, Data_60bd0
	jp ApplyObjYMovement
.asm_50ff3
	xor a
	ld [wCurObjFlags], a
	ld a, $03
	ld [wcac3], a
	call UpdateLevelMusic
	xor a
	ld [wIsBossBattle], a
	jp DollBoyGroundShake

DollBoyBarrel1Func:
	ld a, $03
	jr DollBoyBarrelFunc
DollBoyBarrel2Func:
	ld a, $02
	jr DollBoyBarrelFunc
DollBoyBarrel3Func:
	ld a, $01
DollBoyBarrelFunc:
	ld [wCurObjSubState], a
	ld hl, wCurObjFlags
	res OBJFLAG_INVISIBLE_F, [hl]
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_5103c)
	ld [hld], a
	ld a, LOW(.Func_5103c)
	ld [hld], a
	ld de, Frameset_6969f
	call SetObjectFramesetPtr
	ld l, OBJ_COLLBOX_RIGHT
	ld a, $07
	ld [hld], a
	ld a, $f8
	ld [hld], a
	ld a, $00
	ld [hl], a
	xor a
	ld [wCurObjVar1], a
	ret

.Func_5103c:
	ld a, $02
	ld [wCurObjFrameDuration], a
	ld a, [w1d141]
	and a
	ret z
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51050)
	ld [hld], a
	ld a, LOW(.Func_51050)
	ld [hld], a
	ret

.Func_51050:
	ld a, [wCurObjVar1]
	and a
	jr z, .asm_510b1
	cp $01
	jp z, .asm_51101
	cp $02
	jp z, .asm_51117
	cp $08
	jr z, .asm_51069
	cp $09
	jr z, .asm_51072
	ret

.asm_51069
	ld hl, wCurObjVar1
	ld a, $09
	ld [hli], a
	inc l
	xor a
	ld [hl], a
.asm_51072
	ld a, [wCurObjUnk07]
	cp $41
	jr nz, .asm_51080
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1 | DOLLBOY_BARREL2
	jr z, .asm_51096
.asm_51080
	ld a, [wCurObjVar3]
	cp $0a
	jr nz, .asm_5108c
	call DollBoyGroundShake
	jr .asm_51090
.asm_5108c
	cp $0e
	jr z, .asm_510ac
.asm_51090
	ld bc, Data_60880
	jp ApplyObjYMovement
.asm_51096
	ld a, [wCurObjVar3]
	cp $1a
	jr nz, .asm_510a2
	call DollBoyGroundShake
	jr .asm_510a6
.asm_510a2
	cp $1e
	jr z, .asm_510ac
.asm_510a6
	ld bc, Data_60b80
	jp ApplyObjYMovement
.asm_510ac
	xor a
	ld [wCurObjVar1], a
	ret

.asm_510b1
	call Func_511a5
	ld a, [wCurObjVar1]
	cp $08
	ret z
	ld a, [wCurObjUnk07]
	and %11
	ld e, a
	ld a, [wGlobalCounter]
	and %11
	cp e
	ret nz
	ld a, [w1d141]
	and a
	ret z
	ld a, [wDollBoyActiveBarrels]
	cp DOLLBOY_BARREL1
	jr z, .asm_510ed
	cp DOLLBOY_BARREL2
	jr z, .asm_510ed
	cp DOLLBOY_BARREL3
	jr z, .asm_510ed
	ld a, [wWarioScreenYPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenYPos]
	add $2a
	sub b
	cp $08
	ret c
	cp $f8
	ret nc
.asm_510ed
	xor a ; FALSE
	ld [w1d141], a
	ldh a, [rDIV]
	and %11
	ld b, a
	ld a, 70
	add b
	ld hl, wCurObjStateDuration
	ld [hli], a
	ld a, $01
	ld [hl], a
	ret

.asm_51101
	ld hl, wCurObjStateDuration
	dec [hl]
	ret nz
	ld de, Frameset_696a8
	call SetObjectFramesetPtr
	ld a, $f0
	ld [hli], a
	ld a, $02
	ld [hl], a
	xor a
	ld [wCurObjState], a
	ret

.asm_51117
	ld a, [wTransformation]
	cp TRANSFORMATION_BOUNCY_WARIO
	jr nz, .asm_51125
	ld hl, wCurObjStateDuration
	xor a
	ld [hli], a
	jr .asm_51148
.asm_51125
	ld hl, wCurObjFlags
	bit OBJFLAG_ON_SCREEN_F, [hl]
	jr z, .asm_5113b
	ld a, [wGlobalCounter]
	and %111
	play_sfx z, SFX_06A
.asm_5113b
	ld l, OBJ_STATE
	ld a, [hld]
	cp $05
	jr z, .asm_51159
	ld l, OBJ_STATE_DURATION
	dec [hl]
	ret nz
	inc l
	xor a
.asm_51148
	ld [hl], a
	ld de, Frameset_6969f
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51050)
	ld [hld], a
	ld a, LOW(.Func_51050)
	ld [hld], a
	jr .asm_5119f
.asm_51159
	ld a, [hl]
	and $f0
	ld [hld], a
	xor a
	ld [hld], a
	ld a, $01
	ld [hld], a
	ld de, Frameset_6969f
	call SetObjectFramesetPtr
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(Func_3317)
	ld [hld], a
	ld a, LOW(Func_3317)
	ld [hld], a
	play_sfx SFX_017
	ld hl, wDollBoyActiveBarrels
	ld a, [wCurObjUnk07]
	cp $41
	jr nz, .asm_5118a
	ld a, [hl]
	and $ff ^ DOLLBOY_BARREL1
	ld [hl], a
	ld a, DOLLBOY_DOLL
	jr .asm_5119c
.asm_5118a
	cp $42
	jr nz, .asm_51196
	ld a, [hl]
	and $ff ^ DOLLBOY_BARREL2
	ld [hl], a
	ld a, DOLLBOY_BARREL1 | DOLLBOY_DOLL
	jr .asm_5119c
.asm_51196
	ld a, [hl]
	and $ff ^ DOLLBOY_BARREL3
	ld [hl], a
	ld a, DOLLBOY_BARREL1 | DOLLBOY_BARREL2 | DOLLBOY_DOLL
.asm_5119c
	ld [w1d142], a
.asm_5119f
	ld a, TRUE
	ld [w1d141], a
	ret

Func_511a5:
	ld a, [wCurObjSubState]
	dec a
	ret z
	ld a, [wCurObjUnk07]
	and $0f
	ld b, a
	ld a, [w1d142]
	ld e, a
	and b
	ret z
	; unset flag in unk7 from w1d142
	ld a, b
	xor $ff
	and e
	ld [w1d142], a
	ld a, $08
	ld [wCurObjVar1], a
	ld hl, wCurObjSubState
	dec [hl]
	ret

DollBoyHammerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Init)
	ld [hld], a
	ld a, LOW(.Init)
	ld [hld], a
	ld l, OBJ_FLAGS
	set OBJFLAG_NO_COLLISION_F, [hl]
	ret

.Init:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Update)
	ld [hld], a
	ld a, LOW(.Update)
	ld [hld], a
	ld c, $2a
	ld a, [wWarioScreenYPos]
	add c
	ld b, a
	ld a, [wCurObjScreenYPos]
	add c
	sub b
	cp $ec
	ret c
	ld l, OBJ_VAR_1
	inc [hl]
	ret

.Update:
	ld a, [wCurObjState]
	and a
	jr nz, .hit
	ld a, [wCurObjVar1]
	and a
	jp nz, MoveObjectRight_Fast
	ld bc, Data_60860
	call ApplyObjYMovement
	ld a, [wDollBoyHammerStage]
	cp DOLLBOY_HAMMER_MID_SHORT
	jr nz, .check_mid_long
; mid-short
	ld bc, Data_60ae0
	jp ApplyObjXMovement
.check_mid_long
	cp DOLLBOY_HAMMER_MID_LONG
	jr nz, .check_long
; mid-long
	ld bc, Data_60b00
	jp ApplyObjXMovement
.check_long
	cp DOLLBOY_HAMMER_LONG
	jr nz, .short
; long
	ld bc, Data_60b30
	jp ApplyObjXMovement
.short
	ld bc, Data_60b60
	jp ApplyObjXMovement

.hit
	ld a, [wWarioScreenXPos]
	add $2a
	ld b, a
	ld a, [wCurObjScreenXPos]
	add $2a
	cp b
	jr c, .set_hit_left
	ld de, .HitRight
	jr .got_hit_dir
.set_hit_left
	ld de, .HitLeft
.got_hit_dir
	ld hl, wCurObjUpdateFunction + 1
	ld a, d
	ld [hld], a
	ld [hl], e
	xor a
	ld [wCurObjVar3], a
	play_sfx SFX_049
	ld bc, ObjParams_StarsCentre
	jp CreateObjectFromCurObjPos

.HitLeft:
	call MoveObjectLeft
	jr .hit_fall
.HitRight:
	call MoveObjectRight
.hit_fall
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ld bc, Data_60040
	jp ApplyObjYMovement

HammerPlatformSpawnerFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.Func_51282)
	ld [hld], a
	ld a, LOW(.Func_51282)
	ld [hld], a
	ld l, OBJ_SUBSTATE
	res OBJSUBFLAG_UNINITIALISED_F, [hl]
	set OBJSUBFLAG_UNK_4_F, [hl]
	ld a, 150
	ld [wCurObjStateDuration], a
	jr .Func_51296

.Func_51282:
	ld hl, wCurObjStateDuration
	dec [hl]
	jr nz, .Func_51296
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.Func_51296)
	ld [hld], a
	ld a, LOW(.Func_51296)
	ld [hld], a
	ld bc, ObjParams_HammerPlatform
	call CreateObjectAtRelativePos
.Func_51296:
	ld a, 2
	ld [wCurObjFrameDuration], a
	ld a, NO_ACTIONS_FOR 1
	ld [wCurObjAction], a
	ret

HammerPlatformFunc:
	ld hl, wCurObjUpdateFunction + 1
	ld a, HIGH(.MoveDown)
	ld [hld], a
	ld a, LOW(.MoveDown)
	ld [hld], a
	ld l, OBJ_Y_POS
	ld a, [hli]
	ld [wCurObjVar2], a
	ld a, [hl]
	ld [wCurObjVar3], a

.MoveDown:
	call SetOneWayPlatformAction
	ld hl, wCurObjState
	ld a, [hl]
	and a
	jr nz, .asm_512dc
	ld l, OBJ_STATE_DURATION
	dec [hl]
	jr z, .asm_512dc
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectDown_Slow
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call AddYOffset
	call HandleDownwardsFloorTransition
	jp MoveObjectDown
.asm_512dc
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveUp)
	ld [hld], a
	ld a, LOW(.MoveUp)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ret

.MoveUp:
	call SetOneWayPlatformAction
	ld hl, wCurObjVar2
	ld b, [hl]
	ld a, [wCurObjYPos + 0]
	cp b
	jr nz, .asm_512fe
	inc l
	ld b, [hl]
	ld a, [wCurObjYPos + 1]
	cp b
	jr z, .asm_51317
.asm_512fe
	ld l, OBJ_FLAGS
	bit OBJFLAG_STEPPED_F, [hl]
	jp z, MoveObjectUp_Slow
	res OBJFLAG_STEPPED_F, [hl]
	ld a, [wGlobalCounter]
	rra
	ret nc
	ld b, $01
	call SubYOffset
	call HandleUpwardsFloorTransition
	jp MoveObjectUp
.asm_51317
	ld l, OBJ_UPDATE_FUNCTION + 1
	ld a, HIGH(.MoveDown)
	ld [hld], a
	ld a, LOW(.MoveDown)
	ld [hld], a
	xor a
	ld [wCurObjState], a
	ld a, $8c
	ld [wCurObjStateDuration], a
	ret

DollBoyGroundShake:
	play_sfx SFX_061
	ld b, 24
	jp DoGroundShake

Pals_51336:
	rgb  0, 25,  1
	rgb 31, 31,  0
	rgb  0, 31, 20
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  0,  0
	rgb  0, 31, 20
	rgb 31, 31,  0

Pals_51346:
	rgb  0, 25,  1
	rgb 31, 31, 25
	rgb 31,  5,  5
	rgb  0,  0,  0

	rgb  0, 25,  1
	rgb  0,  0,  0
	rgb 31,  5,  5
	rgb 31, 31, 25
