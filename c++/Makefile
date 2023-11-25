mandelbrot: main.cpp Makefile
	g++ -O3 --std=c++2b -ffast-math -o mandelbrot main.cpp

mandelbrot.s: main.cpp Makefile
	g++ -O3 --std=c++2b -ffast-math -o mandelbrot.s -S main.cpp

mandelbrot-debug: main.cpp Makefile
	g++  -g --std=c++2b -o mandelbrot-debug main.cpp

timed: mandelbrot
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
