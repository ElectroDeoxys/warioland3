SECTION "SRAM0", SRAM

s0a000:: ; a000
	ds $4

sSaveCounter:: ; a004
	ds $4

sGeneralData:: ; a008
	ds $57

sLevelData:: ; a05f
	ds $6f

	ds $2b2

sCheckVals:: ; a380
	ds $4

sGameData:: ; a384
	ds $6c

	ds $10

s0a400:: ; a400
	ds $4

s0a404:: ; a404
	ds $4

	ds $388

s0a790:: ; a790
	ds $1

sGameDataChecksum::       dw ; a791
sBackupGameDataChecksum:: dw ; a793

sWRAMChecksum::        dw ; a795
sBackup1WRAMChecksum:: dw ; a797
sBackup2WRAMChecksum:: dw ; a799
sBackup3WRAMChecksum:: dw ; a79b

s0a79d:: ; a79d
	ds $2

s0a79f:: ; a79f
	ds $2

	ds $3f

s0a7e0:: ; a7e0
	ds $1

sGameDataChecksumEcho1::       dw ; a7e1
sBackupGameDataChecksumEcho1:: dw ; a7e3

sWRAMChecksumEcho1::        dw ; a7e5
sBackup1WRAMChecksumEcho1:: dw ; a7e7
sBackup2WRAMChecksumEcho1:: dw ; a7e9
sBackup3WRAMChecksumEcho1:: dw ; a7eb

s0a7ed:: ; a7ed
	ds $2

s0a7ef:: ; a7ef
	ds $2

	ds $f

s0a800:: ; a800
	ds $4

s0a804:: ; a804
	ds $4

	ds $378

sBackupCheckVals:: ; ab80
	ds $4

sBackupGameData:: ; ab84
	ds $6c

	ds $10

s0ac00:: ; ac00
	ds $4

s0ac04:: ; ac04
	ds $4

	ds $398

s0afa0:: ; afa0
	ds $1

sGameDataChecksumEcho2::       dw ; afa1
sBackupGameDataChecksumEcho2:: dw ; afa3

sWRAMChecksumEcho2::        dw ; afa5
sBackup1WRAMChecksumEcho2:: dw ; afa7
sBackup2WRAMChecksumEcho2:: dw ; afa9
sBackup3WRAMChecksumEcho2:: dw ; afab

s0afad:: ; afad
	ds $2

s0afaf:: ; afaf
	ds $2

	ds $2f

s0afe0:: ; afe0
	ds $4

s0afe4:: ; afe4
	ds $4

s0afe8:: ; afe8
	ds $4

s0afec:: ; afec
	ds $4

s0aff0:: ; aff0
	ds $4

s0aff4:: ; aff4
	ds $4

s0aff8:: ; aff8
	ds $1

SECTION "SRAM1", SRAM

; map is seperated into LEVEL_WIDTH wide rows of blocks
; followed by (LEVEL_WIDTH / 2) wide rows of objects
; these are interleaved with each other for each row
sLevelBlockObjectMap:: ; a000
	ds $2000

SECTION "SRAM2", SRAM

s2a000:: ; a000
	ds $1000

s2b000:: ; b000
	ds $1000

SECTION "SRAM3", SRAM

s3a000:: ; a000
	ds $2000