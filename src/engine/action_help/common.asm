ActionHelpStateTable:
	push_wram BANK("GFX RAM")
	farcall _ActionHelpStateTable
	pop_wram
	ret
