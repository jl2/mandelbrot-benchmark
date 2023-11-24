mandelbrot: main.cpp Makefile
	clang++ -O3 --std=c++2b -o mandelbrot main.cpp

mandelbrot.s: main.cpp Makefile
	clang++ -O3 --std=c++2b --fast-math -o mandelbrot.s -S main.cpp

mandelbrot-debug: main.cpp Makefile
	clang++  -g --std=c++2b -o mandelbrot-debug main.cpp

timed: mandelbrot
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
