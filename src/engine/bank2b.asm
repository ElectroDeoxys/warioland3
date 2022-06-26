Func_ac000: ; ac000 (2b:4000)
	ld h, b
	ld l, c
	res 1, l
	ld b, $57
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac00b

Func_ac00b: ; ac00b (2b:400b)
	ld h, b
	ld l, c
	res 1, l
	ld b, $57
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac016

	INCROM $ac016, $ac02c

Func_ac02c: ; ac02c (2b:402c)
	ld h, b
	ld l, c
	res 1, l
	ld b, $01
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac037

Func_ac037: ; ac037 (2b:4037)
	ld h, b
	ld l, c
	res 1, l
	ld b, $2a
	call UpdateOWAnimation
	ld a, [bc]
	ret
; 0xac042

Func_ac042: ; ac042 (2b:4042)
	ld b, $57
	jp AddOWSpriteWithScroll
; 0xac047

Func_ac047: ; ac047 (2b:4047)
	ld b, $57
	jp AddOWSpriteWithScroll
; 0xac04c

	INCROM $ac04c, $ac056

Func_ac056: ; ac056 (2b:4056)
	ld de, Frameset_76ca
	call Func_ac02c
	ld de, OAM_75c3
	ld b, BANK(OAM_75c3)
	jp AddOWSprite
; 0xac064

; return nz if animation is not finished yet
; e = new state
SetObjStateIfAnimationIsFinished: ; ac064 (2b:4064)
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
; 0xac074

	INCROM $ac074, $ac2b2

Func_ac2b2: ; ac2b2 (2b:42b2)
	ld bc, w2d180State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj1State
	call UpdateTempleSceneObjAnimation
	ld bc, wSceneObj2State
	jp UpdateTempleSceneObjAnimation
; 0xac2c4

UpdateTempleSceneObjs: ; ac2c4 (2b:42c4)
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
; 0xac306

UpdateTempleSceneObjAnimation: ; ac306 (2b:4306)
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
.Func_ac32e
	call Func_ac000

.Func_ac331
	ld de, OAM_1644a
	jp Func_ac042

.Func_ac337
	call Func_ac000
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jr nz, .Func_ac331
	jr UpdateTempleSceneObjAnimation

.Func_ac343
	call Func_ac00b
.Func_ac346
	ld de, OAM_15e813
	jp Func_ac047

; unreferenced
.Func_ac34c
	call Func_ac00b
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jr nz, .Func_ac346
	jr UpdateTempleSceneObjAnimation

.Func_ac358
	ret

.Func_ac359
	ld de, Frameset_15e796
	jr .Func_ac337

.Func_ac35e
	ld de, Frameset_15e89c
	jr .Func_ac343

.Func_ac363
	ld de, Frameset_15e89f
	jr .Func_ac343

.Func_ac368
	ld de, Frameset_15e8a2
	jr .Func_ac343

.Func_ac36d
	ld de, Frameset_15e8a5
	jr .Func_ac343

.Func_ac372
	ld de, Frameset_15e8a8
	jr .Func_ac343

.Func_ac377
	ld de, Frameset_15e88d
	jr .Func_ac343

.Func_ac37c
	ld de, Frameset_15e896
	jr .Func_ac38e

.Func_ac381
	ld de, Frameset_15e893
	jr .Func_ac38e

.Func_ac386
	ld de, Frameset_15e899
	jr .Func_ac38e

.Func_ac38b
	ld de, Frameset_15e890

.Func_ac38e
	call Func_ac00b
	ld de, OAM_15e813
	ld b, BANK(OAM_15e813)
	jp AddOWSprite

.Func_ac399
	ld de, Frameset_15e8ab
	jr .Func_ac3c1

.Func_ac39e
	ld de, Frameset_15e8b0
	jr .Func_ac3c1

.Func_ac3a3
	ld de, Frameset_15e8b0
	call Func_ac00b
	ld e, $0d
	jr .Func_ac3d1

.Func_ac3ad
	ld de, Frameset_15e8ab
	call Func_ac00b
	ld e, $0e
	jr .Func_ac3d1

.Func_ac3b7
	ld de, Frameset_15e932
	jr .Func_ac3c1

.Func_ac3bc
	ld de, Frameset_15e95c
	jr .Func_ac3c1

.Func_ac3c1
	call Func_ac00b
.asm_ac3c4
	ld de, OAM_18c88a
	ld b, BANK(OAM_18c88a)
	jp AddOWSpriteWithScroll

; unreferenced
	call Func_ac00b
	ld e, $00

.Func_ac3d1
	call SetObjStateIfAnimationIsFinished
	jr nz, .asm_ac3c4
	jp UpdateTempleSceneObjAnimation
; 0xac3d9

Func_ac3d9: ; ac3d9 (2b:43d9)
	ld bc, w2d180State
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
; 0xac3fd

Func_ac3fd: ; ac3fd (2b:43fd)
	ld bc, wSceneObj8State
	call Func_ac409
	ld bc, wSceneObj9State
	jp Func_ac409
; 0xac409

Func_ac409: ; ac409 (2b:4409)
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

.Func_ac43b
	call Func_ac000
.Func_ac43e
	ld de, OAM_15e44a
	jp Func_ac042

.Func_ac444
	call Func_ac000
	ld e, $00
.Func_ac449
	call SetObjStateIfAnimationIsFinished
	jr nz, .Func_ac43e
	jr Func_ac409

.Func_ac450
	ret

.Func_ac451
	ld de, Frameset_15e741
	jr .Func_ac43b

.Func_ac456
	ld de, Frameset_15e748
	jr .Func_ac43b

.Func_ac45b
	ld de, Frameset_15e74b
	jr .Func_ac43b

.Func_ac460
	ld de, Frameset_15e774
	jr .Func_ac43b

.Func_ac465
	ld de, Frameset_15e77d
	jr .Func_ac43b

.Func_ac46a
	ld de, Frameset_15e780
	jr .Func_ac43b

.Func_ac46f
	ld de, Frameset_15e793
	jr .Func_ac43b

.Func_ac474
	ld de, Frameset_15e7a3
	jr .Func_ac43b

.Func_ac479
	ld de, Frameset_15e7a6
	call .Func_ac43b
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_0F3
	ret

.Func_ac48e
	ld de, Frameset_15e7b7
	jr .Func_ac43b

.Func_ac493
	ld de, Frameset_15e7c4
	call .Func_ac43b
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_0F4
	ret

.Func_ac4a8
	ld de, Frameset_15e7ed
	jr .Func_ac43b

.Func_ac4ad
	ld de, Frameset_15e7b7
	jr .Func_ac444

.Func_ac4b2
	ld de, Frameset_15e783
	jr .Func_ac43b

.Func_ac4b7
	ld de, Frameset_15e78a
	jr .Func_ac444

.Func_ac4bc
	ld de, Frameset_15e796
	jr .Func_ac444

.Func_ac4c1
	ld de, Frameset_15e7f0
	jp .Func_ac43b

.Func_ac4c7
	ld de, Frameset_15e7f5
	jp .Func_ac43b

.Func_ac4cd
	ld de, Frameset_aad0b
	call Func_ac037
	ld e, $00
	call SetObjStateIfAnimationIsFinished
	jp z, Func_ac409
	ld de, OAM_aab5c
	ld b, BANK(OAM_aab5c)
	jp AddOWSpriteWithScroll

.Func_ac4e3
	ld de, Frameset_15e7fa
	call Func_ac000
	ld e, $16
	jp .Func_ac449

.Func_ac4ee
	ld de, Frameset_15e801
	jp .Func_ac43b

.Func_ac4f4
	ld de, Frameset_15e80a
	jp .Func_ac43b
; 0xac4fa

Func_ac4fa: ; ac4fa (2b:44fa)
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
; 0xac515

Func_ac515: ; ac515 (2b:4515)
	ld hl, w2d14c
	inc [hl]
	ld a, [hl]
	cp $08
	ret c
	xor a
	ld [hl], a
	play_sfx SFX_137
	ret
; 0xac528

UpdateSceneWarioAnimation: ; ac528 (2b:4528)
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
	ld a, [w2d14d]
	and a
	jp z, AddOWSpriteWithScroll
	jp AddOWSprite

.DoAnimation: ; ac547 (2b:4547)
	ld a, [wSceneWarioState]
	jumptable

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

.None
	ret

.LookFront
	ld de, Frameset_14d18
	jr .UpdateAnimation

.LookBack
	ld de, Frameset_14d15
	jr .UpdateAnimation

.TurnFrontLeft
	ld de, Frameset_14cbe
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jr .SetStateIfFinished

.TurnFrontRight
	ld de, Frameset_14cc5
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jr .SetStateIfFinished

.TurnBackLeft
	ld de, Frameset_14d0b
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jr .SetStateIfFinished

.TurnBackRight
	ld de, Frameset_14d10
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jr .SetStateIfFinished

.UpdateAnimation
	ld a, [wSceneWarioOAMBank]
	ld b, a
	ld hl, wSceneWarioDuration
	jp UpdateOWAnimation

; sets Scene Wario' state to b
; if the animation was finished
.SetStateIfFinished
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	ld a, b
	call SetSceneWarioState
	jp .DoAnimation

.WalkLeft
	ld de, Frameset_149b4
	call .UpdateAnimation
	jp Func_ac4fa

.WalkRight
	ld de, Frameset_149c5
	call .UpdateAnimation
	jp Func_ac4fa

.CarryWalk
	ld de, Frameset_149fe
	call .UpdateAnimation
	jp Func_ac4fa

.CarryIdle
	ld de, Frameset_14a20
	jr .UpdateAnimation

.PickUp
	ld de, Frameset_163ec
	call .UpdateAnimation
	ld b, SCENEWARIO_CARRY_IDLE
	jp .SetStateIfFinished

.IdleLeft
	ld de, Frameset_14252
	jr .UpdateAnimation

.IdleRight
	ld de, Frameset_1425f
	jr .UpdateAnimation

.Nod
	ld de, Frameset_d4de4
	jr .UpdateAnimation

.NodOnce
	ld de, Frameset_d4de4
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.LookAround
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

.LookTurnForward
	ld de, Frameset_aa6c2
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_FORWARD
	jp .SetStateIfFinished

.LookForward
	ld de, Frameset_aa6c7
	jp .UpdateAnimation

.LookAroundThenTurn
	ld de, Frameset_aa6a5
	call .UpdateAnimation
	ld b, SCENEWARIO_TURN_LEFT_END
	call .SetStateIfFinished
	jr .asm_ac65f

.LookTurnRight
	ld de, Frameset_aa6ca
	call .UpdateAnimation
	ld b, SCENEWARIO_TURN_RIGHT_END
	call .SetStateIfFinished
	jr .asm_ac65f

.OnFire
	ld de, Frameset_aa8ec
	jp .UpdateAnimation

.CrashLandRight
	ld de, Frameset_aa8f5
	call .UpdateAnimation
	ld b, SCENEWARIO_STUNNED_RIGHT
	jp .SetStateIfFinished

.CrashTumble
	ld de, Frameset_aa902
	jp .UpdateAnimation

.CrashTumbleEnd
	ld de, Frameset_aa902
	call .UpdateAnimation
	ld b, SCENEWARIO_STUNNED_RIGHT
	jp .SetStateIfFinished

.StunnedRight
	ld de, Frameset_aa90d
	jp .UpdateAnimation

.LookUp
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

.CrashLandLeft
	ld de, Frameset_aa924
	call .UpdateAnimation
	ld b, SCENEWARIO_STUNNED_LEFT
	jp .SetStateIfFinished

.StunnedLeft
	ld de, Frameset_aa931
	jp .UpdateAnimation

.LookMusicBox
	ld de, Frameset_aab27
	call .UpdateAnimation
	ld b, SCENEWARIO_HOLD_MUSIC_BOX
	jp .SetStateIfFinished

.PickUpMusicBox
	ld de, Frameset_aab32
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_UP_SURPRISED
	jp .SetStateIfFinished

.HoldMusicBox
	ld de, Frameset_aab3f
	jp .UpdateAnimation

.LookUpSurprised
	ld de, Frameset_aab42
	jp .UpdateAnimation

.CarrySnapFingers
	ld de, Frameset_aab45
	call .UpdateAnimation
	ld b, SCENEWARIO_CARRY_IDLE
	jp .SetStateIfFinished

.Sleep
	ld de, Frameset_aaccb
	call .UpdateAnimation
	ld a, [wOWAnimationFinished]
	ld [w2d14e], a
	cp $ff
	ret nz
	play_sfx SFX_0F5
	ret

.WakeUp
	ld de, Frameset_aace2
	call .UpdateAnimation
	ld b, SCENEWARIO_SIT_IDLE
	jp .SetStateIfFinished

.SitStill
	ld de, Frameset_aacf7
	jp .UpdateAnimation

.SitIdle
	ld de, Frameset_aacfa
	jp .UpdateAnimation

.JumpAndBow
	ld de, Frameset_ab03c
	call .UpdateAnimation
	call .Func_ac7b7
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished
.Func_ac7b7
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

.SnapFingers
	ld de, Frameset_ab06b
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.ShowMusicBoxes1
	ld de, Frameset_ab08c
	call .UpdateAnimation
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_2
	jp .SetStateIfFinished

.ShowMusicBoxes5
	ld de, Frameset_ab098
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.PanicJump
	ld de, Frameset_ab09d
	call .UpdateAnimation
	call .Func_ac7ff
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished
.Func_ac7ff
	ld a, [wOWAnimationFinished]
	cp $ff
	ret nz
	play_sfx SFX_LAND
	ret

.Panic
	ld de, Frameset_ab09d
	jp .UpdateAnimation

.Bow
	ld de, Frameset_ab0ac
	jp .UpdateAnimation

.ShowMusicBoxes2
	ld de, Frameset_ab14d
	call .UpdateAnimation
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_3
	jp .SetStateIfFinished

.ShowMusicBoxes3
	ld de, Frameset_ab160
	jp .UpdateAnimation

.ShowMusicBoxes4
	ld de, Frameset_ab163
	call .UpdateAnimation
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_5
	jp .SetStateIfFinished

.TurnFrontToBackRight
	ld de, Frameset_1fc439
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.TurnFrontToBackLeft
	ld de, Frameset_1fc446
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_BACK
	jp .SetStateIfFinished

.TurnBackToRight
	ld de, Frameset_1fc453
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jp .SetStateIfFinished

.TurnBackToLeft
	ld de, Frameset_1fc45a
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jp .SetStateIfFinished

.TurnRightToFront
	ld de, Frameset_1fc461
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_FRONT
	jp .SetStateIfFinished

.TurnLeftToFront
	ld de, Frameset_1fc46a
	call .UpdateAnimation
	ld b, SCENEWARIO_LOOK_FRONT
	jp .SetStateIfFinished

.TurnFrontToLeft
	ld de, Frameset_1fc473
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jp .SetStateIfFinished

.TurnFrontToRight
	ld de, Frameset_1fc47c
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jp .SetStateIfFinished

.TurnLeftEnd
	ld de, Frameset_1fc485
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_RIGHT
	jp .SetStateIfFinished

.TurnRightEnd
	ld de, Frameset_1fc488
	call .UpdateAnimation
	ld b, SCENEWARIO_IDLE_LEFT
	jp .SetStateIfFinished

.PanicRunLeft
	ld de, Frameset_16b5a
.asm_ac8a7
	call .UpdateAnimation
	jp Func_ac515

.PanicRunRight
	ld de, Frameset_16b63
	jr .asm_ac8a7

.IdleFront
	ld de, Frameset_1fc316
	jp .UpdateAnimation
; 0xac8b8

	INCROM $ac8b8, $ac8d4

SetSceneWarioState: ; ac8d4 (2b:48d4)
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

.LoadGfx
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
	ld a, $7f
	ld [hl], a

	xor a
	ld [wHDMADestVRAMBank], a
	ret

MACRO scene_wario_gfx
	dab \1 ; sprite
	dba \2 ; tiles
ENDM

.WarioSpritePointers
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
; 0xac9b6

	ret ; stray ret
; 0xac9b7

Func_ac9b7: ; ac9b7 (2b:49b7)
	debug_nop
; 0xac9ba

Func_ac9ba: ; ac9ba (2b:49ba)
	farcall Func_84e86
	ret
; 0xac9ca

	INCROM $ac9ca, $ac9e4

Func_ac9e4: ; ac9e4 (2b:49e4)
	ld hl, wPalConfig2
	jr Func_ac9ec

Func_ac9e9: ; ac9e9 (2b:49e9)
	ld hl, wPalConfig1
;	fallthrough

Func_ac9ec: ; ac9ec (2b:49ec)
	ld c, $5
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 0xac9f5

Data_ac9f5: ; ac9f5 (2b:49f5)
	db LOW(rBCPS), BCPSF_AUTOINC
	db 8 ; number of pals
	db HIGH(wTempPals1), LOW(wTempPals1) ; source pals

Data_ac9fa: ; ac9fa (2b:49fa)
	db LOW(rBCPS), BCPSF_AUTOINC
	db 8 ; number of pals
	db HIGH(wTempBGPals), LOW(wTempBGPals) ; source pals

Data_ac9ff: ; ac9ff (2b:49ff)
	db LOW(rOCPS), OCPSF_AUTOINC
	db 1 ; number of pals
	db HIGH(wTempOBPals), LOW(wTempOBPals) ; source pals

Data_aca04: ; aca04 (2b:4a04)
	db LOW(rOCPS), OCPSF_AUTOINC
	db 8 ; number of pals
	db HIGH(wTempPals2), LOW(wTempPals2) ; source pals
; 0xaca09

	INCROM $aca09, $aca34

; moves scene Wario 1.5 pixels to left
; if d-left is pressed, moves 2 pixels
ApplySceneWarioMovementLeft: ; aca34 (2b:4a34)
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
; 0xaca4c

; moves scene Wario 1.5 pixels to right
; if d-right is pressed, moves 2 pixels
ApplySceneWarioMovementRight: ; aca4c (2b:4a4c)
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
; 0xaca63

	INCROM $aca63, $aca6d

Func_aca6d: ; aca6d (2b:4a6d)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret
; 0xaca74

InitTextPrinting: ; aca74 (2b:4a74)
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
; 0xaca9e

Func_aca9e: ; aca9e (2b:4a9e)
	call PrintTextWithHeader
	ld a, [wCurTextLine]
	cp $80
	ret nz
	ld hl, wCurTextBufferPage
	inc [hl]
	jr Func_aca6d
; 0xacaad

LoadCurTextPageBufferPage: ; acaad (2b:4aad)
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
; 0xacacd

Func_acacd: ; acacd (2b:4acd)
	ld a, 1
	ld hl, wCurTextBufferPage
	cp [hl]
	jr z, .clear
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
.clear
	call ClearTextboxExceptHeader
	jr Func_aca6d
; 0xacae7

Func_acae7: ; acae7 (2b:4ae7)
	call PrintTextWithoutHeader
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_aca6d
; 0xacaf3

Func_acaf3: ; acaf3 (2b:4af3)
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
; 0xacb25

Func_acb25: ; acb25 (2b:4b25)
	call DisableLCD
	call FillBGMap0_With7f
	call ClearVirtualOAM
	stop_music2

	ld a, BANK("WRAM2")
	ldh [rSMBK], a

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a

	call VBlank_accb0
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM

	ld hl, Pals_86a4d
	ld b, BANK(Pals_86a4d)
	call LoadFarPalsToTempPals1
	decompress_vram1 FontGFX, v1Tiles0
	ld hl, BGMap_b0780
	ld b, BANK(BGMap_b0780)
	call LoadFarTiles
	ld hl, BGMap_b0300
	ld b, BANK(BGMap_b0300)
	call LoadFarBGMap
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_b0540
	ld b, BANK(BGMap_b0540)
	call LoadFarBGMap
	xor a
	ldh [rVBK], a
	call FillClearedTextBuffer

	ld a, TREASURE_GOLD_MUSIC_BOX
	call IsTreasureCollected
	ld a, TEMPLE_SCENE_ENTERING
	jp z, .asm_acc3e ; not collected
	ld hl, wGameModeFlags
	bit MODE_GAME_CLEARED_F, [hl]
	jr z, .asm_acbb4
	bit MODE_TIME_ATTACK_F, [hl]
	jp z, .asm_acc3e
.asm_acbb4
	ld a, TEMPLE_SCENE_03
	ld [wTempleScene], a

	decompress_vram1 TempleMusicBoxSceneGfx, v1Tiles0
	decompress BGMap_b3aaa, v0BGMap1
	decompress_vram1 BGMap_b3ba5, v1BGMap1

	ld a, [wLanguage]
	and a
	ld hl, BGMap_b232f
	jr z, .japanese1
	ld hl, BGMap_b2424
.japanese1
	ld a, BANK(BGMap_b232f) ; aka BGMap_b2424
	ld [wTempBank], a
	ld bc, wTextBuffer
	ld a, [wTempBank]
	ldh [hCallFuncBank], a
	hcall Decompress
	jr .asm_acc68

.asm_acc3e
	ld [wTempleScene], a
	ld a, [wLanguage]
	and a
	ld hl, BGMap_b1fd7
	jr z, .japanese2
	ld hl, BGMap_b211a
.japanese2
	ld a, BANK(BGMap_b1fd7) ; aka BGMap_b211a
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
	ld [w1d141], a
	ld a, SCENEWARIO_GROUP_NONE
	ld [wSceneWarioStateGroup], a

	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	call UpdateSceneWarioAnimation

	xor a
	ld [w2d013], a
	ld [w2d014], a
	ld a, [w1d800]
	ld b, a
	and a
	ld a, LCDCF_BGON | LCDCF_OBJON | LCDCF_OBJ16 | LCDCF_WIN9C00 | LCDCF_ON
	jr z, .got_lcdc_config
	xor b
.got_lcdc_config
	ldh [rLCDC], a

	xor a
	ld [w1d800], a

	ld hl, wSubState
	inc [hl]
	ret
; 0xacc9a

ClearGeneralSceneRAM: ; acc9a (2b:4c9a)
	ld hl, wLCDCFlagsToFlip
	ld bc, wWRAM2End - wLCDCFlagsToFlip
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xacca5

ClearSceneObjsRAM: ; acca5 (2b:4ca5)
	ld hl, wSceneWario
	ld bc, wSceneObjsEnd - wSceneWario
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xaccb0

VBlank_accb0: ; accb0 (2b:4cb0)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, BANK("WRAM2")
	ldh [rSVBK], a

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
	ld c, LOW(rHDMA1)
	ld [$ff00+c], a ; rHDMA1
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA2
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA3
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA4
	ld a, [hli]
	inc c
	ld [$ff00+c], a ; rHDMA5
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
.func_end
; 0xacd3a

UpdateTempleScene: ; acd3a (2b:4d3a)
	call .UpdateScene
	call Func_ac2b2
	call UpdateSceneWarioAnimation
	call UpdateTempleSceneObjs
	call ClearUnusedVirtualOAM
	ret

.NextState
	ld hl, wTempleSceneCounter
	xor a
	ld [hld], a
	inc [hl] ; w2da04
	ret

.UpdateScene
	ld hl, wTempleSceneCounter
	inc [hl]
	ld c, l
	ld b, h
	ld a, [wTempleScene]
	jumptable

	dw .Entering           ; TEMPLE_SCENE_ENTERING
	dw .TalkToHiddenFigure ; TEMPLE_SCENE_TALKING
	dw .Exiting            ; TEMPLE_SCENE_EXITING
	dw Func_ad03b          ; TEMPLE_SCENE_03

.Entering
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

.TalkToHiddenFigure
	call .DelayAndPlayTempleMusic
	ld a, [wIsNextObjectiveTheTemple]
	and a
	call z, PrintTextWithHeader
	ld a, [wJoypadPressed]
	and B_BUTTON | D_LEFT
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

.Exiting
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
	bit B_BUTTON_F, a
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
	ld a, $08
	ld [wSubState], a
	scf
	ret

.DelayAndPlayTempleMusic
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
; 0xace60

ClearTextbox: ; ace60 (2b:4e60)
	ld d, 6 * BG_MAP_WIDTH ; dest lo
	ld e, $07
	jr ClearTextboxAtCoord

ClearTextboxExceptHeader: ; ace66 (2b:4e66)
	ld d, 7 * BG_MAP_WIDTH ; dest lo
	ld e, $05
;	fallthrough

ClearTextboxAtCoord: ; ace6a (2b:4e6a)
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
; 0xace90

FillClearedTextBuffer: ; ace90 (2b:4e90)
	ld hl, wClearedTextBuffer
	ld a, "@"
	ld bc, 8 * TEXT_LINE_LENGTH
	call WriteAToHL_BCTimes
	ret
; 0xace9c

ClearText: ; ace9c (2b:4e9c)
	ld a, "@"
	ld hl, wText
	ld bc, 4 * TEXT_LINE_LENGTH
	call WriteAToHL_BCTimes
	ret
; 0xacea8

PrintTextWithHeader: ; acea8 (2b:4ea8)
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

PrintTextWithoutHeader: ; acec4 (2b:4ec4)
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

DelayTextThenGoToNextLine: ; acedd (2b:4edd)
	ld a, [wTextDelayCounter]
	cp 10
	ret c
GoToNextLine: ; acee3 (2b:4ee3)
	xor a
	ld [wCurTextLinePos], a
	ld [wTextDelayCounter], a
	ld hl, wCurTextLine
	inc [hl]
	ret

PrintText_Line1: ; aceef (2b:4eef)
	ld c, 0
	jr PrintText

PrintText_Line2: ; acef3 (2b:4ef3)
	ld c, 1
	jr PrintText

PrintText_Line3: ; acef7 (2b:4ef7)
	ld c, 2
	jr PrintText

PrintText_Line4: ; acefb (2b:4efb)
	ld c, 3
	jr PrintText ; unnecessary jump

; prints text given in wTextBuffer
PrintText: ; aceff (2b:4eff)
	ld a, [wPendingCharDest + 0]
	and a
	ret nz

	; if A button or down is pressed,
	; then text delay is halved
	ld b, 4
	ld a, [wJoypadDown]
	and A_BUTTON | D_DOWN
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
	ld a, $09
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
; 0xacf89

; checks which level is the next objective
; then loads from wTextBuffer the corresponding
; text for that objective to print
LoadNextObjectiveText: ; acf89 (2b:4f89)
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
; 0xad011

Func_ad011: ; ad011 (2b:5011)
	ld a, [w2d014]
	cp c
	ret c
Func_ad016: ; ad016 (2b:5016)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xad01d

SetFightAgainstAHiddenFigure: ; ad01d (2b:501d)
	stop_music2
	stop_sfx
	xor a
	ld [wSubState], a
	ld hl, wState
	inc [hl] ; ST_LEVEL
	scf
	ret
; 0xad03b

Func_ad03b: ; ad03b (2b:503b)
	ld a, [w2d013]
	cp $02
	jr c, .cant_skip
	ld a, [wGameModeFlags]
	bit MODE_FOUGHT_A_HIDDEN_FIGURE_F, a
	jr z, .cant_skip
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, SetFightAgainstAHiddenFigure
.cant_skip
	call DoHiddenFigureLeftHandMovement
	call DoHiddenFigureRightHandMovement
	ld hl, w2d014
	inc [hl]
	ld a, [w2d013]
	jumptable

	dw Func_ad016
	dw UpdateEnterTempleWithAllMusicBoxesScene
	dw .Wait1
	dw InitTextPrinting
	dw Func_aca9e
	dw .Wait2
	dw LoadCurTextPageBufferPage
	dw Func_acacd
	dw Func_acae7
	dw Func_ad0bd
	dw Func_ad0c0
	dw Func_ad0d1
	dw Func_ad445
	dw Func_ad6f5
	dw Func_ad0e4
	dw Func_ad0f6
	dw Func_ad105
	dw Func_ad12f
	dw LoadSceneHiddenFigureGfx1
	dw LoadSceneHiddenFigureGfx2
	dw LoadSceneHiddenFigureGfx3
	dw Func_ad195
	dw Func_ad1e3
	dw Func_ad355
	dw Func_ad1f9
	dw Func_ad1fe
	dw Func_aca9e
	dw Func_ad207
	dw LoadCurTextPageBufferPage
	dw Func_ad215
	dw Func_ad21d
	dw Func_ad22e
	dw Func_ad23a
	dw LoadCurTextPageBufferPage
	dw Func_ad259
	dw Func_ad271
	dw Func_ad27a
	dw Func_ad2f4
	dw Func_ad300
	dw Func_ad308
	dw Func_ad319
	dw SetFightAgainstAHiddenFigure

.Wait1
	ld c, 40
	jp Func_ad011

.Wait2
	ld c, 30
	jp Func_ad011

Func_ad0bd: ; ad0bd (2b:50bd)
	jp Func_acaf3
; 0xad0c0

Func_ad0c0: ; ad0c0 (2b:50c0)
	ld a, [w2d014]
	cp 30
	ret c
	ld a, $01
	ld hl, wSceneObj1State
	call SetSceneObjState
	jp Func_ad016
; 0xad0d1

Func_ad0d1: ; ad0d1 (2b:50d1)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	call ClearTextbox
	jp Func_ad016
; 0xad0e4

Func_ad0e4: ; ad0e4 (2b:50e4)
	call HandleTempleShakeAndRocks
	ld a, $03
	ld [w2d880], a
	xor a
	ld [w2d0d5], a
	ld [w2d0db], a
	jp Func_ad16a
; 0xad0f6

Func_ad0f6: ; ad0f6 (2b:50f6)
	call Func_ad889
	call HandleTempleShakeAndRocks
	ld a, [w2d014]
	and $0f
	ret nz
	jp Func_ac9ba
; 0xad105

Func_ad105: ; ad105 (2b:5105)
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
	jr Func_ad16a
; 0xad12f

Func_ad12f: ; ad12f (2b:512f)
	call Func_ad889
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
	ld a, $08
	ld [w1d800], a
	jp Func_ad016
; 0xad14d

LoadSceneHiddenFigureGfx1: ; ad14d (2b:514d)
	xor a ; BANK(VRAM0)
	ld [wHDMADestVRAMBank], a
	ld de, HiddenFigure1Gfx tile $80
	ld b, HIGH(v0Tiles1) - $80
	ld c, $7f
	ld a, BANK(HiddenFigure1Gfx)
	ld [wHDMABank], a
SetHDMAForHiddenFigureGfx: ; ad15d (2b:515d)
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
;	fallthrough

Func_ad16a: ; ad16a (2b:516a)
	call Func_ad889
	jp Func_ad016
; 0xad170

LoadSceneHiddenFigureGfx2: ; ad170 (2b:5170)
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, HiddenFigure1Gfx tile $100
	ld b, HIGH(v0Tiles2) - $80
	ld c, $7f
	ld a, BANK(HiddenFigure1Gfx)
	ld [wHDMABank], a
	jr SetHDMAForHiddenFigureGfx
; 0xad182

LoadSceneHiddenFigureGfx3: ; ad182 (2b:5182)
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, HiddenFigure2Gfx
	ld b, HIGH(v1Tiles0) - $80
	ld c, $7f
	ld a, BANK(HiddenFigure1Gfx)
	ld [wHDMABank], a
	jr SetHDMAForHiddenFigureGfx
; 0xad195

Func_ad195: ; ad195 (2b:5195)
	call Func_ad889
	ld a, [w2d014]
	cp $1e
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
	ld hl, wSceneObj6End
	ld a, $38
	ld [hli], a
	ld [hl], $50
	ld hl, wSceneObj3YCoord
	ld a, $58
	ld [hli], a
	ld [hl], $20
	ld hl, wSceneObj4YCoord
	ld [hli], a
	ld [hl], $80
	ld a, $01
	ld [w2d8da], a
	ld [w2d8dc], a
	ld a, $04
	ld [w2d880], a
	xor a
	ld [w2d0d5], a
	ld [w2d0db], a
	jp Func_ad016
; 0xad1e3

Func_ad1e3: ; ad1e3 (2b:51e3)
	call Func_ad889
	ld c, $07
	ld a, [w2d0d5]
	cp $14
	jr c, .asm_ad1f1
	ld c, $03
.asm_ad1f1
	ld a, [w2d014]
	and c
	ret nz
	jp Func_ac9ba
; 0xad1f9

Func_ad1f9: ; ad1f9 (2b:51f9)
	ld c, $28
	jp Func_ad011
; 0xad1fe

Func_ad1fe: ; ad1fe (2b:51fe)
	call InitTextPrinting
	ld a, $1
	ld [wBGMapToPrintText], a
	ret
; 0xad207

Func_ad207: ; ad207 (2b:5207)
	ld a, [w2d014]
	cp $1e
	ret c
	ld a, $04
	ld [wCurTextBufferPage], a
	jp Func_ad016
; 0xad215

Func_ad215: ; ad215 (2b:5215)
	ld a, $10
	ld [wSceneObj7State], a
	jp Func_ad016
; 0xad21d

Func_ad21d: ; ad21d (2b:521d)
	ld a, [wSceneObj7State]
	cp $0e
	ret nz
	play_sfx SFX_0CC
	jp Func_ad016
; 0xad22e

Func_ad22e: ; ad22e (2b:522e)
	call PrintTextWithoutHeader
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_ad016
; 0xad23a

Func_ad23a: ; ad23a (2b:523a)
	ld a, [w2d014]
	cp $28
	jr z, .asm_ad253
	cp $46
	ret c
	ld hl, wCurTextBufferPage
	inc [hl]
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_ad016
.asm_ad253
	ld a, $0f
	ld [wSceneObj7State], a
	ret
; 0xad259

Func_ad259: ; ad259 (2b:5259)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	call ClearTextboxExceptHeader
	ld a, $10
	ld [wSceneObj7State], a
	jp Func_aca6d
; 0xad271

Func_ad271: ; ad271 (2b:5271)
	ld a, [wSceneObj7State]
	cp $0e
	ret nz
	jp Func_aca6d
; 0xad27a

Func_ad27a: ; ad27a (2b:527a)
	call PrintTextWithoutHeader
	call .Func_ad289
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_af135

.Func_ad289
	ld a, [wPendingCharDest]
	and a
	ret z
	ld a, [wCurTextBufferLine]
	cp 1
	ret z
	ld a, [wLanguage]
	and a
	jr nz, .asm_ad2b2
	ld a, [wCurTextBufferPage]
	cp $05
	jr z, .asm_ad2ca
	cp $06
	jr z, .asm_ad2e0
	cp $07
	jr z, .asm_ad2e0
	cp $08
	jr z, .asm_ad2e4
	cp $09
	jr z, .asm_ad2ca
	ret

.asm_ad2b2
	ld a, [wCurTextBufferPage]
	cp $05
	jr z, .asm_ad2e8
	cp $06
	jr z, .asm_ad2e4
	cp $07
	jr z, .asm_ad2f0
	cp $08
	jr z, .asm_ad2ec
	cp $09
	jr z, .asm_ad2e4
	ret

.asm_ad2ca
	ld b, $01
.asm_ad2cc
	ld a, [wCurTextLinePos]
	cp b
	ret nz
	ld a, [wCurTextBufferLine]
	cp 2
	ret nz
	ld a, $0f
	ld [wSceneObj7State], a
	ld hl, wSceneObj9State
	ret

.asm_ad2e0
	ld b, $08
	jr .asm_ad2cc
.asm_ad2e4
	ld b, $0c
	jr .asm_ad2cc
.asm_ad2e8
	ld b, $0a
	jr .asm_ad2cc
.asm_ad2ec
	ld b, $0b
	jr .asm_ad2cc
.asm_ad2f0
	ld b, $05
	jr .asm_ad2cc
; 0xad2f4

Func_ad2f4: ; ad2f4 (2b:52f4)
	ld a, [wSceneObj7State]
	cp $0d
	ret nz
	call Func_acaf3
	ret c
	dec [hl]
	ret
; 0xad300

Func_ad300: ; ad300 (2b:5300)
	ld a, $2a
	call SetSceneWarioState
	jp Func_ad016
; 0xad308

Func_ad308: ; ad308 (2b:5308)
	ld a, [w2d014]
	cp $1e
	ret c
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_ad016
; 0xad319

Func_ad319: ; ad319 (2b:5319)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld [wSceneObj1State], a
	call ClearTextbox
	jp Func_ad016
; 0xad329

Func_ad329: ; ad329 (2b:5329)
	ld a, [wSceneWarioState]
	cp b
	ret nz
	jr Func_ad335
; 0xad330

Func_ad330: ; ad330 (2b:5330)
	ld a, [w2d891]
	cp c
	ret c
Func_ad335: ; ad335 (2b:5335)
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xad33c

Func_ad33c: ; ad33c (2b:533c)
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a ; w2d891
	jp Func_ad016
; 0xad345

HandleTempleShakeAndRocks: ; ad345 (2b:5345)
	farcall _HandleTempleShakeAndRocks
	ret
; 0xad355

Func_ad355: ; ad355 (2b:5355)
	call Func_ad889
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw Func_ad36f
	dw Func_ad37e
	dw Func_ad386
	dw Func_ad38e
	dw Func_ad39a
	dw Func_ad3a6
	dw Func_ad33c
; 0xad36f

Func_ad36f: ; ad36f (2b:536f)
	play_music2 MUSIC_HIDDEN_FIGURE_REVEAL
	jp Func_ad335
; 0xad37e

Func_ad37e: ; ad37e (2b:537e)
	ld a, $03
	ld [w2d892], a
	jp Func_ad335
; 0xad386

Func_ad386: ; ad386 (2b:5386)
	ld a, [w2d894]
	and a
	ret nz
	jp Func_ad335
; 0xad38e

Func_ad38e: ; ad38e (2b:538e)
	ld a, [bc]
	cp $14
	ret c
	ld a, SCENEWARIO_PANIC
	call SetSceneWarioState
	jp Func_ad335
; 0xad39a

Func_ad39a: ; ad39a (2b:539a)
	ld a, [bc]
	cp $28
	ret c
	ld a, SCENEWARIO_PANIC_JUMP
	ld [wSceneWarioState], a
	jp Func_ad335
; 0xad3a6

Func_ad3a6: ; ad3a6 (2b:53a6)
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	jp Func_ad335
; 0xad3af

UpdateEnterTempleWithAllMusicBoxesScene: ; ad3af (2b:53af)
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

.Wait1
	ld c, 8
	jp Func_ad330

.WalkRight
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ad335

.MoveRight
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ad335

.Wait2
	ld c, 30
	jp Func_ad330

.TurnToBack
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ad335

.LookBack
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ad329

.CheckTimeAttack
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	jp z, Func_ad33c ; skips rest of the sequence
	jp Func_ad335 ; continues

.Bow
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

.WaitInput
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	jp nz, .a_btn ; can be jr
	and B_BUTTON | D_LEFT
	ret z
	xor a
	ld [wSceneObj1State], a
	ld a, $02
	ld [w1da00], a
	xor a
	ld [wTempleSceneCounter], a
	ret

.a_btn
	ld a, SCENEWARIO_LOOK_BACK
	call SetSceneWarioState
	xor a
	ld [wSceneObj1State], a
	jp Func_ad33c
; 0xad445

Func_ad445: ; ad445 (2b:5445)
	call Func_ad4b1
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable

	dw Func_ad46d
	dw Func_ad472
	dw Func_ad47a
	dw Func_ad47f
	dw Func_ad48b
	dw Func_ad493
	dw Func_ad49f
	dw Func_ad4a4
	dw Func_ad4a4
	dw Func_ad4a4
	dw Func_ad4a4
	dw Func_ad4a9
	dw Func_ad48b
	dw Func_ad33c
; 0xad46d

Func_ad46d: ; ad46d (2b:546d)
	ld c, $3c
	jp Func_ad330
; 0xad472

Func_ad472: ; ad472 (2b:5472)
	ld a, SCENEWARIO_SHOW_MUSIC_BOXES_1
	call SetSceneWarioState
	jp Func_ad335
; 0xad47a

Func_ad47a: ; ad47a (2b:547a)
	ld b, SCENEWARIO_SHOW_MUSIC_BOXES_3
	jp Func_ad329
; 0xad47f

Func_ad47f: ; ad47f (2b:547f)
	ld a, [bc]
	cp $10
	ret c
	ld a, $01
	ld [w2d8a0], a
	jp Func_ad335
; 0xad48b

Func_ad48b: ; ad48b (2b:548b)
	ld a, [w2d8a0]
	and a
	ret nz
	jp Func_ad335
; 0xad493

Func_ad493: ; ad493 (2b:5493)
	ld a, [bc]
	cp $3c
	ret c
	ld a, SCENEWARIO_SHOW_MUSIC_BOXES_4
	call SetSceneWarioState
	jp Func_ad335
; 0xad49f

Func_ad49f: ; ad49f (2b:549f)
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ad329
; 0xad4a4

Func_ad4a4: ; ad4a4 (2b:54a4)
	ld c, $f0
	jp Func_ad330
; 0xad4a9

Func_ad4a9: ; ad4a9 (2b:54a9)
	ld a, $08
	ld [w2d8a0], a
	jp Func_ad335
; 0xad4b1

Func_ad4b1: ; ad4b1 (2b:54b1)
	call Func_ad55b
	call Func_ad58a
	call Func_ad5b9
	call Func_ad5e8
	call Func_ad618
	ld hl, w2d8a0
	ld a, [hli]
	inc [hl] ; w2d8a1
	and a
	ret z
	ld b, h
	ld c, l
	jumptable

	dw Func_ad4e6
	dw Func_ad4ed
	dw Func_ad4f9
	dw Func_ad4fe
	dw Func_ad503
	dw Func_ad508
	dw Func_ad50d
	dw Func_ad4e6
	dw Func_ad514
	dw Func_ad523
	dw Func_ad52b
	dw Func_ad533
	dw Func_ad53b
	dw Func_ad50d
; 0xad4e6

Func_ad4e6: ; ad4e6 (2b:54e6)
	ld hl, w2d8a1
	xor a
	ld [hld], a
	inc [hl] ; w2d8a0
	ret
; 0xad4ed

Func_ad4ed: ; ad4ed (2b:54ed)
	ld hl, w2d8a2
Func_ad4f0: ; ad4f0 (2b:54f0)
	ld a, [bc]
	cp $10
	ret c
	ld a, $01
	ld [hl], a
	jr Func_ad4e6
; 0xad4f9

Func_ad4f9: ; ad4f9 (2b:54f9)
	ld hl, w2d8a4
	jr Func_ad4f0
; 0xad4fe

Func_ad4fe: ; ad4fe (2b:54fe)
	ld hl, w2d8a6
	jr Func_ad4f0
; 0xad503

Func_ad503: ; ad503 (2b:5503)
	ld hl, w2d8a8
	jr Func_ad4f0
; 0xad508

Func_ad508: ; ad508 (2b:5508)
	ld hl, w2d8aa
	jr Func_ad4f0
; 0xad50d

Func_ad50d: ; ad50d (2b:550d)
	ld hl, w2d8a0
	xor a
	ld [hli], a
	ld [hl], a ; w2d8a1
	ret
; 0xad514

Func_ad514: ; ad514 (2b:5514)
	ld de, w2d8a2
	ld hl, wSceneObj8Unk7

Func_ad51a:
	ld a, [hld]
	cp $10
	ret nz
	xor a
	ld [hl], a
	ld [de], a
	jr Func_ad4e6
; 0xad523

Func_ad523: ; ad523 (2b:5523)
	ld de, w2d8a4
	ld hl, wSceneObj9Unk7
	jr Func_ad51a
; 0xad52b

Func_ad52b: ; ad52b (2b:552b)
	ld de, w2d8a6
	ld hl, wSceneObj10Unk7
	jr Func_ad51a
; 0xad533

Func_ad533: ; ad533 (2b:5533)
	ld de, w2d8a8
	ld hl, wSceneObj11Unk7
	jr Func_ad51a
; 0xad53b

Func_ad53b: ; ad53b (2b:553b)
	ld de, w2d8aa
	ld hl, wSceneObj12Unk7
	jr Func_ad51a
; 0xad543

Func_ad543: ; ad543 (2b:5543)
	ld [hl], $50 ; y
	inc l
	ld [hl], $4e ; x
	inc l
	set 2, l
	call SetSceneObjState
	ret
; 0xad54f

Func_ad54f: ; ad54f (2b:554f)
	dec [hl] ; x
	dec l
	dec [hl] ; y
	dec [hl]
	ld a, [hl]
	cp $2c
	ret
; 0xad557

Func_ad557: ; ad557 (2b:5557)
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xad55b

Func_ad55b: ; ad55b (2b:555b)
	ld hl, w2d8a2
	ld a, [hli]
	and a
	ret z
	jumptable

	dw Func_ac9b7
	dw Func_ad56a
	dw Func_ad577
	dw Func_ad580
; 0xad56a

Func_ad56a: ; ad56a (2b:556a)
	ld hl, wSceneObj8
	ld a, $03
	call Func_ad543

Func_ad572: ; ad572 (2b:5572)
	ld hl, w2d8a3
	jr Func_ad557
; 0xad577

Func_ad577: ; ad577 (2b:5577)
	ld hl, wSceneObj8XCoord
	call Func_ad54f
	ret nz
	jr Func_ad572
; 0xad580

Func_ad580: ; ad580 (2b:5580)
	ld hl, wSceneObj8
	ld de, Data_ad654
	call ApplyMovement
	ret
; 0xad58a

Func_ad58a: ; ad58a (2b:558a)
	ld hl, w2d8a4
	ld a, [hli]
	and a
	ret z
	jumptable

	dw Func_ac9b7
	dw Func_ad599
	dw Func_ad5a6
	dw Func_ad5af
; 0xad599

Func_ad599: ; ad599 (2b:5599)
	ld hl, wSceneObj9
	ld a, $04
	call Func_ad543

Func_ad5a1:
	ld hl, w2d8a5
	jr Func_ad557
; 0xad5a6

Func_ad5a6: ; ad5a6 (2b:55a6)
	ld hl, wSceneObj9XCoord
	call Func_ad54f
	ret nz
	jr Func_ad5a1
; 0xad5af

Func_ad5af: ; ad5af (2b:55af)
	ld hl, wSceneObj9
	ld de, Data_ad654
	call ApplyMovement
	ret
; 0xad5b9

Func_ad5b9: ; ad5b9 (2b:55b9)
	ld hl, w2d8a6
	ld a, [hli]
	and a
	ret z
	jumptable

	dw Func_ac9b7
	dw Func_ad5c8
	dw Func_ad5d5
	dw Func_ad5de
; 0xad5c8

Func_ad5c8: ; ad5c8 (2b:55c8)
	ld hl, wSceneObj10
	ld a, $05
	call Func_ad543

Func_ad5d0:
	ld hl, w2d8a7
	jr Func_ad557
; 0xad5d5

Func_ad5d5: ; ad5d5 (2b:55d5)
	ld hl, wSceneObj10XCoord
	call Func_ad54f
	ret nz
	jr Func_ad5d0
; 0xad5de

Func_ad5de: ; ad5de (2b:55de)
	ld hl, wSceneObj10
	ld de, Data_ad654
	call ApplyMovement
	ret
; 0xad5e8

Func_ad5e8: ; ad5e8 (2b:55e8)
	ld hl, w2d8a8
	ld a, [hli]
	and a
	ret z
	jumptable

	dw Func_ac9b7
	dw Func_ad5f7
	dw Func_ad605
	dw Func_ad60e
; 0xad5f7

Func_ad5f7: ; ad5f7 (2b:55f7)
	ld hl, wSceneObj11
	ld a, $06
	call Func_ad543

Func_ad5ff:
	ld hl, w2d8a9
	jp Func_ad557
; 0xad605

Func_ad605: ; ad605 (2b:5605)
	ld hl, wSceneObj11XCoord
	call Func_ad54f
	ret nz
	jr Func_ad5ff
; 0xad60e

Func_ad60e: ; ad60e (2b:560e)
	ld hl, wSceneObj11
	ld de, Data_ad654
	call ApplyMovement
	ret
; 0xad618

Func_ad618: ; ad618 (2b:5618)
	ld hl, w2d8aa
	ld a, [hli]
	and a
	ret z
	jumptable

	dw Func_ac9b7
	dw Func_ad627
	dw Func_ad635
	dw Func_ad64a
; 0xad627

Func_ad627: ; ad627 (2b:5627)
	ld hl, wSceneObj12
	ld a, $07
	call Func_ad543

Func_ad62f:
	ld hl, w2d8ab
	jp Func_ad557
; 0xad635

Func_ad635: ; ad635 (2b:5635)
	ld hl, wSceneObj12XCoord
	call Func_ad54f
	ret nz
	play_music2 MUSIC_MUSIC_BOXES
	jr Func_ad62f
; 0xad64a

Func_ad64a: ; ad64a (2b:564a)
	ld hl, wSceneObj11End
	ld de, Data_ad654
	call ApplyMovement
	ret
; 0xad654

Data_ad654: ; ad654 (2b:5654)
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
; 0xad6f5

Func_ad6f5: ; ad6f5 (2b:56f5)
	call Func_ad889
	call HandleTempleShakeAndRocks
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl]
	jumptable

	dw Func_ad73e
	dw Func_ad74a
	dw Func_ad753
	dw Func_ad75c
	dw Func_ad765
	dw Func_ad76e
	dw Func_ad777
	dw Func_ad783
	dw Func_ad7a7
	dw Func_ad7af
	dw Func_ad7b4
	dw Func_ad7bc
	dw Func_ad7c1
	dw Func_ad7dd
	dw Func_ad7f0
	dw Func_ad7f8
	dw Func_ad801
	dw Func_ad80a
	dw Func_ad813
	dw Func_ad81c
	dw Func_ad82e
	dw Func_ad837
	dw Func_ad844
	dw Func_ad851
	dw Func_ad85e
	dw Func_ad86b
	dw Func_ad878
	dw Func_ad87d
	dw Func_ad33c
; 0xad73e

Func_ad73e: ; ad73e (2b:573e)
	ld a, [bc]
	cp $5a
	ret c
	ld a, $02
	ld [w2d896], a
	jp Func_ad335
; 0xad74a

Func_ad74a:
	ld a, [bc]
	cp $10
	ret c
	ld hl, wTempleRock1
	jr Func_ad77e

Func_ad753:
	ld a, [bc]
	cp $08
	ret c
	ld hl, wTempleRock2
	jr Func_ad77e

Func_ad75c:
	ld a, [bc]
	cp $14
	ret c
	ld hl, wTempleRock3
	jr Func_ad77e

Func_ad765:
	ld a, [bc]
	cp $08
	ret c
	ld hl, wTempleRock4
	jr Func_ad77e

Func_ad76e:
	ld a, [bc]
	cp $10
	ret c
	ld hl, wTempleRock5
	jr Func_ad77e

Func_ad777:
	ld a, [bc]
	cp $08
	ret c
	ld hl, wTempleRock6

Func_ad77e:
	ld b, $01
	jp Func_ad825
; 0xad783

Func_ad783: ; ad783 (2b:5783)
	ld a, [bc]
	cp $3c
	ret c
	ld hl, w2d180
	ld a, [wSceneWario]
	sub $1c
	ld [hli], a ; y
	ld a, [wSceneWarioXCoord]
	ld [hl], a ; x
	ld a, $02
	ld hl, w2d180State
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ad335
; 0xad7a7

Func_ad7a7: ; ad7a7 (2b:57a7)
	ld a, [w2d180State]
	and a
	ret nz
	jp Func_ad335
; 0xad7af

Func_ad7af: ; ad7af (2b:57af)
	ld c, $2d
	jp Func_ad330
; 0xad7b4

Func_ad7b4: ; ad7b4 (2b:57b4)
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	jp Func_ad335
; 0xad7bc

Func_ad7bc: ; ad7bc (2b:57bc)
	ld b, SCENEWARIO_LOOK_FORWARD
	jp Func_ad329
; 0xad7c1

Func_ad7c1: ; ad7c1 (2b:57c1)
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
; 0xad7dd

Func_ad7dd: ; ad7dd (2b:57dd)
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
; 0xad7f0

Func_ad7f0: ; ad7f0 (2b:57f0)
	ld a, $0b
	ld [w2d896], a
	jp Func_ad335
; 0xad7f8

Func_ad7f8:
	ld a, [bc]
	cp $14
	ret c
	ld hl, wTempleRock1
	jr Func_ad823

Func_ad801:
	ld a, [bc]
	cp $04
	ret c
	ld hl, wTempleRock2
	jr Func_ad823

Func_ad80a:
	ld a, [bc]
	cp $0a
	ret c
	ld hl, wTempleRock3
	jr Func_ad823

Func_ad813:
	ld a, [bc]
	cp $04
	ret c
	ld hl, wTempleRock4
	jr Func_ad823

Func_ad81c:
	ld a, [bc]
	cp $0a
	ret c
	ld hl, wTempleRock5

Func_ad823:
	ld b, $02

Func_ad825: ; ad825 (2b:5825)
	ld a, $01
	ld [hli], a ; action
	xor a
	ld [hli], a ; counter
	ld [hl], b  ; size
	jp Func_ad335
; 0xad82e

Func_ad82e: ; ad82e (2b:582e)
	ld a, [bc]
	cp $0a
	ret c
	ld hl, wTempleRock6
	jr Func_ad823
; 0xad837

Func_ad837: ; ad837 (2b:5837)
	ld a, [bc]
	cp $1e
	ret c
	xor a
	ld [wSceneObj8Unk7], a
	ld hl, wTempleRock7
	jr Func_ad823
; 0xad844

Func_ad844: ; ad844 (2b:5844)
	ld a, [bc]
	cp $08
	ret c
	xor a
	ld [wSceneObj9Unk7], a
	ld hl, wTempleRock8
	jr Func_ad823
; 0xad851

Func_ad851: ; ad851 (2b:5851)
	ld a, [bc]
	cp $0a
	ret c
	xor a
	ld [wSceneObj10Unk7], a
	ld hl, wTempleRock9
	jr Func_ad823
; 0xad85e

Func_ad85e: ; ad85e (2b:585e)
	ld a, [bc]
	cp $08
	ret c
	xor a
	ld [wSceneObj11Unk7], a
	ld hl, wTempleRock10
	jr Func_ad823
; 0xad86b

Func_ad86b: ; ad86b (2b:586b)
	ld a, $01
	ld [w2d14d], a
	ld a, SCENEWARIO_PANIC_JUMP
	call SetSceneWarioState
	jp Func_ad335
; 0xad878

Func_ad878: ; ad878 (2b:5878)
	ld b, $02
	jp Func_ad329
; 0xad87d

Func_ad87d: ; ad87d (2b:587d)
	ld a, [bc]
	cp $08
	ret c
	ld a, $01
	ld [w2d894], a
	jp Func_ad335
; 0xad889

Func_ad889: ; ad889 (2b:5889)
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

	dw Func_ad8a8
	dw Func_ad8b5
	dw Func_ad8c3
	dw Func_ad8d7
	dw Func_ad8b5
	dw Func_ad8f1
	dw Func_ad8ff
	dw Func_ad90a
; 0xad8a8

Func_ad8a8: ; ad8a8 (2b:58a8)
	ld a, SCENEWARIO_PANIC_RUN_RIGHT
	call SetSceneWarioState
Func_ad8ad: ; ad8ad (2b:58ad)
	ld hl, w2d892
	inc [hl]
	xor a
	inc l
	ld [hl], a ; w2d893
	ret
; 0xad8b5

Func_ad8b5: ; ad8b5 (2b:58b5)
	call ApplySceneWarioMovementRight
	cp $80
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_PANIC_RUN_LEFT
	call SetSceneWarioState
	jr Func_ad8ad
; 0xad8c3

Func_ad8c3: ; ad8c3 (2b:58c3)
	call ApplySceneWarioMovementLeft
	cp $20
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_PANIC_RUN_RIGHT
	call SetSceneWarioState
	ld hl, w2d892
	dec [hl]
	xor a
	inc l
	ld [hl], a ; w2d893
	ret
; 0xad8d7

Func_ad8d7: ; ad8d7 (2b:58d7)
	ld a, [wSceneWarioState]
	cp SCENEWARIO_PANIC_RUN_RIGHT
	jr z, .asm_ad8ec
	call ApplySceneWarioMovementLeft
	cp $20
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_PANIC_RUN_RIGHT
	call SetSceneWarioState
	jr Func_ad8ad
.asm_ad8ec
	call Func_ad8ad
	jr Func_ad8b5
; 0xad8f1

Func_ad8f1: ; ad8f1 (2b:58f1)
	call ApplySceneWarioMovementLeft
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_LEFT
	call SetSceneWarioState
	jr Func_ad8ad
; 0xad8ff

Func_ad8ff: ; ad8ff (2b:58ff)
	ld a, [bc]
	cp $14
	ret c
	ld a, SCENEWARIO_TURN_BACK_LEFT
	call SetSceneWarioState
	jr Func_ad8ad
; 0xad90a

Func_ad90a: ; ad90a (2b:590a)
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	xor a
	ld [w2d894], a
	ld [w2d893], a
	ld [w2d892], a
	ret
; 0xad91b

DoHiddenFigureLeftHandMovement: ; ad91b (2b:591b)
	ld a, [w2d8da]
	and a
	ret z
	ld hl, wSceneObj3
	ld de, Data_ad939
	call ApplyMovement
	ret
; 0xad92a

DoHiddenFigureRightHandMovement: ; ad92a (2b:592a)
	ld a, [w2d8dc]
	and a
	ret z
	ld hl, wSceneObj4
	ld de, Data_ad939
	call ApplyMovement_Mirrored
	ret
; 0xad939

Data_ad939: ; ad939 (2b:5939)
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
; 0xad9b2

	INCROM $ad9b2, $ade49

_InitPrologueSequence: ; ade49 (2b:5e49)
	call ClearGeneralSceneRAM
	call ClearSceneObjsRAM
	call VBlank_accb0

	decompress_vram1 BGMap_b34c3, v1BGMap1
	decompress BGMap_b330c, v0BGMap1

	ld hl, PrologueBackgroundGfx
	ld b, BANK(PrologueBackgroundGfx)
	call LoadFarTiles

	decompress_vram1 FontGFX, v1Tiles0
	decompress_vram1 PrologueGfx, v1Tiles0
	decompress_vram1 BGMap_b3a5b, v1BGMap0
	decompress BGMap_b3a03, v0BGMap0

	ld hl, MusicBoxGfx
	ld de, v0Tiles1
	ld b, BANK(MusicBoxGfx)
	ld c, $3
	call CopyFarBytes_Long

	ld a, [wLanguage]
	and a
	jr z, .japanese
; english
	decompress Data_b37f9, wTileBuffer
	jr .asm_adf63
.japanese
	decompress Data_b3675, wTileBuffer
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
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	ret
; 0xadf92

Func_adf92: ; adf92 (2b:5f92)
	ld a, [w2d014]
	cp c
	ret c
;	fallthrough

Func_adf97: ; adf97 (2b:5f97)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl] ; w2d013
	ret
; 0xadf9e

Func_adf9e: ; adf9e (2b:5f9e)
	ld hl, wSubState
	inc [hl]
	ret
; 0xadfa3

Func_adfa3: ; adfa3 (2b:5fa3)
	call Func_adfb0
	call Func_ac3d9
	call UpdateSceneWarioAnimation
	call Func_ac3fd
	ret
; 0xadfb0

Func_adfb0: ; adfb0 (2b:5fb0)
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
; 0xae002

Func_ae002: ; ae002 (2b:6002)
	ld c, $3c
	jp Func_adf92
; 0xae007

Func_ae007: ; ae007 (2b:6007)
	ld a, $01
;	fallthrough

Func_ae009: ; ae009 (2b:6009)
	ld [w2d880], a
	xor a
	ld [w2d0d5], a
	ld [w2d0db], a
	jp Func_adf97
; 0xae016

Func_ae016: ; ae016 (2b:6016)
	ld hl, wSCX
	inc [hl]
	ld a, [hl]
	cp $28
	ret nz
	jp Func_adf97
; 0xae021

Func_ae021: ; ae021 (2b:6021)
	ld a, $00
	jr Func_ae009
; 0xae025

Func_ae025: ; ae025 (2b:6025)
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
; 0xae067

Func_ae067: ; ae067 (2b:6067)
	ld hl, wSceneObj3YCoord
	ld a, $c3
	ld [hli], a
	ld a, $78
	ld [hl], a
	ld hl, wSceneObj3State
	ld a, $09
	call SetSceneObjState
	ret
; 0xae079

Func_ae079: ; ae079 (2b:6079)
	xor a
	ld [wSCY], a
	ld [wSCX], a
	ld a, LCDCF_BG9C00
	ld [wLCDCFlagsToFlip], a
	ld a, $50
	ld hl, wSceneObj7End
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

Func_ae0ab: ; ae0ab (2b:60ab)
	ld de, wTempPals1
	ld c, 8 palettes
	ld b, BANK(Pals_86a0d)
	call CopyFarBytes

	ld de, Data_ac9f5
	call Func_ac9e9
	ld de, Data_ac9ff
	call Func_ac9e4
	jp Func_adf97
; 0xae0c4

Func_ae0c4: ; ae0c4 (2b:60c4)
	ld a, $70
	ld [wSCY], a
	xor a
	ld [wSCX], a
	ld a, LCDCF_BG9C00
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
; 0xae0f9

Func_ae0f9: ; ae0f9 (2b:60f9)
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, BGMap_b0300
	ld b, $18
	ld c, $23
;	fallthrough

Func_ae104: ; ae104 (2b:6104)
	ld a, BANK(BGMap_b0300)
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
; 0xae119

Func_ae119: ; ae119 (2b:6119)
	ld a, BANK("VRAM1")
	ld [wHDMADestVRAMBank], a
	ld de, BGMap_b0540
	ld b, $18
	ld c, $23
	jr Func_ae104
; 0xae127

Func_ae127: ; ae127 (2b:6127)
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, BGMap_b0780
	ld b, $10
	ld c, $7f
	jr Func_ae104
; 0xae134

Func_ae134: ; ae134 (2b:6134)
	xor a
	ld [wSCY], a
	ld [wSCX], a
	ld a, LCDCF_BG9C00
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
; 0xae15b

Func_ae15b: ; ae15b (2b:615b)
	ld a, [w2d014]
	and $07
	ret nz
	jp Func_ac9ba
; 0xae164

Func_ae164: ; ae164 (2b:6164)
	ld a, $02
	jp Func_ae009
; 0xae169

Func_ae169: ; ae169 (2b:6169)
	ld c, $07
	ld a, [w2d0d5]
	cp $08
	jr c, .asm_ae174
	ld c, $01
.asm_ae174
	ld a, [w2d014]
	and c
	ret nz
	jp Func_ac9ba
; 0xae17c

Func_ae17c: ; ae17c (2b:617c)
	ld c, $1e
	jp Func_adf92
; 0xae181

Func_ae181: ; ae181 (2b:6181)
	call Func_acaf3
	call Func_ae188
	ret
; 0xae188

Func_ae188: ; ae188 (2b:6188)
	ld a, [wCurTextBufferPage]
	cp $02
	jr z, .asm_ae190
	ret
.asm_ae190
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	ret
; 0xae196

Func_ae196: ; ae196 (2b:6196)
	ld a, SCENEWARIO_NOD_ONCE
	call SetSceneWarioState
	jp Func_adf97
; 0xae19e

Func_ae19e: ; ae19e (2b:619e)
	ld a, [wSceneWarioState]
	cp SCENEWARIO_LOOK_BACK
	ret nz
	ld hl, wSceneObj1State
	ld a, $01
	call SetSceneObjState
	jp Func_adf97
; 0xae1af

Func_ae1af: ; ae1af (2b:61af)
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	ld hl, wSceneObj1State
	xor a
	call SetSceneObjState
	call ClearTextbox
	jp Func_adf97
; 0xae1c2

Func_ae1c2: ; ae1c2 (2b:61c2)
	ld a, [wSceneWarioState]
	cp b
	ret nz
	jr Func_ae1ce

Func_ae1c9: ; ae1c9 (2b:61c9)
	ld a, [w2d891]
	cp c
	ret c
;	fallthrough

Func_ae1ce: ; ae1ce (2b:61ce)
	ld hl, w2d891
	xor a
	ld [hld], a
	inc [hl] ; w2d890
	ret
; 0xae1d5

Func_ae1d5: ; ae1d5 (2b:61d5)
	xor a
	ld hl, w2d890
	ld [hli], a
	ld [hl], a ; w2d891
	jp Func_adf97
; 0xae1de

Func_ae1de: ; ae1de (2b:61de)
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
; 0xae1f1

Func_ae1f1: ; ae1f1 (2b:61f1)
	ld c, $14
	jr Func_ae1c9
; 0xae1f5

Func_ae1f5: ; ae1f5 (2b:61f5)
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
; 0xae211

Func_ae211: ; ae211 (2b:6211)
	ld c, $0a
	jr Func_ae1c9
; 0xae215

Func_ae215: ; ae215 (2b:6215)
	ld hl, wSceneObj5
	ld a, $30
	ld [hli], a
	ld a, $78
	ld [hl], a
	ld a, $0e
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp Func_ae1ce
; 0xae229

Func_ae229: ; ae229 (2b:6229)
	ld c, $5a
	jr Func_ae1c9
; 0xae22d

Func_ae22d: ; ae22d (2b:622d)
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
; 0xae251

Func_ae251: ; ae251 (2b:6251)
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae259

Func_ae259: ; ae259 (2b:6259)
	call ApplySceneWarioMovementRight
	cp $32
	jr z, Func_ae26c
	cp $40
	ret nz
	ld [hl], a

Func_ae264: ; ae264 (2b:6264)
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce

Func_ae26c: ; ae26c (2b:626c)
	ld a, $01
	ld [w2d8b0], a
	ret
; 0xae272

Func_ae272: ; ae272 (2b:6272)
	ld a, [w2d8b0]
	and a
	ret nz
	jp Func_ae1ce
; 0xae27a

Func_ae27a: ; ae27a (2b:627a)
	ld a, [w2d891]
	cp $16
	ret c
	ld hl, w2d180
	ld a, [wSceneWarioYCoord]
	sub $18
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add $10
	ld [hl], a
	ld a, $11
	ld hl, w2d180State
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ae1ce
; 0xae2a2

Func_ae2a2: ; ae2a2 (2b:62a2)
	ld a, [w2d180State]
	and a
	ret nz
	jp Func_ae1ce
; 0xae2aa

Func_ae2aa: ; ae2aa (2b:62aa)
	ld c, $1a
	jp Func_ae1c9
; 0xae2af

Func_ae2af: ; ae2af (2b:62af)
	call ApplySceneWarioMovementRight
	cp $66
	ret nz
	ld [hl], a
	jr Func_ae264
; 0xae2b8

Func_ae2b8: ; ae2b8 (2b:62b8)
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
; 0xae2cb

Func_ae2cb: ; ae2cb (2b:62cb)
	ld a, SCENEWARIO_LOOK_MUSIC_BOX
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae2d3

Func_ae2d3: ; ae2d3 (2b:62d3)
	ld b, SCENEWARIO_HOLD_MUSIC_BOX
	jp Func_ae1c2
; 0xae2d8

Func_ae2d8: ; ae2d8 (2b:62d8)
	ld c, $3c
	jp Func_ae1c9
; 0xae2dd

Func_ae2dd: ; ae2dd (2b:62dd)
	ld a, [w2d8b0]
	jumptable
	dw Func_ae2fb
	dw Func_ae2ed
	dw Func_ae303
	dw Func_ae2ed
	dw Func_ae2fc
	dw Func_ae30e
; 0xae2ed

Func_ae2ed: ; ae2ed (2b:62ed)
	ld a, $0e
	ld hl, wSceneObj1State
	call SetSceneObjState
Func_ae2f5: ; ae2f5 (2b:62f5)
	ld hl, w2d8b1
	xor a
	ld [hld], a
	inc [hl] ; w2d8b0
Func_ae2fb: ; ae2fb (2b:62fb)
	ret
; 0xae2fc

Func_ae2fc: ; ae2fc (2b:62fc)
	ld a, [wSceneObj1State]
	and a
	ret nz
	jr Func_ae2f5
; 0xae303

Func_ae303: ; ae303 (2b:6303)
	ld a, [wSceneObj1State]
	and a
	ret nz
	ld hl, w2d8b0
	ld [hli], a
	ld [hl], a
	ret
; 0xae30e

Func_ae30e: ; ae30e (2b:630e)
	ld hl, w2d8b1
	inc [hl]
	ld a, [hl]
	cp $14
	ret c
	ld hl, w2d8b0
	dec [hl]
	dec [hl]
	ret
; 0xae31c

Func_ae31c: ; ae31c (2b:631c)
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
; 0xae352

Func_ae352: ; ae352 (2b:6352)
	ld a, [wSceneObj1State]
	and a
	ret nz
	jp Func_ae1ce
; 0xae35a

Func_ae35a: ; ae35a (2b:635a)
	ld a, [w2d891]
	cp $14
	ret c
	stop_music2
	jp Func_ae1ce
; 0xae36f

Func_ae36f: ; ae36f (2b:636f)
	ld c, $1e
	jp Func_ae1c9
; 0xae374

Func_ae374: ; ae374 (2b:6374)
	ld a, SCENEWARIO_PICKUP_MUSIC_BOX
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae37c

Func_ae37c: ; ae37c (2b:637c)
	ld a, [w2d891]
	cp $08
	ret nc
	ld hl, wSceneObj3State
	ld a, $0a
	call SetSceneObjState
	jp Func_ae1ce
; 0xae38d

Func_ae38d: ; ae38d (2b:638d)
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
; 0xae3a9

Func_ae3a9: ; ae3a9 (2b:63a9)
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
; 0xae3d3

Func_ae3d3: ; ae3d3 (2b:63d3)
	ld c, $78
	jp Func_ae1c9
; 0xae3d8

Func_ae3d8: ; ae3d8 (2b:63d8)
	xor a
	ld hl, wSceneObj2State
	call SetSceneObjState
	jp Func_ae1ce
; 0xae3e2

Func_ae3e2: ; ae3e2 (2b:63e2)
	ld hl, w2d180
	ld a, [wSceneWarioYCoord]
	sub $08
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	ld [hl], a
	ld a, $0e
	ld hl, w2d180State
	call SetSceneObjState
	jp Func_ae1ce
; 0xae3fa

Func_ae3fa: ; ae3fa (2b:63fa)
	ld a, [w2d180State]
	and a
	ret nz
	ld a, $80
	ld [w2d150], a
	jp Func_ae1ce
; 0xae407

Func_ae407: ; ae407 (2b:6407)
	ld hl, w2d180
	ld a, [wSceneWarioYCoord]
	sub $10
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add $02
	ld [hl], a
	ld a, $15
	ld hl, w2d180State
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
; 0xae435

Func_ae435: ; ae435 (2b:6435)
	ld a, [w2d180State]
	cp $16
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae442

Func_ae442: ; ae442 (2b:6442)
	ld c, $3c
	jp Func_ae1c9
; 0xae447

Func_ae447: ; ae447 (2b:6447)
	ld hl, w2d180
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
	dec [hl] ; w2d180
	ret

.asm_ae45e
	inc [hl] ; w2d181
	dec l
	dec [hl] ; w2d180
	dec [hl]
	ld a, [hl]
	cp $a8
	jr z, .asm_ae46d
	cp $9c
	ret nz
	jp Func_ae1ce
.asm_ae46d
	ld a, $17
	ld hl, w2d180State
	call SetSceneObjState
	ret
; 0xae476

Func_ae476: ; ae476 (2b:6476)
	ld a, $09
	ld hl, wSceneObj3State
	call SetSceneObjState
	xor a
	ld hl, w2d180State
	call SetSceneObjState
	jp Func_ae1ce
; 0xae488

Func_ae488: ; ae488 (2b:6488)
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
; 0xae4a4

Func_ae4a4: ; ae4a4 (2b:64a4)
	ld c, $28
	jp Func_ae1c9
; 0xae4a9

Func_ae4a9: ; ae4a9 (2b:64a9)
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
; 0xae4c0

Func_ae4c0: ; ae4c0 (2b:64c0)
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
; 0xae4e5

Func_ae4e5: ; ae4e5 (2b:64e5)
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
; 0xae4fe

Func_ae4fe: ; ae4fe (2b:64fe)
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
; 0xae515

Func_ae515: ; ae515 (2b:6515)
	play_sfx SFX_BUMP
	ret
; 0xae51e

Func_ae51e: ; ae51e (2b:651e)
	ld c, $78
	jp Func_ae1c9
; 0xae523

Func_ae523: ; ae523 (2b:6523)
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
; 0xae55c

Func_ae55c: ; ae55c (2b:655c)
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
; 0xae585

Func_ae585: ; ae585 (2b:6585)
	ld a, [w2d14e]
	inc a
	ret nz
	jp Func_ae1ce
; 0xae58d

Func_ae58d: ; ae58d (2b:658d)
	ld a, [bc]
	cp $4b
	ret c
	ld a, SCENEWARIO_WAKE_UP
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae599

Func_ae599: ; ae599 (2b:6599)
	ld a, [bc]
	cp $14
	ret c
	play_sfx SFX_GRAB
	jp Func_ae1ce
; 0xae5a8

Func_ae5a8: ; ae5a8 (2b:65a8)
	ld a, [wSceneWarioState]
	cp SCENEWARIO_SIT_IDLE
	ret nz
	jp Func_ae1ce
; 0xae5b1

Func_ae5b1: ; ae5b1 (2b:65b1)
	ld a, [bc]
	cp $05
	ret c
	ld a, [wSceneWarioYCoord]
	sub $01
	ld [w2d180YCoord], a
	ld a, [wSceneWarioXCoord]
	add $09
	ld [w2d180XCoord], a
	ld a, $14
	ld hl, w2d180State
	call SetSceneObjState
	jp Func_ae1ce
; 0xae5d0

Func_ae5d0: ; ae5d0 (2b:65d0)
	ld a, [bc]
	cp $8c
	ret c
	ld a, SCENEWARIO_SIT_STILL
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae5dc

Func_ae5dc: ; ae5dc (2b:65dc)
	ld a, [bc]
	cp $10
	ret c
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	play_sfx SFX_12A
	jp Func_ae1ce
; 0xae5f0

Func_ae5f0: ; ae5f0 (2b:65f0)
	ld c, $3c
	jp Func_ae1c9
; 0xae5f5

Func_ae5f5: ; ae5f5 (2b:65f5)
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae5fd

Func_ae5fd: ; ae5fd (2b:65fd)
	call ApplySceneWarioMovementRight
	cp $50
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae60c

Func_ae60c: ; ae60c (2b:660c)
	ld a, [bc]
	cp $1e
	ret c
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae618

Func_ae618: ; ae618 (2b:6618)
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2
; 0xae61d

Func_ae61d: ; ae61d (2b:661d)
	ld a, [bc]
	cp $1e
	ret c
	play_music2 MUSIC_THE_TEMPLE
	jp Func_ae1ce
; 0xae630

Func_ae630: ; ae630 (2b:6630)
	ld a, [bc]
	cp $1e
	ret c
	ld a, SCENEWARIO_LOOK_AROUND
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae63c

Func_ae63c: ; ae63c (2b:663c)
	ld c, $1e
	jp Func_ae1c9
; 0xae641

Func_ae641: ; ae641 (2b:6641)
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
; 0xae652

Func_ae652: ; ae652 (2b:6652)
	ld b, SCENEWARIO_LOOK_FORWARD
	jp Func_ae1c2
; 0xae657

Func_ae657: ; ae657 (2b:6657)
	ld a, SCENEWARIO_JUMP_AND_BOW
	call SetSceneWarioState
	xor a
	ld [wSceneWarioUnk7], a
	jp Func_ae1ce
; 0xae663

Func_ae663: ; ae663 (2b:6663)
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2
; 0xae668

Func_ae668: ; ae668 (2b:6668)
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
; 0xae683

Func_ae683: ; ae683 (2b:6683)
	ld a, SCENEWARIO_SNAP_FINGERS
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae68b

Func_ae68b: ; ae68b (2b:668b)
	ld a, [wSceneWarioFrame]
	cp $0f
	ret nz
	play_sfx SFX_106
	jp Func_ae1ce
; 0xae69c

Func_ae69c: ; ae69c (2b:669c)
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2
; 0xae6a1

Func_ae6a1: ; ae6a1 (2b:66a1)
	ld c, $1e
	jp Func_ae1c9
; 0xae6a6

Func_ae6a6: ; ae6a6 (2b:66a6)
	ld a, SCENEWARIO_TURN_BACK_TO_LEFT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae6ae

Func_ae6ae: ; ae6ae (2b:66ae)
	ld b, SCENEWARIO_IDLE_LEFT
	jp Func_ae1c2
; 0xae6b3

Func_ae6b3: ; ae6b3 (2b:66b3)
	ld a, [w2d891]
	cp $04
	ret c
	ld a, SCENEWARIO_WALK_LEFT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae6c1

Func_ae6c1: ; ae6c1 (2b:66c1)
	call ApplySceneWarioMovementLeft
	cp $f0
	ret nz
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae6ce

Func_ae6ce: ; ae6ce (2b:66ce)
	ld c, $1e
	jp Func_ae1c9
; 0xae6d3

Func_ae6d3: ; ae6d3 (2b:66d3)
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
; 0xae6f3

Func_ae6f3: ; ae6f3 (2b:66f3)
	ld c, $4a
	jp Func_ae1c9
; 0xae6f8

Func_ae6f8: ; ae6f8 (2b:66f8)
	ld hl, wSceneWarioYCoord
	ld a, $3c
	ld [hli], a
	ld a, $f0
	ld [hl], a
	ld a, SCENEWARIO_ON_FIRE
	call SetSceneWarioState
	play_sfx SFX_019
	xor a
	ld [w2d894], a
	ld [w2d892], a
	jp Func_ae1ce
; 0xae718

Func_ae718: ; ae718 (2b:6718)
	call Func_ae724
	ld a, [w2d892]
	cp $80
	ret nz
	jp Func_ae1ce
; 0xae724

Func_ae724: ; ae724 (2b:6724)
	ld a, [w2d894]
	and a
	jr z, .asm_ae740
	ld a, [w2d891]
	and $03
	jr z, .asm_ae740
	ld de, Data_aed06
	ld hl, wSceneWario
	call ApplyMovement
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
	ld hl, w2d180
	ld a, [wSceneWarioYCoord]
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	ld [hl], a
	ld a, $10
	ld hl, w2d180State
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
; 0xae7f2

Func_ae7f2: ; ae7f2 (2b:67f2)
	ld a, $80
	ld [w2d892], a
	ret
; 0xae7f8

Func_ae7f8: ; ae7f8 (2b:67f8)
	play_sfx SFX_BUMP
	ret
; 0xae801

Func_ae801: ; ae801 (2b:6801)
	ld c, $3c
	jp Func_ae1c9
; 0xae806

Func_ae806: ; ae806 (2b:6806)
	ld a, SCENEWARIO_TURN_BACK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae80e

Func_ae80e: ; ae80e (2b:680e)
	ld b, SCENEWARIO_LOOK_BACK
	jp Func_ae1c2
; 0xae813

Func_ae813: ; ae813 (2b:6813)
	ld c, $26
	jp Func_ae1c9
; 0xae818

Func_ae818: ; ae818 (2b:6818)
	ld a, SCENEWARIO_LOOK_AROUND_THEN_TURN
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae820

Func_ae820: ; ae820 (2b:6820)
	ld b, SCENEWARIO_IDLE_RIGHT
	jp Func_ae1c2
; 0xae825

Func_ae825: ; ae825 (2b:6825)
	ld c, $2e
	jp Func_ae1c9
; 0xae82a

Func_ae82a: ; ae82a (2b:682a)
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
; 0xae84b

Func_ae84b: ; ae84b (2b:684b)
	ld c, $3c
	jp Func_ae1c9
; 0xae850

Func_ae850: ; ae850 (2b:6850)
	call ApplySceneWarioMovementRight
	cp $78
	ret nz
	ld [hl], a
	ld a, SCENEWARIO_IDLE_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae85f

Func_ae85f: ; ae85f (2b:685f)
	ld c, $3c
	jp Func_ae1c9
; 0xae864

Func_ae864: ; ae864 (2b:6864)
	ld a, SCENEWARIO_LOOK_UP
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae86c

Func_ae86c: ; ae86c (2b:686c)
	ld b, SCENEWARIO_IDLE_RIGHT
	jp Func_ae1c2
; 0xae871

Func_ae871: ; ae871 (2b:6871)
	ld hl, w2d180
	ld a, [wSceneWarioYCoord]
	sub $18
	ld [hli], a
	ld a, [wSceneWarioXCoord]
	add $10
	ld [hl], a
	ld a, $11
	ld hl, w2d180State
	call SetSceneObjState
	play_sfx SFX_106
	jp Func_ae1ce
; 0xae893

Func_ae893: ; ae893 (2b:6893)
	ld a, [w2d180State]
	and a
	ret nz
	jp Func_ae1ce
; 0xae89b

Func_ae89b: ; ae89b (2b:689b)
	ld c, $28
	jp Func_ae1c9
; 0xae8a0

Func_ae8a0: ; ae8a0 (2b:68a0)
	ld a, SCENEWARIO_WALK_RIGHT
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae8a8

Func_ae8a8: ; ae8a8 (2b:68a8)
	call ApplySceneWarioMovementRight
	cp $d0
	ret nz
	ld [hl], a
	xor a ; SCENEWARIO_NONE
	call SetSceneWarioState
	jp Func_ae1ce
; 0xae8b6

Func_ae8b6: ; ae8b6 (2b:68b6)
	ld c, $28
	jp Func_ae1c9
; 0xae8bb

Func_ae8bb: ; ae8bb (2b:68bb)
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

.Func_ae8d8
	ret

.Func_ae8d9
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a3
	call Func_ae915
	jp .asm_ae912

.Func_ae8e8
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a5
	call Func_ae915
	jr .asm_ae912

.Func_ae8f6
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a7
	call Func_ae915
	jr .asm_ae912

.Func_ae904
	ld a, [w2d8a1]
	cp $08
	ret c
	ld hl, w2d8a9
	call Func_ae915
	jr .asm_ae912 ; unnecessary jump
.asm_ae912
	ld hl, w2d8a1

Func_ae915: ; ae915 (2b:6915)
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xae919

Func_ae919: ; ae919 (2b:6919)
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	set 2, l
	ld a, c
	call SetSceneObjState
	ret
; 0xae924

Func_ae924: ; ae924 (2b:6924)
	ld hl, w2d8a3
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a2
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
; 0xae948

Func_ae948: ; ae948 (2b:6948)
	play_sfx SFX_006

Func_ae950: ; ae950 (2b:6950)
	ld hl, w2d8a3
	jp Func_ae915
; 0xae956

Func_ae956: ; ae956 (2b:6956)
	ld a, [wSceneObj3YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a2
	inc [hl]
	ret
; 0xae969

Func_ae969: ; ae969 (2b:6969)
	ld hl, w2d8a3
	ld a, [hl]
	cp c
	ret c
	jr Func_ae915
; 0xae971

Func_ae971: ; ae971 (2b:6971)
	ld hl, wSceneObj3
	lb de, $2e, $f0
	ld c, $06
	call Func_ae919
	jr Func_ae950
; 0xae97e

Func_ae97e: ; ae97e (2b:697e)
	call Func_ae9d0
	jr Func_ae956
; 0xae983

Func_ae983: ; ae983 (2b:6983)
	call Func_ae9d0
	ret nz
	jr Func_ae948
; 0xae989

Func_ae989: ; ae989 (2b:6989)
	ld c, $08
	jr Func_ae969
; 0xae98d

Func_ae98d: ; ae98d (2b:698d)
	ld hl, wSceneObj3
	lb de, $4d, $e0
	ld c, $05
	call Func_ae919
	jr Func_ae950
; 0xae99a

Func_ae99a: ; ae99a (2b:699a)
	call Func_ae9da
	jr Func_ae956
; 0xae99f

Func_ae99f: ; ae99f (2b:699f)
	call Func_ae9da
	ret nz
	jr Func_ae948
; 0xae9a5

Func_ae9a5: ; ae9a5 (2b:69a5)
	ld c, $28
	jr Func_ae969
; 0xae9a9

Func_ae9a9: ; ae9a9 (2b:69a9)
	ld hl, wSceneObj3
	lb de, $3e, $f0
	ld c, $04
	call Func_ae919
	jr Func_ae950
; 0xae9b6

Func_ae9b6: ; ae9b6 (2b:69b6)
	call Func_ae9e4
	jr Func_ae956
; 0xae9bb

Func_ae9bb: ; ae9bb (2b:69bb)
	call Func_ae9e4
	ret nz
	jr Func_ae948
; 0xae9c1

Func_ae9c1: ; ae9c1 (2b:69c1)
	ld c, $08
	jr Func_ae969
; 0xae9c5

Func_ae9c5: ; ae9c5 (2b:69c5)
	xor a
	ld [w2d8a2], a
	ld hl, wSceneObj3State
	call SetSceneObjState
	ret
; 0xae9d0

Func_ae9d0: ; ae9d0 (2b:69d0)
	ld de, Data_aee09
	ld hl, wSceneObj3
	call ApplyMovement
	ret
; 0xae9da

Func_ae9da: ; ae9da (2b:69da)
	ld de, Data_aedba
	ld hl, wSceneObj3
	call ApplyMovement
	ret
; 0xae9e4

Func_ae9e4: ; ae9e4 (2b:69e4)
	ld de, Data_aed6d
	ld hl, wSceneObj3
	call ApplyMovement
	ret
; 0xae9ee

Func_ae9ee: ; ae9ee (2b:69ee)
	ld hl, w2d8a5
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a4
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

.Func_aea16
	play_sfx SFX_006
.Func_aea1e
	ld hl, w2d8a5
	jp Func_ae915

.Func_aea24
	ld a, [wSceneObj4YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a4
	inc [hl]
	ret

.Func_aea37
	ld hl, w2d8a5
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aea40
	ld hl, wSceneObj4
	lb de, $3e, $f0
	ld c, $02
	call Func_ae919
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea54
	call .Func_aeaef
	jr .asm_aea95

.Func_aea59
	call .Func_aeaef
	ret nz
	jr .Func_aea16

.Func_aea5f
	ld c, $04
	jr .Func_aea37

.Func_aea63
	ld a, $12
	ld hl, wSceneObj4State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea6d
	ld c, $28
	jr .Func_aea37

.Func_aea71
	ld hl, wSceneObj4
	lb de, $2e, $e0
	ld c, $08
	call Func_ae919

.Func_aea7c
	ld a, [wSceneObj4YCoord]
	ld [wSceneObj1YCoord], a
	ld a, [wSceneObj4XCoord]
	ld [wSceneObj1XCoord], a
	ld a, $0f
	ld hl, wSceneObj1State
	call SetSceneObjState
	jr .Func_aea1e

.Func_aea92
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
	ld hl, w2d8a4
	inc [hl]
	ret

.Func_aeab9
	call .Func_aeaf9
	ret nz
	jp .Func_aea16

.Func_aeac0
	ld c, $08
	jp .Func_aea37

.Func_aeac5
	ld hl, wSceneObj4
	lb de, $2e, $f4
	ld c, $04
	call Func_ae919
	jr .Func_aea7c

.Func_aead2
	call .Func_aeb03
	jp .Func_aea24

.Func_aead8
	call .Func_aeb03
	ret nz
	jp .Func_aea16

.Func_aeadf
	ld c, $08
	jp .Func_aea37

.Func_aeae4
	xor a
	ld [w2d8a4], a
	ld hl, wSceneObj4State
	call SetSceneObjState
	ret

.Func_aeaef
	ld de, Data_aed6d
	ld hl, wSceneObj4
	call ApplyMovement
	ret

.Func_aeaf9
	ld de, Data_aee09
	ld hl, wSceneObj4
	call ApplyMovement
	ret

.Func_aeb03
	ld de, Data_aee09
	ld hl, wSceneObj4
	call ApplyMovement
	ret
; 0xaeb0d

Func_aeb0d: ; aeb0d (2b:6b0d)
	ld hl, w2d8a7
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a6
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

.Func_aeb35
	play_sfx SFX_006
.Func_aeb3d
	ld hl, w2d8a7
	jp Func_ae915

.Func_aeb43
	ld a, [wSceneObj5YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a6
	inc [hl]
	ret

.Func_aeb56
	ld hl, w2d8a7
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aeb5f
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

.Func_aeb80
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
	ld hl, w2d8a6
	inc [hl]
	ret

.Func_aeba7
	call .Func_aec0b
	ret nz
	jr .Func_aeb35

.Func_aebad
	ld c, $08
	jr .Func_aeb56

.Func_aebb1
	ld hl, wSceneObj5
	lb de, $2e, $f0
	ld c, $07
	call Func_ae919
	jp .Func_aeb3d

.Func_aebbf
	call .Func_aec15
	jp .Func_aeb43

.Func_aebc5
	call .Func_aec15
	ret nz
	jp .Func_aeb35

.Func_aebcc
	ld c, $04
	jr .Func_aeb56

.Func_aebd0
	ld a, $13
	ld hl, wSceneObj5State
	call SetSceneObjState
	jp .Func_aeb3d

.Func_aebdb
	ld c, $28
	jp .Func_aeb56

.Func_aebe0
	ld hl, wSceneObj5
	lb de, $4d, $f8
	ld c, $05
	call Func_ae919
	jp .Func_aeb3d

.Func_aebee
	call .Func_aec1a
	jp .Func_aeb43

.Func_aebf4
	call .Func_aec1a
	ret nz
	jp .Func_aeb35

.Func_aebfb
	ld c, $08
	jp .Func_aeb56

.Func_aec00
	xor a
	ld [w2d8a6], a
	ld hl, wSceneObj5State
	call SetSceneObjState
	ret

.Func_aec0b
	ld de, Data_aed6d
.Func_aec0e
	ld hl, wSceneObj5
	call ApplyMovement
	ret

.Func_aec15
	ld de, Data_aee09
	jr .Func_aec0e

.Func_aec1a
	ld de, Data_aedba
	jr .Func_aec0e
; 0xaec1f

Func_aec1f: ; aec1f (2b:6c1f)
	ld hl, w2d8a9
	inc [hl]
	dec l
	ld a, [hl] ; w2d8a8
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

.Func_aec3f
	play_sfx SFX_006
.Func_aec47
	ld hl, w2d8a9
	jp Func_ae915

.Func_aec4d
	ld a, [wSceneObj9YCoord]
	cp $62
	ret nz
	play_sfx SFX_006
	ld hl, w2d8a8
	inc [hl]
	ret

.Func_aec60
	ld hl, w2d8a9
	ld a, [hl]
	cp c
	ret c
	jp Func_ae915

.Func_aec69
	ld hl, wSceneObj9
	lb de, $4d, $f0
	ld c, $07
	call Func_ae919
	jr .Func_aec47

.Func_aec76
	call .Func_aecf2
	jr .Func_aec4d

.Func_aec7b
	call .Func_aecf2
	ret nz
	jr .Func_aec3f

.Func_aec81
	ld c, $04
	jr .Func_aec60

.Func_aec85
	ld a, $13
	ld hl, wSceneObj9State
	call SetSceneObjState
	jr .Func_aec47

.Func_aec8f
	ld c, $28
	jr .Func_aec60

.Func_aec93
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

.Func_aecb4
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
	ld hl, w2d8a8
	inc [hl]
	ret

.Func_aecdb
	call .Func_aecfc
	ret nz
	jp .Func_aec3f

.Func_aece2
	ld c, $08
	jp .Func_aec60

.Func_aece7
	xor a
	ld [w2d8a8], a
	ld hl, wSceneObj9State
	call SetSceneObjState
	ret

.Func_aecf2
	ld de, Data_aedba
.Func_aecf5
	ld hl, wSceneObj9
	call ApplyMovement
	ret

.Func_aecfc
	ld de, Data_aed6d
	jr .Func_aecf5

.Func_aed01
	ld de, Data_aee09
	jr .Func_aecf5
; 0xaed06

Data_aed06: ; aed06 (2b:6d06)
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
; 0xaed6d

Data_aed6d: ; aed6d (2b:6d6d)
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
; 0xaedba

Data_aedba: ; aedba (2b:6dba)
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
; 0xaee09

Data_aee09: ; aee09 (2b:6e09)
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
; 0xaee58

	INCROM $aee58, $af135

Func_af135: ; af135 (2b:7135)
	ld hl, w2d014
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xaf13c

	INCROM $af13c, $b0000

