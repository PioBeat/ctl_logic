OCAMLC = ocamlopt.opt -thread -I /usr/lib/ocaml/camlimages graphics.cmxa camlimages_core.cmxa camlimages_graphics.cmxa unix.cmxa threads.cmxa
OCAML = ocaml

EXE = ./stl
PARSOBJ = lexer.cmx parser.cmx

test : obj parser stl
	make $^
	# reset
	rlwrap $(EXE)

$(EXE) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface.cmx Test.cmx main.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@

obj : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface.ml Test.ml
	$(OCAMLC) -c $^

parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	$(OCAMLC) -c parser.mli
	$(OCAMLC) -c lexer.ml
	$(OCAMLC) -c parser.ml

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f $(EXE)