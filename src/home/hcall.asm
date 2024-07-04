InitHRAMCallFunc::
	ld hl, .Func
	ld de, hCallFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
LOAD "HCall", HRAM
hCallFunc::
	ld a, [wROMBank]
	push af

	db $3e ; ld a, n8
hCallFuncBank::
	db $0 ; placeholder bank

	bankswitch

	db $cd ; call a16
hCallFuncPointer::
	dw $4000 ; placeholder function pointer

	pop af
	bankswitch
	ret
ENDL
.end
