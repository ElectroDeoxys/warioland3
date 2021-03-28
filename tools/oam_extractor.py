import reader
import argparse

parser = argparse.ArgumentParser(description='Parse OAM data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of OAM data')

args = parser.parse_args()

def getSigned(x):
    return (x - 0x100, x)[x < 0x80]

def getOAM(data):
    return [getSigned(data[0]), getSigned(data[1]), data[2], data[3]]

def getPointers(offset):
    curOffset = offset
    curBank = int(offset / 0x4000) # round down

    ptrs = []

    while True:
        hiPtr = int.from_bytes(reader.getROMByte(curOffset + 1), 'little')
        if  hiPtr < 0x40 or hiPtr >= 0x80:
            break # exit condition

        ptrs.append(reader.getPointerAt(curOffset, curBank))
        curOffset += 2

    return ptrs

for offsetStr in reader.standardiseList(args.offsets):
    offset = int(offsetStr, 16)
    outStr = ''

    ptrs = getPointers(offset)
    ptrTableStr = ''
    i = 0

    prevOffset = offset + 2 * len(ptrs)

    for ptrOffset in ptrs:
        ptrTableStr += '\tdw .frame_{}\n'.format(i)

        yCoord, xCoord, tileID, attr = getOAM(reader.getROMBytes(ptrOffset, 4))
        if prevOffset < ptrOffset:
            outStr += '\n\tINCROM ' + '${:0x}, '.format(prevOffset) + '${:0x}\n\n'.format(ptrOffset)
        outStr += '.frame_{}\n'.format(i)
        outStr += '\tframe_oam ' + '{0:3}, '.format(yCoord) + '{0:3}, '.format(xCoord) + '${0:02x}, '.format(tileID) + '${0:02x}\n'.format(attr)

        prevOffset = ptrOffset + 4
        i += 1

    print(reader.getDataString(offset, prevOffset - offset, 'OAM_').format(ptrTableStr + '\n' + outStr))