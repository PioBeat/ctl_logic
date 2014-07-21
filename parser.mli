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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> BtlTest2.MyModel.st_pointset BtlTest2.MyLogic.fsyntax Interface.command
