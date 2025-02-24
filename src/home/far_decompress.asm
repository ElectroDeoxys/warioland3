FarCopyHLToDE_BC2::
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	call CopyHLToDE_BC
	pop af
	bankswitch
	ret

FarDecompress::
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	call Decompress
	pop af
	bankswitch
	ret
