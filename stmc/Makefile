OCAMLOPT = ocamlopt.opt -thread -I /usr/lib/ocaml/camlimages graphics.cmxa camlimages_core.cmxa camlimages_graphics.cmxa unix.cmxa threads.cmxa
EXE = stmc
CMX = Util.cmx Graph.cmx StlLogic.cmx Model.cmx StlConvert.cmx Interface.cmx parserGraph.cmx lexerGraph.cmx parser.cmx lexer.cmx Test.cmx main.cmx
RLWRAP = `which rlwrap`

$(EXE): $(CMX)
	$(OCAMLOPT) $(CMX) -o $@

%.cmx: %.ml
	$(OCAMLOPT) -c $^

%.ml: %.mll
	ocamllex $^

%.ml: %.mly
	ocamlyacc $^
	$(OCAMLOPT) -c $*.mli

almostclean :
	rm -f *.cmi *.cmx *~ \#* *.o lexerGraph.ml lexer.ml parserGraph.ml parser.ml parserGraph.mli parser.mli 

clean : almostclean
	rm -f $(EXE)

interactive-example-trace: $(EXE)
	rlwrap ./$(EXE) ../examples/trace/maps/map ../examples/trace/time.dot ../examples/trace/formula.stmc 

