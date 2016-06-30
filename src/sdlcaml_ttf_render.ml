
module S = Sdlcaml.Std
open Ctypes
open Foreign
module T = Sdlcaml_ttf_type

module Inner = struct
  let render_utf8_solid = foreign "TTF_RenderUTF8_Solid"
    (T.Font.t @-> string @-> S.Structures.Color.t @-> returning S.Types.Surface.t)
  let render_glyph_solid = foreign "TTF_RenderGlyph_Solid"
    (T.Font.t @-> uint16_t @-> S.Structures.Color.t @-> returning S.Types.Surface.t)
  let render_utf8_shaded = foreign "TTF_RenderUTF8_Shaded"
    (T.Font.t @-> string @-> S.Structures.Color.t @-> returning S.Types.Surface.t)
  let render_glyph_shaded = foreign "TTF_RenderGlyph_Shaded"
    (T.Font.t @-> uint16_t @-> S.Structures.Color.t @-> returning S.Types.Surface.t)
  let render_utf8_blended = foreign "TTF_RenderUTF8_Blended"
    (T.Font.t @-> string @-> S.Structures.Color.t @-> returning S.Types.Surface.t)
  let render_glyph_blended = foreign "TTF_RenderGlyph_Blended"
    (T.Font.t @-> uint16_t @-> S.Structures.Color.t @-> returning S.Types.Surface.t)
end

let wrap v pred =
  let v = v () in
  if pred v then S.Types.Result.return v
  else S.Types.Result.fail (S.Error.get ())

let render_utf8_solid ~font ~text ~color =
  let ret = Inner.render_utf8_solid font text (S.Structures.Color.of_ocaml color) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let render_glyph_solid ~font ~ch ~color =
  let ret = Inner.render_glyph_solid font Unsigned.UInt16.(Uchar.to_int ch |> of_int)
    (S.Structures.Color.of_ocaml color) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let render_utf8_shaded ~font ~text ~color =
  let ret = Inner.render_utf8_shaded font text (S.Structures.Color.of_ocaml color) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let render_glyph_shaded ~font ~ch ~color =
  let ret = Inner.render_glyph_shaded font Unsigned.UInt16.(Uchar.to_int ch |> of_int)
    (S.Structures.Color.of_ocaml color) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let render_utf8_blended ~font ~text ~color =
  let ret = Inner.render_utf8_blended font text (S.Structures.Color.of_ocaml color) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let render_glyph_blended ~font ~ch ~color =
  let ret = Inner.render_glyph_blended font Unsigned.UInt16.(Uchar.to_int ch |> of_int)
    (S.Structures.Color.of_ocaml color) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)
