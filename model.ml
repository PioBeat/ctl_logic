#use "branch_time_logic.ml"

(** Segnatura dello spazio **)
module type SPACE = sig

  type t
  type point
  type pointset

  val set : t -> pointset
  val empty : pointset

  val string_of_point : point -> string
  val fold : (point -> 'a -> 'a) -> pointset -> 'a -> 'a

  val mem : point -> pointset -> bool
  val subset : pointset -> pointset -> bool
  val inter : pointset -> pointset -> pointset
  val union : pointset -> pointset -> pointset
  val complement : pointset -> t -> pointset
  val filter : (point -> bool) -> pointset -> pointset
  val compare : point -> point -> int

end

(** Segnatura del tempo **)
module type TIME = sig

  type t
  type point
  type pointset
  val set : t -> pointset
  val empty : pointset

  val string_of_point : point -> string

  val mem : point -> pointset -> bool
  val add : point -> pointset -> pointset
  val subset : pointset -> pointset -> bool
  val inter : pointset -> pointset -> pointset
  val union : pointset -> pointset -> pointset
  val diff : pointset -> pointset -> pointset
  val complement : pointset -> t -> pointset
  val filter : (point -> bool) -> pointset -> pointset
  val fold : (point -> 'a -> 'a) -> pointset -> 'a -> 'a
  val compare : point -> point -> int
  
  val pred : point -> t -> pointset
  val next : point -> t -> pointset
  

end




(** Segnatura del modello **)
module Model (Space : SPACE) (Time : TIME) : (MODEL with type space = Space.t and type space_point = Space.point and type space_pointset = Space.pointset and type time = Time.t and type time_point = Time.point and type time_pointset = Time.pointset and type prop = string) = struct


  (** Spazio **)
  type space = Space.t
  type space_point = Space.point
  type space_pointset = Space.pointset
  let space_set = Space.set
  let space_empty = Space.empty

  let string_of_space_point = fun sp -> Space.string_of_point sp
  let string_of_space_pointset = fun spset ->
    Printf.sprintf "[ %s ]" (String.concat " " (Space.fold (fun x l -> (string_of_space_point x)::l) spset [] ) )

  let space_mem = fun sp spset -> Space.mem sp spset
  let space_subset = fun spset1 spset2 -> Space.subset spset1 spset2
  let space_inter = fun spset1 spset2 -> Space.inter spset1 spset2
  let space_union = fun spset1 spset2 -> Space.union spset1 spset2
  let space_complement = fun domain spset -> Space.complement domain spset
  let space_filter = fun flt spset -> Space.filter flt spset





  (** Tempo **)
  type time = Time.t
  type time_point = Time.point
  type time_pointset = Time.pointset
  let time_set = Time.set
  let time_empty = Time.empty

  let string_of_time_point = fun tp -> Time.string_of_point tp
  let string_of_time_pointset = fun tpset ->
    Printf.sprintf "[ %s ]" (String.concat " " (Time.fold (fun x l -> (string_of_time_point x)::l) tpset [] ) )

  let time_mem = fun tp tpset -> Time.mem tp tpset
  let time_add = fun tp tpset -> Time.add tp tpset
  let time_subset = fun tpset1 tpset2 -> Time.subset tpset1 tpset2
  let time_inter = fun tpset1 tpset2 -> Time.inter tpset1 tpset2
  let time_union = fun tpset1 tpset2 -> Time.union tpset1 tpset2
  let time_diff = fun tpset1 tpset2 -> Time.diff tpset1 tpset2
  let time_complement = fun domain tpset -> Time.complement domain tpset
  let time_filter = fun flt tpset -> Time.filter flt tpset
  let time_fold = fun flt tpset a -> Time.fold flt tpset a

  let time_pred = fun tp domain -> Time.pred tp domain
  let time_next = fun tp domain -> Time.next tp domain

  

  (** Spazio-Tempo **)
  module SpacePoint = struct
    type t = space_point
    let compare = Space.compare
  end

  module StMap = Map.Make(SpacePoint)
  type st_pointset = time_pointset StMap.t

  let empty_stpt = StMap.empty

  let add_stpt = fun sp tp stpset ->
    try
      let tpset = time_add tp (StMap.find sp stpset) in
      StMap.add sp tpset stpset
    with Not_found ->
      StMap.add sp (time_add tp time_empty) stpset



  (** Proposizioni **)
  type prop = string
  let string_of_prop = fun pr -> pr
 
  type env = prop -> space_point -> time_pointset

  let empty_env = fun pr sp -> failwith (Printf.sprintf "L'ambiente non è definito su questo input: %s" pr)

  let bind = fun pr stpset en ->
    (fun p sp ->
      if ( p = pr )
      then StMap.find sp stpset
      else en p sp
    )



end






(*** TEST AREA!!! DA CANCELLARE!!! ***)

