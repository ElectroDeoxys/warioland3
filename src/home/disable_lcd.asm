DisableLCD:: ; 8e6 (0:8e6)
	ldh a, [rLCDC]
	bit LCDC_ENABLE_F, a
	ret z ; already disabled

	ldh a, [rIE]
	ld [wTempIE], a
; disable VBlank
	res INT_VBLANK, a
	ldh [rIE], a

; wait until VBlank would normally happen
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait

; turn LCD off
	ldh a, [rLCDC]
	and LCDC_OFF
	ldh [rLCDC], a
	xor a
	ldh [rIF], a
	ld a, [wTempIE]
	ldh [rIE], a
	ret
; 0x909
