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

# Ideally this would be generated from .nix/config.nix, currently obtained with
# % grep -B1 "needs:" .github/workflows/nix-action-coq-master.yml | grep -v "\-\-" | grep -v "needs:" | sed -e 's/:/ \\/;s/  /  ci-/'
CI_TARGETS= \
  ci-Cheerios \
  ci-CoLoR \
  ci-ITree \
  ci-InfSeqExt \
  ci-MenhirLib \
  ci-QuickChick \
  ci-StructTact \
  ci-Verdi \
  ci-VerdiRaft \
  ci-aac-tactics \
  ci-argosy \
  ci-async-test \
  ci-atbr \
  ci-autosubst \
  ci-bbv \
  ci-bedrock2 \
  ci-bignums \
  ci-bignums-test \
  ci-category-theory \
  ci-ceres \
  ci-coinduction \
  ci-compcert \
  ci-coq \
  ci-coq-elpi \
  ci-coq-elpi-test \
  ci-coq-ext-lib \
  ci-coq-hammer \
  ci-coq-hammer-tactics \
  ci-coq-performance-tests \
  ci-coq-tools \
  ci-coqprime \
  ci-coquelicot \
  ci-coqutil \
  ci-corn \
  ci-cross-crypto \
  ci-deriving \
  ci-dpdgraph-test \
  ci-engine-bench \
  ci-equations \
  ci-equations-test \
  ci-fcsl-pcm \
  ci-fiat-crypto \
  ci-fiat-crypto-legacy \
  ci-fiat-parsers \
  ci-flocq \
  ci-fourcolor \
  ci-hierarchy-builder \
  ci-hierarchy-builder-test \
  ci-http \
  ci-iris \
  ci-iris-examples \
  ci-itauto \
  ci-itree-io \
  ci-jasmin \
  ci-json \
  ci-kami \
  ci-math-classes \
  ci-mathcomp \
  ci-mathcomp-algebra \
  ci-mathcomp-analysis \
  ci-mathcomp-bigenough \
  ci-mathcomp-character \
  ci-mathcomp-classical \
  ci-mathcomp-field \
  ci-mathcomp-fingroup \
  ci-mathcomp-finmap \
  ci-mathcomp-solvable \
  ci-mathcomp-ssreflect \
  ci-mathcomp-test \
  ci-mathcomp-word \
  ci-mathcomp-zify \
  ci-metacoq \
  ci-metacoq-erasure \
  ci-metacoq-pcuic \
  ci-metacoq-safechecker \
  ci-metacoq-template-coq \
  ci-metacoq-test \
  ci-mtac2 \
  ci-neural-net-coq-interp \
  ci-odd-order \
  ci-paco \
  ci-paramcoq-test \
  ci-parsec \
  ci-perennial \
  ci-quickchick-test \
  ci-relation-algebra \
  ci-rewriter \
  ci-riscvcoq \
  ci-rupicola \
  ci-sf \
  ci-simple-io \
  ci-smtcoq \
  ci-smtcoq-trakt \
  ci-stalmarck \
  ci-stalmarck-tactic \
  ci-stdlib \
  ci-stdlib-html \
  ci-stdlib-refman-html \
  ci-stdlib-subcomponents \
  ci-stdlib-test \
  ci-stdpp \
  ci-tlc \
  ci-trakt \
  ci-unicoq \
  ci-vst \
  ci-waterproof

ci-all: $(CI_TARGETS)

$(CI_TARGETS):
	nix-build --argstr job $${$@#ci-}

.PHONY: ci-all $(CI_TARGETS)
