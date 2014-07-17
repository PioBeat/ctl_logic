type token =
  | EOL
  | FORMULA
  | SHOW
  | SEM
  | EXIT
  | IDE of (string)

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Interface
# 14 "parser.ml"
let yytransl_const = [|
  257 (* EOL *);
  258 (* FORMULA *);
  259 (* SHOW *);
  260 (* SEM *);
  261 (* EXIT *);
    0|]

let yytransl_block = [|
  262 (* IDE *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\004\000\005\000\000\000\002\000\
\003\000\001\000"

let yydgoto = "\002\000\
\006\000\007\000"

let yysindex = "\002\000\
\253\254\000\000\002\255\255\254\000\000\000\000\005\255\000\000\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000"

let yytablesize = 6
let yytable = "\003\000\
\004\000\005\000\001\000\008\000\009\000\010\000"

let yycheck = "\003\001\
\004\001\005\001\001\000\002\001\006\001\001\001"

let yynames_const = "\
  EOL\000\
  FORMULA\000\
  SHOW\000\
  SEM\000\
  EXIT\000\
  "

let yynames_block = "\
  IDE\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'command) in
    Obj.repr(
# 14 "parser.mly"
                           ( _1 )
# 77 "parser.ml"
               : Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 17 "parser.mly"
                        ( SHOW_FORMULA )
# 83 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 18 "parser.mly"
                        ( SEM _2 )
# 90 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 19 "parser.mly"
                        ( STOP_TEST )
# 96 "parser.ml"
               : 'command))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Interface.command)
