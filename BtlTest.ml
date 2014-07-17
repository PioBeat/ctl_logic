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
let sgdomain = MySpaceGraph.add_node "alberto" sgdomain
let sgdomain = MySpaceGraph.add_node "barbara" sgdomain
let sgdomain = MySpaceGraph.add_node "carlo" sgdomain
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
let tgdomain = MyTimeGraph.add_arc 0 2 tgdomain
let tgdomain = MyTimeGraph.add_arc 2 4 tgdomain
let tgdomain = MyTimeGraph.add_arc 4 6 tgdomain
let tgdomain = MyTimeGraph.add_arc 6 0 tgdomain
let tgdomain = MyTimeGraph.add_arc 1 3 tgdomain
let tgdomain = MyTimeGraph.add_arc 3 5 tgdomain
let tgdomain = MyTimeGraph.add_arc 5 7 tgdomain
let tgdomain = MyTimeGraph.add_arc 7 1 tgdomain
let tgdomain = MyTimeGraph.add_arc 0 3 tgdomain
let tgdomain = MyTimeGraph.add_arc 2 5 tgdomain
let tgdomain = MyTimeGraph.add_arc 4 7 tgdomain
let tgdomain = MyTimeGraph.add_arc 6 1 tgdomain
let tgdomain = MyTimeGraph.add_arc 1 2 tgdomain
let tgdomain = MyTimeGraph.add_arc 3 4 tgdomain
let tgdomain = MyTimeGraph.add_arc 5 6 tgdomain
let tgdomain = MyTimeGraph.add_arc 7 0 tgdomain
(* tempo *)
module MyTime = TimeOfQDGraph(MyTimeGraph)

(** Modello **)
module MyModel = Model(MySpace)(MyTime)
let lavoro_set = MyModel.st_empty
let lavoro_set = MyModel.st_add "alberto" 1 lavoro_set
let lavoro_set = MyModel.st_add "alberto" 3 lavoro_set
let lavoro_set = MyModel.st_add "alberto" 5 lavoro_set
let lavoro_set = MyModel.st_add "alberto" 7 lavoro_set
let lavoro_set = MyModel.st_add "barbara" 0 lavoro_set
let lavoro_set = MyModel.st_add "barbara" 1 lavoro_set
let lavoro_set = MyModel.st_add "barbara" 4 lavoro_set
let lavoro_set = MyModel.st_add "barbara" 5 lavoro_set
let lavoro_set = MyModel.st_add "carlo" 4 lavoro_set
let lavoro_set = MyModel.st_add "carlo" 7 lavoro_set
let env = MyModel.empty_env
let env = MyModel.bind "lavoro" lavoro_set env

(** Logica **)
module MyLogic = Logic(MyModel)
(* formule di prova *)
let fs1 = MyLogic.TRUE
let fs2 = MyLogic.FALSE
let fs3 = MyLogic.PROP("lavoro")
let fs4 = MyLogic.EX(fs3)
let fs5 = MyLogic.AF(fs3)
let fs6 = MyLogic.EG(MyLogic.NOT fs3)
(* let f1 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs1 *)
(* let f2 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs2 *)
(* let f3 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs3 *)
(* let f4 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs4  *)
(* let f5 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs5  *)
(* let f6 = MyLogic.fsyntax_to_formula MyLogic.empty_env env fs6 *)

(* ambiente *)
let fsyntax_env = MyLogic.empty_env
let fsyntax_env = MyLogic.bind_mvar "fs1" fs1 [] fsyntax_env
let fsyntax_env = MyLogic.bind_mvar "fs2" fs2 [] fsyntax_env
let fsyntax_env = MyLogic.bind_mvar "fs3" fs3 [] fsyntax_env
let fsyntax_env = MyLogic.bind_mvar "fs4" fs4 [] fsyntax_env
let fsyntax_env = MyLogic.bind_mvar "fs5" fs5 [] fsyntax_env
let fsyntax_env = MyLogic.bind_mvar "fs6" fs6 [] fsyntax_env

type mutable_env = { mutable env : MyModel.st_pointset MyLogic.parametric_fsyntax MyLogic.Env.t }
let fs_env = { env = fsyntax_env }
