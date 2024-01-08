GameOverStateTable:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Audio RAM")
	ldh [rSVBK], a
	farcall _GameOverStateTable
	pop af
	ldh [rSVBK], a
	ret
