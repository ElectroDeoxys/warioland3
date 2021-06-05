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

	ds $7

hPos::
hYPosHi:: ; ffa8
	ds $1
hYPosLo:: ; ffa9
	ds $1
hXPosHi:: ; ffaa
	ds $1
hXPosLo:: ; ffab
	ds $1

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
	ds $2

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
