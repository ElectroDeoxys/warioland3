GameOverStateTable:
	push_wram BANK("GFX RAM")
	farcall _GameOverStateTable
	pop_wram
	ret
