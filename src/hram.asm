SECTION "HRAM", HRAM

hCallFunc:: ; ff80
	ds $5

hCallFuncBank:: ; ff85
	ds $1

	ds $7

hCallFuncPointer:: ; ff8d
	ds $2

	ds $11

hffa0:: ; ffa0
	ds $1

hffa1:: ; ffa1
	ds $1

hffa2:: ; ffa2
	ds $1

hffa3:: ; ffa3
	ds $1

hffa4:: ; ffa4
	ds $1

	ds $3

hPos::
hYPosHi:: ds $1 ; ffa8
hYPosLo:: ds $1 ; ffa9
hXPosHi:: ds $1 ; ffaa
hXPosLo:: ds $1 ; ffab

hffac:: ; ffac
	ds $1

hffad:: ; ffad
	ds $1

hffae:: ; ffae
	ds $1

hffaf:: ; ffaf
	ds $1

hffb0:: ; ffb0
	ds $1

hMusicID:: ; ffb1
	ds $2

hffb3:: ; ffb3
	ds $1

hffb4:: ; ffb4
	ds $1

hSFXID:: ; ffb5
	ds $2

	ds $31

hTransferVirtualOAM:: ; ffe8
	ds $e

	ds $6

hfffc:: ; fffc
	ds $1

hfffd:: ; fffd
	ds $1

hCGB:: ; fffe
	ds $1
