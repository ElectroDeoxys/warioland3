CreditsStateTable:
	push_wram BANK("GFX RAM")
	farcall _CreditsStateTable
	pop_wram
	ret
