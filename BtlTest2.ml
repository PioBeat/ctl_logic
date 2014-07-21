open BranchTimeLogic
open Graph
open Model
open BtlConvert
open Interface

(** Spazio **)
(* punti *)
module MySpacePoint = struct
  type t = string
  let string_of_point = fun x -> x
  let compare = String.compare
end
(* grafo *)
module MySpaceGraph = QDGraph(MySpacePoint)
let sgdomain = MySpaceGraph.empty
let sgdomain = MySpaceGraph.add_node "sp" sgdomain
(* spazio *)
module MySpace = SpaceOfQDGraph(MySpaceGraph)

(** Tempo **)
(* punti *)
module MyTimePoint = struct
  type t = int
  let string_of_point = fun x -> string_of_int x
  let compare = Pervasives.compare
end
(* grafo *)
module MyTimeGraph = QDGraph(MyTimePoint)
let tgdomain = MyTimeGraph.empty
let tgdomain = MyTimeGraph.add_node 0 tgdomain
let tgdomain = MyTimeGraph.add_node 1 tgdomain
let tgdomain = MyTimeGraph.add_node 2 tgdomain
let tgdomain = MyTimeGraph.add_node 3 tgdomain
let tgdomain = MyTimeGraph.add_node 4 tgdomain
let tgdomain = MyTimeGraph.add_node 5 tgdomain
let tgdomain = MyTimeGraph.add_node 6 tgdomain
let tgdomain = MyTimeGraph.add_node 7 tgdomain
let tgdomain = MyTimeGraph.add_node 8 tgdomain
let tgdomain = MyTimeGraph.add_arc 0 1 tgdomain
let tgdomain = MyTimeGraph.add_arc 1 2 tgdomain
let tgdomain = MyTimeGraph.add_arc 2 2 tgdomain
let tgdomain = MyTimeGraph.add_arc 2 3 tgdomain
let tgdomain = MyTimeGraph.add_arc 2 4 tgdomain
let tgdomain = MyTimeGraph.add_arc 4 4 tgdomain
let tgdomain = MyTimeGraph.add_arc 3 0 tgdomain
let tgdomain = MyTimeGraph.add_arc 0 5 tgdomain
let tgdomain = MyTimeGraph.add_arc 5 5 tgdomain
let tgdomain = MyTimeGraph.add_arc 5 6 tgdomain
let tgdomain = MyTimeGraph.add_arc 5 7 tgdomain
let tgdomain = MyTimeGraph.add_arc 6 7 tgdomain
let tgdomain = MyTimeGraph.add_arc 7 6 tgdomain
let tgdomain = MyTimeGraph.add_arc 3 8 tgdomain
(* tempo *)
module MyTime = TimeOfQDGraph(MyTimeGraph)

(** Modello **)
module MyModel = Model(MySpace)(MyTime)
let emptyy = MyModel.st_empty
let set0 = MyModel.st_add "sp" 0 emptyy
let set1 = MyModel.st_add "sp" 1 emptyy
let set2 = MyModel.st_add "sp" 2 emptyy
let set3 = MyModel.st_add "sp" 3 emptyy
let set4 = MyModel.st_add "sp" 4 emptyy
let set5 = MyModel.st_add "sp" 5 emptyy
let set6 = MyModel.st_add "sp" 6 emptyy
let set7 = MyModel.st_add "sp" 7 emptyy
let set8 = MyModel.st_add "sp" 8 emptyy 
let env = MyModel.empty_env
let env = MyModel.bind "p0" set0 env
let env = MyModel.bind "p1" set1 env
let env = MyModel.bind "p2" set2 env
let env = MyModel.bind "p3" set3 env
let env = MyModel.bind "p4" set4 env
let env = MyModel.bind "p5" set5 env
let env = MyModel.bind "p6" set6 env
let env = MyModel.bind "p7" set7 env
let env = MyModel.bind "p8" set8 env

(** Logica **)
module MyLogic = Logic(MyModel)
(* formule di prova *)
(* let fs1 = MyLogic.TRUE *)
(* let fs2 = MyLogic.FALSE *)
(* let fs3 = MyLogic.PROP("lavoro") *)
(* let fs4 = MyLogic.EX(fs3) *)
(* let fs5 = MyLogic.AF(fs3) *)
(* let fs6 = MyLogic.EG(MyLogic.NOT fs3) *)
(* let fs7 = MyLogic.MVAR "X" *)
(* let fs8 = MyLogic.CALL ("fs7" , fs3::[]) *)

(* let f1 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs1 *)
(* let f2 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs2 *)
(* let f3 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs3 *)
(* let f4 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs4  *)
(* let f5 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs5  *)
(* let f6 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs6 *)
(* let f7 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs7 *)
(* let f8 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs8 *)

(* ambiente *)
let fsyntax_env = MyLogic.empty_env
(* let fsyntax_env = MyLogic.bind_mvar "fs1" fs1 [] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs2" fs2 [] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs3" fs3 [] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs4" fs4 [] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs5" fs5 [] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs6" fs6 [] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs7" fs7 ["X"] fsyntax_env *)
(* let fsyntax_env = MyLogic.bind_mvar "fs8" fs8 [] fsyntax_env *)

type mutable_env = { mutable env : MyModel.st_pointset MyLogic.parametric_fsyntax MyLogic.Env.t }
let fs_env = { env = fsyntax_env }
