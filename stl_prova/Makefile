OCAMLC = ocamlopt.opt -thread -I /usr/lib/ocaml/camlimages graphics.cmxa camlimages_core.cmxa camlimages_graphics.cmxa unix.cmxa threads.cmxa
OCAML = ocaml

EXE = stl
PARSOBJ = lexer.cmx parser.cmx

test : obj parser $(EXE)
	make $^
	rlwrap ./$(EXE) openstreetmap-pisa.bmp

test2 : obj parser $(EXE)2
	make $^
	rlwrap ./$(EXE)2

test3 : obj3 parser3 parsergraph $(EXE)3
	make $^
	rlwrap ./$(EXE)3 prova/prova prova/time.dot

compile : obj parser $(EXE)
	make $^

compile3 : obj3 parser3 parsergraph
	make $^

$(EXE) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface.cmx Test.cmx main.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@

$(EXE)2 : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface.cmx Test.cmx main2.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@

$(EXE)3 : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface3.cmx lexerGraph.cmx parserGraph.cmx Test3.cmx main3.ml
	$(OCAMLC) lexer3.cmx parser3.cmx $^ -o $@

obj : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface.ml Test.ml
	$(OCAMLC) -c $^

obj3 : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface3.ml Test3.ml
	$(OCAMLC) -c $^

parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	$(OCAMLC) -c parser.mli
	$(OCAMLC) -c lexer.ml
	$(OCAMLC) -c parser.ml

parser3 :
	ocamllex lexer3.mll
	ocamlyacc parser3.mly
	$(OCAMLC) -c parser3.mli
	$(OCAMLC) -c lexer3.ml
	$(OCAMLC) -c parser3.ml

parsergraph :
	ocamllex lexerGraph.mll
	ocamlyacc parserGraph.mly
	$(OCAMLC) -c Interface3.cmx parserGraph.mli
	$(OCAMLC) -c Interface3.cmx lexerGraph.ml
	$(OCAMLC) -c Interface3.cmx parserGraph.ml

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f $(EXE)
