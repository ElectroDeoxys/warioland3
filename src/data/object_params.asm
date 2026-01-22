ObjParams_HebariiProjectile:
	db -8  ; y
	db  0  ; x
	db HEBARII_PROJECTILE ; id
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -3,  2, -3,  2 ; collision
	dw OAM_18a703 ; OAM
	dw Frameset_68408 ; frameset
	db 2 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw HebariiProjectileFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_WebberProjectile:
	db  5  ; y
	db -8  ; x
	db WEBBER_PROJECTILE ; id
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -7, -3, -4, 3 ; collision
	dw OAM_180242 ; OAM
	dw Frameset_682c8 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw WebberProjectileFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_UnusedFlowerProjectileLeft:
	db -10 ; y
	db   0 ; x
	db UNUSED_FLOWER_PROJECTILE_LEFT ; id
	db OBJ_INTERACTION_FULL_STING
	db -13, -3, -6, 5 ; collision box
	dw OAM_180916 ; OAM
	dw Frameset_6838c ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw UnusedFlowerProjectileLeftFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_UnusedFlowerProjectileRight:
	db -10 ; y
	db   0 ; x
	db UNUSED_FLOWER_PROJECTILE_RIGHT ; id
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -13, -3, -6, 5 ; collision box
	dw OAM_180916 ; OAM
	dw Frameset_68395 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw UnusedFlowerProjectileRightFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BigLeaf1:
	db -10 ; y
	db  15 ; x
	db BIG_LEAF1 ; id
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -16, -8, -8, 7 ; collision box
	dw OAM_1817b4 ; OAM
	dw Frameset_68732 ; frameset
	db 80 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BigLeaf1Func
	db $0 ; obj flags

ObjParams_BigLeaf2:
	db -10 ; y
	db -17 ; x
	db BIG_LEAF2 ; id
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -16, -8, -8, 7 ; collision box
	dw OAM_1817b4 ; OAM
	dw Frameset_68732 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BigLeaf2Func
	db $0 ; obj flags

ObjParams_BigLeaf3:
	db -10 ; y
	db -48 ; x
	db BIG_LEAF3 ; id
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -16, -8, -8, 7 ; collision box
	dw OAM_1817b4 ; OAM
	dw Frameset_68732 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw BigLeaf2Func
	db $0 ; obj flags

ObjParams_DoughnutLeft:
	db -18 ; y
	db  -9 ; x
	db DOUGHNUT_LEFT ; id
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ea ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw DoughnutFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DoughnutRight:
	db -18 ; y
	db   8 ; x
	db DOUGHNUT_RIGHT ; id
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ed ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw DoughnutFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DoughnutUpLeft:
	db -16 ; y
	db  -8 ; x
	db DOUGHNUT_UP_LEFT ; id
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ea ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw DoughnutFunc_Up
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DoughnutUpRight:
	db -16 ; y
	db   7 ; x
	db DOUGHNUT_UP_RIGHT ; id
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_180ea7 ; OAM
	dw Frameset_685ed ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw DoughnutFunc_Up
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionLeft:
	db  -8 ; y
	db -16 ; x
	db INVISIBILITY_POTION_LEFT ; id
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionRight:
	db -8 ; y
	db 15 ; x
	db INVISIBILITY_POTION_RIGHT ; id
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionDropLeft:
	db  -8 ; y
	db -16 ; x
	db INVISIBILITY_POTION_DROP_LEFT ; id
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Drop
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InvisibilityPotionDropRight:
	db -8 ; y
	db 15 ; x
	db INVISIBILITY_POTION_DROP_RIGHT ; id
	db OBJ_INTERACTION_INVISIBILITY_POTION ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ab2 ; OAM
	dw Frameset_68c33 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw InvisibilityPotionFunc_Drop
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ZombieHeadLeft:
	db -16 ; y
	db   0 ; x
	db ZOMBIE_HEAD_LEFT ; id
	db OBJ_INTERACTION_ZOMBIE_HEAD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ffa ; OAM
	dw Frameset_68db3 ; frameset
	db 48 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ZombieHeadFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ZombieHeadRight:
	db -16 ; y
	db   0 ; x
	db ZOMBIE_HEAD_RIGHT ; id
	db OBJ_INTERACTION_ZOMBIE_HEAD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_184ffa ; OAM
	dw Frameset_68dc4 ; frameset
	db 48 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw ZombieHeadFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsLeft:
	db -20 ; y
	db -12 ; x
	db STARS_LEFT ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsRight:
	db -20 ; y
	db  11 ; x
	db STARS_RIGHT ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BeamLeft:
	db  0 ; y
	db -8 ; x
	db BEAM_LEFT ; id
	db OBJ_INTERACTION_BEAM ; interaction type
	db -14, -3, -2, 1 ; collision box
	dw OAM_1845aa ; OAM
	dw Frameset_68ee1 ; frameset
	db 18 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BeamFunc_Left
	db $0 ; obj flags

ObjParams_BeamRight:
	db  0 ; y
	db  8 ; x
	db BEAM_RIGHT ; id
	db OBJ_INTERACTION_BEAM ; interaction type
	db -14, -3, -2, 1 ; collision box
	dw OAM_1845aa ; OAM
	dw Frameset_68eea ; frameset
	db 18 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw BeamFunc_Right
	db $0 ; obj flags

ObjParams_AppleLeft:
	db -14 ; y
	db   7 ; x
	db APPLE_LEFT ; id
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_185a1c ; OAM
	dw Frameset_68a60 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $01 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AppleFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AppleRight:
	db -14 ; y
	db  -8 ; x
	db APPLE_RIGHT ; id
	db OBJ_INTERACTION_FOOD ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_185a1c ; OAM
	dw Frameset_68a60 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $01 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AppleFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SunFlameLeft:
	db  4 ; y
	db -8 ; x
	db SUN_FLAME_LEFT ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -10, -2, -5, 4 ; collision box
	dw OAM_1851df ; OAM
	dw Frameset_68fb2 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SunFlameFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SunFlameRight:
	db  4 ; y
	db  7 ; x
	db SUN_FLAME_RIGHT ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -10, -2, -5, 4 ; collision box
	dw OAM_1851df ; OAM
	dw Frameset_68fad ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw SunFlameFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MoonStarLeft:
	db  4 ; y
	db -8 ; x
	db MOON_STAR_LEFT ; id
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -10, -3, -5, 4 ; collision box
	dw OAM_1854a2 ; OAM
	dw Frameset_6901b ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw MoonStarFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MoonStarRight:
	db  4 ; y
	db  7 ; x
	db MOON_STAR_RIGHT ; id
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -10, -3, -5, 4 ; collision box
	dw OAM_1854a2 ; OAM
	dw Frameset_69012 ; frameset
	db $00 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw MoonStarFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BirdStars1:
	db -10 ; y
	db  -7 ; x
	db BIRD_STARS1 ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680b6 ; frameset
	db 17 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BirdStars2:
	db -10 ; y
	db   6 ; x
	db BIRD_STARS2 ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680b6 ; frameset
	db 17 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SnowflakeLeft:
	db -8 ; y
	db -8 ; x
	db SNOWFLAKE_LEFT ; id
	db OBJ_INTERACTION_ICE ; interaction type
	db -12, -5, -6, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_69169 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SnowflakeFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SnowflakeRight:
	db -8 ; y
	db  7 ; x
	db SNOWFLAKE_RIGHT ; id
	db OBJ_INTERACTION_ICE ; interaction type
	db -12, -5, -6, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_69169 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw SnowflakeFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MizzouProjectileLeft:
	db -10 ; y
	db -16 ; x
	db MIZZOU_PROJECTILE_LEFT ; id
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -7, 0, -4, 3 ; collision box
	dw OAM_188395 ; OAM
	dw Frameset_686ce ; frameset
	db 28 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw MizzouProjectileFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MizzouProjectileRight:
	db -10 ; y
	db  15 ; x
	db MIZZOU_PROJECTILE_RIGHT ; id
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -7, 0, -4, 3 ; collision box
	dw OAM_188395 ; OAM
	dw Frameset_686d3 ; frameset
	db 28 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw MizzouProjectileFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_GreyTreasure:
	db -40 ; y
	db   0 ; x
	db GREY_TREASURE_O ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680da ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw GreyTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_RedTreasure:
	db -40 ; y
	db   0 ; x
	db RED_TREASURE_O ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68113 ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw RedTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_GreenTreasure:
	db -40 ; y
	db   0 ; x
	db GREEN_TREASURE_O ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_6814c ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw GreenTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_BlueTreasure:
	db -40 ; y
	db   0 ; x
	db BLUE_TREASURE_O ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68185 ; frameset
	db 87 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BlueTreasureFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk1Left:
	db  1 ; y
	db -4 ; x
	db ANONSTER_SILK1_LEFT ; id
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 32 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatLeft
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk1Right:
	db 1 ; y
	db 3 ; x
	db ANONSTER_SILK1_RIGHT ; id
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 32 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatRight
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk2Left:
	db  1 ; y
	db -4 ; x
	db ANONSTER_SILK2_LEFT ; id
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 24 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatLeft
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk2Right:
	db 1 ; y
	db 3 ; x
	db ANONSTER_SILK2_RIGHT ; id
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 24 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatRight
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk3Left:
	db  1 ; y
	db -4 ; x
	db ANONSTER_SILK3_LEFT ; id
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 16 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatLeft
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterSilk3Right:
	db 1 ; y
	db 3 ; x
	db ANONSTER_SILK3_RIGHT ; id
	db OBJ_INTERACTION_ANONSTER_SILK ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694ee ; frameset
	db 16 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterSilkFunc.FloatRight
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterWaveLeft:
	db  4 ; y
	db -5 ; x
	db ANONSTER_WAVE_LEFT ; id
	db OBJ_INTERACTION_ANONSTER_WAVE ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_694f8 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw AnonsteWaveLFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_AnonsterWaveRight:
	db 4 ; y
	db 4 ; x
	db ANONSTER_WAVE_RIGHT ; id
	db OBJ_INTERACTION_ANONSTER_WAVE ; interaction type
	db -8, -4, -5, 4 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_69505 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw AnonsterWaveFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_SilkPlatform1:
	db  -16 ; y
	db -112 ; x
	db SILK_PLATFORM1 ; id
	db OBJ_INTERACTION_SOLID ; interaction type
	db -8, -2, -5, 5 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_6954a ; frameset
	db 170 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw SilkPlatformFunc
	db $0 ; obj flags

ObjParams_SilkPlatform2:
	db -16 ; y
	db -80 ; x
	db SILK_PLATFORM2 ; id
	db OBJ_INTERACTION_SOLID ; interaction type
	db -8, -2, -5, 5 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_6954a ; frameset
	db 120 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw SilkPlatformFunc
	db $0 ; obj flags

ObjParams_SilkPlatform3:
	db -16 ; y
	db -48 ; x
	db SILK_PLATFORM3 ; id
	db OBJ_INTERACTION_SOLID ; interaction type
	db -8, -2, -5, 5 ; collision box
	dw OAM_190000 ; OAM
	dw Frameset_6954a ; frameset
	db 70 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw SilkPlatformFunc
	db $0 ; obj flags

ObjParams_SnakeFireLeft:
	db  16 ; y
	db -21 ; x
	db SNAKE_FIRE_LEFT ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -8, 0, -4, 3 ; collision box
	dw OAM_189783 ; OAM
	dw Frameset_6893a ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SnakeFireFunc
	db $0 ; obj flags

ObjParams_SnakeFireRight:
	db 16 ; y
	db  6 ; x
	db SNAKE_FIRE_RIGHT ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -8, 0, -4, 3 ; collision box
	dw OAM_189783 ; OAM
	dw Frameset_6893a ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SnakeFireFunc
	db $0 ; obj flags

ObjParams_DollBoyHammer:
	db -18 ; y
	db -10 ; x
	db DOLL_BOY_HAMMER ; id
	db OBJ_INTERACTION_DOLL_BOY_HAMMER ; interaction type
	db -12, -4, -4, 3 ; collision box
	dw OAM_19105c ; OAM
	dw Frameset_69684 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw DollBoyHammerFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HammerPlatform:
	db -60 ; y
	db  64 ; x
	db HAMMER_PLATFORM ; id
	db OBJ_INTERACTION_31 ; interaction type
	db -10, -1, -5, 4 ; collision box
	dw OAM_19105c ; OAM
	dw Frameset_696b1 ; frameset
	db 140 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw HammerPlatformFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HighRollingRockLeft:
	db   4 ; y
	db -13 ; x
	db HIGH_ROLLING_ROCK_LEFT ; id
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_6973d ; frameset
	db 7 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw RollingRockFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HighRollingRockRight:
	db   4 ; y
	db  12 ; x
	db HIGH_ROLLING_ROCK_RIGHT ; id
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_696f8 ; frameset
	db 7 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw RollingRockFunc_Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_LowRollingRockLeft:
	db   4 ; y
	db -13 ; x
	db LOW_ROLLING_ROCK_LEFT ; id
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_6973d ; frameset
	db 7 ; action duration
	db $1 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw RollingRockFunc_Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_LowRollingRockRight:
	db   4 ; y
	db  12 ; x
	db LOW_ROLLING_ROCK_RIGHT ; id
	db OBJ_INTERACTION_ROLLING_ROCK ; interaction type
	db -10, -4, -4, 3 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_696f8 ; frameset
	db 7 ; action duration
	db $1 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw RollingRockFunc_Right
	db OBJFLAG_PRIORITY ; obj flags


ObjParams_PalmTreeShort:
	db 16 ; y
	db 16 ; x
	db PALM_TREE_SHORT ; id
	db OBJ_INTERACTION_31 ; interaction type
	db -6, -2, -7, 6 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_69746 ; frameset
	db 0 ; action duration
	db $1a ; var1
	db $1f ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw PalmTreeFunc
	db $0 ; obj flags

ObjParams_PalmTreeMedium:
	db 28 ; y
	db 72 ; x
	db PALM_TREE_MEDIUM ; id
	db OBJ_INTERACTION_31 ; interaction type
	db -14, -10, -7, 6 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_6974d ; frameset
	db 0 ; action duration
	db $30 ; var1
	db $1f ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw PalmTreeFunc
	db $0 ; obj flags

ObjParams_PalmTreeTall:
	db  39 ; y
	db 127 ; x
	db PALM_TREE_TALL ; id
	db OBJ_INTERACTION_31 ; interaction type
	db -30, -26, -7, 6 ; collision box
	dw OAM_194000 ; OAM
	dw Frameset_69754 ; frameset
	db 0 ; action duration
	db $4a ; var1
	db $1f ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw PalmTreeFunc
	db $0 ; obj flags

ObjParams_YellowBellyArrowLeft:
	db  16 ; y
	db -16 ; x
	db YELLOW_BELLY_ARROW_LEFT ; id
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -10, -4, -3, 2 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_69870 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $1 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw YellowBellyArrowFunc.Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_YellowBellyArrowRight:
	db 16 ; y
	db 15 ; x
	db YELLOW_BELLY_ARROW_RIGHT ; id
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -10, -4, -3, 2 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_69875 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $1 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw YellowBellyArrowFunc.Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Dragonfly1:
	db -64 ; y
	db  48 ; x
	db DRAGONFLY1 ; id
	db OBJ_INTERACTION_WALKABLE ; interaction type
	db -9, -7, -7, 6 ; collision box
	dw OAM_1927d5 ; OAM
	dw Frameset_699d0 ; frameset
	db 36 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw Dragonfly1Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Fly:
	db -48 ; y
	db  48 ; x
	db FLY ; id
	db OBJ_INTERACTION_01 ; interaction type
	db -12, 12, -6, 5 ; collision box
	dw OAM_1927d5 ; OAM
	dw Frameset_699e4 ; frameset
	db 40 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $5a ; state
	dw FlyFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Tadpole:
	db -3 ; y
	db  0 ; x
	db TADPOLE ; id
	db OBJ_INTERACTION_TADPOLE ; interaction type
	db -12, -4, -5, 4 ; collision box
	dw OAM_18a642 ; OAM
	dw Frameset_69a33 ; frameset
	db 28 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $5a ; state
	dw TadpoleFunc
	db $0 ; obj flags

ObjParams_InkLeft:
	db -12 ; y
	db  -4 ; x
	db INK_LEFT ; id
	db OBJ_INTERACTION_INK ; interaction type
	db -13, -3, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69ae3 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InkFunc.Left
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_InkRight:
	db -12 ; y
	db   3 ; x
	db INK_RIGHT ; id
	db OBJ_INTERACTION_INK ; interaction type
	db -13, -3, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69ae3 ; frameset
	db 20 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw InkFunc.Right
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_FloatingRing:
	db 64 ; y
	db  0 ; x
	db FLOATING_RING ; id
	db OBJ_INTERACTION_31 ; interaction type
	db -1, 4, -5, 4 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69b0d ; frameset
	db 140 ; action duration
	db $00 ; var1
	db $14 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNK_4 ; substate
	db $00 ; state
	dw FloatingRingFunc
	db $0 ; obj flags

ObjParams_Skull1:
	db -28 ; y
	db -16 ; x
	db SKULL1 ; id
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69c69 ; frameset
	db 60 ; action duration
	db $64 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_Skull2:
	db 20 ; y
	db -16 ; x
	db SKULL2 ; id
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69c69 ; frameset
	db 60 ; action duration
	db $78 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_Skull3:
	db -28 ; y
	db  16 ; x
	db SKULL3 ; id
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69cc5 ; frameset
	db 60 ; action duration
	db $8c ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_Skull4:
	db 20 ; y
	db 16 ; x
	db SKULL4 ; id
	db OBJ_INTERACTION_STOVE ; interaction type
	db -8, 7, -4, 3 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69cc5 ; frameset
	db 60 ; action duration
	db $a0 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw SkullFunc
	db $0 ; obj flags

ObjParams_JamanoHat:
	db -12 ; y
	db   0 ; x
	db JAMANO_HAT ; id
	db OBJ_INTERACTION_0B ; interaction type
	db -4, 0, -6, 5 ; collision box
	dw OAM_19501c ; OAM
	dw Frameset_69cef ; frameset
	db 40 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw JamanoHatFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MagicSpiralLeft:
	db  12 ; y
	db -12 ; x
	db MAGIC_SPIRAL_LEFT ; id
	db OBJ_INTERACTION_MAGICAL_SPIRAL ; interaction type
	db -4, 3, -4, 3 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e30 ; frameset
	db 92 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db 5 | OBJSUBFLAG_VDIR ; substate
	db $00 ; state
	dw MagicSpiralFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MagicSpiralRight:
	db 12 ; y
	db 11 ; x
	db MAGIC_SPIRAL_RIGHT ; id
	db OBJ_INTERACTION_MAGICAL_SPIRAL ; interaction type
	db -4, 3, -4, 3 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e30 ; frameset
	db 92 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db 5 | OBJSUBFLAG_VDIR | OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw MagicSpiralFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_IgaguriLeft:
	db  21 ; y
	db -12 ; x
	db IGAGURI_LEFT ; id
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -16, -4, -5, 4 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e7b ; frameset
	db 62 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw IgaguriFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_IgaguriRight:
	db 21 ; y
	db 11 ; x
	db IGAGURI_RIGHT ; id
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -16, -4, -5, 4 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e7b ; frameset
	db 62 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw IgaguriFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_HiddenFigureFace:
	db -16 ; y
	db   8 ; x
	db HIDDEN_FIGURE_FACE ; id
	db OBJ_INTERACTION_FULL_STING | HEAVY_OBJ ; interaction type
	db -24, -19, -4, 3 ; collision box
	dw OAM_18c88a ; OAM
	dw Frameset_6a06c ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw HiddenFigureFaceFunc
	db $0 ; obj flags

ObjParams_HiddenFigureLeftHand:
	db  18 ; y
	db -40 ; x
	db HIDDEN_FIGURE_LEFT_HAND ; id
	db OBJ_INTERACTION_0B | HEAVY_OBJ ; interaction type
	db -24, -8, -8, 7 ; collision box
	dw OAM_18c88a ; OAM
	dw Frameset_6a128 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw HiddenFigureLeftHandFunc
	db $0 ; obj flags

ObjParams_HiddenFigureRightHand:
	db 18 ; y
	db 56 ; x
	db HIDDEN_FIGURE_RIGHT_HAND ; id
	db OBJ_INTERACTION_0B | HEAVY_OBJ ; interaction type
	db -24, -8, -8, 7 ; collision box
	dw OAM_18c88a ; OAM
	dw Frameset_6a131 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw HiddenFigureRightHandFunc
	db $0 ; obj flags

ObjParams_Omodon2:
	db 16 ; y
	db  0 ; x
	db OMODON2 ; id
	db OBJ_INTERACTION_01 ; interaction type
	db -16, 11, -17, 0 ; collision box
	dw OAM_18154f ; OAM
	dw Frameset_68f50 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw Func_4279c
	db $0 ; obj flags

ObjParams_Omodon1:
	db 16 ; y
	db  0 ; x
	db OMODON1 ; id
	db OBJ_INTERACTION_01 ; interaction type
	db -26, 11, -17, 0 ; collision box
	dw OAM_18154f ; OAM
	dw Frameset_68f50 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw Func_4279c
	db $0 ; obj flags

ObjParams_DollBoyHammerStarsLeft:
	db -20 ; y
	db -19 ; x
	db DOLL_BOY_HAMMER_STARS_LEFT ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_DollBoyHammerStarsRight:
	db -20 ; y
	db 18 ; x
	db DOLL_BOY_HAMMER_STARS_RIGHT ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Coin:
	db COIN ; id
	db OBJ_INTERACTION_REGULAR_COIN
	db -12, 0, -4, 3
	dw OAM_180003 ; OAM
	db 1, 8 ; frameset
	db 4 ; action duration
	db $00 ; var1
	db $02 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNINITIALISED ; substate
	db OBJSTATE_19 ; state
	dw CoinFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ColourCoin:
	db COLOUR_COIN ; id
	db OBJ_INTERACTION_COLOUR_COIN
	db -12, 0, -4, 3
	dw OAM_180003 ; OAM
	db 1, 8 ; frameset
	db 4 ; action duration
	db $00 ; var1
	db $02 ; var2
	db $00 ; var3
	db OBJSUBFLAG_UNINITIALISED ; substate
	db OBJSTATE_19 ; state
	dw CoinFunc.ColourCoin
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberLeft1:
	db TORCH_EMBER_LEFT1 ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw TorchEmberLeft1Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberRight1:
	db TORCH_EMBER_RIGHT1 ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw TorchEmberRight1Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberLeft2:
	db TORCH_EMBER_LEFT2 ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw TorchEmberLeft2Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_TorchEmberRight2:
	db TORCH_EMBER_RIGHT2 ; id
	db OBJ_INTERACTION_FIRE ; interaction type
	db -12, -3, -5, 3 ; collision box
	dw OAM_180838 ; OAM
	dw Frameset_68354 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db OBJSUBFLAG_HDIR ; substate
	db $00 ; state
	dw TorchEmberRight2Func
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ElectricLampSpark:
	db ELECTRIC_LAMP_SPARK ; id
	db OBJ_INTERACTION_ELECTRIC ; interaction type
	db -6, -5, -4, 3 ; collision box
	dw OAM_184eeb ; OAM
	dw Frameset_68c97 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ElectricLampSparkFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Bubble:
	db BUBBLE ; id
	db OBJ_INTERACTION_BUBBLE ; interaction type
	db -24, -7, -9, 8 ; collision box
	dw OAM_185b98 ; OAM
	dw Frameset_69105 ; frameset
	db 32 ; action duration
	db $30 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw BubbleFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_FallingSnow:
	db FALLING_SNOW ; id
	db OBJ_INTERACTION_SNOW ; interaction type
	db -15, -8, -5, 4 ; collision box
	dw OAM_1893fe ; OAM
	dw Frameset_6957e ; frameset
	db 80 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw FallingSnowFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsAbove:
	db STARS_ABOVE ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680c5 ; frameset
	db 33 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_WithYOffset
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_YellowBellyHead:
	db YELLOW_BELLY_HEAD ; id
	db OBJ_INTERACTION_YELLOW_BELLY_ARROW ; interaction type
	db -10, -6, -4, 3 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_6987a ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw YellowBellyHeadFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Pump:
	db PUMP ; id
	db OBJ_INTERACTION_36 ; interaction type
	db -13, -1, -6, 5 ; collision box
	dw OAM_1926dc ; OAM
	dw Frameset_6987a ; frameset
	db 16 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw PumpFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Cheese:
	db CHEESE ; id
	db OBJ_INTERACTION_0B ; interaction type
	db -12, -5, -6, 5 ; collision box
	dw OAM_1927d5 ; OAM
	dw Frameset_69a00 ; frameset
	db 48 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw CheeseFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ScrowlerTentacleRight:
	db SCROWLER_TENTACLE_RIGHT ; id
	db OBJ_INTERACTION_WATER_TELEPORTING ; interaction type
	db -10, -2, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69af5 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ScrowlerTentacleFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_ScrowlerTentacleLeft:
	db SCROWLER_TENTACLE_LEFT ; id
	db OBJ_INTERACTION_WATER_TELEPORTING ; interaction type
	db -10, -2, -3, 2 ; collision box
	dw OAM_194895 ; OAM
	dw Frameset_69af5 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw ScrowlerTentacleFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MuddeeStinger1:
	db MUDDEE_STINGER1 ; id
	db OBJ_INTERACTION_FULL_STING ; interaction type
	db -12, 0, -4, 3 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68072 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $1 ; substate
	db $00 ; state
	dw MuddeeStingerFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_MuddeeStinger2:
	db MUDDEE_STINGER2 ; id
	db OBJ_INTERACTION_01 ; interaction type
	db -12, 0, -4, 3 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_68072 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $1 ; substate
	db $00 ; state
	dw MuddeeStingerFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_Kuri:
	db KURI ; id
	db OBJ_INTERACTION_01 ; interaction type
	db -12, 0, -5, 4 ; collision box
	dw OAM_195e06 ; OAM
	dw Frameset_69e50 ; frameset
	db 0 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw KuriFunc
	db OBJFLAG_PRIORITY ; obj flags

ObjParams_StarsCentre:
	db STARS_CENTRE ; id
	db OBJ_INTERACTION_01 ; interaction type
	db 0, 0, 0, 0 ; collision box
	dw OAM_18c000 ; OAM
	dw Frameset_680a5 ; frameset
	db 25 ; action duration
	db $00 ; var1
	db $00 ; var2
	db $00 ; var3
	db $0 ; substate
	db $00 ; state
	dw StarsFunc_SetFlags
	db OBJFLAG_PRIORITY ; obj flags
