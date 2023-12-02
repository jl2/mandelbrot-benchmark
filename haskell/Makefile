mandelbrot: mandelbrot.hs Makefile
	ghc	-O3 --make mandelbrot.hs

timed: mandelbrot Makefile
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
