
module S = Sdlcaml.Std
open Ctypes
open Foreign
module T = Sdlcaml_ttf_type

module Inner = struct
  let get_font_style = foreign "TTF_GetFontStyle" (T.Font.t @-> returning int)
  let set_font_style = foreign "TTF_SetFontStyle" (T.Font.t @-> int @-> returning int)
  let get_font_outline = foreign "TTF_GetFontOutline" (T.Font.t @-> returning int)
  let set_font_outline = foreign "TTF_SetFontOutline" (T.Font.t @-> int @-> returning int)
  let get_font_hinting = foreign "TTF_GetFontHinting" (T.Font.t @-> returning int)
  let set_font_hinting = foreign "TTF_SetFontHinting" (T.Font.t @-> int @-> returning int)

  let get_font_kerning = foreign "TTF_GetFontKerning" (T.Font.t @-> returning int)
  let set_font_kerning = foreign "TTF_SetFontKerning" (T.Font.t @-> int @-> returning int)

  let font_height = foreign "TTF_FontHeight" (T.Font.t @-> returning int)
  let font_ascent = foreign "TTF_FontAscent" (T.Font.t @-> returning int)
  let font_descent = foreign "TTF_FontDescent" (T.Font.t @-> returning int)
  let font_line_skip = foreign "TTF_FontLineSkip" (T.Font.t @-> returning int)
  let font_faces = foreign "TTF_FontFaces" (T.Font.t @-> returning long)

  let font_face_is_fixed_width = foreign "TTF_FontFaceIsFixedWidth" (T.Font.t @-> returning int)
  let font_face_family_name = foreign "TTF_FontFaceFamilyName" (T.Font.t @-> returning string_opt)
  let font_face_style_name = foreign "TTF_FontFaceStyleName" (T.Font.t @-> returning string_opt)

  let glyph_is_provided = foreign "TTF_GlyphIsProvided" (T.Font.t @-> uint16_t @-> returning int)
  let glyph_metrics = foreign "TTF_GlyphMetrics"
    (T.Font.t @-> uint16_t @->
     ptr int @-> ptr int @-> ptr int @-> ptr int @-> ptr int @-> returning int)

  let size_text = foreign "TTF_SizeText"
    (T.Font.t @-> string @-> ptr int @-> ptr int @-> returning int)
  let size_utf8 = foreign "TTF_SizeText"
    (T.Font.t @-> string @-> ptr int @-> ptr int @-> returning int)
end

let get_style font =
  let style = Inner.get_font_style font in
  T.Style.of_int style

let set_style ~font ~style =
  let style = T.Style.to_int style in
  Inner.set_font_style font style

let get_outline = Inner.get_font_outline
let set_outline ~font ~outline =
  Inner.set_font_outline font outline

let get_hinting font =
  let hinting = Inner.get_font_hinting font in
  T.Hinting.of_int hinting

let set_hinting ~font ~hinting =
  let style = T.Hinting.to_int hinting in
  Inner.set_font_hinting font style

let get_kerning font =
  let kerning = Inner.get_font_kerning font in
  match kerning with
  | 0 -> false
  | _ -> true

let set_kerning ~font ~kerning =
  match kerning with
  | true -> Inner.set_font_kerning font 1
  | false -> Inner.set_font_kerning font 0

let get_height = Inner.font_height
let get_ascent = Inner.font_ascent
let get_descent = Inner.font_descent
let get_line_skip = Inner.font_line_skip
let get_faces = Inner.font_faces

let is_fixed_width font =
  let ret = Inner.font_face_is_fixed_width font in
  ret > 0

let get_family_name font = Inner.font_face_family_name font
let get_style_name font = Inner.font_face_style_name font

let is_glyph_provided ~font ~ch =
  let ret = Inner.glyph_is_provided font Unsigned.UInt16.(Uchar.to_int ch |> of_int) in
  match ret with
  | 0 -> None
  | _ -> Some ret

let get_glyph_metrics ~font ~ch =
  let buf = CArray.make int 5 in
  let at i = (CArray.start buf) +@ i in
  let ch' = Unsigned.UInt16.(Uchar.to_int ch |> of_int) in
  let ret = Inner.glyph_metrics font ch' (at 0) (at 1) (at 2) (at 3) (at 4) in
  if ret = 0 then S.Types.Result.return {
    T.Glyph_metrics.ch = ch;
    minx = CArray.get buf 0;
    maxx = CArray.get buf 1;
    miny = CArray.get buf 2;
    maxy = CArray.get buf 3;
    advance = CArray.get buf 4;
  }
  else S.Types.Result.fail (S.Error.get ())

let get_size_of_text ~font ~text =
  let buf = CArray.make int 2 in
  let at i = (CArray.start buf) +@ i in
  let ret = Inner.size_text font text (at 0) (at 1) in
  if ret = 0 then S.Types.Result.return (CArray.get buf 0, CArray.get buf 1)
  else S.Types.Result.fail (S.Error.get ())

let get_size_of_utf8 ~font ~text =
  let buf = CArray.make int 2 in
  let at i = (CArray.start buf) +@ i in
  let ret = Inner.size_utf8 font text (at 0) (at 1) in
  if ret = 0 then S.Types.Result.return (CArray.get buf 0, CArray.get buf 1)
  else S.Types.Result.fail (S.Error.get ())
