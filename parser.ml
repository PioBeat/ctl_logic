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
  | SAVE
  | LOAD
  | EXIT
  | IDE of (string)

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Interface
  open BtlTest2
# 42 "parser.ml"
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
  286 (* SAVE *);
  287 (* LOAD *);
  288 (* EXIT *);
    0|]

let yytransl_block = [|
  289 (* IDE *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\003\000\003\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\003\000\004\000\001\000\001\000\001\000\
\003\000\001\000\001\000\003\000\002\000\003\000\003\000\002\000\
\002\000\002\000\002\000\002\000\002\000\006\000\006\000\002\000\
\005\000\002\000\001\000\002\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\007\000\008\000\
\031\000\000\000\002\000\000\000\000\000\001\000\000\000\004\000\
\000\000\028\000\000\000\000\000\010\000\011\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\026\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\009\000\012\000\000\000\000\000\
\000\000\000\000\000\000\000\000\030\000\025\000\000\000\000\000\
\022\000\023\000"

let yydgoto = "\002\000\
\009\000\010\000\016\000\034\000\058\000"

let yysindex = "\007\000\
\097\255\000\000\012\255\000\255\014\255\000\000\000\000\000\000\
\000\000\049\255\000\000\019\255\066\255\000\000\019\255\000\000\
\119\255\000\000\026\255\027\255\000\000\000\000\119\255\119\255\
\119\255\119\255\119\255\119\255\119\255\044\255\052\255\119\255\
\040\255\041\255\057\255\000\000\041\255\041\255\041\255\041\255\
\041\255\041\255\041\255\119\255\119\255\075\255\054\255\119\255\
\119\255\119\255\006\255\099\255\000\000\000\000\041\255\041\255\
\001\255\065\255\119\255\119\255\000\000\000\000\053\255\069\255\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\085\255\000\000\000\000\050\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\107\255\010\255\000\000\011\255\016\255\028\255\029\255\
\045\255\062\255\063\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\068\255\074\255\
\080\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\241\255\234\255\000\000"

let yytablesize = 145
let yytable = "\018\000\
\037\000\038\000\039\000\040\000\041\000\042\000\043\000\001\000\
\059\000\046\000\024\000\013\000\024\000\013\000\048\000\049\000\
\016\000\011\000\016\000\048\000\049\000\051\000\052\000\024\000\
\024\000\055\000\056\000\057\000\017\000\018\000\017\000\018\000\
\012\000\015\000\024\000\013\000\063\000\064\000\024\000\013\000\
\016\000\061\000\024\000\013\000\016\000\019\000\013\000\019\000\
\016\000\014\000\027\000\015\000\017\000\018\000\048\000\049\000\
\017\000\018\000\035\000\036\000\017\000\018\000\020\000\021\000\
\020\000\021\000\048\000\049\000\014\000\019\000\014\000\044\000\
\047\000\019\000\015\000\017\000\015\000\019\000\027\000\045\000\
\054\000\065\000\048\000\049\000\050\000\003\000\020\000\021\000\
\048\000\049\000\020\000\021\000\014\000\062\000\020\000\021\000\
\014\000\066\000\015\000\053\000\014\000\060\000\015\000\003\000\
\004\000\005\000\015\000\005\000\029\000\000\000\000\000\000\000\
\048\000\049\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\019\000\020\000\000\000\000\000\006\000\007\000\
\008\000\021\000\022\000\023\000\000\000\000\000\024\000\025\000\
\026\000\027\000\028\000\029\000\030\000\031\000\032\000\000\000\
\033\000"

let yycheck = "\015\000\
\023\000\024\000\025\000\026\000\027\000\028\000\029\000\001\000\
\003\001\032\000\001\001\001\001\003\001\003\001\014\001\015\001\
\001\001\006\001\003\001\014\001\015\001\044\000\045\000\014\001\
\015\001\048\000\049\000\050\000\001\001\001\001\003\001\003\001\
\033\001\033\001\025\001\025\001\059\000\060\000\029\001\029\001\
\025\001\057\000\033\001\033\001\029\001\001\001\033\001\003\001\
\033\001\001\001\001\001\033\001\025\001\025\001\014\001\015\001\
\029\001\029\001\033\001\033\001\033\001\033\001\001\001\001\001\
\003\001\003\001\014\001\015\001\001\001\025\001\003\001\028\001\
\033\001\029\001\001\001\010\001\003\001\033\001\029\001\028\001\
\027\001\029\001\014\001\015\001\028\001\001\001\025\001\025\001\
\014\001\015\001\029\001\029\001\025\001\029\001\033\001\033\001\
\029\001\029\001\025\001\025\001\033\001\003\001\029\001\007\001\
\008\001\009\001\033\001\001\001\029\001\255\255\255\255\255\255\
\014\001\015\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\004\001\005\001\255\255\255\255\030\001\031\001\
\032\001\011\001\012\001\013\001\255\255\255\255\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\255\255\
\026\001"

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
  SAVE\000\
  LOAD\000\
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
# 42 "parser.mly"
                           ( _1 )
# 222 "parser.ml"
               : BtlTest2.MyModel.st_pointset BtlTest2.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 45 "parser.mly"
                                ( SHOW_FORMULA )
# 228 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "parser.mly"
                                ( SEM (_2,[]) )
# 235 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 47 "parser.mly"
                                ( SEM (_2,_3) )
# 243 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 48 "parser.mly"
                                ( LET (_2,_4) )
# 251 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
                                ( SAVE )
# 257 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                                ( LOAD )
# 263 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
                                ( STOP_TEST )
# 269 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 54 "parser.mly"
                                                     ( _2 )
# 276 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                                                     ( MyLogic.TRUE )
# 282 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 56 "parser.mly"
                                                     ( MyLogic.FALSE )
# 288 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 57 "parser.mly"
                                                     ( MyLogic.PROP _2 )
# 295 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 58 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 302 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 59 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 310 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 60 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 318 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 61 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 325 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 332 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 339 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 64 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 346 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 353 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 66 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 360 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 67 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 368 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 68 "parser.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 376 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 383 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 70 "parser.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 391 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 398 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
                      ( _1::[] )
# 405 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 75 "parser.mly"
                      ( _1::_2 )
# 413 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 78 "parser.mly"
                      ( _1::[] )
# 420 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 79 "parser.mly"
                      ( _1::[] )
# 428 "parser.ml"
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
