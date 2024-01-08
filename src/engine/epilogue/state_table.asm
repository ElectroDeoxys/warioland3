EpilogueStateTable:
	ld a, [wSubState]
	jumptable

	dw .FadeToWhite
	dw .Func_473c

.FadeToWhite:
	ld a, [wGlobalCounter]
	and %11
	ret nz
	call FastFadeToWhite
	ret

.Func_473c:
	farcall Func_4628
	ret
