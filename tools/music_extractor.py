import reader
import argparse

parser = argparse.ArgumentParser(description='Parse music data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of the music channel pointers table')

args = parser.parse_args()

cmdTable = {
    # byte opcode, [command string, number of arg bytes]
    0x81: ['audio_wait_1',      0],
    0x82: ['audio_wait_2',      0],
    0x83: ['audio_wait_3',      0],
    0x84: ['audio_wait_4',      0],
    0x85: ['audio_wait_5',      0],
    0x86: ['audio_wait_6',      0],
    0x87: ['audio_wait_7',      0],
    0x88: ['audio_wait_8',      0],
    0x89: ['audio_wait_9',      0],
    0x8a: ['audio_wait_10',     0],
    0x8b: ['audio_wait_11',     0],
    0x8c: ['audio_wait_12',     0],
    0x8d: ['audio_wait_13',     0],
    0x8e: ['audio_wait_14',     0],
    0x8f: ['audio_wait_15',     0],
    0x90: ['audio_wait_16',     0],
    0x92: ['audio_wait_18',     0],
    0x93: ['audio_wait_19',     0],
    0x94: ['audio_wait_20',     0],
    0x95: ['audio_wait_21',     0],
    0x96: ['audio_wait_22',     0],
    0x98: ['audio_wait_24',     0],
    0x99: ['audio_wait_28',     0],
    0x9a: ['audio_wait_30',     0],
    0x9b: ['audio_wait_32',     0],
    0x9c: ['audio_wait_36',     0],
    0x9d: ['audio_wait_40',     0],
    0x9e: ['audio_wait_42',     0],
    0x9f: ['audio_wait_44',     0],
    0xa0: ['audio_wait_48',     0],
    0xa1: ['audio_wait_52',     0],
    0xa2: ['audio_wait_54',     0],
    0xa3: ['audio_wait_56',     0],
    0xa4: ['audio_wait_60',     0],
    0xa5: ['audio_wait_64',     0],
    0xa6: ['audio_wait_66',     0],
    0xa7: ['audio_wait_68',     0],
    0xa8: ['audio_wait_72',     0],
    0xab: ['audio_wait_80',     0],
    0xac: ['audio_wait_84',     0],
    0xad: ['audio_wait_88',     0],
    0xae: ['audio_wait_90',     0],
    0xaf: ['audio_wait_92',     0],
    0xb0: ['audio_wait_96',     0],
    0xb1: ['audio_end',         0],
    0xb2: ['audio_jump',        2],
    0xb3: ['audio_call',        2],
    0xb4: ['audio_ret',         0],
    0xb5: ['audio_loop',        3],
    0xbc: ['tempo',             1],
    0xbd: ['semitone_offset',   1],
    0xbe: ['wave',              1],
    0xbf: ['volume',            1],
    0xc1: ['pitch_offset',      1],
    0xc2: ['pitch_offset_mult', 1],
    0xc3: ['vibrato_speed',     1],
    0xc4: ['vibrato_delay',     1],
    0xc5: ['vibrato_amplitude', 1],
    0xc6: ['vibrato_disabled',  1],
    0xce: ['note_sustain',      0],
}

noteArgMap = {
    0x24: 'C_0',
    0x25: 'C#0',
    0x26: 'D_0',
    0x27: 'D#0',
    0x28: 'E_0',
    0x29: 'F_0',
    0x2a: 'F#0',
    0x2b: 'G_0',
    0x2c: 'G#0',
    0x2d: 'A_0',
    0x2e: 'A#0',
    0x2f: 'B_0',
    0x30: 'C_1',
    0x31: 'C#1',
    0x32: 'D_1',
    0x33: 'D#1',
    0x34: 'E_1',
    0x35: 'F_1',
    0x36: 'F#1',
    0x37: 'G_1',
    0x38: 'G#1',
    0x39: 'A_1',
    0x3a: 'A#1',
    0x3b: 'B_1',
    0x3c: 'C_2',
    0x3d: 'C#2',
    0x3e: 'D_2',
    0x3f: 'D#2',
    0x40: 'E_2',
    0x41: 'F_2',
    0x42: 'F#2',
    0x43: 'G_2',
    0x44: 'G#2',
    0x45: 'A_2',
    0x46: 'A#2',
    0x47: 'B_2',
    0x48: 'C_3',
    0x49: 'C#3',
    0x4a: 'D_3',
    0x4b: 'D#3',
    0x4c: 'E_3',
    0x4d: 'F_3',
    0x4e: 'F#3',
    0x4f: 'G_3',
    0x50: 'G#3',
    0x51: 'A_3',
    0x52: 'A#3',
    0x53: 'B_3',
    0x54: 'C_4',
    0x55: 'C#4',
    0x56: 'D_4',
    0x57: 'D#4',
    0x58: 'E_4',
    0x59: 'F_4',
    0x5a: 'F#4',
    0x5b: 'G_4',
    0x5c: 'G#4',
    0x5d: 'A_4',
    0x5e: 'A#4',
    0x5f: 'B_4',
    0x60: 'C_5',
    0x61: 'C#5',
    0x62: 'D_5',
    0x63: 'D#5',
    0x64: 'E_5',
    0x65: 'F_5',
    0x66: 'F#5',
    0x67: 'G_5',
    0x68: 'G#5',
    0x69: 'A_5',
    0x6a: 'A#5',
    0x6b: 'B_5',
    0x6c: 'C_6',
    0x6d: 'C#6',
    0x6e: 'D_6',
    0x6f: 'D#6',
    0x70: 'E_6',
    0x71: 'F_6',
    0x72: 'F#6',
    0x73: 'G_6',
    0x74: 'G#6',
    0x75: 'A_6',
    0x76: 'A#6',
    0x77: 'B_6',
    0x78: 'C_7',
    0x79: 'C#7',
    0x7a: 'D_7',
    0x7b: 'D#7',
    0x7c: 'E_7',
    0x7d: 'F_7',
    0x7e: 'F#7',
    0x7f: 'G_7',

    0xcf: 'NOTE_DURATION_0',
    0xd0: 'NOTE_DURATION_1',
    0xd1: 'NOTE_DURATION_2',
    0xd2: 'NOTE_DURATION_3',
    0xd3: 'NOTE_DURATION_4',
    0xd4: 'NOTE_DURATION_5',
    0xd5: 'NOTE_DURATION_6',
    0xd6: 'NOTE_DURATION_7',
    0xd7: 'NOTE_DURATION_8',
    0xd8: 'NOTE_DURATION_9',
    0xd9: 'NOTE_DURATION_10',
    0xda: 'NOTE_DURATION_11',
    0xdb: 'NOTE_DURATION_12',
    0xdc: 'NOTE_DURATION_13',
    0xdd: 'NOTE_DURATION_14',
    0xde: 'NOTE_DURATION_15',
    0xdf: 'NOTE_DURATION_16',
    0xe0: 'NOTE_DURATION_17',
    0xe1: 'NOTE_DURATION_18',
    0xe2: 'NOTE_DURATION_19',
    0xe3: 'NOTE_DURATION_20',
    0xe4: 'NOTE_DURATION_21',
    0xe5: 'NOTE_DURATION_22',
    0xe6: 'NOTE_DURATION_23',
    0xe7: 'NOTE_DURATION_24',
    0xe8: 'NOTE_DURATION_28',
    0xe9: 'NOTE_DURATION_30',
    0xea: 'NOTE_DURATION_32',
    0xeb: 'NOTE_DURATION_36',
    0xec: 'NOTE_DURATION_40',
    0xed: 'NOTE_DURATION_42',
    0xee: 'NOTE_DURATION_44',
    0xef: 'NOTE_DURATION_48',
    0xf0: 'NOTE_DURATION_52',
    0xf1: 'NOTE_DURATION_54',
    0xf2: 'NOTE_DURATION_56',
    0xf3: 'NOTE_DURATION_60',
    0xf4: 'NOTE_DURATION_64',
    0xf5: 'NOTE_DURATION_66',
    0xf6: 'NOTE_DURATION_68',
    0xf7: 'NOTE_DURATION_72',
    0xf8: 'NOTE_DURATION_76',
    0xf9: 'NOTE_DURATION_78',
    0xfa: 'NOTE_DURATION_80',
    0xfb: 'NOTE_DURATION_84',
    0xfc: 'NOTE_DURATION_88',
    0xfd: 'NOTE_DURATION_90',
    0xfe: 'NOTE_DURATION_92',
    0xff: 'NOTE_DURATION_96'
}

def isNoteOp(opByte):
    return opByte in noteArgMap or opByte < 0x24 or opByte == 0xce

def printAudioCommands(offset, sfxIdx, channelNum):
    startOffset = offset
    bank = int(offset / 0x4000) # round down

    outCmds = []
    callOffsetSet = set()
    jumpOffsetSet = set()

    while True:
        opByte = reader.getROMByte(offset)[0]

        isNote = False

        if opByte not in cmdTable:
            if isNoteOp(opByte):
                isNote = True
            else:
                print("Unknown opcode {:02x}".format(opByte))
                break

        if isNote:
            noteArgs = []
            opOffset = offset

            if opByte == 0xce:
                offset += 1

            while True:
                noteArg = reader.getROMByte(offset)[0]

                if not isNoteOp(noteArg):
                    break

                noteArgs.append(noteArg)
                offset += 1

            outCmds.append([opByte, noteArgs, opOffset])
        else:
            nArgs = cmdTable[opByte][1]

            argBytes = []
            if nArgs != 0:
                argBytes = reader.getROMBytes(offset + 1, nArgs)

            outCmds.append([opByte, argBytes, offset])

            if opByte == 0xb2:
                jumpOffsetSet.add(reader.getPointerAt(offset + 1))
            elif opByte == 0xb3:
                callOffsetSet.add(reader.getPointerAt(offset + 1))
            elif opByte == 0xb5:
                callOffsetSet.add(reader.getPointerAt(offset + 2))

            offset += 1 + nArgs

            # breaking condition
            if opByte == 0xb1:
                break

    # replace calling/jump address to local labels
    numLoops = 0
    numSubs = 0

    jumpOffsetList = list(jumpOffsetSet)
    callOffsetList = list(callOffsetSet)
    jumpOffsetList.sort()
    callOffsetList.sort()

    addrLabels = {}

    for jumpOffset in jumpOffsetList:
        addrLabels[jumpOffset] = ".loop" + str(numLoops + 1)
        numLoops += 1
    for callOffset in callOffsetList:
        addrLabels[callOffset] = ".sub" + str(numSubs + 1)
        numSubs += 1

    print("Sfx_SFX_0{:02X}_Ch{}: ".format(sfxIdx, channelNum) + reader.offsetHeaderStr(startOffset))
    for outCmd in outCmds:
        argStr = ""
        isNote = isNoteOp(outCmd[0])

        if isNote:
            for noteArg in outCmd[1]:
                if noteArg in noteArgMap:
                    argStr += (" ", ", ")[argStr != ""] + noteArgMap[noteArg]
                else:
                    argStr += (" ", ", ")[argStr != ""] + "{}".format(noteArg)
        elif outCmd[1]:
            if outCmd[0] == 0xb2 or outCmd[0] == 0xb3:
                argStr = " " + addrLabels[reader.pointerBytesToBankOffset(outCmd[1], bank)]
            elif outCmd[0] == 0xb5:
                argStr = " {}, ".format(outCmd[1][0] + 1) + addrLabels[reader.pointerBytesToBankOffset([outCmd[1][1], outCmd[1][2]], bank)]
            elif outCmd[0] == 0xbc or outCmd[0] == 0xbd or outCmd[0] == 0xbf or outCmd[0] == 0xc2 or outCmd[0] == 0xc3 or outCmd[0] == 0xc4 or outCmd[0] == 0xc5:
                argStr = " {}".format(outCmd[1][0])
            elif outCmd[0] == 0xbe:
                argStr = " WAVE_{:02X}".format(outCmd[1][0])
            elif outCmd[0] == 0xc1:
                argStr = " {}".format((outCmd[1][0] - 0x40) * 2)
            elif outCmd[0] == 0xc6:
                argStr = (" FALSE", " TRUE")[outCmd[0] == 1]


        if outCmd[2] in addrLabels:
            print(addrLabels[outCmd[2]])

        if isNote:
            print("\t" + ("note", "note_sustain")[outCmd[0] == 0xce] + argStr)
        else:
            print("\t" + cmdTable[outCmd[0]][0] + argStr + ("", "\n")[outCmd[0] == 0xb4])

    print('; 0x{:0x}\n'.format(offset))

curIdx = 1

for offsetStr in args.offsets:
    offset = int(offsetStr, 16)
    startOffset = offset

    numChannels = reader.getROMByte(offset)[0]
    offset += 2

    for chan in range(numChannels):
        printAudioCommands(reader.getPointerAt(offset), curIdx, chan + 1)
        offset += 2

    offset = startOffset
    print("Sfx_SFX_0{:02X}: ".format(curIdx) + reader.offsetHeaderStr(offset))
    print("\tdb {}, {}".format(reader.getROMByte(offset)[0], reader.getROMByte(offset + 1)[0]))
    offset += 2

    for x in range(numChannels):
        print("\tdw Sfx_SFX_0{:02X}_Ch{}".format(curIdx, x + 1))
        offset += 2

    print('; 0x{:0x}\n'.format(offset))

    curIdx += 1
