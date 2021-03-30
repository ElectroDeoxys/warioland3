import mmap
from math import floor as floor

def getROMBytes(offset, len):
# get len number of bytes from offset
    with open('baserom.gbc') as rom:
        romMap = mmap.mmap(rom.fileno(), 0, access=mmap.ACCESS_READ)
        return romMap[offset : offset + len]

def getROMByte(offset):
# get one byte from offset
    return getROMBytes(offset, 1)

def getPointerAt(offset, bank):
# returns the abs offset of pointer at offset
    return pointerBytesToBankOffset(getROMBytes(offset, 2), bank)

def absOffsetToRel(offset):
    if offset >= 0x4000:
        return (offset % 0x4000) + 0x4000
    else:
        return offset

def pointerBytesToOffset(ptrBytes):
    assert(len(ptrBytes) == 3)
    return pointerBytesToBankOffset(ptrBytes[1:2], ptrBytes[0])

def pointerBytesToBankOffset(ptrBytes, bank):
    assert(len(ptrBytes) == 2)
    if bank == 0:
        return ptrBytes[0] + ptrBytes[1] * 0x100
    else:
        return (bank * 0x4000) + (ptrBytes[0] + ptrBytes[1] * 0x100) - 0x4000

def standardiseList(ls):
# sorts list 
    listSorted = sorted(ls)
    return list(dict.fromkeys(listSorted))

def offsetHeaderStr(offset):
    return '; {:0x} ('.format(offset) + '{:02x}:'.format(floor(offset / 0x4000)) + '{:0x}'.format(absOffsetToRel(offset)) + ')\n'

def getDataString(offset, len, suffix = 'Data_'):
    outStr = suffix + '{:0x}'.format(offset)
    outStr += ': ' + offsetHeaderStr(offset)
    outStr += '{}' # for inserting the content
    outStr += '; 0x{:0x}\n'.format(offset + len)
    return outStr