open StlLogic
open Graph
open Model
open StlConvert
open Interface2
open Test



(* DA CANCELLARE *)
let non_definito () = failwith "non definito"




let rgbimg =
  let imagename = Sys.argv.(1) in
  load_image imagename

let time =
  let temp = ref MyTimeGraph.empty in
  temp := MyTimeGraph.add_node 0 (!temp);
  for t = 1 to 10 do
    temp := MyTimeGraph.add_node t (!temp);
    temp := MyTimeGraph.add_edge (t-1) t (!temp)
  done;
  !temp

let (model,pr_env) =
  let mod_env = model_of_image rgbimg time in
  (fst mod_env,ref(snd mod_env))

let _ =
  let pr_set = ref MyModel.st_empty in
  let _ =
    for x = 1 to 100 do
      for y = 1 to 100 do
	pr_set := MyModel.st_add (MyModel.st_make_point (x,y) 0) (!pr_set)
      done
    done
  in
  pr_env := MyProp.bind (MyProp.Id "prova") (!pr_set) (!pr_env)

let fsyntax_env = MyLogic.empty_env
type mutable_env = { mutable env : MyModel.st_pointset MyLogic.parametric_fsyntax MyLogic.Env.t }
let fs_env = { env = fsyntax_env }

let album = ref(model_img_to_album model rgbimg)

let line_counter = ref 0
let t0 = ref 0
let s0 = ref (0,0)
let f0 = ref (MyLogic.FALSE)
let fset0 = ref (MyModel.st_empty)





(* la funzione che fa girare il programma *)
let rec reload() =
  line_counter := (!line_counter) + 1;
  print_newline();
  let lexbuf = Lexing.from_channel stdin in
  try
    let input = Parser.main Lexer.token lexbuf in
    match input with
     
    (* mostra le formule memorizzate *)
    | Interface2.SHOW_STORE ->
      MyLogic.print_env fs_env.env;
      reload()
	
    (* mostra i possibili futuri *)
    | Interface2.SHOW_FUTURE ->
      let time = MyModel.st_time model in
      let tset = MyModel.time_next (!t0) time in
      Printf.printf "%s" (MyModel.string_of_time_pointset tset);
      print_newline();
      reload()

    (* mostra la posizione attuale nello spazio *)
    | Interface2.SHOW_SPACE clr ->
      let point = MyModel.st_make_point (!s0) (!t0) in
      let temp_album = draw_rgb_points (!album) (MyModel.st_add point MyModel.st_empty) (color_to_rgb clr) in
      draw_rgb (temp_album (!t0));
      Printf.printf "Space: (%d,%d)" (fst(!s0)) (snd(!s0));
      print_newline();
      reload()

    (* mostra la posizione attuale nel tempo *)
    | Interface2.SHOW_TIME ->
      Printf.printf "Time: %d" (!t0);
      print_newline();
      reload()

    (* mostra la formula zero attuale *)
    | Interface2.SHOW_FORMULA ->
      Printf.printf "Formula: %s" (MyLogic.string_of_fsyntax (!f0));
      print_newline();
      reload()

    (* fornisce lo stato attuale *)
    | Interface2.SHOW_STATUS ->
      let point = MyModel.st_make_point (!s0) (!t0) in
      Printf.printf "Space: (%d,%d)\n" (fst(!s0)) (snd(!s0));
      Printf.printf "Time: %d\n" (!t0);
      Printf.printf "Formula: %s --> %B\n" (MyLogic.string_of_fsyntax (!f0)) (MyModel.st_mem point (!fset0));
      reload()
	
    (* imposta il punto zero *)
    | Interface2.SET_SPACE (x,y) ->
      s0 := (x,y);
      reload()

    (* imposta il tempo zero *)
    | Interface2.SET_TIME t1 ->
      t0 := t1;
      draw_rgb ((!album) t1);
      reload()

    (* memorizza una nuova formula *)
    | Interface2.LET (ide,fs) ->
      let varlist = MyLogic.mvar_of_fsyntax fs in
      fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env;
      reload()
	
    (* calcola la semantica di una formula e stampa il risultato *)
    | Interface2.SEM (clr,fs) ->
      let fr = MyLogic.fsyntax_to_formula fs_env.env (!pr_env) fs in
      let stset = MyLogic.sem fr model in
      f0 := fs;
      fset0 := stset;
      album := draw_rgb_points (!album) stset (color_to_rgb clr);
      draw_rgb ((!album) (!t0));
      reload ()

    (* come sem ma per formule richiamate con un identificatore *)
    | Interface2.SEM_IDE (clr,fride,frnamelist) ->
      let frlist = List.map (fun x -> fst(MyLogic.Env.find x fs_env.env)) frnamelist in
      let fs = MyLogic.CALL(fride,frlist) in
      let fr = MyLogic.fsyntax_to_formula fs_env.env (!pr_env) fs in
      let stset = MyLogic.sem fr model in
      f0 := fs;
      fset0 := stset;
      album := draw_rgb_points (!album) stset (color_to_rgb clr);
      draw_rgb ((!album) (!t0));
      reload ()
	
    (* funzione di scrittura *)
    | Interface2.SAVE_STORE ->
      let oc = open_out "formula.fr" in
      let counter = ref 0 in
      let print_fr = fun x y ->
	let str = "let " ^ x ^ " = " ^ (MyLogic.string_of_fsyntax (fst y) ) ^ ";\n" in
	output oc str (!counter) (String.length str);
	let counter = ref ((!counter) + (String.length str)) in ()
      in
      MyLogic.Env.iter print_fr fs_env.env;
      close_out oc;
      reload()
	
    (* funzione di salvataggio immagini *)
    | Interface2.SAVE_IMAGE filename ->
      let name_i = fun i -> Printf.sprintf "%s%d.bmp" filename i in
      let save_i = fun i -> save_image ((!album) i) (name_i i) in
      let tdom = MyModel.time_domain (MyModel.st_time model) in
      MyModel.time_iter save_i tdom

    (* funzione di lettura *)
    | Interface2.LOAD_STORE ->
      let ic = open_in "formula.fr" in
      let control = ref true in
      while !control do
	try
	  let nl = input_line ic in
	  let buf = Lexing.from_string nl in
	  let inp = Parser.main Lexer.token buf in
	  match inp with
	  | Interface2.LET (ide,fs) ->
	    let varlist = MyLogic.mvar_of_fsyntax fs in
	    fs_env.env <- MyLogic.bind_mvar ide fs varlist fs_env.env
	  | _ -> control := false
	with
	| _ -> control := false
      done;
      reload()
  	

    (* cancella l'immagine *)
    | Interface2.RESET ->
      album := model_img_to_album model rgbimg;
      draw_rgb ((!album) (!t0));
      reload()
	
    (* ricarica l'immagine *)
    | Interface2.REFRESH ->
      draw_rgb ((!album) (!t0));
      reload()

    (* arresta il programma *)
    | Interface2.STOP_TEST ->
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
      
let _ =
  draw_rgb ((!album) (!t0));
  reload()
