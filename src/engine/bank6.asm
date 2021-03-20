Func_18000: ; 18000 (6:4000)
	xor a
	ld [wc0dd], a
	ld a, [wcce9]
	sramswitch
	ld hl, wccea
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [hl]
	add a
	ld e, a
	ld d, $00
	ld hl, wPermissionMap
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 0x18020

Func_18020: ; 18020 (6:4020)
	xor a ; SRAM0
	sramswitch
	xor a
	ld [wc0d8], a
	ld [wc0d9], a
	ld [wc18d], a
	ret
; 0x18032

	INCROM $18032, $19734

Func_19734: ; 19734 (6:5734)
	ld a, $01
	ld [wc0d8], a
	ld a, [wDirection]
	and a
	jr z, Func_197b6
	jr Func_19746

Func_19741: ; 19741 (6:5741)
	ld a, $01
	ld [wc0d8], a
;	fallthrough

Func_19746: ; 19746 (6:5746)
	ld a, [wca8e]
	cp $42
	jr z, .asm_19774
	ld a, [wca72]
	sub $01
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $07
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_19799

.asm_19774
	ld a, [wca72]
	sub $01
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $01
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_19799
	ldh a, [hffa9]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jp z, Func_19832
	ld a, [wca89]
	and a
	jp nz, Func_19823
	ld a, b
	ret

Func_197b1: ; 197b1 (6:57b1)
	ld a, $01
	ld [wc0d8], a
;	fallthrough

Func_197b6: ; 197b6 (6:57b6)
	ld a, [wca8e]
	cp $42
	jr z, .asm_197e6
	ld a, [wca71]
	cpl
	inc a
	sub $01
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $07
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_1980d

.asm_197e6
	ld a, [wca71]
	cpl
	inc a
	sub $01
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca70]
	cpl
	inc a
	add $01
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
.asm_1980d
	ldh a, [hffa9]
	and $f0
	ld [wc0dc], a
	call Func_19bc3
	and $0f
	jr z, Func_19832
	ld a, [wca89]
	and a
	jr nz, Func_19823
	ld a, b
	ret

Func_19823: ; 19823 (6:5823)
	ld a, $01
	ld [wc0d8], a
	call Func_19bd3
	ld a, $01
	ld [wc18d], a
	ld b, a
	ret

Func_19832: ; 19832 (6:5832)
	ld a, [wca8b]
	and a
	jp nz, .asm_198c1
	ld a, [wca6f]
	ld b, a
	ld a, [wca62]
	add b
	add $02
	and $f0
	ld b, a
	ld a, [wc0dc]
	cp b
	jp z, .asm_198c1
	ld a, $01
	ld [wc0d8], a
	call Func_19bd3
	and $0f
	ret z
	ld a, [wJumpVelTable]
	and a
	jp nz, .asm_198c0
	ld a, [wca89]
	and a
	jr nz, .asm_198c0
	ld a, [wc0db]
	and a
	jr nz, .asm_198c0
	ld a, [wca8b]
	and a
	jr nz, .asm_198c0
	ld a, [wcac9]
	and a
	jr nz, .asm_198c0
	ld a, [wca8e]
	and a
	jr nz, .asm_198c0
	ld a, [wcaa0]
	and a
	jr nz, .asm_198c0

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_198aa
	bit D_LEFT_F, a
	jr nz, .asm_19894
	ld a, [wDirection]
	and a
	jr nz, .asm_198aa
.asm_19894
	ld b, $02
	call Func_1270
	farcall Func_1e855
	jr .asm_198c1
.asm_198aa
	ld b, $02
	call Func_1259
	farcall Func_1e855
	jr .asm_198c1
.asm_198c0
	ret
.asm_198c1
	xor a
	ld [wc18d], a
	ld b, a
	ret
; 0x198c7

Func_198c7: ; 198c7 (6:58c7)
	xor a
	ld [wIsStandingOnSlope], a
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	call Func_19b51
	ret
; 0x198e0

Func_198e0: ; 198e0 (6:58e0)
	ld a, $01
	ld [wced3], a
	call Func_198c7
	and a
	ret nz
	xor a
	ld [wced3], a
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b8b
	and a
	ret nz
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19b8b
	and a
	ret nz
	ld a, [wcac9]
	and a
	ret z
	ld b, a
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, $01
	ret
; 0x19942

Func_19942: ; 19942 (6:5942)
	ld a, [wca8e]
	cp $07
	jr z, .asm_1994e
	ld a, $01
	ld [wc0d8], a
.asm_1994e
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19beb
	ret
; 0x1996e

Func_1996e: ; 1996e (6:596e)
	ld a, $01
	ld [wced2], a
	call Func_19942
	and a
	ret nz
	xor a
	ld [wced2], a
	ld a, [wca8e]
	cp $07
	jr z, .asm_19988
	ld a, $01
	ld [wc0d8], a
.asm_19988
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	and a
	ret nz
	ld a, [wca8e]
	cp $07
	jr z, .asm_199c0
	ld a, $01
	ld [wc0d8], a
.asm_199c0
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [wca6f]
	cpl
	inc a
	add $02
	ld c, a
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	call Func_19b9b
	ret
; 0x199e9

Func_199e9: ; 199e9 (6:59e9)
	call Func_19a53
	and a
	ret nz
	ld a, [wca96]
	and a
	jr z, .asm_199f9
	ld a, $01
	ld [wc0d8], a
.asm_199f9
	ld a, [wca71]
	cpl
	inc a
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	sub c
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19bfb
	and a
	ret nz
	ld a, [wcac9]
	and a
	jr z, .asm_19a22
	ld b, a
	ret
.asm_19a22
	ld a, [wca96]
	and a
	jr z, .asm_19a2d
	ld a, $01
	ld [wc0d8], a
.asm_19a2d
	ld a, [wca72]
	sub $03
	ld c, a
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	add c
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	call Func_19bfb
	and a
	ret nz
	ld a, [wcac9]
	and a
	ret z
	ld b, a
	ret
; 0x19a53

Func_19a53: ; 19a53 (6:5a53)
	xor a
	ld [wIsStandingOnSlope], a
	ld a, [wca96]
	and a
	jr z, .asm_19a62
	ld a, $01
	ld [wc0d8], a
.asm_19a62
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	call Func_19b7b
	ret
; 0x19a77

	INCROM $19a77, $19acd

Func_19acd: ; 19acd (6:5acd)
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $0c
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $1a
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

Func_19afb: ; 19afb (6:5afb)
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $18
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr Func_19b3a

Func_19b12: ; 19b12 (6:5b12)
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jr Func_19b3a

Func_19b25: ; 19b25 (6:5b25)
	ld hl, wca64
	ld de, hffab
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $04
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
;	fallthrough

Func_19b3a: ; 19b3a (6:5b3a)
	xor a
	ld [wc0db], a
	ld [wLadderInteraction], a
	ld [wc0d7], a
	ld [wcaa0], a
	ld [wc1c8], a
	ld [wc1c9], a
	call Func_19c0b
	ret
; 0x19b51

Func_19b51: ; 19b51 (6:5b51)
	ld hl, hffa8
	call Func_bdb
	ld a, $01
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b61

	INCROM $19b61, $19b7b

Func_19b7b: ; 19b7b (6:5b7b)
	ld hl, hffa8
	call Func_bdb
	ld a, $02
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b8b

Func_19b8b: ; 19b8b (6:5b8b)
	ld hl, hffa8
	call Func_bdb
	ld a, $04
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19b9b

Func_19b9b: ; 19b9b (6:5b9b)
	ld hl, hffa8
	call Func_bdb
	ld a, $08
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bab

	INCROM $19bab, $19bc3

Func_19bc3: ; 19bc3 (6:5bc3)
	ld hl, hffa8
	call Func_bdb
	ld a, $10
	ld [wc0d6], a
;	fallthrough

Func_19bce: ; 19bce (6:5bce)
	call Func_18000
	ld b, a
	ret
; 0x19bd3

Func_19bd3: ; 19bd3 (6:5bd3)
	ld hl, wccea
	dec [hl]
	ld a, [hl]
	cp $9f
	jr nz, .asm_19be6
	ld a, [wcce9]
	dec a
	ld [wcce9], a
	ld a, $bf
	ld [hl], a
.asm_19be6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	jr Func_19bce
; 0x19beb

Func_19beb: ; 19beb (6:5beb)
	ld hl, hffa8
	call Func_bdb
	ld a, $20
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19bfb

Func_19bfb: ; 19bfb (6:5bfb)
	ld hl, hffa8
	call Func_bdb
	ld a, $40
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19c0b

Func_19c0b: ; 19c0b (6:5c0b)
	ld hl, hffa8
	call Func_bdb
	ld a, $80
	ld [wc0d6], a
	call Func_18000
	ld b, a
	ret
; 0x19c1b

Func_19c1b: ; 19c1b (6:5c1b)
	ld a, [wWarioState]
	sub $30
	jumptable

	dw $5ce7                          ; ST_UNKNOWN_30
	dw $5ef1                          ; ST_UNKNOWN_31
	dw $6046                          ; ST_UNKNOWN_32
	dw $6077                          ; ST_UNKNOWN_33
	dw $60b4                          ; ST_UNKNOWN_34
	dw $617e                          ; ST_UNKNOWN_35
	dw $61c5                          ; ST_UNKNOWN_36
	dw $6296                          ; ST_UNKNOWN_37
	dw $62d6                          ; ST_UNKNOWN_38
	dw $6394                          ; ST_UNKNOWN_39
	dw UpdateState_LadderClimbing     ; ST_LADDER_CLIMBING
	dw UpdateState_LadderIdling       ; ST_LADDER_IDLING
	dw UpdateState_LadderShakeStunned ; ST_LADDER_SHAKE_STUNNED
	dw UpdateState_GettingOffLadder   ; ST_GETTING_OFF_LADDER
	dw UpdateState_LadderSliding      ; ST_LADDER_SLIDING
	dw $67d6                          ; ST_UNKNOWN_3F
	dw $689e                          ; ST_UNKNOWN_40
	dw $68ff                          ; ST_UNKNOWN_41
	dw $6980                          ; ST_UNKNOWN_42
	dw $69e9                          ; ST_UNKNOWN_43
	dw $6a5c                          ; ST_UNKNOWN_44
	dw $6ac9                          ; ST_UNKNOWN_45
	dw $6b44                          ; ST_UNKNOWN_46
	dw $68ff                          ; ST_UNKNOWN_47
	dw $6980                          ; ST_UNKNOWN_48
	dw $6bb1                          ; ST_UNKNOWN_49
	dw $6bf4                          ; ST_UNKNOWN_4A
	dw UpdateState_Sleeping           ; ST_SLEEPING
	dw UpdateState_LadderScratching   ; ST_LADDER_SCRATCHING
	dw $6dfb                          ; ST_UNKNOWN_4D
	dw $6ed0                          ; ST_UNKNOWN_4E
	dw $6f98                          ; ST_UNKNOWN_4F
	dw $700f                          ; ST_UNKNOWN_50
	dw $70a9                          ; ST_UNKNOWN_51
	dw Func_156d                      ; ST_UNKNOWN_52
	dw Func_156d                      ; ST_UNKNOWN_53
	dw Func_156d                      ; ST_UNKNOWN_54
	dw Func_156d                      ; ST_UNKNOWN_55
	dw Func_156d                      ; ST_UNKNOWN_56
	dw Func_156d                      ; ST_UNKNOWN_57
	dw Func_156d                      ; ST_UNKNOWN_58
	dw Func_156d                      ; ST_UNKNOWN_59
	dw Func_156d                      ; ST_UNKNOWN_5A
	dw Func_156d                      ; ST_UNKNOWN_5B
	dw Func_156d                      ; ST_UNKNOWN_5C
	dw Func_156d                      ; ST_UNKNOWN_5D
	dw Func_156d                      ; ST_UNKNOWN_5E
	dw Func_156d                      ; ST_UNKNOWN_5F
; 0x19c81

Func_19c81: ; 19c81 (6:5c81)
	ld a, ST_UNKNOWN_30
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wca89], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $40
	ld [wSpritePtr + 0], a
	ld a, $00
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	ld [wWarioStateCycles], a
	and a
	jr nz, .asm_19ccd
	load_frameset_ptr Frameset_14252
	jr .got_frameset
.asm_19ccd
	load_frameset_ptr Frameset_1425f
.got_frameset
	update_anim
	ret
; 0x19ce7

	INCROM $19ce7, $19e7f

Func_19e7f: ; 19e7f (6:5e7f)
	xor a
	ld [wWarioStateCounter], a
	ld a, [wDirection]
	ld [wWarioStateCycles], a
	ld a, ST_UNKNOWN_31
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wca89], a
	ld [wca9a], a
	inc a
	ld [wca8b], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wWarioStateCycles]
	cp $01
	jr z, .asm_19ed7
	load_frameset_ptr Frameset_14a38
	jr .got_frameset
.asm_19ed7
	load_frameset_ptr Frameset_14a3b
.got_frameset
	update_anim
	ret
; 0x19ef1

	INCROM $19ef1, $1a0e8

Func_1a0e8: ; 1a0e8 (6:60e8)
	xor a
	ld [wca9a], a
	ld a, ST_UNKNOWN_35
	ld [wWarioState], a
	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca96], a
	ld [wca89], a
	ld [wca9d], a
	ld [wca6d], a
	ld [wca8b], a
	ld [wc0e0], a
	ld hl, Pals_c800
	call Func_1af6
	ld a, $04
	ld [wca7b], a
	ld a, $78
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $59
	ld [wSpritePtr + 0], a
	ld a, $55
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_1a164
	load_frameset_ptr Frameset_15f94
	jr .asm_1a16e
.asm_1a164
	load_frameset_ptr Frameset_15f97
.asm_1a16e
	update_anim
	ret
; 0x1a17e

	INCROM $1a17e, $1a3bb

SetState_LadderClimbing: ; 1a3bb (6:63bb)
	ld a, ST_LADDER_CLIMBING
	ld [wWarioState], a
	ld a, [wca64]
	and $f0
	add $08
	ld [wca64], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca96], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca99], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $55
	ld [wSpritePtr + 0], a
	ld a, $cc
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_158d6
	update_anim
	ret
; 0x1a436

UpdateState_LadderClimbing: ; 1a436 (6:6436)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1a463
	ld a, $20
	ld [wceed], a
	load_sound SFX_38
.asm_1a463
	update_anim

	ld a, [wc1a8]
	and a
	jr z, .asm_1a49a
	ld hl, wca61
	ld de, hffa8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld b, $04
	farcall Func_c9f3
.asm_1a49a
	call Func_1b3a0
	ret
; 0x1a49e

SetState_LadderIdling: ; 1a49e (6:649e)
	ld a, ST_LADDER_IDLING
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca96], a
	ld [wca99], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $55
	ld [wSpritePtr], a
	ld a, $cc
	ld [$ca80], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a511
	load_frameset_ptr Frameset_15900
.asm_1a501
	update_anim
	ret

.asm_1a511
	load_frameset_ptr Frameset_158fd
	jr .asm_1a501
; 0x1a51d

UpdateState_LadderIdling: ; 1a51d (6:651d)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a549
	farcall Func_1c2ae
	ret

.asm_1a549
	update_anim
	call Func_1b480
	ret
; 0x1a55c

UpdateState_LadderShakeStunned: ; 1a55c (6:655c)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a588
	farcall Func_1c2ae
	ret
.asm_1a588
	update_anim

	ld b, $02
	call Func_1287
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1a5b3
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1a5b3
	jr c, .asm_1a5b3
	call Func_11ae
.asm_1a5b3
	farcall Func_199e9
	ld a, b
	and a
	jr z, .asm_1a5e1
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	farcall SetState_Idling
	ret

.asm_1a5e1
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [hl]
	cp $40
	ret c
	ld [hl], $00
	jp SetState_LadderIdling
; 0x1a5ee

SetState_GettingOffLadder: ; 1a5ee (6:65ee)
	ld a, ST_GETTING_OFF_LADDER
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	inc a
	ld [wca99], a
	ld [wca8a], a

	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1a611
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	ret
.asm_1a611
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	ret
; 0x1a617

UpdateState_GettingOffLadder: ; 1a617 (6:6617)
	ld a, [wceed]
	sub $01
	ld [wceed], a
	jr nc, .asm_1a62e
	ld a, $20
	ld [wceed], a
	load_sound SFX_38

.asm_1a62e
	ld a, [wDirection]
	and a
	jr nz, .asm_1a63b
	ld b, $01
	call Func_1270
	jr .asm_1a640
.asm_1a63b
	ld b, $01
	call Func_1259

.asm_1a640
	farcall Func_19b25
	ld a, [wLadderInteraction]
	and a
	ret nz
	xor a
	ld [wca99], a
	ld [wca8a], a
	farcall Func_1c2ae
	ret
; 0x1a66b

SetState_LadderSliding: ; 1a66b (6:666b)
	ld a, ST_LADDER_SLIDING
	ld [wWarioState], a
	load_sound SFX_0C
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca99], a
	inc a
	ld [wJumpVelTable], a
	ld a, [wPowerUpLevel]
	cp POWER_UP_LEAD_OVERALLS
	jr c, .asm_1a695
	ld a, $01
	ld [wca96], a
.asm_1a695

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_15945
	update_anim
	ret
; 0x1a6b6

UpdateState_LadderSliding: ; 1a6b6 (6:66b6)
	farcall Func_19b25
	ld a, [wc0d7]
	and a
	jp nz, Func_11f6
	ld a, [wLadderInteraction]
	and a
	jr nz, .asm_1a6e6
	xor a
	ld [wca96], a
	farcall Func_1c2ae
	ret

.asm_1a6e6
	update_anim

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jp nz, SetState_LadderClimbing

	ld b, $02
	call Func_1287
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1a719
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1a719
	jr c, .asm_1a719
	call Func_11ae
.asm_1a719
	farcall Func_199e9

	ld a, b
	and a
	ret z
	ld hl, hffa8
	ld de, wca61
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wca96]
	and a
	jr z, .asm_1a753
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_JUMP_SLAM_OVERALLS
	jr c, .asm_1a763
	farcall Func_1c5fd
	ret

.asm_1a753
	farcall SetState_Idling
	ret

.asm_1a763
	farcall Func_1c66b
	ret
; 0x1a773

Func_1a773: ; 1a773 (6:6773)
	ld a, ST_UNKNOWN_3F
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wca89], a
	ld a, $04
	ld [wca7b], a
	ld a, $48
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $42
	ld [wSpritePtr + 0], a
	ld a, $6c
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1a7bc
	load_frameset_ptr Frameset_14a20
	jr .asm_1a7c6
.asm_1a7bc
	load_frameset_ptr Frameset_14a23
.asm_1a7c6
	update_anim
	ret
; 0x1a7d6

	INCROM $1a7d6, $1ac10

SetState_Sleeping: ; 1ac10 (6:6c10)
	ld a, ST_SLEEPING
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $40
	ld [wSpritePtr + 0], a
	ld a, $00
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ac59
	load_frameset_ptr Frameset_1421c
	jr .got_frameset
.asm_1ac59
	load_frameset_ptr Frameset_14225
.got_frameset
	update_anim
	ret
; 0x1ac73

UpdateState_Sleeping: ; 1ac73 (6:6c73)
	update_anim

	ld a, [wWarioStateCounter]
	dec a
	jr z, .asm_1acd0
	dec a
	jp z, .asm_1ad0c
	ld a, [wc1a8]
	and a
	ret z
	load_sound SFX_36
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld hl, wWarioStateCounter
	inc [hl]

	ld a, [wDirection]
	and a
	jr nz, .asm_1acb6
	load_frameset_ptr Frameset_1422e
	jr .asm_1acc0
.asm_1acb6
	load_frameset_ptr Frameset_14237
.asm_1acc0
	update_anim
	ret

.asm_1acd0
	ld a, [wc1a8]
	and a
	jr z, .asm_1acde
	load_sound SFX_36
.asm_1acde
	ld a, [wJoypadDown]
	and a
	ret z
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld hl, wWarioStateCounter
	inc [hl]
	ld a, [wDirection]
	and a
	jr nz, .asm_1ad00
	load_frameset_ptr Frameset_14240
	jr .asm_1acc0
.asm_1ad00
	load_frameset_ptr Frameset_14249
	jr .asm_1acc0

.asm_1ad0c
	ld a, [wc1a8]
	and a
	ret z
	farcall SetState_Idling
	ret
; 0x1ad21

SetState_LadderScratching: ; 1ad21 (6:6d21)
	ld a, ST_LADDER_SCRATCHING
	ld [wWarioState], a

	ld a, $ff
	ld [wca70], a
	ld a, $e5
	ld [wca6f], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	xor a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca99], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ad63
	load_frameset_ptr Frameset_15903
	jr .asm_1ad6d
.asm_1ad63
	load_frameset_ptr Frameset_15924
.asm_1ad6d
	update_anim
	ret
; 0x1ad7d

UpdateState_LadderScratching: ; 1ad7d (6:6d7d)
	update_anim
	ld a, [wJoypadDown]
	and a
	jr nz, .asm_1ad97
	ld a, [wc1a8]
	and a
	ret z
.asm_1ad97
	jp SetState_LadderIdling
; 0x1ad9a

Func_1ad9a: ; 1ad9a (6:6d9a)
	ld a, ST_UNKNOWN_4D
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld a, $03
	ld [wca9b], a

	ld a, $04
	ld [wca7b], a
	ld a, $40
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $4a
	ld [wSpritePtr + 0], a
	ld a, $82
	ld [wSpritePtr + 1], a

	ld a, [wDirection]
	and a
	jr nz, .asm_1ade1
	load_frameset_ptr Frameset_14d0b
	jr .asm_1adeb
.asm_1ade1
	load_frameset_ptr Frameset_14d10
.asm_1adeb
	update_anim
	ret
; 0x1adfb

	INCROM $1adfb, $1ae68

Func_1ae68: ; 1ae68 (6:6e68)
	ld a, ST_UNKNOWN_4E
	ld [wWarioState], a
	xor a
	ld [wceed], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wca96], a
	ld a, $ff
	ld [wca70], a
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ld a, $e5
	ld [wca6f], a
	ld a, $04
	ld [wca7b], a
	ld a, $68
	ld [wca7c + 0], a
	ld a, $00
	ld [wca7c + 1], a
	call Func_15b0
	ld a, $05
	ld [wSpriteBank], a
	ld a, $55
	ld [wSpritePtr + 0], a
	ld a, $cc
	ld [wSpritePtr + 1], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_frameset_ptr Frameset_158d6
	update_anim
	ret
; 0x1aed0

	INCROM $1aed0, $1b3a0

Func_1b3a0: ; 1b3a0 (6:73a0)
	ld a, [wJoypadDown]
	and B_BUTTON | D_DOWN
	cp B_BUTTON | D_DOWN
	jp z, SetState_LadderSliding

	ld a, [wJoypadDown]
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	jp SetState_LadderIdling

.d_up
	farcall Func_1996e
	ld a, [wced2]
	and a
	ret nz
	ld b, $01
	call Func_129e
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1b3e6
	call Func_114e
	ld a, [wca78]
	sub c
	jr nc, .asm_1b3e6
	jp Func_11d6

.asm_1b3e6
	ld a, [wLadderInteraction]
	and a
	ret nz
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	ret nz
.asm_1b3ff
	farcall SetState_Idling
	ret

.d_down
	ld b, $01
	call Func_1287
	ld a, [wc0ba]
	and $0f
	cp $08
	jr c, .asm_1b42b
	call Func_114e
	ld a, [wca78]
	sub c
	jr z, .asm_1b42b
	jr c, .asm_1b42b
	jp Func_11ae

.asm_1b42b
	farcall Func_19b12
	ld a, [wLadderInteraction]
	and a
	jr z, .asm_1b45d
	farcall Func_198e0
	ld a, b
	and a
	ret z
	ld a, [wca64]
	and $f0
	add $08
	ld [wca64], a
	ret

.asm_1b45d
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_1b3ff
	farcall Func_1c2ae
	ret
; 0x1b480

Func_1b480: ; 1b480 (6:7480)
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr z, .asm_1b48e
	ld a, [wJoypadDown]
	and D_RIGHT | D_LEFT
	jr nz, .asm_1b4a7

.asm_1b48e
	ld a, [wJoypadDown]
	and D_UP | D_DOWN
	jp nz, SetState_LadderClimbing
	ld hl, wWarioStateCounter
	ld a, [hl]
	add 1
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	cp $02
	ret c
	jp SetState_LadderScratching

.asm_1b4a7
	ld a, [wJoypadDown]
	bit D_RIGHT_F, a
	jr nz, .asm_1b4d3
	ld a, $f0
	ld [wca71], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_1b4eb
.asm_1b4c6
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	jp SetState_GettingOffLadder

.asm_1b4d3
	ld a, $10
	ld [wca72], a
	farcall Func_19741
	ld a, b
	and a
	jr z, .asm_1b4c6
.asm_1b4eb
	ld a, $f7
	ld [wca71], a
	ld a, $09
	ld [wca72], a
	ret
; 0x1b4f6
