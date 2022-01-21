(* Utility Module for S-expression Conversions *)

open StdLabels
open Sexp

(* Conversion of OCaml-values to S-expressions *)
external format_float : string -> float -> string = "caml_format_float"

(* '%.17g' is guaranteed to be round-trippable.
   '%.15g' will be round-trippable and not have noise at the last digit or two for a float
   which was converted from a decimal (string) with <= 15 significant digits.  So it's
   worth trying first to avoid things like "3.1400000000000001".
   See comment above [to_string_round_trippable] in {!Core.Float} for
   detailed explanation and examples. *)
let default_string_of_float =
  ref (fun x ->
    let y = format_float "%.15G" x in
    if float_of_string y = x then y else format_float "%.17G" x)
;;

let write_old_option_format = ref true
let sexp_of_unit () = List []
let sexp_of_bool b = Atom (string_of_bool b)
let sexp_of_string str = Atom str
let sexp_of_char c = Atom (String.make 1 c)
let sexp_of_int n = Atom (string_of_int n)
let sexp_of_float n = Atom (!default_string_of_float n)
let sexp_of_int32 n = Atom (Int32.to_string n)
let sexp_of_int64 n = Atom (Int64.to_string n)
let sexp_of_nativeint n = Atom (Nativeint.to_string n)

let sexp_of_option sexp_of__a = function
  | Some x when !write_old_option_format -> List [ sexp_of__a x ]
  | Some x -> List [ Atom "some"; sexp_of__a x ]
  | None when !write_old_option_format -> List []
  | None -> Atom "none"


(* List.rev (List.rev_map ...) is tail recursive, the OCaml standard
   library List.map is NOT. *)
let sexp_of_list sexp_of__a lst = List (List.rev (List.rev_map lst ~f:sexp_of__a))

let sexp_of_array sexp_of__a ar =
  let lst_ref = ref [] in
  for i = Array.length ar - 1 downto 0 do
    lst_ref := sexp_of__a ar.(i) :: !lst_ref
  done;
  List !lst_ref
