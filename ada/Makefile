mandelbrot: mandelbrot.adb Makefile
	gnat make -gnat2022 -O3 -o mandelbrot mandelbrot.adb

mandelbrot.s: mandelbrot.adb Makefile
	gnat compile -gnat2022 -O3 -S -o mandelbrot.s mandelbrot.adb

mandelbrot-debug: mandelbrot.adb Makefile
	gnat make -gnat2022 -g -o mandelbrot-debug mandelbrot.adb

timed: mandelbrot Makefile
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
