import reader
import argparse

parser = argparse.ArgumentParser(description='Parse frameset data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of frameset data')

args = parser.parse_args()

for offsetStr in reader.standardiseList(args.offsets):
    offset = int(offsetStr, 16)
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

    print(reader.getDataString(offset, curOffset - offset, 'Frameset_', True).format(outStr))