The STLCS model checker
===================================================

This project is a research prototype, implementing a model checker
that operates on "space" and "time". A model consist of:
- A topological quasi-discrete space (the "space" part of the model)
- A Kripke frame (the "time" part of the model)
- A set of atomic propositions

The core implementation is independent of the chosen model, and it is possible to use any graph as a model; however, loaders have only been implemented for images in this version, thus to use an arbitrary graph as a model one should hard-code it in the main program. You can also watch

https://github.com/vincenzoml/topochecker

where the second generation of the tool (no longer a prototype) will soon be uploaded; topochecker will feature .dot file loading for spatial models.

The source code is divided in two folders. The folder "stl" contains the last version of the source code and some examples.
In the folder "sandbox" there are some experiments and various experimental versions.

The prerequisites are the ocaml compiler, and the camlimages library.

To compile, type "make stl" in the subdirectory "stl/last_version"; the tool is named "stl" and can be invoked with 3 arguments. Type "make" to launch a test.

The first argument to "stl" is a the prefix of a set of 24-bits bmp image (for example, "maps/map" stands for "maps/map_*.bmp" where * varies in a set of integers). The second argument is the name of a dot file containing the description of a kripke frame (the "time" graph). See
"stl/last_version" for an example. The third
(optional) argument is the name of a file to store formulas defined in run-time (the default name is "formula.fr").

This documentation will be updated as soon as a more stable version of
the tool and the input language of the model checker will be
available. 

For more information, please write to 

Vincenzo Ciancia - vincenzoml at gmail dot com

Gianluca Grilletti - grilletti.gianluca at gmail dot com

