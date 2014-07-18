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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command
