{
  open Parser        (* The type token is defined in parser.mli *)
  exception Eof
}
rule token = parse
(* fine riga e caratteri speciali*)
| ['\n' ' ' '\t']     { token lexbuf }     (* skip blanks *)          
| ';'        { EOL }

(* oggetti *)
| "formula"      { FORMULA }

(* comandi *)
| "show"         { SHOW }
| "exit"         { EXIT }
| "sem"          { SEM }
| eof            { raise Eof }

(* identificatori *)
| ['A'-'Z' 'a'-'z']['A'-'Z' 'a'-'z' '0'-'9']* as lxm {IDE lxm}