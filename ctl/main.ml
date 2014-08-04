open BranchTimeLogic
open Graph
open Model
open BtlConvert
open Interface
open BtlTest2




(* la funzione che fa girare il programma *)
let rec reload() =
  print_newline();
  let lexbuf = Lexing.from_channel stdin in
  try
    let input = Parser.main Lexer.token lexbuf in 
    match input with
      
    (* mostra le formule memorizzate *)
    | Interface.SHOW_FORMULA ->
      MyLogic.print_env fs_env.env; reload()
	
    (** Lascio queste finchè non ho finito di testare la nuova versione **)
    (* memorizza una nuova formula *)
    (* | Interface.LET (ide,fs) -> *)
    (*   fs_env.env <- MyLogic.bind_mvar ide fs [] fs_env.env; reload() *)
	
    (* calcola la semantica di una formula e stampa il risultato *)
    (* | Interface.SEM fride -> *)
    (*   let fs = MyLogic.CALL(fride,[]) in *)
    (*   let fr = MyLogic.fsyntax_to_formula fs_env.env env fs in *)
    (*   let string_of_time_sem = fun x y -> MyModel.string_of_time_pointset (MyLogic.sem fr x tgdomain) in *)
    (*   let nice_string = fun x y -> print_string ((MyModel.string_of_space_point x)^" "); print_string (string_of_time_sem x y); print_newline() in *)
    (*   MyModel.space_fold nice_string (MySpaceGraph.get_nodes sgdomain) (); reload() *)

    (* memorizza una nuova formula *)
    | Interface.LET (ide,fs) ->
      let varlist = MyLogic.mvar_of_fsyntax fs in
      fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env; reload()

    (* calcola la semantica di una formula e stampa il risultato *)
    | Interface.SEM (fride,frnamelist) ->
      let frlist = List.map (fun x -> fst(MyLogic.Env.find x fs_env.env)) frnamelist in
      let fs = MyLogic.CALL(fride,frlist) in
      let fr = MyLogic.fsyntax_to_formula fs_env.env env fs in
      let string_of_time_sem = fun x y -> MyModel.string_of_time_pointset (MyLogic.sem fr x tgdomain) in
      let nice_string = fun x y -> print_string ((MyModel.string_of_space_point x)^" "); print_string (string_of_time_sem x y); print_newline() in
      MyModel.space_fold nice_string (MySpaceGraph.get_nodes sgdomain) (); reload()

    (* funzione di backtrack *)
    | Interface.BACKTRACK (fride,frnamelist,tp) ->
      let frlist = List.map (fun x -> fst(MyLogic.Env.find x fs_env.env)) frnamelist in
      let fs = MyLogic.CALL(fride,frlist) in
      let fr = MyLogic.fsyntax_to_formula fs_env.env env fs in
      let btrlist = fun x -> MyLogic.backtrack fr x tp tgdomain in
      let string_of_backtrack = fun x -> "["^(List.fold_left (fun s y -> s^" "^(MyModel.string_of_time_point y)) "" x )^" ]" in
      let nice_string = fun x ->
	let btrl = btrlist x in
	print_string ((MyModel.string_of_space_point x)^" ");
	if (btrl) = []
	then (print_string "false";
	      print_newline() )
	else (print_string (string_of_backtrack btrl);
	      print_newline() ) in
      MyModel.space_iter nice_string (MySpaceGraph.get_nodes sgdomain);
      reload()

    (* funzione di scrittura *)
    | Interface.SAVE ->
      let oc = open_out "formula.fr" in
      let counter = ref 0 in
      let print_fr = fun x y ->
	let str = "let " ^ x ^ " = " ^ (MyLogic.string_of_fsyntax (fst y) ) ^ ";\n" in
	output oc str (!counter) (String.length str);
	let counter = ref ((!counter) + (String.length str)) in ()
      in
      MyLogic.Env.iter print_fr fs_env.env; close_out oc; reload()
	
    (* funzione di lettura *)
    | Interface.LOAD ->
      let ic = open_in "formula.fr" in
      let control = ref true in
      while !control do
	try
	  let nl = input_line ic in
	  let buf = Lexing.from_string nl in
	  let inp = Parser.main Lexer.token buf in
	  match inp with
	  | Interface.LET (ide,fs) ->
	    let varlist = MyLogic.mvar_of_fsyntax fs in
	    fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env
	  | _ -> control := false
	with
	| _ -> control := false
      done;
      reload()
  	
	
    (* arresta il programma *)
    | Interface.STOP_TEST ->
      ()

  with
  | Lexer.Eof -> ()
  | exn -> 
    let msg = Printexc.to_string exn in
    let curr = lexbuf.Lexing.lex_curr_p in
    let line = curr.Lexing.pos_lnum in
    let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
    let tok = Lexing.lexeme lexbuf in
    Printf.printf "line %d, character %d, token %s: %s\n%!" line cnum tok msg; reload()
      
let _ = reload()
