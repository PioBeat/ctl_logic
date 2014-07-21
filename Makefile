OCAMLC = ocamlc
OCAML = ocaml

EXE = ./ctl
PARSOBJ = lexer.cmo parser.cmo

test : obj parser ctl
	make $^
	# reset
	rlwrap $(EXE)

test2 : obj2 parser ctl2
	make $^
	# reset
	rlwrap $(EXE)2

$(EXE) : BranchTimeLogic.cmo Graph.cmo Model.cmo BtlConvert.cmo Interface.cmo BtlTest.cmo main.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@
$(EXE)2 : BranchTimeLogic.cmo Graph.cmo Model.cmo BtlConvert.cmo Interface.cmo BtlTest2.cmo main.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@

obj : BranchTimeLogic.ml Graph.ml Model.ml BtlConvert.ml Interface.ml BtlTest.ml
	$(OCAMLC) -c $^

obj2 : BranchTimeLogic.ml Graph.ml Model.ml BtlConvert.ml Interface.ml BtlTest2.ml
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
	rm -f $(EXE)2