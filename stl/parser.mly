%{
  open Interface
%}
%token EOL
%token QUOTE
%token COMMA
%token DOLLAR
%token AT
%token FORMULA
%token SHOW
%token SEM
%token BACKTRACK
%token LET
%token EQ
%token T
%token F
%token NOT
%token AND
%token OR
%token AX
%token EX
%token AF
%token EF
%token AG
%token EG
%token AU
%token EU
%token N
%token S
%token LBROUND
%token RBROUND
%token LBANGLE
%token RBANGLE
%token LBSQUARE
%token RBSQUARE
%token SAVE
%token LOAD
%token EXIT
%token <string> IDE
%token <int> INT
%start main
%type <Interface.MyModel.st_pointset Interface.MyLogic.fsyntax Interface.command> main
%%
main:
command EOL                { $1 }
  ;
  command:
 | SHOW FORMULA                 { SHOW_FORMULA }
 | SEM IDE                      { SEM ($2,[]) }
 | SEM IDE arglist              { SEM ($2,$3) }
 | BACKTRACK IDE INT    { BACKTRACK ($2,[],$3) }
 | BACKTRACK IDE arglist INT    { BACKTRACK ($2,$3,$4) }
 | LET IDE EQ fsyntax           { LET ($2,$4) }
 | SAVE                         { SAVE }
 | LOAD                         { LOAD }
 | EXIT                         { STOP_TEST }
  ;
  fsyntax:
 | LBROUND fsyntax RBROUND                           { $2 }
 | T                                                 { MyLogic.TRUE }
 | F                                                 { MyLogic.FALSE }
 | LBANGLE IDE RBANGLE                               { MyLogic.PROP $2 }
 | NOT fsyntax                                       { MyLogic.NOT ($2) }
 | fsyntax AND fsyntax                               { MyLogic.AND ($1,$3) }
 | fsyntax OR fsyntax                                { MyLogic.OR ($1,$3) }
 | N fsyntax                                         { MyLogic.NEAR $2 }
 | S LBSQUARE fsyntax COMMA fsyntax RBSQUARE         { MyLogic.SURR ($3,$5) }
 | AX fsyntax                                        { MyLogic.AX $2 }
 | EX fsyntax                                        { MyLogic.EX $2 }
 | AF fsyntax                                        { MyLogic.AF $2 }
 | EF fsyntax                                        { MyLogic.EF $2 }
 | AG fsyntax                                        { MyLogic.AG $2 }
 | EG fsyntax                                        { MyLogic.EG $2 }
 | AU LBSQUARE fsyntax COMMA fsyntax RBSQUARE        { MyLogic.AU ($3,$5) }
 | EU LBSQUARE fsyntax COMMA fsyntax RBSQUARE        { MyLogic.EU ($3,$5) }
 | DOLLAR IDE                                        { MyLogic.CALL ($2,[]) }
 | DOLLAR IDE LBSQUARE formulalist RBSQUARE          { MyLogic.CALL ($2,$4) }
 | AT IDE                                            { MyLogic.MVAR ($2) }
  ;
  arglist:
 | IDE                { $1::[] }
 | IDE arglist        { $1::$2 }
  ;
  formulalist:
 | fsyntax            { $1::[] }
 | fsyntax arglist    { $1::[] }
  ;
