PauseMenuStateTable:
	push_wram BANK("GFX RAM")
	farcall _PauseMenuStateTable
	pop_wram
	ret
