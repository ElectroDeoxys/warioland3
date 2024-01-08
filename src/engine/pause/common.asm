PauseMenuStateTable:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall _PauseMenuStateTable
	pop af
	ldh [rSVBK], a
	ret
