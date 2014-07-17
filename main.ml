open BranchTimeLogic
open Graph
open Model
open BtlConvert
open Interface
open BtlTest



(* la funzione che fa girare il programma *)
let rec reload() =
  let lexbuf = Lexing.from_channel stdin in
  let input = Parser.main Lexer.token lexbuf in
  match input with
  
  (* mostra le formule memorizzate *)
  | Interface.SHOW_FORMULA ->
    MyLogic.print_env fs_env.env; print_newline(); reload()
  
  (* memorizza una nuova formula *)
  | Interface.LET (ide,fs) ->
    fs_env.env <- MyLogic.bind_mvar ide fs [] fs_env.env; reload()
  
  (* calcola la semantica di una formula e stampa il risultato *)
  | Interface.SEM fride ->
    let fs = MyLogic.CALL(fride,[]) in
    let fr = MyLogic.fsyntax_to_formula fs_env.env env fs in
    let string_of_time_sem = fun x y -> MyModel.string_of_time_pointset (MyLogic.sem fr x tgdomain) in
    let nice_string = fun x y -> print_string ((MyModel.string_of_space_point x)^" "); print_string (string_of_time_sem x y); print_newline() in
    MyModel.space_fold nice_string (MySpaceGraph.get_nodes sgdomain) (); reload()
  
  (* arresta il programma *)
  | Interface.STOP_TEST ->
    ()

let _ = reload()
