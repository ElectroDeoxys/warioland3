SECTION "HRAM", HRAM

hCallFunc::        ds $5
hCallFuncBank::    db
	ds $7
hCallFuncPointer:: dw

	ds $11

UNION

hThrownObjInteractionType::
hIsInWaterOrSandBackup::
hffa0::
	db

hCollidedObjState_Light:: db
hThrownObjState_Light::   db
hCollidedObjState_Heavy:: db
hThrownObjState_Heavy::   db

NEXTU

hCurObjBackup::
	ds $6

NEXTU

hPickedUpObjPos::
	ds $4

ENDU

	ds $2

hPos::
hYPosHi:: db
hYPosLo:: db
hXPosHi:: db
hXPosLo:: db

hffac::
	db

hYPosHiBackup:: db
hYPosLoBackup:: db
hXPosHiBackup:: db
hXPosLoBackup:: db

hMusicID::       dw
hMusicIDBackup:: dw
hSFXID::         dw

	ds $31

hTransferVirtualOAM::
	ds $e

	ds $6

; which Power Up to show in the next
; Action Help demo in the Title Screen
hDemoPowerUp::
	db

hUnused_fffd::
	db

; whether system is CGB or not
hCGB::
	db
