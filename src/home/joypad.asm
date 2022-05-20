UpdateJoypad:: ; 3d8 (0:3d8)
; read the joypad register and translate it to something more
; workable for use in-game. There are 8 buttons, so we can use
; one byte to contain all player input.

; can only get four inputs at a time
; take d-pad first
	ld a, R_DPAD
	ldh [rJOYP], a

; read a couple of times to give some time
REPT 4
	ldh a, [rJOYP]
ENDR

; the Joypad register output is in the lo nybble (inverted)
; make the hi nybble of our new container d-pad input
	cpl
	and JOY_INPUT_MASK
	swap a
	ld b, a

; buttons make 8 total inputs (A, B, Select, Start)
; we can fit this into one byte
	ld a, R_BUTTONS
	ldh [rJOYP], a

; read a couple of times to give some time
REPT 10
	ldh a, [rJOYP]
ENDR

; input is in the lo nybble
	cpl
	and JOY_INPUT_MASK
	or b
	ld c, a

	ld a, [wJoypadDown]
	; xor-ing then and-ing makes it so only
	; bits set this frame remain set
	xor c
	and c
	ld [wJoypadPressed], a
	; set the inputs which are pressed down
	ld a, c
	ld [wJoypadDown], a

; reset joypad
	ld a, $30
	ldh [rJOYP], a
	ret
; 0x418

PushOAM:: ; 418 (0:418)
	ldh [rDMA], a
	ld a, NUM_SPRITE_OAM_STRUCTS
.loop
	dec a
	jr nz, .loop
	ret
.end
; 0x420
