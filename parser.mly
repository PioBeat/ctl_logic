%{
  open Interface
%}
%token EOL
%token FORMULA
%token SHOW
%token SEM
%token EXIT
%token <string> IDE
%start main
%type <Interface.command> main
%%
main:
command EOL                { $1 }
  ;
  command:
 | SHOW FORMULA         { SHOW_FORMULA }
 | SEM IDE              { SEM $2 }
 | EXIT                 { STOP_TEST }
  ;
