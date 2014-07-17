type token =
  | EOL
  | FORMULA
  | SHOW
  | SEM
  | LET
  | EQ
  | T
  | EXIT
  | IDE of (string)

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Interface
  open BtlTest
# 18 "parser.ml"
let yytransl_const = [|
  257 (* EOL *);
  258 (* FORMULA *);
  259 (* SHOW *);
  260 (* SEM *);
  261 (* LET *);
  262 (* EQ *);
  263 (* T *);
  264 (* EXIT *);
    0|]

let yytransl_block = [|
  265 (* IDE *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\003\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\004\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\005\000\007\000\000\000\
\002\000\003\000\000\000\001\000\000\000\006\000\004\000"

let yydgoto = "\002\000\
\007\000\008\000\015\000"

let yysindex = "\002\000\
\253\254\000\000\002\255\254\254\255\254\000\000\000\000\005\255\
\000\000\000\000\003\255\000\000\004\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000"

let yytablesize = 11
let yytable = "\003\000\
\004\000\005\000\001\000\009\000\006\000\012\000\010\000\011\000\
\013\000\000\000\014\000"

let yycheck = "\003\001\
\004\001\005\001\001\000\002\001\008\001\001\001\009\001\009\001\
\006\001\255\255\007\001"

let yynames_const = "\
  EOL\000\
  FORMULA\000\
  SHOW\000\
  SEM\000\
  LET\000\
  EQ\000\
  T\000\
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
# 18 "parser.mly"
                           ( _1 )
# 89 "parser.ml"
               : BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 21 "parser.mly"
                        ( SHOW_FORMULA )
# 95 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 22 "parser.mly"
                        ( SEM _2 )
# 102 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 23 "parser.mly"
                        ( LET (_2,_4) )
# 110 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 24 "parser.mly"
                        ( STOP_TEST )
# 116 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 27 "parser.mly"
                        ( MyLogic.TRUE )
# 122 "parser.ml"
               : 'fsyntax))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command)
