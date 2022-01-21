(** [sexp_of_unit ()] converts a value of type [unit] to an S-expression. *)
val sexp_of_unit : unit -> Sexp.t

(** [sexp_of_bool b] converts the value [x] of type [bool] to an
    S-expression. *)
val sexp_of_bool : bool -> Sexp.t

(** [sexp_of_bool str] converts the value [str] of type [string] to an
    S-expression. *)
val sexp_of_string : string -> Sexp.t

(** [sexp_of_char c] converts the value [c] of type [char] to an
    S-expression. *)
val sexp_of_char : char -> Sexp.t

(** [sexp_of_int n] converts the value [n] of type [int] to an
    S-expression. *)
val sexp_of_int : int -> Sexp.t

(** [sexp_of_float n] converts the value [n] of type [float] to an
    S-expression. *)
val sexp_of_float : float -> Sexp.t

(** [sexp_of_int32 n] converts the value [n] of type [int32] to an
    S-expression. *)
val sexp_of_int32 : int32 -> Sexp.t

(** [sexp_of_int64 n] converts the value [n] of type [int64] to an
    S-expression. *)
val sexp_of_int64 : int64 -> Sexp.t

(** [sexp_of_nativeint n] converts the value [n] of type [nativeint] to an
    S-expression. *)
val sexp_of_nativeint : nativeint -> Sexp.t

(** [sexp_of_option conv opt] converts the value [opt] of type ['a
    option] to an S-expression.  Uses [conv] to convert values of type
    ['a] to an S-expression. *)
val sexp_of_option : ('a -> Sexp.t) -> 'a option -> Sexp.t

(** [sexp_of_list conv lst] converts the value [lst] of type ['a
    list] to an S-expression.  Uses [conv] to convert values of type
    ['a] to an S-expression. *)
val sexp_of_list : ('a -> Sexp.t) -> 'a list -> Sexp.t

(** [sexp_of_array conv ar] converts the value [ar] of type ['a
    array] to an S-expression.  Uses [conv] to convert values of type
    ['a] to an S-expression. *)
val sexp_of_array : ('a -> Sexp.t) -> 'a array -> Sexp.t
