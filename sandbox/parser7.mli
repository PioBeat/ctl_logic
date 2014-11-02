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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Interface7.MyModel.st_pointset Interface7.MyLogic.fsyntax Interface7.command
