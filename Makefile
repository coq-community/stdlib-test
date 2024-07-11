all:
	dune build -p coq-stdlib @install

install:
	dune install coq-stdlib

# Make of individual .vo
theories/%.vo:
	dune build $@

refman-html:
	dune build --no-buffer @refman-html

stdlib-html:
	dune build @stdlib-html
