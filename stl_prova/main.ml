open StlLogic
open Graph
open Model
open StlConvert
open Interface2
open Test


(** test vari **)

let _ = setup
let (img_name,img_bmp,img,img_x,img_y) = file_to_image "prova.bmp"
let _ = load_image img_name img img_x img_y
(* let _ = save_image "prova.bmp" img_bmp *)
(* let _ = reset_screen img_name img img_x img_y *)

(* modello e ambienti *)
let time = MyTimeGraph.add_node "start" MyTimeGraph.empty
(* let time = MyTimeGraph.add_edge "start" "start" time *)
let (st,stclrfun) = image_time_to_model img time
let env = stclrfun_to_prenv stclrfun st
let fsyntax_env = MyLogic.empty_env
type mutable_env = { mutable env : MyModel.st_pointset MyLogic.parametric_fsyntax MyLogic.Env.t }
let fs_env = { env = fsyntax_env }





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
	
    (* memorizza una nuova formula *)
    | Interface.LET (ide,fs) ->
      let varlist = MyLogic.mvar_of_fsyntax fs in
      fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env; reload()
	
    (* calcola la semantica di una formula e stampa il risultato *)
    (* | Interface.SEM (fride,frnamelist) -> *)
    (*   let frlist = List.map (fun x -> fst(MyLogic.Env.find x fs_env.env)) frnamelist in *)
    (*   let fs = MyLogic.CALL(fride,frlist) in *)
    (*   let fr = MyLogic.fsyntax_to_formula fs_env.env env fs in *)
    (*   let string_of_sem = MyModel.string_of_st_pointset (MyLogic.sem fr st) in *)
    (*   print_string string_of_sem; *)
    (*   print_newline (); *)
    (*   reload() *)
    | Interface.SEM (clr,fride,frnamelist) ->
      let frlist = List.map (fun x -> fst(MyLogic.Env.find x fs_env.env)) frnamelist in
      let fs = MyLogic.CALL(fride,frlist) in
      let fr = MyLogic.fsyntax_to_formula fs_env.env env fs in
      let stpset = MyLogic.sem fr st in
      paint clr stpset;
      reload ()
	
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
  	

    (* resetta l'interfaccia *)
    | Interface.RESET ->
      reset_screen img_name img img_x img_y;
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
