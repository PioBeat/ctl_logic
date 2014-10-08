open StlLogic
open Graph
open Model
open StlConvert
open Interface3
open Test3




let rgbimg = Test3.rgbimg
let oldalbum = ref(Test3.album)
let album = ref(!oldalbum)

let time = Test3.time
let (model,pr_env) = (Test3.model,ref Test3.pr_env)

let fsyntax_env = Test3.fsyntax_env
type mutable_env = Test3.mutable_env
let fs_env = Test3.fs_env

let store_name =
  if Sys.argv.(3) = ""
  then "formula.fr"
  else Sys.argv.(3)

let _ =
  let _ =
    if Sys.file_exists store_name
    then 0
    else Sys.command ("touch "^store_name)
  in
  let ic = open_in store_name in
  let control = ref true in
  while !control do
    try
      let nl = input_line ic in
      let buf = Lexing.from_string nl in
      let inp = Parser3.main Lexer3.token buf in
      match inp with
      | Interface3.LET (ide,fs) ->
	 let varlist = MyLogic.mvar_of_fsyntax fs in
	 fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env
      | _ -> control := false
    with
    | _ -> control := false
  done



let line_counter = ref 0
let t0 = ref 0
let s0 = ref (0,0)
let f0 = ref (MyLogic.FALSE)
let fset0 = ref (MyModel.st_empty)





(* la funzione che fa girare il programma *)
let rec reload() =
  print_newline();
  let lexbuf = Lexing.from_channel stdin in
  try
    let input = Parser3.main Lexer3.token lexbuf in
    match input with
     
    (* mostra le formule memorizzate *)
    | Interface3.SHOW_STORE ->
      MyLogic.print_env fs_env.env;
      reload()
	
    (* mostra i possibili futuri *)
    | Interface3.SHOW_FUTURE ->
      let time = MyModel.st_time model in
      let tset = MyModel.time_next (!t0) time in
      let (x,y) = xyimage_to_xyspace rgbimg (!s0) in
      let smart_print = fun t ->
	let point = MyModel.st_make_point (x,y) t in
	Printf.printf "%s --> %B\n" (MyModel.string_of_time_point t) (MyModel.st_mem point (!fset0))
      in
      Printf.printf "Space: (%d,%d)\nFormula: %s\n" (fst(!s0)) (snd(!s0)) (MyLogic.string_of_fsyntax (!f0));
      MyModel.time_iter smart_print tset;
      reload()

    (* mostra la posizione attuale nello spazio *)
    | Interface3.SHOW_SPACE clr ->
      let (x,y) = xyimage_to_xyspace rgbimg (!s0) in
      let point = MyModel.st_make_point (x,y) (!t0) in
      let temp_album = draw_rgb_points (!album) (MyModel.st_add point MyModel.st_empty) (color_to_rgb clr) in
      draw_rgb (temp_album (!t0));
      Printf.printf "Space: (%d,%d)" (fst(!s0)) (snd(!s0));
      print_newline();
      reload()

    (* mostra la posizione attuale nel tempo *)
    | Interface3.SHOW_TIME ->
      Printf.printf "Time: %d" (!t0);
      print_newline();
      reload()

    (* mostra la formula zero attuale *)
    | Interface3.SHOW_FORMULA ->
      Printf.printf "Formula: %s" (MyLogic.string_of_fsyntax (!f0));
      print_newline();
      reload()

    (* fornisce lo stato attuale *)
    | Interface3.SHOW_STATUS ->
      let (x,y) = xyimage_to_xyspace rgbimg (!s0) in
      let point = MyModel.st_make_point (x,y) (!t0) in
      Printf.printf "Space: (%d,%d)\n" (fst(!s0)) (snd(!s0));
      Printf.printf "Time: %d\n" (!t0);
      Printf.printf "Formula: %s --> %B\n" (MyLogic.string_of_fsyntax (!f0)) (MyModel.st_mem point (!fset0));
      reload()
	
    (* imposta il punto zero *)
    | Interface3.SET_SPACE (x,y) ->
      s0 := (x,y);
      reload()

    (* imposta il tempo zero *)
    | Interface3.SET_TIME t1 ->
      t0 := t1;
      draw_rgb ((!album) t1);
      reload()

    (* memorizza una nuova formula *)
    | Interface3.LET (ide,fs) ->
      let varlist = MyLogic.mvar_of_fsyntax fs in
      fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env;
      reload()
	
    (* calcola la semantica di una formula e stampa il risultato *)
    | Interface3.SEM (clr,fs) ->
      let fr = MyLogic.fsyntax_to_formula fs_env.env (!pr_env) fs in
      let stset = MyLogic.sem fr model in
      f0 := fs;
      fset0 := stset;
      album := draw_rgb_points (!album) stset (color_to_rgb clr);
      draw_rgb ((!album) (!t0));
      reload ()

    (* come sem ma per formule richiamate con un identificatore *)
    | Interface3.SEM_IDE (clr,fride,frnamelist) ->
      let frlist = List.map (fun x -> fst(MyLogic.Env.find x fs_env.env)) frnamelist in
      let fs = MyLogic.CALL(fride,frlist) in
      let fr = MyLogic.fsyntax_to_formula fs_env.env (!pr_env) fs in
      let stset = MyLogic.sem fr model in
      f0 := fs;
      fset0 := stset;
      album := draw_rgb_points (!album) stset (color_to_rgb clr);
      draw_rgb ((!album) (!t0));
      reload ()

    (* calcola il backtrack di una formula *)
    | Interface3.BACKTRACK (fs) ->
      let fbt = MyLogic.fsyntax_to_btformula fs_env.env (!pr_env) fs in
      let sxy = Interface3.xyimage_to_xyspace rgbimg (!s0) in
      let stpl = MyLogic.backtrack fbt model (MyModel.st_make_point sxy (!t0)) in
      let str = String.concat " -> " (List.map MyModel.string_of_st_point stpl) in
      Printf.printf "bt: %s" str;
      print_newline();
      reload()

    (* funzione di scrittura *)
    | Interface3.SAVE_STORE ->
      let oc = open_out store_name in
      let counter = ref 0 in
      let print_fr = fun x y ->
	let str = "let " ^ x ^ " = " ^ (MyLogic.string_of_fsyntax (fst y) ) ^ ";\n" in
	output oc str (!counter) (String.length str)
	
      in
      MyLogic.Env.iter print_fr fs_env.env;
      close_out oc;
      reload()
	
    (* funzione di salvataggio immagini *)
    | Interface3.SAVE_IMAGE filename ->
      let name_i = fun i -> Printf.sprintf "images/%s%d.bmp" filename i in
      let save_i = fun i -> save_image ((!album) i) (name_i i) in
      let tdom = MyModel.time_domain (MyModel.st_time model) in
      MyModel.time_iter save_i tdom;
      reload()

    (* funzione di lettura *)
    | Interface3.LOAD_STORE ->
      let ic = open_in store_name in
      let control = ref true in
      while !control do
	try
	  let nl = input_line ic in
	  let buf = Lexing.from_string nl in
	  let inp = Parser3.main Lexer3.token buf in
	  match inp with
	  | Interface3.LET (ide,fs) ->
	    let varlist = MyLogic.mvar_of_fsyntax fs in
	    fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env
	  | _ -> control := false
	with
	| _ -> control := false
      done;
      reload()

    (* cancella l'immagine *)
    | Interface3.RESET ->
      album := (!oldalbum);
      draw_rgb ((!album) (!t0));
      reload()
	
    (* ricarica l'immagine *)
    | Interface3.REFRESH ->
      draw_rgb ((!album) (!t0));
      reload()

    (* arresta il programma *)
    | Interface3.STOP_TEST ->
      ()
	
  with
  | Lexer3.Eof -> ()
  | exn ->
    let msg = Printexc.to_string exn in
    let curr = lexbuf.Lexing.lex_curr_p in
    let line = curr.Lexing.pos_lnum in
    let cnum = curr.Lexing.pos_cnum - curr.Lexing.pos_bol in
    let tok = Lexing.lexeme lexbuf in
    Printf.printf "line %d, character %d, token %s: %s\n%!" line cnum tok msg; reload()
      
let _ =
  draw_rgb ((!album) (!t0));
  reload()
