open Ctypes

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
