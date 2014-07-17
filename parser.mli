type token =
  | EOL
  | STOP

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string
