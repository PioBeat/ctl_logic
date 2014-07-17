open BranchTimeLogic

(** Segnatura dello spazio **)
module type SPACE = sig

  type t
  type point
  type pointset

  val domain : t -> pointset
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
  val domain : t -> pointset
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




(** Implementazione del modello **)
module Model (Space : SPACE) (Time : TIME) : (MODEL with type space = Space.t
						     and type space_point = Space.point
						     and type space_pointset = Space.pointset
						     and type time = Time.t
						     and type time_point = Time.point
						     and type time_pointset = Time.pointset
						     and type prop = string) = struct


  (** Spazio **)
  type space = Space.t
  type space_point = Space.point
  type space_pointset = Space.pointset
  let space_domain = Space.domain
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
  let space_fold = Space.fold




  (** Tempo **)
  type time = Time.t
  type time_point = Time.point
  type time_pointset = Time.pointset
  let time_domain = Time.domain
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
  
  type st = time_pointset StMap.t
  type st_point = space_point * time_point

  let st_compare = fun stpt1 stpt2 ->
    let (spt1,tpt1) = stpt1 in
    let (spt2,tpt2) = stpt2 in
    let comp1 = Space.compare spt1 spt2 in
    if comp1 = 0
    then Time.compare tpt1 tpt2
    else comp1

  module StPoint = struct
    type t = st_point
    let compare = st_compare
  end
  module StSet = Set.Make(StPoint)

  type st_pointset = StSet.t




  let string_of_st_point = fun stpt ->
    let (spt,tpt) = stpt in
    Printf.sprintf "(%s;%s)" (string_of_space_point spt) (string_of_time_point tpt)

  let string_of_st_pointset_aux = fun stset ->
    let st_list = StSet.elements stset in
    String.concat ", " (List.map string_of_st_point st_list)
  let string_of_st_pointset = fun stset ->
    Printf.sprintf "[ %s ]" (string_of_st_pointset_aux stset)




  let st_mem = StSet.mem
  let st_add = fun spt tpt -> StSet.add (spt,tpt)
  let st_subset = StSet.subset
  let st_diff = StSet.diff
  let st_inter = StSet.inter
  let st_union = StSet.union
  let st_filter = StSet.filter
  let st_fold = StSet.fold



  let st_empty = StSet.empty

  let st_domain = fun st ->
    let spt_tset_to_stset = fun spt tset -> time_fold (fun tpt set -> st_add spt tpt set) tset st_empty in
    let set_of_key_val = (fun spt tset set -> st_union (spt_tset_to_stset spt tset) set) in
    StMap.fold set_of_key_val st st_empty

  let st_complement = fun stset st -> st_diff (st_domain st) stset



  let st_to_space = fun stpt ->
    let (spt,tpt) = stpt in spt

  let st_to_time = fun stpt ->
    let (spt,tpt) = stpt in tpt

  

  (* let add_stpt = fun sp tp stpset -> *)
  (*   try *)
  (*     let tpset = time_add tp (StMap.find sp stpset) in *)
  (*     StMap.add sp tpset stpset *)
  (*   with Not_found -> *)
  (*     StMap.add sp (time_add tp time_empty) stpset *)



  (** Proposizioni **)
  type prop = string

  let string_of_prop = fun pr -> pr
 

  type prop_env = prop -> st_pointset

  let empty_env = fun pr -> failwith (Printf.sprintf "L'ambiente non è definito su questo input: %s" pr)

  let bind = fun pr stpset en ->
    (fun p ->
      if ( p = pr )
      then stpset
      else en p
    )



end






(*** TEST AREA!!! DA CANCELLARE!!! ***)

