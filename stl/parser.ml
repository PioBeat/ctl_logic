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
\002\000\002\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\003\000\003\000\
\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\003\000\003\000\004\000\004\000\001\000\
\001\000\001\000\003\000\001\000\001\000\003\000\002\000\003\000\
\003\000\002\000\006\000\002\000\002\000\002\000\002\000\002\000\
\002\000\006\000\006\000\002\000\005\000\002\000\001\000\002\000\
\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\008\000\009\000\
\010\000\035\000\000\000\002\000\000\000\000\000\000\000\001\000\
\000\000\004\000\005\000\000\000\000\000\032\000\006\000\000\000\
\000\000\012\000\013\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\030\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\011\000\014\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\034\000\
\029\000\000\000\000\000\000\000\026\000\027\000\019\000"

let yydgoto = "\002\000\
\010\000\011\000\018\000\041\000\068\000"

let yysindex = "\001\000\
\090\255\000\000\008\255\236\254\238\254\242\254\000\000\000\000\
\000\000\000\000\035\255\000\000\013\255\231\254\046\255\000\000\
\013\255\000\000\000\000\025\255\116\255\000\000\000\000\037\255\
\038\255\000\000\000\000\116\255\116\255\116\255\116\255\116\255\
\116\255\116\255\056\255\064\255\116\255\072\255\116\255\045\255\
\005\255\085\255\000\000\005\255\005\255\005\255\005\255\005\255\
\005\255\005\255\116\255\116\255\005\255\116\255\078\255\061\255\
\116\255\116\255\116\255\086\255\141\255\151\255\000\000\000\000\
\005\255\005\255\054\255\075\255\116\255\116\255\116\255\000\000\
\000\000\050\255\131\255\133\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\121\255\000\000\000\000\000\000\
\000\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\125\255\023\255\000\000\016\255\022\255\028\255\039\255\040\255\
\060\255\076\255\000\000\000\000\077\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\082\255\083\255\095\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\242\255\232\255\000\000"

let yytablesize = 167
let yytable = "\020\000\
\031\000\001\000\022\000\044\000\045\000\046\000\047\000\048\000\
\049\000\050\000\017\000\019\000\053\000\012\000\055\000\013\000\
\015\000\014\000\015\000\057\000\058\000\015\000\020\000\028\000\
\020\000\028\000\060\000\061\000\021\000\062\000\021\000\031\000\
\065\000\066\000\067\000\016\000\031\000\028\000\028\000\022\000\
\023\000\022\000\023\000\015\000\074\000\075\000\076\000\015\000\
\017\000\020\000\028\000\015\000\072\000\020\000\028\000\021\000\
\021\000\020\000\028\000\021\000\024\000\023\000\024\000\021\000\
\057\000\058\000\022\000\023\000\057\000\058\000\022\000\023\000\
\042\000\043\000\022\000\023\000\025\000\018\000\025\000\018\000\
\056\000\077\000\016\000\017\000\016\000\017\000\051\000\024\000\
\069\000\017\000\064\000\024\000\057\000\058\000\052\000\024\000\
\003\000\004\000\005\000\006\000\057\000\058\000\054\000\025\000\
\018\000\063\000\073\000\025\000\018\000\016\000\017\000\025\000\
\018\000\016\000\017\000\059\000\000\000\016\000\017\000\024\000\
\025\000\003\000\007\000\008\000\009\000\007\000\033\000\026\000\
\027\000\028\000\000\000\000\000\029\000\030\000\031\000\032\000\
\033\000\034\000\035\000\036\000\037\000\038\000\039\000\070\000\
\040\000\057\000\058\000\057\000\058\000\000\000\000\000\000\000\
\000\000\071\000\000\000\057\000\058\000\000\000\000\000\000\000\
\000\000\000\000\078\000\000\000\079\000\057\000\058\000"

let yycheck = "\014\000\
\001\001\001\000\017\000\028\000\029\000\030\000\031\000\032\000\
\033\000\034\000\036\001\037\001\037\000\006\001\039\000\036\001\
\001\001\036\001\003\001\015\001\016\001\036\001\001\001\001\001\
\003\001\003\001\051\000\052\000\001\001\054\000\003\001\032\001\
\057\000\058\000\059\000\001\001\037\001\015\001\016\001\001\001\
\001\001\003\001\003\001\028\001\069\000\070\000\071\000\032\001\
\036\001\028\001\028\001\036\001\067\000\032\001\032\001\028\001\
\011\001\036\001\036\001\032\001\001\001\037\001\003\001\036\001\
\015\001\016\001\028\001\028\001\015\001\016\001\032\001\032\001\
\036\001\036\001\036\001\036\001\001\001\001\001\003\001\003\001\
\036\001\032\001\001\001\001\001\003\001\003\001\031\001\028\001\
\003\001\036\001\030\001\032\001\015\001\016\001\031\001\036\001\
\007\001\008\001\009\001\010\001\015\001\016\001\031\001\028\001\
\028\001\028\001\032\001\032\001\032\001\028\001\028\001\036\001\
\036\001\032\001\032\001\031\001\255\255\036\001\036\001\004\001\
\005\001\001\001\033\001\034\001\035\001\001\001\032\001\012\001\
\013\001\014\001\255\255\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\026\001\027\001\003\001\
\029\001\015\001\016\001\015\001\016\001\255\255\255\255\255\255\
\255\255\003\001\255\255\015\001\016\001\255\255\255\255\255\255\
\255\255\255\255\032\001\255\255\032\001\015\001\016\001"

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
# 242 "parser.ml"
               : Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "parser.mly"
                                ( SHOW_FORMULA )
# 248 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 49 "parser.mly"
                                ( SEM (_2,[]) )
# 255 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 50 "parser.mly"
                                ( SEM (_2,_3) )
# 263 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 51 "parser.mly"
                        ( BACKTRACK (_2,[],_3) )
# 271 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'arglist) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 52 "parser.mly"
                                ( BACKTRACK (_2,_3,_4) )
# 280 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 53 "parser.mly"
                                ( LET (_2,_4) )
# 288 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                                ( SAVE )
# 294 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                                ( LOAD )
# 300 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 56 "parser.mly"
                                ( STOP_TEST )
# 306 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 59 "parser.mly"
                                                     ( _2 )
# 313 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
                                                     ( MyLogic.TRUE )
# 319 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
                                                     ( MyLogic.FALSE )
# 325 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( MyLogic.PROP _2 )
# 332 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 339 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 64 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 347 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 355 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 66 "parser.mly"
                                                     ( MyLogic.NEAR _2 )
# 362 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 67 "parser.mly"
                                                     ( MyLogic.SURR (_3,_5) )
# 370 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 68 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 377 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 69 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 384 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 70 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 391 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 71 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 398 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 72 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 405 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 73 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 412 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 74 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 420 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 75 "parser.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 428 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 76 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 435 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 77 "parser.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 443 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 450 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 81 "parser.mly"
                      ( _1::[] )
# 457 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 82 "parser.mly"
                      ( _1::_2 )
# 465 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 85 "parser.mly"
                      ( _1::[] )
# 472 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 86 "parser.mly"
                      ( _1::[] )
# 480 "parser.ml"
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
