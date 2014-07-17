type token =
  | EOL
  | FORMULA
  | SHOW
  | SEM
  | LET
  | EQ
  | T
  | EXIT
  | IDE of (string)

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command
