(** Segnatura del modello **)
module type MODEL = sig

    (* spazio *)

    
    type space
    type space_point
    type space_pointset
    
    val string_of_space_point : space_point -> string
    val string_of_space_pointset : space_pointset -> string
      
    val space_mem : space_point -> space_pointset -> bool
    val space_singleton : space_point -> space_pointset
    val space_choose : space_pointset -> space_point
    val space_add : space_point -> space_pointset -> space_pointset
    val space_diff : space_pointset -> space_pointset -> space_pointset
    val space_subset : space_pointset -> space_pointset -> bool
    val space_inter : space_pointset -> space_pointset -> space_pointset
    val space_union : space_pointset -> space_pointset -> space_pointset
    val space_complement : space_pointset -> space -> space_pointset
    val space_filter : (space_point -> bool) -> space_pointset -> space_pointset
    val space_iter : (space_point -> unit) -> space_pointset -> unit
    val space_fold : (space_point -> 'a -> 'a) -> space_pointset -> 'a -> 'a

    val space_domain : space -> space_pointset
    val space_empty : space_pointset

    val space_pred : space_point -> space -> space_pointset
    val space_next : space_point -> space -> space_pointset
    val space_closure : space_pointset -> space -> space_pointset

    (* tempo *)

    type time
    type time_point
    type time_pointset

    val string_of_time_point : time_point -> string
    val string_of_time_pointset : time_pointset -> string

    val time_mem : time_point -> time_pointset -> bool
    val time_singleton : time_point -> time_pointset
    val time_add : time_point -> time_pointset -> time_pointset
    val time_subset : time_pointset -> time_pointset -> bool
    val time_inter : time_pointset -> time_pointset -> time_pointset
    val time_union : time_pointset -> time_pointset -> time_pointset
    val time_diff : time_pointset -> time_pointset -> time_pointset
    val time_choose : time_pointset -> time_point
    val time_complement : time_pointset -> time -> time_pointset
    val time_remove : time_point -> time_pointset -> time_pointset
    val time_filter : (time_point -> bool) -> time_pointset -> time_pointset
    val time_iter : (time_point -> unit) -> time_pointset -> unit
    val time_fold : (time_point -> 'a -> 'a) -> time_pointset -> 'a -> 'a

    val time_pred : time_point -> time -> time_pointset
    val time_next : time_point -> time -> time_pointset

    val time_domain : time -> time_pointset
    val time_empty : time_pointset


    (* spazio-tempo *)
    type st
    type st_point
    type st_pointset

    val string_of_st_point : st_point -> string
    val string_of_st_pointset : st_pointset -> string
    
    val st_mem : st_point -> st_pointset -> bool
    val	st_add : st_point -> st_pointset -> st_pointset
    val st_remove : st_point -> st_pointset -> st_pointset
    val st_subset : st_pointset -> st_pointset -> bool
    val st_diff : st_pointset -> st_pointset -> st_pointset
    val st_inter : st_pointset -> st_pointset -> st_pointset
    val st_union : st_pointset -> st_pointset -> st_pointset
    val st_complement : st_pointset -> st -> st_pointset
    val st_filter : (st_point -> bool) -> st_pointset -> st_pointset
    val st_iter : (st_point -> unit) -> st_pointset -> unit
    val st_fold : (st_point -> 'a -> 'a) -> st_pointset -> 'a -> 'a

    val st_make : space -> time -> st
    val st_make_point : space_point -> time_point -> st_point
    val st_space_section : st_pointset -> time_point -> space_pointset
    val st_time_section : st_pointset -> space_point -> time_pointset
    val st_cartesian_product : space_pointset -> time_pointset -> st_pointset

    val st_space_closure : st_pointset -> st -> st_pointset

    val st_time_pred : st_point -> st -> st_pointset
    val st_time_next : st_point -> st -> st_pointset

    val st_domain : st -> st_pointset
    val st_empty : st_pointset

    val st_space : st -> space
    val st_time : st -> time

    val st_to_space : st_point -> space_point
    val st_to_time : st_point -> time_point


    
    

end



(* segnatura delle proposizioni *)
module type PROP = sig

  type t
  type t_sem
  type env = t -> t_sem

  val string_of : t -> string
  
  val empty_env : env
  val bind : t -> t_sem -> env -> env

end








(** Modulo della logica **)
module Logic ( Model : MODEL ) ( Prop : PROP ) = struct
    




  (** error handling **)
  let meta_variable_error ide = failwith (Printf.sprintf "meta variable in conversion from fsyntax to formula: %s" ide)






  (** formule **)
  type 'a formula =
    T
  | Prop of 'a
  | Not of 'a formula
  | And of ('a formula * 'a formula)
  | N of 'a formula
  | S of ('a formula * 'a formula)
  | Ex of 'a formula
  | Af of 'a formula
  | Eu of ('a formula * 'a formula)


  

 


  (* Il tipo delle variabili per formule e delle metavariabili *)
  type fide = string;;
  type mide = string;;






  (** fsyntax **)
  type 'a fsyntax =
    TRUE
  | FALSE
  | PROP of Prop.t
  | NOT of 'a fsyntax
  | AND of ('a fsyntax * 'a fsyntax)
  | OR of ('a fsyntax * 'a fsyntax)
  | NEAR of 'a fsyntax
  | SURR of ('a fsyntax * 'a fsyntax)
  | AX of 'a fsyntax
  | EX of 'a fsyntax
  | AF of 'a fsyntax
  | EF of 'a fsyntax
  | AG of 'a fsyntax
  | EG of 'a fsyntax
  | AU of ('a fsyntax * 'a fsyntax)
  | EU of ('a fsyntax * 'a fsyntax)
  (* richiama la formula identificata da fide *)
  | CALL of (fide * ('a fsyntax) list)
  (* identificatori per metavariabili *)
  | MVAR of mide







  (* conversione a stringa *)
  let rec string_of_fsyntax f =
    match f with
      TRUE -> "T"
    | FALSE -> "F"
    | PROP a -> Printf.sprintf "<%s>" (Prop.string_of a)
    | NOT f1 -> Printf.sprintf "!%s" (string_of_fsyntax f1)
    | AND (f1,f2) -> Printf.sprintf "( %s & %s )" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | OR (f1,f2) -> Printf.sprintf "( %s | %s )" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | NEAR f1 -> Printf.sprintf "N %s" (string_of_fsyntax f1 )
    | SURR (f1,f2) -> Printf.sprintf "S [ %s , %s ]" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | AX f1 -> Printf.sprintf "AX %s" (string_of_fsyntax f1 )
    | EX f1 -> Printf.sprintf "EX %s" (string_of_fsyntax f1 )
    | AF f1 -> Printf.sprintf "AF %s" (string_of_fsyntax f1 )
    | EF f1 -> Printf.sprintf "EF %s" (string_of_fsyntax f1 )
    | AG f1 -> Printf.sprintf "AG %s" (string_of_fsyntax f1 )
    | EG f1 -> Printf.sprintf "EG %s" (string_of_fsyntax f1 )
    | AU (f1,f2) -> Printf.sprintf "AU [ %s , %s ]" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | EU (f1,f2) -> Printf.sprintf "EU [ %s , %s ]" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | CALL (id,fl) -> Printf.sprintf "$%s%s" id (string_of_arglist fl )
    | MVAR (id) -> Printf.sprintf "@%s" id

  and string_of_arglist args =
    match args with 
      [] -> ""
    | _ -> Printf.sprintf "[%s]" (string_of_arglist_inner args)
      
  and string_of_arglist_inner args =
    match args with 
      [] -> ""
    | [x] -> string_of_fsyntax x
    | x::xs -> Printf.sprintf "%s,%s" (string_of_fsyntax x ) (string_of_arglist_inner xs )    






  (** ambienti **)

  (* Env identifica gli ambienti *)
  module Env = Map.Make(String);;
  module MvarSet = Set.Make(String);;

  (* tipo delle formule con parametri formali *)
  type 'a parametric_fsyntax = 'a fsyntax * mide list;;

  (** un ambiente è una mappa Map(key mide,entry parametric_fsyntax ) **)
  (* ambiente vuoto generico *)
  let empty_env = Env.empty;;



  (* funzioni di stampa *)
  let print_env = fun env ->
    let print_head = fun x lv ->
      if lv = [] then print_string ( x ^ " --> ")
      else (print_string ( x ^ " "); print_string ((String.concat " " lv)^" --> ")) in
    let print_tail = fun y -> print_string (string_of_fsyntax y); in
    let nice_print = fun x y -> let (fr,varlist) = y in
				print_head x varlist;
				print_tail fr;
				print_newline() in
    Env.iter nice_print env


  
  (** modifica dell'ambiente **)
  (* Aggiunge o modifica la coppia (id,pfs) all'ambiente dove id è un nome di variabile formula, pfs è un parametric_fsyntax *)
  let bind_mvar =
    fun id fs pl env -> Env.add id (fs,pl) env;;


  (* restituisce una lista delle metavariabili in fs *)
  let rec mvar_of_fsyntax_aux =
fun fs -> match fs with
      NOT f1 -> mvar_of_fsyntax_aux f1
    | AND (f1,f2) -> let (mvs1,mvs2) = (mvar_of_fsyntax_aux f1,mvar_of_fsyntax_aux f2) in
  		     MvarSet.union mvs1 mvs2
    | OR (f1,f2) -> let (mvs1,mvs2) = (mvar_of_fsyntax_aux f1,mvar_of_fsyntax_aux f2) in
  		    MvarSet.union mvs1 mvs2
    | NEAR f1 -> mvar_of_fsyntax_aux f1
    | SURR (f1,f2) -> let (mvs1,mvs2) = (mvar_of_fsyntax_aux f1,mvar_of_fsyntax_aux f2) in
  		      MvarSet.union mvs1 mvs2
    | AX f1 -> mvar_of_fsyntax_aux f1
    | EX f1 -> mvar_of_fsyntax_aux f1
    | AF f1 -> mvar_of_fsyntax_aux f1
    | EF f1 -> mvar_of_fsyntax_aux f1
    | AG f1 -> mvar_of_fsyntax_aux f1
    | EG f1 -> mvar_of_fsyntax_aux f1
    | AU (f1,f2) -> let (mvs1,mvs2) = (mvar_of_fsyntax_aux f1,mvar_of_fsyntax_aux f2) in
  		    MvarSet.union mvs1 mvs2
    | EU (f1,f2) -> let (mvs1,mvs2) = (mvar_of_fsyntax_aux f1,mvar_of_fsyntax_aux f2) in
  		    MvarSet.union mvs1 mvs2
    | MVAR (id) -> MvarSet.add id MvarSet.empty
    | x -> MvarSet.empty

  and mvar_of_fsyntax = fun fs -> MvarSet.elements (mvar_of_fsyntax_aux fs);;


  (* aggiunge la formula all'ambiente (senza dover dichiarare esplicitamente le variabili) *)
  let add_mvar =
    fun id fs env -> bind_mvar id fs (mvar_of_fsyntax fs) env;;


  (* funzione di sostituzione per meta variabili *)
  let rec sub_mvar =
    fun env big_fs p small_fs -> match big_fs with
      NOT f1 -> NOT ( sub_mvar env f1 p small_fs )
    | AND (f1,f2) -> AND ( sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs )
    | OR (f1,f2) -> OR (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs)
    | NEAR f1 -> NEAR ( sub_mvar env f1 p small_fs )
    | SURR (f1,f2) -> SURR ( sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs )
    | AX f1 -> AX (sub_mvar env f1 p small_fs)
    | EX f1 -> EX (sub_mvar env f1 p small_fs)
    | AF f1 -> AF (sub_mvar env f1 p small_fs)
    | EF f1 -> EF (sub_mvar env f1 p small_fs)
    | AG f1 -> AG (sub_mvar env f1 p small_fs)
    | EG f1 -> EG (sub_mvar env f1 p small_fs)
    | AU (f1,f2) -> AU (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs)
    | EU (f1,f2) -> EU (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs)
    (* identificatori per formule *)
    | CALL ( id1 , fsl ) -> CALL(id1, List.map (fun x -> (sub_mvar env x p small_fs)) fsl )
    (* identificatori per variabili *)
    | MVAR (id) -> if (p=id) then small_fs else MVAR(id)
    | x -> x
  
  and sub_mvar_list =
  	fun env form pl small_fsl -> match (pl,small_fsl) with
	  ( [] , [] ) -> form
	| ( p::ps , f::fs ) -> sub_mvar_list env (sub_mvar env form p f) ps fs
	| ( [] , fs ) -> failwith "the function has too many arguments"
	| ( ps , [] ) -> failwith "the function has too few arguments"

  
      








  (* conversione da fsyntax a formula *)
  let rec fsyntax_to_formula env pr_sem f = fsyntax_to_formula_aux (ref env) (ref pr_sem) f

  and fsyntax_to_formula_aux envref pr_semref f =
    match f with
      TRUE -> T
    | FALSE -> Not T
    | PROP a -> Prop (ref((!pr_semref) a))
    | NOT f1 -> Not (fsyntax_to_formula_aux envref pr_semref f1)
    | AND (f1,f2) -> And ( (fsyntax_to_formula_aux envref pr_semref f1) , (fsyntax_to_formula_aux envref pr_semref f2) )
    | OR (f1,f2) -> Not ( And ( Not (fsyntax_to_formula_aux envref pr_semref f1) , Not (fsyntax_to_formula_aux envref pr_semref f2) ) )
    | NEAR f1 -> N (fsyntax_to_formula_aux envref pr_semref f1)
    | SURR (f1,f2) -> S (fsyntax_to_formula_aux envref pr_semref f1,fsyntax_to_formula_aux envref pr_semref f2)
    | AX f1 -> Not (Ex (Not (fsyntax_to_formula_aux envref pr_semref f1) ) )
    | EX f1 -> Ex (fsyntax_to_formula_aux envref pr_semref f1)
    | AF f1 -> Af (fsyntax_to_formula_aux envref pr_semref f1)
    | EF f1 -> Eu (T , (fsyntax_to_formula_aux envref pr_semref f1) )
    | AG f1 -> Not (Eu (T ,Not (fsyntax_to_formula_aux envref pr_semref f1) ) )
    | EG f1 -> Not ( Af ( Not (fsyntax_to_formula_aux envref pr_semref f1) ) )
    | AU (f1,f2) -> let (phi,psi) = (fsyntax_to_formula_aux envref pr_semref f1,fsyntax_to_formula_aux envref pr_semref f2) in
		    Eu ( And( phi, Not psi ) , And( Not phi, Not psi ) )
    | EU (f1,f2) -> Eu ( (fsyntax_to_formula_aux envref pr_semref f1) , (fsyntax_to_formula_aux envref pr_semref f2) )
    | CALL (id,fl) -> let (f1,pl) = Env.find id (!envref) in
		      fsyntax_to_formula_aux envref pr_semref (sub_mvar_list envref f1 pl fl)
    | MVAR (id) -> meta_variable_error id









  (** funzioni semantiche **)
  let rec sem = fun form stref -> sem_aux form (ref stref)

  and sem_aux = fun form stref ->
    match form with
      T -> Model.st_domain (!stref)
    | Prop a -> !a
    | Not f1 -> Model.st_complement (sem_aux f1 stref) (!stref)
    | And (f1,f2) -> Model.st_inter (sem_aux f1 stref) (sem_aux f2 stref)
    | N f1 -> let phiset = sem_aux f1 stref in
	      sem_n phiset stref
    | S (f1,f2) -> let psiset = sem_aux f2 stref in
		   let phiset = sem_aux f1 stref in
		   sem_s phiset psiset stref
    | Ex f1 -> let phiset = sem_aux f1 stref in
	       sem_ex phiset stref
    | Af f1 -> let acc = ref(sem_aux f1 stref) in
    	       let todo = ref(Model.st_complement (!acc) (!stref)) in
    	       let control = ref(if (!todo) = Model.st_empty then false else true) in
    	       let _ = sem_af acc todo control stref in
    	       !acc
    (* | Eu (f1,f2) -> let acc = ref(sem f2 st) in *)
    (* 		    let phiset = ref(Prop.st_diff (sem f1 st) (!acc)) in *)
    (* 		    let todo = ref(Prop.st_inter (sem_ex (!acc) st) (!phiset)) in *)
    (* 		    let _ = sem_eu acc phiset todo st in *)
    (* 		    !acc *)
    | Eu (f1,f2) -> let acc = sem_aux f2 stref in
		    let phiset = sem_aux f1 stref in
		    sem_eu acc phiset stref

  (* semantica n *)
  and sem_n = fun phiset stref ->
    Model.st_space_closure phiset (!stref)

  (* semantica s *)
  and sem_s_aux = fun p q space ->
    let r = ref p in
    let pORq = Model.space_union p q in
    let t = ref (Model.space_diff (Model.space_closure pORq space) pORq) in
    while not (Model.space_empty = (!t)) do
      let x = Model.space_choose (!t) in
      let n = Model.space_diff (Model.space_inter (Model.space_pred x space) (!r)) q in
      r := Model.space_diff (!r) n;
      t := Model.space_diff (Model.space_union (!t) n) (Model.space_singleton x)
    done;
    (!r)

  and sem_s = fun phiset psiset stref ->
    let (space,time) = (Model.st_space (!stref),Model.st_time (!stref)) in
    let tdom = Model.time_domain time in
    let phi_sec = Model.st_space_section phiset in
    let psi_sec = Model.st_space_section psiset in
    let smart_fold = fun t stpset -> (
      let p = phi_sec t in
      let q = psi_sec t in
      let cl_section_t = sem_s_aux p q space in
      (* let cl_section_t = Model.st_cartesian_product (sem_s_aux p q space) (Model.time_singleton t) in *)
      Model.space_fold (fun s stset -> Model.st_add (Model.st_make_point s t) stset) cl_section_t stpset
    (* Model.st_union cl_section_t stpset *)
    ) in
    Model.time_fold smart_fold tdom Model.st_empty
    (* let black_points = Model.st_union psiset (!acc) in *)
    (* let new_layer = Model.st_diff (Model.st_space_closure (!acc) st) black_points in *)
    (* if new_layer = Model.st_empty *)
    (* then () *)
    (* else ( *)
    (*   acc := Model.st_union (!acc) new_layer; *)
    (*   sem_s psiset acc st *)
    (* ) *)

  (* semantica ex *)
  and sem_ex = fun phiset stref ->
    let st = !stref in
    let smart_union = fun x sts -> Model.st_union (Model.st_time_pred x st) sts in
    Model.st_fold smart_union phiset Model.st_empty
    
  (* semantica af *)
  and sem_af_aux = fun acc todo control stref x ->
    let nset = Model.st_time_next x (!stref) in
    if Model.st_subset nset (!acc)
    then (
      acc := Model.st_add x (!acc);
      todo := Model.st_remove x (!todo);
      control := true
    )
    else ()

  and sem_af = fun acc todo control stref ->
    if (!control)
    then (
      control := false;
      Model.st_iter (sem_af_aux acc todo control stref) (!todo);
      sem_af acc todo control stref
    )
    else ()

  (* semantica eu *)
  (* and sem_eu = fun acc todo phiset st -> *)
  (*   acc := Prop.st_union (!acc) (!todo); *)
  (*   phiset := Prop.st_diff (!phiset) (!todo); *)
  (*   todo := Prop.st_inter (sem_ex (!todo) st) (!phiset); *)
  (*   if !todo = Prop.st_empty *)
  (*   then () *)
  (*   else sem_eu acc todo phiset st *)
  and sem_eu = fun acc phiset stref ->
    let new_acc = Model.st_union acc (Model.st_inter (sem_ex acc stref) phiset) in
    if Model.st_diff new_acc acc = Model.st_empty
    then new_acc
    else sem_eu new_acc phiset stref


  (* funzioni di backtrack *)
  (* let rec backtrack = fun form sp tp time -> *)

    

end
