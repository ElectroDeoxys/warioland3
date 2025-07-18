	SETCHARMAP temple

Func_ac000:
	ld h, b
	ld l, c
	res 1, l
	ld b, BANK("Credits OAM")
	call UpdateOWAnimation
	ld a, [bc]
	ret

Func_ac00b:
	ld h, b
	ld l, c
	res 1, l
	ld b, BANK("Credits OAM")
	call UpdateOWAnimation
	ld a, [bc]
	ret

Func_ac016:
	ld h, b
	ld l, c
	res 1, l
	ld b, BANK("Credits OAM")
	call UpdateOWAnimation
	ld a, [bc]
	ret

; unreferenced
Func_ac021:
	ld h, b
	ld l, c
	res 1, l
	ld b, BANK("Object Framesets")
	call UpdateOWAnimation
	ld a, [bc]
	ret

Func_ac02c:
	ld h, b
	ld l, c
	res 1, l
	ld b, BANK("Title Gfx")
	call UpdateOWAnimation
	ld a, [bc]
	ret

Func_ac037:
	ld h, b
	ld l, c
	res 1, l
	ld b, BANK("Overworld OAM 1")
	call UpdateOWAnimation
	ld a, [bc]
	ret

Func_ac042:
	ld b, BANK("Credits OAM")
	jp LoadOWSpriteWithScroll

Func_ac047:
	ld b, BANK("Credits OAM")
	jp LoadOWSpriteWithScroll

Func_ac04c:
	ld b, BANK("Credits OAM")
	jp LoadOWSpriteWithScroll

Func_ac051:
	ld b, BANK("Credits OAM")
	jp LoadOWSprite

Func_ac056:
	ld de, Frameset_76ca
	call Func_ac02c
	ld de, OAM_75c3
	ld b, BANK(OAM_75c3)
	jp LoadOWSprite

; return nz if animation is not finished yet
; e = new state
SetObjStateIfAnimationIsFinished:
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	set 2, l
	xor a
	ld [hli], a ; duration
	ld [hli], a ; frameset offset
	ld a, e
	ld [hl], a ; state
	ld b, h
	ld c, l
	ret

Func_ac074:
	ld bc, wCurSceneObjState
	call Func_ac0b6
	ld bc, wSceneObj1State
	jp Func_ac0b6

Func_ac080:
	ld bc, wSceneObj5State
	call Func_ac0b6
	ld bc, wSceneObj6State
	call Func_ac0b6
	ld bc, wSceneObj7State
	call Func_ac0b6
	ld bc, wSceneObj8State
	call Func_ac0b6
	ld bc, wSceneObj9State
	call Func_ac0b6
	ld bc, wSceneObj10State
	call Func_ac0b6
	ld bc, wSceneObj11State
	call Func_ac0b6
	ld bc, wSceneObj12State
	call Func_ac0b6
	ld bc, wSceneObj13State
	jp Func_ac0b6

Func_ac0b6:
	ld a, [bc]
	jumptable
	dw .Func_ac11c
	dw Func_ac056
	dw .Func_ac11d
	dw .Func_ac122
	dw .Func_ac127
	dw .Func_ac12c
	dw .Func_ac131
	dw .Func_ac13c
	dw .Func_ac141
	dw .Func_ac15f
	dw .Func_ac164
	dw .Func_ac169
	dw .Func_ac174
	dw .Func_ac17f
	dw .Func_ac18a
	dw .Func_ac195
	dw .Func_ac1a0
	dw .Func_ac1ab
	dw .Func_ac1b1
	dw .Func_ac1b7
	dw .Func_ac1d1
	dw .Func_ac1d7
	dw .Func_ac1dd
	dw .Func_ac1fb
	dw .Func_ac21e
	dw .Func_ac22c
	dw .Func_ac23a
	dw .Func_ac248
	dw .Func_ac24e

.asm_ac0f2
	call Func_ac016
.asm_ac0f5
	ld de, OAM_15e97d
	jp Func_ac04c

; unreachable
	call Func_ac016
	ld e, $00
.asm_ac100
	call SetObjStateIfAnimationIsFinished
	jr nz, .asm_ac0f5
	jr Func_ac0b6

; unreachable
	call Func_ac016
.asm_ac10a
	ld de, OAM_15e97d
	jp Func_ac051

; unreachable
	call Func_ac016
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jr nz, .asm_ac10a
	jr Func_ac0b6

.Func_ac11c:
	ret

.Func_ac11d:
	ld de, Frameset_15ed91
	jr .asm_ac0f2

.Func_ac122:
	ld de, Frameset_15ed94
	jr .asm_ac0f2

.Func_ac127:
	ld de, Frameset_15ed97
	jr .asm_ac0f2

.Func_ac12c:
	ld de, Frameset_15ed9a
	jr .asm_ac0f2

.Func_ac131:
	ld de, Frameset_15ed9d
	call Func_ac016
	ld e, $0a
	jp .asm_ac100

.Func_ac13c:
	ld de, Frameset_15edb3
	jr .asm_ac0f2

.Func_ac141:
	ld de, Frameset_15eda6
	call Func_ac016
	call .Func_ac14d
	jp .asm_ac0f5

.Func_ac14d:
	inc c
	ld a, [bc]
	inc a
	ld [bc], a
	cp $1e
	ret c
	xor a
	ld [bc], a
	play_sfx SFX_138
	ret

.Func_ac15f:
	ld de, Frameset_15edc0
	jr .asm_ac0f2

.Func_ac164:
	ld de, Frameset_15edc3
	jr .asm_ac0f2

.Func_ac169:
	ld de, Frameset_15edc6
	call Func_ac016
	ld e, $0a
	jp .asm_ac100

.Func_ac174:
	ld de, Frameset_15ede9
	call Func_ac016
	ld e, $0b
	jp .asm_ac100

.Func_ac17f:
	ld de, Frameset_15edf2
	call Func_ac016
	ld e, $0a
	jp .asm_ac100

.Func_ac18a:
	ld de, Frameset_15ee0f
	call Func_ac016
	ld e, $0a
	jp .asm_ac100

.Func_ac195:
	ld de, Frameset_15ee1e
	call Func_ac016
	ld e, $17
	jp .asm_ac100

.Func_ac1a0:
	ld de, Frameset_15ee3b
	call Func_ac016
	ld e, $0a
	jp .asm_ac100

.Func_ac1ab:
	ld de, Frameset_15ee44
	jp .asm_ac0f2

.Func_ac1b1:
	ld de, Frameset_15ee57
	jp .asm_ac0f2

.Func_ac1b7:
	ld de, Frameset_15ee64
	call Func_ac016
	call .Func_ac1c3
	jp .asm_ac0f5

.Func_ac1c3:
	ld a, [wOWUIObj1State]
	cp $09
	jp z, .asm_ac254
	cp $0b
	jp z, .asm_ac275
	ret

.Func_ac1d1:
	ld de, Frameset_15ee67
	jp .asm_ac0f2

.Func_ac1d7:
	ld de, Frameset_15ee70
	jp .asm_ac0f2

.Func_ac1dd:
	ld de, Frameset_15ee79
	call Func_ac016
	call .Func_ac1e9
	jp .asm_ac0f5

.Func_ac1e9:
	inc c
	ld a, [bc]
	inc a
	ld [bc], a
	cp $30
	ret c
	xor a
	ld [bc], a
	play_sfx SFX_08E
	ret

.Func_ac1fb:
	ld de, Frameset_15ee82
	call Func_ac016
	call .Func_ac207
	jp .asm_ac0f5

.Func_ac207:
	inc c
	ld a, [bc]
	inc a
	ld [bc], a
	cp $01
	jr z, .asm_ac215
	cp $28
	ret c
	xor a
	ld [bc], a
	ret
.asm_ac215
	play_sfx SFX_11A
	ret

.Func_ac21e:
	ld de, Frameset_681d2
	call Func_ac021
	ld de, OAM_18007b
	ld b, BANK(OAM_18007b)
	jp LoadOWSpriteWithScroll

.Func_ac22c:
	ld de, Frameset_68b12
	call Func_ac021
	ld de, OAM_18422f
	ld b, BANK(OAM_18422f)
	jp LoadOWSpriteWithScroll

.Func_ac23a:
	ld de, Frameset_68562
	call Func_ac021
	ld de, OAM_180ea7
	ld b, BANK(OAM_180ea7)
	jp LoadOWSpriteWithScroll

.Func_ac248:
	ld de, Frameset_15ee87
	jp .asm_ac0f2

.Func_ac24e:
	ld de, Frameset_15ee8a
	jp .asm_ac0f2

.asm_ac254
	inc c
	ld a, [wOWUIObj1Frame]
	ld e, a
	ld a, [bc]
	and a
	jr z, .asm_ac267
	dec a
	jr z, .asm_ac261
	ret
.asm_ac261
	ld d, $01
	ld a, $1a
	jr .asm_ac26b
.asm_ac267
	ld d, $ff
	ld a, $19
.asm_ac26b
	cp e
	ret nz
	ld a, [bc]
	xor $01
	ld [bc], a
	ld a, d
	add [hl]
	ld [hl], a
	ret

.asm_ac275
	inc c
	ld a, [wOWUIObj1Frame]
	ld e, a
	ld a, [bc]
	cp $80
	ret z
	and a
	jr z, .asm_ac286
	dec a
	jr z, .asm_ac29c
	jr .asm_ac2a6
.asm_ac286
	ld a, $00
	cp e
	ret nz
	ld d, $fc
	ld e, $ea
.asm_ac28e
	ld a, [bc]
	inc a
.asm_ac290
	ld [bc], a
	ld a, [wOWUIObj1YCoord]
	add d
	ld [hli], a
	ld a, [wOWUIObj1XCoord]
	add e
	ld [hld], a
	ret
.asm_ac29c
	ld a, $01
	cp e
	ret nz
	ld d, $f0
	ld e, $ec
	jr .asm_ac28e
.asm_ac2a6
	ld a, $02
	cp e
	ret nz
	ld a, $80
	ld d, $de
	ld e, $f9
	jr .asm_ac290

Func_ac2b2:
	ld bc, wCurSceneObjState
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj1State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj2State
	jp UpdateTempleSceneObjAnimation

UpdateTempleSceneObjs:
	ld bc, wSceneObj3State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj4State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj7State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj8State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj9State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj10State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj11State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj12State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj13State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj14State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj15State
	jp UpdateTempleSceneObjAnimation ; unnecessary jump

UpdateTempleSceneObjAnimation:
	ld a, [bc]
	jumptable
	dw .Func_ac358
	dw Func_ac056
	dw .Func_ac359
	dw .Func_ac35e
	dw .Func_ac363
	dw .Func_ac368
	dw .Func_ac36d
	dw .Func_ac372
	dw .Func_ac377
	dw .Func_ac37c
	dw .Func_ac381
	dw .Func_ac38b
	dw .Func_ac386
	dw .Func_ac399
	dw .Func_ac39e
	dw .Func_ac3a3
	dw .Func_ac3ad
	dw .Func_ac3b7
	dw .Func_ac3bc

; unreferenced
.Func_ac32e:
	call Func_ac000

.Func_ac331:
	ld de, OAM_1644a
	jp Func_ac042

.Func_ac337:
	call Func_ac000
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jr nz, .Func_ac331
	jr UpdateTempleSceneObjAnimation

.Func_ac343:
	call Func_ac00b
.Func_ac346:
	ld de, OAM_15e813
	jp Func_ac047

; unreferenced
.Func_ac34c:
	call Func_ac00b
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jr nz, .Func_ac346
	jr UpdateTempleSceneObjAnimation

.Func_ac358:
	ret

.Func_ac359:
	ld de, Frameset_15e796
	jr .Func_ac337

.Func_ac35e:
	ld de, Frameset_15e89c
	jr .Func_ac343

.Func_ac363:
	ld de, Frameset_15e89f
	jr .Func_ac343

.Func_ac368:
	ld de, Frameset_15e8a2
	jr .Func_ac343

.Func_ac36d:
	ld de, Frameset_15e8a5
	jr .Func_ac343

.Func_ac372:
	ld de, Frameset_15e8a8
	jr .Func_ac343

.Func_ac377:
	ld de, Frameset_15e88d
	jr .Func_ac343

.Func_ac37c:
	ld de, Frameset_15e896
	jr .Func_ac38e

.Func_ac381:
	ld de, Frameset_15e893
	jr .Func_ac38e

.Func_ac386:
	ld de, Frameset_15e899
	jr .Func_ac38e

.Func_ac38b:
	ld de, Frameset_15e890

.Func_ac38e:
	call Func_ac00b
	ld de, OAM_15e813
	ld b, BANK(OAM_15e813)
	jp LoadOWSprite

.Func_ac399:
	ld de, Frameset_15e8ab
	jr .Func_ac3c1

.Func_ac39e:
	ld de, Frameset_15e8b0
	jr .Func_ac3c1

.Func_ac3a3:
	ld de, Frameset_15e8b0
	call Func_ac00b
	ld e, $0d
	jr .Func_ac3d1

.Func_ac3ad:
	ld de, Frameset_15e8ab
	call Func_ac00b
	ld e, $0e
	jr .Func_ac3d1

.Func_ac3b7:
	ld de, Frameset_15e932
	jr .Func_ac3c1

.Func_ac3bc:
	ld de, Frameset_15e95c
	jr .Func_ac3c1

.Func_ac3c1:
	call Func_ac00b
.asm_ac3c4
	ld de, OAM_18c88a
	ld b, BANK(OAM_18c88a)
	jp LoadOWSpriteWithScroll

; unreferenced
	call Func_ac00b
	ld e, $00

.Func_ac3d1:
	call SetObjStateIfAnimationIsFinished
	jr nz, .asm_ac3c4
	jp UpdateTempleSceneObjAnimation

Func_ac3d9:
	ld bc, wCurSceneObjState
	call Func_ac409
	ld bc, wSceneObj1State
	call Func_ac409
	ld bc, wSceneObj2State
	call Func_ac409
	ld bc, wSceneObj3State
	call Func_ac409
	ld bc, wSceneObj4State
	call Func_ac409
	ld bc, wSceneObj5State
	jp Func_ac409

Func_ac3fd:
	ld bc, wSceneObj8State
	call Func_ac409
	ld bc, wSceneObj9State
	jp Func_ac409

Func_ac409:
	ld a, [bc]
	jumptable
	dw .Func_ac450
	dw Func_ac056
	dw .Func_ac451
	dw .Func_ac456
	dw .Func_ac45b
	dw .Func_ac460
	dw .Func_ac465
	dw .Func_ac46a
	dw .Func_ac46f
	dw .Func_ac474
	dw .Func_ac479
	dw .Func_ac48e
	dw .Func_ac493
	dw .Func_ac4a8
	dw .Func_ac4ad
	dw .Func_ac4b2
	dw .Func_ac4b7
	dw .Func_ac4bc
	dw .Func_ac4c1
	dw .Func_ac4c7
	dw .Func_ac4cd
	dw .Func_ac4e3
	dw .Func_ac4ee
	dw .Func_ac4f4

.Func_ac43b:
	call Func_ac000
.Func_ac43e:
	ld de, OAM_15e44a
	jp Func_ac042

.Func_ac444:
	call Func_ac000
	ld e, $00
.Func_ac449:
	call SetObjStateIfAnimationIsFinished
	jr nz, .Func_ac43e
	jr Func_ac409

.Func_ac450:
	ret

.Func_ac451:
	ld de, Frameset_15e741
	jr .Func_ac43b

.Func_ac456:
	ld de, Frameset_15e748
	jr .Func_ac43b

.Func_ac45b:
	ld de, Frameset_15e74b
	jr .Func_ac43b

.Func_ac460:
	ld de, Frameset_15e774
	jr .Func_ac43b

.Func_ac465:
	ld de, Frameset_15e77d
	jr .Func_ac43b

.Func_ac46a:
	ld de, Frameset_15e780
	jr .Func_ac43b

.Func_ac46f:
	ld de, Frameset_15e793
	jr .Func_ac43b

.Func_ac474:
	ld de, Frameset_15e7a3
	jr .Func_ac43b

.Func_ac479:
	ld de, Frameset_15e7a6
	call .Func_ac43b
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_0F3
	ret

.Func_ac48e:
	ld de, Frameset_15e7b7
	jr .Func_ac43b

.Func_ac493:
	ld de, Frameset_15e7c4
	call .Func_ac43b
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_0F4
	ret

.Func_ac4a8:
	ld de, Frameset_15e7ed
	jr .Func_ac43b

.Func_ac4ad:
	ld de, Frameset_15e7b7
	jr .Func_ac444

.Func_ac4b2:
	ld de, Frameset_15e783
	jr .Func_ac43b

.Func_ac4b7:
	ld de, Frameset_15e78a
	jr .Func_ac444

.Func_ac4bc:
	ld de, Frameset_15e796
	jr .Func_ac444

.Func_ac4c1:
	ld de, Frameset_15e7f0
	jp .Func_ac43b

.Func_ac4c7:
	ld de, Frameset_15e7f5
	jp .Func_ac43b

.Func_ac4cd:
	ld de, Frameset_aad0b
	call Func_ac037
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jp z, Func_ac409
	ld de, OAM_aab5c
	ld b, BANK(OAM_aab5c)
	jp LoadOWSpriteWithScroll

.Func_ac4e3:
	ld de, Frameset_15e7fa
	call Func_ac000
	ld e, $16
	jp .Func_ac449

.Func_ac4ee:
	ld de, Frameset_15e801
	jp .Func_ac43b

.Func_ac4f4:
	ld de, Frameset_15e80a
	jp .Func_ac43b

Func_ac4fa:
	ld hl, w2d14c
	ld a, [hl]
	and a
	play_sfx z, SFX_12A

	inc [hl]
	ld c, $24
	ld a, [hl]
	cp c
	jr c, .asm_ac514
	xor a
	ld [w2d14c], a
.asm_ac514
	ret

Func_ac515:
	ld hl, w2d14c
	inc [hl]
	ld a, [hl]
	cp $08
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_137
	ret

UpdateSceneWarioAnimation:
	call .DoAnimation
	ld a, [wSceneWarioState]
	and a
	ret z
	ld hl, wSceneWarioOAMPtr
	ld e, [hl]
	inc l
	ld d, [hl]
	ld a, [wSceneWarioOAMBank]
	ld b, a
	ld hl, wSceneWario
	ld a, [wSceneWarioIgnoreScroll]
	and a
	jp z, LoadOWSpriteWithScroll
	jp LoadOWSprite

.DoAnimation:
	ld a, [wSceneWarioState]
	jumptable

.table
	table_width 2
	dw .None                 ; SCENEWARIO_NONE
	dw .LookFront            ; SCENEWARIO_LOOK_FRONT
	dw .LookBack             ; SCENEWARIO_LOOK_BACK
	dw .TurnFrontLeft        ; SCENEWARIO_TURN_FRONT_RIGHT
	dw .TurnFrontRight       ; SCENEWARIO_TURN_FRONT_LEFT
	dw .TurnBackLeft         ; SCENEWARIO_TURN_BACK_LEFT
	dw .TurnBackRight        ; SCENEWARIO_TURN_BACK_RIGHT
	dw .WalkLeft             ; SCENEWARIO_WALK_LEFT
	dw .WalkRight            ; SCENEWARIO_WALK_RIGHT
	dw .CarryWalk            ; SCENEWARIO_CARRY_WALK
	dw .CarryIdle            ; SCENEWARIO_CARRY_IDLE
	dw .PickUp               ; SCENEWARIO_PICKUP
	dw .IdleLeft             ; SCENEWARIO_IDLE_LEFT
	dw .IdleRight            ; SCENEWARIO_IDLE_RIGHT
	dw .Nod                  ; SCENEWARIO_NOD
	dw .NodOnce              ; SCENEWARIO_NOD_ONCE
	dw .LookAround           ; SCENEWARIO_LOOK_AROUND
	dw .LookTurnForward      ; SCENEWARIO_LOOK_TURN_FORWARD
	dw .LookForward          ; SCENEWARIO_LOOK_FORWARD
	dw .LookAroundThenTurn   ; SCENEWARIO_LOOK_AROUND_THEN_TURN
	dw .LookTurnRight        ; SCENEWARIO_LOOK_TURN_RIGHT
	dw .OnFire               ; SCENEWARIO_ON_FIRE
	dw .CrashLandRight       ; SCENEWARIO_CRASH_LAND_RIGHT
	dw .CrashTumble          ; SCENEWARIO_CRASH_TUMBLE
	dw .CrashTumbleEnd       ; SCENEWARIO_CRASH_TUMBLE_END
	dw .StunnedRight         ; SCENEWARIO_STUNNED_RIGHT
	dw .LookUp               ; SCENEWARIO_LOOK_UP
	dw .CrashLandLeft        ; SCENEWARIO_CRASH_LAND_LEFT
	dw .StunnedLeft          ; SCENEWARIO_STUNNED_LEFT
	dw .LookMusicBox         ; SCENEWARIO_LOOK_MUSIC_BOX
	dw .PickUpMusicBox       ; SCENEWARIO_PICKUP_MUSIC_BOX
	dw .HoldMusicBox         ; SCENEWARIO_HOLD_MUSIC_BOX
	dw .LookUpSurprised      ; SCENEWARIO_LOOK_UP_SURPRISED
	dw .CarrySnapFingers     ; SCENEWARIO_CARRY_SNAP_FINGERS
	dw .Sleep                ; SCENEWARIO_SLEEP
	dw .WakeUp               ; SCENEWARIO_WAKE_UP
	dw .SitStill             ; SCENEWARIO_SIT_STILL
	dw .SitIdle              ; SCENEWARIO_SIT_IDLE
	dw .JumpAndBow           ; SCENEWARIO_JUMP_AND_BOW
	dw .SnapFingers          ; SCENEWARIO_SNAP_FINGERS
	dw .ShowMusicBoxes1      ; SCENEWARIO_SHOW_MUSIC_BOXES_1
	dw .ShowMusicBoxes5      ; SCENEWARIO_SHOW_MUSIC_BOXES_5
	dw .PanicJump            ; SCENEWARIO_PANIC_JUMP
	dw .Panic                ; SCENEWARIO_PANIC
	dw .Bow                  ; SCENEWARIO_BOW
	dw .ShowMusicBoxes2      ; SCENEWARIO_SHOW_MUSIC_BOXES_2
	dw .ShowMusicBoxes3      ; SCENEWARIO_SHOW_MUSIC_BOXES_3
	dw .ShowMusicBoxes4      ; SCENEWARIO_SHOW_MUSIC_BOXES_4
	dw .TurnFrontToBackRight ; SCENEWARIO_TURN_FRONT_TO_BACK_RIGHT
	dw .TurnFrontToBackLeft  ; SCENEWARIO_TURN_FRONT_TO_BACK_LEFT
	dw .TurnBackToRight      ; SCENEWARIO_TURN_BACK_TO_RIGHT
	dw .TurnBackToLeft       ; SCENEWARIO_TURN_BACK_TO_LEFT
	dw .TurnRightToFront     ; SCENEWARIO_TURN_RIGHT_TO_FRONT
	dw .TurnLeftToFront      ; SCENEWARIO_TURN_LEFT_TO_FRONT
	dw .TurnFrontToLeft      ; SCENEWARIO_TURN_FRONT_TO_LEFT
	dw .TurnFrontToRight     ; SCENEWARIO_TURN_FRONT_TO_RIGHT
	dw .TurnLeftEnd          ; SCENEWARIO_TURN_LEFT_END
	dw .TurnRightEnd         ; SCENEWARIO_TURN_RIGHT_END
	dw .PanicRunLeft         ; SCENEWARIO_PANIC_RUN_LEFT
	dw .PanicRunRight        ; SCENEWARIO_PANIC_RUN_RIGHT
	dw .IdleFront            ; SCENEWARIO_IDLE_FRONT
	assert_table_length NUM_SCENEWARIO_STATES

.None:
	ret

.LookFront:
	ld de, Frameset_14d18
	jr .UpdateAnimation

.LookBack:
	ld de, Frameset_14d15
	jr .UpdateAnimation

.TurnFrontLeft:
	ld de, Frameset_14cbe
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jr .SetStateIfFinished

.TurnFrontRight:
	ld de, Frameset_14cc5
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jr .SetStateIfFinished

.TurnBackLeft:
	ld de, Frameset_14d0b
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jr .SetStateIfFinished

.TurnBackRight:
	ld de, Frameset_14d10
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jr .SetStateIfFinished

.UpdateAnimation:
	ld a, [wSceneWarioOAMBank]
	ld b, a
	ld hl, wSceneWarioDuration
	jp UpdateOWAnimation

; sets Scene Wario' state to b
; if the animation was finished
.SetStateIfFinished:
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	ld a, b
	call SetSceneWarioState
	jp .DoAnimation

.WalkLeft:
	ld de, Frameset_149b4
	call .UpdateAnimation
	jp Func_ac4fa

.WalkRight:
	ld de, Frameset_149c5
	call .UpdateAnimation
	jp Func_ac4fa

.CarryWalk:
	ld de, Frameset_149fe
	call .UpdateAnimation
	jp Func_ac4fa

.CarryIdle:
	ld de, Frameset_14a20
	jr .UpdateAnimation

.PickUp:
	ld de, Frameset_163ec
	call .UpdateAnimation
	ld b, SCENEWARIO_CARRY_IDLE
	jp .SetStateIfFinished

.IdleLeft:
	ld de, Frameset_14252
	jr .UpdateAnimation

.IdleRight:
	ld de, Frameset_1425f
	jr .UpdateAnimation

.Nod:
	ld de, Frameset_d4de4
	jr .UpdateAnimation

.NodOnce:
	ld de, Frameset_d4de4
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.LookAround:
	ld de, Frameset_aa6a5
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_TURN_FORWARD
	call .SetStateIfFinished

.asm_ac65f
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret z
	ld hl, wSceneWarioFrame
	ld a, [w2d14c]
	and a
	jr z, .asm_ac67e
	dec a
	jr z, .asm_ac672
	ret
.asm_ac672
	ld a, [hl]
	cp $00
	ret z
	cp $04
	ret z
	xor a
	ld [w2d14c], a
	ret
.asm_ac67e
	ld a, [hl]
	cp $00
	jr z, .asm_ac688
	cp $04
	jr z, .asm_ac688
	ret
.asm_ac688
	play_sfx SFX_0F1
	ld a, $01
	ld [w2d14c], a
	ret

.LookTurnForward:
	ld de, Frameset_aa6c2
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_FORWARD
	jp .SetStateIfFinished

.LookForward:
	ld de, Frameset_aa6c7
	jp .UpdateAnimation

.LookAroundThenTurn:
	ld de, Frameset_aa6a5
	call .UpdateAnimation
	ld b, SCENEWARIO_TURN_LEFT_END
	call .SetStateIfFinished
	jr .asm_ac65f

.LookTurnRight:
	ld de, Frameset_aa6ca
	call .UpdateAnimation
	ld b, SCENEWARIO_TURN_RIGHT_END
	call .SetStateIfFinished
	jr .asm_ac65f

.OnFire:
	ld de, Frameset_aa8ec
	jp .UpdateAnimation

.CrashLandRight:
	ld de, Frameset_aa8f5
	call .UpdateAnimation
	ld b, SCENEWARIO_STUNNED_RIGHT
	jp .SetStateIfFinished

.CrashTumble:
	ld de, Frameset_aa902
	jp .UpdateAnimation

.CrashTumbleEnd:
	ld de, Frameset_aa902
	call .UpdateAnimation
	ld b, SCENEWARIO_STUNNED_RIGHT
	jp .SetStateIfFinished

.StunnedRight:
	ld de, Frameset_aa90d
	jp .UpdateAnimation

.LookUp:
	ld de, Frameset_aa913
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	call .SetStateIfFinished
	ld a, [wSceneWarioState]
	cp SCENEWARIO_IDLE_RIGHT
	ret z
	ld hl, wSceneWarioFrame
	ld a, [w2d14c]
	and a
	jr z, .asm_ac718
	dec a
	jr z, .asm_ac70a
	dec a
	jr z, .asm_ac713
	ret
.asm_ac70a
	ld a, [hl]
	cp $0d
.asm_ac70d
	ret z
	xor a
	ld [w2d14c], a
	ret
.asm_ac713
	ld a, [hl]
	cp $0c
	jr .asm_ac70d
.asm_ac718
	ld a, [hl]
	cp $0c
	jr z, .asm_ac730
	cp $0d
	jr z, .asm_ac722
	ret
.asm_ac722
	play_sfx SFX_0F2
	ld a, $01
.asm_ac72c
	ld [w2d14c], a
	ret
.asm_ac730
	play_sfx SFX_011
	ld a, $02
	jr .asm_ac72c

.CrashLandLeft:
	ld de, Frameset_aa924
	call .UpdateAnimation
	ld b, SCENEWARIO_STUNNED_LEFT
	jp .SetStateIfFinished

.StunnedLeft:
	ld de, Frameset_aa931
	jp .UpdateAnimation

.LookMusicBox:
	ld de, Frameset_aab27
	call .UpdateAnimation
	ld b, SCENEWARIO_HOLD_MUSIC_BOX
	jp .SetStateIfFinished

.PickUpMusicBox:
	ld de, Frameset_aab32
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_UP_SURPRISED
	jp .SetStateIfFinished

.HoldMusicBox:
	ld de, Frameset_aab3f
	jp .UpdateAnimation

.LookUpSurprised:
	ld de, Frameset_aab42
	jp .UpdateAnimation

.CarrySnapFingers:
	ld de, Frameset_aab45
	call .UpdateAnimation
	ld b, SCENEWARIO_CARRY_IDLE
	jp .SetStateIfFinished

.Sleep:
	ld de, Frameset_aaccb
	call .UpdateAnimation
	ld a, [wOWAnimationFinished]
	ld [w2d14e], a
	cp $ff
	ret nz
	play_sfx SFX_0F5
	ret

.WakeUp:
	ld de, Frameset_aace2
	call .UpdateAnimation
	ld b, SCENEWARIO_SIT_IDLE
	jp .SetStateIfFinished

.SitStill:
	ld de, Frameset_aacf7
	jp .UpdateAnimation

.SitIdle:
	ld de, Frameset_aacfa
	jp .UpdateAnimation

.JumpAndBow:
	ld de, Frameset_ab03c
	call .UpdateAnimation
	call .Func_ac7b7
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished
.Func_ac7b7:
	ld a, [wSceneWarioFrame]
	cp $07
	ret nz
	ld a, [wSceneWarioUnk7]
	and a
	ret nz
	xor $1
	ld [wSceneWarioUnk7], a
	play_sfx SFX_LAND
	ret

.SnapFingers:
	ld de, Frameset_ab06b
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.ShowMusicBoxes1:
	ld de, Frameset_ab08c
	call .UpdateAnimation
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_2
	jp .SetStateIfFinished

.ShowMusicBoxes5:
	ld de, Frameset_ab098
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.PanicJump:
	ld de, Frameset_ab09d
	call .UpdateAnimation
	call .Func_ac7ff
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished
.Func_ac7ff:
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_LAND
	ret

.Panic:
	ld de, Frameset_ab09d
	jp .UpdateAnimation

.Bow:
	ld de, Frameset_ab0ac
	jp .UpdateAnimation

.ShowMusicBoxes2:
	ld de, Frameset_ab14d
	call .UpdateAnimation
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_3
	jp .SetStateIfFinished

.ShowMusicBoxes3:
	ld de, Frameset_ab160
	jp .UpdateAnimation

.ShowMusicBoxes4:
	ld de, Frameset_ab163
	call .UpdateAnimation
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_5
	jp .SetStateIfFinished

.TurnFrontToBackRight:
	ld de, Frameset_1fc439
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.TurnFrontToBackLeft:
	ld de, Frameset_1fc446
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.TurnBackToRight:
	ld de, Frameset_1fc453
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jp .SetStateIfFinished

.TurnBackToLeft:
	ld de, Frameset_1fc45a
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jp .SetStateIfFinished

.TurnRightToFront:
	ld de, Frameset_1fc461
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_FRONT
	jp .SetStateIfFinished

.TurnLeftToFront:
	ld de, Frameset_1fc46a
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_FRONT
	jp .SetStateIfFinished

.TurnFrontToLeft:
	ld de, Frameset_1fc473
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jp .SetStateIfFinished

.TurnFrontToRight:
	ld de, Frameset_1fc47c
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jp .SetStateIfFinished

.TurnLeftEnd:
	ld de, Frameset_1fc485
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jp .SetStateIfFinished

.TurnRightEnd:
	ld de, Frameset_1fc488
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jp .SetStateIfFinished

.PanicRunLeft:
	ld de, Frameset_16b5a
.asm_ac8a7
	call .UpdateAnimation
	jp Func_ac515

.PanicRunRight:
	ld de, Frameset_16b63
	jr .asm_ac8a7

.IdleFront:
	ld de, Frameset_1fc316
	jp .UpdateAnimation

; unreferenced?
DebugSceneWario:
	ld a, [wJoypadPressed]
	ld b, a
	ld a, [wDebugSceneWarioState]
	bit B_PAD_RIGHT, b
	jr nz, .d_right
	bit B_PAD_LEFT, b
	ret z
; d_left
	and a
	jr z, .got_state
	dec a
	jr .got_state
.d_right
	cp NUM_SCENEWARIO_STATES - 1
	jr nc, .got_state
	inc a
.got_state
	ld [wDebugSceneWarioState], a
;	fallthrough

SetSceneWarioState:
	ld [wSceneWarioState], a
	ld b, 0
	cp SCENEWARIO_GROUP_00
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_01
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_02
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_03
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_04
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_05
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_06
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_07
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_08
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_19
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_10
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_11
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_12
	jr c, .update_state_group
	inc b
	cp SCENEWARIO_GROUP_13
	jr c, .update_state_group ; unnecessary jump

.update_state_group
	ld hl, wSceneWarioStateGroup
	ld a, [hl]
	cp b
	call nz, .LoadGfx
	ld hl, wSceneWarioDuration
	xor a
	ld [hli], a
	ld [hl], a
	ld [w2d14c], a
	ret

.LoadGfx:
	ld a, b
	ld [hli], a ; wSceneWarioStateGroup
	add a ; *2
	ld c, a
	add a ; *4
	add c ; *6
	ld de, .WarioSpritePointers
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, [de]
	ld [hli], a ; wSceneWarioOAMPtr
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a ; wSceneWarioOAMBank
	inc de
	ld a, [de]
	ld [wHDMABank], a

	ld hl, wHDMA
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $80 dma_tiles
	ld [hl], a

	xor a
	ld [wHDMADestVRAMBank], a
	ret

MACRO scene_wario_gfx
	dab \1 ; sprite
	dba \2 ; tiles
ENDM

.WarioSpritePointers:
	scene_wario_gfx OAM_14a82,  WarioIdleGfx  ; SCENEWARIO_GROUP_00
	scene_wario_gfx OAM_1426c,  WarioWalkGfx  ; SCENEWARIO_GROUP_01
	scene_wario_gfx OAM_1606a,  WarioThrowGfx ; SCENEWARIO_GROUP_02
	scene_wario_gfx OAM_14000,  WarioIdleGfx  ; SCENEWARIO_GROUP_03
	scene_wario_gfx OAM_d49cc,  WarioClearGfx ; SCENEWARIO_GROUP_04
	scene_wario_gfx OAM_aa5fe,  WarioClearGfx ; SCENEWARIO_GROUP_05
	scene_wario_gfx OAM_aa6e7,  WarioUnk2Gfx  ; SCENEWARIO_GROUP_06
	scene_wario_gfx OAM_aa934,  WarioUnk3Gfx  ; SCENEWARIO_GROUP_07
	scene_wario_gfx OAM_aab5c,  WarioSleepGfx ; SCENEWARIO_GROUP_08
	scene_wario_gfx OAM_aad1e,  WarioUnk4Gfx  ; SCENEWARIO_GROUP_19
	scene_wario_gfx OAM_ab0c5,  WarioUnk5Gfx  ; SCENEWARIO_GROUP_10
	scene_wario_gfx OAM_1fc31b, WarioIdleGfx  ; SCENEWARIO_GROUP_11
	scene_wario_gfx OAM_1673c,  WarioHotGfx   ; SCENEWARIO_GROUP_12
	scene_wario_gfx OAM_1fc000, WarioClearGfx ; SCENEWARIO_GROUP_13

	ret ; stray ret

InvalidMusicBoxAction:
	debug_nop

Func_ac9ba:
	farcall Func_84e86
	ret

Func_ac9ca:
	farcall Func_84e43
	ld a, [wPalConfig1TotalSteps]
	and a
	ret nz
	ld hl, w2d014
	ld [hld], a
	inc [hl]
	ret

Func_ac9e4:
	ld hl, wPalConfig2
	jr Func_ac9ec

Func_ac9e9:
	ld hl, wPalConfig1
;	fallthrough

Func_ac9ec:
	ld c, $5
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Data_ac9f5:
	db LOW(rBGPI), BGPI_AUTOINC
	db 8 ; number of pals
	bigdw wTempPals1 ; source pals

Data_ac9fa:
	db LOW(rBGPI), BGPI_AUTOINC
	db 8 ; number of pals
	bigdw wTempBGPals ; source pals

Data_ac9ff:
	db LOW(rOBPI), OBPI_AUTOINC
	db 1 ; number of pals
	bigdw wTempOBPals ; source pals

Data_aca04:
	db LOW(rOBPI), OBPI_AUTOINC
	db 8 ; number of pals
	bigdw wTempPals2 ; source pals

Func_aca09:
	ld hl, wTempPals2
	ld de, wTempOBPals
	ld b, 8 palettes
	call CopyHLToDE
	ld hl, wTempPals1
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE
	ret

; unreferenced
Func_aca20:
	ld hl, wTempPals1
	jr Func_aca28

Func_aca25:
	ld hl, wTempPals2
Func_aca28:
	ld c, 4 palettes
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .loop
	ret

; moves scene Wario 1.5 pixels to left
; if d-left is pressed, moves 2 pixels
ApplySceneWarioMovementLeft:
	ld a, [wJoypadDown]
	swap a
	rra
	ld b, a
	ld a, [wGlobalCounter]
	or b
	ld hl, wSceneWarioXCoord
	dec [hl]
	bit 0, a ; check if d-left is down OR wGlobalCounter is odd
	jr z, .done
	dec [hl]
.done
	ld a, [hl]
	and $fe
	ret

; moves scene Wario 1.5 pixels to right
; if d-right is pressed, moves 2 pixels
ApplySceneWarioMovementRight:
	ld a, [wJoypadDown]
	swap a
	ld b, a
	ld a, [wGlobalCounter]
	or b
	ld hl, wSceneWarioXCoord
	inc [hl]
	bit 0, a ; check if d-right is down OR wGlobalCounter is odd
	jr z, .done
	inc [hl]
.done
	ld a, [hl]
	and $fe
	ret

Func_aca63:
	ld hl, wOWUIObj1XCoord
	dec [hl]
	ret

; unreferenced
Func_aca68:
	ld hl, wOWUIObj1XCoord
	inc [hl]
	ret

Func_aca6d:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret

InitTextPrinting:
	call ClearText

	ld de, wTextLine1
	ld hl, wTextBuffer
	ld b, TEXT_LINE_LENGTH
	call CopyHLToDE

	xor a
	ld hl, wTextPrintInfo
	ld bc, wTextPrintInfoEnd - wTextPrintInfo
	call WriteAToHL_BCTimes

	; set text arrow object
	ld hl, wSceneObj1
	ld a, $8e
	ld [hli], a ; y
	ld a, $98
	ld [hli], a ; x
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr Func_aca6d

Func_aca9e:
	call PrintTextWithHeader
	ld a, [wCurTextLine]
	cp $80
	ret nz
	ld hl, wCurTextBufferPage
	inc [hl]
	jr Func_aca6d

LoadCurTextPageBufferPage:
	ld a, [wCurTextBufferPage]
	ld b, $00
	swap a
	add a
	rl b
	add a
	rl b
	ld c, a ; *$40
	ld hl, wTextBuffer
	add hl, bc
	ld de, wTextLine2
	ld b, 3 * TEXT_LINE_LENGTH
	call CopyHLToDE
	xor a
	ld [wCurTextLine], a
	jr Func_aca6d

Func_acacd:
	ld a, 1
	ld hl, wCurTextBufferPage
	cp [hl]
	jr z, .clear
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
.clear
	call ClearTextboxExceptHeader
	jr Func_aca6d

Func_acae7:
	call PrintTextWithoutHeader
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_aca6d

Func_acaf3:
	ld hl, wCurTextBufferPage
	inc [hl]
	ld a, [hl]
	ld b, $00
	swap a
	add a
	rl b
	add a
	rl b
	ld c, a ; *$40
	ld hl, wTextBuffer
	add hl, bc
	ld a, [hl]
	cp "▼"
	jp z, .asm_acb20 ; can be jr
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	ld hl, w2d013
	dec [hl]
	dec [hl]
	dec [hl]
	xor a
	ld [w2d014], a
	ret

.asm_acb20
	call Func_aca6d
	scf
	ret

_InitTempleScene:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	stop_music2

	ld a, BANK("WRAM2")
	ldh [rWBK], a

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a

	call VBlank_PrologueEpilogue
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM

	ld hl, Pals_86a4d
	ld b, BANK(Pals_86a4d)
	call LoadFarPalsToTempPals1
	decompress_tiles1 FontGfx, v1Tiles0
	ld hl, TempleGfx
	ld b, BANK(TempleGfx)
	call LoadFarTiles
	ld hl, TempleTilemap
	ld b, BANK(TempleTilemap)
	call LoadFarBGMap
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, TempleAttrmap
	ld b, BANK(TempleAttrmap)
	call LoadFarBGMap
	xor a
	ldh [rVBK], a
	call FillClearedTextBuffer

	ld a, GOLD_MUSIC_BOX
	call IsTreasureCollected
	ld a, TEMPLE_SCENE_ENTERING
	jp z, .set_regular_temple_scene ; not collected
	ld hl, wGameModeFlags
	bit MODE_GAME_CLEARED_F, [hl]
	jr z, .set_hidden_figure_reveal_scene
	bit MODE_TIME_ATTACK_F, [hl]
	jp z, .set_regular_temple_scene
.set_hidden_figure_reveal_scene
	ld a, TEMPLE_SCENE_HIDDEN_FIGURE_REVEAL
	ld [wTempleScene], a

	decompress_tiles1 TempleMusicBoxSceneGfx, v1Tiles0
	decompress_tilemap HiddenFigureCutsceneTilemap, v0BGMap1
	decompress_attrmap HiddenFigureCutsceneAttrmap, v1BGMap1

	ld a, [wLanguage]
	and a
	ld hl, TextJP_HiddenFigureReplenishPower
	jr z, .japanese1
	ld hl, TextEN_HiddenFigureReplenishPower
.japanese1
	ld a, BANK(TextJP_HiddenFigureReplenishPower) ; aka TextEN_HiddenFigureReplenishPower
	ld [wTempBank], a
	ld bc, wTextBuffer
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jr .asm_acc68

.set_regular_temple_scene
	ld [wTempleScene], a
	ld a, [wLanguage]
	and a
	ld hl, TextJP_HiddenFigureHeadFor
	jr z, .japanese2
	ld hl, TextEN_HiddenFigureHeadFor
.japanese2
	ld a, BANK(TextJP_HiddenFigureHeadFor) ; aka TextEN_HiddenFigureHeadFor
	ld [wTempBank], a
	ld bc, wTextBuffer
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	call LoadNextObjectiveText

.asm_acc68
	ld a, $60
	ld [w1d140], a
	ld a, $e8
	ld [wDollBoyNoFlashingBarrel], a
	ld a, SCENEWARIO_GROUP_NONE
	ld [wSceneWarioStateGroup], a

	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	call UpdateSceneWarioAnimation

	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld a, [wLCDCFlagsToFlip]
	ld b, a
	and a
	ld a, LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_WIN_9C00 | LCDC_ON
	jr z, .got_lcdc_config
	xor b
.got_lcdc_config
	ldh [rLCDC], a

	xor a
	ld [wLCDCFlagsToFlip], a

	ld hl, wSubState
	inc [hl]
	ret

ClearGeneralSceneRAM:
	ld hl, STARTOF("WRAM2 2")
	ld bc, SIZEOF("WRAM2 2")
	xor a
	call WriteAToHL_BCTimes
	ret

ClearSceneObjsRAM:
	ld hl, wSceneWario
	ld bc, wSceneObjsEnd - wSceneWario
	xor a
	call WriteAToHL_BCTimes
	ret

VBlank_PrologueEpilogue:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, BANK("WRAM2")
	ldh [rWBK], a

	; apply scroll
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [wHDMABank]
	and a
	jr z, .skip_hdma_config
	ld b, a
	xor a
	ld [wHDMABank], a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld a, [wHDMADestVRAMBank]
	ldh [rVBK], a
	ld hl, wHDMA
	ld a, [hli]
	ld c, LOW(rVDMA_SRC_HIGH)
	ld [$ff00+c], a ; rVDMA_SRC_HIGH
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rVDMA_SRC_LOW
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rVDMA_DEST_HIGH
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rVDMA_DEST_LOW
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rVDMA_LEN
	pop af
	bankswitch
.skip_hdma_config

	ld hl, wPendingCharDest
	ld a, [hl]
	and a
	jr z, .skip_char
	ld e, a
	xor a
	ld [hli], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [de], a ; wPendingCharTile
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld a, [hl] ; wPendingCharAttr
	ld [de], a
.skip_char

	xor a
	ldh [rVBK], a
	ld hl, wPalConfig1
	ld a, [hl]
	and a
	call nz, ApplyPalConfig

	ld hl, wPalConfig2
	ld a, [hl]
	and a
	call nz, ApplyPalConfig

	ld a, [wLCDCFlagsToFlip]
	and a
	jr z, .dma_transfer
	ld hl, rLCDC
	xor [hl]
	ld [hl], a
	xor a
	ld [wLCDCFlagsToFlip], a

.dma_transfer
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.end

_UpdateTempleScene:
	call .UpdateScene
	call Func_ac2b2
	call UpdateSceneWarioAnimation
	call UpdateTempleSceneObjs
	call ClearUnusedVirtualOAM
	ret

.NextState:
	ld hl, wTempleSceneCounter
	xor a
	ld [hld], a
	inc [hl] ; w2da04
	ret

.UpdateScene:
	ld hl, wTempleSceneCounter
	inc [hl]
	ld c, l
	ld b, h
	ld a, [wTempleScene]
	jumptable

	dw .Entering               ; TEMPLE_SCENE_ENTERING
	dw .TalkToHiddenFigure     ; TEMPLE_SCENE_TALKING
	dw .Exiting                ; TEMPLE_SCENE_EXITING
	dw HiddenFigureRevealScene ; TEMPLE_SCENE_HIDDEN_FIGURE_REVEAL

.Entering:
	ld a, [w2da04]
	and a
	jr z, .start
	dec a
	jr z, .walk_right
	dec a
	jr z, .turn
	dec a
	jr z, .look_back
	dec a
	jr z, .nod
	ret

.start
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jr .NextState

.walk_right
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jr .NextState

.turn
	ld a, [wTempleSceneCounter]
	cp 8
	ret c
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jr .NextState

.look_back
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	jr .NextState

.nod
	ld a, [wTempleSceneCounter]
	cp 50
	ret c
	ld a, SCENEWARIO_NOD
	call SetSceneWarioState
	ld hl, wTempleSceneCounter
	xor a
	ld [hld], a
	ld [hl], a ; w2da04
	xor a
	ld [wCurTextLine], a
	ld [wTextDelayCounter], a
	ld hl, wTempleScene
	ld [hl], TEMPLE_SCENE_TALKING
	ret

.TalkToHiddenFigure:
	call .DelayAndPlayTempleMusic
	ld a, [wIsNextObjectiveTheTemple]
	and a
	call z, PrintTextWithHeader
	ld a, [wJoypadPressed]
	and PAD_B | PAD_LEFT
	jr nz, .start_exit
	ret
.start_exit
	ld hl, wTempleSceneCounter
	xor a
	ld [hld], a
	ld [hl], a ; w2da04
	call ClearTextbox
	ld hl, wTempleScene
	ld [hl], TEMPLE_SCENE_EXITING
	ret

.Exiting:
	ld a, [w2da04]
	and a
	jr z, .turn_left
	dec a
	jr z, .idle_left
	dec a
	jr z, .start_walk
	dec a
	jr z, .walk_left
	dec a
	jr z, .outside
	ret

.turn_left
	ld a, SCENEWARIO_TURN_BACK_TO_LEFT
	call SetSceneWarioState
	jp .NextState

.idle_left
	ld a, [wSceneWarioState]
	cp SCENEWARIO_IDLE_LEFT
	ret nz
	jp .NextState

.start_walk
	ld a, [wTempleSceneCounter]
	cp 4
	ret c
	ld a, SCENEWARIO_WALK_LEFT
	call SetSceneWarioState
	jp .NextState

.walk_left
	ld a, [wJoypadPressed]
	bit B_PAD_B, a
	jr nz, .exit
	call ApplySceneWarioMovementLeft
	cp $f0
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp .NextState

.outside
	ld a, [wTempleSceneCounter]
	cp $0a
	ret c
.exit
	stop_sfx
	ld a, $01
	ld [w2d14c], a
	ld a, SST_OVERWORLD_08
	ld [wSubState], a
	scf
	ret

.DelayAndPlayTempleMusic:
	ld a, [wTempleMusicIsPlaying]
	and a
	ret nz ; already playing
	ld hl, wTempleMusicDelayCounter
	inc [hl]
	ld a, [hl]
	cp 90
	ret c
	xor a
	ld [hl], a
	play_music2 MUSIC_THE_TEMPLE
	ld a, TRUE
	ld [wTempleMusicIsPlaying], a
	ret

ClearTextbox:
	ld d, 6 * TILEMAP_WIDTH ; dest lo
	ld e, $8 dma_tiles
	jr ClearTextboxAtCoord

ClearTextboxExceptHeader:
	ld d, 7 * TILEMAP_WIDTH ; dest lo
	ld e, $6 dma_tiles
;	fallthrough

ClearTextboxAtCoord:
	ld b, HIGH(v0BGMap0 + $100) - $80 ; dest hi
	ld a, [wBGMapToPrintText]
	and a
	jr z, .got_dest
	ld b, HIGH(v0BGMap1 + $100) - $80 ; dest hi
.got_dest
	ld hl, wHDMA
	ld a, HIGH(wClearedTextBuffer)
	ld [hli], a
	ld a, LOW(wClearedTextBuffer)
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hl], a
	ld a, BANK(@)
	ld [wHDMABank], a
	xor a
	ld [wHDMADestVRAMBank], a
	ld [wPendingCharDest + 0], a
	ret

FillClearedTextBuffer:
	ld hl, wClearedTextBuffer
	ld a, "@"
	ld bc, 8 * TEXT_LINE_LENGTH
	call WriteAToHL_BCTimes
	ret

ClearText:
	ld a, "@"
	ld hl, wText
	ld bc, 4 * TEXT_LINE_LENGTH
	call WriteAToHL_BCTimes
	ret

PrintTextWithHeader:
	ld hl, wTextDelayCounter
	inc [hl]
	ld a, [wCurTextLine]
	and a
	jr z, DelayTextThenGoToNextLine
	dec a
	jr z, PrintText_Line1
	dec a
	jr z, PrintText_Line2
	dec a
	jr z, PrintText_Line3
	dec a
	jr z, PrintText_Line4
	ld a, $80
	ld [wCurTextLine], a
	ret

PrintTextWithoutHeader:
	ld hl, wTextDelayCounter
	inc [hl]
	ld a, [wCurTextLine]
	and a
	jr z, DelayTextThenGoToNextLine
	dec a
	jr z, PrintText_Line2
	dec a
	jr z, PrintText_Line3
	dec a
	jr z, PrintText_Line4
	ld a, $80
	ld [wCurTextLine], a
	ret

DelayTextThenGoToNextLine:
	ld a, [wTextDelayCounter]
	cp 10
	ret c
GoToNextLine:
	xor a
	ld [wCurTextLinePos], a
	ld [wTextDelayCounter], a
	ld hl, wCurTextLine
	inc [hl]
	ret

PrintText_Line1:
	ld c, 0
	jr PrintText

PrintText_Line2:
	ld c, 1
	jr PrintText

PrintText_Line3:
	ld c, 2
	jr PrintText

PrintText_Line4:
	ld c, 3
	jr PrintText ; unnecessary jump

; prints text given in wTextBuffer
PrintText:
	ld a, [wPendingCharDest + 0]
	and a
	ret nz

	; if A button or down is pressed,
	; then text delay is halved
	ld b, 4
	ld a, [wJoypadDown]
	and PAD_A | PAD_DOWN
	jr z, .got_delay
	srl b ; 2
.got_delay
	ld a, [wTextDelayCounter]
	cp b
	ret c ; still delaying
	xor a
	ld [wTextDelayCounter], a

; get next character
	ld a, c
	ld [wCurTextBufferLine], a
.got_buffer_pos
	swap c
	ld e, c ; *$10
	ld a, [wCurTextLinePos]
	ld d, a
	add c
	ld c, a ; *$20
	ld b, $00
	rl b
	ld hl, wText
	add hl, bc
	ld a, [hl]
	cp "@"
	jr z, .no_char
	ld [wPendingCharTile], a
	ld a, $1 | BG_BANK1
	ld [wPendingCharAttr], a
	hlbgcoord 2, 14
	ld a, [wBGMapToPrintText]
	and a
	jr z, .got_bgmap_pos
	hlbgcoord 2, 14, v0BGMap1
.got_bgmap_pos
	sla e
	ld a, d
	add e
	ld e, a
	ld d, $00
	rl d

	; first line always starts 1 tile to the left
	ld a, [wCurTextBufferLine]
	and a
	jr nz, .not_first_pos
	dec l
.not_first_pos
	add hl, de
	ld a, l
	ld [wPendingCharDest + 0], a
	ld a, h
	ld [wPendingCharDest + 1], a
	ld a, [wPendingCharTile]
	cp " "
	play_sfx nz, SFX_130
	ld hl, wCurTextLinePos
	inc [hl]
	ld a, [hl]
	cp TEXT_LINE_LENGTH
	ret nz
	jp GoToNextLine

.no_char
	; for empty chars, skip characters
	; until a character is found or the
	; end of the line is reached
	ld hl, wCurTextLinePos
	inc [hl]
	ld a, [hl]
	cp TEXT_LINE_LENGTH
	jp z, GoToNextLine
	ld a, [wCurTextBufferLine]
	ld c, a
	jr .got_buffer_pos

; checks which level is the next objective
; then loads from wTextBuffer the corresponding
; text for that objective to print
LoadNextObjectiveText:
	ld de, wTextLine1
	ld hl, wTextBuffer
	ld b, TEXT_LINE_LENGTH
	call CopyHLToDE

	xor a
	ld [wIsNextObjectiveTheTemple], a
	farcall GetMapSideAndLevelForNextTreasure
	ld a, b
	ld hl, $20
	and a
	jr z, .check_the_temple ; north
	ld hl, $120
	dec a
	jr z, .not_temple ; west
	ld hl, $200
	dec a
	jr z, .not_temple ; south
	ld hl, $2e0
	dec a
	jr z, .not_temple ; east
	debug_nop
.check_the_temple
	ld a, d
	and a
	jr nz, .not_temple
	; the temple
	ld a, TRUE
	ld [wIsNextObjectiveTheTemple], a
.not_temple
	ld bc, wTextBuffer
	add hl, bc
	ld a, d
	swap a
	rlca
	ld c, a ; = d * $20
	ld b, $00
	add hl, bc

	ld a, [wLanguage]
	and a
	jr nz, .english
; japanese
	ld de, wTextLine2
	ld b, TEXT_LINE_LENGTH
	call CopyHLToDE
	ld de, wTextLine3
	ld hl, wTextBuffer + TEXT_LINE_LENGTH
	ld b, TEXT_LINE_LENGTH
	call CopyHLToDE
	ld a, "@"
	ld hl, wTextLine4
	ld bc, TEXT_LINE_LENGTH
	call WriteAToHL_BCTimes
	ret

.english
	ld de, wTextLine3
	ld b, 2 * TEXT_LINE_LENGTH
	call CopyHLToDE
	ld de, wTextLine2
	ld hl, wTextBuffer + TEXT_LINE_LENGTH
	ld b, TEXT_LINE_LENGTH
	call CopyHLToDE
	ret

Func_ad011:
	ld a, [w2d014]
	cp c
	ret c
Func_ad016:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret

SetFightAgainstAHiddenFigure:
	stop_music2
	stop_sfx
	xor a
	ld [wSubState], a
	ld hl, wState
	inc [hl] ; ST_LEVEL
	scf
	ret

HiddenFigureRevealScene:
	ld a, [w2d013]
	cp $02
	jr c, .cant_skip
	ld a, [wGameModeFlags]
	bit MODE_FOUGHT_A_HIDDEN_FIGURE_F, a
	jr z, .cant_skip
	ld a, [wJoypadPressed]
	bit B_PAD_B, a
	jp nz, SetFightAgainstAHiddenFigure
.cant_skip
	call DoHiddenFigureLeftHandMovement
	call DoHiddenFigureRightHandMovement
	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable

	dw Func_ad016
	dw HandleEnterTempleWithAllMusicBoxesScene
	dw .Wait1
	dw InitTextPrinting
	dw Func_aca9e
	dw .Wait2
	dw LoadCurTextPageBufferPage
	dw Func_acacd
	dw Func_acae7
	dw .Func_ad0bd
	dw .WaitThenShowTextArrow
	dw .WaitAButtonThenClearTextbox
	dw Func_ad445
	dw HandleTempleShakeScene
	dw .Func_ad0e4
	dw .Func_ad0f6
	dw .InitShakeAndRocks
	dw .Func_ad12f
	dw .LoadHiddenFigureGfx1
	dw .LoadHiddenFigureGfx2
	dw .LoadHiddenFigureGfx3
	dw .Func_ad195
	dw .Func_ad1e3
	dw HandleHiddenFigureReveal
	dw .Wait3
	dw .InitTextPrintOnBGMap1
	dw Func_aca9e
	dw .Func_ad207
	dw LoadCurTextPageBufferPage
	dw .StartHiddenFigureMouthMovement
	dw .PlayHiddenFigureLaughSFX
	dw .PrintTextUntilNextPage
	dw .Func_ad23a
	dw LoadCurTextPageBufferPage
	dw .Func_ad259
	dw .Func_ad271
	dw .Func_ad27a
	dw .Func_ad2f4
	dw .Func_ad300
	dw .Func_ad308
	dw .Func_ad319
	dw SetFightAgainstAHiddenFigure

.Wait1:
	ld c, 40
	jp Func_ad011

.Wait2:
	ld c, 30
	jp Func_ad011

.Func_ad0bd:
	jp Func_acaf3

.WaitThenShowTextArrow:
	ld a, [w2d014]
	cp 30
	ret c
	ld a, $01
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp Func_ad016

.WaitAButtonThenClearTextbox:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	call ClearTextbox
	jp Func_ad016

.Func_ad0e4:
	call HandleTempleShakeAndRocks
	ld a, $03
	ld [w2d880], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp .Func_ad16a

.Func_ad0f6:
	call HandleTempleWarioPanic
	call HandleTempleShakeAndRocks
	ld a, [w2d014]
	and $f
	ret nz ; only continue when counter reaches 16
	jp Func_ac9ba

.InitShakeAndRocks:
	ld a, $01
	ld [w2d896], a
	call HandleTempleShakeAndRocks
	ld a, $00 ; xor a
	ld [wTempleRock1Size], a
	ld [wTempleRock2Size], a
	ld [wTempleRock3Size], a
	ld [wTempleRock4Size], a
	ld [wTempleRock5Size], a
	ld [wTempleRock6Size], a
	ld [wTempleRock7Size], a
	ld [wTempleRock8Size], a
	ld [wTempleRock9Size], a
	ld [wTempleRock10Size], a
	jr .Func_ad16a

.Func_ad12f:
	call HandleTempleWarioPanic
	call HandleTempleShakeAndRocks
	xor a
	ld de, TEMPLE_ROCK_STRUCT_LENGTH
	ld hl, wTempleRocks
	ld b, NUM_TEMPLE_ROCKS
.loop_rocks
	add [hl]
	add hl, de
	dec b
	jr nz, .loop_rocks
	and a
	ret nz
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a
	jp Func_ad016

.LoadHiddenFigureGfx1:
	xor a ; BANK(VRAM0)
	ld [wHDMADestVRAMBank], a
	ld de, HiddenFigure1Gfx tile $80
	ld b, HIGH(v0Tiles1) - $80
	ld c, $80 dma_tiles
	ld a, BANK(HiddenFigure1Gfx)
	ld [wHDMABank], a

.SetHDMA:
	ld hl, wHDMA
	ld a, d
	ld [hli], a ; source ptr
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a ; dest ptr
	xor a
	ld [hli], a
	ld a, c
	ld [hl], a ; mode

.Func_ad16a:
	call HandleTempleWarioPanic
	jp Func_ad016

.LoadHiddenFigureGfx2:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, HiddenFigure1Gfx tile $100
	ld b, HIGH(v0Tiles2) - $80
	ld c, $80 dma_tiles
	ld a, BANK(HiddenFigure1Gfx)
	ld [wHDMABank], a
	jr .SetHDMA

.LoadHiddenFigureGfx3:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, HiddenFigure2Gfx
	ld b, HIGH(v1Tiles0) - $80
	ld c, $80 dma_tiles
	ld a, BANK(HiddenFigure1Gfx)
	ld [wHDMABank], a
	jr .SetHDMA

.Func_ad195:
	call HandleTempleWarioPanic
	ld a, [w2d014]
	cp 30
	ret c
	ld a, $0d
	ld hl, wSceneObj7State
	call SetSceneObjState
	ld a, $11
	ld hl, wSceneObj3State
	call SetSceneObjState
	ld a, $12
	ld hl, wSceneObj4State
	call SetSceneObjState
	ld hl, wSceneObj7
	ld a, $38
	ld [hli], a
	ld [hl], $50
	ld hl, wSceneObj3
	ld a, $58
	ld [hli], a
	ld [hl], $20
	ld hl, wSceneObj4
	ld [hli], a
	ld [hl], $80
	ld a, $01
	ld [w2d8da], a
	ld [w2d8dc], a
	ld a, $04
	ld [w2d880], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_ad016

.Func_ad1e3:
	call HandleTempleWarioPanic
	ld c, $07
	ld a, [wPalConfig1TotalSteps]
	cp $14
	jr c, .asm_ad1f1
	ld c, $03
.asm_ad1f1
	ld a, [w2d014]
	and c
	ret nz
	jp Func_ac9ba

.Wait3:
	ld c, 40
	jp Func_ad011

.InitTextPrintOnBGMap1:
	call InitTextPrinting
	ld a, $1
	ld [wBGMapToPrintText], a
	ret

.Func_ad207:
	ld a, [w2d014]
	cp 30
	ret c
	ld a, 4
	ld [wCurTextBufferPage], a
	jp Func_ad016

.StartHiddenFigureMouthMovement:
	ld a, $10
	ld [wSceneObj7State], a
	jp Func_ad016

.PlayHiddenFigureLaughSFX:
	ld a, [wSceneObj7State]
	cp $0e
	ret nz ; wait until mouth is opening
	play_sfx SFX_HIDDEN_FIGURE_LAUGH
	jp Func_ad016

.PrintTextUntilNextPage:
	call PrintTextWithoutHeader
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_ad016

.Func_ad23a:
	ld a, [w2d014]
	cp 40
	jr z, .finish_mouth_movement
	cp 70
	ret c
	ld hl, wCurTextBufferPage
	inc [hl]
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_ad016

.finish_mouth_movement
	ld a, $0f
	ld [wSceneObj7State], a
	ret

.Func_ad259:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	call ClearTextboxExceptHeader
	ld a, $10
	ld [wSceneObj7State], a
	jp Func_aca6d

.Func_ad271:
	ld a, [wSceneObj7State]
	cp $0e
	ret nz
	jp Func_aca6d

.Func_ad27a:
	call PrintTextWithoutHeader
	call .HandleHiddenFigureMouthClosing
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_af135

.HandleHiddenFigureMouthClosing:
	ld a, [wPendingCharDest]
	and a
	ret z
	ld a, [wCurTextBufferLine]
	cp 1
	ret z
	ld a, [wLanguage]
	and a
	jr nz, .english

; japanese
	ld a, [wCurTextBufferPage]
	cp 5
	jr z, .pos1
	cp 6
	jr z, .pos8
	cp 7
	jr z, .pos8
	cp 8
	jr z, .pos12
	cp 9
	jr z, .pos1
	ret

.english
	ld a, [wCurTextBufferPage]
	cp 5
	jr z, .pos10
	cp 6
	jr z, .pos12
	cp 7
	jr z, .pos5
	cp 8
	jr z, .pos11
	cp 9
	jr z, .pos12
	ret

.pos1
	ld b, 1

.check_pos
	ld a, [wCurTextLinePos]
	cp b
	ret nz ; not in target text position
	ld a, [wCurTextBufferLine]
	cp 2
	ret nz
	; finish Hidden Figure mouth movement
	ld a, $0f
	ld [wSceneObj7State], a
	ld hl, wSceneObj9State ; useless
	ret

.pos8
	ld b, 8
	jr .check_pos
.pos12
	ld b, 12
	jr .check_pos
.pos10
	ld b, 10
	jr .check_pos
.pos11
	ld b, 11
	jr .check_pos
.pos5
	ld b, 5
	jr .check_pos

.Func_ad2f4:
	ld a, [wSceneObj7State]
	cp $0d
	ret nz
	call Func_acaf3
	ret c
	dec [hl]
	ret

.Func_ad300:
	ld a, SCENEWARIO_PANIC_JUMP
	call SetSceneWarioState
	jp Func_ad016

.Func_ad308:
	ld a, [w2d014]
	cp 30
	ret c
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_ad016

.Func_ad319:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	xor a
	ld [wSceneObj1State], a
	call ClearTextbox
	jp Func_ad016

Func_ad329:
	ld a, [wSceneWarioState]
	cp b
	ret nz
	jr Func_ad335

Func_ad330:
	ld a, [w2d891]
	cp c
	ret c
Func_ad335:
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl]
	ret

Func_ad33c:
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a ; w2d891
	jp Func_ad016

HandleTempleShakeAndRocks:
	farcall _HandleTempleShakeAndRocks
	ret

HandleHiddenFigureReveal:
	call HandleTempleWarioPanic

	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw .PlayHiddenFigureRevealMusic
	dw .StopPanicRun
	dw .WaitForPanicRunStop
	dw .SetWarioPanic
	dw .SetWarioPanicJump
	dw .WaitUntilLookBack
	dw Func_ad33c

.PlayHiddenFigureRevealMusic:
	play_music2 MUSIC_HIDDEN_FIGURE_REVEAL
	jp Func_ad335

.StopPanicRun:
	ld a, $03
	ld [w2d892], a
	jp Func_ad335

.WaitForPanicRunStop:
	ld a, [w2d894]
	and a
	ret nz
	jp Func_ad335

.SetWarioPanic:
	ld a, [bc]
	cp 20
	ret c
	ld a, SCENEWARIO_PANIC
	call SetSceneWarioState
	jp Func_ad335

.SetWarioPanicJump:
	ld a, [bc]
	cp 40
	ret c
	ld a, SCENEWARIO_PANIC_JUMP
	ld [wSceneWarioState], a
	jp Func_ad335

.WaitUntilLookBack:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	jp Func_ad335

HandleEnterTempleWithAllMusicBoxesScene:
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw .Wait1
	dw .WalkRight
	dw .MoveRight
	dw .Wait2
	dw .TurnToBack
	dw .LookBack
	dw .CheckTimeAttack
	dw .Bow
	dw .WaitInput

.Wait1:
	ld c, 8
	jp Func_ad330

.WalkRight:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ad335

.MoveRight:
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ad335

.Wait2:
	ld c, 30
	jp Func_ad330

.TurnToBack:
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ad335

.LookBack:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ad329

.CheckTimeAttack:
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jp z, Func_ad33c ; skips rest of the sequence
	jp Func_ad335 ; continues

.Bow:
	ld a, [bc]
	cp 20
	ret c
	ld a, SCENEWARIO_BOW
	call SetSceneWarioState

	; draw text prompt arrow
	ld hl, wSceneObj1
	ld a, $8e
	ld [hli], a ; y
	ld a, $98
	ld [hli], a ; x
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_ad335

.WaitInput:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	jp nz, .a_btn ; can be jr
	and PAD_B | PAD_LEFT
	ret z
	xor a
	ld [wSceneObj1State], a
	ld a, TEMPLE_SCENE_EXITING
	ld [wTempleScene], a
	xor a
	ld [wTempleSceneCounter], a
	ret

.a_btn
	ld a, SCENEWARIO_LOOK_BACK
	call SetSceneWarioState
	xor a
	ld [wSceneObj1State], a
	jp Func_ad33c

Func_ad445:
	call HandleTempleMusicBoxes

	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw .Wait1
	dw .ShowMusicBoxes
	dw .WaitUntilRaiseHands
	dw .SpawnMusicBoxes
	dw .WaitMusicBoxSequenceFinish
	dw .LowerHands
	dw .WaitUntilLookBack
	dw .Wait2
	dw .Wait2
	dw .Wait2
	dw .Wait2
	dw .DespawnMusicBoxes
	dw .WaitMusicBoxSequenceFinish
	dw Func_ad33c

.Wait1:
	ld c, 60
	jp Func_ad330

.ShowMusicBoxes:
	ld a, SCENEWARIO_SHOW_MUSIC_BOXES_1
	call SetSceneWarioState
	jp Func_ad335

.WaitUntilRaiseHands:
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_3
	jp Func_ad329

.SpawnMusicBoxes:
	ld a, [bc]
	cp 16
	ret c
	ld a, $01
	ld [w2d8a0], a
	jp Func_ad335

.WaitMusicBoxSequenceFinish:
	ld a, [w2d8a0]
	and a
	ret nz
	jp Func_ad335

.LowerHands:
	ld a, [bc]
	cp 60
	ret c
	ld a, SCENEWARIO_SHOW_MUSIC_BOXES_4
	call SetSceneWarioState
	jp Func_ad335

.WaitUntilLookBack:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ad329

.Wait2:
	ld c, 240
	jp Func_ad330

.DespawnMusicBoxes:
	ld a, $08
	ld [w2d8a0], a
	jp Func_ad335

HandleTempleMusicBoxes:
	call HandleTempleMusicBox1Hover
	call HandleTempleMusicBox2Hover
	call HandleTempleMusicBox3Hover
	call HandleTempleMusicBox4Hover
	call HandleTempleMusicBox5Hover

	ld hl, w2d8a0
	ld a, [hli]
	inc [hl] ; w2d8a1
	and a
	ret z
	ld b, h
	ld c, l
	jumptable

	dw .Next
	dw .InitYellowMusicBox
	dw .InitBlueMusicBox
	dw .InitGreenMusicBox
	dw .InitRedMusicBox
	dw .InitGoldMusicBox
	dw .Reset
	dw .Next
	dw .DeinitYellowMusicBox
	dw .DeinitBlueMusicBox
	dw .DeinitGreenMusicBox
	dw .DeinitRedMusicBox
	dw .DeinitGoldMusicBox
	dw .Reset

.Next:
	ld hl, w2d8a1
	xor a
	ld [hld], a
	inc [hl] ; w2d8a0
	ret

.InitYellowMusicBox:
	ld hl, wTempleMusicBox1

.WaitThenInitMusicBox:
	ld a, [bc]
	cp 16
	ret c
	ld a, $01
	ld [hl], a
	jr .Next

.InitBlueMusicBox:
	ld hl, wTempleMusicBox2
	jr .WaitThenInitMusicBox

.InitGreenMusicBox:
	ld hl, wTempleMusicBox3
	jr .WaitThenInitMusicBox

.InitRedMusicBox:
	ld hl, wTempleMusicBox4
	jr .WaitThenInitMusicBox

.InitGoldMusicBox:
	ld hl, wTempleMusicBox5
	jr .WaitThenInitMusicBox

.Reset:
	ld hl, w2d8a0
	xor a
	ld [hli], a
	ld [hl], a ; w2d8a1
	ret

.DeinitYellowMusicBox:
	ld de, wTempleMusicBox1
	ld hl, wSceneObj8Unk7

.WaitThenDeinitMusicBox:
	ld a, [hld]
	cp 16
	ret nz
	xor a
	ld [hl], a
	ld [de], a
	jr .Next

.DeinitBlueMusicBox:
	ld de, wTempleMusicBox2
	ld hl, wSceneObj9Unk7
	jr .WaitThenDeinitMusicBox

.DeinitGreenMusicBox:
	ld de, wTempleMusicBox3
	ld hl, wSceneObj10Unk7
	jr .WaitThenDeinitMusicBox

.DeinitRedMusicBox:
	ld de, wTempleMusicBox4
	ld hl, wSceneObj11Unk7
	jr .WaitThenDeinitMusicBox

.DeinitGoldMusicBox:
	ld de, wTempleMusicBox5
	ld hl, wSceneObj12Unk7
	jr .WaitThenDeinitMusicBox

; a = scene obj state
InitTempleSceneMusicBox:
	ld [hl], $50 ; y
	inc l
	ld [hl], $4e ; x
	inc l
	set 2, l
	call SetSceneObjState
	ret

MoveMusicBoxUpLeft:
	dec [hl] ; x
	dec l
	dec [hl] ; y
	dec [hl]
	ld a, [hl]
	cp $2c
	ret

Func_ad557:
	xor a
	ld [hld], a
	inc [hl]
	ret

; \1 = music box number
; \2 = scene object to use
; \3 = obj state
MACRO temple_music_box_hover
HandleTempleMusicBox\1Hover:
	ld hl, wTempleMusicBox\1
	ld a, [hli]
	and a
	ret z
	jumptable

	dw InvalidMusicBoxAction
	dw .Init
	dw .MoveUpLeft
	dw .MoveCircle

.Init:
	ld hl, \2
	ld a, \3
	call InitTempleSceneMusicBox
.Next:
	ld hl, wTempleMusicBox\1Counter
IF (Func_ad557) - @ > 127 || (Func_ad557) - @ < -129
	jp Func_ad557
ELSE
	jr Func_ad557
ENDC

.MoveUpLeft:
	ld hl, \2XCoord
	call MoveMusicBoxUpLeft
	ret nz
IF (\1) == 5
	; play music if it's the last Music Box
	play_music2 MUSIC_MUSIC_BOXES
ENDC
	jr .Next

.MoveCircle:
	ld hl, \2
	ld de, Data_ad654
	call ApplyOWMovement
	ret
ENDM

	temple_music_box_hover 1, wSceneObj8,  $3
	temple_music_box_hover 2, wSceneObj9,  $4
	temple_music_box_hover 3, wSceneObj10, $5
	temple_music_box_hover 4, wSceneObj11, $6
	temple_music_box_hover 5, wSceneObj12, $7

Data_ad654:
	db -2,  0
	db -2,  0
	db -1,  0
	db -2,  1
	db -1,  0
	db -2,  1
	db -1,  0
	db -1,  1
	db -2,  1
	db -1,  1
	db -1,  1
	db -1,  1
	db -1,  1
	db -1,  2
	db -1,  1
	db  0,  1
	db -1,  2
	db  0,  1
	db -1,  2
	db  0,  1
	db  0,  2
	db  0,  2
	db  0,  1
	db  1,  2
	db  0,  1
	db  1,  2
	db  0,  1
	db  1,  1
	db  1,  2
	db  1,  1
	db  1,  1
	db  1,  1
	db  1,  1
	db  2,  1
	db  1,  1
	db  1,  0
	db  2,  1
	db  1,  0
	db  2,  1
	db  1,  0
	db  2,  0
	db  2,  0
	db  1,  0
	db  2, -1
	db  1,  0
	db  2, -1
	db  1, -1
	db  2,  0
	db  1, -1
	db  1, -1
	db  2, -2
	db  1, -1
	db  1, -1
	db  0, -2
	db  1, -1
	db  1, -2
	db  0, -1
	db  1, -2
	db  0, -1
	db  0, -2
	db  0,  0
	db  0, -2
	db  0, -1
	db -1, -2
	db  0, -1
	db -1, -2
	db  0, -1
	db -1, -1
	db -1, -2
	db -1, -1
	db -1, -1
	db -1, -1
	db -1, -1
	db -2, -1
	db -1, -1
	db -1,  0
	db -2, -1
	db -1,  0
	db -2, -1
	db -1,  0
	db $80

HandleTempleShakeScene:
	call HandleTempleWarioPanic
	call HandleTempleShakeAndRocks

	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw .StartShake
	dw .InitSmallRock1
	dw .InitSmallRock2
	dw .InitSmallRock3
	dw .InitSmallRock4
	dw .InitSmallRock5
	dw .InitSmallRock6
	dw .ShowExclamationMark
	dw .WaitExclamationMark
	dw .Wait
	dw .LookAround
	dw .WaitUntilLookForward
	dw .StopShakeAndDeinitRocks
	dw .WaitUntilRocksDeinit
	dw .StartBigShake
	dw .InitLargeRock1
	dw .InitLargeRock2
	dw .InitLargeRock3
	dw .InitLargeRock4
	dw .InitLargeRock5
	dw .InitLargeRock6
	dw .InitLargeRock7
	dw .InitLargeRock8
	dw .InitLargeRock9
	dw .InitLargeRock10
	dw .PanicJump
	dw .LookBack
	dw .StopShake
	dw Func_ad33c

.StartShake:
	ld a, [bc]
	cp 90
	ret c
	ld a, $02
	ld [w2d896], a
	jp Func_ad335

.InitSmallRock1:
	ld a, [bc]
	cp 16
	ret c
	ld hl, wTempleRock1
	jr .InitSmallTempleRock

.InitSmallRock2:
	ld a, [bc]
	cp 8
	ret c
	ld hl, wTempleRock2
	jr .InitSmallTempleRock

.InitSmallRock3:
	ld a, [bc]
	cp 20
	ret c
	ld hl, wTempleRock3
	jr .InitSmallTempleRock

.InitSmallRock4:
	ld a, [bc]
	cp 8
	ret c
	ld hl, wTempleRock4
	jr .InitSmallTempleRock

.InitSmallRock5:
	ld a, [bc]
	cp 16
	ret c
	ld hl, wTempleRock5
	jr .InitSmallTempleRock

.InitSmallRock6:
	ld a, [bc]
	cp 8
	ret c
	ld hl, wTempleRock6

.InitSmallTempleRock:
	ld b, $01
	jp .InitTempleRock

.ShowExclamationMark:
	ld a, [bc]
	cp 60
	ret c
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub $1c
	ld [hli], a ; y
	ld a, [wSceneWarioXCoord]
	ld [hl], a ; x
	ld a, $02
	ld hl, wCurSceneObjState
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ad335

.WaitExclamationMark:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	jp Func_ad335

.Wait:
	ld c, 45
	jp Func_ad330

.LookAround:
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	jp Func_ad335

.WaitUntilLookForward:
	ld b, SCENEWARIO_LOOK_FORWARD
	jp Func_ad329

.StopShakeAndDeinitRocks:
	ld a, $01
	ld [w2d896], a
	ld a, $00
	ld [wTempleRock1Size], a
	ld [wTempleRock2Size], a
	ld [wTempleRock3Size], a
	ld [wTempleRock4Size], a
	ld [wTempleRock5Size], a
	ld [wTempleRock6Size], a
	jp Func_ad335

.WaitUntilRocksDeinit:
	xor a
	ld de, TEMPLE_ROCK_STRUCT_LENGTH
	ld hl, wTempleRocks
	ld b, NUM_FALLING_TEMPLE_ROCKS
.loop_rocks
	add [hl]
	add hl, de
	dec b
	jr nz, .loop_rocks
	and a
	ret nz
	jp Func_ad335

.StartBigShake:
	ld a, $0b
	ld [w2d896], a
	jp Func_ad335

.InitLargeRock1:
	ld a, [bc]
	cp 20
	ret c
	ld hl, wTempleRock1
	jr .InitLargeTempleRock

.InitLargeRock2:
	ld a, [bc]
	cp 4
	ret c
	ld hl, wTempleRock2
	jr .InitLargeTempleRock

.InitLargeRock3:
	ld a, [bc]
	cp 10
	ret c
	ld hl, wTempleRock3
	jr .InitLargeTempleRock

.InitLargeRock4:
	ld a, [bc]
	cp 4
	ret c
	ld hl, wTempleRock4
	jr .InitLargeTempleRock

.InitLargeRock5:
	ld a, [bc]
	cp 10
	ret c
	ld hl, wTempleRock5

.InitLargeTempleRock:
	ld b, $02
.InitTempleRock:
	ld a, $01
	ld [hli], a ; action
	xor a
	ld [hli], a ; counter
	ld [hl], b  ; size
	jp Func_ad335

.InitLargeRock6:
	ld a, [bc]
	cp 10
	ret c
	ld hl, wTempleRock6
	jr .InitLargeTempleRock

.InitLargeRock7:
	ld a, [bc]
	cp 30
	ret c
	xor a
	ld [wSceneObj8Unk7], a
	ld hl, wTempleRock7
	jr .InitLargeTempleRock

.InitLargeRock8:
	ld a, [bc]
	cp 8
	ret c
	xor a
	ld [wSceneObj9Unk7], a
	ld hl, wTempleRock8
	jr .InitLargeTempleRock

.InitLargeRock9:
	ld a, [bc]
	cp 10
	ret c
	xor a
	ld [wSceneObj10Unk7], a
	ld hl, wTempleRock9
	jr .InitLargeTempleRock

.InitLargeRock10:
	ld a, [bc]
	cp 8
	ret c
	xor a
	ld [wSceneObj11Unk7], a
	ld hl, wTempleRock10
	jr .InitLargeTempleRock

.PanicJump:
	ld a, TRUE
	ld [wSceneWarioIgnoreScroll], a
	ld a, SCENEWARIO_PANIC_JUMP
	call SetSceneWarioState
	jp Func_ad335

.LookBack:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ad329

.StopShake:
	ld a, [bc]
	cp 8
	ret c
	ld a, $01
	ld [w2d894], a
	jp Func_ad335

HandleTempleWarioPanic:
	ld a, [w2d894]
	cp $01
	ret nz

	ld hl, w2d893
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d892
	jumptable

	dw .PanicRunRight
	dw .MoveRight
	dw .MoveLeft
	dw .PanicRunUntilMovingRight
	dw .MoveRight
	dw .MoveLeftToCentre
	dw .TurnBack
	dw .WaitUntilLookBackThenFinish

.PanicRunRight:
	ld a, SCENEWARIO_PANIC_RUN_RIGHT
	call SetSceneWarioState

.Next:
	ld hl, w2d892
	inc [hl]
	xor a
	inc l
	ld [hl], a ; w2d893
	ret

.MoveRight:
	call ApplySceneWarioMovementRight
	cp $80
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_PANIC_RUN_LEFT
	call SetSceneWarioState
	jr .Next

.MoveLeft:
	call ApplySceneWarioMovementLeft
	cp $20
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_PANIC_RUN_RIGHT
	call SetSceneWarioState

; Previous
	ld hl, w2d892
	dec [hl]
	xor a
	inc l
	ld [hl], a ; w2d893
	ret

.PanicRunUntilMovingRight:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_PANIC_RUN_RIGHT
	jr z, .moving_right
	call ApplySceneWarioMovementLeft
	cp $20
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_PANIC_RUN_RIGHT
	call SetSceneWarioState
	jr .Next

.moving_right
	call .Next
	jr .MoveRight

.MoveLeftToCentre:
	call ApplySceneWarioMovementLeft
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_LEFT
	call SetSceneWarioState
	jr .Next

.TurnBack:
	ld a, [bc]
	cp 20
	ret c
	ld a, SCENEWARIO_TURN_BACK_LEFT
	call SetSceneWarioState
	jr .Next

.WaitUntilLookBackThenFinish:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	xor a
	ld [w2d894], a
	ld [w2d893], a
	ld [w2d892], a
	ret

DoHiddenFigureLeftHandMovement:
	ld a, [w2d8da]
	and a
	ret z
	ld hl, wSceneObj3
	ld de, Data_ad939
	call ApplyOWMovement
	ret

DoHiddenFigureRightHandMovement:
	ld a, [w2d8dc]
	and a
	ret z
	ld hl, wSceneObj4
	ld de, Data_ad939
	call ApplyOWMovement_Mirrored
	ret

Data_ad939:
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db  0,  0
	db  0, -1
	db  0,  0
	db  0,  0
	db -1,  0
	db  0,  0
	db $80

_GolfBuilding:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	stop_music2

	ld a, BANK("WRAM2")
	ldh [rWBK], a

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a
	call .VBlank_GolfBuilding

	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM

	call .FillBGPalettes

	ld hl, Pals_84900
	ld de, wTempPals2
	ld b, BANK(Pals_84900)
	ld c, 8 palettes
	call CopyFarBytes
	ld hl, PrologueBackgroundGfx
	ld b, BANK(PrologueBackgroundGfx)
	call LoadFarTiles

	decompress_attrmap GolfBuildingAttrmap, v1BGMap0
	decompress_tilemap GolfBuildingTilemap, v0BGMap0

	call .Func_ada43
	call UpdateSceneWarioAnimation

	ld a, LCDC_DEFAULT
	ldh [rLCDC], a

	ld hl, wSubState
	inc [hl]
	ret

.Func_ada43:
	ld a, [wCrayonFlags]
	cp ALL_CRAYONS
	jr z, .all_crayons
.Func_ada4a:
	ld de, wOWUIObj1YCoord
	ld a, $58
	ld [de], a
	inc e
	ld a, [wNextMapSide]
	add a
	add a
	ld c, a ; *4
	ld b, $00
	ld hl, .data
	add hl, bc
	ld a, [hli]
	ld [de], a
	ld a, [hli] ; useless
	ld a, [hl]
	ld [wPalFade6Colour2GreenCurrent], a
	ld a, $ff
	ld [wOWUIObj2YCoord], a
	xor a
	call SetSceneWarioState
	ret

.data
	; x coord, $00, ?, $00
	db $90, $00, $01, $00 ; NORTH
	db $10, $00, $00, $00 ; WEST

.all_crayons
	ld a, [wOWLevel]
	cp LEVEL_GOLF_BUILDING
	jr nz, .asm_ada97
	ld de, wOWUIObj1YCoord
	ld a, $58
	ld [de], a
	inc e
	ld a, $50
	ld [de], a
	ld a, $04
	ld [wPalFade6Colour2GreenCurrent], a
	ld a, $ff
	ld [wOWUIObj2YCoord], a
	ld a, $01
	call SetSceneWarioState
	ret

.asm_ada97
	call .Func_ada4a
	ld hl, wPalFade6Colour2GreenCurrent
	inc [hl]
	inc [hl]
	ret

.VBlank_GolfBuilding:
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, BANK("WRAM2")
	ldh [rWBK], a

	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	ld a, [wHDMABank]
	and a
	jr z, .done
	ld b, a
	xor a
	ld [wHDMABank], a
	ld a, [wROMBank]
	push af
	ld a, b
	bankswitch
	ld hl, wHDMA
	ld a, [hli]
	ld c, LOW(rVDMA_SRC_HIGH)
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	ld a, [hli]
	inc c
	ld [$ff00+c], a
	pop af
	bankswitch
.done
	xor a
	ldh [rVBK], a
	ld a, HIGH(wVirtualOAM)
	jp hTransferVirtualOAM
.func_end

.FillBGPalettes:
	ld hl, Pals_addc9
	call LoadPalsToTempPals1
	ld hl, wTempPals1
	ld de, wTempBGPals
	ld b, 8 palettes
	call CopyHLToDE

	ld a, [wCrayonFlags]
	bit CRAYON_RED_F, a
	call nz, .FillRed
	ld a, [wCrayonFlags]
	bit CRAYON_BROWN_F, a
	call nz, .FillBrown
	ld a, [wCrayonFlags]
	bit CRAYON_YELLOW_F, a
	call nz, .FillYellow
	ld a, [wCrayonFlags]
	bit CRAYON_GREEN_F, a
	call nz, .FillGreen
	ld a, [wCrayonFlags]
	bit CRAYON_CYAN_F, a
	call nz, .FillCyan
	ld a, [wCrayonFlags]
	bit CRAYON_BLUE_F, a
	call nz, .FillBlue
	ld a, [wCrayonFlags]
	bit CRAYON_PINK_F, a
	call nz, .FillPink

	ld hl, wTempBGPals
	ld de, wTempPals1
	ld b, 8 palettes
	call CopyHLToDE
	ret

.FillRed:
	ld hl, Pals_ade09 palette 7
	ld de, wTempBGPals palette 7
	ld b, 1 palettes
	call CopyHLToDE
	ret

.FillBrown:
	ld hl, Pals_ade09 palette 0 + $2
	ld de, wTempBGPals palette 0 + $2
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 1
	ld de, wTempBGPals palette 1
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 2
	ld de, wTempBGPals palette 2
	ld b, $6
	call CopyHLToDE
	ld hl, Pals_ade09 palette 3 + $2
	ld de, wTempBGPals palette 3 + $2
	ld b, $2
	call CopyHLToDE
	ret

.FillYellow:
	ld hl, Pals_ade09 palette 4 + $2
	ld de, wTempBGPals palette 4 + $2
	ld b, $6
	call CopyHLToDE
	ret

.FillGreen:
	ld hl, Pals_ade09 palette 1 + $2
	ld de, wTempBGPals palette 1 + $2
	ld b, $6
	call CopyHLToDE
	ld hl, Pals_ade09 palette 5 + $2
	ld de, wTempBGPals palette 5 + $2
	ld b, $6
	call CopyHLToDE
	ret

.FillCyan:
	ld hl, Pals_ade09 palette 0 + $4
	ld de, wTempBGPals palette 0 + $4
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 3
	ld de, wTempBGPals palette 3
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 4
	ld de, wTempBGPals palette 4
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 5
	ld de, wTempBGPals palette 5
	ld b, $2
	call CopyHLToDE
	ret

.FillBlue:
	ld hl, Pals_ade09 palette 0 + $6
	ld de, wTempBGPals palette 0 + $6
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 2 + $6
	ld de, wTempBGPals palette 2 + $6
	ld b, $2
	call CopyHLToDE
	ld hl, Pals_ade09 palette 3 + $4
	ld de, wTempBGPals palette 3 + $4
	ld b, $4
	call CopyHLToDE
	ret

.FillPink:
	ld hl, Pals_ade09 palette 6
	ld de, wTempBGPals palette 6
	ld b, 1 palettes
	call CopyHLToDE
	ret

Func_adbfe:
	call .Func_adc0b
	call nc, .Func_adc2f
	call UpdateSceneWarioAnimation
	call ClearUnusedVirtualOAM
	ret

.Func_adc0b:
	ld a, [wPalFade6Colour2GreenCurrent]
	cp $04
	jr z, .no_carry
	ld a, [wJoypadPressed]
	bit B_PAD_B, a
	jr nz, .exit
.no_carry
	xor a
	ret
.exit
	stop_sfx
	ld a, $01
	ld [wOWUIObj2Duration], a
	ld a, $08
	ld [wSubState], a
	scf
	ret

.Func_adc2f:
	ld hl, wPalFade6Colour2GreenSign
	inc [hl]
	ld c, l
	ld b, h
	ld a, [wPalFade6Colour2GreenCurrent]
	jumptable
	dw .Func_adc54 ; $0
	dw .Func_adc7e ; $1
	dw .Func_adca9 ; $2
	dw .Func_adcda ; $3
	dw .Func_add0b ; $4

.asm_adc43
	ld hl, wPalFade6Colour2GreenSign
	xor a
	ld [hld], a
	inc [hl]
	ret

.asm_adc4a
	ld [wPalFade6Colour2GreenCurrent], a
	ld hl, wPalFade6Colour2GreenSign
	xor a
	ld [hld], a
	ld [hl], a
	ret

.Func_adc54:
	ld a, [wPalFade6Colour2GreenTarget]
	and a
	jr z, .asm_adc65
	dec a
	jr z, .asm_adc6c
	dec a
	jr z, .asm_adc78
	dec a
	call z, .exit
	ret

.asm_adc65
	ld a, $08
	call SetSceneWarioState
	jr .asm_adc43
.asm_adc6c
	call ApplySceneWarioMovementRight
	cp $90
	ret nz
	xor a
	call SetSceneWarioState
	jr .asm_adc43
.asm_adc78
	ld a, [bc]
	cp $14
	ret c
	jr .asm_adc43

.Func_adc7e:
	ld a, [wPalFade6Colour2GreenTarget]
	and a
	jr z, .asm_adc8f
	dec a
	jr z, .asm_adc96
	dec a
	jr z, .asm_adca2
	dec a
	call z, .exit
	ret

.asm_adc8f
	ld a, $07
	call SetSceneWarioState
	jr .asm_adc43
.asm_adc96
	call ApplySceneWarioMovementLeft
	cp $10
	ret nz
	xor a
	call SetSceneWarioState
	jr .asm_adc43
.asm_adca2
	ld a, [bc]
	cp $14
	ret c
	jp .asm_adc43

.Func_adca9:
	ld a, [wPalFade6Colour2GreenTarget]
	and a
	jr z, .asm_adcb6
	dec a
	jr z, .asm_adcbe
	dec a
	jr z, .asm_adccc
	ret
.asm_adcb6
	ld a, $08
	call SetSceneWarioState
	jp .asm_adc43
.asm_adcbe
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld a, $0d
	call SetSceneWarioState
	jp .asm_adc43
.asm_adccc
	ld a, [bc]
	cp $08
	ret c
	ld a, $34
	call SetSceneWarioState
	ld a, $04
	jp .asm_adc4a

.Func_adcda:
	ld a, [wPalFade6Colour2GreenTarget]
	and a
	jr z, .asm_adce7
	dec a
	jr z, .asm_adcef
	dec a
	jr z, .asm_adcfd
	ret
.asm_adce7
	ld a, $07
	call SetSceneWarioState
	jp .asm_adc43
.asm_adcef
	call ApplySceneWarioMovementLeft
	cp $50
	ret nz
	ld a, $0c
	call SetSceneWarioState
	jp .asm_adc43
.asm_adcfd
	ld a, [bc]
	cp $08
	ret c
	ld a, $35
	call SetSceneWarioState
	ld a, $04
	jp .asm_adc4a

.Func_add0b:
	ld a, [wPalFade6Colour2GreenTarget]
	jumptable
	dw .Func_add21
	dw .Func_add2a
	dw .Func_add36
	dw .Func_add8a
	dw .Func_add93
	dw .Func_adda5
	dw .Func_addae
	dw .Func_addb7
	dw .Func_addc0

.Func_add21:
	ld a, [wOWUIObj1State]
	cp $01
	ret nz
	jp .asm_adc43

.Func_add2a:
	ld a, [bc]
	cp $10
	ret c
	ld a, $3c
	call SetSceneWarioState
	jp .asm_adc43

.Func_add36:
	ld a, [wJoypadPressed]
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit B_PAD_LEFT, a
	jr nz, .d_left
	and PAD_A | PAD_UP
	jr nz, .a_btn_or_d_up
	ret

.d_right
	ld a, WEST
	ld [wNextMapSide], a
	ld a, OW_EXIT_LEFT
	ld [wMapSideLevelID], a
	ld [w2d068], a
	ld a, $37
	call SetSceneWarioState
	ld hl, wPalFade6Colour2GreenSign
	xor a
	ld [hld], a
	ld [hl], $07
	ret

.d_left
	ld a, NORTH
	ld [wNextMapSide], a
	ld a, OW_EXIT_RIGHT
	ld [wMapSideLevelID], a
	ld [w2d068], a
	ld a, $36
	call SetSceneWarioState
	ld hl, wPalFade6Colour2GreenSign
	xor a
	ld [hld], a
	ld [hl], $05
	ret

.a_btn_or_d_up
	ld a, $30
	call SetSceneWarioState
	play_sfx SFX_12A
	jp .asm_adc43

.Func_add8a:
	ld a, [wOWUIObj1State]
	cp $02
	ret nz
	jp .asm_adc43

.Func_add93:
	ld a, [bc]
	cp $14
	ret c
	ld a, LEVEL_GOLF_BUILDING
	ld [wOWLevel], a
	xor a
	ld [wSubState], a
	ld hl, wState
	inc [hl]
	ret

.Func_adda5:
	ld a, [wOWUIObj1State]
	cp $0c
	ret nz
	jp .asm_adc43

.Func_addae:
	ld a, [bc]
	cp $04
	ret c
	ld a, $01
	jp .asm_adc4a

.Func_addb7:
	ld a, [wOWUIObj1State]
	cp $0d
	ret nz
	jp .asm_adc43

.Func_addc0:
	ld a, [bc]
	cp $04
	ret c
	ld a, $00
	jp .asm_adc4a

Pals_addc9:
	rgb 31, 31, 31
	rgb  4,  4,  4
	rgb 29, 29, 29
	rgb  0,  0,  0

	rgb  4,  4,  4
	rgb 29, 29, 29
	rgb 17, 17, 17
	rgb  6,  6,  6

	rgb  4,  4,  4
	rgb 10, 10, 10
	rgb  4,  4,  4
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  4,  4,  4
	rgb 14, 14, 14
	rgb  6,  6,  6

	rgb 27, 27, 27
	rgb  6,  6,  6
	rgb  3,  3,  3
	rgb  2,  2,  2

	rgb 25, 25, 25
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  4,  4,  4

	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb 10, 10, 10
	rgb  2,  2,  2

	rgb 31, 31, 31
	rgb  6,  6,  6
	rgb 10, 10, 10
	rgb  2,  2,  2

Pals_ade09:
	rgb 31, 31, 31
	rgb  9,  4,  0
	rgb  8, 23, 31
	rgb  0,  3,  0

	rgb 12,  6,  0
	rgb 26, 28, 16
	rgb  0, 16,  6
	rgb  0,  5,  0

	rgb 12,  6,  0
	rgb 25, 14,  0
	rgb  0,  3,  0
	rgb  0,  5,  6

	rgb 13, 25, 31
	rgb  9,  4,  0
	rgb  0, 13, 18
	rgb  0,  5,  6

	rgb  8, 23, 31
	rgb 31, 31,  0
	rgb 31, 14,  0
	rgb  0,  0,  0

	rgb  3, 20, 30
	rgb  0, 21, 10
	rgb  0,  9,  4
	rgb  0,  3,  0

	rgb 31, 23, 28
	rgb 23,  5, 18
	rgb 10,  4,  9
	rgb  0,  0,  0

	rgb 31, 18, 11
	rgb  9,  0,  0
	rgb 31,  0,  0
	rgb  0,  3,  0

_InitPrologueSequence:
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM
	call VBlank_PrologueEpilogue

	decompress_attrmap PrologueAttrmap, v1BGMap1
	decompress_tilemap PrologueTilemap, v0BGMap1

	ld hl, PrologueBackgroundGfx
	ld b, BANK(PrologueBackgroundGfx)
	call LoadFarTiles

	decompress_tiles1 FontGfx, v1Tiles0
	decompress_tiles1 PrologueGfx, v1Tiles0

	decompress_attrmap MusicBoxAttrmap, v1BGMap0
	decompress_tilemap MusicBoxTilemap, v0BGMap0

	ld hl, MusicBoxGfx
	ld de, v0Tiles1
	ld b, BANK(MusicBoxGfx)
	ld c, $3
	call CopyFarBytes_Long

	ld a, [wLanguage]
	and a
	jr z, .japanese
; english
	decompress_tilemap TextEN_HiddenFigureAreYouAware, wTextBuffer
	jr .asm_adf63
.japanese
	decompress_tilemap TextJP_HiddenFigureAreYouAware, wTextBuffer
.asm_adf63
	call FillClearedTextBuffer

	; clear temp pals
	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes

	ld hl, wSceneWarioYCoord
	ld a, $60
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, SCENEWARIO_GROUP_NONE
	ld [wSceneWarioStateGroup], a
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a
	ret

Func_adf92:
	ld a, [w2d014]
	cp c
	ret c
;	fallthrough

Func_adf97:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret

Func_adf9e:
	ld hl, wSubState
	inc [hl]
	ret

Func_adfa3:
	call Func_adfb0
	call Func_ac3d9
	call UpdateSceneWarioAnimation
	call Func_ac3fd
	ret

Func_adfb0:
	ld a, [w2d013]
	jumptable

	dw Func_adf97
	dw Func_ae002
	dw Func_ae007
	dw Func_ac9ba
	dw Func_ae6d3
	dw Func_ae016
	dw Func_ae82a
	dw Func_ae021
	dw Func_ac9ba
	dw Func_ae025
	dw Func_ac9ba
	dw Func_ae22d
	dw Func_ae079
	dw Func_ae1de
	dw Func_ae0c4
	dw Func_ae31c
	dw Func_ae021
	dw Func_ac9ba
	dw Func_ae0f9
	dw Func_ae119
	dw Func_ae127
	dw Func_ae134
	dw Func_ae15b
	dw Func_ae55c
	dw Func_ae164
	dw Func_ae169
	dw Func_ae641
	dw InitTextPrinting
	dw Func_aca9e
	dw Func_ae17c
	dw LoadCurTextPageBufferPage
	dw Func_acacd
	dw Func_acae7
	dw Func_ae181
	dw Func_ae196
	dw Func_ae19e
	dw Func_ae1af
	dw Func_ae668
	dw Func_adf9e

Func_ae002:
	ld c, $3c
	jp Func_adf92

Func_ae007:
	ld a, $01
;	fallthrough

Func_ae009:
	ld [w2d880], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_adf97

Func_ae016:
	ld hl, wSCX
	inc [hl]
	ld a, [hl]
	cp $28
	ret nz
	jp Func_adf97

Func_ae021:
	ld a, $00
	jr Func_ae009

Func_ae025:
	ld a, $70
	ld [wSCY], a
	xor a
	ld [wSCX], a
	ld hl, wSceneWarioYCoord
	ld a, $d0
	ld [hli], a
	ld a, $f0
	ld [hl], a
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	call Func_ae067
	ld hl, wSceneObj1
	ld a, $bb
	ld [hli], a
	ld [wSceneObj2YCoord], a
	ld a, $78
	ld [hl], a
	ld [wSceneObj2XCoord], a
	xor a
	ld [w2d8b0], a
	ld hl, wSceneObj1State
	call SetSceneObjState
	play_music2 MUSIC_MUSIC_BOX_CAVE
	ld a, $06
	jr Func_ae009

Func_ae067:
	ld hl, wSceneObj3YCoord
	ld a, $c3
	ld [hli], a
	ld a, $78
	ld [hl], a
	ld hl, wSceneObj3State
	ld a, $09
	call SetSceneObjState
	ret

Func_ae079:
	xor a
	ld [wSCY], a
	ld [wSCX], a
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a
	ld a, $50
	ld hl, wSceneObj8
	ld [hli], a
	ld [hl], a
	ld a, $0d
	ld hl, wSceneObj8State
	call SetSceneObjState
	xor a
	ld hl, wSceneObj3State
	call SetSceneObjState

	ld hl, Pals_86a8d
	ld de, wTempOBPals
	ld c, 1 palettes
	ld b, BANK(Pals_86a8d)
	call CopyFarBytes
	ld hl, Pals_86a0d
	;	fallthrough

Func_ae0ab:
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86a0d)
	call CopyFarBytes

	ld de, Data_ac9f5
	call Func_ac9e9
	ld de, Data_ac9ff
	call Func_ac9e4
	jp Func_adf97

Func_ae0c4:
	ld a, $70
	ld [wSCY], a
	xor a
	ld [wSCX], a
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a
	ld a, SCENEWARIO_HOLD_MUSIC_BOX
	call SetSceneWarioState
	call Func_ae067
	ld a, $0e
	ld hl, wSceneObj1State
	call SetSceneObjState
	xor a
	ld hl, wSceneObj8State
	call SetSceneObjState
	ld hl, wTempPals2
	ld de, wTempOBPals
	ld b, $08
	call CopyHLToDE
	ld hl, Pals_869cd
	jr Func_ae0ab

Func_ae0f9:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, TempleTilemap
	ld b, HIGH(v0BGMap0) - $80
	ld c, 18 dma_rows
;	fallthrough

Func_ae104:
	ld a, BANK(TempleTilemap)
	ld [wHDMABank], a
	ld hl, wHDMA
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	ld [hl], a
	jp Func_adf97

Func_ae119:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, TempleAttrmap
	ld b, HIGH(v0BGMap0) - $80
	ld c, 18 dma_rows
	jr Func_ae104

Func_ae127:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, TempleGfx
	ld b, HIGH(v0Tiles2) - $80
	ld c, $80 dma_tiles
	jr Func_ae104

Func_ae134:
	xor a
	ld [wSCY], a
	ld [wSCX], a
	ld a, LCDC_BG_MAP
	ld [wLCDCFlagsToFlip], a
	ld hl, wSceneWarioYCoord
	ld a, $60
	ld [hli], a
	ld a, $40
	ld [hl], a
	ld a, SCENEWARIO_SLEEP
	call SetSceneWarioState
	play_sfx SFX_0F5
	ld a, $05
	jp Func_ae009

Func_ae15b:
	ld a, [w2d014]
	and $07
	ret nz
	jp Func_ac9ba

Func_ae164:
	ld a, $02
	jp Func_ae009

Func_ae169:
	ld c, $07
	ld a, [wPalConfig1TotalSteps]
	cp $08
	jr c, .asm_ae174
	ld c, $01
.asm_ae174
	ld a, [w2d014]
	and c
	ret nz
	jp Func_ac9ba

Func_ae17c:
	ld c, $1e
	jp Func_adf92

Func_ae181:
	call Func_acaf3
	call Func_ae188
	ret

Func_ae188:
	ld a, [wCurTextBufferPage]
	cp $02
	jr z, .asm_ae190
	ret
.asm_ae190
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	ret

Func_ae196:
	ld a, SCENEWARIO_NOD_ONCE
	call SetSceneWarioState
	jp Func_adf97

Func_ae19e:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_adf97

Func_ae1af:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	ld hl, wSceneObj1State
	xor a
	call SetSceneObjState
	call ClearTextbox
	jp Func_adf97

Func_ae1c2:
	ld a, [wSceneWarioState]
	cp b
	ret nz
	jr Func_ae1ce

Func_ae1c9:
	ld a, [w2d891]
	cp c
	ret c
;	fallthrough

Func_ae1ce:
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl] ; w2d890
	ret

Func_ae1d5:
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a ; w2d891
	jp Func_adf97

Func_ae1de:
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw Func_ae1f1
	dw Func_ae1f5
	dw Func_ae211
	dw Func_ae215
	dw Func_ae229
	dw Func_ae1d5

Func_ae1f1:
	ld c, $14
	jr Func_ae1c9

Func_ae1f5:
	ld hl, wSceneObj4
	ld a, $38
	ld [hli], a
	ld a, $38
	ld [hl], a
	ld a, $0e
	ld hl, wSceneObj4State
	call SetSceneObjState
	play_sfx SFX_104
	jp Func_ae1ce

Func_ae211:
	ld c, $0a
	jr Func_ae1c9

Func_ae215:
	ld hl, wSceneObj5
	ld a, $30
	ld [hli], a
	ld a, $78
	ld [hl], a
	ld a, $0e
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp Func_ae1ce

Func_ae229:
	ld c, $5a
	jr Func_ae1c9

Func_ae22d:
	call Func_ae2dd
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw Func_ae251
	dw Func_ae259
	dw Func_ae272
	dw Func_ae27a
	dw Func_ae2a2
	dw Func_ae2aa
	dw Func_ae251
	dw Func_ae2af
	dw Func_ae2b8
	dw Func_ae2cb
	dw Func_ae2d3
	dw Func_ae2d8
	dw Func_ae1d5

Func_ae251:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae259:
	call ApplySceneWarioMovementRight
	cp $32
	jr z, Func_ae26c
	cp $40
	ret nz
	ld [hl], a

Func_ae264:
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae26c:
	ld a, $01
	ld [w2d8b0], a
	ret

Func_ae272:
	ld a, [w2d8b0]
	and a
	ret nz
	jp Func_ae1ce

Func_ae27a:
	ld a, [w2d891]
	cp $16
	ret c
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub $18
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add $10
	ld [hl], a
	ld a, $11
	ld hl, wCurSceneObjState
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ae1ce

Func_ae2a2:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	jp Func_ae1ce

Func_ae2aa:
	ld c, $1a
	jp Func_ae1c9

Func_ae2af:
	call ApplySceneWarioMovementRight
	cp $66
	ret nz
	ld [hl], a
	jr Func_ae264

Func_ae2b8:
	ld a, [w2d891]
	cp $14
	jr z, .asm_ae2c5
	cp $3c
	ret c
	jp Func_ae1ce
.asm_ae2c5
	ld a, $03
	ld [w2d8b0], a
	ret

Func_ae2cb:
	ld a, SCENEWARIO_LOOK_MUSIC_BOX
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae2d3:
	ld b, SCENEWARIO_HOLD_MUSIC_BOX
	jp Func_ae1c2

Func_ae2d8:
	ld c, $3c
	jp Func_ae1c9

Func_ae2dd:
	ld a, [w2d8b0]
	jumptable
	dw Func_ae2fb
	dw Func_ae2ed
	dw Func_ae303
	dw Func_ae2ed
	dw Func_ae2fc
	dw Func_ae30e

Func_ae2ed:
	ld a, $0e
	ld hl, wSceneObj1State
	call SetSceneObjState
Func_ae2f5:
	ld hl, w2d8b1
	xor a
	ld [hld], a
	inc [hl] ; w2d8b0
Func_ae2fb:
	ret

Func_ae2fc:
	ld a, [wSceneObj1State]
	and a
	ret nz
	jr Func_ae2f5

Func_ae303:
	ld a, [wSceneObj1State]
	and a
	ret nz
	ld hl, w2d8b0
	ld [hli], a
	ld [hl], a
	ret

Func_ae30e:
	ld hl, w2d8b1
	inc [hl]
	ld a, [hl]
	cp $14
	ret c
	ld hl, w2d8b0
	dec [hl]
	dec [hl]
	ret

Func_ae31c:
	call Func_ae523
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae352
	dw Func_ae35a
	dw Func_ae36f
	dw Func_ae374
	dw Func_ae37c
	dw Func_ae38d
	dw Func_ae3a9
	dw Func_ae3d3
	dw Func_ae3d8
	dw Func_ae3e2
	dw Func_ae3fa
	dw Func_ae407
	dw Func_ae435
	dw Func_ae442
	dw Func_ae447
	dw Func_ae476
	dw Func_ae488
	dw Func_ae4a4
	dw Func_ae4a9
	dw Func_ae4e5
	dw Func_ae51e
	dw Func_ae1d5

Func_ae352:
	ld a, [wSceneObj1State]
	and a
	ret nz
	jp Func_ae1ce

Func_ae35a:
	ld a, [w2d891]
	cp $14
	ret c
	stop_music2
	jp Func_ae1ce

Func_ae36f:
	ld c, $1e
	jp Func_ae1c9

Func_ae374:
	ld a, SCENEWARIO_PICKUP_MUSIC_BOX
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae37c:
	ld a, [w2d891]
	cp $08
	ret nc
	ld hl, wSceneObj3State
	ld a, $0a
	call SetSceneObjState
	jp Func_ae1ce

Func_ae38d:
	ld hl, wSceneWario
	ld a, [w2d891]
	cp $01
	jr z, .asm_ae3a1
	cp $05
	jr z, .asm_ae3a5
	cp $30
	ret c
	jp Func_ae1ce
.asm_ae3a1
	dec [hl] ; y
	inc l
	dec [hl] ; x
	ret
.asm_ae3a5
	inc [hl] ; y
	inc l
	dec [hl] ; x
	ret

Func_ae3a9:
	ld a, [w2d891]
	and $07
	ret nz
	ld hl, wSceneObj3YCoord
	dec [hl]
	ld a, [hl]
	ld b, a
	sub $08
	ld [wSceneObj2YCoord], a
	ld a, b
	cp $b4
	jr z, .asm_ae3c5
	cp $a5
	ret nz
	jp Func_ae1ce
.asm_ae3c5
	ld hl, wSceneObj2State
	ld a, $0c
	call SetSceneObjState
	ld a, $01
	ld [w2d150], a
	ret

Func_ae3d3:
	ld c, $78
	jp Func_ae1c9

Func_ae3d8:
	xor a
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_ae1ce

Func_ae3e2:
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub $08
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	ld [hl], a
	ld a, $0e
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp Func_ae1ce

Func_ae3fa:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	ld a, $80
	ld [w2d150], a
	jp Func_ae1ce

Func_ae407:
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub $10
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add $02
	ld [hl], a
	ld a, $15
	ld hl, wCurSceneObjState
	call SetSceneObjState

	ld hl, wTempOBPals
	ld b, $04
.asm_ae423
	ld a, $9c
	ld [hli], a
	ld a, $73
	ld [hli], a
	dec b
	jr nz, .asm_ae423
	ld de, Data_ac9ff
	call Func_ac9e4
	jp Func_ae1ce

Func_ae435:
	ld a, [wCurSceneObjState]
	cp $16
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae442:
	ld c, $3c
	jp Func_ae1c9

Func_ae447:
	ld hl, wCurSceneObj
	ld a, [hli]
	cp $b5
	jr c, .asm_ae45e
	ld a, [w2d891]
	ld b, a
	and $03
	ret nz
	bit 2, b
	jr z, .asm_ae45b
	inc [hl] ; w2d181
.asm_ae45b
	dec l
	dec [hl] ; wCurSceneObj
	ret

.asm_ae45e
	inc [hl] ; w2d181
	dec l
	dec [hl] ; wCurSceneObj
	dec [hl]
	ld a, [hl]
	cp $a8
	jr z, .asm_ae46d
	cp $9c
	ret nz
	jp Func_ae1ce
.asm_ae46d
	ld a, $17
	ld hl, wCurSceneObjState
	call SetSceneObjState
	ret

Func_ae476:
	ld a, $09
	ld hl, wSceneObj3State
	call SetSceneObjState
	xor a
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp Func_ae1ce

Func_ae488:
	ld a, [w2d891]
	srl a
	ret c
	ld hl, wSceneObj3XCoord
	cp $01
	jr z, .asm_ae49f
	cp $02
	jr z, .asm_ae4a1
	call .asm_ae49f
	jp Func_ae1ce
.asm_ae49f
	inc [hl]
	ret
.asm_ae4a1
	dec [hl]
	dec [hl]
	ret

Func_ae4a4:
	ld c, $28
	jp Func_ae1c9

Func_ae4a9:
	ld hl, w2d891
	call Func_ae4c0
	ld hl, wSceneObj3YCoord
	add [hl]
	ld [hl], a
	cp $c3
	ret c
	ld a, $c3
	ld [hl], a
	call Func_ae515
	jp Func_ae1ce

Func_ae4c0:
	ld a, [hl]
	cp $14
	jr c, .asm_ae4c8
	ld a, $10
	ld [hl], a
.asm_ae4c8
	ld e, a
	ld d, $00
	ld hl, .data_ae4d1
	add hl, de
	ld a, [hl]
	ret

.data_ae4d1
	db 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 2

Func_ae4e5:
	ld hl, w2d891
	call Func_ae4fe
	and a
	ret z
	ld hl, wSceneObj3YCoord
	add [hl]
	ld [hl], a
	cp $c3
	call z, Func_ae515
	ld a, $80
	cp b
	ret nz
	jp Func_ae1ce

Func_ae4fe:
	ld a, [hl]
	ld e, a
	ld d, $00
	ld hl, .data_ae509
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ret
.data_ae509
	db 0, -2, 0, 0, 1, 0, 1, 0, -1, 0, 1, $80

Func_ae515:
	play_sfx SFX_BUMP
	ret

Func_ae51e:
	ld c, $78
	jp Func_ae1c9

Func_ae523:
	ld hl, w2d150
	ld a, [hl]
	and a
	ret z
	cp $80
	jr z, .asm_ae554
	ld hl, w2d151
	inc [hl]
	ld a, [hl]
	cp $02
	ret c
	xor a
	ld [hld], a ; w2d151
	ld c, [hl] ; w2d150
	inc [hl]
	ld a, [hl]
	cp $09
	jr c, .asm_ae540
	ld [hl], $01
.asm_ae540
	ld hl, .data_ae54b
	ld b, $00
	add hl, bc
	ld a, [hl]
	ld [wSceneWarioAttributes], a
	ret

.data_ae54b
	db $0
	db $0
	db $1
	db $2
	db $3
	db $4
	db $5
	db $6
	db $7

.asm_ae554
	xor a
	ld [wSceneWarioAttributes], a
	ld [w2d150], a
	ret

Func_ae55c:
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae585
	dw Func_ae58d
	dw Func_ae599
	dw Func_ae5a8
	dw Func_ae5b1
	dw Func_ae5d0
	dw Func_ae5dc
	dw Func_ae5f0
	dw Func_ae5f5
	dw Func_ae5fd
	dw Func_ae60c
	dw Func_ae618
	dw Func_ae61d
	dw Func_ae630
	dw Func_ae63c
	dw Func_ae1d5

Func_ae585:
	ld a, [w2d14e]
	inc a
	ret nz
	jp Func_ae1ce

Func_ae58d:
	ld a, [bc]
	cp $4b
	ret c
	ld a, SCENEWARIO_WAKE_UP
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae599:
	ld a, [bc]
	cp $14
	ret c
	play_sfx SFX_GRAB
	jp Func_ae1ce

Func_ae5a8:
	ld a, [wSceneWarioState]
	cp SCENEWARIO_SIT_IDLE
	ret nz
	jp Func_ae1ce

Func_ae5b1:
	ld a, [bc]
	cp $05
	ret c
	ld a, [wSceneWarioYCoord]
	sub $01
	ld [wCurSceneObjYCoord], a
	ld a, [wSceneWarioXCoord]
	add $09
	ld [wCurSceneObjXCoord], a
	ld a, $14
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp Func_ae1ce

Func_ae5d0:
	ld a, [bc]
	cp $8c
	ret c
	ld a, SCENEWARIO_SIT_STILL
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae5dc:
	ld a, [bc]
	cp $10
	ret c
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	play_sfx SFX_12A
	jp Func_ae1ce

Func_ae5f0:
	ld c, $3c
	jp Func_ae1c9

Func_ae5f5:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae5fd:
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae60c:
	ld a, [bc]
	cp $1e
	ret c
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae618:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae61d:
	ld a, [bc]
	cp $1e
	ret c
	play_music2 MUSIC_THE_TEMPLE
	jp Func_ae1ce

Func_ae630:
	ld a, [bc]
	cp $1e
	ret c
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae63c:
	ld c, $1e
	jp Func_ae1c9

Func_ae641:
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae652
	dw Func_ae657
	dw Func_ae663
	dw Func_ae1d5

Func_ae652:
	ld b, SCENEWARIO_LOOK_FORWARD
	jp Func_ae1c2

Func_ae657:
	ld a, SCENEWARIO_JUMP_AND_BOW
	call SetSceneWarioState
	xor a
	ld [wSceneWarioUnk7], a
	jp Func_ae1ce

Func_ae663:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae668:
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae683
	dw Func_ae68b
	dw Func_ae69c
	dw Func_ae6a1
	dw Func_ae6a6
	dw Func_ae6ae
	dw Func_ae6b3
	dw Func_ae6c1
	dw Func_ae6ce
	dw Func_ae1d5

Func_ae683:
	ld a, SCENEWARIO_SNAP_FINGERS
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae68b:
	ld a, [wSceneWarioFrame]
	cp $0f
	ret nz
	play_sfx SFX_106
	jp Func_ae1ce

Func_ae69c:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae6a1:
	ld c, $1e
	jp Func_ae1c9

Func_ae6a6:
	ld a, SCENEWARIO_TURN_BACK_TO_LEFT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae6ae:
	ld b, SCENEWARIO_IDLE_LEFT
	jp Func_ae1c2

Func_ae6b3:
	ld a, [w2d891]
	cp $04
	ret c
	ld a, SCENEWARIO_WALK_LEFT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae6c1:
	call ApplySceneWarioMovementLeft
	cp $f0
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae6ce:
	ld c, $1e
	jp Func_ae1c9

Func_ae6d3:
	call Func_ae8bb
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl] ; w2d890
	jumptable
	dw Func_ae6f3
	dw Func_ae6f8
	dw Func_ae718
	dw Func_ae801
	dw Func_ae806
	dw Func_ae80e
	dw Func_ae813
	dw Func_ae818
	dw Func_ae820
	dw Func_ae825
	dw Func_ae1d5

Func_ae6f3:
	ld c, $4a
	jp Func_ae1c9

Func_ae6f8:
	ld hl, wSceneWarioYCoord
	ld a, $3c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	ld a, SCENEWARIO_ON_FIRE
	call SetSceneWarioState
	play_sfx SFX_THROW
	xor a
	ld [w2d894], a
	ld [w2d892], a
	jp Func_ae1ce

Func_ae718:
	call Func_ae724
	ld a, [w2d892]
	cp $80
	ret nz
	jp Func_ae1ce

Func_ae724:
	ld a, [w2d894]
	and a
	jr z, .asm_ae740
	ld a, [w2d891]
	and $03
	jr z, .asm_ae740
	ld de, Data_aed06
	ld hl, wSceneWario
	call ApplyOWMovement
	jr nz, .asm_ae740
	xor a
	ld [w2d894], a
.asm_ae740
	ld a, [w2d892]
	and a
	jr z, .asm_ae763
	dec a
	jr z, .asm_ae771
	dec a
	jr z, .asm_ae794
	dec a
	jr z, .asm_ae79e
	dec a
	jr z, .asm_ae7a5
	dec a
	jr z, .asm_ae794
	dec a
	jr z, .asm_ae7b5
	dec a
	jr z, .asm_ae7c5
	dec a
	jr z, .asm_ae7d4
	dec a
	jp z, Func_ae7f2
	ret

.asm_ae763
	ld a, $01
	ld [w2d894], a
.asm_ae768
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.asm_ae771
	ld a, [wSceneWarioYCoord]
	cp $60
	ret nz
	ld a, SCENEWARIO_STUNNED_RIGHT
	call SetSceneWarioState
	call Func_ae7f8
.asm_ae77f
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	ld [hl], a
	ld a, $10
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jr .asm_ae768
.asm_ae794
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_ae768
.asm_ae79e
	ld a, SCENEWARIO_CRASH_TUMBLE_END
	call SetSceneWarioState
	jr .asm_ae768
.asm_ae7a5
	ld a, [wSceneWarioYCoord]
	cp $60
	ret nz
	ld a, SCENEWARIO_CRASH_LAND_RIGHT
	call SetSceneWarioState
	call Func_ae7f8
	jr .asm_ae77f
.asm_ae7b5
	ld a, [wSceneWarioYCoord]
	cp $60
	ret nz
	ld a, SCENEWARIO_CRASH_LAND_RIGHT
	call SetSceneWarioState
	call Func_ae7f8
	jr .asm_ae768
.asm_ae7c5
	ld a, [wSceneWarioState]
	cp SCENEWARIO_STUNNED_RIGHT
	ret nz
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.asm_ae7d4
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $3e
	ret c
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	play_sfx SFX_12A
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

Func_ae7f2:
	ld a, $80
	ld [w2d892], a
	ret

Func_ae7f8:
	play_sfx SFX_BUMP
	ret

Func_ae801:
	ld c, $3c
	jp Func_ae1c9

Func_ae806:
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae80e:
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2

Func_ae813:
	ld c, $26
	jp Func_ae1c9

Func_ae818:
	ld a, SCENEWARIO_LOOK_AROUND_THEN_TURN
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae820:
	ld b, SCENEWARIO_IDLE_RIGHT
	jp Func_ae1c2

Func_ae825:
	ld c, $2e
	jp Func_ae1c9

Func_ae82a:
	ld hl, w2d891
	inc [hl]
	dec l
	ld a, [hl]
	jumptable
	dw Func_ae84b
	dw Func_ae8a0
	dw Func_ae850
	dw Func_ae85f
	dw Func_ae864
	dw Func_ae86c
	dw Func_ae871
	dw Func_ae893
	dw Func_ae89b
	dw Func_ae8a0
	dw Func_ae8a8
	dw Func_ae8b6
	dw Func_ae1d5

Func_ae84b:
	ld c, $3c
	jp Func_ae1c9

Func_ae850:
	call ApplySceneWarioMovementRight
	cp $78
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae85f:
	ld c, $3c
	jp Func_ae1c9

Func_ae864:
	ld a, SCENEWARIO_LOOK_UP
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae86c:
	ld b, SCENEWARIO_IDLE_RIGHT
	jp Func_ae1c2

Func_ae871:
	ld hl, wCurSceneObj
	ld a, [wSceneWarioYCoord]
	sub $18
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add $10
	ld [hl], a
	ld a, $11
	ld hl, wCurSceneObjState
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ae1ce

Func_ae893:
	ld a, [wCurSceneObjState]
	and a
	ret nz
	jp Func_ae1ce

Func_ae89b:
	ld c, $28
	jp Func_ae1c9

Func_ae8a0:
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae8a8:
	call ApplySceneWarioMovementRight
	cp $d0
	ret nz
	ld [hl], a
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae8b6:
	ld c, $28
	jp Func_ae1c9

Func_ae8bb:
	call Func_ae924
	call Func_ae9ee
	call Func_aeb0d
	call Func_aec1f

	ld hl, w2d8a1
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a0
	jumptable
	dw .Func_ae8d9
	dw .Func_ae8e8
	dw .Func_ae8f6
	dw .Func_ae904
	dw .Func_ae8d8

.Func_ae8d8:
	ret

.Func_ae8d9:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart1Counter
	call Func_ae915
	jp .asm_ae912

.Func_ae8e8:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart2Counter
	call Func_ae915
	jr .asm_ae912

.Func_ae8f6:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart3Counter
	call Func_ae915
	jr .asm_ae912

.Func_ae904:
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, wPlanePart4Counter
	call Func_ae915
	jr .asm_ae912 ; unnecessary jump
.asm_ae912
	ld hl, w2d8a1

Func_ae915:
	xor a
	ld [hld], a
	inc [hl]
	ret

Func_ae919:
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, c
	call SetSceneObjState
	ret

Func_ae924:
	ld hl, wPlanePart1Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart1Action
	and a
	ret z
	dec a
	jumptable
	dw Func_ae971
	dw Func_ae97e
	dw Func_ae983
	dw Func_ae989
	dw Func_ae98d
	dw Func_ae99a
	dw Func_ae99f
	dw Func_ae9a5
	dw Func_ae9a9
	dw Func_ae9b6
	dw Func_ae9bb
	dw Func_ae9c1
	dw Func_ae9c5

Func_ae948:
	play_sfx SFX_006

Func_ae950:
	ld hl, wPlanePart1Counter
	jp Func_ae915

Func_ae956:
	ld a, [wSceneObj3YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart1Action
	inc [hl]
	ret

Func_ae969:
	ld hl, wPlanePart1Counter
	ld a, [hl]
	cp c
	ret c
	jr Func_ae915

Func_ae971:
	ld hl, wSceneObj3
	lb de, $2e, $f0
	ld c, $06
	call Func_ae919
	jr Func_ae950

Func_ae97e:
	call Func_ae9d0
	jr Func_ae956

Func_ae983:
	call Func_ae9d0
	ret nz
	jr Func_ae948

Func_ae989:
	ld c, $08
	jr Func_ae969

Func_ae98d:
	ld hl, wSceneObj3
	lb de, $4d, $e0
	ld c, $05
	call Func_ae919
	jr Func_ae950

Func_ae99a:
	call Func_ae9da
	jr Func_ae956

Func_ae99f:
	call Func_ae9da
	ret nz
	jr Func_ae948

Func_ae9a5:
	ld c, $28
	jr Func_ae969

Func_ae9a9:
	ld hl, wSceneObj3
	lb de, $3e, $f0
	ld c, $04
	call Func_ae919
	jr Func_ae950

Func_ae9b6:
	call Func_ae9e4
	jr Func_ae956

Func_ae9bb:
	call Func_ae9e4
	ret nz
	jr Func_ae948

Func_ae9c1:
	ld c, $08
	jr Func_ae969

Func_ae9c5:
	xor a
	ld [wPlanePart1Action], a
	ld hl, wSceneObj3State
	call SetSceneObjState
	ret

Func_ae9d0:
	ld de, Data_aee09
	ld hl, wSceneObj3
	call ApplyOWMovement
	ret

Func_ae9da:
	ld de, Data_aedba
	ld hl, wSceneObj3
	call ApplyOWMovement
	ret

Func_ae9e4:
	ld de, Data_aed6d
	ld hl, wSceneObj3
	call ApplyOWMovement
	ret

Func_ae9ee:
	ld hl, wPlanePart2Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart2Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_aea40
	dw .Func_aea54
	dw .Func_aea59
	dw .Func_aea5f
	dw .Func_aea63
	dw .Func_aea6d
	dw .Func_aea71
	dw .Func_aea92
	dw .Func_aeab9
	dw .Func_aeac0
	dw .Func_aeac5
	dw .Func_aead2
	dw .Func_aead8
	dw .Func_aeadf
	dw .Func_aeae4

.Func_aea16:
	play_sfx SFX_006
.Func_aea1e:
	ld hl, wPlanePart2Counter
	jp Func_ae915

.Func_aea24:
	ld a, [wSceneObj4YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart2Action
	inc [hl]
	ret

.Func_aea37:
	ld hl, wPlanePart2Counter
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aea40:
	ld hl, wSceneObj4
	lb de, $3e, $f0
	ld c, $02
	call Func_ae919
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea54:
	call .Func_aeaef
	jr .asm_aea95

.Func_aea59:
	call .Func_aeaef
	ret nz
	jr .Func_aea16

.Func_aea5f:
	ld c, $04
	jr .Func_aea37

.Func_aea63:
	ld a, $12
	ld hl, wSceneObj4State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea6d:
	ld c, $28
	jr .Func_aea37

.Func_aea71:
	ld hl, wSceneObj4
	lb de, $2e, $e0
	ld c, $08
	call Func_ae919

.Func_aea7c:
	ld a, [wSceneObj4YCoord]
	ld [wSceneObj1YCoord], a
	ld a, [wSceneObj4XCoord]
	ld [wSceneObj1XCoord], a
	ld a, $0f
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea92:
	call .Func_aeaf9

.asm_aea95
	ld a, [wSceneObj4XCoord]
	ld [wSceneObj1XCoord], a
	ld a, [wSceneObj4YCoord]
	ld [wSceneObj1YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wSceneObj1State
	call SetSceneObjState
	play_sfx SFX_006
	ld hl, wPlanePart2Action
	inc [hl]
	ret

.Func_aeab9:
	call .Func_aeaf9
	ret nz
	jp .Func_aea16

.Func_aeac0:
	ld c, $08
	jp .Func_aea37

.Func_aeac5:
	ld hl, wSceneObj4
	lb de, $2e, $f4
	ld c, $04
	call Func_ae919
	jr .Func_aea7c

.Func_aead2:
	call .Func_aeb03
	jp .Func_aea24

.Func_aead8:
	call .Func_aeb03
	ret nz
	jp .Func_aea16

.Func_aeadf:
	ld c, $08
	jp .Func_aea37

.Func_aeae4:
	xor a
	ld [wPlanePart2Action], a
	ld hl, wSceneObj4State
	call SetSceneObjState
	ret

.Func_aeaef:
	ld de, Data_aed6d
	ld hl, wSceneObj4
	call ApplyOWMovement
	ret

.Func_aeaf9:
	ld de, Data_aee09
	ld hl, wSceneObj4
	call ApplyOWMovement
	ret

.Func_aeb03:
	ld de, Data_aee09
	ld hl, wSceneObj4
	call ApplyOWMovement
	ret

Func_aeb0d:
	ld hl, wPlanePart3Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart3Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_aeb5f
	dw .Func_aeb80
	dw .Func_aeba7
	dw .Func_aebad
	dw .Func_aebb1
	dw .Func_aebbf
	dw .Func_aebc5
	dw .Func_aebcc
	dw .Func_aebd0
	dw .Func_aebdb
	dw .Func_aebe0
	dw .Func_aebee
	dw .Func_aebf4
	dw .Func_aebfb
	dw .Func_aec00

.Func_aeb35:
	play_sfx SFX_006
.Func_aeb3d:
	ld hl, wPlanePart3Counter
	jp Func_ae915

.Func_aeb43:
	ld a, [wSceneObj5YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart3Action
	inc [hl]
	ret

.Func_aeb56:
	ld hl, wPlanePart3Counter
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aeb5f:
	ld hl, wSceneObj5
	lb de, $3e, $e0
	ld c, $03
	call Func_ae919
	ld a, [wSceneObj5YCoord]
	ld [wSceneObj2YCoord], a
	ld a, [wSceneObj5XCoord]
	ld [wSceneObj2XCoord], a
	ld a, $0f
	ld hl, wSceneObj2State
	call SetSceneObjState
	jr .Func_aeb3d

.Func_aeb80:
	call .Func_aec0b
	ld a, [wSceneObj5XCoord]
	ld [wSceneObj2XCoord], a
	ld a, [wSceneObj5YCoord]
	ld [wSceneObj2YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wSceneObj2State
	call SetSceneObjState
	play_sfx SFX_006
	ld hl, wPlanePart3Action
	inc [hl]
	ret

.Func_aeba7:
	call .Func_aec0b
	ret nz
	jr .Func_aeb35

.Func_aebad:
	ld c, $08
	jr .Func_aeb56

.Func_aebb1:
	ld hl, wSceneObj5
	lb de, $2e, $f0
	ld c, $07
	call Func_ae919
	jp .Func_aeb3d

.Func_aebbf:
	call .Func_aec15
	jp .Func_aeb43

.Func_aebc5:
	call .Func_aec15
	ret nz
	jp .Func_aeb35

.Func_aebcc:
	ld c, $04
	jr .Func_aeb56

.Func_aebd0:
	ld a, $13
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp .Func_aeb3d

.Func_aebdb:
	ld c, $28
	jp .Func_aeb56

.Func_aebe0:
	ld hl, wSceneObj5
	lb de, $4d, $f8
	ld c, $05
	call Func_ae919
	jp .Func_aeb3d

.Func_aebee:
	call .Func_aec1a
	jp .Func_aeb43

.Func_aebf4:
	call .Func_aec1a
	ret nz
	jp .Func_aeb35

.Func_aebfb:
	ld c, $08
	jp .Func_aeb56

.Func_aec00:
	xor a
	ld [wPlanePart3Action], a
	ld hl, wSceneObj5State
	call SetSceneObjState
	ret

.Func_aec0b:
	ld de, Data_aed6d
.Func_aec0e:
	ld hl, wSceneObj5
	call ApplyOWMovement
	ret

.Func_aec15:
	ld de, Data_aee09
	jr .Func_aec0e

.Func_aec1a:
	ld de, Data_aedba
	jr .Func_aec0e

Func_aec1f:
	ld hl, wPlanePart4Counter
	inc [hl]
	dec l
	ld a, [hl] ; wPlanePart4Action
	and a
	ret z
	dec a
	jumptable
	dw .Func_aec69
	dw .Func_aec76
	dw .Func_aec7b
	dw .Func_aec81
	dw .Func_aec85
	dw .Func_aec8f
	dw .Func_aec93
	dw .Func_aecb4
	dw .Func_aecdb
	dw .Func_aece2
	dw .Func_aece7

.Func_aec3f:
	play_sfx SFX_006
.Func_aec47:
	ld hl, wPlanePart4Counter
	jp Func_ae915

.Func_aec4d:
	ld a, [wSceneObj9YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, wPlanePart4Action
	inc [hl]
	ret

.Func_aec60:
	ld hl, wPlanePart4Counter
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aec69:
	ld hl, wSceneObj9
	lb de, $4d, $f0
	ld c, $07
	call Func_ae919
	jr .Func_aec47

.Func_aec76:
	call .Func_aecf2
	jr .Func_aec4d

.Func_aec7b:
	call .Func_aecf2
	ret nz
	jr .Func_aec3f

.Func_aec81:
	ld c, $04
	jr .Func_aec60

.Func_aec85:
	ld a, $13
	ld hl, wSceneObj9State
	call SetSceneObjState
	jr .Func_aec47

.Func_aec8f:
	ld c, $28
	jr .Func_aec60

.Func_aec93:
	ld hl, wSceneObj9
	lb de, $3e, $f0
	ld c, $08
	call Func_ae919
	ld a, [wSceneObj9YCoord]
	ld [wSceneObj8YCoord], a
	ld a, [wSceneObj9XCoord]
	ld [wSceneObj8XCoord], a
	ld a, $0f
	ld hl, wSceneObj8State
	call SetSceneObjState
	jr .Func_aec47

.Func_aecb4:
	call .Func_aecfc
	ld a, [wSceneObj9XCoord]
	ld [wSceneObj8XCoord], a
	ld a, [wSceneObj9YCoord]
	ld [wSceneObj8YCoord], a
	cp $62
	ret nz
	ld a, $10
	ld hl, wSceneObj8State
	call SetSceneObjState
	play_sfx SFX_006
	ld hl, wPlanePart4Action
	inc [hl]
	ret

.Func_aecdb:
	call .Func_aecfc
	ret nz
	jp .Func_aec3f

.Func_aece2:
	ld c, $08
	jp .Func_aec60

.Func_aece7:
	xor a
	ld [wPlanePart4Action], a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret

.Func_aecf2:
	ld de, Data_aedba
.Func_aecf5:
	ld hl, wSceneObj9
	call ApplyOWMovement
	ret

.Func_aecfc:
	ld de, Data_aed6d
	jr .Func_aecf5

.Func_aed01:
	ld de, Data_aee09
	jr .Func_aecf5

Data_aed06:
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 0
	db  0, 1
	db  0, 1
	db -1, 2
	db  0, 2
	db  0, 2
	db  1, 3
	db  0, 4
	db  1, 5
	db  2, 5
	db  2, 4
	db  3, 5
	db  2, 3
	db  2, 2
	db  2, 2
	db  2, 3
	db  3, 2
	db  2, 2
	db  3, 1
	db  3, 2
	db  3, 1
	db  3, 1
	db  3, 1
	db  0, 0
	db -3, 1
	db -3, 2
	db -2, 1
	db -3, 3
	db -1, 2
	db -2, 3
	db  0, 3
	db  0, 3
	db  1, 3
	db  2, 2
	db  2, 2
	db  2, 2
	db  2, 2
	db  2, 2
	db  3, 1
	db  0, 0
	db -2, 2
	db -2, 2
	db -2, 2
	db  0, 3
	db  0, 3
	db  2, 2
	db  2, 2
	db  2, 1
	db $80

Data_aed6d:
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 1
	db  0, 1
	db  0, 2
	db  0, 2
	db  0, 3
	db  0, 4
	db  1, 6
	db  2, 6
	db  2, 6
	db  3, 6
	db  2, 3
	db  2, 4
	db  3, 3
	db  2, 3
	db  3, 3
	db  3, 3
	db  3, 3
	db  3, 2
	db  4, 3
	db  3, 2
	db  0, 0
	db -2, 2
	db -3, 1
	db -2, 2
	db -2, 3
	db -1, 2
	db -1, 3
	db  0, 3
	db  0, 3
	db  1, 3
	db  1, 2
	db  2, 3
	db  2, 2
	db  3, 1
	db  2, 2
	db $80

Data_aedba:
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 1
	db -1, 1
	db  0, 2
	db  0, 2
	db  0, 3
	db  0, 3
	db  0, 5
	db  1, 6
	db  1, 7
	db  1, 7
	db  2, 7
	db  1, 4
	db  1, 5
	db  1, 4
	db  2, 5
	db  1, 4
	db  2, 5
	db  2, 4
	db  2, 5
	db  2, 4
	db  3, 4
	db  0, 0
	db -1, 2
	db -2, 3
	db -1, 2
	db -2, 3
	db -1, 2
	db -1, 3
	db  0, 3
	db  0, 3
	db  1, 3
	db  1, 2
	db  2, 3
	db  1, 2
	db  2, 3
	db  1, 2
	db $80

Data_aee09:
	db  0, 0
	db  0, 0
	db  0, 0
	db  0, 1
	db  0, 1
	db  0, 1
	db  1, 1
	db  0, 2
	db  1, 2
	db  2, 3
	db  2, 3
	db  2, 3
	db  4, 4
	db  4, 3
	db  3, 2
	db  3, 2
	db  3, 2
	db  4, 1
	db  3, 2
	db  4, 2
	db  4, 1
	db  4, 1
	db  4, 1
	db  4, 1
	db  0, 0
	db -2, 2
	db -3, 2
	db -2, 1
	db -2, 2
	db -2, 2
	db -2, 2
	db -1, 3
	db  1, 3
	db  2, 2
	db  2, 2
	db  2, 2
	db  2, 1
	db  3, 2
	db  2, 2
	db $80

_InitEpilogue:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	stop_music2

	ld a, $02
	ldh [rWBK], a
	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a

	call VBlank_PrologueEpilogue
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM

	xor a
	ld hl, wTempPals1
	ld bc, 8 palettes
	call WriteAToHL_BCTimes
	xor a
	ld hl, wTempPals2
	ld bc, 8 palettes
	call WriteAToHL_BCTimes

	decompress_tiles0 EpilogueGfx, v0Tiles0
	decompress_tiles1 FontGfx, v1Tiles0

	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, v0Tiles1
	ld de, wAttrmap
	ld bc, $50 tiles
	call CopyHLToDE_BC
	ld hl, EpilogueStarGfx
	ld de, v1Tiles1 tile $40
	ld c, $00 ; aka $100 bytes
	ld b, BANK(EpilogueStarGfx)
	call CopyFarBytes
	xor a
	ldh [rVBK], a

	decompress_tiles1 SpearheadGfx, v1Tiles0
	decompress_tiles1 HammerBotGfx, v1Tiles0, $40
	decompress_tiles1 DoughnuteerGfx, v1Tiles1

	decompress_attrmap EpilogueTransformationAttrmap, v1BGMap0
	decompress_tilemap EpilogueTransformationTilemap, v0BGMap0
	decompress_attrmap PrologueAttrmap, v1BGMap1
	decompress_tilemap PrologueTilemap, v0BGMap1

	call FillClearedTextBuffer
	ld a, [wLanguage]
	and a
	ld hl, TextJP_OldManThankYou ; japanese
	jr z, .got_text
	ld hl, TextEN_OldManThankYou ; english
.got_text
	ld a, BANK(TextJP_OldManThankYou) ; aka BANK(TextEN_OldManThankYou)
	ld [wTempBank], a
	ld bc, wTextBuffer
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress

	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a

	ld a, [wCollectionRow]
	ld b, a
	and a
	ld a, LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_WIN_9C00 | LCDC_ON
	jr z, .asm_af014
	xor b
.asm_af014
	ldh [rLCDC], a
	xor a
	ld [wCollectionRow], a
	ld hl, wSubState
	inc [hl]
	ret

; unreferenced
Func_af01f:
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM

	play_music2 MUSIC_EPILOGUE

	ld a, $02
	ldh [rWBK], a
	ld a, SCREEN_WIDTH_PX
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ldh [rSCY], a
	ld [wSCY], a

	ld hl, Pals_86add
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86add)
	call CopyFarBytes
	ld hl, Pals_86b1d
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_86b1d)
	call CopyFarBytes

	decompress_tiles1 FontGfx, v1Tiles0

	; attempting to decompress uncompressed data
	decompress_attrmap EpilogueCrowdAttrmap, v1BGMap0
	decompress_tilemap EpilogueCrowdTilemap, v0BGMap0

	ld hl, wOWUIObj1YCoord
	ld a, $60
	ld [hli], a
	ld [hl], $5c
	ld a, $ff
	ld [wOWUIObj2YCoord], a

	ld a, $0c
	call SetSceneWarioState
	ld hl, wSceneObj10
	ld a, $30
	ld [hli], a
	ld [hl], $00
	ld a, $1b
	ld hl, wSceneObj10State
	call SetSceneObjState
	ld hl, wSceneObj11
	ld a, $35
	ld [hli], a
	ld [hl], $20
	ld a, $1c
	ld hl, wSceneObj11State
	call SetSceneObjState
	ld hl, wSceneObj12
	ld a, $32
	ld [hli], a
	ld [hl], $70
	ld a, $1b
	ld hl, wSceneObj12State
	call SetSceneObjState
	ld hl, wSceneObj13
	ld a, $38
	ld [hli], a
	ld [hl], $c0
	ld a, $1c
	ld hl, wSceneObj13State
	call SetSceneObjState

	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	ld [w2d890], a
	ld [w2d891], a
	ld a, [wCollectionRow]
	ld b, a
	and a
	ld a, LCDC_BG_ON | LCDC_OBJ_ON | LCDC_OBJ_16 | LCDC_WIN_9C00 | LCDC_ON
	jr z, .asm_af127
	xor b
.asm_af127
	ldh [rLCDC], a
	xor a
	ld [wCollectionRow], a
	jp Func_af135

Func_af130:
	ld a, [w2d014]
	cp c
	ret c
;	fallthrough

Func_af135:
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret

Func_af13c:
	call .Func_af14c
	call Func_ac074
	call UpdateSceneWarioAnimation
	call Func_ac080
	call ClearUnusedVirtualOAM
	ret

.Func_af14c:
	call .Func_af8bc

	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable
	dw Func_af135
	dw .Func_af197
	dw .Func_af19c
	dw Func_ac9ca
	dw .Func_af7af
	dw .Func_af2d0
	dw Func_ac9ba
	dw .Func_af1e7
	dw .Func_af207
	dw .Func_af215
	dw .Func_af222
	dw .Func_af230
	dw .Func_af23e
	dw Func_ac9ca
	dw .Func_af741
	dw InitTextPrinting
	dw Func_aca9e
	dw .Func_af2bc
	dw LoadCurTextPageBufferPage
	dw Func_acacd
	dw .Func_af2c1
	dw Func_acaf3
	dw .Func_af670
	dw .Func_af2d0
	dw Func_ac9ba
	dw .Func_af2df
	dw .Func_af2f2
	dw Func_ac9ca
	dw .Func_af436
	dw .Func_af2d0
	dw .Func_af34a
	dw .Func_af353

.Func_af197:
	ld c, $3c
	jp Func_af130
.Func_af19c:
	ld hl, wSceneObj9
	ld a, $60
	ld [hli], a
	ld a, $50
	ld [hl], a
	ld a, $18
	ld hl, wSceneObj9State
	call SetSceneObjState
	call .Func_af1bd
	call .Func_af1db
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_af135
.Func_af1bd:
	call Func_aca09
	ld hl, Pals_86add
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86add)
	call CopyFarBytes
	ld hl, Pals_86b1d
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_86b1d)
	call CopyFarBytes
	ret
.Func_af1db:
	ld hl, .Pals_af35e
	ld de, wTempPals2 palette 4
	ld b, 3 palettes
	call CopyHLToDE
	ret
.Func_af1e7:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, OldMan1Gfx
	ld b, HIGH(v0Tiles1) - $80
	ld c, $40 dma_tiles
.asm_af1f2
	ld a, BANK(OldMan1Gfx)
	ld [wHDMABank], a
.asm_af1f7
	ld hl, wHDMA
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	ld [hl], a
	jp Func_af135
.Func_af207:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, OldMan2Gfx
	ld b, HIGH(v1Tiles0) - $80
	ld c, $80 dma_tiles
	jr .asm_af1f2
.Func_af215:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, EpilogueCrowdTilemap
	ld b, HIGH(v0BGMap0) - $80
	ld c, 18 dma_rows
	jr .asm_af1f2
.Func_af222:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, EpilogueCrowdAttrmap
	ld b, HIGH(v1BGMap0) - $80
	ld c, 18 dma_rows
	jr .asm_af1f2
.Func_af230:
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, wAttrmap
	ld b, HIGH(v1Tiles1) - $80
	ld c, $50 dma_tiles
	jr .asm_af1f2
.Func_af23e:
	ld a, SCREEN_WIDTH_PX
	ldh [rSCX], a
	ld [wSCX], a
	xor a
	ldh [rSCY], a
	ld [wSCY], a
	ld hl, wOWUIObj1YCoord
	ld a, $60
	ld [hli], a
	ld [hl], $5c
	ld a, $ff
	ld [wOWUIObj2YCoord], a
	ld a, $0c
	call SetSceneWarioState

	ld hl, wSceneObj10
	lb de, $30, $00
	ld b, $1b
	call .Func_af2ab
	ld hl, wSceneObj11
	lb de, $35, $20
	ld b, $1c
	call .Func_af2ab
	ld hl, wSceneObj12
	lb de, $32, $70
	ld b, $1b
	call .Func_af2ab
	ld hl, wSceneObj13
	lb de, $38, $c0
	ld b, $1c
	call .Func_af2ab

	ld hl, Pals_86add
	ld de, wTempPals1
	call .Func_af2b5
	ld hl, Pals_86b1d
	ld de, wTempPals2
	call .Func_af2b5

	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	ld [w2d890], a
	ld [w2d891], a
	jp Func_af135
.Func_af2ab:
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, b
	jp SetSceneObjState
.Func_af2b5:
	ld c, 8 palettes
	ld b, BANK(Pals_86add) ; aka BANK(Pals_86b1d)
	jp CopyFarBytes
.Func_af2bc:
	ld c, $1e
	jp Func_af130
.Func_af2c1:
	call PrintTextWithoutHeader
	call .Func_af376
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_af135
.Func_af2d0:
	ld a, $00
	ld [w2d880], a
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_af135
.Func_af2df:
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, PrologueBackgroundGfx
	ld b, HIGH(v0Tiles2) - $80
	ld c, $80 dma_tiles
	ld a, BANK(PrologueBackgroundGfx)
	ld [wHDMABank], a
	jp .asm_af1f7
.Func_af2f2:
	ld hl, wSceneObj9
	ld a, $3c
	ld [hli], a
	ld a, $b2
	ld [hl], a
	ld a, $13
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wOWUIObj1YCoord
	ld a, $3c
	ld [hli], a
	ld a, $c8
	ld [hl], a
	ld a, $1c
	call SetSceneWarioState
	xor a
	ld [wSceneObj10State], a
	ld [wSceneObj11State], a
	ld [wSceneObj12State], a
	ld [wSceneObj13State], a
	ld a, $08
	ld [wCollectionRow], a
	call Func_aca09
	ld hl, Pals_869cd
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_869cd)
	call CopyFarBytes
	ld hl, Pals_86b1d
	ld de, wTempPals2
	ld c, 8 palettes
	ld b, BANK(Pals_86b1d)
	call CopyFarBytes
	xor a
	ld [wPalConfig1TotalSteps], a
	ld [wPalConfig2TotalSteps], a
	jp Func_af135

.Func_af34a:
	ld a, [w2d014]
	and $03
	ret nz
	jp Func_ac9ba

.Func_af353:
	ld a, [w2d014]
	cp $3c
	ret c
	ld hl, wSubState
	inc [hl]
	ret

.Pals_af35e:
	rgb  0, 25,  0
	rgb 31, 31, 29
	rgb  5, 26, 26
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 10
	rgb  0, 10, 31
	rgb  0,  0,  3

	rgb 31, 31, 31
	rgb 31, 31, 26
	rgb 31,  5,  5
	rgb  0,  0,  3

.Func_af376:
	ld a, [wPendingCharDest]
	and a
	ret z
	ld a, [wCurTextLinePos]
	cp 1
	ret nz
	ld a, [wLanguage]
	and a
	jr nz, .english
; japanese
	ld a, [wPalFade7Colour3RedUnk1]
	cp $01
	jr z, .asm_af3ce
	cp $04
	jr z, .asm_af3de
	cp $05
	jr z, .asm_af3e6
	cp $07
	jr z, .asm_af3f2
	cp $0a
	jr z, .asm_af3f6
	cp $0b
	jr z, .asm_af3fa
	jr .asm_af3bf
.english
	ld a, [wPalFade7Colour3RedUnk1]
	cp $01
	jr z, .asm_af3ce
	cp $04
	jr z, .asm_af3de
	cp $05
	jr z, .asm_af3e2
	cp $08
	jr z, .asm_af3f2
	cp $0b
	jr z, .asm_af3ce
	cp $0c
	jr z, .asm_af3de
.asm_af3bf
	ld a, [wPalFade7Colour3RedSign]
	cp $01
	ret nz
	ld a, $0b
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret
.asm_af3ce
	ld b, $10
.asm_af3d0
	ld a, $01
	ld hl, wPalFade7Colour3RedSign
	cp [hl]
	ret nz
.asm_af3d7
	ld a, b
	ld hl, wSceneObj9State
	jp SetSceneObjState
.asm_af3de
	ld b, $0c
	jr .asm_af3d0
.asm_af3e2
	ld b, $0d
	jr .asm_af3d0
.asm_af3e6
	ld b, $0d
.asm_af3e8
	ld a, $02
.asm_af3ea
	ld hl, wPalFade7Colour3RedSign
	cp [hl]
	jr nz, .asm_af3bf
	jr .asm_af3d7
.asm_af3f2
	ld b, $0e
	jr .asm_af3e8
.asm_af3f6
	ld b, $10
	jr .asm_af3e8
.asm_af3fa
	ld b, $0c
	ld a, $03
	jr .asm_af3ea

.asm_af400
	ld a, [wOWUIObj1State]
	cp b
	ret nz
	jr .asm_af40c

	ld a, [w2d891]
	cp c
	ret c

.asm_af40c
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl]
	ret

.asm_af413
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a
	jp Func_af135

.Func_af41c:
	farcall Func_84e43
	ld a, [wPalConfig1TotalSteps]
	and a
	ret nz
	ld hl, w2d891
	ld [hld], a
	inc [hl]
	ret

.Func_af436:
	call .Func_af60d
	call .Func_af57b
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af466
	dw .Func_af476
	dw .Func_af48a
	dw .Func_af49e
	dw .Func_af4ad
	dw .Func_af4b9
	dw .Func_af4be
	dw .Func_af4ca
	dw .Func_af4cf
	dw .Func_af4e7
	dw .Func_af4f6
	dw .Func_af528
	dw .Func_af534
	dw .Func_af545
	dw .Func_af54a
	dw .Func_af55a
	dw .Func_af574

.Func_af466:
	xor a
	ld [wPalFade2Colour2GreenUnk1], a
	ld [w2d892], a
	ld [wTempleRock5Action], a
	ld [wPalFade2Colour4GreenSign], a
	jp .asm_af40c

.Func_af476:
	ld a, [bc]
	cp $40
	ret c
	ld a, $01
	ld [w2d892], a
	play_sfx SFX_THROW
	jp .asm_af40c

.Func_af48a:
	ld a, [bc]
	cp $56
	ret c
	ld a, $01
	ld [wTempleRock5Action], a
	play_sfx SFX_THROW
	jp .asm_af40c

.Func_af49e:
	ld a, [w2d892]
	cp $80
	ret nz
	ld a, [wTempleRock5Action]
	cp $80
	ret nz
	jp .asm_af40c

.Func_af4ad:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $05
	call SetSceneWarioState
	jp .asm_af40c

.Func_af4b9:
	ld b, $02
	jp .asm_af400

.Func_af4be:
	ld a, [bc]
	cp $28
	ret c
	ld a, $14
	call SetSceneWarioState
	jp .asm_af40c

.Func_af4ca:
	ld b, $0c
	jp .asm_af400

.Func_af4cf:
	ld a, [bc]
	cp $2d
	ret c
	ld a, $0b
	call SetSceneWarioState
	xor a
	ld [wSceneObj9Unk7], a
	play_sfx SFX_GRAB
	jp .asm_af40c

.Func_af4e7:
	ld a, [wSceneObj9Unk7]
	cp $80
	ret nz
	ld a, [wOWUIObj1State]
	cp $0a
	ret nz
	jp .asm_af40c

.Func_af4f6:
	ld a, [w2d891]
	cp $04
	jr z, .asm_af506
	cp $06
	jr z, .asm_af518
	cp $07
	jr z, .asm_af51e
	ret
.asm_af506
	ld d, $df
	ld e, $fa
.asm_af50a
	ld hl, wSceneObj9
	ld a, [wOWUIObj1YCoord]
	add d
	ld [hli], a
	ld a, [wOWUIObj1XCoord]
	add e
	ld [hl], a
	ret
.asm_af518
	ld d, $e0
	ld e, $fb
	jr .asm_af50a
.asm_af51e
	ld d, $e2
	ld e, $fc
	call .asm_af50a
	jp .asm_af40c

.Func_af528:
	ld a, [bc]
	cp $32
	ret c
	ld a, $21
	call SetSceneWarioState
	jp .asm_af40c

.Func_af534:
	ld a, [wOWUIObj1Frame]
	cp $0b
	ret nz
	play_sfx SFX_106
	jp .asm_af40c

.Func_af545:
	ld b, $0a
	jp .asm_af400

.Func_af54a:
	ld a, [bc]
	cp $32
	ret c
	ld a, $09
	call SetSceneWarioState
	xor a
	ld [wSceneObj9Unk7], a
	jp .asm_af40c

.Func_af55a:
	call Func_aca63
	ld a, [wOWUIObj1XCoord]
	ld b, a
	sub $04
	ld [wSceneObj9XCoord], a
	ld a, $f0
	cp b
	ret nz
	xor a
	ld [wOWUIObj1State], a
	ld [wSceneObj9State], a
	jp .asm_af40c

.Func_af574:
	ld a, [bc]
	cp $3c
	ret c
	jp .asm_af413

.Func_af57b:
	ld a, [wPalFade2Colour2GreenUnk1]
	and a
	jr z, .asm_af597
	ld a, [w2d891]
	and $03
	jr z, .asm_af597
	ld de, Data_aed06
	ld hl, wOWUIObj1YCoord
	call ApplyOWMovement_Mirrored
	jr nz, .asm_af597
	xor a
	ld [wPalFade2Colour2GreenUnk1], a
.asm_af597
	ld a, [w2d892]
	cp $80
	ret z
	jumptable
	dw .Func_af5b2
	dw .Func_af5b3
	dw .Func_af5c5
	dw .Func_af5d5
	dw .Func_af5c5
	dw .Func_af5d5
	dw .Func_af5c5
	dw .Func_af5df
	dw .Func_af5e7
	dw .Func_af5fe

.Func_af5b2:
	ret

.Func_af5b3:
	ld a, $01
	ld [wPalFade2Colour2GreenUnk1], a
	xor a
	ld [wSceneWarioUnk7], a
.asm_af5bc
	ld hl, w2d892
	inc [hl]
	xor a
	ld [w2d893], a
	ret

.Func_af5c5:
	ld a, [wOWUIObj1YCoord]
	cp $60
	ret nz
	ld a, $1b
	call SetSceneWarioState
	call .Func_af604
	jr .asm_af5bc

.Func_af5d5:
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_af5bc

.Func_af5df:
	ld a, [wOWUIObj1State]
	cp $1c
	ret nz
	jr .asm_af5bc

.Func_af5e7:
	ld hl, w2d893
	inc [hl]
	ld a, [hl]
	cp $42
	ret c
	ld a, $0c
	call SetSceneWarioState
	play_sfx SFX_12A
	jr .asm_af5bc

.Func_af5fe:
	ld a, $80
	ld [w2d892], a
	ret

.Func_af604:
	play_sfx SFX_BUMP
	ret

.Func_af60d:
	ld a, [wPalFade2Colour4GreenSign]
	and a
	jr z, .asm_af622
	ld hl, wSceneObj9
	ld de, Data_aed06
	call ApplyOWMovement_Mirrored
	jr nz, .asm_af622
	xor a
	ld [wPalFade2Colour4GreenSign], a
.asm_af622
	ld a, [wTempleRock5Action]
	cp $80
	ret z
	jumptable
	dw .Func_af639
	dw .Func_af63a
	dw .Func_af64c
	dw .Func_af657
	dw .Func_af64c
	dw .Func_af657
	dw .Func_af64c
	dw .Func_af661

.Func_af639:
	ret

.Func_af63a:
	ld a, $01
	ld [wPalFade2Colour4GreenSign], a
	xor a
	ld [wSceneObj9Unk7], a
.asm_af643
	ld hl, wTempleRock5Action
	inc [hl]
	xor a
	ld [wTempleRock5Counter], a
	ret

.Func_af64c:
	ld a, [wSceneObj9YCoord]
	cp $60
	ret nz
	call .Func_af667
	jr .asm_af643

.Func_af657:
	ld hl, wTempleRock5Counter
	inc [hl]
	ld a, [hl]
	cp $04
	ret c
	jr .asm_af643

.Func_af661:
	ld a, $80
	ld [wTempleRock5Action], a
	ret

.Func_af667:
	play_sfx SFX_BUMP
	ret

.Func_af670:
	call Func_ae523
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af68b
	dw .Func_af69a
	dw .Func_af6c1
	dw .Func_af6cd
	dw .Func_af6ee
	dw .Func_af6f9
	dw .Func_af700
	dw .Func_af73a

.Func_af68b:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $01
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp .asm_af40c

.Func_af69a:
	ld a, [wJoypadPressed]
	bit B_PAD_A, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	stop_music2
	call ClearTextbox
	ld a, $0f
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp .asm_af40c

.Func_af6c1:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $01
	ld [w2d150], a
	jp .asm_af40c

.Func_af6cd:
	ld a, [bc]
	cp $28
	ret c
	ld a, $80
	ld [w2d150], a
	ld hl, wCurSceneObj
	ld a, [wOWUIObj1YCoord]
	sub $04
	ld [hli], a
	ld a, [wOWUIObj1XCoord]
	ld [hl], a
	ld a, $11
	ld hl, wCurSceneObjState
	call SetSceneObjState
	jp .asm_af40c

.Func_af6ee:
	ld a, [bc]
	cp $14
	ret c
	xor a
	call SetSceneWarioState
	jp .asm_af40c

.Func_af6f9:
	ld a, [bc]
	cp $5a
	ret c
	jp .asm_af40c

.Func_af700:
	ld hl, wCurSceneObj
	ld a, [hl]
	cp $50
	jr c, .asm_af711
	ld a, [w2d891]
	ld b, a
	and $03
	ret nz
	dec [hl]
	ret
.asm_af711
	dec [hl]
	dec [hl]
	dec [hl]
	ld a, [hl]
	cp $18
	jr c, .asm_af733
	cp $40
	ret nc
	ld a, [wCurSceneObjState]
	cp $12
	ret z
	ld a, $12
	ld hl, wCurSceneObjState
	call SetSceneObjState
	ld a, $0a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret
.asm_af733
	xor a
	ld [wCurSceneObjState], a
	jp Func_ae1ce

.Func_af73a:
	ld a, [bc]
	cp $2d
	ret c
	jp .asm_af413

.Func_af741:
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af755
	dw .Func_af76c
	dw .Func_af775
	dw .Func_af788
	dw .Func_af797
	dw .Func_af7a0

.Func_af755:
	ld a, [bc]
	cp $3c
	ret c
	ld a, $08
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9
	ld a, $60
	ld [hli], a
	ld [hl], $80
	jp .asm_af40c

.Func_af76c:
	call .Func_af7a7
	cp $e0
	ret nz
	jp .asm_af40c

.Func_af775:
	call .Func_af7a7
	ld hl, wSCX
	inc [hl]
	ret nz
	ld a, $09
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp .asm_af40c

.Func_af788:
	ld a, [bc]
	cp $1e
	ret c
	ld a, $06
	ld hl, wSceneObj9State
	call SetSceneObjState
	jp .asm_af40c

.Func_af797:
	ld a, [wSceneObj9State]
	cp $0a
	ret nz
	jp .asm_af40c

.Func_af7a0:
	ld a, [bc]
	cp $3c
	ret c
	jp .asm_af413

.Func_af7a7:
	ld hl, wSceneObj9XCoord
	inc [hl]
	ld a, [hl]
	and $fe
	ret

.Func_af7af:
	farcall Func_15848a
	ld hl, w2d890
	ld a, [hli]
	inc [hl]
	ld b, h
	ld c, l
	jumptable
	dw .Func_af7ee
	dw .Func_af7fd
	dw .Func_af816
	dw .Func_af41c
	dw .Func_af82d
	dw .Func_af41c
	dw .Func_af843
	dw .Func_af860
	dw .Func_af816
	dw .Func_af41c
	dw .Func_af863
	dw .Func_af41c
	dw .Func_af871
	dw .Func_af88e
	dw .Func_af816
	dw .Func_af41c
	dw .Func_af893
	dw .Func_af41c
	dw .Func_af8a2
	dw .Func_af8a9

.Func_af7ee:
	play_music2 MUSIC_EPILOGUE
	jp .asm_af40c

.Func_af7fd:
	ld a, $04
.asm_af7ff
	ld [wSceneObj5Attributes], a
	ld [wSceneObj6Attributes], a
	ld [wSceneObj7Attributes], a
	ld [wSceneObj8Attributes], a
	ld [wSceneObj1Attributes], a
	ld a, $01
	ld [w2d8a0], a
	jp .asm_af40c

.Func_af816:
	ld a, [wSceneObj1YCoord]
	cp $50
	ret c
	play_sfx SFX_0EB
	call Func_aca09
	call Func_aca25
	jp .asm_af40c

.Func_af82d:
	ld a, $02
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9XCoord
	dec [hl]
.asm_af839
	xor a
	ld [wSceneObj1State], a
	call .Func_af1bd
	jp .asm_af40c

.Func_af843:
	ld a, [bc]
	cp $50
	ret c
	ld a, $19
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld a, $48
	ld [wSceneObj9XCoord], a
	call .Func_af1db
	ld de, Data_aca04
	call Func_ac9e4
	jp .asm_af40c

.Func_af860:
	xor a
	jr .asm_af7ff

.Func_af863:
	ld a, $03
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9XCoord
	dec [hl]
	jr .asm_af839

.Func_af871:
	ld a, [bc]
	cp $50
	ret c
	ld a, $1a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld a, $58
	ld [wSceneObj9XCoord], a
	call .Func_af1db
	ld de, Data_aca04
	call Func_ac9e4
	jp .asm_af40c

.Func_af88e:
	ld a, $03
	jp .asm_af7ff

.Func_af893:
	ld a, $04
	ld hl, wSceneObj9State
	call SetSceneObjState
	ld hl, wSceneObj9XCoord
	dec [hl]
	dec [hl]
	jr .asm_af839

.Func_af8a2:
	ld a, [bc]
	cp $50
	ret c
	jp .asm_af40c

.Func_af8a9:
	xor a
	ld [wSceneObj5Attributes], a
	ld [wSceneObj6Attributes], a
	ld [wSceneObj7Attributes], a
	ld [wSceneObj8Attributes], a
	ld [wSceneObj1Attributes], a
	jp .asm_af413

.Func_af8bc:
	ld hl, wSceneObj10State
	ld a, [hl]
	cp $1b
	ret nz
	call .Func_af8d0
	call .Func_af8dc
	call .Func_af8ef
	call .Func_af902
	ret

.Func_af8d0:
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

.Func_af8dc:
	ld hl, wSceneObj11State
	ld a, [hl]
	cp $1c
	ret nz
	ld a, [wGlobalCounter]
	and %111
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

.Func_af8ef:
	ld hl, wSceneObj12State
	ld a, [hl]
	cp $1b
	ret nz
	ld a, [wGlobalCounter]
	and %11
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

.Func_af902:
	ld hl, wSceneObj13State
	ld a, [hl]
	cp $1c
	ret nz
	ld a, [wGlobalCounter]
	and %111
	ret nz
	ld a, $07
	xor l
	ld l, a
	inc [hl]
	ret

	ds $6eb, $00
