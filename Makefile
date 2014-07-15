# RESULT = ctl
# SOURCES = BranchTimeLogic.ml \
# 	Graph.ml \
# 	Model.ml \
# 	BtlConvert.ml \
# 	btlTest.ml

# OCAMLMAKEFILE = OCamlMakefile
# include $(OCAMLMAKEFILE)

OCAMLC = ocamlc

ctl: BranchTimeLogic.ml Graph.ml Model.ml BtlConvert.ml btlTest.ml
	$(OCAMLC) $^ -o $@

almostclean :
	rm -f *.cm* *~ \#* *.o

clean : almostclean
	rm -f ctl