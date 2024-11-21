PerfectStateTable:
	push_wram BANK("GFX RAM")
	farcall _PerfectStateTable
	pop_wram
	ret
