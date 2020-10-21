:-consult('ficha1_BC_paises').

% Questão 1
% Este país faz fronteira com este país ?

% fronteira(franca,espanha);fronteira(espanha,franca).

% Qual a população de determinado país?

% pais(mexico,america,Y).
% pais(mexico,_,Y).

% Listar os países de um determinado continente e sua população.

% pais(X,america,Y).
% -> ;

% Listar os países com a população menor que 10 de um determinado continente.
% (pais(X,america,Y)),Y<10.
% -> ;

% Questao 3

vizinho(P1,P2):-fronteira(P1, P2);fronteira(P2, P1).

% not pode ser \+
contSemPaises(X):-continente(X),not(pais(_,X,_)).

semVizinhosS(L):-pais(L,_,_),not(fronteira(L,_);fronteira(_,L)).

semVizinhos(L) :-pais(L, _, _), not(vizinho(L,_)).

chegoLaFacil(P1,P2):-vizinho(P1,P2);(vizinho(P1,X),vizinho(X,P2)),P1\==P2.


% Questao 4

potencia(_,0,1) :-!.
potencia(B,P,R) :- P>0,!, P1 is P-1, potencia(B,P1,R1), R is R1*B.
potencia(B,P,R) :- P<0, P1 is P+1, potencia(B,P1,R1), R is R1/B.

fatorial(0,1):-!.
fatorial(X,Y):-X1 is X-1, fatorial(X1,Y1), Y is X*Y1 .

somatorio(X,X,X) :- !.
somatorio(J,K,R) :- K>J, !, K1 is K-1, somatorio(J,K1,R1), R is K+R1.
somatorio(J,K,R) :- K<J, J1 is J-1, somatorio(J1,K,R1), R is J+R1.

divisao(D,P,R0,R1):- R0 is D//P, R1 is D mod P.
