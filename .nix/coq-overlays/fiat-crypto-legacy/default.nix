let
  fetcher = { domain, owner, repo, rev, sha256 ? null, ...}:
    fetchGit {
      url = "https://${domain}/${owner}/${repo}";
      ref = rev;
      submodules = true;
    };
in

{ lib, python3, mkCoqDerivation, coq, coqprime, version ? null }@args:

mkCoqDerivation {
  pname = "fiat-crypto-legacy";
  repo = "fiat-crypto";
  owner = "mit-plv";
  inherit version fetcher;
  defaultVersion = null;  # no released version

  nativeBuildInputs = [ python3 ];
  propagatedBuildInputs = [ coqprime ];

  mlPlugin = true;

  preBuild = ''
    for f in $(find . -name "*.sh") ; do patchShebangs $f ; done
    for f in $(find . -name "*.py") ; do patchShebangs $f ; done
  '';

  buildFlags = [ "print-old-pipeline-lite-hardcoded" "old-pipeline-lite-hardcoded" "lite-display-hardcoded" "print-old-pipeline-nobigmem-hardcoded" "old-pipeline-nobigmem-hardcoded" "nonautogenerated-specific" "nonautogenerated-specific-display" "selected-specific" "selected-specific-display" ];

  installPhase = ''
    echo "not installing anything"
  '';
}
