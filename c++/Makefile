mandelbrot-clang++: main.cpp Makefile
	clang++ -O3 -funsafe-math-optimizations -ffast-math --std=c++2b -o mandelbrot-clang main.cpp

mandelbrot-g++: main.cpp Makefile
	g++ -O3 -funsafe-math-optimizations --std=c++2b -ffast-math -o mandelbrot-g++ main.cpp

mandelbrot-g++.s: main.cpp Makefile
	g++ -O3 -funsafe-math-optimizations --std=c++2b -ffast-math -o mandelbrot-g++.s -S main.cpp

mandelbrot-clang++.s: main.cpp Makefile
	clang++ -s -O3 -funsafe-math-optimizations --std=c++2b -ffast-math -o mandelbrot-clang++-annot.s main.cpp

mandelbrot-debug: main.cpp Makefile
	g++ -g --std=c++2b -o mandelbrot-debug main.cpp

timed: mandelbrot-clang++
	time ./mandelbrot-clang > /dev/null

clean:
	rm -Rf mandelbrot-*g++  mandelbrot*.s

.PHONY: clean timed
