GolfBuildingStateTable:
	push_wram BANK("Golf RAM")
	farcall _GolfBuildingStateTable
	pop_wram
	ret
