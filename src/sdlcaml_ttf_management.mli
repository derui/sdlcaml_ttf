(**
   This module provides font management functions of SDL2_ttf.
*)
module S = Sdlcaml.Std
module T = Sdlcaml_ttf_type

val open_font :
  filename:string ->
  point:int -> T.Font.t S.Types.Result.t
(* [open_font ~filename ~point] open and allocate font with [filename] as
   size of [point]
*)

val open_font_rw :
  ?auto_free:bool ->
  rw:Sdlcaml.Sdlcaml_structures.Rw_ops.t Ctypes.structure Ctypes.ptr ->
  point:int -> T.Font.t S.Types.Result.t
(* [open_font_rw ?auto_free ~rw ~point] open and allocate font with [rw] as
   size of [point].

   You want to free src [rw] when font opening finished, You specify [auto_free] as [true]
*)

val open_font_index :
  filename:string ->
  point:int ->
  index:int -> T.Font.t  S.Types.Result.t
(* [open_font_index ~filename ~point ~index] open and allocate font with [filename] as
   size of [point], and choose a font face [index].
*)

val open_font_index_rw :
  ?auto_free:bool ->
  rw:Sdlcaml.Sdlcaml_structures.Rw_ops.t Ctypes.structure Ctypes.ptr ->
  point:int ->
  index:int -> T.Font.t S.Types.Result.t
(* [open_font_rw ?auto_free ~rw ~point] open and allocate font with [rw] as
   size of [point], and choose a font face [index].

   You want to free src [rw] when font opening finished, You specify [auto_free] as [true]
*)
