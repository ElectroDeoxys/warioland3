DisableLCD::
	ldh a, [rLCDC]
	bit LCDCB_ON, a
	ret z ; already disabled

	ldh a, [rIE]
	ld [wTempIE], a
; disable VBlank interrupt
	res IEB_VBLANK, a
	ldh [rIE], a

; wait until VBlank would normally happen
.wait
	ldh a, [rLY]
	cp $91
	jr nz, .wait

; turn LCD off
	ldh a, [rLCDC]
	and $ff ^ LCDCF_ON
	ldh [rLCDC], a
	xor a
	ldh [rIF], a
	ld a, [wTempIE]
	ldh [rIE], a
	ret
