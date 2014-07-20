type token =
  | EOL
  | QUOTE
  | COMMA
  | DOLLAR
  | AT
  | FORMULA
  | SHOW
  | SEM
  | LET
  | EQ
  | T
  | F
  | NOT
  | AND
  | OR
  | AX
  | EX
  | AF
  | EF
  | AG
  | EG
  | AU
  | EU
  | LBROUND
  | RBROUND
  | LBANGLE
  | RBANGLE
  | LBSQUARE
  | RBSQUARE
  | EXIT
  | IDE of (string)

open Parsing;;
# 2 "parser.mly"
  open Interface
  open BtlTest
# 39 "parser.ml"
let yytransl_const = [|
  257 (* EOL *);
  258 (* QUOTE *);
  259 (* COMMA *);
  260 (* DOLLAR *);
  261 (* AT *);
  262 (* FORMULA *);
  263 (* SHOW *);
  264 (* SEM *);
  265 (* LET *);
  266 (* EQ *);
  267 (* T *);
  268 (* F *);
  269 (* NOT *);
  270 (* AND *);
  271 (* OR *);
  272 (* AX *);
  273 (* EX *);
  274 (* AF *);
  275 (* EF *);
  276 (* AG *);
  277 (* EG *);
  278 (* AU *);
  279 (* EU *);
  280 (* LBROUND *);
  281 (* RBROUND *);
  282 (* LBANGLE *);
  283 (* RBANGLE *);
  284 (* LBSQUARE *);
  285 (* RBSQUARE *);
  286 (* EXIT *);
    0|]

let yytransl_block = [|
  287 (* IDE *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\003\000\
\003\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\003\000\004\000\001\000\003\000\001\000\
\001\000\003\000\002\000\003\000\003\000\002\000\002\000\002\000\
\002\000\002\000\002\000\006\000\006\000\002\000\002\000\001\000\
\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\026\000\000\000\
\002\000\000\000\000\000\001\000\000\000\004\000\000\000\025\000\
\000\000\000\000\008\000\009\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\022\000\023\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\007\000\010\000\000\000\000\000\000\000\000\000\000\000\
\000\000\020\000\021\000"

let yydgoto = "\002\000\
\007\000\008\000\014\000\032\000"

let yysindex = "\006\000\
\053\255\000\000\012\255\240\254\245\254\000\000\000\000\030\255\
\000\000\006\255\033\255\000\000\006\255\000\000\075\255\000\000\
\017\255\019\255\000\000\000\000\075\255\075\255\075\255\075\255\
\075\255\075\255\075\255\025\255\039\255\075\255\045\255\059\255\
\000\000\000\000\059\255\059\255\059\255\059\255\059\255\059\255\
\059\255\075\255\075\255\088\255\031\255\075\255\075\255\009\255\
\051\255\000\000\000\000\059\255\059\255\075\255\075\255\049\255\
\055\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\076\255\000\000\000\000\081\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\089\255\
\000\000\000\000\007\255\010\255\013\255\016\255\026\255\027\255\
\043\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\046\255\056\255\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\027\000\235\255"

let yytablesize = 113
let yytable = "\035\000\
\036\000\037\000\038\000\039\000\040\000\041\000\001\000\011\000\
\044\000\011\000\014\000\054\000\014\000\015\000\010\000\015\000\
\016\000\009\000\016\000\011\000\048\000\049\000\046\000\047\000\
\052\000\053\000\017\000\018\000\017\000\018\000\012\000\011\000\
\056\000\057\000\014\000\011\000\013\000\015\000\014\000\016\000\
\016\000\015\000\015\000\019\000\016\000\019\000\012\000\033\000\
\012\000\034\000\017\000\018\000\042\000\055\000\017\000\018\000\
\013\000\051\000\013\000\003\000\004\000\005\000\046\000\047\000\
\046\000\047\000\043\000\019\000\046\000\047\000\012\000\019\000\
\046\000\047\000\012\000\045\000\003\000\058\000\017\000\018\000\
\013\000\024\000\006\000\059\000\013\000\019\000\020\000\021\000\
\000\000\005\000\022\000\023\000\024\000\025\000\026\000\027\000\
\028\000\029\000\030\000\000\000\031\000\046\000\047\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\050\000"

let yycheck = "\021\000\
\022\000\023\000\024\000\025\000\026\000\027\000\001\000\001\001\
\030\000\003\001\001\001\003\001\003\001\001\001\031\001\003\001\
\001\001\006\001\003\001\031\001\042\000\043\000\014\001\015\001\
\046\000\047\000\001\001\001\001\003\001\003\001\001\001\025\001\
\054\000\055\000\025\001\029\001\031\001\025\001\029\001\013\000\
\025\001\029\001\010\001\001\001\029\001\003\001\001\001\031\001\
\003\001\031\001\025\001\025\001\028\001\003\001\029\001\029\001\
\001\001\027\001\003\001\007\001\008\001\009\001\014\001\015\001\
\014\001\015\001\028\001\025\001\014\001\015\001\025\001\029\001\
\014\001\015\001\029\001\031\001\001\001\029\001\004\001\005\001\
\025\001\001\001\030\001\029\001\029\001\011\001\012\001\013\001\
\255\255\001\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\023\001\024\001\255\255\026\001\014\001\015\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\025\001"

let yynames_const = "\
  EOL\000\
  QUOTE\000\
  COMMA\000\
  DOLLAR\000\
  AT\000\
  FORMULA\000\
  SHOW\000\
  SEM\000\
  LET\000\
  EQ\000\
  T\000\
  F\000\
  NOT\000\
  AND\000\
  OR\000\
  AX\000\
  EX\000\
  AF\000\
  EF\000\
  AG\000\
  EG\000\
  AU\000\
  EU\000\
  LBROUND\000\
  RBROUND\000\
  LBANGLE\000\
  RBANGLE\000\
  LBSQUARE\000\
  RBSQUARE\000\
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
# 40 "parser.mly"
                           ( _1 )
# 204 "parser.ml"
               : BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parser.mly"
                                ( SHOW_FORMULA )
# 210 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 44 "parser.mly"
                                ( SEM (_2,[]) )
# 217 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 45 "parser.mly"
                                ( SEM (_2,_3) )
# 225 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 46 "parser.mly"
                                ( LET (_2,_4) )
# 233 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
                                ( STOP_TEST )
# 239 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 50 "parser.mly"
                                                     ( _2 )
# 246 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
                                                     ( MyLogic.TRUE )
# 252 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
                                                     ( MyLogic.FALSE )
# 258 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 53 "parser.mly"
                                                     ( MyLogic.PROP _2 )
# 265 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 54 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 272 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 55 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 280 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 56 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 288 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 57 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 295 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 58 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 302 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 59 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 309 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 60 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 316 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 61 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 323 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 330 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 338 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 64 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 346 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 353 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 360 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
                      ( _1::[] )
# 367 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 70 "parser.mly"
                      ( _1::_2 )
# 375 "parser.ml"
               : 'arglist))
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
