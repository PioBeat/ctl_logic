OCAMLC = ocamlopt.opt -thread -I /usr/lib/ocaml/camlimages graphics.cmxa camlimages_core.cmxa camlimages_graphics.cmxa unix.cmxa threads.cmxa
OCAML = ocaml

EXE = stl
BUSEXE = busbranch
PARSOBJ = lexer.cmx parser.cmx


# bus test

waittest : compile $(EXE)
	make parserbus
	$(OCAMLC) lexerBus.cmx parserBus.cmx BusBranch.ml -o $(BUSEXE)
	make debugwait

tracetest : compile $(EXE)
	make parserbus
	$(OCAMLC) lexerBus.cmx parserBus.cmx BusBranch.ml -o $(BUSEXE)
	make debugtrace

compile : obj_1 parsergraph obj_2 parser

obj_1 : StlLogic.ml Graph.ml Model.ml StlConvert.ml Interface.ml
	$(OCAMLC) -c $^

obj_2 : 
	$(OCAMLC) -c Test.ml

parserbus :
	ocamllex lexerBus.mll
	ocamlyacc parserBus.mly
	$(OCAMLC) -c parserBus.mli
	$(OCAMLC) -c lexerBus.ml
	$(OCAMLC) -c parserBus.ml

debugwait :
	./$(BUSEXE) "wait/edinburgh.bmp" "wait/bustimetable.txt" "wait/maps/map" "wait/time.dot" 3
	./$(BUSEXE) "trace/edinburgh.bmp" "trace/bustimetable.txt" "trace/maps/map" "trace/time.dot" 0
	rlwrap ./$(EXE) wait/maps/map wait/time.dot wait/formula.fr


debugtrace :
	./$(BUSEXE) "wait/edinburgh.bmp" "wait/bustimetable.txt" "wait/maps/map" "wait/time.dot" 3
	./$(BUSEXE) "trace/edinburgh.bmp" "trace/bustimetable.txt" "trace/maps/map" "trace/time.dot" 0
	rlwrap ./$(EXE) trace/maps/map trace/time.dot trace/formula.fr

$(EXE) : 
	make compile
	$(OCAMLC) $(PARSOBJ) StlLogic.cmx Graph.cmx Model.cmx StlConvert.cmx Interface.cmx lexerGraph.cmx parserGraph.cmx Test.cmx main.ml -o $@


parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	$(OCAMLC) -c parser.mli
	$(OCAMLC) -c lexer.ml
	$(OCAMLC) -c parser.ml

parsergraph :
	ocamllex lexerGraph.mll
	ocamlyacc parserGraph.mly
	$(OCAMLC) -c parserGraph.mli
	$(OCAMLC) -c lexerGraph.ml
	$(OCAMLC) -c parserGraph.ml





# Comandi per pulizia

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f $(EXE) $(BUSEXE)
