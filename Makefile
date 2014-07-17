OCAMLC = ocamlc
OCAML = ocaml

PARSOBJ = lexer.cmo parser.cmo

ctl : BranchTimeLogic.cmo Graph.cmo Model.cmo BtlConvert.cmo main.ml
	$(OCAMLC) $(PARSOBJ) $^ -o $@

obj : BranchTimeLogic.ml Graph.ml Model.ml BtlConvert.ml
	$(OCAMLC) -c $^

parser :
	ocamllex lexer.mll
	ocamlyacc parser.mly
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml



test : ctl
	ocamlrun ctl

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f ctl