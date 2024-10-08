(lang dune 3.8)
(name coq-stdlib)

; We use directory targets in documentation
(using directory-targets 0.1)

; We need this due to `(coq.pp )` declarations
(using coq 0.8)

(formatting
 (enabled_for ocaml))

(generate_opam_files true)

(license LGPL-2.1-only)
(maintainers "The Coq standard library development team")
(authors "The Coq development team, INRIA, CNRS, and contributors")
; This generates bug-reports and dev-repo
(source (github coq/coq))
(homepage https://coq.inria.fr/)
(documentation "https://coq.github.io/doc/")
(version dev)

(package
 (name coq-stdlib)
 (depends
  coq-core
  (rocq-init (= :version)))
 (depopts coq-native)
 (synopsis "The Coq Proof Assistant -- Standard Library")
 (description "Coq is a formal proof management system. It provides
a formal language to write mathematical definitions, executable
algorithms and theorems together with an environment for
semi-interactive development of machine-checked proofs.

Typical applications include the certification of properties of
programming languages (e.g. the CompCert compiler certification
project, or the Bedrock verified low-level programming library), the
formalization of mathematics (e.g. the full formalization of the
Feit-Thompson theorem or homotopy type theory) and teaching.

This package includes the Coq Standard Library, that is to say, the
set of modules usually bound to the Stdlib.* namespace."))

(package
 (name coq-stdlib-doc)
 (license "OPUBL-1.0")
 (depends
  (conf-python-3 :build)
  (coq (and :build (= :version))))
 (synopsis "The Coq Proof Assistant Standard Library --- Reference Manual")
 (description "Coq is a formal proof management system. It provides
a formal language to write mathematical definitions, executable
algorithms and theorems together with an environment for
semi-interactive development of machine-checked proofs.

This package provides the Reference Manual for the Standard Library."))
