sprite_oam_struct: MACRO
\1YCoord::     db
\1XCoord::     db
\1TileID::     db
\1Attributes:: db
; bit 7: priority
; bit 6: y flip
; bit 5: x flip
; bit 4: pal # (non-cgb)
; bit 3: vram bank (cgb only)
; bit 2-0: pal # (cgb only)
ENDM

obj_struct: MACRO
\1YCoord::        db
\1XCoord::        db
\1Frame::         db
\1Unknown1::      db
\1Unknown2::      db
\1Unknown3::      db
\1FramesPointer:: dw
\1End::
ENDM

unk1_struct: MACRO
\1Obj::     obj_struct \1Obj
\1Unknown:: db
ENDM

unk2_struct: MACRO
\1Unk00:: db
\1Unk01:: db
\1Unk02:: db
\1Unk03:: db
\1Unk04:: db
\1Unk05:: db
\1Unk06:: db
\1Unk07:: db
\1Unk08:: db
\1Unk09:: db
\1Unk0a:: db
\1Unk0b:: db
\1Unk0c:: db
\1Unk0d:: db
\1Unk0e:: db
\1Unk0f:: db
\1Unk10:: db
\1Unk11:: db
\1Unk12:: db
\1Unk13:: db
\1Unk14:: db
\1Unk15:: db
\1Unk16:: db
\1Unk17:: db
\1Unk18:: db
\1Unk19:: db
\1Unk1a:: db
\1Unk1b:: db
\1Unk1c:: db
\1Unk1d:: db
\1Unk1e:: db
\1Unk1f:: db
ENDM

channel_struct: MACRO
\1Flags1:: db
\1Unk01:: db
\1Unk02:: dw
\1SoundBank:: db
\1SoundID::   dw
\1Unk07:: db
\1Unk08:: db
\1Unk09:: db
\1Unk0a:: db
\1Unk0b:: db
\1DutyCycle:: db
\1Unk0d:: db
\1Sweep:: db
\1Unk0f:: db
\1Unk10:: db
\1Unk11:: db
\1Unk12:: db
\1Unk13:: db
\1Unk14:: db
\1Unk15:: db
\1Unk16:: db
\1Unk17:: db
\1Unk18:: db
\1Unk19:: db
\1Unk1a:: db
\1Unk1b:: db
\1Unk1c:: db
\1Unk1d:: db
\1Unk1e:: db
\1Unk1f:: db
\1Unk20:: db
\1Unk21:: db
\1Unk22:: db
\1Unk23:: db
\1Unk24:: db
\1Unk25:: db
\1Unk26:: db
\1Unk27:: db
\1Unk28:: db
\1Unk29:: db
\1Unk2a:: db
\1Unk2b:: db
\1Unk2c:: db
\1Unk2d:: db
\1Unk2e:: db
\1Unk2f:: db
\1Unk30:: db
\1Unk31:: db
\1Unk32:: db
\1Unk33:: db
\1Unk34:: db
\1Unk35:: db
\1Unk36:: db
\1Unk37:: db
\1Unk38:: db
\1Unk39:: db
\1Unk3a:: db
\1Unk3b:: db
ENDM

audio_struct: MACRO
\1Unk00::          db
\1Unk01::          db
\1Unk02::          db
\1Pitch::          db ; 0:rest 1-c:note
\1Unk04::          dw ; pointer to a channel_struct
\1Unk05::          db
\1NoteDuration::   db ; frames remaining for the current note
\1DutyCycle::      db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1Unk08::          db
\1Sweep::          db
\1Unk0a::          db
\1Unk0b::          db
\1Unk0c::          db
\1Unk0d::          db
\1Unk0e::          db
\1Unk0f::          db
\1VolumeEnvelope:: db
\1Frequency::      dw
\1Unk13::          db
\1Unk14::          db
\1Unk15::          db
\1Unk16::          db
ENDM
