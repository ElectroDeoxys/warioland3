EnableDoubleSpeed::
	ldh a, [rSPD]
	bit 7, a
	ret nz ; already in double speed

	ld a, SPD_PREPARE
	ldh [rSPD], a
	ldh a, [rIE]
	push af
	xor a ; disable all interrupts
	ldh [rIE], a
	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	stop

.wait
	ldh a, [rSPD]
	bit 7, a
	jr z, .wait

	xor a
	ldh [rJOYP], a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ret
