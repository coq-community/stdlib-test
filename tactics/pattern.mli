
(* $Id$ *)

(*i*)
open Util
open Names
open Term
open Sign
open Evd
open Proof_trees
(*i*)

(* The pattern table for tactics. *)

(* The idea is that we want to write tactic files which are only
   "activated" when certain modules are loaded and imported.  Already,
   the question of how to store the tactics is hard, and we will not
   address that here.  However, the question arises of how to store
   the patterns that we will want to use for term-destructuring, and
   the solution proposed is that we will store patterns with a
   "module-marker", telling us which modules have to be open in order
   to use the pattern.  So we will write:
   \begin{verbatim}
   let mark = make_module_marker ["<module-name>";<module-name>;...];;
   let p1 = put_pat mark "<parseable pattern goes here>";;
   \end{verbatim}
   And now, we can use [(get p1)]
   to get the term which corresponds to this pattern, already parsed
   and with the global names adjusted.

   In other words, we will have the term which we would have had if we
   had done an:
   \begin{verbatim}
        constr_of_com mt_ctxt (initial_sign()) "<text here>"
   \end{verbatim}
   except that it will be computed at module-opening time, rather than
   at tactic-application time.  The ONLY difference will be that
   no implicit syntax resolution will happen. *)

(* A pattern is intented to be pattern-matched (using functions
   [somatch] and co), while a squeleton is a term with holes intented to
   be substituted by [soinstance] *)

(*s First part : introduction of term patterns and term squeletons *)

(* [make_module_marker modl] makes a key from the list of
   vernacular modules [modl] where names in a pattern or squeleton has
   to be searched *)

type module_mark = Stock.module_mark
val make_module_marker : string list -> module_mark

(* [put_pat mmk s] declares a pattern [s] to be parsed using the
   definitions in the modules associated to the key [mmk] *)

type marked_pattern
val put_pat            : module_mark -> string -> marked_pattern
(*val get_pat            : marked_pattern -> constr*)


(* [pattern_of_constr c] translates a term [c] with metavariables into
   a pattern; currently, no destructor (Cases, Fix, Cofix) and no
   existential variable are allowed in [c] *)

val pattern_of_constr : constr -> Rawterm.constr_pattern

(* [put_squel mmk s] declares an open term [s] to be parsed using the
   definitions in the modules associated to the key [mmk] *)

type marked_term
val put_squel          : module_mark -> string -> marked_term
(*val get_squel          : marked_term -> constr*)

(*i Remplac� par Astterm.interp_constrpattern
val raw_sopattern_of_compattern : Environ.env -> Coqast.t -> constr
i*)

(*s Second part : Given a term with second-order variables in it,
   represented by Meta's, and possibly applied using \verb!XTRA[$SOAPP]! to
   terms, this function will perform second-order, binding-preserving,
   matching, in the case where the pattern is a pattern in the sense
   of Dale Miller.

   ALGORITHM:

   Given a pattern, we decompose it, flattening casts and apply's,
   recursing on all operators, and pushing the name of the binder each
   time we descend a binder.

   When we reach a first-order variable, we ask that the corresponding
   term's free-rels all be higher than the depth of the current stack.

   When we reach a second-order application, we ask that the
   intersection of the free-rels of the term and the current stack be
   contained in the arguments of the application, and in that case, we
   construct a [DLAM] with the names on the stack. *)

(*i Devrait �tre une fonction de filtrage externe i*)
val somatch      : int list option -> Rawterm.constr_pattern -> constr -> (int * constr) list

val somatches    : constr -> marked_pattern -> bool
val dest_somatch : constr -> marked_pattern -> constr list

val soinstance   : marked_term -> constr list -> constr 

val is_imp_term : constr -> bool

(*s I implemented the following functions which test whether a term [t]
   is an inductive but non-recursive type, a general conjuction, a
   general disjunction, or a type with no constructors.

   They are more general than matching with [or_term], [and_term], etc, 
   since they do not depend on the name of the type. Hence, they 
   also work on ad-hoc disjunctions introduced by the user.
   (Eduardo, 6/8/97). *)

type 'a matching_function = constr -> 'a option
type testing_function = constr -> bool

val match_with_non_recursive_type : (constr * constr list) matching_function
val is_non_recursive_type         : testing_function 

val match_with_disjunction : (constr * constr list) matching_function
val is_disjunction         : testing_function 

val match_with_conjunction : (constr * constr list) matching_function
val is_conjunction         : testing_function 

val match_with_empty_type  : constr matching_function
val is_empty_type          : testing_function 

val match_with_unit_type   : constr matching_function
val is_unit_type           : testing_function 

val match_with_equation    : (constr * constr list) matching_function
val is_equation            : testing_function 

val match_with_nottype     : (constr * constr) matching_function
val is_nottype             : testing_function 
