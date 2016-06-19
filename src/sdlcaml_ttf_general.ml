module S = Sdlcaml.Std
open Ctypes
open Foreign

module Inner = struct
  let init = foreign "TTF_Init" (void @-> returning int)
  let was_init = foreign "TTF_WasInit" (void @-> returning int)
  let quit = foreign "TTF_Quit" (void @-> returning void)
end

let init =
  let ret = Inner.init () in
  match ret with
  | 1 | 0 -> S.Types.Result.return ()
  | _ -> S.Types.Result.fail (S.Error.get ())

let was_init () =
  let ret = Inner.was_init () in
  match ret with
  | 1 -> true
  | _ -> false

let quit = Inner.quit
