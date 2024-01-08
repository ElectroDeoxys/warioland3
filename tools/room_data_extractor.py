import reader
import argparse

parser = argparse.ArgumentParser(description='Parse room data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of room data')

args = parser.parse_args()

def getSigned(x):
    return (x - 0x100, x)[x < 0x80]

def getRoom(data):
    spawnX = data[0] & 0x0f
    spawnY = (data[0] & 0xf0) >> 4
    unk1 = data[1] & 0x0f
    unk2 = (data[1] & 0xf0) >> 4
    unk3 = data[2] & 0x0f
    unk4 = (data[2] & 0xf0) >> 4
    camConfig = data[3]
    enemyGroup = data[4]
    animatedTileGroup = data[5]
    palCycle = data[6]
    roomID = data[7]

    return [spawnX, spawnY, unk1, unk2, unk3, unk4, camConfig, enemyGroup, animatedTileGroup, palCycle, roomID]

def getPointers(offset):
    curOffset = offset
    ptrs = []

    while True:
        hiPtr = int.from_bytes(reader.getROMByte(curOffset + 1), 'little')
        loPtr = int.from_bytes(reader.getROMByte(curOffset + 0), 'little')

        if  (hiPtr < 0x40 or hiPtr >= 0x80) and not (hiPtr == 0xff and loPtr == 0xff):
            break # exit condition

        if (hiPtr == 0xff and loPtr == 0xff):
            ptrs.append(0xffff)
        else:
            ptrs.append(reader.getPointerAt(curOffset))
        curOffset += 2

    return ptrs

def getRoomBytes(offset):
    return reader.getROMBytes(offset, 8)

def getCamConfigString(attr):
    if (attr == 0):
        return "CAM_YSCROLL"

    outStr = ''

    if ((attr & 0x01) != 0):
        outStr += ("CAM_FREE | ")
    if ((attr & 0x02) != 0):
        outStr += ("CAM_XSCROLL1 | ")
    if ((attr & 0x04) != 0):
        outStr += ("CAM_XSCROLL2 | ")
    if ((attr & 0x08) != 0):
        outStr += ("CAM_TRANSITIONS | ")
    if ((attr & 0x10) != 0):
        outStr += ("CAM_BORDER_RIGHT | ")
    if ((attr & 0x20) != 0):
        outStr += ("CAM_BORDER_LEFT | ")
    if ((attr & 0x40) != 0):
        outStr += ("CAM_BORDER_UP | ")
    if ((attr & 0x80) != 0):
        outStr += ("CAM_BORDER_DOWN | ")

    outStr = outStr[:-3]
    return outStr


for offsetStr in reader.standardiseList(args.offsets):
    offset = int(offsetStr, 16)
    outStr = ''

    ptrs = getPointers(offset)
    ptrTableStr = ''

    i = 0
    pointersDict = {}
    prevOffset = offset + 2 * len(ptrs)

    for ptrOffset in ptrs:
        if ptrOffset == 0xffff:
            ptrTableStr += '\tdw NULL\n'
        else:
            ptrTableStr += '\tdw .room_{0:02}\n'.format(i)
            
            if ptrOffset in pointersDict:
                pointersDict[ptrOffset].append(i)
            else:
                pointersDict[ptrOffset] = [ i ]
        i += 1

    for ptr, rooms in pointersDict.items():
        spawnX, spawnY, unk1, unk2, unk3, unk4, camConfig, enemyGroup, animatedTileGroup, palCycle, roomID = getRoom(getRoomBytes(ptr))

        for room in rooms:
            outStr += '.room_{0:02}\n'.format(room)
        outStr += '\troom_data ' + '{0:2}, '.format(spawnX) + '{0:2}, '.format(spawnY) + '${0:1x}, '.format(unk1) + '${0:1x}, '.format(unk2) + '${0:1x}, '.format(unk3) + '${0:1x}, '.format(unk4) + getCamConfigString(camConfig) + ', ENEMY_GROUP_{0:03}, '.format(enemyGroup) + 'ANIMATED_TILES_GROUP_{0:02}, '.format(animatedTileGroup) + '{0:2}, '.format(palCycle) + 'ROOM_{0:03}\n'.format(roomID)
        
        prevOffset = ptrOffset + 8

    print(reader.getDataString(offset, prevOffset - offset, 'LevelRooms_', False).format(ptrTableStr + '\n' + outStr))