import reader
import argparse

parser = argparse.ArgumentParser(description='Parse OAM data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of OAM data')

args = parser.parse_args()

def getSigned(x):
    return (x - 0x100, x)[x < 0x80]

def getOAM(data):
    offset = 0
    yCoords = []
    xCoords = []
    tileIDs = []
    attrs = []

    while (offset < len(data)):
        yCoords.append(getSigned(data[offset + 0]))
        xCoords.append(getSigned(data[offset + 1]))
        tileIDs.append(data[offset + 2])
        attrs.append(data[offset + 3])
        offset = offset + 4

    return [yCoords, xCoords, tileIDs, attrs]

def getPointers(offset):
    curOffset = offset
    curBank = int(offset / 0x4000) # round down

    ptrs = []

    while True:
        hiPtr = int.from_bytes(reader.getROMByte(curOffset + 1), 'little')
        loPtr = int.from_bytes(reader.getROMByte(curOffset + 0), 'little')

        # empty frame is given in offset 0x1826, it's not an invalid pointer
        if  (hiPtr < 0x40 or hiPtr >= 0x80) and not (hiPtr == 0x18 and loPtr == 0x26):
            break # exit condition

        ptrs.append(reader.getPointerAt(curOffset, curBank))
        curOffset += 2

    return ptrs

def getOAMBytes(offset):
    byteArray = []

    while (int.from_bytes(reader.getROMByte(offset), 'little') != 0x80):
        byteArray.extend(reader.getROMBytes(offset, 4))
        offset = offset + 4

    return byteArray

def getAttributesString(attr):
    outStr = ("{0:01x} | ".format(attr & 0b111))

    if ((attr & 0x08) != 0):
        outStr += ("OAMF_BANK1 | ")
    if ((attr & 0x10) != 0):
        outStr += ("OBP_NUM | ")
    if ((attr & 0x20) != 0):
        outStr += ("OAMF_XFLIP | ")
    if ((attr & 0x40) != 0):
        outStr += ("OAMF_YFLIP | ")
    if ((attr & 0x80) != 0):
        outStr += ("OAMF_PRI | ")

    outStr = outStr[:-3]
    return outStr


for offsetStr in reader.standardiseList(args.offsets):
    offset = int(offsetStr, 16)
    outStr = ''

    ptrs = getPointers(offset)
    ptrTableStr = ''
    i = 0

    prevOffset = offset + 2 * len(ptrs)

    for ptrOffset in ptrs:
        if ptrOffset == 0x1826:
            ptrTableStr += '\tdw EmptyOAMFrame\n'
        else:
            ptrTableStr += '\tdw .frame_{}\n'.format(i)

            yCoords, xCoords, tileIDs, attrs = getOAM(getOAMBytes(ptrOffset))

            outStr += '\n.frame_{}\n'.format(i)

            for j in range(len(yCoords)):
                outStr += '\tframe_oam ' + '{0:3}, '.format(yCoords[j]) + '{0:3}, '.format(xCoords[j]) + '${0:02x}, '.format(tileIDs[j]) + getAttributesString(attrs[j]) + '\n'
            
            outStr += '\tdb $80\n'

            prevOffset = ptrOffset + 4 * len(yCoords) + 1
        i += 1

    print(reader.getDataString(offset, prevOffset - offset, 'OAM_').format(ptrTableStr + outStr))