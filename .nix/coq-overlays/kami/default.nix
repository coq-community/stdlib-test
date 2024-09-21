let
  fetcher = { domain, owner, repo, rev, sha256 ? null, ...}:
    fetchGit {
      url = "https://${domain}/${owner}/${repo}";
      ref = rev;
      submodules = true;
    };
in

{ lib, mkCoqDerivation, coq, stdlib, version ? null }:

mkCoqDerivation {
  pname = "kami";
  owner = "mit-plv";
  inherit version fetcher;
  defaultVersion = null;  # no released version

  propagatedBuildInputs = [ stdlib ];
}
