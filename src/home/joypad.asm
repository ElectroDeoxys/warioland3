UpdateJoypad::
; read the joypad register and translate it to something more
; workable for use in-game. There are 8 buttons, so we can use
; one byte to contain all player input.

; can only get four inputs at a time
; take d-pad first
	ld a, P1F_GET_DPAD
	ldh [rP1], a

; read a couple of times to give some time
REPT 4
	ldh a, [rP1]
ENDR

; the Joypad register output is in the lo nybble (inverted)
; make the hi nybble of our new container d-pad input
	cpl
	and %00001111
	swap a
	ld b, a

; buttons make 8 total inputs (A, B, Select, Start)
; we can fit this into one byte
	ld a, P1F_GET_BTN
	ldh [rP1], a

; read a couple of times to give some time
REPT 10
	ldh a, [rP1]
ENDR

; input is in the lo nybble
	cpl
	and %00001111
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
	ld a, P1F_GET_NONE
	ldh [rP1], a
	ret

PushOAM::
	ldh [rDMA], a ; start DMA transfer (starts right after instruction)
	ld a, 160 / (1 + 3) ; delay for a total of 160 cycles
.loop
	dec a        ; 1 cycle
	jr nz, .loop ; 3 cycles
	ret
.end
