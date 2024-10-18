let
  fetcher = { domain, owner, repo, rev, sha256 ? null, ...}:
    fetchGit {
      url = if owner == "mit-plv" then "https://${domain}/${owner}/fiat-crypto"
        else "https://${domain}/${owner}/${repo}";
      ref = rev;
      submodules = true;
    };
in

{ lib, python3, mkCoqDerivation, coq, kami, riscvcoq, version ? null }@args:

mkCoqDerivation {
  pname = "bedrock2";
  owner = "mit-plv";
  inherit version fetcher;
  defaultVersion = null;  # no released version

  nativeBuildInputs = [ python3 ];
  propagatedBuildInputs = [ kami riscvcoq ];

  makeFlags = [ "EXTERNAL_COQUTIL=1" "EXTERNAL_RISCV_COQ=1" "EXTERNAL_KAMI=1" ];

  preBuild = ''
    for f in $(find . -name "*.sh") ; do patchShebangs $f ; done
    for f in $(find . -name "*.py") ; do patchShebangs $f ; done
    cd rupicola/bedrock2 || true
  '';
}
