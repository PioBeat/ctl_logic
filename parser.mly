%{
  open Interface
  open BtlTest
%}
%token EOL
%token FORMULA
%token SHOW
%token SEM
%token LET
%token EQ
%token T
%token EXIT
%token <string> IDE
%start main
%type <BtlTest.MyModel.st_pointset BtlTest.MyLogic.fsyntax Interface.command> main
%%
main:
command EOL                { $1 }
  ;
  command:
 | SHOW FORMULA         { SHOW_FORMULA }
 | SEM IDE              { SEM $2 }
 | LET IDE EQ fsyntax   { LET ($2,$4) }
 | EXIT                 { STOP_TEST }
  ;
  fsyntax:
 | T                    { MyLogic.TRUE }
