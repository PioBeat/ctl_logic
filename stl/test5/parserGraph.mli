type token =
  | EOF
  | QUOTE
  | COMMA
  | SEMICOLON
  | LBROUND
  | RBROUND
  | LBCURLY
  | RBCURLY
  | LBSQUARE
  | RBSQUARE
  | RARROW
  | DIGRAPH
  | EXIT
  | IDE of (string)
  | INT of (int)

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Interface.MyTimeGraph.t
