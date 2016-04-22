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

%#####################################################################
% Extensao do predicado Utente: IdUt, Nome, Idade, Morada  -> {V,F,D}

utente(1,"Joao",31,Vieira).
utente(2,"Ana",22,Aveiro).
utente(3,"Sofia",25,Cabeceiras).
utente(4,"Carlos",18,Avintes).

%#####################################################################
% Extensao do predicado Servico: Serv, Descricao, Instituicao, Cidade  -> {V,F,D}

servico(1,"psiquiatria","blabla","hospitalBraga","Braga").
servico(2,"neurologia","blabla","hospitalBraga","Braga").
servico(1,"psiquiatria","blabla","hospitalBraga","Braga").
servico(1,"psiquiatria","blabla","hospitalBraga","Braga").
