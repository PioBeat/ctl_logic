(* #use "graph.ml" *)
(* #use "model.ml" *)
(* #use "branch_time_logic.ml" *)


(** QDGraph -> SPACE **)
module SpaceOfQDGraph (Graph : QDGRAPH) : (SPACE with type t = Graph.t
						 and type point = Graph.point
						 and type pointset = Graph.pointset ) =
struct
  
  type t = Graph.t
  type point = Graph.point
  type pointset = Graph.pointset

  let domain = Graph.get_nodes
  let empty = Graph.get_nodes Graph.empty

  let string_of_point = Graph.string_of_point

  let mem = Graph.mem
  let subset = Graph.subset
  let inter = Graph.inter
  let union = Graph.union
  let complement = Graph.complement
  let filter = Graph.filter
  let fold = Graph.fold
  let compare = Graph.compare
    

end


(** QDGraph -> TIME **)
module TimeOfQDGraph (Graph : QDGRAPH) : (TIME with type t = Graph.t
					       and type point = Graph.point
					       and type pointset = Graph.pointset) =
struct

  type t = Graph.t
  type point = Graph.point
  type pointset = Graph.pointset

  let domain = Graph.get_nodes
  let empty = Graph.get_nodes Graph.empty

  let string_of_point = Graph.string_of_point

  let mem = Graph.mem
  let add = Graph.add
  let subset = Graph.subset
  let inter = Graph.inter
  let union = Graph.union
  let diff = Graph.diff
  let complement = Graph.complement
  let filter = Graph.filter
  let fold = Graph.fold
  let compare = Graph.compare

  let pred = fun tp graph -> (Graph.get_source graph) tp
  let next = fun tp graph -> (Graph.get_destination graph) tp

end



(** Space -> Time -> MODEL **)
(* dentro al file model.ml *)


(** Model -> LOGIC **)
(* dentro al file branch_time_logic *)