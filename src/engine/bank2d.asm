	INCROM $b4000, $b4004

Func_b4004: ; b4004 (2d:4004)
	ld a, [w2d065]
	ld c, a
	ld a, [w2d016]
	jumptable

	dw Func_b4014
	dw $4309
	dw $449B
	dw $4688
; 0xb4014

Func_b4014: ; b4014 (2d:4014)
	ld a, [w2d017]
	jumptable
; 0xb4018

	INCROM $b4018, $b4a37

Func_b4a37: ; b4a37 (2d:4a37)
	INCROM $b4a37, $b4a3d

Func_b4a3d: ; b4a3d (2d:4a3d)
	INCROM $b4a3d, $b4aa9

Func_b4aa9: ; b4aa9 (2d:4aa9)
	INCROM $b4aa9, $b791e

Func_b791e: ; b791e (2d:791e)
	INCROM $b791e, $b7d12
