mandelbrot: mandelbrot.f90 Makefile
	gfortran -O3 -o mandelbrot mandelbrot.f90

mandelbrot.s: mandelbrot.f90 Makefile
	gfortran -O3 -S -o mandelbrot.s mandelbrot.f90

mandelbrot-debug: mandelbrot.f90 Makefile
	gfortran -g -o mandelbrot-debug mandelbrot.f90

timed: mandelbrot Makefile
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
