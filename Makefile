all:
	+$(MAKE) -C theories

install:
	+$(MAKE) -C theories install

build-% install-%:
	+$(MAKE) -C theories $@

# Make of individual .vo
theories/%.vo:
	+$(MAKE) -C theories ${@#theories/}

refman-html:
	dune build --no-buffer @refman-html

HEADER=doc/common/styles/html/coqremote/header.html
FOOTER=doc/common/styles/html/coqremote/header.html

stdlib-html: all doc/stdlib/index-list.html
	mkdir -p html
	cp doc/stdlib/depends.png html/
	coqdoc -q -d html --with-header $(HEADER) --with-footer $(FOOTER) --multi-index --html -g -R theories Stdlib $(shell find theories -name "*.v")
	mv html/index.html html/genindex.html
	cat $(HEADER) doc/stdlib/index-list.html $(FOOTER) > html/index.html

doc/stdlib/depends.png: doc/stdlib/depends
	dot -Tpng $< -o $@

doc/stdlib/index-list.html: doc/stdlib/depends.png doc/stdlib/make-library-index doc/stdlib/index-list.html.template doc/stdlib/hidden-files
	doc/stdlib/make-library-index doc/stdlib/index-list.html doc/stdlib/hidden-files
