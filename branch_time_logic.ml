(** Segnatura del modello **)
module type MODEL = sig

  type prop
  type space
  type space_point
  type space_pointset
  type time
  type time_point
  type time_pointset

  val string_of_prop : prop -> string
  val string_of_space_point : space_point -> string
  val string_of_space_pointset : space_pointset -> string
  val string_of_time_point : time_point -> string
  val string_of_time_pointset : time_pointset -> string

  val space_mem : space_point -> space_pointset -> bool
  val space_subset : space_pointset -> space_pointset -> bool
  val space_inter : space_pointset -> space_pointset -> space_pointset
  val space_union : space_pointset -> space_pointset -> space_pointset
  val space_complement : space_pointset -> space -> space_pointset
  val space_filter : (space_point -> bool) -> space_pointset -> space_pointset

  val time_mem : time_point -> time_pointset -> bool
  val time_add : time_point -> time_pointset -> time_pointset
  val time_subset : time_pointset -> time_pointset -> bool
  val time_inter : time_pointset -> time_pointset -> time_pointset
  val time_union : time_pointset -> time_pointset -> time_pointset
  val time_diff : time_pointset -> time_pointset -> time_pointset
  val time_complement : time_pointset -> time -> time_pointset
  val time_filter : (time_point -> bool) -> time_pointset -> time_pointset

  val time_pred : time_point -> time -> time_pointset
  val time_next : time_point -> time -> time_pointset
  val time_fold : (time_point -> 'a -> 'a) -> time_pointset -> 'a -> 'a

  val space_set : space -> space_pointset
  val time_set : time -> time_pointset
  val time_empty : time_pointset


  (* Da scrivere meglio *)
  type st_pointset
  val empty_stpt : st_pointset
  val add_stpt : space_point -> time_point -> st_pointset -> st_pointset

  type env = prop -> space_point -> time_pointset
  val empty_env : env
  val bind : prop -> st_pointset -> env -> env

end










(** Modulo della logica: funtore che ad un modulo che rappresenta le formule proposizionali (nella segnatura LANG) restituisce il modulo delle formule in tale segnatura **)
module Logic ( Prop : MODEL ) = struct
    




  (** error handling **)
  let meta_variable_error ide = failwith (Printf.sprintf "meta variable in conversion from fsyntax to formula: %s" ide)
  let da_definire ide = failwith (Printf.sprintf "ancora da definire: %s" ide)






  (** Formule: formule semplici, facili da gestire. Tutte le altre strutture sintattiche vengono convertite in formule, in modo da dover dare semantica solo a queste **)
  type 'a formula =
    T
  | Prop of 'a
  | Not of 'a formula
  | And of ('a formula * 'a formula)
  | Ex of 'a formula
  | Af of 'a formula
  | Eu of ('a formula * 'a formula)


  

 


  (* ho deciso di dividere le variabili funzionali (da fsyntax^n a fsyntax) da quelle che definiscono formule (fsyntax) *)
  (* Il tipo degli identificatori, di variabili, di formule e di metavariabili *)
  type vide = string;;
  type fide = string;;
  type mide = string;;






  (** Fsyntax: sono le formule classiche della logica CTL, adatte a scrivere programmi **)
  (* formule belle da leggere e con costruttori per definire formule a tempo di esecuzione *)
(* CALL serve a richiamare formule definite a tempo di esecuzione attraverso l'ambiente *)
  type 'a fsyntax =
    TRUE 
  | FALSE
  | PROP of Prop.prop
  | NOT of 'a fsyntax
  | AND of ('a fsyntax * 'a fsyntax)
  | OR of ('a fsyntax * 'a fsyntax)
  | AX of 'a fsyntax
  | EX of 'a fsyntax
  | AF of 'a fsyntax
  | EF of 'a fsyntax
  | AG of 'a fsyntax
  | EG of 'a fsyntax
  | AU of ('a fsyntax * 'a fsyntax)
  | EU of ('a fsyntax * 'a fsyntax)
  (* | AW of ('a fsyntax * 'a fsyntax) *)
  (* | EW of ('a fsyntax * 'a fsyntax) *)
  (* richiama la formula identificata da fide *)
  | CALL of (fide * ('a fsyntax) list)
  (* identificatori per metavariabili *)
  | MVAR of mide


  (* conversione a stringa *)
  let rec string_of_fsyntax f =
    match f with
      TRUE -> "T"
    | FALSE -> "F"
    | PROP a -> Prop.string_of_prop a
    | NOT f1 -> Printf.sprintf "!%s" (string_of_fsyntax f1)
    | AND (f1,f2) -> Printf.sprintf "( %s & %s )" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | OR (f1,f2) -> Printf.sprintf "( %s | %s )" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | AX f1 -> Printf.sprintf "AX %s" (string_of_fsyntax f1 )
    | EX f1 -> Printf.sprintf "EX %s" (string_of_fsyntax f1 )
    | AF f1 -> Printf.sprintf "AF %s" (string_of_fsyntax f1 )
    | EF f1 -> Printf.sprintf "EF %s" (string_of_fsyntax f1 )
    | AG f1 -> Printf.sprintf "AG %s" (string_of_fsyntax f1 )
    | EG f1 -> Printf.sprintf "EG %s" (string_of_fsyntax f1 )
    | AU (f1,f2) -> Printf.sprintf "A { %s } U { %s }" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    | EU (f1,f2) -> Printf.sprintf "E { %s } U { %s }" (string_of_fsyntax f1 ) (string_of_fsyntax f2 )
    (* | AW (f1,f2) -> Printf.sprintf "A { %s } W { %s }" (string_of_fsyntax f1 ) (string_of_fsyntax f2 ) *)
    (* | EW (f1,f2) -> Printf.sprintf "E { %s } W { %s }" (string_of_fsyntax f1 ) (string_of_fsyntax f2 ) *)
    | CALL (id,fl) -> Printf.sprintf "%s%s" id (string_of_arglist fl )
    | MVAR (id) -> Printf.sprintf "%s" id

  and string_of_arglist args =
    match args with 
      [] -> ""
    | _ -> Printf.sprintf "[%s]" (string_of_arglist_inner args )
      
  and string_of_arglist_inner args =
    match args with 
      [] -> ""
    | [x] -> string_of_fsyntax x
    | x::xs -> Printf.sprintf "%s,%s" (string_of_fsyntax x ) (string_of_arglist_inner xs )







  (** Ambienti: servono per definire formule durante l'esecuzione del programma **)

  (* Env identifica gli ambienti *)
  module Env = Map.Make(String);;

  (* tipo delle formule con parametri formali *)
  type 'a parametric_fsyntax = 'a fsyntax * mide list;;

  (** un ambiente è una mappa Map(key fide,entry parametric_fsyntax ) **)
  (* ambiente vuoto generico *)
  let empty_env = Env.empty;;
  
  (** di seguito le funzioni per aggiungere elementi all'ambiente **)
  (* Aggiunge o modifica la coppia (id,pfs) all'ambiente dove id è un nome di variabile formula, pfs è un parametric_fsyntax *)
  let bind_mvar =
    fun id fs pl env -> Env.add id (fs,pl) env;;


  (* funzione di sostituzione per meta variabili *)
  let rec sub_mvar =
    fun env big_fs p small_fs -> match big_fs with
      NOT f1 -> NOT ( sub_mvar env f1 p small_fs )
    | AND (f1,f2) -> AND ( sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs )
    | OR (f1,f2) -> OR (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs)
    | AX f1 -> AX (sub_mvar env f1 p small_fs)
    | EX f1 -> EX (sub_mvar env f1 p small_fs)
    | AF f1 -> AF (sub_mvar env f1 p small_fs)
    | EF f1 -> EF (sub_mvar env f1 p small_fs)
    | AG f1 -> AG (sub_mvar env f1 p small_fs)
    | EG f1 -> EG (sub_mvar env f1 p small_fs)
    | AU (f1,f2) -> AU (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs)
    | EU (f1,f2) -> EU (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs)
    (* | AW (f1,f2) -> AW (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs) *)
    (* | EW (f1,f2) -> EW (sub_mvar env f1 p small_fs , sub_mvar env f2 p small_fs) *)
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
  (* !!! Da ricontrollare !!! *)
  let rec fsyntax_to_formula env pr_sem f =
    match f with
      TRUE -> T
    | FALSE -> Not T
    | PROP a -> Prop (pr_sem a)
    | NOT f1 -> Not (fsyntax_to_formula env pr_sem f1)
    | AND (f1,f2) -> And ( (fsyntax_to_formula env pr_sem f1) , (fsyntax_to_formula env pr_sem f2) )
    | OR (f1,f2) -> Not ( And ( Not (fsyntax_to_formula env pr_sem f1) , Not (fsyntax_to_formula env pr_sem f2) ) )
    | AX f1 -> Not (Ex (Not (fsyntax_to_formula env pr_sem f1) ) )
    | EX f1 -> Ex (fsyntax_to_formula env pr_sem f1)
    | AF f1 -> Af (fsyntax_to_formula env pr_sem f1)
    | EF f1 -> Eu (T , (fsyntax_to_formula env pr_sem f1) )
    | AG f1 -> Not (Eu (T ,Not (fsyntax_to_formula env pr_sem f1) ) )
    | EG f1 -> Not ( Af ( Not (fsyntax_to_formula env pr_sem f1) ) )
    | AU (f1,f2) -> let (phi,psi) = (fsyntax_to_formula env pr_sem f1,fsyntax_to_formula env pr_sem f2) in
		    Eu ( And( phi, Not psi ) , And( Not phi, Not psi ) )
    | EU (f1,f2) -> Eu ( (fsyntax_to_formula env pr_sem f1) , (fsyntax_to_formula env pr_sem f2) )
    (* | AW (f1,f2) -> *)
    (* | EW (f1,f2) -> *)
    | CALL (id,fl) -> let (f1,pl) = Env.find id env in
		      fsyntax_to_formula env pr_sem (sub_mvar_list env f1 pl fl)
    | MVAR (id) -> meta_variable_error id









(*** DA SCRIVERE ***) 

  (** funzioni semantiche **)
  let rec sem = fun form sp time ->
    match form with
      T -> Prop.time_set time
    | Prop a -> a sp
    | Not f1 -> Prop.time_complement (sem f1 sp time) time
    | And (f1,f2) -> Prop.time_inter (sem f1 sp time) (sem f2 sp time)
    | Ex f1 -> sem_ex f1 sp time
    | Af f1 -> let f1sem = (sem f1 sp time) in sem_af f1sem (time_pred_set f1sem time) time
    | Eu (f1,f2) -> let (phiset,psiset) = (sem f1 sp time,sem f2 sp time)  in sem_eu phiset psiset psiset time
  
  (* semantica Ex *)
  and sem_ex = fun form sp time ->
    let tset = sem form sp time in
    Prop.time_fold (fun x l -> Prop.time_union (Prop.time_pred x time) l ) tset Prop.time_empty

  (* semantica Af *)
  and time_pred_set = fun tset time ->
    Prop.time_fold (fun tp ts -> Prop.time_union (Prop.time_pred tp time) ts) tset Prop.time_empty

  and af_aux = fun time tp tset_todo ->
    let (tset,todo) = tset_todo in
    let tnext = Prop.time_next tp time in
    if Prop.time_subset tnext tset
    then (Prop.time_add tp tset,Prop.time_union (Prop.time_diff (Prop.time_pred tp time) tset) todo)
    else (tset,todo)

  and sem_af = fun acc todo time ->
    let (acc2,todo2) = Prop.time_fold (af_aux time) todo (acc,Prop.time_empty) in
    if todo2 = Prop.time_empty
    then acc2
    else sem_af acc2 todo2 time
      
  (* semantica Eu *)
  and eu_aux = fun time phiset acc tp tset ->
    let tpred = Prop.time_diff (Prop.time_inter (Prop.time_pred tp time) phiset) acc in
    Prop.time_union tpred tset

  and sem_eu = fun phiset acc todo time ->
    let todo2 = Prop.time_fold (eu_aux time phiset acc) todo Prop.time_empty in
    let acc2 = Prop.time_union acc todo2 in
    if todo2 = Prop.time_empty
    then acc2
    else sem_eu phiset acc2 todo2 time
    





    

end







(****** TESTING!!! DA CANCELLARE!!! ******)

(* module NisekoiProp = struct *)

(*   module StringSet = Set.Make(String) *)
(*   module IntSet = Set.Make( *)
(*     struct *)
(*     let compare = Pervasives.compare *)
(*     type t = int *)
(*   end ) *)

(*   type prop = string *)
(*   type space_point = StringSet.elt *)
(*   type space_pointset = StringSet.t *)
(*   type time_point = IntSet.elt *)
(*   type time_pointset = IntSet.t *)

(*   let string_of_prop = fun x -> x *)
(*   let string_of_space_point = fun x -> x *)
(*   let string_of_space_pointset = fun sp -> String.concat " " (StringSet.elements sp) *)
(*   let string_of_time_point = fun tp -> string_of_int tp *)
(*   let string_of_time_pointset = fun tp -> String.concat " " (List.map string_of_int (IntSet.elements tp ) ) *)

(*   let space_mem = fun x sp -> StringSet.mem x sp *)
(*   let space_subset = fun sp1 sp2 -> StringSet.subset sp1 sp2 *)
(*   let space_inter = fun sp1 sp2 -> StringSet.inter sp1 sp2 *)
(*   let space_union = fun sp1 sp2 -> StringSet.union sp1 sp2 *)
(*   let space_filter = fun fc sp1 -> StringSet.filter fc sp1 *)
  
(*   let time_mem = fun x sp -> IntSet.mem x sp *)
(*   let time_add = fun tp tset -> IntSet.add tp tset *)
(*   let time_subset = fun sp1 sp2 -> IntSet.subset sp1 sp2 *)
(*   let time_inter = fun sp1 sp2 -> IntSet.inter sp1 sp2 *)
(*   let time_union = fun sp1 sp2 -> IntSet.union sp1 sp2 *)
(*   let time_diff = fun sp1 sp2 -> IntSet.diff sp1 sp2 *)
(*   let time_filter = fun fc sp1 -> IntSet.filter fc sp1 *)
(*   let time_fold = IntSet.fold *)




(*   let ra_on = StringSet.add "raku" ( *)
(*     StringSet.add "onodera" StringSet.empty ) *)

(*   let ra_ru = StringSet.add "raku" ( *)
(*     StringSet.add "ruri" StringSet.empty ) *)

(*   let space_set = *)
(*     StringSet.add "raku" ( *)
(*       StringSet.add "onodera" ( *)
(* 	StringSet.add "chitoge" ( *)
(* 	  StringSet.add "ruri" ( *)
(* 	    StringSet.add "mari" StringSet.empty *)
(* 	)))) *)
(*   let time_set = IntSet.add 0 ( *)
(*     IntSet.add 1 ( *)
(*       IntSet.add 2 ( *)
(* 	IntSet.add 3 ( *)
(* 	  IntSet.add 4 ( *)
(*       IntSet.empty *)
(*     ))))) *)
(*   let space_complement = fun sp -> StringSet.diff space_set sp *)

(*   let time_pred = fun t -> match t with *)
(*       0 -> IntSet.add 2 IntSet.empty *)
(*     | 1 -> IntSet.add 0 IntSet.empty *)
(*     | 2 -> IntSet.add 1 (IntSet.add 3 IntSet.empty) *)
(*     | 3 -> IntSet.add 1 IntSet.empty *)
(*     | 4 -> IntSet.add 3 IntSet.empty *)
(*     | _ -> failwith("nocandosville") *)
(*   let time_next = fun t -> match t with *)
(*       0 -> IntSet.add 1 IntSet.empty *)
(*     | 1 -> IntSet.add 2 (IntSet.add 3 IntSet.empty) *)
(*     | 2 -> IntSet.add 0 IntSet.empty *)
(*     | 3 -> IntSet.add 2 (IntSet.add 4 IntSet.empty) *)
(*     | 4 -> IntSet.empty *)
(*     | _ -> failwith("nocandosville") *)
(*   let time_empty = IntSet.empty *)
(*   let time_complement = fun tp -> IntSet.diff time_set tp *)

(*   let time_startpoint = 0 *)
  
(*   let prop_sem = fun p sp -> if (p="prova") *)
(*     then (match sp with *)
(*       "raku" -> IntSet.add 0 (IntSet.add 3 IntSet.empty) *)
(*     | "onodera" -> IntSet.add 1 (IntSet.add 2 (IntSet.add 3 IntSet.empty)) *)
(*     | "chitoge" -> IntSet.add 0 (IntSet.add 1 IntSet.empty) *)
(*     | "ruri" -> IntSet.add 2 IntSet.empty *)
(*     | "mari" -> IntSet.add 4 IntSet.empty *)
(*     | _ -> failwith("I DON'T KNOW!!!!") *)
(*     ) *)
(*     else failwith("I DON'T KNOW!!!!") *)

(* end *)



(* module Nisekoi = Logic(NisekoiProp) *)


(* let fs1 = Nisekoi.TRUE *)
(* let fs2 = Nisekoi.AND(fs1,Nisekoi.NOT fs1) *)
(* let fs3 = Nisekoi.OR(fs1,Nisekoi.NOT fs1) *)
(* let fs4 = Nisekoi.PROP("prova") *)
(* let fs5 = Nisekoi.NOT(fs4) *)
(* let fs6 = Nisekoi.EX(fs4) *)
(* let fs7 = Nisekoi.AF(fs4) *)
(* let fs8 = Nisekoi.EU(Nisekoi.NOT fs4, fs4) *)

(* let env = Nisekoi.empty_env *)

(* let f1 = Nisekoi.fsyntax_to_formula env fs1 *)
(* let f2 = Nisekoi.fsyntax_to_formula env fs2 *)
(* let f3 = Nisekoi.fsyntax_to_formula env fs3 *)
(* let f4 = Nisekoi.fsyntax_to_formula env fs4 *)
(* let f5 = Nisekoi.fsyntax_to_formula env fs5 *)
(* let f6 = Nisekoi.fsyntax_to_formula env fs6 *)
(* let f7 = Nisekoi.fsyntax_to_formula env fs7 *)
(* let f8 = Nisekoi.fsyntax_to_formula env fs8 *)

(* let test = fun fs -> *)
(*   let form = Nisekoi.fsyntax_to_formula env fs in *)
(*   Printf.printf "%s\n" (Nisekoi.string_of_fsyntax fs); *)
(*   NisekoiProp.StringSet.iter *)
(*     (fun s -> Printf.printf "%s %s\n" s (NisekoiProp.string_of_time_pointset (Nisekoi.sem form s ) ) ) *)
(*     NisekoiProp.space_set *)
