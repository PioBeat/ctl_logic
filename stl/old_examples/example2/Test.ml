open StlLogic
open Graph
open Model
open StlConvert
open Interface



let BIG_RADIUS = 250;;
let SMALL_RADIUS = 100;;
let THICKENESS = 2;;


let time =
  let temp = ref MyTimeGraph.empty in
  temp := MyTimeGraph.add_node 0 (!temp);
  for t = 1 to 10 do
    temp := MyTimeGraph.add_node t (!temp);
    temp := MyTimeGraph.add_arc (t-1) t (!temp)
  done;
  temp := MyTimeGraph.add_node 11 (!temp);
  temp := MyTimeGraph.add_arc 5 11 (!temp);
  for t = 12 to 15 do
    temp := MyTimeGraph.add_node t (!temp);
    temp := MyTimeGraph.add_arc (t-1) t (!temp)
  done;
  for t = 1 to 15 do
    temp := MyTimeGraph.add_arc t t (!temp)
  done;
  !temp

let rgbimg = Rgb24.make 600 450 (Interface.color_to_rgb Graphics.black)

let circle_image x0 y0 r_red r_green =
  let newrgbimg = rgbimg in
  let red = Interface.color_to_rgb Graphics.red in
  let green = Interface.color_to_rgb Graphics.green in
  let white = Interface.color_to_rgb Graphics.white in
  let _ = for x = 0 to 599 do
      for y = 0 to 449 do
	let dsq = (x-x0)*(x-x0) + (y-y0)*(y-y0) in
	if dsq < r_green*r_green 
	then Rgb24.set newrgbimg x y green
	else if (x-x0)*(x-x0) + (y-y0)*(y-y0) < r_red*r_red
	then Rgb24.set newrgbimg x y red
	else Rgb24.set newrgbimg x y white
      done
    done in
  newrgbimg

let (model,_) =
  let mod_env = model_of_image rgbimg time in
  (fst mod_env,ref(snd mod_env))


let pr_env = ref(fun pr -> Interface.MyProp.empty_env "La proposizione non è definita")

let _ =
  let smart_filter = fun choice stp ->
  let (sp,t) = (MyModel.st_to_space stp,MyModel.st_to_time stp) in
  let (r1,r2) =
    if t<11
    then match choice with
    | 0 -> ((SMALL_RADIUS - THICKENESS + t*10),(SMALL_RADIUS + t*10))
    | 1 -> (0,(SMALL_RADIUS - THICKENESS + t*10))
    | _ -> (0,0)
    else match choice with
    | 0 -> ((BIG_RADIUS - THICKENESS - t*10),(BIG_RADIUS - t*10))
    | 1 -> (0,(BIG_RADIUS - THICKENESS - t*10))
    | _ -> (0,0)
  in
  let (x,y) = sp in
  let (x0,y0) = if t<11
    then ((200 + t*20) , 225)
    else ((100 + t*20) , 225) in
  (x-x0)*(x-x0) + (y-y0)*(y-y0) < r2*r2 &&
    (x-x0)*(x-x0) + (y-y0)*(y-y0) >= r1*r1
  in
  let spset = MyModel.st_domain model in
  pr_env := Interface.MyProp.bind (Interface.MyProp.Id "r") (MyModel.st_filter (smart_filter 0) spset) (!pr_env);
  pr_env := Interface.MyProp.bind (Interface.MyProp.Id "g") (MyModel.st_filter (smart_filter 1) spset) (!pr_env)



let album = fun t ->
  if t<11
  then circle_image (200 + t*20) 225 (SMALL_RADIUS + t*10) (SMALL_RADIUS - THICKENESS + t*10)
  else circle_image (100 + t*20) 225 (BIG_RADIUS - t*10) (BIG_RADIUS - THICKENESS - t*10)


let fsyntax_env = MyLogic.empty_env
type mutable_env = { mutable env : MyModel.st_pointset MyLogic.parametric_fsyntax MyLogic.Env.t }
let fs_env = { env = fsyntax_env }
