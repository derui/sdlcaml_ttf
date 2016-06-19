
module S = Sdlcaml.Std
open Ctypes
open Foreign
module T = Sdlcaml_ttf_type

module Inner = struct
  let open_font = foreign "TTF_OpenFont" (string @-> int @-> returning T.Font.t)
  let open_font_rw = foreign "TTF_OpenFontRW" (S.RWops.t @-> int @-> int @-> returning T.Font.t)
  let open_font_index = foreign "TTF_OpenFontIndex"
    (string @-> int @-> long @-> returning T.Font.t)
  let open_font_index_rw = foreign "TTF_OpenFontIndexRW"
    (S.RWops.t @-> int @-> int @-> long @-> returning T.Font.t)
  let close_font = foreign "TTF_CloseFont" (T.Font.t @-> returning void)
end

let wrap v pred =
  let v = v () in 
  if pred v then S.Types.Result.return v
  else S.Types.Result.fail (S.Error.get ())

let open_font ~filename ~point =
  let ret = Inner.open_font filename point in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let open_font_rw ?(auto_free=false) ~rw ~point =
  let srcfree = if auto_free then 1 else 0 in
  let ret = Inner.open_font_rw rw srcfree point in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let open_font_index ~filename ~point ~index =
  let ret = Inner.open_font_index filename point Signed.Long.(of_int index) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)

let open_font_index_rw ?(auto_free=false) ~rw ~point ~index =
  let srcfree = if auto_free then 1 else 0 in
  let ret = Inner.open_font_index_rw rw srcfree point Signed.Long.(of_int index) in
  wrap (fun () -> ret) (fun ret -> to_voidp ret <> null)
