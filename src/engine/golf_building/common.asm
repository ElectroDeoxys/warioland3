GolfBuildingStateTable:
	ldh a, [rSVBK]
	push af
	ld a, BANK("Golf RAM")
	ldh [rSVBK], a
	farcall _GolfBuildingStateTable
	pop af
	ldh [rSVBK], a
	ret
