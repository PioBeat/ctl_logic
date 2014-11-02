%{

%}
%token EOF
%token QUOTE
%token COMMA
%token SEMICOLON
%token LBROUND
%token RBROUND
%token LBCURLY
%token RBCURLY
%token LBSQUARE
%token RBSQUARE
%token RARROW
%token DIGRAPH
%token EXIT
%token <string> IDE
%token <int> INT
%start main
%type <(int*int) array array> main
%type <(int*int) array> entrylist
%%
  main:
    | LBCURLY entrylist RBCURLY SEMICOLON main  { Array.append (Array.make 1 $2) $5 }
    | LBCURLY entrylist RBCURLY EOF   { Array.make 1 $2 }
    ;
      
      entrylist:
    | LBROUND INT COMMA INT RBROUND COMMA entrylist { Array.append (Array.make 1 ($2,$4)) $7 }
    | LBROUND INT COMMA INT RBROUND { Array.make 1 ($2,$4) }
    ;
