(* DO NOT EDIT THIS FILE: automatically generated by ./gen_compare.sh *)
Require Import ZArith Floats.
Local Open Scope float_scope.

Definition min_denorm := Eval compute in Z.ldexp one (-1074)%Z.

Definition min_norm := Eval compute in Z.ldexp one (-1024)%Z.

Check (eq_refl : nan =? nan = false).
Check (eq_refl : nan =? nan = false).

Check (eq_refl : nan <? nan = false).
Check (eq_refl : nan <? nan = false).

Check (eq_refl : nan <=? nan = false).
Check (eq_refl : nan <=? nan = false).

Check (eq_refl : nan ?= nan = FNotComparable).
Check (eq_refl : nan ?= nan = FNotComparable).

Check (eq_refl : nan =? - nan = false).
Check (eq_refl : - nan =? nan = false).

Check (eq_refl : nan <? - nan = false).
Check (eq_refl : - nan <? nan = false).

Check (eq_refl : nan <=? - nan = false).
Check (eq_refl : - nan <=? nan = false).

Check (eq_refl : nan ?= - nan = FNotComparable).
Check (eq_refl : - nan ?= nan = FNotComparable).

Check (eq_refl : one =? one = true).
Check (eq_refl : one =? one = true).

Check (eq_refl : one <? one = false).
Check (eq_refl : one <? one = false).

Check (eq_refl : one <=? one = true).
Check (eq_refl : one <=? one = true).

Check (eq_refl : one ?= one = FEq).
Check (eq_refl : one ?= one = FEq).

Check (eq_refl : zero =? zero = true).
Check (eq_refl : zero =? zero = true).

Check (eq_refl : zero <? zero = false).
Check (eq_refl : zero <? zero = false).

Check (eq_refl : zero <=? zero = true).
Check (eq_refl : zero <=? zero = true).

Check (eq_refl : zero ?= zero = FEq).
Check (eq_refl : zero ?= zero = FEq).

Check (eq_refl : zero =? - zero = true).
Check (eq_refl : - zero =? zero = true).

Check (eq_refl : zero <? - zero = false).
Check (eq_refl : - zero <? zero = false).

Check (eq_refl : zero <=? - zero = true).
Check (eq_refl : - zero <=? zero = true).

Check (eq_refl : zero ?= - zero = FEq).
Check (eq_refl : - zero ?= zero = FEq).

Check (eq_refl : - zero =? - zero = true).
Check (eq_refl : - zero =? - zero = true).

Check (eq_refl : - zero <? - zero = false).
Check (eq_refl : - zero <? - zero = false).

Check (eq_refl : - zero <=? - zero = true).
Check (eq_refl : - zero <=? - zero = true).

Check (eq_refl : - zero ?= - zero = FEq).
Check (eq_refl : - zero ?= - zero = FEq).

Check (eq_refl : infinity =? infinity = true).
Check (eq_refl : infinity =? infinity = true).

Check (eq_refl : infinity <? infinity = false).
Check (eq_refl : infinity <? infinity = false).

Check (eq_refl : infinity <=? infinity = true).
Check (eq_refl : infinity <=? infinity = true).

Check (eq_refl : infinity ?= infinity = FEq).
Check (eq_refl : infinity ?= infinity = FEq).

Check (eq_refl : - infinity =? - infinity = true).
Check (eq_refl : - infinity =? - infinity = true).

Check (eq_refl : - infinity <? - infinity = false).
Check (eq_refl : - infinity <? - infinity = false).

Check (eq_refl : - infinity <=? - infinity = true).
Check (eq_refl : - infinity <=? - infinity = true).

Check (eq_refl : - infinity ?= - infinity = FEq).
Check (eq_refl : - infinity ?= - infinity = FEq).

Check (eq_refl : min_denorm =? min_norm = false).
Check (eq_refl : min_norm =? min_denorm = false).

Check (eq_refl : min_denorm <? min_norm = true).
Check (eq_refl : min_norm <? min_denorm = false).

Check (eq_refl : min_denorm <=? min_norm = true).
Check (eq_refl : min_norm <=? min_denorm = false).

Check (eq_refl : min_denorm ?= min_norm = FLt).
Check (eq_refl : min_norm ?= min_denorm = FGt).

Check (eq_refl : min_denorm =? one = false).
Check (eq_refl : one =? min_denorm = false).

Check (eq_refl : min_denorm <? one = true).
Check (eq_refl : one <? min_denorm = false).

Check (eq_refl : min_denorm <=? one = true).
Check (eq_refl : one <=? min_denorm = false).

Check (eq_refl : min_denorm ?= one = FLt).
Check (eq_refl : one ?= min_denorm = FGt).

Check (eq_refl : min_norm =? one = false).
Check (eq_refl : one =? min_norm = false).

Check (eq_refl : min_norm <? one = true).
Check (eq_refl : one <? min_norm = false).

Check (eq_refl : min_norm <=? one = true).
Check (eq_refl : one <=? min_norm = false).

Check (eq_refl : min_norm ?= one = FLt).
Check (eq_refl : one ?= min_norm = FGt).

Check (eq_refl : one =? infinity = false).
Check (eq_refl : infinity =? one = false).

Check (eq_refl : one <? infinity = true).
Check (eq_refl : infinity <? one = false).

Check (eq_refl : one <=? infinity = true).
Check (eq_refl : infinity <=? one = false).

Check (eq_refl : one ?= infinity = FLt).
Check (eq_refl : infinity ?= one = FGt).

Check (eq_refl : - infinity =? infinity = false).
Check (eq_refl : infinity =? - infinity = false).

Check (eq_refl : - infinity <? infinity = true).
Check (eq_refl : infinity <? - infinity = false).

Check (eq_refl : - infinity <=? infinity = true).
Check (eq_refl : infinity <=? - infinity = false).

Check (eq_refl : - infinity ?= infinity = FLt).
Check (eq_refl : infinity ?= - infinity = FGt).

Check (eq_refl : - infinity =? one = false).
Check (eq_refl : one =? - infinity = false).

Check (eq_refl : - infinity <? one = true).
Check (eq_refl : one <? - infinity = false).

Check (eq_refl : - infinity <=? one = true).
Check (eq_refl : one <=? - infinity = false).

Check (eq_refl : - infinity ?= one = FLt).
Check (eq_refl : one ?= - infinity = FGt).