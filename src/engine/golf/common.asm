GolfStateTable:
	push_wram BANK("Golf RAM")
	farcall _GolfStateTable
	pop_wram
	ret
