{ mkCoqDerivation, coq-elpi, version ? null }:

mkCoqDerivation {
  pname = "hierarchy-builder-test";
  repo = "hierarchy-builder";
  owner = "math-comp";
  inherit version;

  propagatedBuildInputs = [ coq-elpi ];

  buildFlags = [ "test-suite" ];

  installPhase = ''
    echo "nothing to install"
  '';
}
