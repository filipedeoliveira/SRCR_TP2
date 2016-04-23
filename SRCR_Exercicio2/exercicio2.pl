% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).


%####################################################################
% SICStus PROLOG: definicoes iniciais
:- dynamic utente/4.
:- dynamic servico/4.
:- dynamic consulta/4.
:- dynamic data/3.
:- op( 900,xfy,'::' ).

%#####################################################################
% Extensao do predicado Utente: IdUt, Nome, Idade, Morada  -> {V,F,D}

utente(1,Joao,31,Vieira).
utente(2,Ana,22,Aveiro).
utente(3,Sofia,25,Cabeceiras).
utente(4,Carlos,18,Avintes).
utente(5,Bruno,34,Braga).
utente(6,Vitor,27,Porto).
utente(7,Sandra,30,Faro).

%#####################################################################
% Extensao do predicado Servico: Serv, Descricao, Instituicao, Cidade  -> {V,F,D}

servico(1001,psiquiatria,hospitalBraga,Braga).
servico(1002,neurologia,hospitalPorto,Porto).
servico(1003,cardiologia,hospitalAgra,Braga).
servico(1001,psiquiatria,hospitalPorto,Porto).
servico(1004,oncologia,hospitalBraga,Braga).
servico(1003,cardiologia,hospitalPorto,Porto).
servico(1005,fisioterapia,hospitalFaro,Faro).
servico(1003,cardiologia,hospitalFaro,Faro).
servico(1001,psiquiatria,hospitalAgra,Agra).

%#####################################################################
%extensao do predicado consulta: Data, IdUt, Serv, Custo ->{ V, F, D }
consulta(data(10,08,2014),1,1001,40).
consulta(data(08,03,2013),2,1002,30).
consulta(data(27,02,2016),3,1005,35).
consulta(data(17,11,2013),4,1004,50).
consulta(data(30,12,2015),5,1005,35).
consulta(data(14,06,2013),6,1002,30).
consulta(data(07,09,2015),7,1003,60).
consulta(data(5,08,2014),3,1001,40).

%####################################################################
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao, falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).


%####################################################################
% Extensao do meta-predicado nao: Questao -> {V,F}
nao( Questao ) :- Questao, !, fail.
nao( Questao ).


% ##########Excepcoes:###############################################

excepcao(utente(IdUt, Nome, Idade, Morada)):- Idade==desc.
excepcao(utente(IdUt, Nome, Idade, Morada)):- Morada==desc.
excepcao(servico(Serv, Descricao, Instituicao, Cidade)):- Cidade==desc.
excepcao(consulta(Data, IdUt, Serv, Custo)):- Custo==desc.

