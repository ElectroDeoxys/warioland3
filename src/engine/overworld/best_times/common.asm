Func_80de0:
	xor a
	ld a, [wGameModeFlags]
	bit MODE_TIME_ATTACK_F, a
	ret z
	ld a, [wJoypadPressed]
	bit B_PAD_START, a
	ret z
	ld a, SST_OVERWORLD_BEST_TIMES
	ld [wSubState], a
	ret

InitBestTimeList:
	farcall _InitBestTimeList
	ret

BestTimeList:
	farcall _BestTimeList
	ret
