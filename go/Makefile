mandelbrot: mandelbrot.go Makefile
	go build mandelbrot.go

mandel.s: mandelbrot.go Makefile
	go build -gcflags -S mandelbrot.go

timed: mandelbrot
	time ./mandelbrot > /dev/null

clean:
	rm -Rf mandelbrot

.PHONY: clean timed
