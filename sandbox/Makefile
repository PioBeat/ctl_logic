OCAMLC = ocamlopt.opt -thread -I /usr/lib/ocaml/camlimages graphics.cmxa camlimages_core.cmxa camlimages_graphics.cmxa unix.cmxa threads.cmxa
OCAML = ocaml

EXE1 = stl_test1
EXE2 = stl_test2
EXE3 = stl_test3
EXE4 = stl_test4
EXE5 = stl_test5
EXE6 = stl_test6
EXE7 = stl_test7

PARSOBJ1 = lexer.cmx parser.cmx
PARSOBJ2 = lexer.cmx parser.cmx
PARSOBJ3 = lexer3.cmx parser3.cmx
PARSOBJ7 = lexer7.cmx parser7.cmx


# bus test

bustest : BusBranch.ml
	make parserbus
	$(OCAMLC) lexerBus.cmx parserBus.cmx $^ -o busbranch

parserbus :
	ocamllex lexerBus.mll
	ocamlyacc parserBus.mly
	$(OCAMLC) -c parserBus.mli
	$(OCAMLC) -c lexerBus.ml
	$(OCAMLC) -c parserBus.ml




# Primo test

test1 : obj parser $(EXE1)
	make compile
	rlwrap ./$(EXE1) test1/openstreetmap-pisa.bmp

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




# Secondo test

test2 : obj parser $(EXE2)
	make compile
	rlwrap ./$(EXE2)

$(EXE2) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface.cmx Test.cmx main2.ml
	$(OCAMLC) $(PARSOBJ2) $^ -o $@




# Terzo test

test3 : compile3 $(EXE3)
	rlwrap ./$(EXE3) test3/ball test3/time.dot test3/formula.fr

compile3 : obj3_1 parsergraph obj3_2 parser3

$(EXE3) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface3.cmx lexerGraph.cmx parserGraph.cmx Test3.cmx main3.ml
	$(OCAMLC) $(PARSOBJ3) $^ -o $@

obj3_1 : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface3.ml
	$(OCAMLC) -c $^

obj3_2 : Test3.ml
	$(OCAMLC) -c $^

parser3 :
	ocamllex lexer3.mll
	ocamlyacc parser3.mly
	$(OCAMLC) -c parser3.mli
	$(OCAMLC) -c lexer3.ml
	$(OCAMLC) -c parser3.ml

parsergraph :
	ocamllex lexerGraph.mll
	ocamlyacc parserGraph.mly
	$(OCAMLC) -c parserGraph.mli
	$(OCAMLC) -c lexerGraph.ml
	$(OCAMLC) -c parserGraph.ml




# Quarto test: autobus di Edinburgo

test4 : compile3 $(EXE4)
	rlwrap ./$(EXE4) test4/map test4/time.dot test4/formula.fr

$(EXE4) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface3.cmx lexerGraph.cmx parserGraph.cmx Test3.cmx main3.ml
	$(OCAMLC) $(PARSOBJ3) $^ -o $@


# Quinto test: altri autobus di Edinburgo

test5 : compile3 $(EXE5)
	rlwrap ./$(EXE5) test5/state test5/time.dot test5/formula.fr

$(EXE5) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface3.cmx lexerGraph.cmx parserGraph.cmx Test3.cmx main3.ml
	$(OCAMLC) $(PARSOBJ3) $^ -o $@


# Sesto test: malfunzionamento di un autobus di Edinburgo

test6 : compile3 $(EXE6)
	rlwrap ./$(EXE6) test6/state test6/time.dot test6/formula.fr

$(EXE6) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface3.cmx lexerGraph.cmx parserGraph.cmx Test3.cmx main3.ml
	$(OCAMLC) $(PARSOBJ3) $^ -o $@


# Settimo test

test7 : compile7 $(EXE7)
	rlwrap ./$(EXE7) test7/state test7/time.dot test7/formula.fr

$(EXE7) : StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface7.cmx lexerGraph7.cmx parserGraph7.cmx Test7.cmx main7.ml
	$(OCAMLC) $(PARSOBJ7) $^ -o $@

compile7 : obj7_1 parsergraph7 obj7_2 parser7

obj7_1 : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface7.ml
	$(OCAMLC) -c $^

obj7_2 : Test7.ml
	$(OCAMLC) -c $^

parser7 :
	ocamllex lexer7.mll
	ocamlyacc parser7.mly
	$(OCAMLC) -c parser7.mli
	$(OCAMLC) -c lexer7.ml
	$(OCAMLC) -c parser7.ml

parsergraph7 :
	ocamllex lexerGraph7.mll
	ocamlyacc parserGraph7.mly
	$(OCAMLC) -c parserGraph7.mli
	$(OCAMLC) -c lexerGraph7.ml
	$(OCAMLC) -c parserGraph7.ml




# Comandi per pulizia

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f $(EXE1) $(EXE2) $(EXE3) $(EXE4) $(EXE5) $(EXE6) $(EXE7)
