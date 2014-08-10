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
| '@'                 { AT }
| '<'                 { LBANGLE }
| '>'                 { RBANGLE }
| '('                 { LBROUND }
| ')'                 { RBROUND }
| '['                 { LBSQUARE }
| ']'                 { RBSQUARE }

(* oggetti *)
| "formula"      { FORMULA }
| "T"            { T }
| "tt"           { T }
| "true"         { T }
| "F"            { F }
| "ff"           { F }
| "false"        { F }
| "not"          { NOT }
| "!"            { NOT }
| "and"          { AND }
| "&"            { AND }
| "or"           { OR }
| "|"            { OR }
| "ax"           { AX }
| "AX"           { AX }
| "ex"           { EX }
| "EX"           { EX }
| "af"           { AF }
| "AF"           { AF }
| "ef"           { EF }
| "EF"           { EF }
| "ag"           { AG }
| "AG"           { AG }
| "eg"           { EG }
| "EG"           { EG }
| "au"           { AU }
| "AU"           { AU }
| "eu"           { EU }
| "EU"           { EU }
| "n"            { N }
| "N"            { N }
| "near"         { N }
| "s"            { S }
| "S"            { S }
| "surr"         { S }


(* operatori *)
| "RED"          { RED }
| "red"          { RED }
| "GREEN"        { GREEN }
| "green"        { GREEN }
| "BLUE"         { BLUE }
| "blue"         { BLUE }
| "="            { EQ }

(* comandi *)
| "show"         { SHOW }
| "save"         { SAVE }
| "load"         { LOAD }
| "reset"        { RESET }
| "exit"         { EXIT }
| "sem"          { SEM }
| "let"          { LET }
| eof            { raise Eof }

(* identificatori *)
| ['0'-'9']+ as lxm {INT (int_of_string lxm)}
| ['A'-'Z' 'a'-'z']['A'-'Z' 'a'-'z' '0'-'9']* as lxm {IDE lxm}
