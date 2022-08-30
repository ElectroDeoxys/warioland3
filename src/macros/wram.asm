MACRO sprite_oam_struct
\1YCoord::     db
\1XCoord::     db
\1Frame::      db
\1Attributes:: db
; bit 7: priority
; bit 6: y flip
; bit 5: x flip
; bit 4: pal # (non-cgb)
; bit 3: vram bank (cgb only)
; bit 2-0: pal # (cgb only)
ENDM

MACRO menu_obj_struct
	sprite_oam_struct \1
\1FramesetOffset::  db
\1Duration::        db
\1FramesetPtr::     dw
\1End::
ENDM

MACRO menu_obj_ext_struct
	menu_obj_struct \1
\1Var::            db
\1OAMPtr::         dw
\1AnimationEnded:: db
\1OAMBank::        db
ENDM

MACRO scene_obj_struct
	sprite_oam_struct \1
\1Duration::       db
\1FramesetOffset:: db
\1State::          db
\1Unk7::           db
\1End::
ENDM

MACRO golf_obj_struct
\1State::          db
\1Duration::       db
\1FramesetOffset:: db
\1CurrentFrame::   db
\1Sprite:: sprite_oam_struct \1
ENDM

MACRO obj_struct
\1Flags::           db
\1Unk01::           db
\1Unk02::           db
\1YPos::            dw
\1XPos::            dw
\1Unk07::           db ; high nybble = OAM bank
\1InteractionType:: db
\1CollBoxTop::      db
\1CollBoxBottom::   db
\1CollBoxLeft::     db
\1CollBoxRight::    db
\1ScreenYPos::      db
\1ScreenXPos::      db
\1Frame::           db
\1OAMPtr::          dw
\1FramesetPtr::     dw
\1FrameDuration::   db
\1FramesetOffset::  db
\1StateDuration::   db
\1Unk17::           db
\1Unk18::           db
\1MovementIndex::   db
\1Unk1a::           db
; bit 7: set if facing right, left otherwise
\1State::           db
\1Action::          db
\1Unk1d::           db
\1UpdateFunction::  dw
ENDM

MACRO pal_config_struct
\1Register::   db
\1Index::      db
\1Number::     db
\1SourceHi::   db
\1SourceLo::   db
\1TotalSteps:: db
ENDM

MACRO hdma_config_struct
\1SourceHi:: db
\1SourceLo:: db
\1DestHi::   db
\1DestLo::   db
\1Mode::     db
ENDM

MACRO particle_struct
\1ID::             db ; PARTICLE_* constant
\1Initialised::    db
\1YPos::           dw
\1XPos::           dw
\1Duration::       db
\1FramesetOffset:: db
\1Frame::          db
\1Unused09::       db
\1Unused0a::       db
\1Unused0b::       db
\1Unused0c::       db
\1Unused0d::       db
\1Unused0e::       db
\1Unused0f::       db
ENDM

MACRO channel_struct
\1Flags::            db
\1Duration::         db
\1CmdPtr::           dw
\1SoundBank::        db
\1Unused05::         db
\1SoundID::          dw
\1Priority::         db
\1Pitch::            db
\1Unk0a::            db
\1Unk0b::            db
\1Timbre::           db
\1Length::           db
\1Sweep::            db
\1FadeInEnvelope::   db
\1FadeOutEnvelope::  db
\1ActiveCommand::    db
\1SemitoneOffset::   db
\1Unk13::            dw
\1Volume::           db
\1Unk16::            db
\1SO1::              db
\1SO2::              db
\1Unk19::            db
\1Unk1a::            db
\1Unk1b::            dw
\1Unk1d::            db
\1Unk1e::            db
\1VibratoSpeed::     db
\1VibratoValue::     db
\1VibratoAmplitude:: db
\1Unk22::            db
\1VibratoDisabled::  db
\1Unk24::            dw
\1Unk26::            db
\1Unk27::            db
\1Unk28::            db
\1Unk29::            db
\1VibratoDelay::     db
\1VibratoCounter::   db
\1Frequency::        dw
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

MACRO track_struct
\1Flags::          db
\1Priority::       db
\1Unk02::          db
\1Unk03::          db
\1ChannelPtr::     dw ; pointer to a channel_struct
\1Unk06::          db
\1Duration::       db
\1Timbre::         db
; in case of sound1 and sound2, duty cycle
; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
; in case of sound3, a WAVEFORM_* constant
\1Length::          db
\1Sweep::           db
\1FadeInEnvelope::  db
\1FadeOutEnvelope:: db
\1Unk0d::           db
\1Unk0e::           db
\1Unk0f::           db
\1Volume::          db
\1VolumeEnvelope::  db
\1Frequency::       dw
\1Unk14::           db
\1Unk15::           db
\1Unk16::           db
\1Unk17::           db
ENDM

MACRO temple_rock_struct
\1Action::      db
; 0 = ?
; 1 = Spawn in
; 2 = Update
; 3 = Reset
\1Counter::     db
\1Size::        db ; medium or large if 2, else it's small
\1RespawnTime:: db
ENDM

MACRO temple_music_box_struct
\1Action::      db
; 0 = ?
; 1 = Init
; 2 = Move up left
; 3 = Move in circle
\1Counter::     db
ENDM

MACRO plane_part_struct
\1Action::      db
\1Counter::     db
ENDM

MACRO colour_part_fade_struct
\1Current:: db
\1Target::  db
\1Sign::    db ; $1 = incr, $2 = decr
\1Diff::    db
\1Unk1::    db
\1Unk2::    db
\1Unk3::    db
\1Unk4::    db
ENDM

MACRO colour_fade_struct
	colour_part_fade_struct \1Red
	colour_part_fade_struct \1Green
	colour_part_fade_struct \1Blue
ENDM

MACRO pal_fade_struct
FOR n, 1, NUM_PAL_COLORS + 1
	colour_fade_struct \1Colour{u:n}
ENDR
ENDM
