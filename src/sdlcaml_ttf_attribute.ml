
module S = Sdlcaml.Std
open Ctypes
open Foreign
module T = Sdlcaml_ttf_type

module Inner = struct
  let get_font_style = foreign "TTF_GetFontStyle" (T.Font.t @-> returning int)
  let set_font_style = foreign "TTF_SetFontStyle" (T.Font.t @-> returning int)
end

let wrap v pred =
  let v = v () in 
  if pred v then S.Types.Result.return v
  else S.Types.Result.fail (S.Error.get ())

let get_style font =
  let style = Inner.get_font_style font in
  T.Style.of_int style
