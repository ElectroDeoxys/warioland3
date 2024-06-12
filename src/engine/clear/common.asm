ClearScreenStateTable:
	ldh a, [rSVBK]
	push af
	ld a, BANK("GFX RAM")
	ldh [rSVBK], a
	farcall _ClearScreenStateTable
	pop af
	ldh [rSVBK], a
	ret
