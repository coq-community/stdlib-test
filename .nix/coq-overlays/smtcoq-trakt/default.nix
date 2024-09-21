{ smtcoq, trakt, coqPackages, version ? null }:
coqPackages.lib.overrideCoqDerivation {
  pname = "smtcoq-trakt";
  inherit version;
  overrideBuildInputs = smtcoq.buildInputs ++ [ trakt ];
} smtcoq
