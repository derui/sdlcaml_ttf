(**
   This module provides wrappers for general functions of SDL2_ttf
*)
module S = Sdlcaml.Std

val init : unit -> unit S.Types.Result.Core.t
(* [init ()] initialize SDL2_ttf. This function allows you to muitiple call. *)

val was_init : unit -> bool
(* [was_init ()] returns SDL2_ttf is initialized or not *)

val quit : unit -> unit
(* [quit ()] shutdown and cleanup SDL2_ttf. *)
