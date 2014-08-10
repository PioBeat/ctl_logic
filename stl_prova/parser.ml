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
  | RED
  | GREEN
  | BLUE
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
  | RESET
  | EXIT
  | IDE of (string)
  | INT of (int)

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Interface
# 49 "parser.ml"
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
  267 (* RED *);
  268 (* GREEN *);
  269 (* BLUE *);
  270 (* EQ *);
  271 (* T *);
  272 (* F *);
  273 (* NOT *);
  274 (* AND *);
  275 (* OR *);
  276 (* AX *);
  277 (* EX *);
  278 (* AF *);
  279 (* EF *);
  280 (* AG *);
  281 (* EG *);
  282 (* AU *);
  283 (* EU *);
  284 (* N *);
  285 (* S *);
  286 (* LBROUND *);
  287 (* RBROUND *);
  288 (* LBANGLE *);
  289 (* RBANGLE *);
  290 (* LBSQUARE *);
  291 (* RBSQUARE *);
  292 (* SAVE *);
  293 (* LOAD *);
  294 (* RESET *);
  295 (* EXIT *);
    0|]

let yytransl_block = [|
  296 (* IDE *);
  297 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\004\000\004\000\006\000\006\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\002\000\003\000\004\000\004\000\001\000\001\000\001\000\
\001\000\003\000\001\000\001\000\003\000\006\000\006\000\006\000\
\002\000\003\000\003\000\002\000\006\000\002\000\002\000\002\000\
\002\000\002\000\002\000\006\000\006\000\002\000\005\000\002\000\
\001\000\002\000\001\000\002\000\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\007\000\008\000\
\009\000\040\000\000\000\002\000\037\000\038\000\039\000\000\000\
\000\000\001\000\000\000\000\000\000\000\004\000\000\000\000\000\
\000\000\000\000\000\000\011\000\012\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\034\000\000\000\032\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
\013\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\036\000\031\000\000\000\000\000\000\000\
\000\000\000\000\000\000\014\000\015\000\016\000\028\000\029\000\
\021\000"

let yydgoto = "\002\000\
\010\000\011\000\016\000\022\000\043\000\077\000"

let yysindex = "\017\000\
\096\255\000\000\017\255\087\255\238\254\000\000\000\000\000\000\
\000\000\000\000\044\255\000\000\000\000\000\000\000\000\018\255\
\047\255\000\000\022\255\126\255\022\255\000\000\027\255\035\255\
\042\255\046\255\054\255\000\000\000\000\126\255\126\255\126\255\
\126\255\126\255\126\255\126\255\055\255\074\255\126\255\080\255\
\126\255\075\255\251\254\000\000\083\255\000\000\084\255\085\255\
\086\255\251\254\251\254\251\254\251\254\251\254\251\254\251\254\
\126\255\126\255\251\254\126\255\002\255\095\255\126\255\126\255\
\126\255\116\255\133\255\137\255\067\255\104\255\141\255\000\000\
\000\000\251\254\251\254\253\254\110\255\120\255\121\255\122\255\
\126\255\126\255\126\255\000\000\000\000\129\255\130\255\131\255\
\006\255\031\255\076\255\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\156\255\000\000\007\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\166\255\000\000\008\255\000\000\000\000\000\000\
\000\000\016\255\029\255\037\255\043\255\056\255\062\255\070\255\
\000\000\000\000\078\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\081\255\089\255\134\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\235\255\227\255\000\000"

let yytablesize = 169
let yytable = "\044\000\
\050\000\051\000\052\000\053\000\054\000\055\000\056\000\033\000\
\030\000\059\000\030\000\061\000\063\000\064\000\063\000\064\000\
\017\000\001\000\017\000\063\000\064\000\017\000\012\000\063\000\
\064\000\030\000\030\000\069\000\070\000\022\000\071\000\022\000\
\072\000\074\000\075\000\076\000\021\000\023\000\030\000\023\000\
\095\000\033\000\030\000\024\000\018\000\024\000\017\000\030\000\
\063\000\064\000\017\000\089\000\090\000\091\000\084\000\017\000\
\025\000\019\000\025\000\022\000\020\000\021\000\026\000\022\000\
\026\000\096\000\045\000\023\000\022\000\081\000\027\000\023\000\
\027\000\024\000\046\000\047\000\023\000\024\000\020\000\048\000\
\020\000\018\000\024\000\018\000\063\000\064\000\025\000\049\000\
\057\000\019\000\025\000\019\000\026\000\063\000\064\000\025\000\
\026\000\013\000\014\000\015\000\027\000\026\000\003\000\004\000\
\027\000\005\000\082\000\058\000\020\000\027\000\097\000\018\000\
\020\000\060\000\062\000\018\000\065\000\020\000\078\000\019\000\
\018\000\063\000\064\000\019\000\066\000\067\000\068\000\073\000\
\019\000\023\000\024\000\006\000\007\000\008\000\009\000\079\000\
\025\000\026\000\027\000\080\000\028\000\029\000\030\000\083\000\
\085\000\031\000\032\000\033\000\034\000\035\000\036\000\037\000\
\038\000\039\000\040\000\041\000\003\000\042\000\063\000\064\000\
\086\000\087\000\088\000\092\000\093\000\094\000\005\000\000\000\
\035\000"

let yycheck = "\021\000\
\030\000\031\000\032\000\033\000\034\000\035\000\036\000\001\001\
\001\001\039\000\003\001\041\000\018\001\019\001\018\001\019\001\
\001\001\001\000\003\001\018\001\019\001\040\001\006\001\018\001\
\019\001\018\001\019\001\057\000\058\000\001\001\060\000\003\001\
\031\001\063\000\064\000\065\000\040\001\001\001\031\001\003\001\
\035\001\035\001\035\001\001\001\001\001\003\001\031\001\040\001\
\018\001\019\001\035\001\081\000\082\000\083\000\076\000\040\001\
\001\001\040\001\003\001\031\001\014\001\040\001\001\001\035\001\
\003\001\035\001\040\001\031\001\040\001\003\001\001\001\035\001\
\003\001\031\001\040\001\034\001\040\001\035\001\001\001\034\001\
\003\001\001\001\040\001\003\001\018\001\019\001\031\001\034\001\
\034\001\001\001\035\001\003\001\031\001\018\001\019\001\040\001\
\035\001\011\001\012\001\013\001\031\001\040\001\007\001\008\001\
\035\001\010\001\003\001\034\001\031\001\040\001\035\001\031\001\
\035\001\034\001\040\001\035\001\034\001\040\001\003\001\031\001\
\040\001\018\001\019\001\035\001\041\001\041\001\041\001\033\001\
\040\001\004\001\005\001\036\001\037\001\038\001\039\001\003\001\
\011\001\012\001\013\001\003\001\015\001\016\001\017\001\003\001\
\035\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\001\001\032\001\018\001\019\001\
\041\001\041\001\041\001\035\001\035\001\035\001\001\001\255\255\
\035\001"

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
  RED\000\
  GREEN\000\
  BLUE\000\
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
  RESET\000\
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
# 49 "parser.mly"
                           ( _1 )
# 265 "parser.ml"
               : Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
                                ( SHOW_FORMULA )
# 271 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'color) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 53 "parser.mly"
                                ( SEM (_2,_3,[]) )
# 279 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'color) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 54 "parser.mly"
                                ( SEM (_2,_3,_4) )
# 288 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 55 "parser.mly"
                                ( LET (_2,_4) )
# 296 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 56 "parser.mly"
                                ( SAVE )
# 302 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parser.mly"
                                ( LOAD )
# 308 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
                                ( RESET )
# 314 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
                                ( STOP_TEST )
# 320 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( _2 )
# 327 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.TRUE )
# 333 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
                                                     ( MyLogic.FALSE )
# 339 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( MyLogic.PROP (MyProp.Id _2) )
# 346 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 66 "parser.mly"
                                                     ( MyLogic.PROP (MyProp.RedRange (_3,_5)) )
# 354 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 67 "parser.mly"
                                                       ( MyLogic.PROP (MyProp.GreenRange (_3,_5)) )
# 362 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 68 "parser.mly"
                                                      ( MyLogic.PROP (MyProp.BlueRange (_3,_5)) )
# 370 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 69 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 377 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 70 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 385 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 71 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 393 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 72 "parser.mly"
                                                     ( MyLogic.NEAR _2 )
# 400 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 73 "parser.mly"
                                                     ( MyLogic.SURR (_3,_5) )
# 408 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 74 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 415 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 75 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 422 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 76 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 429 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 77 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 436 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 78 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 443 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 79 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 450 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 80 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 458 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 81 "parser.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 466 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 82 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 473 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 83 "parser.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 481 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 488 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 87 "parser.mly"
                      ( _1::[] )
# 495 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 88 "parser.mly"
                      ( _1::_2 )
# 503 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 91 "parser.mly"
                      ( _1::[] )
# 510 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 92 "parser.mly"
                      ( _1::[] )
# 518 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
                      ( Graphics.red )
# 524 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 96 "parser.mly"
                      ( Graphics.green )
# 530 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "parser.mly"
                      ( Graphics.blue )
# 536 "parser.ml"
               : 'color))
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
