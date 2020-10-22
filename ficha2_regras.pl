% Questão 1
% a) Média
media([],0):-!.
media(L,M):-contasoma(L,S,C),
M is S/C.

contasoma([],0,0):-!.
contasoma(L,S,C):- L=[X|H], contasoma(H,S1,C1), S is S1+X,C is C1+1.

% Questão 1
% b) Menor elemento de uma lista
menor([X],X):-!.
% comparar o primeiro elemento com a variavel X
% se H for menor que X, X is H.
% se H for maior que X, H is X1.
menor(L,X):- L=[H|T],
menor(T,X1), ((H<X1), X is H, ! ; X is X1).

% Questão 1
% c)
numeros(L,P,I):-numPares(L,P), numerosImpares(L,I).

numPares([],0):-!.
numPares([X|L],P):-numPares(L,P1), 0 is X mod 2, P is P1+1, !.
numPares([_|L],P):- numPares(L,P).

numerosImpares([],0):-!.
numerosImpares([X|L],I):- numerosImpares(L,I1), 1 is X mod 2, I is I1+1,!.
numerosImpares([_|L],I):- numerosImpares(L,I).

% d) Verificar se uma lista tem elementos repetidos

% check if a value is in a list
in([],_):-!,false.
in([A|T],X):-
    X is A, !;
    in(T,X),!.

repetidos([],_):-!,false.
repetidos([A|T]):-
     in(T,A);
     repetidos(T),!.

% e) Colocar o menor elemento da lista à frente da lista

prepend_e(L,E,R):-
        R = [E|L].
     append_e([],E,R):-
         R = [E].
     append_e([H|T],E,R):-
         append_e(T,E,S),
         prepend_e(S,H,R).

swap_e([],[]):-!.
swap_e(L,R):-menor(L,X),!,
         L = [H|T],
         ((X is H,
           R = L);
          (append_e(T,H,S),
           swap_e(S,Q),
           R = Q)),!.

% f) Fazer a concatenação de duas listas
% L [0,1,2,3]
% X [2,3,4]
concatena([],X, X):-!.
concatena([A|B],C,[A|D]):-concatena(B,C,D).

% g)
% opção para colocar uma lista em outra lista

linear([],[]).
linear([H|T],[H|L]):-linear(T,L).

% juntar várias listas
flatten2([],[]).
flatten2([[H|T]|L], LF):-!, append([H|T],L,L1), flatten2(L1,LF).
flatten2([X|L],[X|LF]):- flatten2(L,LF).

% h)
elimina([],[],_).
elimina([X|L],X,L):-!.
elimina([H|T],X,[H|L]):-elimina(T,X,L).

% i)
apaga([]):-!.
apaga([_|T]):-apaga(T).

% j)
substituiTodos(_,_,[],[]).
substituiTodos(X,N,[X|T],[N|R]) :- substituiTodos(X,N,T,R), !.
substituiTodos(X,N,[H|T],[H|R]) :- substituiTodos(X,N,T,R).

% k)Inserir um elemento em uma determinada posicao

inserirPos(X,0,L,[X|L]):-!.
inserirPos(X,P,[H|T],[H|R]):- P1 is P-1, inserirPos(X,P1,T,R).

% l)

inverte1(L,L1):-inverte2(L,[],L1).
inverte2([],L,L).
inverte2([X|L],L2,L3):-inverte2(L,[X|L2],L3).

% m) união de dois conjuntos representados por listas
% insere na LF caso não seja membro da L2, pois a união não
% elementos repetidos.

une([],L,L).
une([H|L1],L2,LF):-member(H,L2),!,une(L1,L2,LF).
une([H|L1],L2,[H|LF]):-une(L1,L2,LF).

% n) intersecçao de dois conjuntos

inters([],_,[]):-!.
inters([H|T],L2,[H|LF]):-member(H,L2),!, inters(T,L2,LF).
inters([_|T],L2,LF):-inters(T,L2,LF).

% o) // TODO

diferenca1([],_,[]).
diferenca1([X|L1],L2,LD):-member(X,L2),!,diferenca1(L1,L2,LD).
diferenca1([X|L1],L2,[X|LD]):-diferenca1(L1,L2,LD).
