_build/default/bin/main.exe: bin/main.ml Makefile
	dune build

timed: _build/default/bin/main.exe Makefile
	time ./_build/default/bin/main.exe  > /dev/null

clean:
	rm -Rf target
	cargo clean

.PHONY: clean timed
