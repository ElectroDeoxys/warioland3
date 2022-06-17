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
Func_ac064: ; ac064 (2b:4064)
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
	call Func_ac306
	ld bc, wSceneObj1State
	call Func_ac306
	ld bc, wSceneObj2State
	jp Func_ac306
; 0xac2c4

Func_ac2c4: ; ac2c4 (2b:42c4)
	ld bc, wSceneObj3State
	call Func_ac306
	ld bc, wSceneObj4State
	call Func_ac306
	ld bc, wSceneObj7State
	call Func_ac306
	ld bc, wSceneObj8State
	call Func_ac306
	ld bc, wSceneObj9State
	call Func_ac306
	ld bc, wSceneObj10State
	call Func_ac306
	ld bc, wSceneObj11State
	call Func_ac306
	ld bc, wSceneObj12State
	call Func_ac306
	ld bc, wSceneObj13State
	call Func_ac306
	ld bc, wSceneObj14State
	call Func_ac306
	ld bc, wSceneObj15State
	jp Func_ac306 ; unnecessary jump
; 0xac306

Func_ac306: ; ac306 (2b:4306)
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
	call Func_ac064
	jr nz, .Func_ac331
	jr Func_ac306

.Func_ac343
	call Func_ac00b
.Func_ac346
	ld de, OAM_15e813
	jp Func_ac047

; unreferenced
.Func_ac34c
	call Func_ac00b
	ld e, $00
	call Func_ac064
	jr nz, .Func_ac346
	jr Func_ac306

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
	call Func_ac064
	jr nz, .asm_ac3c4
	jp Func_ac306
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
	call Func_ac064
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
	call Func_ac064
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
	ld de, $6801
	jp .Func_ac43b

.Func_ac4f4
	ld de, Frameset_15e80a
	jp .Func_ac43b
; 0xac4fa

Func_ac4fa: ; ac4fa (2b:44fa)
	ld hl, w2d14c
	ld a, [hl]
	and a
	jr nz, .asm_ac509
	play_sfx SFX_12A
.asm_ac509
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

	INCROM $ac9b7, $ac9ba

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

Func_aca74: ; aca74 (2b:4a74)
	call ClearText

	ld de, wTextLine1
	ld hl, wTextBuffer
	ld b, TEXT_LINE_LENGTH
	call CopyHLToDE

	xor a
	ld hl, wTextDelayCounter
	ld bc, $10
	call WriteAToHL_BCTimes
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
	call Func_acea8
	ld a, [wCurTextLine]
	cp $80
	ret nz
	ld hl, w2da84
	inc [hl]
	jr Func_aca6d
; 0xacaad

Func_acaad: ; acaad (2b:4aad)
	ld a, [w2da84]
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
	ld a, $01
	ld hl, w2da84
	cp [hl]
	jr z, .asm_acae2
	ld a, [wJoypadPressed]
	bit A_BUTTON_F, a
	ret z
	xor a
	ld hl, wSceneObj1State
	call SetSceneObjState
.asm_acae2
	call Func_ace66
	jr Func_aca6d
; 0xacae7

Func_acae7: ; acae7 (2b:4ae7)
	call Func_acec4
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_aca6d
; 0xacaf3

Func_acaf3: ; acaf3 (2b:4af3)
	ld hl, w2da84
	inc [hl]
	ld a, [hl]
	ld b, $00
	swap a
	add a
	rl b
	add a
	rl b
	ld c, a
	ld hl, wTextBuffer
	add hl, bc
	ld a, [hl]
	cp $5d
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

	ld a, $02
	ldh [rSMBK], a

	xor a
	ldh [rSCX], a
	ld [wSCX], a
	ldh [rSCY], a
	ld [wSCY], a

	call VBlank_accb0
	call Func_acc9a
	call Func_acca5

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
	ld a, $00
	jp z, .asm_acc3e ; not collected
	ld hl, wGameModeFlags
	bit MODE_UNK0_F, [hl]
	jr z, .asm_acbb4
	bit MODE_TIME_ATTACK_F, [hl]
	jp z, .asm_acc3e
.asm_acbb4
	ld a, $03
	ld [w1da00], a

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
	ld [w1da00], a
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
	call Func_acf89

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
	ld [wObj1FrameDuration], a
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

Func_acc9a: ; acc9a (2b:4c9a)
	ld hl, wLCDCFlagsToFlip
	ld bc, $800
	xor a
	call WriteAToHL_BCTimes
	ret
; 0xacca5

Func_acca5: ; acca5 (2b:4ca5)
	ld hl, wSceneWario
	ld bc, $c0
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

Func_acd3a: ; acd3a (2b:4d3a)
	call .Func_acd51
	call Func_ac2b2
	call UpdateSceneWarioAnimation
	call Func_ac2c4
	call ClearUnusedVirtualOAM
	ret

.NextState
	ld hl, w2da05
	xor a
	ld [hld], a
	inc [hl] ; w2da04
	ret

.Func_acd51
	ld hl, w2da05
	inc [hl]
	ld c, l
	ld b, h
	ld a, [w1da00]
	jumptable

	dw .GoIn
	dw .Func_acdbe
	dw .GoOut
	dw Func_ad03b

.GoIn
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
	ld a, [w2da05]
	cp $08
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
	ld a, [w2da05]
	cp $32
	ret c
	ld a, SCENEWARIO_NOD
	call SetSceneWarioState
	ld hl, w2da05
	xor a
	ld [hld], a
	ld [hl], a ; w2da04
	xor a
	ld [wCurTextLine], a
	ld [wTextDelayCounter], a
	ld hl, w1da00
	ld [hl], $01
	ret

.Func_acdbe
	call .DelayAndPlayTempleMusic
	ld a, [wIsNextObjectiveTheTemple]
	and a
	call z, Func_acea8
	ld a, [wJoypadPressed]
	and B_BUTTON | D_LEFT
	jr nz, .asm_acdd0
	ret
.asm_acdd0
	ld hl, w2da05
	xor a
	ld [hld], a
	ld [hl], a ; w2da04
	call Func_ace60
	ld hl, w1da00
	ld [hl], $02
	ret

.GoOut
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
	ld a, [w2da05]
	cp $04
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
	ld a, [w2da05]
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

Func_ace60: ; ace60 (2b:4e60)
	ld d, $c0 ; dest lo
	ld e, $07
	jr Func_ace6a

Func_ace66: ; ace66 (2b:4e66)
	ld d, $e0 ; dest lo
	ld e, $05
;	fallthrough

Func_ace6a: ; ace6a (2b:4e6a)
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
	ld a, BANK(Func_ace6a)
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

Func_acea8: ; acea8 (2b:4ea8)
	ld hl, wTextDelayCounter
	inc [hl]
	ld a, [wCurTextLine]
	and a
	jr z, DelayTextThenGoToNextLine ; line 0
	dec a
	jr z, PrintText_FromStart ; line 1
	dec a
	jr z, PrintText_FromOffset1 ; line 2
	dec a
	jr z, PrintText_FromOffset2 ; line 3
	dec a
	jr z, PrintText_FromOffset3 ; line 4
	ld a, $80
	ld [wCurTextLine], a
	ret

Func_acec4: ; acec4 (2b:4ec4)
	ld hl, wTextDelayCounter
	inc [hl]
	ld a, [wCurTextLine]
	and a
	jr z, DelayTextThenGoToNextLine ; line 0
	dec a
	jr z, PrintText_FromOffset1 ; line 1
	dec a
	jr z, PrintText_FromOffset2 ; line 2
	dec a
	jr z, PrintText_FromOffset3 ; line 3
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

PrintText_FromStart: ; aceef (2b:4eef)
	ld c, 0
	jr PrintText

PrintText_FromOffset1: ; acef3 (2b:4ef3)
	ld c, 1
	jr PrintText

PrintText_FromOffset2: ; acef7 (2b:4ef7)
	ld c, 2
	jr PrintText

PrintText_FromOffset3: ; acefb (2b:4efb)
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
	srl b ; $2
.got_delay
	ld a, [wTextDelayCounter]
	cp b
	ret c ; still delaying
	xor a
	ld [wTextDelayCounter], a

; get next character
	ld a, c
	ld [wCurTextBufferPos], a
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
	ld hl, v0BGMap0 + $1c2
	ld a, [wBGMapToPrintText]
	and a
	jr z, .got_bgmap_pos
	ld hl, v0BGMap1 + $1c2
.got_bgmap_pos
	sla e
	ld a, d
	add e
	ld e, a
	ld d, $00
	rl d

	; first character always starts 1 tile to the left
	ld a, [wCurTextBufferPos]
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
	jr z, .asm_acf6e
	play_sfx SFX_130
.asm_acf6e
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
	ld a, [wCurTextBufferPos]
	ld c, a
	jr .got_buffer_pos
; 0xacf89

Func_acf89: ; acf89 (2b:4f89)
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
	ld a, [wObj1FrameDuration]
	cp c
	ret c
Func_ad016: ; ad016 (2b:5016)
	ld hl, wObj1FrameDuration
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xad01d

Func_ad01d: ; ad01d (2b:501d)
	stop_music2
	stop_sfx
	xor a
	ld [wSubState], a
	ld hl, wState
	inc [hl]
	scf
	ret
; 0xad03b

Func_ad03b: ; ad03b (2b:503b)
	ld a, [w2d013]
	cp $02
	jr c, .asm_ad051
	ld a, [wGameModeFlags]
	bit MODE_UNK2_F, a
	jr z, .asm_ad051
	ld a, [wJoypadPressed]
	bit B_BUTTON_F, a
	jp nz, Func_ad01d
.asm_ad051
	call Func_ad91b
	call Func_ad92a
	ld hl, wObj1FrameDuration
	inc [hl]
	ld a, [w2d013]
	jumptable

	dw Func_ad016
	dw Func_ad3af
	dw Func_ad0b3
	dw Func_aca74
	dw Func_aca9e
	dw Func_ad0b8
	dw Func_acaad
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
	dw Func_ad14d
	dw Func_ad170
	dw Func_ad182
	dw Func_ad195
	dw Func_ad1e3
	dw Func_ad355
	dw Func_ad1f9
	dw Func_ad1fe
	dw Func_aca9e
	dw Func_ad207
	dw Func_acaad
	dw Func_ad215
	dw Func_ad21d
	dw Func_ad22e
	dw Func_ad23a
	dw Func_acaad
	dw Func_ad259
	dw Func_ad271
	dw Func_ad27a
	dw Func_ad2f4
	dw Func_ad300
	dw Func_ad308
	dw Func_ad319
	dw Func_ad01d
; 0xad0b3

Func_ad0b3: ; ad0b3 (2b:50b3)
	ld c, $28
	jp Func_ad011
; 0xad0b8

Func_ad0b8: ; ad0b8 (2b:50b8)
	ld c, $1e
	jp Func_ad011
; 0xad0bd

Func_ad0bd: ; ad0bd (2b:50bd)
	jp Func_acaf3
; 0xad0c0

Func_ad0c0: ; ad0c0 (2b:50c0)
	ld a, [wObj1FrameDuration]
	cp $1e
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
	call Func_ace60
	jp Func_ad016
; 0xad0e4

Func_ad0e4: ; ad0e4 (2b:50e4)
	call Func_ad345
	ld a, $03
	ld [w2d880], a
	xor a
	ld [wObj7FramesetOffset], a
	ld [wObj7Action], a
	jp Func_ad16a
; 0xad0f6

Func_ad0f6: ; ad0f6 (2b:50f6)
	call Func_ad889
	call Func_ad345
	ld a, [wObj1FrameDuration]
	and $0f
	ret nz
	jp Func_ac9ba
; 0xad105

Func_ad105: ; ad105 (2b:5105)
	ld a, $01
	ld [w2d896], a
	call Func_ad345
	ld a, $00 ; xor a
	ld [w2d8b2], a
	ld [w2d8b6], a
	ld [w2d8ba], a
	ld [w2d8be], a
	ld [w2d8c2], a
	ld [w2d8c6], a
	ld [w2d8ca], a
	ld [w2d8ce], a
	ld [w2d8d2], a
	ld [w2d8d6], a
	jr Func_ad16a
; 0xad12f

Func_ad12f: ; ad12f (2b:512f)
	call Func_ad889
	call Func_ad345
	xor a
	ld de, $4
	ld hl, w2d8b0
	ld b, $0a
.asm_ad13e
	add [hl]
	add hl, de
	dec b
	jr nz, .asm_ad13e
	and a
	ret nz
	ld a, $08
	ld [w1d800], a
	jp Func_ad016
; 0xad14d

Func_ad14d: ; ad14d (2b:514d)
	xor a ; BANK(VRAM0)
	ld [wHDMADestVRAMBank], a
	ld de, $4800
	ld b, $08
	ld c, $7f
	ld a, $36
	ld [wObj4Unk19], a
Func_ad15d: ; ad15d (2b:515d)
	ld hl, wObj6OAMPtr
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
;	fallthrough

Func_ad16a: ; ad16a (2b:516a)
	call Func_ad889
	jp Func_ad016
; 0xad170

Func_ad170: ; ad170 (2b:5170)
	xor a
	ld [wHDMADestVRAMBank], a
	ld de, $5000
	ld b, $10
	ld c, $7f
	ld a, $36
	ld [wObj4Unk19], a
	jr Func_ad15d
; 0xad182

Func_ad182: ; ad182 (2b:5182)
	ld a, $01
	ld [wHDMADestVRAMBank], a
	ld de, $5800
	ld b, $00
	ld c, $7f
	ld a, $36
	ld [wObj4Unk19], a
	jr Func_ad15d
; 0xad195

Func_ad195: ; ad195 (2b:5195)
	call Func_ad889
	ld a, [wObj1FrameDuration]
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
	ld [wObj7FramesetOffset], a
	ld [wObj7Action], a
	jp Func_ad016
; 0xad1e3

Func_ad1e3: ; ad1e3 (2b:51e3)
	call Func_ad889
	ld c, $07
	ld a, [wObj7FramesetOffset]
	cp $14
	jr c, .asm_ad1f1
	ld c, $03
.asm_ad1f1
	ld a, [wObj1FrameDuration]
	and c
	ret nz
	jp Func_ac9ba
; 0xad1f9

Func_ad1f9: ; ad1f9 (2b:51f9)
	ld c, $28
	jp Func_ad011
; 0xad1fe

Func_ad1fe: ; ad1fe (2b:51fe)
	call Func_aca74
	ld a, $01
	ld [wBGMapToPrintText], a
	ret
; 0xad207

Func_ad207: ; ad207 (2b:5207)
	ld a, [wObj1FrameDuration]
	cp $1e
	ret c
	ld a, $04
	ld [w2da84], a
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
	call Func_acec4
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_ad016
; 0xad23a

Func_ad23a: ; ad23a (2b:523a)
	ld a, [wObj1FrameDuration]
	cp $28
	jr z, .asm_ad253
	cp $46
	ret c
	ld hl, w2da84
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
	call Func_ace66
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
	call Func_acec4
	call .Func_ad289
	ld a, [wCurTextLine]
	cp $80
	ret nz
	jp Func_af135

.Func_ad289
	ld a, [wPendingCharDest]
	and a
	ret z
	ld a, [wCurTextBufferPos]
	cp $01
	ret z
	ld a, [wLanguage]
	and a
	jr nz, .asm_ad2b2
	ld a, [w2da84]
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
	ld a, [w2da84]
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
	ld a, [wCurTextBufferPos]
	cp $02
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
	ld a, [wObj1FrameDuration]
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
	call Func_ace60
	jp Func_ad016
; 0xad329

	INCROM $ad329, $ad345

Func_ad345: ; ad345 (2b:5345)
	farcall Func_158000
	ret
; 0xad355

Func_ad355: ; ad355 (2b:5355)
	call Func_ad889
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl]
	jumptable
; 0xad361

	INCROM $ad361, $ad3af

Func_ad3af: ; ad3af (2b:53af)
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl] ; w2d890
	jumptable
; 0xad3b8

	INCROM $ad3b8, $ad445

Func_ad445: ; ad445 (2b:5445)
	call Func_ad4b1
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl]
	jumptable
; 0xad451

	INCROM $ad451, $ad4b1

Func_ad4b1: ; ad4b1 (2b:54b1)
	call Func_ad55b
	call Func_ad58a
	call Func_ad5b9
	call Func_ad5e8
	call Func_ad618
	ld hl, w2d8a0
	ld a, [hli]
	inc [hl]
	and a
	ret z
	ld b, h
	ld c, l
	jumptable
; 0xad4ca

	INCROM $ad4ca, $ad55b

Func_ad55b: ; ad55b (2b:555b)
	ld hl, w2d8a2
	ld a, [hli]
	and a
	ret z
	jumptable
; 0xad562

	INCROM $ad562, $ad58a

Func_ad58a: ; ad58a (2b:558a)
	ld hl, w2d8a4
	ld a, [hli]
	and a
	ret z
	jumptable
; 0xad591

	INCROM $ad591, $ad5b9

Func_ad5b9: ; ad5b9 (2b:55b9)
	ld hl, w2d8a6
	ld a, [hli]
	and a
	ret z
	jumptable
; 0xad5c0

	INCROM $ad5c0, $ad5e8

Func_ad5e8: ; ad5e8 (2b:55e8)
	ld hl, w2d8a8
	ld a, [hli]
	and a
	ret z
	jumptable
; 0xad5ef

	INCROM $ad5ef, $ad618

Func_ad618: ; ad618 (2b:5618)
	ld hl, w2d8aa
	ld a, [hli]
	and a
	ret z
	jumptable
; 0xad61f

	INCROM $ad61f, $ad6f5

Func_ad6f5: ; ad6f5 (2b:56f5)
	call Func_ad889
	call Func_ad345
	ld hl, w2d891
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl]
	jumptable
; 0xad704

	INCROM $ad704, $ad889

Func_ad889: ; ad889 (2b:5889)
	ld a, [w2d894]
	cp $01
	ret nz
	ld hl, w2d893
	inc [hl]
	ld c, l
	ld b, h
	dec l
	ld a, [hl]
	jumptable
; 0xad898

	INCROM $ad898, $ad91b

Func_ad91b: ; ad91b (2b:591b)
	ld a, [w2d8da]
	and a
	ret z
	ld hl, wSceneObj3
	ld de, Data_ad939
	call ApplyMovement
	ret
; 0xad92a

Func_ad92a: ; ad92a (2b:592a)
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
	call Func_acc9a
	call Func_acca5
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
	dw Func_aca74
	dw Func_aca9e
	dw Func_ae17c
	dw Func_acaad
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
	ld a, [w2da84]
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
	call Func_ace60
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
	ld hl, wObj1FrameDuration
	xor a
	ld [hld], a
	inc [hl]
	ret
; 0xaf13c

	INCROM $af13c, $b0000

