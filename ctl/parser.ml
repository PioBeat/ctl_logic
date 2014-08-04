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
  open BtlTest2
# 44 "parser.ml"
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
  281 (* LBROUND *);
  282 (* RBROUND *);
  283 (* LBANGLE *);
  284 (* RBANGLE *);
  285 (* LBSQUARE *);
  286 (* RBSQUARE *);
  287 (* SAVE *);
  288 (* LOAD *);
  289 (* EXIT *);
    0|]

let yytransl_block = [|
  290 (* IDE *);
  291 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\003\000\003\000\005\000\005\000\
\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\003\000\003\000\004\000\004\000\001\000\
\001\000\001\000\003\000\001\000\001\000\003\000\002\000\003\000\
\003\000\002\000\002\000\002\000\002\000\002\000\002\000\006\000\
\006\000\002\000\005\000\002\000\001\000\002\000\001\000\002\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\008\000\009\000\
\010\000\033\000\000\000\002\000\000\000\000\000\000\000\001\000\
\000\000\004\000\005\000\000\000\000\000\030\000\006\000\000\000\
\000\000\012\000\013\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\028\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\011\000\014\000\000\000\000\000\000\000\000\000\000\000\
\000\000\032\000\027\000\000\000\000\000\024\000\025\000"

let yydgoto = "\002\000\
\010\000\011\000\018\000\039\000\063\000"

let yysindex = "\011\000\
\097\255\000\000\039\255\236\254\022\255\024\255\000\000\000\000\
\000\000\000\000\064\255\000\000\032\255\243\254\072\255\000\000\
\032\255\000\000\000\000\040\255\119\255\000\000\000\000\059\255\
\062\255\000\000\000\000\119\255\119\255\119\255\119\255\119\255\
\119\255\119\255\071\255\079\255\119\255\063\255\012\255\080\255\
\000\000\012\255\012\255\012\255\012\255\012\255\012\255\012\255\
\119\255\119\255\058\255\073\255\119\255\119\255\119\255\008\255\
\076\255\000\000\000\000\012\255\012\255\023\255\050\255\119\255\
\119\255\000\000\000\000\242\254\046\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\109\255\000\000\000\000\000\000\
\014\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\110\255\017\255\
\000\000\016\255\033\255\034\255\051\255\052\255\068\255\069\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\086\255\087\255\084\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\242\255\232\255\000\000"

let yytablesize = 146
let yytable = "\020\000\
\053\000\054\000\022\000\042\000\043\000\044\000\045\000\046\000\
\047\000\048\000\064\000\001\000\051\000\013\000\029\000\070\000\
\015\000\026\000\015\000\026\000\017\000\019\000\053\000\054\000\
\056\000\057\000\053\000\054\000\060\000\061\000\062\000\026\000\
\026\000\018\000\019\000\018\000\019\000\053\000\054\000\068\000\
\069\000\015\000\026\000\029\000\012\000\015\000\026\000\066\000\
\029\000\015\000\026\000\020\000\021\000\020\000\021\000\014\000\
\017\000\015\000\018\000\019\000\053\000\054\000\018\000\019\000\
\016\000\017\000\018\000\019\000\022\000\023\000\022\000\023\000\
\053\000\054\000\023\000\071\000\020\000\021\000\065\000\067\000\
\020\000\021\000\021\000\058\000\020\000\021\000\016\000\017\000\
\016\000\017\000\053\000\054\000\040\000\022\000\023\000\041\000\
\052\000\022\000\023\000\049\000\059\000\022\000\023\000\003\000\
\004\000\005\000\006\000\050\000\055\000\003\000\007\000\016\000\
\017\000\031\000\000\000\016\000\017\000\000\000\000\000\016\000\
\017\000\000\000\024\000\025\000\000\000\000\000\000\000\007\000\
\008\000\009\000\026\000\027\000\028\000\000\000\000\000\029\000\
\030\000\031\000\032\000\033\000\034\000\035\000\036\000\037\000\
\000\000\038\000"

let yycheck = "\014\000\
\015\001\016\001\017\000\028\000\029\000\030\000\031\000\032\000\
\033\000\034\000\003\001\001\000\037\000\034\001\001\001\030\001\
\001\001\001\001\003\001\003\001\034\001\035\001\015\001\016\001\
\049\000\050\000\015\001\016\001\053\000\054\000\055\000\015\001\
\016\001\001\001\001\001\003\001\003\001\015\001\016\001\064\000\
\065\000\026\001\026\001\030\001\006\001\030\001\030\001\062\000\
\035\001\034\001\034\001\001\001\001\001\003\001\003\001\034\001\
\034\001\034\001\026\001\026\001\015\001\016\001\030\001\030\001\
\001\001\034\001\034\001\034\001\001\001\001\001\003\001\003\001\
\015\001\016\001\035\001\030\001\026\001\026\001\003\001\030\001\
\030\001\030\001\011\001\026\001\034\001\034\001\001\001\001\001\
\003\001\003\001\015\001\016\001\034\001\026\001\026\001\034\001\
\034\001\030\001\030\001\029\001\028\001\034\001\034\001\007\001\
\008\001\009\001\010\001\029\001\029\001\001\001\001\001\026\001\
\026\001\030\001\255\255\030\001\030\001\255\255\255\255\034\001\
\034\001\255\255\004\001\005\001\255\255\255\255\255\255\031\001\
\032\001\033\001\012\001\013\001\014\001\255\255\255\255\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\255\255\027\001"

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
# 44 "parser.mly"
                           ( _1 )
# 230 "parser.ml"
               : BtlTest2.MyModel.st_pointset BtlTest2.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parser.mly"
                                ( SHOW_FORMULA )
# 236 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 48 "parser.mly"
                                ( SEM (_2,[]) )
# 243 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 49 "parser.mly"
                                ( SEM (_2,_3) )
# 251 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 50 "parser.mly"
                        ( BACKTRACK (_2,[],_3) )
# 259 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'arglist) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 51 "parser.mly"
                                ( BACKTRACK (_2,_3,_4) )
# 268 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 52 "parser.mly"
                                ( LET (_2,_4) )
# 276 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
                                ( SAVE )
# 282 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                                ( LOAD )
# 288 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                                ( STOP_TEST )
# 294 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 58 "parser.mly"
                                                     ( _2 )
# 301 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
                                                     ( MyLogic.TRUE )
# 307 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
                                                     ( MyLogic.FALSE )
# 313 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 61 "parser.mly"
                                                     ( MyLogic.PROP _2 )
# 320 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 327 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 335 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 64 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 343 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 350 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 66 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 357 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 67 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 364 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 68 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 371 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 69 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 378 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 70 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 385 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 71 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 393 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 72 "parser.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 401 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 73 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 408 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 74 "parser.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 416 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 75 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 423 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser.mly"
                      ( _1::[] )
# 430 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 79 "parser.mly"
                      ( _1::_2 )
# 438 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 82 "parser.mly"
                      ( _1::[] )
# 445 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 83 "parser.mly"
                      ( _1::[] )
# 453 "parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : BtlTest2.MyModel.st_pointset BtlTest2.MyLogic.fsyntax Interface.command)
