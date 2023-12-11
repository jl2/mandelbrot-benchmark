# Mandelbrot Set Benchmark

This is a comparison of simple Mandelbrot set compiled in four languages.

Rather than get the fastest possible time, the goal is to get a general sense
of how well each compiler optimizes roughly the same algorithm implemented
the same way.

## Methodology
The timings below are for 16000x6000 images with 64 iterations.

I generated images with 1600x600 and 32 iterations to test that all algorithms
created exactly the same output.   Presumably the larger 16000x6000 images
should all be exactly the same, too.

# Micro-optimizations
While running the benchmarks I've noticed a couple of things that can easily
speed up some of the code here.  Mostly in Common Lisp and C++, because those
are the languages I'm most familiar with, and know how to spot some "gotchas".

## No (abs z)
In the disassembly, I noticed Common Lisp's complex (abs z) is calling the
 C library's hypot() function. Replacing `(> (abs z) 2.0)` with
`(> (+ (* (realpart z) (realpart z)) (* (imagpart z) (imagpart z))) 4.0d0)`
speeds it up by almost 100%.

## -ffastmath
Despite "-ffastmath" being possibly "dangerous" for giving incorrect results,
the results were "pixel perfect" for all of the mandelbrot images I
checked with diff.

# Versions

g++ (Debian 13.2.0-5) 13.2.0

Debian clang version 16.0.6 (16)

rustc 1.62.0-nightly (879aff385 2022-04-20)

SBCL 2.3.10.159-05f2adf1e

go version go1.21.4 linux/amd64

Python 3.11.6

The OCaml toplevel, version 4.14.1

GNU Fortran (Debian 13.2.0-7) 13.2.0

GNAT 13.2.0

Free Pascal Compiler version 3.2.2+dfsg-22 [2023/09/04] for x86_64

# Timings
At 16000x6000 and 64 iterations

Note: Ada, Go and Fortran aren't buffering output, so the timing is dominated by
write() system call time 😒

## Clang++ Fastmath
4.41user 0.00system 0:04.41elapsed 100%CPU (0avgtext+0avgdata 3264maxresident)k

## G++ Fastmath
4.78user 0.01system **0:04.79elapsed** 99%CPU (0avgtext+0avgdata 3072maxresident)k

## G++
5.16user 0.00system **0:05.17elapsed** 99%CPU (0avgtext+0avgdata 3264maxresident)k

## Clang++
7.99user 0.00system 0:07.99elapsed 99%CPU (0avgtext+0avgdata 3264maxresident)k

## Rust
9.08user 0.01system 0:09.10elapsed 99%CPU (0avgtext+0avgdata 1728maxresident)k

## SBCL
9.60user 0.00system 0:09.61elapsed 99%CPU (0avgtext+0avgdata 54136maxresident)k

## OCaml
13.53user 0.00system 0:13.55elapsed 99%CPU (0avgtext+0avgdata 3840maxresident)k

## Ada
16.18user 19.09system 0:35.28elapsed 99%CPU (0avgtext+0avgdata 3840maxresident)k

## Go
26.08user 22.32system **0:48.03elapsed** 100%CPU (0avgtext+0avgdata 3152maxresident)k

## Fortran
33.00user 19.77system 0:52.78elapsed 99%CPU (0avgtext+0avgdata 2112maxresident)k

## Python 3.11
179.88user 0.13system **3:00.04elapsed** 99%CPU (0avgtext+0avgdata 9792maxresident)k
