OCAMLC = ocamlopt.opt -thread -I /usr/lib/ocaml/camlimages graphics.cmxa camlimages_core.cmxa camlimages_graphics.cmxa unix.cmxa threads.cmxa
OCAML = ocaml

EXE1 = stl_test1

PARSOBJ1 = lexer.cmx parser.cmx


# Primo test: una cartina di Pisa

test : obj parser $(EXE1)
	make compile
	rlwrap ./$(EXE1) data/openstreetmap-pisa.bmp

compile : obj parser $(EXE1)
	make $^

$(EXE1) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface.cmx Test.cmx main.ml
	$(OCAMLC) $(PARSOBJ1) $^ -o $@

obj : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface.ml Test.ml
	$(OCAMLC) -c $^

parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	$(OCAMLC) -c parser.mli
	$(OCAMLC) -c lexer.ml
	$(OCAMLC) -c parser.ml




# Comandi per pulizia

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f $(EXE1) $(EXE2) $(EXE3) $(EXE4) $(EXE5) $(EXE6)
