



let rec reload() =
  let lexbuf = Lexing.from_channel stdin in
  let output = Parser.main Lexer.token lexbuf in
  print_string output; print_newline(); reload()

let _ = reload()
