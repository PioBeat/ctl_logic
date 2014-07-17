type token =
  | EOL
  | FORMULA
  | SHOW
  | SEM
  | EXIT
  | IDE of (string)

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Interface.command
