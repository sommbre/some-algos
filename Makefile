test: plik.cmo drugi_plik.cmo
	ocamlc -o $@ $^

%.cmo: %.ml
	ocamlc -c $<

%.cmi: %.mli
	ocamlc -c $<
clean:
	rm *.cmi *.cmo

depend:
	ocamldep *.ml *.mli > .depend

include .depend