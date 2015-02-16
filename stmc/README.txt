Contents:
=========

parser.mly: Parser for the interpreter and for logic formulas (Q: can these be split?) 
lexer.mll: For "parser.mly"
parserGraph.mly: parser for DOT files
lexerGraph.mll: For "parserGraph.mly"

Interface.ml: functions and data types related to the interface (e.g. interactive graphics, ADT for the commands)
Test.ml: loads an example (to be replaced by a generic loader)
main.ml: interpreter

Graph.ml: Graphs as quasi-discrete closure spaces
Model.ml: Models of the logic
StlConvert.ml: Conversion of module types
StlLogic.ml: Implementation of the logic, abstract syntax, and model checker


TODO:
=====

Optimize the model checker avoiding reloading of files

Use OCamlGraph (and parse dot files using their parser)

Establish a file format describing examples and formulas

Split commands from formulas (See Interface.ml, where the ADT for commands is defined, as it is part of the interface)

All comments in English

