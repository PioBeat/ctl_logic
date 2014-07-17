type 'a command =
| SHOW_FORMULA
| LET of string * 'a
| SEM of string
| STOP_TEST
