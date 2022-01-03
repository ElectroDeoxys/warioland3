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

intro_obj_struct: MACRO
	sprite_oam_struct \1
\1FramesetOffset::  db
\1Duration::        db
\1FramesetPtr::     dw
\1End::
ENDM

scene_obj_struct: MACRO
	sprite_oam_struct \1
\1Duration:: db
\1FramesetOffset:: db
\1State:: db
\1Unk7:: db
\1End::
ENDM

wario_plane: MACRO
\1Obj::   intro_obj_struct \1
\1State:: db
ENDM

obj_struct: MACRO
\1Flags::           db
\1Unk01::           db
\1Unk02::           db
\1YPos::            dw
\1XPos::            dw
\1Unk07::           db
\1InteractionType:: db
\1Unk09::           db
\1Unk0a::           db
\1Unk0b::           db
\1Unk0c::           db
\1ScreenYPos::      db
\1ScreenXPos::      db
\1Frame::           db
\1Unk10::           dw
\1FramesetPtr::     dw
\1FrameDuration::   db
\1FramesetOffset::  db
\1Unk16::           db
\1Unk17::           db
\1Unk18::           db
\1Unk19::           db
\1Unk1a::           db
\1Action::          db
\1Unk1c::           db
\1Unk1d::           db
\1UpdateFunction::  dw
ENDM

pal_config_struct: MACRO
\1Register:: db
\1Index::    db
\1Number::   db
\1SourceHi:: db
\1SourceLo:: db
ENDM

hdma_config_struct: MACRO
\1SourceHi:: db
\1SourceLo:: db
\1DestHi::   db
\1DestLo::   db
\1Mode::     db
ENDM

unk3_struct: MACRO
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
ENDM

channel_struct: MACRO
\1Flags::            db
\1Duration::         db
\1Unk02::            dw
\1SoundBank::        db
\1Unk05::            db
\1SoundID::          dw
\1Unk08::            db
\1Unk09::            db
\1Unk0a::            db
\1Unk0b::            db
\1Timbre::           db
\1Length::           db
\1Sweep::            db
\1FadeInSpeed::      db
\1FadeOutSpeed::     db
\1ActiveCommand::    db
\1Unk12::            db
\1Unk13::            db
\1Unk14::            db
\1Unk15::            db
\1Unk16::            db
\1Unk17::            db
\1SO1::              db
\1SO2::              db
\1Unk1a::            db
\1Unk1b::            db
\1Unk1c::            db
\1Unk1d::            db
\1Unk1e::            db
\1VibratoSpeed::     db
\1VibratoValue::     db
\1VibratoAmplitude:: db
\1Unk22::            db
\1VibratoDisabled::  db
\1Unk24::            db
\1Unk25::            db
\1Unk26::            db
\1Unk27::            db
\1Unk28::            db
\1Unk29::            db
\1VibratoDelay::     db
\1VibratoCounter::   db
\1Unk2c::            db
\1Unk2d::            db
\1SOFlags::          db
; bits 7 and 6 determine sound ouput
; %01 -> only SO1
; %10 -> only SO2
; otherwise, both SO used
\1Unk2f::            db
\1Unk30::            db
\1Unk31::            db
\1Unk32::            db
\1Unk33::            db
\1Unk34::            db
\1Unk35::            db
\1Unk36::            db
\1Unk37::            db
\1Unk38::            db
\1Unk39::            db
\1Unk3a::            db
\1Unk3b::            db
ENDM

track_struct: MACRO
\1Unk00::          db
\1Unk01::          db
\1Unk02::          db
\1Unk03::          db
\1Channel::        dw ; pointer to a channel_struct
\1Unk06::          db
\1Unk07::          db
\1Timbre::         db
; in case of sound1 and sound2, duty cycle
; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
; in case of sound3, a WAVEFORM_* constant
\1Length::         db
\1Sweep::          db
\1FadeInSpeed::    db
\1FadeOutSpeed::   db
\1Unk0d::          db
\1Unk0e::          db
\1Unk0f::          db
\1Unk10::          db
\1VolumeEnvelope:: db
\1Frequency::      dw
\1Unk14::          db
\1Unk15::          db
\1Unk16::          db
\1Unk17::          db
ENDM
