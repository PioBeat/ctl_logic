open StlLogic
open Graph
open Model
open StlConvert

(** spazio **)

module MySpacePoint = struct
  type t = string
  let string_of_point = fun x -> x
  let compare = String.compare
end
module MySpaceGraph = QDGraph(MySpacePoint)
module MySpace = SpaceOfQDGraph(MySpaceGraph)

(** tempo **)

module MyTimePoint = struct
  type t = int
  let string_of_point = fun x -> string_of_int x
  let compare = Pervasives.compare
end
module MyTimeGraph = QDGraph(MyTimePoint)
module MyTime = TimeOfQDGraph(MyTimeGraph)

(** modello **)
module MyModel = Model(MySpace)(MyTime)

(** logica **)
module MyLogic = Logic(MyModel)




(** comandi **)

type 'a command =
| SHOW_FORMULA
| LET of string *  'a
| SEM of string * string list
| BACKTRACK of string * string list * int
| SAVE
| LOAD
| STOP_TEST
