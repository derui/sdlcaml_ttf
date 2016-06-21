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
end 

