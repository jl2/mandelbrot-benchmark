
mandelbrot: manifest.txt *.lisp *.asd Makefile
	buildapp --output mandelbrot \
             --manifest-file ~/src/mandelbrot-benchmark/lisp/manifest.txt \
             --load-system asdf \
	         --load-system sb-posix \
             --asdf-path . \
             --load-system stdout-mandelbrot \
             --entry 'stdout-mandelbrot:main'

manifest.txt: *.asd Makefile
	sbcl --no-userinit \
         --no-sysinit \
         --non-interactive \
         --load ~/quicklisp/setup.lisp \
		 --eval '(ql:write-asdf-manifest-file "~/src/mandelbrot-benchmark/lisp/manifest.txt")'

timed: mandelbrot
	time ./mandelbrot  > /dev/null

clean:
	rm -Rf manifest.txt  *.fasl

.PHONY: clean timed
