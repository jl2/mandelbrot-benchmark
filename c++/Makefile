mandelbrot: main.cpp Makefile
	g++ -O3 --std=c++23 -o mandelbrot main.cpp

mandelbrot.s: main.cpp Makefile
	g++ -O3 --std=c++23 --fast-math -o mandelbrot.s -S main.cpp

mandelbrot-debug: main.cpp Makefile
	g++  -g --std=c++23 -o mandelbrot-debug main.cpp

timed: mandelbrot
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
