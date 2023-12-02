mandelbrot: mandelbrot.f90 Makefile
	gfortran -O3 -o mandelbrot mandelbrot.f90

timed: mandelbrot Makefile
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
