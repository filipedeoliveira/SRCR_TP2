% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%####################################################################
% SICStus PROLOG: definicoes iniciais
:- dynamic utente/4.
:- dynamic servico/4.
:- dynamic consulta/4.
:- op( 900,xfy,'::' ).
