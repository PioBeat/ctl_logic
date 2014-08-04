OCAMLC = ocamlc
OCAML = ocaml

EXE = ./ctl
PARSOBJ = lexer.cmo parser.cmo



compile : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface.ml
	$(OCAMLC) -c $^

parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml