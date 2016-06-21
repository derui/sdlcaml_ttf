open Ctypes

(* Constant-mapped types with generated stub *)
module Types (F: Cstubs.Types.TYPE) = struct
  module Ttf_style_type = struct
    let bold = F.constant "TTF_STYLE_BOLD" F.int
    let italic = F.constant "TTF_STYLE_ITALIC" F.int
    let underline = F.constant "TTF_STYLE_UNDERLINE" F.int
    let strikethrough = F.constant "TTF_STYLE_STRIKETHROUGH" F.int
    let normal = F.constant "TTF_STYLE_NORMAL" F.int
  end

end
