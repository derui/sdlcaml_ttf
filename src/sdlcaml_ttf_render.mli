(**
   This module provides wrappers for render functions of SDL2_ttf.

   Only functions for UTF8 and glyph are provided from this module.
*)
module S = Sdlcaml.Std
module T = Sdlcaml_ttf_type

val render_utf8_solid : font:T.Font.t -> text:string ->
  color:S.Structures.Color.t -> S.Types.Surface.t S.Types.Result.Core.t
(* [render_utf8_solid ~font ~text ~color] return a new surface that render
   UTF8 encoded [text] using [font] with [color], using the Solid mode
*)

val render_glyph_solid : font:T.Font.t -> ch:Uchar.t ->
  color:S.Structures.Color.t -> S.Types.Surface.t S.Types.Result.Core.t
(* [render_glyph_solid ~font ~ch ~color] return a new surface that render
   UNICODE [ch] using [font] with [color], using the Solid mode
*)

val render_utf8_shaded : font:T.Font.t -> text:string ->
  color:S.Structures.Color.t -> S.Types.Surface.t S.Types.Result.Core.t
(* [render_utf8_shaded ~font ~text ~color] return a new surface that render
   UTF8 encoded [text] using [font] with [color], using the Shaded mode
*)

val render_glyph_shaded : font:T.Font.t -> ch:Uchar.t ->
  color:S.Structures.Color.t -> S.Types.Surface.t S.Types.Result.Core.t
(* [render_glyph_shaded ~font ~ch ~color] return a new surface that render
   UNICODE [ch] using [font] with [color], using the Shaded mode
*)

val render_utf8_blended : font:T.Font.t -> text:string ->
  color:S.Structures.Color.t -> S.Types.Surface.t S.Types.Result.Core.t
(* [render_utf8_blended ~font ~text ~color] return a new surface that render
   UTF8 encoded [text] using [font] with [color], using the Blended mode
*)

val render_glyph_blended : font:T.Font.t -> ch:Uchar.t ->
  color:S.Structures.Color.t -> S.Types.Surface.t S.Types.Result.Core.t
(* [render_glyph_blended ~font ~ch ~color] return a new surface that render
   UNICODE [ch] using [font] with [color], using the Blended mode
*)
