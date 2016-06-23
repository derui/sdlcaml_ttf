
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
end

let wrap v pred =
  let v = v () in 
  if pred v then S.Types.Result.return v
  else S.Types.Result.fail (S.Error.get ())

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
