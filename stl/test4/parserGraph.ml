type token =
  | EOF
  | QUOTE
  | COMMA
  | SEMICOLON
  | LBROUND
  | RBROUND
  | LBCURLY
  | RBCURLY
  | LBSQUARE
  | RBSQUARE
  | RARROW
  | DIGRAPH
  | EXIT
  | IDE of (string)
  | INT of (int)

open Parsing;;
let _ = parse_error;;
# 2 "parserGraph.mly"
  open Graph
  open Interface

  let rec add_node_list = fun nl time ->
    match nl with
    | [] -> time
    | x::xs -> add_node_list xs (MyTimeGraph.add_node x time)

  let rec add_arc_list = fun al time ->
    match al with
    | [] -> time
    | (a,b)::abs -> add_arc_list abs (MyTimeGraph.add_arc a b time)

# 35 "parserGraph.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* QUOTE *);
  258 (* COMMA *);
  259 (* SEMICOLON *);
  260 (* LBROUND *);
  261 (* RBROUND *);
  262 (* LBCURLY *);
  263 (* RBCURLY *);
  264 (* LBSQUARE *);
  265 (* RBSQUARE *);
  266 (* RARROW *);
  267 (* DIGRAPH *);
  268 (* EXIT *);
    0|]

let yytransl_block = [|
  269 (* IDE *);
  270 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\000\000"

let yylen = "\002\000\
\005\000\003\000\002\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\006\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\003\000\004\000\001\000\002\000"

let yydgoto = "\002\000\
\004\000\007\000\008\000"

let yysindex = "\001\000\
\250\254\000\000\254\254\000\000\248\254\255\254\249\254\005\255\
\248\254\010\000\008\255\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\009\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\250\255"

let yytablesize = 12
let yytable = "\010\000\
\011\000\001\000\013\000\005\000\003\000\006\000\006\000\012\000\
\009\000\014\000\015\000\005\000"

let yycheck = "\007\001\
\007\000\001\000\009\000\006\001\011\001\014\001\014\001\003\001\
\010\001\000\000\003\001\003\001"

let yynames_const = "\
  EOF\000\
  QUOTE\000\
  COMMA\000\
  SEMICOLON\000\
  LBROUND\000\
  RBROUND\000\
  LBCURLY\000\
  RBCURLY\000\
  LBSQUARE\000\
  RBSQUARE\000\
  RARROW\000\
  DIGRAPH\000\
  EXIT\000\
  "

let yynames_block = "\
  IDE\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'grapharg) in
    Obj.repr(
# 35 "parserGraph.mly"
                                          ( _3 )
# 118 "parserGraph.ml"
               : Interface.MyTimeGraph.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'grapharg) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'arcdescription) in
    Obj.repr(
# 39 "parserGraph.mly"
                                         ( let (nl,al) = _2 in
					  add_arc_list al (add_node_list nl _1)
					)
# 128 "parserGraph.ml"
               : 'grapharg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'arcdescription) in
    Obj.repr(
# 42 "parserGraph.mly"
                                    ( let (nl,al) = _1 in
				      add_arc_list al (add_node_list nl MyTimeGraph.empty)
				    )
# 137 "parserGraph.ml"
               : 'grapharg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arcdescription) in
    Obj.repr(
# 47 "parserGraph.mly"
                                 ( let (nl,al) = _3 in
				   (_1::nl,(_1,List.hd nl)::al)
				 )
# 147 "parserGraph.ml"
               : 'arcdescription))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 50 "parserGraph.mly"
                                 ( (_1::[],[]) )
# 154 "parserGraph.ml"
               : 'arcdescription))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Interface.MyTimeGraph.t)
