type token =
  | EOL
  | QUOTE
  | COMMA
  | DOLLAR
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
let _ = parse_error;;
# 2 "parser.mly"
  open Interface
  open BtlTest
# 39 "parser.ml"
let yytransl_const = [|
  257 (* EOL *);
  258 (* QUOTE *);
  259 (* COMMA *);
  260 (* DOLLAR *);
  261 (* FORMULA *);
  262 (* SHOW *);
  263 (* SEM *);
  264 (* LET *);
  265 (* EQ *);
  266 (* T *);
  267 (* F *);
  268 (* NOT *);
  269 (* AND *);
  270 (* OR *);
  271 (* AX *);
  272 (* EX *);
  273 (* AF *);
  274 (* EF *);
  275 (* AG *);
  276 (* EG *);
  277 (* AU *);
  278 (* EU *);
  279 (* LBROUND *);
  280 (* RBROUND *);
  281 (* LBANGLE *);
  282 (* RBANGLE *);
  283 (* LBSQUARE *);
  284 (* RBSQUARE *);
  285 (* EXIT *);
    0|]

let yytransl_block = [|
  286 (* IDE *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\004\000\001\000\003\000\001\000\001\000\
\003\000\002\000\003\000\003\000\002\000\002\000\002\000\002\000\
\002\000\002\000\006\000\006\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\005\000\022\000\000\000\
\002\000\003\000\000\000\001\000\000\000\000\000\007\000\008\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\021\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\006\000\009\000\000\000\000\000\
\000\000\000\000\000\000\000\000\019\000\020\000"

let yydgoto = "\002\000\
\007\000\008\000\028\000"

let yysindex = "\006\000\
\052\255\000\000\031\255\241\254\244\254\000\000\000\000\029\255\
\000\000\000\000\030\255\000\000\073\255\012\255\000\000\000\000\
\073\255\073\255\073\255\073\255\073\255\073\255\073\255\020\255\
\036\255\073\255\037\255\038\255\000\000\038\255\038\255\038\255\
\038\255\038\255\038\255\038\255\073\255\073\255\086\255\046\255\
\073\255\073\255\009\255\094\255\000\000\000\000\038\255\038\255\
\073\255\073\255\048\255\051\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\055\255\000\000\007\255\010\255\013\255\
\016\255\025\255\026\255\042\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\045\255\054\255\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\239\255"

let yytablesize = 110
let yytable = "\030\000\
\031\000\032\000\033\000\034\000\035\000\036\000\001\000\010\000\
\039\000\010\000\013\000\049\000\013\000\014\000\010\000\014\000\
\015\000\011\000\015\000\043\000\044\000\041\000\042\000\047\000\
\048\000\016\000\017\000\016\000\017\000\012\000\010\000\051\000\
\052\000\013\000\010\000\009\000\014\000\013\000\013\000\015\000\
\014\000\029\000\018\000\015\000\018\000\011\000\037\000\011\000\
\016\000\017\000\041\000\042\000\016\000\017\000\012\000\004\000\
\012\000\003\000\004\000\005\000\041\000\042\000\038\000\041\000\
\042\000\018\000\040\000\000\000\011\000\018\000\000\000\046\000\
\011\000\000\000\000\000\053\000\014\000\012\000\054\000\000\000\
\006\000\012\000\015\000\016\000\017\000\000\000\000\000\018\000\
\019\000\020\000\021\000\022\000\023\000\024\000\025\000\026\000\
\050\000\027\000\041\000\042\000\000\000\000\000\000\000\000\000\
\000\000\000\000\041\000\042\000\000\000\045\000"

let yycheck = "\017\000\
\018\000\019\000\020\000\021\000\022\000\023\000\001\000\001\001\
\026\000\003\001\001\001\003\001\003\001\001\001\030\001\003\001\
\001\001\030\001\003\001\037\000\038\000\013\001\014\001\041\000\
\042\000\001\001\001\001\003\001\003\001\001\001\024\001\049\000\
\050\000\024\001\028\001\005\001\024\001\028\001\009\001\024\001\
\028\001\030\001\001\001\028\001\003\001\001\001\027\001\003\001\
\024\001\024\001\013\001\014\001\028\001\028\001\001\001\001\001\
\003\001\006\001\007\001\008\001\013\001\014\001\027\001\013\001\
\014\001\024\001\030\001\255\255\024\001\028\001\255\255\026\001\
\028\001\255\255\255\255\028\001\004\001\024\001\028\001\255\255\
\029\001\028\001\010\001\011\001\012\001\255\255\255\255\015\001\
\016\001\017\001\018\001\019\001\020\001\021\001\022\001\023\001\
\003\001\025\001\013\001\014\001\255\255\255\255\255\255\255\255\
\255\255\255\255\013\001\014\001\255\255\024\001"

let yynames_const = "\
  EOL\000\
  QUOTE\000\
  COMMA\000\
  DOLLAR\000\
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
# 39 "parser.mly"
                           ( _1 )
# 195 "parser.ml"
               : BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 42 "parser.mly"
                                ( SHOW_FORMULA )
# 201 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
                                ( SEM _2 )
# 208 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 44 "parser.mly"
                                ( LET (_2,_4) )
# 216 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 45 "parser.mly"
                                ( STOP_TEST )
# 222 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 48 "parser.mly"
                                                     ( _2 )
# 229 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
                                                     ( MyLogic.TRUE )
# 235 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                                                     ( MyLogic.FALSE )
# 241 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 51 "parser.mly"
                                                     ( MyLogic.PROP _2 )
# 248 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 52 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 255 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 53 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 263 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 54 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 271 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 55 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 278 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 56 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 285 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 57 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 292 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 58 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 299 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 59 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 306 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 60 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 313 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 61 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 321 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 62 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 329 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 336 "parser.ml"
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
