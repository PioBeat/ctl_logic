open Images
open Graphics

(* Printf.printf "Usage: %s base_image base_time_table image_output_dir time_output_file max_wait" Sys.argv.(0) *)

(* nomi dei files, colori dei bus, dati di input *)
let baseimagename = Sys.argv.(1) (* "data/edinburgh.bmp" *)
let basetimetable = Sys.argv.(2) (* "data/bustimetable.txt" *)

let imagename = Sys.argv.(3) (* "maps/map" *)
let dotname = Sys.argv.(4) (* "data/time.dot" *)

let augmentvalue = int_of_string Sys.argv.(5) (* 3 *)

let clr = fun i busnumber ->
  let r = 155 + (100*i / busnumber) in
 {
  r = r;
  g = 0;
  b = 0;
}





let save_image img filename =
  Bmp.save filename [] (Rgb24 img)

let load_image filename =
  match Bmp.load filename [] with
  | Rgb24 rgbimg -> rgbimg
  |  _ -> failwith "Only RGB24 bmp images supported at the moment."

let baseimage  = load_image baseimagename
let basex = baseimage.Rgb24.width
let basey = baseimage.Rgb24.height

let color_pt = fun (x,y) clr img ->
  let tmp_img = ref img in
  let _ =
    for i = x-2 to x+2 do
      for j = y-2 to y+2 do
	if i>=0 && i<=basex && j>=0 && j<=basey
	then Rgb24.set (!tmp_img) i j clr
      done
    done in
  !tmp_img



let rec pow = fun x y ->
  if y=0
  then 1
  else x*(pow x (y-1))


(* la cifra piu significativa a destra *)
(* la codifica e' la seguente:
 1: ha aspettato il bus 1
 ...
 4: nessun autobus ha aspettato
*)
let rec base_b = fun n k b ->
  if k=0
  then []
  else (n mod b)::(base_b (n / b) (k-1) b)

(* controlla che ci siano alpiù k stop per ogni bus*)
(* restituisce 0 se è tutto ok *)
let rec wait_limit_aux = fun ln k ar ->
  let lmax = Array.fold_left (fun x y -> max x y) 0 ar in
  if lmax <= k
  then match ln with
       | [] -> 0
       | 0::sln -> wait_limit_aux sln k ar
       | n::sln ->
	  let _ = Array.set ar n (ar.(n) +1) in
	  wait_limit_aux sln k ar
  else 1
  and wait_limit = fun ln k busnumber -> wait_limit_aux ln k (Array.make (busnumber+1) 0)

let count_occurences = fun l x ->
  let fl = List.filter (fun y -> y=x) l in
  List.length fl

let write_dot = fun ch str ->
  output ch str 0 (String.length str)

let sap = fun ls ->
  List.fold_left (fun s n -> s^"9"^(string_of_int n)) "" (List.sort (-) ls)



let model_of_timetable = fun mat busnumber ->
  (* file dot per la parte temporale *)
  let dot = open_out dotname in
  let _ = write_dot dot "digraph {\n" in
  let old_in = ref [] in
  let l = Array.length mat.(0) in
  for i = 0 to l-1 do
    for j = 0 to (pow (busnumber + 1) i)-1 do
      (* tl è la rappresentazione in lista di uno stato *)
      let tl = base_b j i (busnumber+1) in
      if wait_limit tl augmentvalue busnumber = 0
      then (
	(* scrittura del file dot - parte temporale *)
	let _ = match tl with
	  | [] -> write_dot dot "0;\n"
	  | [n] -> write_dot dot ("0 -> 9"^(string_of_int n)^";\n")
	  | hd::stl -> 
	     if not (List.mem (sap stl,sap tl) (!old_in))
	     then (
	       write_dot dot ((sap stl)^" -> "^(sap tl)^";\n");
	       old_in := (sap stl,sap tl)::(!old_in)
	     )
	in
	let _ = if i = l-1 then 
		  match tl with
		  | [] -> write_dot dot "0;\n"
		  | [n] -> write_dot dot ("0 -> 9"^(string_of_int n)^";\n")
		  | hd::stl -> 
		     if not (List.mem (sap tl,sap tl) (!old_in))
		       then (
		       write_dot dot ((sap tl)^" -> "^(sap tl)^";\n");
		       old_in := (sap tl,sap tl)::(!old_in)
		     )
	in
	(* creazione e salvataggio dell'immagine - parte spaziale *)
	if tl = []
	then
	  let tmpimg = ref(Rgb24.copy baseimage) in
	  for i = 0 to (Array.length mat) -1 do
	    tmpimg := color_pt mat.(i).(0) (clr i busnumber) (!tmpimg)
	  done;
	  save_image (!tmpimg) (imagename^"_0.bmp")
	else if tl = List.sort (-) tl
	then
	  let lmo k = (List.length tl) - (count_occurences tl (k+1)) in
	  let tmpstep = Array.init busnumber lmo in
	  let tmpimg = ref(Rgb24.copy baseimage) in
	  for i = 0 to busnumber -1 do
	    tmpimg:= color_pt mat.(i).(tmpstep.(i)) (clr i busnumber) (!tmpimg)
	  done;
	  save_image (!tmpimg) (imagename^"_"^(sap tl)^".bmp")
      )
    done
  done;
  write_dot dot "}"
	    




let transpose_matrix = fun mat ->
  let (h,w) = (Array.length mat,Array.length mat.(0)) in
  let nmat = Array.make_matrix w h (0,0) in
  let _ =
    for i = 0 to w-1 do
      for j = 0 to h-1 do
	Array.set nmat.(i) j mat.(j).(i)
      done
    done in
  nmat



let mat =
  let ch = open_in basetimetable in
  let buf = Lexing.from_channel ch in
  let tmat = ParserBus.main LexerBus.token buf in
  transpose_matrix tmat

let busnumber = Array.length mat

let _ = model_of_timetable mat busnumber
