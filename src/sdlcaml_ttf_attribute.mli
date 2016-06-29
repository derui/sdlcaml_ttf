(**
   This module provides wrappers for attributes functions of SDL2_ttf.
   But only few function are not provided from this.
*)

module S = Sdlcaml.Std
module T = Sdlcaml_ttf_type

val get_style : T.Font.t -> T.Style.t
(** [get_style font] get the style of [font] *)

val set_style : font:T.Font.t -> style:T.Style.t -> int
(** [set_style ~font ~style] set a style to specified [font] *)

val get_outline : T.Font.t -> int
(** [get_outline font] get the size of outline of [font] *)

val set_outline : font:T.Font.t -> outline:int -> int
(** [set_outline ~font ~outline] set the size of outline to [font] *)

val get_hinting : T.Font.t -> T.Hinting.t
(** [get_hinting font] get the hinting of [font] *)

val set_hinting : font:T.Font.t -> hinting:T.Hinting.t -> int
(** [set_hinting ~font ~hinting] set the hinting to [font] *)

val get_kerning : T.Font.t -> bool
(** [get_kerning font] get the current status of kerning for [font] *)

val set_kerning : font:T.Font.t -> kerning:bool -> int
(** [set_kerning ~font ~kerning] get the enable or disable status of kerning to [font] *)

val get_height : T.Font.t -> int
(** [get_height font] get the height of [font] *)

val get_ascent : T.Font.t -> int
(** [get_ascent font] get the ascent of [font] *)

val get_descent : T.Font.t -> int
(** [get_descent font] get the descent of [font] *)

val get_line_skip : T.Font.t -> int
(** [get_line_skip font] get the size of step between each line of [font] *)

val get_faces : T.Font.t -> Signed.long
(** [get_faces font] get the number of faces contained in [font] *)

val is_fixed_width : T.Font.t -> bool
(** [is_fixed_width font] return the [font] is fixed width or not *)

val get_family_name : T.Font.t -> string option
(** [get_family_name font] return the family name of [font] *)

val get_style_name : T.Font.t -> string option
(** [get_style_name font] return the style name of [font] *)

val is_glyph_provided : font:T.Font.t -> ch:Uchar.t -> int option
(** [is_glyph_provided ~font ~ch] return the [font] contained the glyph of [ch] *)

val get_glyph_metrics : font:T.Font.t -> ch:Uchar.t -> T.Glyph_metrics.t S.Types.Result.Core.t
(** [get_glyph_metrics ~font ~ch] get the metrics of the glyph of [ch] is defined in [font] *)

val get_size_of_text : font:T.Font.t -> text:string -> (int * int) S.Types.Result.Core.t
(** [get_size_of_text ~font ~text] calculate the resulting surface size of the [text]. *)

val get_size_of_utf8 : font:T.Font.t -> text:string -> (int * int) S.Types.Result.Core.t
(** [get_size_of_utf8 ~font ~text] calculate the resulting surface size of the UTF8 encoded [text]. *)
