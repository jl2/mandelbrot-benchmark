mandelbrot: mandelbrot.pas Makefile
	fpc	mandelbrot.pas

timed: mandelbrot Makefile
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
