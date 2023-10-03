import reader
import argparse

parser = argparse.ArgumentParser(description='Parse frameset data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of frameset data')
parser.add_argument("-c", dest="continuous", action="store_true")

args = parser.parse_args()

def parseFrameset(offset):
    curOffset = offset
    outStr = ''

    while True:
        data = reader.getROMBytes(curOffset, 2)
        if data[0] == 0xff:
            outStr += '\tdb $ff\n'
            curOffset += 1
            break

        curOffset += 2
        outStr += '\tdb ${0:02x}'.format(data[0]) + ', {0:2}\n'.format(data[1])

    print(reader.getDataString(offset, curOffset - offset, '; unreferenced\nFrameset_', False).format(outStr))
    return curOffset

if not args.continuous:
    for offsetStr in reader.standardiseList(args.offsets):
        parseFrameset(int(offsetStr, 16))
else:
    endOffset = int(args.offsets[1], 16)

    curOffset = int(args.offsets[0], 16)
    while (curOffset < endOffset):
        curOffset = parseFrameset(curOffset)
