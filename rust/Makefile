target/debug/manbdelbrot: src/main.rs Makefile
	cargo build

target/release/mandelbrot: src/main.rs Makefile
	cargo  build --release

timed: target/release/mandelbrot
	time ./target/release/mandelbrot  > /dev/null

clean:
	rm -Rf target
	cargo clean

.PHONY: clean timed
