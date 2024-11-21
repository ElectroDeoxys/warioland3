; adds a Repeat Delay and Rate to any DPad key
ProcessDPadRepeat::
	push_wram BANK("GFX RAM")

	ld hl, wDPadRepeatCounter
	ld a, [hl]
	and a
	jr z, .reset_counter
	ld a, [wJoypadPressed]
	and D_PAD
	jr nz, .reset_counter
	ld a, [wJoypadDown]
	and D_PAD
	jr z, .reset_counter
	dec [hl]
	jr nz, .done

; add down Joypad buttons
; to the pressed buttons
	ld b, a
	ld a, [wJoypadPressed]
	or b
	ld [wJoypadPressed], a

	ld a, $08
	jr .set_counter
.reset_counter
	ld a, $10
.set_counter
	ld [hl], a
.done
	pop_wram
	ret
