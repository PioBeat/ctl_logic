(** programma per conversione da spazio-tempo a modello **)
open Interface3
open Color

(* dato uno spazio e un'immagine restituisce l'ambiente spaziale relativo all'immagine *)
let space_env_of_image = fun space rgbimg ->
  let points = MySpace.domain space in
  let clr_range = fun pr (x,y) ->
    match pr with
    | MyProp.RedRange (rd,ru) -> let rxy = (Rgb24.get rgbimg x y).r in rd<=rxy && rxy<=ru
    | MyProp.GreenRange (gd,gu) -> let gxy = (Rgb24.get rgbimg x y).g in gd<=gxy && gxy<=gu
    | MyProp.BlueRange (bd,bu) -> let bxy = (Rgb24.get rgbimg x y).b in bd<=bxy && bxy<=bu
    | _ -> MyProp.empty_env pr
  in
    fun pr -> MySpaceGraph.filter (clr_range pr) points

(* data un'immagine crea lo spazio corrispondente *)
let space_of_image rgbimg =
  let points =  digital_subspace (0,0) (rgbimg.Rgb24.width - 1,rgbimg.Rgb24.height - 1) in
  let neighbours (x,y) =
    set_of_list
      (List.filter
	 (fun (a,b) -> a >= 0 && a < rgbimg.Rgb24.width && b >= 0 && b < rgbimg.Rgb24.height)
	 [(x-1,y-1);(x-1,y);(x-1,y+1);(x,y-1);(x,y+1);(x+1,y-1);(x+1,y);(x+1,y+1)]) in
  let clos = (fun p -> MySpaceGraph.fold (fun el res -> MySpaceGraph.union (neighbours el) res) p p) in
  MySpaceGraph.set_nodes points
      (MySpaceGraph.set_source neighbours
	 (MySpaceGraph.set_destination neighbours
	    (MySpaceGraph.set_closure clos (MySpaceGraph.empty))))


(* mappa da timepoint a immagine (album fatto bene) *)
module TimeImgMap = Map.Make(MyTimePoint)


(* data un nome di immagine e un tempo restituisce il modello, l'ambiente e l'album *)
let model_of_imgname_time = fun imgname time ->
  (* costruisce il modello usando una delle immagini *)
  let tdom = MyModel.time_domain time in
  let tpoint_temp = MyTime.choose tdom in
  let img_temp = load_image (imgname^"_"^(MyModel.string_of_time_point tpoint_temp)) in
  let space = space_of_image img_temp in
  let model = MyModel.st_make space time in
  (* costruisce l'album *)
  let album_map = 
    let album_map_temp = ref(TimeImgMap.empty) in
    let _ = MyTime.iter (fun t->
		 album_map_temp:= TimeImgMap.add t (load_image (imgname^"_"^(MyModel.string_of_time_point tpoint_temp))) !(album_map_temp)
		) tdom in
    !(album_map_temp)
  in
  let album = fun t ->
    TimeImgMap.find t album_map
  in
  (* restituisce l'ambiente per valutare le proposizioni *)
  let pr_env = fun pr ->
    match pr with
    | MyProp.Id s -> MyProp.empty_env s
    | _ ->
       let stset = ref (MyModel.st_empty) in
       let smart_iter = fun t -> stset := MyModel.st_union (!stset) (MyModel.st_cartesian_product ((space_env_of_image space (album t)) pr) (MyTime.singleton t)) in
       let _ = MyTime.iter (smart_iter) tdom in
       !stset
  in (model,pr_env,album)


