ClearScreenStateTable:
	push_wram BANK("GFX RAM")
	farcall _ClearScreenStateTable
	pop_wram
	ret
