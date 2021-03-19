Func_28000: ; 28000 (a:4000)
	ld a, [wWarioState]
	sub $60
	jumptable

	dw $40a6 ; ST_UNKNOWN_60
	dw $41c1 ; ST_UNKNOWN_61
	dw $427a ; ST_UNKNOWN_62
	dw $439f ; ST_UNKNOWN_63
	dw $441e ; ST_UNKNOWN_64
	dw $4511 ; ST_UNKNOWN_65
	dw $4599 ; ST_UNKNOWN_66
	dw $4601 ; ST_UNKNOWN_67
	dw $4672 ; ST_UNKNOWN_68
	dw $471f ; ST_UNKNOWN_69
	dw $47a2 ; ST_UNKNOWN_6A
	dw $48e5 ; ST_UNKNOWN_6B
	dw $494e ; ST_UNKNOWN_6C
	dw $4a39 ; ST_UNKNOWN_6D
	dw $4a5a ; ST_UNKNOWN_6E
	dw $4a8a ; ST_UNKNOWN_6F
	dw $4aad ; ST_UNKNOWN_70
	dw $4b36 ; ST_UNKNOWN_71
	dw $4c25 ; ST_UNKNOWN_72
	dw $4ceb ; ST_UNKNOWN_73
	dw $4d92 ; ST_UNKNOWN_74
	dw $4e1a ; ST_UNKNOWN_75
	dw $4e70 ; ST_UNKNOWN_76
	dw $4e87 ; ST_UNKNOWN_77
	dw $4f39 ; ST_UNKNOWN_78
	dw $4fc0 ; ST_UNKNOWN_79
	dw $506d ; ST_UNKNOWN_7A
	dw $5123 ; ST_UNKNOWN_7B
	dw $5243 ; ST_UNKNOWN_7C
	dw $52e5 ; ST_UNKNOWN_7D
	dw $53b9 ; ST_UNKNOWN_7E
	dw $53d0 ; ST_UNKNOWN_7F
	dw $54bf ; ST_SHOCKED
	dw $5672 ; ST_UNKNOWN_81
	dw $572e ; ST_UNKNOWN_82
	dw $5816 ; ST_UNKNOWN_83
	dw $5871 ; ST_UNKNOWN_84
	dw $58f3 ; ST_UNKNOWN_85
	dw $5975 ; ST_UNKNOWN_86
	dw $5a74 ; ST_UNKNOWN_87
	dw $5b06 ; ST_UNKNOWN_88
	dw $5ba2 ; ST_UNKNOWN_89
	dw $5c29 ; ST_UNKNOWN_8A
	dw $5d6f ; ST_UNKNOWN_8B
	dw $5dd3 ; ST_UNKNOWN_8C
	dw $5e7e ; ST_UNKNOWN_8D
	dw $5ef3 ; ST_UNKNOWN_8E
	dw $5f42 ; ST_UNKNOWN_8F
	dw $5ffa ; ST_UNKNOWN_90
	dw $6087 ; ST_UNKNOWN_91
	dw $60f9 ; ST_UNKNOWN_92
	dw $61f5 ; ST_UNKNOWN_93
	dw $6267 ; ST_UNKNOWN_94
	dw $62d3 ; ST_UNKNOWN_95
	dw $6362 ; ST_UNKNOWN_96
	dw $6489 ; ST_UNKNOWN_97
	dw $6544 ; ST_UNKNOWN_98
	dw $65d8 ; ST_UNKNOWN_99
	dw $6657 ; ST_UNKNOWN_9A
	dw $66c0 ; ST_UNKNOWN_9B
	dw $677b ; ST_UNKNOWN_9C
	dw $6804 ; ST_UNKNOWN_9D
	dw $6890 ; ST_UNKNOWN_9E
	dw $68d2 ; ST_UNKNOWN_9F
	dw $69b2 ; ST_UNKNOWN_A0
	dw $6a08 ; ST_UNKNOWN_A1
	dw $6b18 ; ST_UNKNOWN_A2
	dw $6b42 ; ST_UNKNOWN_A3
	dw $6c04 ; ST_UNKNOWN_A4
	dw $6d06 ; ST_UNKNOWN_A5
	dw Func_156d ; ST_UNKNOWN_A6
	dw Func_156d ; ST_UNKNOWN_A7
	dw Func_156d ; ST_UNKNOWN_A8
	dw Func_156d ; ST_UNKNOWN_A9
	dw Func_156d ; ST_UNKNOWN_AA
	dw Func_156d ; ST_UNKNOWN_AB
	dw Func_156d ; ST_UNKNOWN_AC
	dw Func_156d ; ST_UNKNOWN_AD
	dw Func_156d ; ST_UNKNOWN_AE
	dw Func_156d ; ST_UNKNOWN_AF
; 0x280a6

	INCROM $280a6, $2b1a6

Func_2b1a6: ; 2b1a6 (a:71a6)
	ld a, [wDirection]
	and a
	jr nz, .asm_2b1bc
	farcall Func_1f104
	ret

.asm_2b1bc
	farcall Func_1f0ed
	ret
; 0x2b1cc

	INCROM $2b1cc, $2c000
