import mmap
from math import floor as floor

def getROMBytes(offset, len):
    with open('baserom.gbc') as rom:
        romMap = mmap.mmap(rom.fileno(), 0, access=mmap.ACCESS_READ)
        return romMap[offset : offset + len]

def getROMByte(offset):
    return getROMBytes(offset, 1)

def absOffsetToRel(offset):
    if offset >= 0x4000:
        return (offset % 0x4000) + 0x4000
    else:
        return offset

def standardiseList(offsets):
    offsetsSorted = sorted(offsets)
    return list(dict.fromkeys(offsetsSorted))

def getDataString(offset, len, suffix = 'Data_'):
    outStr = suffix + '{:0x}'.format(offset)
    outStr += ': ; {:0x} ('.format(offset) + str(floor(offset / 0x4000)) + ':' + '{:0x}'.format(absOffsetToRel(offset)) + ')\n'
    outStr += '{}' # for inserting the content
    outStr += '; 0x{:0x}\n'.format(offset + len)
    return outStr