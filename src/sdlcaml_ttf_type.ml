open Ctypes

module T = Sdlcaml_ttf_bindings.Types(Sdlcaml_ttf_generated_types)

(* TTF_Font type mapping *)
module Font : sig
  type _t
  type t = _t structure ptr
  val t : _t structure ptr typ

end = struct
  type _t
  let _t : _t structure typ = structure "TTF_Font"
  type t = _t structure ptr
  let t = ptr _t
end

module Style = struct
  type t =
      Bold
    | Italic
    | Underline
    | Strikethrough
    | Normal

  let of_int = function
    | s when s = T.Ttf_style_type.bold -> Bold
    | s when s = T.Ttf_style_type.italic -> Italic
    | s when s = T.Ttf_style_type.normal -> Normal
    | s when s = T.Ttf_style_type.strikethrough -> Strikethrough
    | s when s = T.Ttf_style_type.underline -> Underline
    | _ -> failwith "No any style of TTF Font"

  let to_int = function
    | Bold -> T.Ttf_style_type.bold
    | Italic -> T.Ttf_style_type.italic
    | Normal -> T.Ttf_style_type.normal
    | Strikethrough -> T.Ttf_style_type.strikethrough
    | Underline -> T.Ttf_style_type.underline
end 

module Hinting = struct
  type t =
      Normal
    | Light
    | Mono
    | None

  let of_int = function
    | s when s = T.Ttf_hinting_type.normal -> Normal
    | s when s = T.Ttf_hinting_type.light -> Light
    | s when s = T.Ttf_hinting_type.mono -> Mono
    | s when s = T.Ttf_hinting_type.none -> None
    | _ -> failwith "No any hinting of TTF Font"

  let to_int = function
    | Normal -> T.Ttf_hinting_type.normal
    | Light -> T.Ttf_hinting_type.light
    | Mono -> T.Ttf_hinting_type.mono
    | None -> T.Ttf_hinting_type.none
end 

module Glyph_metrics = struct
  type t = {
    ch: Uchar.t;
    minx: int;
    maxx: int;
    miny: int;
    maxy: int;
    advance: int;
  }
end
