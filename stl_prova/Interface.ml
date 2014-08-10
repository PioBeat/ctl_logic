open Images
open Bmp
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
    | RedRange (x,y) -> Printf.sprintf "RED[%d,%d]" x y
    | GreenRange (x,y) -> Printf.sprintf "GREEN[%d,%d]" x y
    | BlueRange (x,y) -> Printf.sprintf "Blue[%d,%d]" x y
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
  let init = ref MySpaceGraph.empty in
  for y = ys to ye do
    for x = xs to xe do
      init := MySpaceGraph.add_node (x,y) (!init);
      (if x > 0
       then init := MySpaceGraph.add_edge (x-1,y) (x,y) (!init)
      );
      (if y > 0
       then init := MySpaceGraph.add_edge (x,y-1) (x,y) (!init)
      )
    done
  done;
  init := digital_closure xs ys xe ye (!init);
  (* concettualmente corretto ma lento *)
  (* init := MySpaceGraph.standard_closure (!init); *)
  !init
and digital_closure = fun xs ys xe ye graph ->
  let xlist_y_to_set = fun xl set y ->
    List.fold_left (fun nset x -> MyModel.space_add (x,y) nset) set xl in
  let xylist_to_set = fun xl yl set ->
    List.fold_left (xlist_y_to_set xl) set yl in
  let xrange = fun x ->
    match x with
    | xs -> x::(x+1)::[]
    | xe -> (x-1)::x::[]
    | _ -> (x-1)::x::(x+1)::[] in
  let yrange = fun y ->
    match y with
    | ys -> y::(y+1)::[]
    | ye -> (y-1)::y::[]
    | _ -> (y-1)::y::(y+1)::[] in
  let smart_fold = fun (x,y) set -> xylist_to_set (xrange x) (yrange y) set in
  let ncls = fun sset -> MyModel.space_fold smart_fold sset sset in
  MySpaceGraph.set_closure ncls graph

let matrix_to_space_clrfun = fun mat ->
  let (mat_width,mat_height) = (Array.length (mat.(0)),Array.length mat) in
  let space_graph = digital_subspace (0,0) (mat_width - 1,mat_height - 1) in
  let clrfun = fun (x,y) -> mat.(mat_height - 1 - y).(x) in
  (space_graph,clrfun)

let clrfun_to_stclrfun = fun clrfun ->
  fun stp -> clrfun (MyModel.st_to_space stp)

let image_time_to_model = fun img time ->
  let color_matrix = Graphics.dump_image img in
  let (space,clrfun) = matrix_to_space_clrfun color_matrix in
  let stclrfun = clrfun_to_stclrfun clrfun in
  (MyModel.st_make space time,stclrfun)

let stclrfun_to_prenv = fun stclrfun model ->
  let space = MyModel.st_domain model in
  let smart_filter = (
    fun colfn x y stp ->
      let pclr = (colfn (stclrfun stp)) in
      x <= pclr & pclr <= y
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
