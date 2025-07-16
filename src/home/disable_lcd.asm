DisableLCD::
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	ret z ; already disabled

	ldh a, [rIE]
	ld [wTempIE], a
; disable VBlank interrupt
	res B_IE_VBLANK, a
	ldh [rIE], a

; wait until VBlank would normally happen
.wait
	ldh a, [rLY]
	cp $91
	jr nz, .wait

; turn LCD off
	ldh a, [rLCDC]
	and $ff ^ LCDC_ON
	ldh [rLCDC], a
	xor a
	ldh [rIF], a
	ld a, [wTempIE]
	ldh [rIE], a
	ret
