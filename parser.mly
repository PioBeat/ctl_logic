%token EOL
%token STOP
%start main
%type <string> main
%%
main:
expr EOL                { $1 }
  ;
  expr:
 | STOP                 { "ciccio" }
  ;
