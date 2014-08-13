open Images
open Bmp
open Bitmap
open Graphic_image
open StlLogic
open Graph
open Model
open StlConvert

(** spazio **)

module MySpacePoint = struct
  type t = int * int
  let string_of_point = fun (x,y) -> Printf.sprintf "(%d,%d)" x y
  let compare = fun (x1,y1) (x2,y2) ->
    if Pervasives.compare x1 x2 = 0
    then Pervasives.compare y1 y2
    else Pervasives.compare x1 x2
end
module MySpaceGraph = QDGraph(MySpacePoint)
module MySpace = SpaceOfQDGraph(MySpaceGraph)

(** tempo **)

module MyTimePoint = struct
  type t = string
  let string_of_point = fun x -> x
  let compare = String.compare
end
module MyTimeGraph = QDGraph(MyTimePoint)
module MyTime = TimeOfQDGraph(MyTimeGraph)

(** modello **)
module MyModel = Model(MySpace)(MyTime)

(** proposizioni **)
module MyProp = struct
  type t =
  | RedRange of int * int
  | GreenRange of int * int
  | BlueRange of int * int
  | Id of string
  let string_of = fun pr ->
    match pr with
    | RedRange (x,y) -> Printf.sprintf "RED [%d,%d]" x y
    | GreenRange (x,y) -> Printf.sprintf "GREEN [%d,%d]" x y
    | BlueRange (x,y) -> Printf.sprintf "BLUE [%d,%d]" x y
    | Id s -> s
  type t_sem = MyModel.st_pointset
  type env = t -> t_sem
  let empty_env = fun pr -> failwith "L'ambiente non è definito su questo input"
  let bind = fun pr (stpset:MyModel.st_pointset) en ->
    match pr with
    | Id s ->
      (fun npr -> match npr with
      | Id t -> if s=t then stpset else en (Id t)
      | x -> en x)
    | _ -> failwith "modifica non consentita" 
end

(** logica **)
module MyLogic = Logic(MyModel)(MyProp)




(** comandi **)

type 'a command =
| SHOW_FORMULA
| LET of string *  'a
| SEM of Graphics.color * string * string list
| BACKTRACK of string * string list * int
| SAVE
| LOAD
| RESET
| STOP_TEST




(** comandi per la grafica **)

(** gestione colori **)
let red color = (color / (256 * 256)) mod 256 
let green color = (color / 256) mod 256 
let blue color = color mod 256
let color_to_rgb = fun c ->
  { r = red c;
    g = green c;
    b = blue c
  }

(** comandi per caricare le immagini **)
let start_graphic = fun un ->
  Graphics.open_graph ""

let setup = fun un ->
  start_graphic();
  Graphics.auto_synchronize false;
  Graphics.display_mode false;
  Graphics.remember_mode true

let rec file_to_image = fun s ->
  try
    let img_bmp = Bmp.load s [] in
    let (img_width,img_height) = Images.size img_bmp in
    let img = Graphic_image.of_image img_bmp in
    (s,img_bmp,img,img_width,img_height)
  with
  | Graphics.Graphic_failure("graphic screen not opened") ->
    let _ = start_graphic "" in
    file_to_image s

let load_image = fun img_name img x y ->
  Graphics.set_window_title img_name;
  Graphics.resize_window x y;
  Graphics.draw_image img 0 0

let save_image = fun s img ->
  Bmp.save s [] img

let reset_screen = fun img_name img img_x img_y ->
  Graphics.clear_graph();
  load_image img_name img img_x img_y

(* modello da immagine *)

let rec digital_subspace (xs,ys) (xe,ye) =
  let init = ref MyModel.space_empty in
  for y = ys to ye do
    for x = xs to xe do
      init := MyModel.space_add (x,y) (!init)
    done
  done;
  !init

let rec set_of_list l =
  match l with 
    [] -> MyModel.space_empty
  | x::xs -> MyModel.space_add x (set_of_list xs)

let space_of_image rgbimg =
  let points =  digital_subspace (0,0) (rgbimg.Rgb24.width - 1,rgbimg.Rgb24.height - 1) in
  let neighbours (x,y) = 
    set_of_list 
      (List.filter 
	 (fun (a,b) -> a >= 0 && a < rgbimg.Rgb24.width && b >= 0 && b < rgbimg.Rgb24.height)
	 [(x-1,y-1);(x-1,y);(x-1,y+1);(x,y-1);(x,y+1);(x+1,y-1);(x+1,y);(x+1,y+1)]) in
  let clos = (fun p -> MyModel.space_fold (fun el res -> MyModel.space_union (neighbours el) res) p p) in
  ( MySpaceGraph.set_nodes points (MySpaceGraph.set_source neighbours (MySpaceGraph.set_destination neighbours (MySpaceGraph.set_closure clos (MySpaceGraph.empty)))) ,
    fun (x,y) -> let rgbcl = Rgb24.get rgbimg x (rgbimg.Rgb24.height - 1 - y) in Graphics.rgb rgbcl.r rgbcl.g rgbcl.b )

(* let xy_to_set_fun = fun (xs,ys) (xe,ye) -> *)
(*   let xlist_y_to_set = fun xl set y -> *)
(*     List.fold_left (fun nset x -> MyModel.space_add (x,y) nset) set xl in *)
(*   let xylist_to_set = fun xl yl set -> *)
(*     List.fold_left (xlist_y_to_set xl) set yl in *)
(*   let xrange = fun x -> *)
(*     if x = xs *)
(*     then x::(x+1)::[] *)
(*     else if x = xe *)
(*     then (x-1)::x::[] *)
(*     else (x-1)::x::(x+1)::[] in *)
(*   let yrange = fun y -> *)
(*     if y = ys *)
(*     then y::(y+1)::[] *)
(*     else if y = ye *)
(*     then (y-1)::y::[] *)
(*     else (y-1)::y::(y+1)::[] in *)
(*     (\* match y with *\) *)
(*     (\* | ys -> y::(y+1)::[] *\) *)
(*     (\* | ye -> (y-1)::y::[] *\) *)
(*     (\* | _ -> (y-1)::y::(y+1)::[] in *\) *)
(*   fun (x,y) set -> xylist_to_set (xrange x) (yrange y) set *)

(* let rec digital_subspace (xs,ys) (xe,ye) = *)
(*   let init = ref MySpaceGraph.empty in *)
(*   let set_point_to_edges = fun set1 pt2 graph -> *)
(*     MySpaceGraph.fold (MySpaceGraph.add_edge pt2) set1 graph *)
(*   in *)
(*   let sets_to_edges = fun set1 set2 graph -> *)
(*     MySpaceGraph.fold (set_point_to_edges set1) set2 graph *)
(*   in *)
(*   let neighbours = fun a b -> xy_to_set_fun (xs,ys) (xe,ye) (a,b) MyModel.space_empty in *)
(*   for y = ys to ye do *)
(*     for x = xs to xe do *)
(*       init := MySpaceGraph.add_node (x,y) (!init); *)
(*       init := sets_to_edges (neighbours x y) (MySpaceGraph.singleton (x,y)) (!init) *)
(*     done *)
(*   done; *)
(*   init := digital_closure (xs,ys) (xe,ye) (!init); *)
(*   !init *)
(* and digital_closure = fun (xs,ys) (xe,ye) graph -> *)
(*   let ncls = fun sset -> MyModel.space_fold (xy_to_set_fun (xs,ys) (xe,ye)) sset sset in *)
(*   MySpaceGraph.set_closure ncls graph *)

(* let matrix_to_space_clrfun = fun mat -> *)
(*   let (mat_width,mat_height) = (Array.length (mat.(0)),Array.length mat) in *)
(*   let space_graph = digital_subspace (0,0) (mat_width - 1,mat_height - 1) in *)
(*   let clrfun = fun (x,y) -> mat.(mat_height - 1 - y).(x) in *)
(*   (space_graph,clrfun) *)

let clrfun_to_stclrfun = fun clrfun ->
  fun stp -> clrfun (MyModel.st_to_space stp)

let image_time_to_model = fun img time ->
  let imgbmp = Graphic_image.image_of img in
  let (space,clrfun) = space_of_image imgbmp in
  let stclrfun = clrfun_to_stclrfun clrfun in
  (MyModel.st_make space time,stclrfun)

let stclrfun_to_prenv = fun stclrfun model ->
  let space = MyModel.st_domain model in
  let smart_filter = (
    fun colfn x y stp ->
      let pclr = (colfn (stclrfun stp)) in
      x <= pclr && pclr <= y
  ) in
  fun pr -> match pr with
  | MyProp.RedRange (x,y) -> MyModel.st_filter (smart_filter red x y) space
  | MyProp.GreenRange (x,y) -> MyModel.st_filter (smart_filter green x y) space
  | MyProp.BlueRange (x,y) -> MyModel.st_filter (smart_filter blue x y) space
  | _ -> MyProp.empty_env pr
 

(** funzioni di pittura **)

let over oc1 oc2 =
  let (c1,c2) = (color_to_rgb oc1,color_to_rgb oc2) in
  let factor = 0.7 in
  let value x y = int_of_float (((float_of_int x) *. factor) +. ((float_of_int y) *. (1.0 -. factor))) in
  let result = { r = value c1.r c2.r;
		 g = value c1.g c2.g;
		 b = value c1.b c2.b; } in
  Graphics.rgb result.r result.g result.b

let paint = fun c stpset ->
  let point_paint = fun stp -> (let (x,y) = MyModel.st_to_space stp in
				let oc = Graphics.point_color x y in
				let nc = over c oc in
				Graphics.set_color nc; Graphics.plot x y
  ) in
  MyModel.st_iter point_paint stpset;
  Graphics.synchronize()
  (* let paint_stp = (fun x -> let sp = MyModel.st_to_space x in Graphics.plot (fst sp) (snd sp)) in *)
  (* MyModel.st_iter paint_stp stpset *)
