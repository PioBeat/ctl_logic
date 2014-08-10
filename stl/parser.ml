type token =
  | EOL
  | QUOTE
  | COMMA
  | DOLLAR
  | AT
  | FORMULA
  | SHOW
  | SEM
  | BACKTRACK
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
  | N
  | S
  | LBROUND
  | RBROUND
  | LBANGLE
  | RBANGLE
  | LBSQUARE
  | RBSQUARE
  | SAVE
  | LOAD
  | EXIT
  | IDE of (string)
  | INT of (int)

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Interface
# 45 "parser.ml"
let yytransl_const = [|
  257 (* EOL *);
  258 (* QUOTE *);
  259 (* COMMA *);
  260 (* DOLLAR *);
  261 (* AT *);
  262 (* FORMULA *);
  263 (* SHOW *);
  264 (* SEM *);
  265 (* BACKTRACK *);
  266 (* LET *);
  267 (* EQ *);
  268 (* T *);
  269 (* F *);
  270 (* NOT *);
  271 (* AND *);
  272 (* OR *);
  273 (* AX *);
  274 (* EX *);
  275 (* AF *);
  276 (* EF *);
  277 (* AG *);
  278 (* EG *);
  279 (* AU *);
  280 (* EU *);
  281 (* N *);
  282 (* S *);
  283 (* LBROUND *);
  284 (* RBROUND *);
  285 (* LBANGLE *);
  286 (* RBANGLE *);
  287 (* LBSQUARE *);
  288 (* RBSQUARE *);
  289 (* SAVE *);
  290 (* LOAD *);
  291 (* EXIT *);
    0|]

let yytransl_block = [|
  292 (* IDE *);
  293 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\003\000\003\000\005\000\005\000\
\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\003\000\004\000\001\000\001\000\001\000\
\003\000\001\000\001\000\003\000\002\000\003\000\003\000\002\000\
\006\000\002\000\002\000\002\000\002\000\002\000\002\000\006\000\
\006\000\002\000\005\000\002\000\001\000\002\000\001\000\002\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\007\000\008\000\
\033\000\000\000\002\000\000\000\000\000\001\000\000\000\004\000\
\000\000\030\000\000\000\000\000\010\000\011\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\028\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\009\000\012\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\032\000\027\000\000\000\000\000\000\000\024\000\
\025\000\017\000"

let yydgoto = "\002\000\
\009\000\010\000\016\000\036\000\063\000"

let yysindex = "\008\000\
\103\255\000\000\005\255\233\254\235\254\000\000\000\000\000\000\
\000\000\019\255\000\000\242\254\012\255\000\000\242\254\000\000\
\127\255\000\000\246\254\001\255\000\000\000\000\127\255\127\255\
\127\255\127\255\127\255\127\255\127\255\009\255\017\255\127\255\
\021\255\127\255\038\255\051\255\024\255\000\000\051\255\051\255\
\051\255\051\255\051\255\051\255\051\255\127\255\127\255\051\255\
\127\255\047\255\046\255\127\255\127\255\127\255\106\255\152\255\
\154\255\000\000\000\000\051\255\051\255\002\255\048\255\127\255\
\127\255\127\255\000\000\000\000\084\255\102\255\110\255\000\000\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\080\255\000\000\000\000\007\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\088\255\013\255\000\000\018\255\032\255\
\033\255\050\255\055\255\056\255\069\255\000\000\000\000\070\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\076\255\092\255\053\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\241\255\234\255\000\000"

let yytablesize = 170
let yytable = "\018\000\
\039\000\040\000\041\000\042\000\043\000\044\000\045\000\029\000\
\001\000\048\000\011\000\050\000\012\000\026\000\013\000\026\000\
\052\000\053\000\013\000\014\000\013\000\015\000\017\000\055\000\
\056\000\037\000\057\000\026\000\026\000\060\000\061\000\062\000\
\018\000\019\000\018\000\019\000\038\000\015\000\029\000\046\000\
\026\000\069\000\070\000\071\000\026\000\013\000\067\000\047\000\
\026\000\013\000\020\000\049\000\020\000\013\000\054\000\021\000\
\022\000\021\000\022\000\018\000\019\000\052\000\053\000\018\000\
\019\000\052\000\053\000\018\000\019\000\023\000\016\000\023\000\
\016\000\051\000\058\000\059\000\014\000\020\000\014\000\068\000\
\003\000\020\000\021\000\022\000\031\000\020\000\021\000\022\000\
\005\000\000\000\021\000\022\000\015\000\000\000\015\000\000\000\
\023\000\016\000\052\000\053\000\023\000\016\000\000\000\014\000\
\023\000\016\000\000\000\014\000\064\000\003\000\004\000\014\000\
\005\000\000\000\000\000\072\000\052\000\053\000\000\000\015\000\
\052\000\053\000\000\000\015\000\052\000\053\000\000\000\015\000\
\000\000\000\000\019\000\020\000\000\000\073\000\000\000\006\000\
\007\000\008\000\021\000\022\000\023\000\074\000\000\000\024\000\
\025\000\026\000\027\000\028\000\029\000\030\000\031\000\032\000\
\033\000\034\000\065\000\035\000\066\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\052\000\053\000\
\052\000\053\000"

let yycheck = "\015\000\
\023\000\024\000\025\000\026\000\027\000\028\000\029\000\001\001\
\001\000\032\000\006\001\034\000\036\001\001\001\036\001\003\001\
\015\001\016\001\001\001\001\001\003\001\036\001\011\001\046\000\
\047\000\036\001\049\000\015\001\016\001\052\000\053\000\054\000\
\001\001\001\001\003\001\003\001\036\001\036\001\032\001\031\001\
\028\001\064\000\065\000\066\000\032\001\028\001\062\000\031\001\
\036\001\032\001\001\001\031\001\003\001\036\001\031\001\001\001\
\001\001\003\001\003\001\028\001\028\001\015\001\016\001\032\001\
\032\001\015\001\016\001\036\001\036\001\001\001\001\001\003\001\
\003\001\036\001\028\001\030\001\001\001\028\001\003\001\032\001\
\001\001\032\001\028\001\028\001\032\001\036\001\032\001\032\001\
\001\001\255\255\036\001\036\001\001\001\255\255\003\001\255\255\
\028\001\028\001\015\001\016\001\032\001\032\001\255\255\028\001\
\036\001\036\001\255\255\032\001\003\001\007\001\008\001\036\001\
\010\001\255\255\255\255\032\001\015\001\016\001\255\255\028\001\
\015\001\016\001\255\255\032\001\015\001\016\001\255\255\036\001\
\255\255\255\255\004\001\005\001\255\255\032\001\255\255\033\001\
\034\001\035\001\012\001\013\001\014\001\032\001\255\255\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\003\001\029\001\003\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\015\001\016\001\
\015\001\016\001"

let yynames_const = "\
  EOL\000\
  QUOTE\000\
  COMMA\000\
  DOLLAR\000\
  AT\000\
  FORMULA\000\
  SHOW\000\
  SEM\000\
  BACKTRACK\000\
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
  N\000\
  S\000\
  LBROUND\000\
  RBROUND\000\
  LBANGLE\000\
  RBANGLE\000\
  LBSQUARE\000\
  RBSQUARE\000\
  SAVE\000\
  LOAD\000\
  EXIT\000\
  "

let yynames_block = "\
  IDE\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'command) in
    Obj.repr(
# 45 "parser.mly"
                           ( _1 )
# 244 "parser.ml"
               : Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "parser.mly"
                                ( SHOW_FORMULA )
# 250 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 49 "parser.mly"
                                ( SEM (_2,[]) )
# 257 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 50 "parser.mly"
                                ( SEM (_2,_3) )
# 265 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 51 "parser.mly"
                                ( LET (_2,_4) )
# 273 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
                                ( SAVE )
# 279 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
                                ( LOAD )
# 285 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                                ( STOP_TEST )
# 291 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 57 "parser.mly"
                                                     ( _2 )
# 298 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
                                                     ( MyLogic.TRUE )
# 304 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
                                                     ( MyLogic.FALSE )
# 310 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 60 "parser.mly"
                                                     ( MyLogic.PROP _2 )
# 317 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 61 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 324 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 332 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 340 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 64 "parser.mly"
                                                     ( MyLogic.NEAR _2 )
# 347 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( MyLogic.SURR (_3,_5) )
# 355 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 66 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 362 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 67 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 369 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 68 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 376 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 69 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 383 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 70 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 390 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 71 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 397 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 72 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 405 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 73 "parser.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 413 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 420 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 75 "parser.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 428 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 76 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 435 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 79 "parser.mly"
                      ( _1::[] )
# 442 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 80 "parser.mly"
                      ( _1::_2 )
# 450 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 83 "parser.mly"
                      ( _1::[] )
# 457 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 84 "parser.mly"
                      ( _1::[] )
# 465 "parser.ml"
               : 'formulalist))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command)
