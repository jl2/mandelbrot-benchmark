# Mandelbrot Set Benchmark

This is a comparison of simple Mandelbrot set compiled in four languages.

Rather than get the fastest possible time, the goal is to get a general sense
of how well each compiler optimizes roughly the same algorithm implemented
the same way.

# Timeings for 16000x6000

## C++
14.45user 0.00system 0:14.46elapsed 99%CPU (0avgtext+0avgdata 3264maxresident)k

## Clang++
15.85user 0.00system 0:15.85elapsed 99%CPU (0avgtext+0avgdata 3456maxresident)k

## Lisp
20.33user 0.01system 0:20.34elapsed 99%CPU (0avgtext+0avgdata 52848maxresident)k

## Rust
36.87user 0.02system 0:36.91elapsed 99%CPU (0avgtext+0avgdata 2112maxresident)k

## Go
32.27user 21.95system 0:53.89elapsed 100%CPU (0avgtext+0avgdata 3156maxresident)k

