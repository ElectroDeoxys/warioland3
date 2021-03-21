import reader
import argparse

parser = argparse.ArgumentParser(description='Parse palette data.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='offsets of pal data')
parser.add_argument('-n', metavar='num', dest='num', type=int, nargs=1, default=[1],
                    help='number of pals for each offset')

args = parser.parse_args()

def getRGB(data):
    red = data[0] & 0b00011111
    green = ((data[0] & 0b11100000) >> 5) + ((data[1] & 0b00000011) << 3)
    blue = (data[1] & 0b01111100) >> 2
    return [red, green, blue]

for offsetStr in args.offsets:
    offset = int(offsetStr, 16)
    curOffset = offset
    outStr = ''

    for x in range(args.num[0]):
        for col in range(4):
            red, green, blue = getRGB(reader.getROMBytes(curOffset, 2))
            outStr += '\trgb ' + '{0:2}, '.format(red) + '{0:2}, '.format(green) + '{0:2}\n'.format(blue)
            curOffset += 2

        if x != args.num[0] - 1:
            outStr += '\n'

    print(reader.getDataString(offset, 2 * 4 * args.num[0], 'Pals_').format(outStr))