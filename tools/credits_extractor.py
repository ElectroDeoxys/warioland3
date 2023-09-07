import reader

curOffset = 0x161d0f
outStr = ''

while (curOffset < 0x1620e5):
    strBytes = []

    while (reader.getROMByte(curOffset)[0] != 0x7f):
        b = reader.getROMByte(curOffset)[0]
        curOffset += 1

        if b == 0x7e:
            b = 0x20 # ASCII for space
        elif 0x50 <= b and b < 0x6a:
            b -= 0xf # letter
        elif 0x6a <= b and b < 0x73:
            b -= 0x39 # number

        strBytes.append(b)

    curOffset += 1
    strBytes.append(0x40) # ASCII @

    str = "".join([chr(x) for x in strBytes])
    outStr += "\tdb \"{}\"\n".format(str)

print(outStr)
