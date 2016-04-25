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
utente(2,Ana,desc,Aveiro).
utente(3,Sofia,25,Cabeceiras).
utente(4,Carlos,18,Avintes).
utente(5,Bruno,desc,Braga).
utente(6,Vitor,27,Porto).
utente(7,Sandra,30,desc).


-utente(IdUt,Nome,Idade,Morada):-nao(utente(IdUt,Nome,Idade,Morada)), nao(excepcao(utente(IdUt,Nome,Idade,Morada))).

%#####################################################################
% Extensao do predicado Servico: Servico, Descricao, Instituicao, Cidade  -> {V,F,D}


servico(1001,psiquiatria,hospitalBraga,desc).
servico(1002,neurologia,hospitalPorto,Porto).
servico(1003,cardiologia,hospitalAgra,Braga).
servico(1001,psiquiatria,hospitalPorto,Porto).
servico(1004,oncologia,hospitalBraga,desc).
servico(1003,cardiologia,hospitalPorto,desc).
servico(1005,fisioterapia,hospitalFaro,Faro).
servico(1003,cardiologia,hospitalFaro,Braga).
servico(1001,psiquiatria,hospitalAgra,Agra).

-servico(Servico,Descricao,Instituicao,Cidade):- nao(servico(Servico,Descricao,Instituicao,Cidade)),
						nao(excepcao(servico(Servico,Descricao,Instituicao,Cidade))).

%#####################################################################
%extensao do predicado consulta: Data, Id, Serv, Custo ->{ V, F, D }
consulta(data(10,08,2014),1,1001,40).
consulta(data(08,03,2013),2,1002,desc).
consulta(data(27,02,2016),3,1005,35).
consulta(data(17,11,2013),4,1004,50).
consulta(data(30,12,2015),5,1005,35).
consulta(data(14,06,2013),6,1002,30).
consulta(data(07,09,2015),7,1003,desc).
consulta(data(5,08,2014),3,1001,40).


-consulta(Data,Id,Serv,Custo):-
						nao(consulta(Data,Id,Serv,Custo)),
						nao(excepcao(consulta(Data,Id,Serv,Custo))).

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

solucoes( X,Y,Z ) :- findall( X,Y,Z ).

comprimento( S,N ) :- length( S,N ).
	
% ##########Excepcoes:###############################################

excepcao(utente(IdUt, Nome, Idade, Morada)):- Idade==desc.
excepcao(utente(IdUt, Nome, Idade, Morada)):- Morada==desc.

% Nao se sabe se a Ana tem 25 ou 33 anos
excepcao(utente(2,Ana,25,Aveiro)).
excepcao(utente(2,Ana,33,Aveiro)).
% Nao se sabe se o Bruno tem 16 ou 26 anos
excepcao(utente(5,Bruno,16,Braga)).
excepcao(utente(5,Bruno,26,Braga)).
% Nao se sabe a Morada da Sandra podendo ser Faro ou Beja
excepcao(utente(7,Sandra,30,Faro)).
excepcao(utente(7,Sandra,30,Beja)).

excepcao(servico(Servico, Descricao, Instituicao, Cidade)):- Cidade==desc.
excepcao(servico(1001,psiquiatria,hospitalBraga,Gaia)).
excepcao(servico(1001,psiquiatria,hospitalBraga,Funchal)).
excepcao(servico(1004,oncologia,hospitalBraga,Lisboa)).
excepcao(servico(1004,oncologia,hospitalBraga,Aveiro)).
excepcao(servico(1003,cardiologia,hospitalPorto,Agra)).
excepcao(servico(1003,cardiologia,hospitalPorto,Coimbra)).

excepcao(consulta(Data, Id, Serv, Custo)):- Custo==desc.
excepcao(consulta(data(08,03,2013),2,1002,35)).
excepcao(consulta(data(08,03,2013),2,1002,45)).
excepcao(consulta(data(07,09,2015),7,1003,60)).
excepcao(consulta(data(07,09,2015),7,1003,55)).

%#######################Mecanismos de raciocinio#####################

%"Getters"
idUt(utente(IdUt, Nome, Idade, Morada),IdUt).
nome(utente(IdUt, Nome, Idade, Morada),Nome).
idade(utente(IdUt, Nome, Idade, Morada),Idade).
morada(utente(IdUt, Nome, Idade, Morada),Morada).

servico(servico(Servico, Descricao, Instituicao, Cidade),Servico).
descricao(servico(Servico, Descricao, Instituicao, Cidade),Descricao).
instituicao(servico(Servico, Descricao, Instituicao, Cidade),Instituicao).
cidade(servico(Servico, Descricao, Instituicao, Cidade),Cidade).

data(consulta(Data, Id, Serv, Custo),Data).
id(consulta(Data, Id, Serv, Custo),Id).
serc(consulta(Data, Id, Serv, Custo),Serv).
custo(consulta(Data, Id, Serv, Custo),Custo).

%Outros Mecanismos

%lista dos servicos que um hospital disponibiliza
listaServicos(Instituicao, Lista):- findall(Descricao,servico(_,Descricao,Instituicao,_),Lista).
%(..se for preciso faz-se mais alguns q sejam interessantes...)


%############################################################################################
%########################### VER BEM ########################################################
%############################################################################################
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo([],[]).
demo([Questao|Questoes],[verdadeiro|S]) :-
    Questao,
    demo(Questoes,S).

demo([Questao|Questoes],[falso|S]) :-
    -Questao,
    demo(Questoes,S).

demo([Questao|Questoes],[desconhecido|S]) :-
    nao( Questao ),
    nao( -Questao ),
    demo(Questoes,S).


demonstr(Questao,verdadeiro):-
Questao.

demonstr(Questao,falso):-
-Questao.

demonstr(Questao,desconhecido):-
nao(Questao),
nao(-Questao).

%############################################################################################
%############################################################################################









