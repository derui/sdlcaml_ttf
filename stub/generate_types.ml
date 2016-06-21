open Ctypes

let () =
  print_endline "#include \"SDL_ttf.h\"";
  Cstubs.Types.write_c Format.std_formatter (module Sdlcaml_ttf_bindings.Types)
