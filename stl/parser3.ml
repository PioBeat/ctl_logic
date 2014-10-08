type token =
  | EOL
  | QUOTE
  | COMMA
  | DOLLAR
  | AT
  | IMAGE
  | STATUS
  | STORE
  | FUTURE
  | TIME
  | SPACE
  | FORMULA
  | SET
  | SHOW
  | SEM
  | BACKTRACK
  | LET
  | RED
  | GREEN
  | BLUE
  | BLACK
  | WHITE
  | YELLOW
  | CYAN
  | MAGENTA
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
  | REFRESH
  | EXIT
  | IDE of (string)
  | INT of (int)

open Parsing;;
let _ = parse_error;;
# 2 "parser3.mly"
  open Interface3
# 62 "parser3.ml"
let yytransl_const = [|
  257 (* EOL *);
  258 (* QUOTE *);
  259 (* COMMA *);
  260 (* DOLLAR *);
  261 (* AT *);
  262 (* IMAGE *);
  263 (* STATUS *);
  264 (* STORE *);
  265 (* FUTURE *);
  266 (* TIME *);
  267 (* SPACE *);
  268 (* FORMULA *);
  269 (* SET *);
  270 (* SHOW *);
  271 (* SEM *);
  272 (* BACKTRACK *);
  273 (* LET *);
  274 (* RED *);
  275 (* GREEN *);
  276 (* BLUE *);
  277 (* BLACK *);
  278 (* WHITE *);
  279 (* YELLOW *);
  280 (* CYAN *);
  281 (* MAGENTA *);
  282 (* EQ *);
  283 (* T *);
  284 (* F *);
  285 (* NOT *);
  286 (* AND *);
  287 (* OR *);
  288 (* AX *);
  289 (* EX *);
  290 (* AF *);
  291 (* EF *);
  292 (* AG *);
  293 (* EG *);
  294 (* AU *);
  295 (* EU *);
  296 (* N *);
  297 (* S *);
  298 (* LBROUND *);
  299 (* RBROUND *);
  300 (* LBANGLE *);
  301 (* RBANGLE *);
  302 (* LBSQUARE *);
  303 (* RBSQUARE *);
  304 (* SAVE *);
  305 (* LOAD *);
  306 (* RESET *);
  307 (* REFRESH *);
  308 (* EXIT *);
    0|]

let yytransl_block = [|
  309 (* IDE *);
  310 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\008\000\008\000\009\000\005\000\005\000\
\005\000\006\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\004\000\004\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\011\000\011\000\013\000\013\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\012\000\012\000\
\012\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\002\000\002\000\004\000\002\000\002\000\
\001\000\001\000\001\000\001\000\002\000\001\000\002\000\003\000\
\002\000\001\000\001\000\001\000\001\000\001\000\002\000\001\000\
\001\000\002\000\003\000\003\000\001\000\001\000\003\000\003\000\
\001\000\002\000\003\000\003\000\002\000\006\000\002\000\002\000\
\002\000\002\000\002\000\002\000\006\000\006\000\002\000\005\000\
\002\000\001\000\002\000\001\000\002\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\007\000\006\000\006\000\
\006\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\009\000\010\000\011\000\066\000\000\000\000\000\000\000\
\003\000\019\000\021\000\025\000\024\000\000\000\020\000\002\000\
\054\000\055\000\056\000\057\000\058\000\059\000\060\000\061\000\
\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\
\029\000\030\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
\000\000\033\000\000\000\000\000\012\000\007\000\014\000\008\000\
\001\000\026\000\000\000\023\000\000\000\000\000\000\000\000\000\
\049\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\013\000\027\000\000\000\
\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\028\000\032\000\031\000\000\000\000\000\000\000\000\000\
\051\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\053\000\048\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\063\000\064\000\065\000\045\000\046\000\
\038\000\062\000"

let yydgoto = "\002\000\
\013\000\014\000\024\000\017\000\034\000\056\000\057\000\062\000\
\064\000\035\000\098\000\058\000\115\000"

let yysindex = "\041\000\
\182\255\000\000\029\255\147\255\103\255\174\255\002\255\068\255\
\057\255\000\000\000\000\000\000\000\000\070\255\041\255\044\255\
\000\000\000\000\000\000\000\000\000\000\103\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\046\255\000\000\133\255\016\255\030\255\062\255\069\255\071\255\
\000\000\000\000\174\255\174\255\174\255\174\255\174\255\174\255\
\174\255\073\255\084\255\174\255\087\255\174\255\007\255\000\000\
\076\255\000\000\078\255\056\255\000\000\000\000\000\000\000\000\
\000\000\000\000\064\255\000\000\131\255\091\255\076\255\094\255\
\000\000\092\255\093\255\109\255\076\255\076\255\076\255\076\255\
\076\255\076\255\076\255\174\255\174\255\076\255\174\255\254\254\
\105\255\119\255\174\255\174\255\174\255\000\000\000\000\122\255\
\091\255\000\000\174\255\145\255\177\255\178\255\003\255\015\255\
\072\255\000\000\000\000\000\000\076\255\076\255\076\255\179\255\
\000\000\063\255\136\255\130\255\134\255\135\255\174\255\174\255\
\174\255\137\255\000\000\000\000\138\255\140\255\143\255\241\254\
\049\255\082\255\157\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\203\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\204\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\216\255\218\255\000\255\
\000\000\000\000\000\000\000\000\001\255\019\255\020\255\034\255\
\035\255\058\255\067\255\000\000\000\000\088\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\004\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\089\255\096\255\219\255\000\000\
\000\000\175\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\221\255\000\000\
\000\000\199\000\166\255\168\000\000\000"

let yytablesize = 234
let yytable = "\071\000\
\047\000\034\000\047\000\034\000\050\000\119\000\113\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\091\000\092\000\
\086\000\120\000\088\000\039\000\040\000\039\000\040\000\123\000\
\038\000\039\000\040\000\091\000\092\000\047\000\047\000\135\000\
\091\000\092\000\041\000\042\000\041\000\042\000\015\000\016\000\
\106\000\001\000\047\000\034\000\091\000\092\000\047\000\034\000\
\103\000\104\000\050\000\105\000\047\000\034\000\059\000\109\000\
\110\000\111\000\043\000\089\000\043\000\039\000\040\000\114\000\
\063\000\039\000\040\000\044\000\072\000\044\000\065\000\039\000\
\040\000\060\000\121\000\061\000\041\000\042\000\091\000\092\000\
\041\000\042\000\073\000\128\000\129\000\130\000\041\000\042\000\
\037\000\035\000\037\000\035\000\091\000\092\000\066\000\136\000\
\036\000\067\000\036\000\069\000\043\000\091\000\092\000\093\000\
\043\000\091\000\092\000\074\000\094\000\044\000\043\000\091\000\
\092\000\044\000\075\000\097\000\076\000\095\000\084\000\044\000\
\025\000\026\000\027\000\028\000\029\000\030\000\031\000\032\000\
\137\000\085\000\037\000\035\000\087\000\096\000\037\000\035\000\
\036\000\037\000\036\000\099\000\037\000\035\000\036\000\097\000\
\033\000\100\000\101\000\116\000\036\000\107\000\038\000\039\000\
\040\000\018\000\019\000\020\000\021\000\022\000\023\000\041\000\
\042\000\043\000\102\000\108\000\044\000\045\000\046\000\047\000\
\048\000\049\000\050\000\051\000\052\000\053\000\054\000\112\000\
\055\000\036\000\037\000\117\000\118\000\122\000\124\000\125\000\
\132\000\070\000\133\000\126\000\127\000\134\000\131\000\038\000\
\039\000\040\000\003\000\004\000\005\000\006\000\007\000\138\000\
\041\000\042\000\043\000\022\000\018\000\044\000\045\000\046\000\
\047\000\048\000\049\000\050\000\051\000\052\000\053\000\054\000\
\015\000\055\000\017\000\006\000\068\000\052\000\090\000\000\000\
\000\000\000\000\000\000\000\000\000\000\008\000\009\000\010\000\
\011\000\012\000"

let yycheck = "\035\000\
\001\001\001\001\003\001\003\001\001\001\003\001\097\000\043\000\
\044\000\045\000\046\000\047\000\048\000\049\000\030\001\031\001\
\052\000\003\001\054\000\001\001\001\001\003\001\003\001\114\000\
\018\001\019\001\020\001\030\001\031\001\030\001\031\001\047\001\
\030\001\031\001\001\001\001\001\003\001\003\001\010\001\011\001\
\043\001\001\000\043\001\043\001\030\001\031\001\047\001\047\001\
\084\000\085\000\047\001\087\000\053\001\053\001\053\001\091\000\
\092\000\093\000\001\001\053\001\003\001\043\001\043\001\099\000\
\008\001\047\001\047\001\001\001\053\001\003\001\001\001\053\001\
\053\001\006\001\003\001\008\001\043\001\043\001\030\001\031\001\
\047\001\047\001\053\001\119\000\120\000\121\000\053\001\053\001\
\001\001\001\001\003\001\003\001\030\001\031\001\054\001\047\001\
\001\001\054\001\003\001\054\001\043\001\030\001\031\001\026\001\
\047\001\030\001\031\001\046\001\053\001\043\001\053\001\030\001\
\031\001\047\001\046\001\053\001\046\001\054\001\046\001\053\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\047\001\046\001\043\001\043\001\046\001\003\001\047\001\047\001\
\004\001\005\001\043\001\046\001\053\001\053\001\047\001\053\001\
\042\001\054\001\054\001\003\001\053\001\045\001\018\001\019\001\
\020\001\007\001\008\001\009\001\010\001\011\001\012\001\027\001\
\028\001\029\001\054\001\045\001\032\001\033\001\034\001\035\001\
\036\001\037\001\038\001\039\001\040\001\041\001\042\001\054\001\
\044\001\004\001\005\001\003\001\003\001\003\001\047\001\054\001\
\047\001\053\001\047\001\054\001\054\001\047\001\054\001\018\001\
\019\001\020\001\013\001\014\001\015\001\016\001\017\001\043\001\
\027\001\028\001\029\001\001\001\001\001\032\001\033\001\034\001\
\035\001\036\001\037\001\038\001\039\001\040\001\041\001\042\001\
\001\001\044\001\001\001\001\001\022\000\047\001\055\000\255\255\
\255\255\255\255\255\255\255\255\255\255\048\001\049\001\050\001\
\051\001\052\001"

let yynames_const = "\
  EOL\000\
  QUOTE\000\
  COMMA\000\
  DOLLAR\000\
  AT\000\
  IMAGE\000\
  STATUS\000\
  STORE\000\
  FUTURE\000\
  TIME\000\
  SPACE\000\
  FORMULA\000\
  SET\000\
  SHOW\000\
  SEM\000\
  BACKTRACK\000\
  LET\000\
  RED\000\
  GREEN\000\
  BLUE\000\
  BLACK\000\
  WHITE\000\
  YELLOW\000\
  CYAN\000\
  MAGENTA\000\
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
  REFRESH\000\
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
# 62 "parser3.mly"
                           ( _1 )
# 345 "parser3.ml"
               : Interface3.MyModel.st_pointset Interface3.MyLogic.fsyntax Interface3.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'showarg) in
    Obj.repr(
# 65 "parser3.mly"
                                ( _2 )
# 352 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'setarg) in
    Obj.repr(
# 66 "parser3.mly"
                                ( _2 )
# 359 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'semarg) in
    Obj.repr(
# 67 "parser3.mly"
                                ( _2 )
# 366 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'backtrackarg) in
    Obj.repr(
# 68 "parser3.mly"
                                ( _2 )
# 373 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 69 "parser3.mly"
                                ( LET (_2,_4) )
# 381 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'savearg) in
    Obj.repr(
# 70 "parser3.mly"
                                ( _2 )
# 388 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'loadarg) in
    Obj.repr(
# 71 "parser3.mly"
                                ( _2 )
# 395 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser3.mly"
                                ( RESET )
# 401 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser3.mly"
                                ( REFRESH )
# 407 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser3.mly"
                                ( STOP_TEST )
# 413 "parser3.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser3.mly"
                      ( SAVE_STORE )
# 419 "parser3.ml"
               : 'savearg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser3.mly"
                      ( SAVE_IMAGE _2 )
# 426 "parser3.ml"
               : 'savearg))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser3.mly"
                      ( LOAD_STORE )
# 432 "parser3.ml"
               : 'loadarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'color) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser3.mly"
                            ( SEM_IDE (_1,_2,[]) )
# 440 "parser3.ml"
               : 'semarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'color) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 85 "parser3.mly"
                            ( SEM_IDE (_1,_2,_3) )
# 449 "parser3.ml"
               : 'semarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'color) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 86 "parser3.mly"
                            ( SEM(_1,_2) )
# 457 "parser3.ml"
               : 'semarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 89 "parser3.mly"
                            ( BACKTRACK _1 )
# 464 "parser3.ml"
               : 'backtrackarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser3.mly"
                                ( SHOW_STATUS )
# 470 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser3.mly"
                                ( SHOW_FORMULA )
# 476 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser3.mly"
                                ( SHOW_STORE )
# 482 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser3.mly"
                                ( SHOW_SPACE Graphics.red )
# 488 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'color) in
    Obj.repr(
# 96 "parser3.mly"
                                ( SHOW_SPACE _2 )
# 495 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "parser3.mly"
                                ( SHOW_TIME )
# 501 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 98 "parser3.mly"
                                ( SHOW_FUTURE )
# 507 "parser3.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 101 "parser3.mly"
                            ( SET_TIME _2 )
# 514 "parser3.ml"
               : 'setarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 102 "parser3.mly"
                            ( SET_SPACE (_2,_3) )
# 522 "parser3.ml"
               : 'setarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 105 "parser3.mly"
                                                     ( _2 )
# 529 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parser3.mly"
                                                     ( MyLogic.TRUE )
# 535 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser3.mly"
                                                     ( MyLogic.FALSE )
# 541 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'propcolor) in
    Obj.repr(
# 108 "parser3.mly"
                                                     ( _2 )
# 548 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 109 "parser3.mly"
                                                     ( MyLogic.PROP (MyProp.Id _2) )
# 555 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'propcolor) in
    Obj.repr(
# 110 "parser3.mly"
                                                     ( _1 )
# 562 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 111 "parser3.mly"
                                                     ( MyLogic.NOT (_2) )
# 569 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 112 "parser3.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 577 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 113 "parser3.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 585 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 114 "parser3.mly"
                                                     ( MyLogic.NEAR _2 )
# 592 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 115 "parser3.mly"
                                                     ( MyLogic.SURR (_3,_5) )
# 600 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 116 "parser3.mly"
                                                     ( MyLogic.AX _2 )
# 607 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 117 "parser3.mly"
                                                     ( MyLogic.EX _2 )
# 614 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 118 "parser3.mly"
                                                     ( MyLogic.AF _2 )
# 621 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 119 "parser3.mly"
                                                     ( MyLogic.EF _2 )
# 628 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 120 "parser3.mly"
                                                     ( MyLogic.AG _2 )
# 635 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 121 "parser3.mly"
                                                     ( MyLogic.EG _2 )
# 642 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 122 "parser3.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 650 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 123 "parser3.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 658 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 124 "parser3.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 665 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 125 "parser3.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 673 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 126 "parser3.mly"
                                                     ( MyLogic.MVAR (_2) )
# 680 "parser3.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 129 "parser3.mly"
                      ( _1::[] )
# 687 "parser3.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 130 "parser3.mly"
                      ( _1::_2 )
# 695 "parser3.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 133 "parser3.mly"
                      ( _1::[] )
# 702 "parser3.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 134 "parser3.mly"
                      ( _1::[] )
# 710 "parser3.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    Obj.repr(
# 137 "parser3.mly"
                                               ( Graphics.red )
# 716 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "parser3.mly"
                                               ( Graphics.green )
# 722 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "parser3.mly"
                                               ( Graphics.blue )
# 728 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 140 "parser3.mly"
                                               ( Graphics.black )
# 734 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "parser3.mly"
                                               ( Graphics.white )
# 740 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 142 "parser3.mly"
                                               ( Graphics.yellow )
# 746 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "parser3.mly"
                                               ( Graphics.cyan )
# 752 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 144 "parser3.mly"
                                               ( Graphics.magenta )
# 758 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 145 "parser3.mly"
                                               ( Graphics.rgb _2 _4 _6 )
# 767 "parser3.ml"
               : 'color))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 148 "parser3.mly"
                                                     ( MyLogic.PROP (MyProp.RedRange (_3,_5)) )
# 775 "parser3.ml"
               : 'propcolor))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 149 "parser3.mly"
                                                       ( MyLogic.PROP (MyProp.GreenRange (_3,_5)) )
# 783 "parser3.ml"
               : 'propcolor))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 150 "parser3.mly"
                                                      ( MyLogic.PROP (MyProp.BlueRange (_3,_5)) )
# 791 "parser3.ml"
               : 'propcolor))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Interface3.MyModel.st_pointset Interface3.MyLogic.fsyntax Interface3.command)
