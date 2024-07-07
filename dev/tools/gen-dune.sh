#!/bin/sh

TO_FLATTEN="\
  Classes/All \
  Classes/Arith \
  Classes/Lists \
  Logic/Base \
  Logic/Classical \
  Logic/Lists \
  Numbers/Arith \
  Numbers/Lists \
  Numbers/positive \
  Numbers/Q \
  Numbers/R \
  Numbers/Strings \
  Numbers/Z \
  Structures/Def \
  Structures/Ex \
"

DIRS=$(for d in ${TO_FLATTEN} ; do echo ${d%/*} ; done | uniq)

for d in ${DIRS} ; do
  echo "; generated by ${0}" > theories/${d}/dune
done

for d in ${TO_FLATTEN} ; do
  echo "; generated by ${0}" > theories/${d}/dune
  echo "(include_subdirs no)" >> theories/${d}/dune

  for f in $(ls theories/${d}/*.v) ; do
    TARGET=$(basename ${f})
    DEP="${d#*/}/${TARGET}"
    echo "(rule (target ${TARGET}) (deps ${DEP}) (action (run mv %{deps} %{target})))" >> theories/${d%/*}/dune
  done
done
