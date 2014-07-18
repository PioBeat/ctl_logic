{
  open Parser        (* The type token is defined in parser.mli *)
  exception Eof
}
rule token = parse
(* fine riga e caratteri speciali*)
| ['\n' ' ' '\t']     { token lexbuf }     (* skip blanks *)          
| ';'                 { EOL }
| ','                 { COMMA }
| "'"                 { QUOTE }
| '$'                 { DOLLAR }
| '<'                 { LBANGLE }
| '>'                 { RBANGLE }
| '('                 { LBROUND }
| ')'                 { RBROUND }
| '['                 { LBSQUARE }
| ']'                 { RBSQUARE }

(* oggetti *)
| "formula"      { FORMULA }
| "tt"           { T }
| "true"         { T }
| "ff"           { F }
| "false"        { F }
| "!"            { NOT }
| "and"          { AND }
| "or"           { OR }
| "ax"           { AX }
| "ex"           { EX }
| "af"           { AF }
| "ef"           { EF }
| "ag"           { AG }
| "eg"           { EG }
| "au"           { AU }
| "eu"           { EU }


(* operatori *)
| "="            { EQ }

(* comandi *)
| "show"         { SHOW }
| "exit"         { EXIT }
| "sem"          { SEM }
| "let"          { LET }
| eof            { raise Eof }

(* identificatori *)
| ['A'-'Z' 'a'-'z']['A'-'Z' 'a'-'z' '0'-'9']* as lxm {IDE lxm}
