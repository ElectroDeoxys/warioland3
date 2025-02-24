EnableDoubleSpeed::
	ldh a, [rSPD]
	bit 7, a
	ret nz ; already in double speed

	ld a, KEY1F_PREPARE
	ldh [rSPD], a
	ldh a, [rIE]
	push af
	xor a ; disable all interrupts
	ldh [rIE], a
	ld a, P1F_GET_NONE
	ldh [rP1], a
	stop

.wait
	ldh a, [rSPD]
	bit 7, a
	jr z, .wait

	xor a
	ldh [rP1], a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ret
