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
# 2 "parser.mly"
  open Interface
# 62 "parser.ml"
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
\002\000\001\000\002\000\001\000\003\000\001\000\001\000\001\000\
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
\000\000\000\000\000\000\048\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\053\000\063\000\064\000\065\000\045\000\
\046\000\038\000\062\000"

let yydgoto = "\002\000\
\013\000\014\000\024\000\017\000\034\000\056\000\114\000\062\000\
\064\000\035\000\098\000\058\000\115\000"

let yysindex = "\003\000\
\148\255\000\000\017\255\194\255\167\255\140\255\214\254\016\255\
\008\255\000\000\000\000\000\000\000\000\033\255\249\254\043\255\
\000\000\000\000\000\000\000\000\000\000\167\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\044\255\000\000\031\255\054\255\056\255\066\255\071\255\072\255\
\000\000\000\000\140\255\140\255\140\255\140\255\140\255\140\255\
\140\255\075\255\077\255\140\255\078\255\140\255\001\255\000\000\
\062\255\000\000\036\255\076\255\000\000\000\000\000\000\000\000\
\000\000\000\000\065\255\000\000\122\255\084\255\062\255\081\255\
\000\000\085\255\095\255\096\255\062\255\062\255\062\255\062\255\
\062\255\062\255\062\255\140\255\140\255\062\255\140\255\239\254\
\083\255\106\255\140\255\140\255\140\255\000\000\000\000\101\255\
\084\255\000\000\140\255\129\255\130\255\135\255\000\255\002\255\
\074\255\000\000\000\000\000\000\062\255\062\255\062\255\138\255\
\000\000\080\255\107\255\102\255\103\255\112\255\140\255\140\255\
\140\255\116\255\140\255\000\000\124\255\136\255\146\255\227\254\
\232\254\234\254\110\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\193\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\206\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\207\255\209\255\014\255\
\000\000\000\000\000\000\000\000\009\255\052\255\073\255\079\255\
\087\255\088\255\093\255\000\000\000\000\099\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\210\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\100\255\105\255\211\255\000\000\
\000\000\166\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\250\255\000\000\
\000\000\173\000\117\000\160\000\093\000"

let yytablesize = 216
let yytable = "\057\000\
\091\000\092\000\119\000\001\000\120\000\091\000\092\000\091\000\
\092\000\034\000\059\000\034\000\091\000\092\000\047\000\063\000\
\047\000\136\000\038\000\039\000\040\000\060\000\137\000\061\000\
\138\000\106\000\015\000\016\000\071\000\091\000\092\000\091\000\
\092\000\065\000\036\000\037\000\077\000\078\000\079\000\080\000\
\081\000\082\000\083\000\047\000\047\000\086\000\066\000\088\000\
\038\000\039\000\040\000\034\000\039\000\089\000\039\000\034\000\
\047\000\041\000\042\000\043\000\047\000\093\000\044\000\045\000\
\046\000\047\000\048\000\049\000\050\000\051\000\052\000\053\000\
\054\000\040\000\055\000\040\000\121\000\103\000\104\000\041\000\
\105\000\041\000\123\000\070\000\109\000\110\000\111\000\042\000\
\043\000\042\000\043\000\091\000\092\000\044\000\039\000\044\000\
\067\000\069\000\039\000\037\000\035\000\037\000\035\000\091\000\
\092\000\036\000\072\000\036\000\073\000\091\000\092\000\074\000\
\128\000\129\000\130\000\040\000\075\000\076\000\095\000\040\000\
\084\000\041\000\085\000\087\000\096\000\041\000\099\000\107\000\
\094\000\042\000\043\000\116\000\117\000\042\000\043\000\044\000\
\097\000\118\000\100\000\044\000\122\000\037\000\035\000\036\000\
\037\000\037\000\035\000\036\000\101\000\102\000\108\000\036\000\
\139\000\124\000\112\000\125\000\126\000\038\000\039\000\040\000\
\003\000\004\000\005\000\006\000\007\000\127\000\041\000\042\000\
\043\000\131\000\133\000\044\000\045\000\046\000\047\000\048\000\
\049\000\050\000\051\000\052\000\053\000\054\000\134\000\055\000\
\025\000\026\000\027\000\028\000\029\000\030\000\031\000\032\000\
\135\000\022\000\068\000\008\000\009\000\010\000\011\000\012\000\
\018\000\019\000\020\000\021\000\022\000\023\000\018\000\015\000\
\033\000\017\000\050\000\006\000\052\000\113\000\090\000\132\000"

let yycheck = "\006\000\
\030\001\031\001\003\001\001\000\003\001\030\001\031\001\030\001\
\031\001\001\001\053\001\003\001\030\001\031\001\001\001\008\001\
\003\001\047\001\018\001\019\001\020\001\006\001\047\001\008\001\
\047\001\043\001\010\001\011\001\035\000\030\001\031\001\030\001\
\031\001\001\001\004\001\005\001\043\000\044\000\045\000\046\000\
\047\000\048\000\049\000\030\001\031\001\052\000\054\001\054\000\
\018\001\019\001\020\001\043\001\001\001\053\001\003\001\047\001\
\043\001\027\001\028\001\029\001\047\001\026\001\032\001\033\001\
\034\001\035\001\036\001\037\001\038\001\039\001\040\001\041\001\
\042\001\001\001\044\001\003\001\003\001\084\000\085\000\001\001\
\087\000\003\001\003\001\053\001\091\000\092\000\093\000\001\001\
\001\001\003\001\003\001\030\001\031\001\001\001\043\001\003\001\
\054\001\054\001\047\001\001\001\001\001\003\001\003\001\030\001\
\031\001\001\001\053\001\003\001\053\001\030\001\031\001\046\001\
\119\000\120\000\121\000\043\001\046\001\046\001\054\001\047\001\
\046\001\043\001\046\001\046\001\003\001\047\001\046\001\045\001\
\053\001\043\001\043\001\003\001\003\001\047\001\047\001\043\001\
\053\001\003\001\054\001\047\001\003\001\043\001\043\001\004\001\
\005\001\047\001\047\001\043\001\054\001\054\001\045\001\047\001\
\043\001\047\001\054\001\054\001\054\001\018\001\019\001\020\001\
\013\001\014\001\015\001\016\001\017\001\054\001\027\001\028\001\
\029\001\054\001\047\001\032\001\033\001\034\001\035\001\036\001\
\037\001\038\001\039\001\040\001\041\001\042\001\047\001\044\001\
\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\047\001\001\001\022\000\048\001\049\001\050\001\051\001\052\001\
\007\001\008\001\009\001\010\001\011\001\012\001\001\001\001\001\
\042\001\001\001\001\001\001\001\047\001\097\000\055\000\123\000"

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
# 62 "parser.mly"
                           ( _1 )
# 339 "parser.ml"
               : Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'showarg) in
    Obj.repr(
# 65 "parser.mly"
                                ( _2 )
# 346 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'setarg) in
    Obj.repr(
# 66 "parser.mly"
                                ( _2 )
# 353 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'semarg) in
    Obj.repr(
# 67 "parser.mly"
                                ( _2 )
# 360 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'backtrackarg) in
    Obj.repr(
# 68 "parser.mly"
                                ( _2 )
# 367 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 69 "parser.mly"
                                ( LET (_2,_4) )
# 375 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'savearg) in
    Obj.repr(
# 70 "parser.mly"
                                ( _2 )
# 382 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'loadarg) in
    Obj.repr(
# 71 "parser.mly"
                                ( _2 )
# 389 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
                                ( RESET )
# 395 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
                                ( REFRESH )
# 401 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
                                ( STOP_TEST )
# 407 "parser.ml"
               : 'command))
; (fun __caml_parser_env ->
    Obj.repr(
# 77 "parser.mly"
                      ( SAVE_STORE )
# 413 "parser.ml"
               : 'savearg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser.mly"
                      ( SAVE_IMAGE _2 )
# 420 "parser.ml"
               : 'savearg))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
                      ( LOAD_STORE )
# 426 "parser.ml"
               : 'loadarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'color) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
                            ( SEM_IDE (_1,_2,[]) )
# 434 "parser.ml"
               : 'semarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'color) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 85 "parser.mly"
                            ( SEM_IDE (_1,_2,_3) )
# 443 "parser.ml"
               : 'semarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'color) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 86 "parser.mly"
                            ( SEM(_1,_2) )
# 451 "parser.ml"
               : 'semarg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 89 "parser.mly"
                            ( BACKTRACK _1 )
# 458 "parser.ml"
               : 'backtrackarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser.mly"
                                ( SHOW_STATUS )
# 464 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
                                ( SHOW_FORMULA )
# 470 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser.mly"
                                ( SHOW_STORE )
# 476 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
                                ( SHOW_SPACE Graphics.red )
# 482 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'color) in
    Obj.repr(
# 96 "parser.mly"
                                ( SHOW_SPACE _2 )
# 489 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "parser.mly"
                                ( SHOW_TIME )
# 495 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    Obj.repr(
# 98 "parser.mly"
                                ( SHOW_FUTURE )
# 501 "parser.ml"
               : 'showarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 101 "parser.mly"
                            ( SET_TIME _2 )
# 508 "parser.ml"
               : 'setarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 102 "parser.mly"
                            ( SET_SPACE (_2,_3) )
# 516 "parser.ml"
               : 'setarg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 105 "parser.mly"
                                                     ( _2 )
# 523 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parser.mly"
                                                     ( MyLogic.TRUE )
# 529 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
                                                     ( MyLogic.FALSE )
# 535 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'propcolor) in
    Obj.repr(
# 108 "parser.mly"
                                                     ( _2 )
# 542 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 109 "parser.mly"
                                                     ( MyLogic.PROP (MyProp.Id _2) )
# 549 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'propcolor) in
    Obj.repr(
# 110 "parser.mly"
                                                     ( _1 )
# 556 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 111 "parser.mly"
                                                     ( MyLogic.NOT (_2) )
# 563 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 112 "parser.mly"
                                                     ( MyLogic.AND (_1,_3) )
# 571 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 113 "parser.mly"
                                                     ( MyLogic.OR (_1,_3) )
# 579 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 114 "parser.mly"
                                                     ( MyLogic.NEAR _2 )
# 586 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 115 "parser.mly"
                                                     ( MyLogic.SURR (_3,_5) )
# 594 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 116 "parser.mly"
                                                     ( MyLogic.AX _2 )
# 601 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 117 "parser.mly"
                                                     ( MyLogic.EX _2 )
# 608 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 118 "parser.mly"
                                                     ( MyLogic.AF _2 )
# 615 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 119 "parser.mly"
                                                     ( MyLogic.EF _2 )
# 622 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 120 "parser.mly"
                                                     ( MyLogic.AG _2 )
# 629 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 121 "parser.mly"
                                                     ( MyLogic.EG _2 )
# 636 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 122 "parser.mly"
                                                     ( MyLogic.AU (_3,_5) )
# 644 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'fsyntax) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'fsyntax) in
    Obj.repr(
# 123 "parser.mly"
                                                     ( MyLogic.EU (_3,_5) )
# 652 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 124 "parser.mly"
                                                     ( MyLogic.CALL (_2,[]) )
# 659 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'formulalist) in
    Obj.repr(
# 125 "parser.mly"
                                                     ( MyLogic.CALL (_2,_4) )
# 667 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 126 "parser.mly"
                                                     ( MyLogic.MVAR (_2) )
# 674 "parser.ml"
               : 'fsyntax))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 129 "parser.mly"
                      ( _1::[] )
# 681 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'arglist) in
    Obj.repr(
# 130 "parser.mly"
                      ( _1::_2 )
# 689 "parser.ml"
               : 'arglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fsyntax) in
    Obj.repr(
# 133 "parser.mly"
                                ( _1::[] )
# 696 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'fsyntax) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formulalist) in
    Obj.repr(
# 134 "parser.mly"
                                ( _1::_3 )
# 704 "parser.ml"
               : 'formulalist))
; (fun __caml_parser_env ->
    Obj.repr(
# 137 "parser.mly"
                                               ( Graphics.red )
# 710 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "parser.mly"
                                               ( Graphics.green )
# 716 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "parser.mly"
                                               ( Graphics.blue )
# 722 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 140 "parser.mly"
                                               ( Graphics.black )
# 728 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "parser.mly"
                                               ( Graphics.white )
# 734 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 142 "parser.mly"
                                               ( Graphics.yellow )
# 740 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "parser.mly"
                                               ( Graphics.cyan )
# 746 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    Obj.repr(
# 144 "parser.mly"
                                               ( Graphics.magenta )
# 752 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : int) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 145 "parser.mly"
                                               ( Graphics.rgb _2 _4 _6 )
# 761 "parser.ml"
               : 'color))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 148 "parser.mly"
                                                     ( MyLogic.PROP (MyProp.RedRange (_3,_5)) )
# 769 "parser.ml"
               : 'propcolor))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 149 "parser.mly"
                                                       ( MyLogic.PROP (MyProp.GreenRange (_3,_5)) )
# 777 "parser.ml"
               : 'propcolor))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 150 "parser.mly"
                                                      ( MyLogic.PROP (MyProp.BlueRange (_3,_5)) )
# 785 "parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command)
