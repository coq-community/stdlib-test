{ antlr4_9, python311, coq, stdlib, coqPackages }:

coqPackages.lib.overrideCoqDerivation {
  pname = "stdlib-refman-html";

  overrideBuildInputs = stdlib.buildInputs ++ [ coq.ocamlPackages.ocaml coq.ocamlPackages.dune_3 stdlib ]
  ++ [
    # Sphinx doc dependencies
    (python311.withPackages
      (ps: [ ps.sphinx ps.sphinx_rtd_theme ps.pexpect ps.beautifulsoup4
             (ps.antlr4-python3-runtime.override {antlr4 = antlr4_9;}) ps.sphinxcontrib-bibtex ]))
    antlr4_9
  ];

  buildFlags = [ "refman-html" ];

  installPhase = ''
    echo "nothing to install"
    touch $out
  '';
} stdlib
