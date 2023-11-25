#!/usr/bin/env python3

import sys
import math
import cmath

def mandelbrot():
    width = 16000
    height = 6000
    min = complex(-2.1, -1.2)
    max = complex(0.6, 1.2)
    iterations = 64
    colors = "abcdefhij.-+*%#$@ "

    inc_real = complex((max-min).real/width,
                       0.0)
    inc_imag = complex(0.0,
                       (max - min).imag/height)

    for row in range(height):
        row_val = min + (inc_imag * row)
        for col in range(width):
            c = row_val + inc_real * col
            iter_count = 0
            z = c
            while (iter_count < iterations and abs(z) < 2.0):
                iter_count += 1
                z = z * z+ c
            color_idx = math.trunc(((len(colors)-1) * iter_count) / iterations)
            print(colors[color_idx], end='')
        print("")
 
def main(args):
    mandelbrot()
    return 0

if __name__=="__main__":
    sys.exit(main(sys.argv[1:]))
