all: collections puzzlesolve tests tiles puzzledescription mazes experiments

collections : collections.ml
	ocamlbuild -use-ocamlfind collections.byte
	
puzzlesolve : puzzlesolve.ml
	ocamlbuild -use-ocamlfind puzzlesolve.byte

tests : tests.ml
	ocamlbuild -use-ocamlfind tests.byte
	
tiles : tiles.ml
	ocamlbuild -use-ocamlfind tiles.byte
	
puzzledescription : puzzledescription.ml
	ocamlbuild -use-ocamlfind puzzledescription.byte

mazes : mazes.ml
	ocamlbuild -use-ocamlfind mazes.byte
	
draw : draw.ml
	ocamlbuild -use-ocamlfind draw.byte
	
experiments : experiments.ml
	ocamlbuild -use-ocamlfind experiments.byte

	
clean : 
	rm -r _build
	rm *.byte
