%{
  open Interface7
%}
%token EOL
%token QUOTE
%token COMMA
%token DOLLAR
%token AT
%token IMAGE
%token STATUS
%token STORE
%token FUTURE
%token TIME
%token SPACE
%token FORMULA
%token SET
%token SHOW
%token SEM
%token BACKTRACK
%token LET
%token RED
%token GREEN
%token BLUE
%token BLACK
%token WHITE
%token YELLOW
%token CYAN
%token MAGENTA
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
%token RESET
%token REFRESH
%token EXIT
%token <string> IDE
%token <int> INT
%start main
%type <Interface7.MyModel.st_pointset Interface7.MyLogic.fsyntax Interface7.command> main
%%
main:
command EOL                { $1 }
  ;
  command:
 | SHOW showarg                 { $2 }
 | SET setarg                   { $2 }
 | SEM semarg                   { $2 }
 | BACKTRACK backtrackarg       { $2 }
 | LET IDE EQ fsyntax           { LET ($2,$4) }
 | SAVE savearg                 { $2 }
 | LOAD loadarg                 { $2 }
 | RESET                        { RESET }
 | REFRESH                      { REFRESH }
 | EXIT                         { STOP_TEST }
  ;
  savearg:
 | STORE              { SAVE_STORE }
 | IMAGE IDE          { SAVE_IMAGE $2 }
 | IMAGE INT IDE      { SAVE_SINGLE_IMAGE ($2,$3) }
  ;
  loadarg:
 | STORE              { LOAD_STORE }
  ;
  semarg:
 | color IDE                { SEM_IDE ($1,$2,[]) }
 | color IDE arglist        { SEM_IDE ($1,$2,$3) }
 | color fsyntax            { SEM($1,$2) }
  ;
  backtrackarg: 
 | fsyntax                  { BACKTRACK $1 }
  ;
  showarg:
 | STATUS                       { SHOW_STATUS }
 | FORMULA                      { SHOW_FORMULA }
 | STORE                        { SHOW_STORE }
 | SPACE                        { SHOW_SPACE Graphics.red }
 | SPACE color                  { SHOW_SPACE $2 }
 | TIME                         { SHOW_TIME }
 | FUTURE                       { SHOW_FUTURE }
  ;
  setarg:
 | TIME INT                 { SET_TIME $2 }
 | SPACE INT INT            { SET_SPACE ($2,$3) }
  ;
  fsyntax:
 | LBROUND fsyntax RBROUND                           { $2 }
 | T                                                 { MyLogic.TRUE }
 | F                                                 { MyLogic.FALSE }
 | LBANGLE propcolor RBANGLE                         { $2 }
 | LBANGLE IDE RBANGLE                               { MyLogic.PROP (MyProp.Id $2) }
 | propcolor                                         { $1 }
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
 | fsyntax                      { $1::[] }
 | fsyntax COMMA formulalist    { $1::$3 }
  ;
  color:
 | RED                                         { Graphics.red }
 | GREEN                                       { Graphics.green }
 | BLUE                                        { Graphics.blue }
 | BLACK                                       { Graphics.black }
 | WHITE                                       { Graphics.white }
 | YELLOW                                      { Graphics.yellow }
 | CYAN                                        { Graphics.cyan }
 | MAGENTA                                     { Graphics.magenta }
 | LBROUND INT COMMA INT COMMA INT RBROUND     { Graphics.rgb $2 $4 $6 }
  ;
  propcolor:
 | RED LBSQUARE INT COMMA INT RBSQUARE               { MyLogic.PROP (MyProp.RedRange ($3,$5)) }
 | GREEN LBSQUARE INT COMMA INT RBSQUARE               { MyLogic.PROP (MyProp.GreenRange ($3,$5)) }
 | BLUE LBSQUARE INT COMMA INT RBSQUARE               { MyLogic.PROP (MyProp.BlueRange ($3,$5)) }
