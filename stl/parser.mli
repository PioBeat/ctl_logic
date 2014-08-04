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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command
