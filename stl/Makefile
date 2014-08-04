OCAMLC = ocamlc
OCAML = ocaml

EXE = ./stl
PARSOBJ = lexer.cmo parser.cmo

test : obj parser stl
	make $^
	# reset
	rlwrap $(EXE)

$(EXE) : StlLogic.cmo Graph.cmo Model.cmo StlConvert.cmo Interface.cmo Test.cmo main.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@

obj : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface.ml Test.ml
	$(OCAMLC) -c $^

parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f $(EXE)