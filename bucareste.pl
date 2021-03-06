﻿:- use_module(library(plunit)).

vizinhos(arad, [d(sibiu,140), d(timisoara,118), d(zerind,75)]).
vizinhos(bucharest, [d(fagaras,211), d(giurgiu,90), d(pitesti,101), d(urziceni,85)]).
vizinhos(craiova, [d(dobreta,120), d(pitesti,138), d(rimnicu_vilcea,146)]).
vizinhos(dobreta, [d(mehadia,75), d(craiova,120)]).
vizinhos(eforie, [d(hirsova,86)]).
vizinhos(fagaras, [d(bucharest,211), d(sibiu,99)]).
vizinhos(giurgiu, [d(bucharest,90)]).
vizinhos(hirsova, [d(eforie,86), d(urziceni, 98)]).
vizinhos(iasi, [d(neamt, 87), d(vaslui, 92)]).
vizinhos(lugoj, [d(mehadia, 70), d(timisoara, 111)]).
vizinhos(mehadia, [d(dobreta, 75), d(lugoj, 70)]).
vizinhos(neamt, [d(iasi, 87)]).
vizinhos(oradea, [d(sibiu, 151), d(zerind, 71)]).
vizinhos(pitesti, [d(rimnicu_vilcea, 97), d(craiova, 138), d(bucharest, 101)]).
vizinhos(rimnicu_vilcea, [d(sibiu, 80), d(pitesti, 97), d(craiova, 146)]).
vizinhos(sibiu, [d(oradea, 151), d(arad, 140), d(fagaras, 99), d(rimnicu_vilcea, 80)]).
vizinhos(timisoara, [d(arad, 118), d(lugoj, 111)]).
vizinhos(urziceni, [d(bucharest, 85), d(hirsova, 98), d(vaslui, 142)]).
vizinhos(vaslui, [d(iasi, 92), d(urziceni, 142)]).
vizinhos(zerind, [d(oradea, 71), d(arad, 75)]).


heuristica(arad, 366).
heuristica(bucharest, 0).
heuristica(craiova, 160).
heuristica(dobreta, 238).
heuristica(eforie, 161).
heuristica(fagaras, 178).
heuristica(giurgiu, 77).
heuristica(hirsova, 151).
heuristica(iasi, 226).
heuristica(lugoj, 244).
heuristica(mehadia, 241).
heuristica(neamt, 234).
heuristica(oradea, 380).
heuristica(pitesti, 98).
heuristica(rimnicu_vilcea, 193).
heuristica(sibiu, 253).
heuristica(timisoara, 329).
heuristica(urziceni, 80).
heuristica(vaslui, 199).
heuristica(zerind, 374).

%% melhor_caminho(?O, ?C) is nondet
% Verdadeiro se C é o melhor caminho entre O e bucharest
% Exemplo:
%  ?- melhor_caminho(sibiu, C).
%  C = [sibiu, rimnicu_vilcea, pitesti, bucharest].
:- begin_tests(melhor_caminho).

test(t1, C == [sibiu, rimnicu_vilcea, pitesti, bucharest]):- melhor_caminho(sibiu, C).

:- end_tests(melhor_caminho).

melhor_caminho(bucharest, [bucharest]) :- !.
melhor_caminho(O, [O|Cs]) :-
	melhor_vizinho(O, V), !,
	melhor_caminho(V, Cs).

%% melhor_vizinho(?O, ?V) is nondet
% Verdadeiro se V é o melhor vizinho de O
% Exemplo:
%  ?- melhor_vizinho(sibiu, V).
%  V = rimnicu_vilcea.

:- begin_tests(melhor_vizinho).

test(t2, [nondet], V == rimnicu_vilcea):- melhor_vizinho(sibiu, V).

:- end_tests(melhor_vizinho).

melhor_vizinho(O, V) :-
	vizinhos(O,VS),
	menor(VS,M),
	D = d(V,M),
	membro(D,VS).

%% menor(X, M) is semidet
% Verdadeiro se M é o menor valor da
% lista X de distancias d(cidade,distancia) somado com a heurística da cidade
% Exemplo:
% ?- menor([d(sibiu, 151), d(zerind, 71)], M).
% M = 151.

menor([X|XS], M) :-
    menor(X, XS, M).

menor(X, [], M):-
	d(_, M) = X.

menor(X, [Y|YS], M) :-
    d(V,M0) = X,
    d(V1,M1) = Y,
    heuristica(V,D1),
    heuristica(V1,D2),
    H is M0 + D1,
    MH is M1 + D2,
    Min is min(H, MH),
    Aux is Min - M0,
   (Aux =:= D1 ->
       menor(X, YS, M);
       menor(Y, YS, M)
   ).

%% min(?X, ?Y) is semidet
% Verdadeiro se Y é o menor valor da lista X
% Exemplo:
% ?- min([1, 2, 3], 1).
% true.
min([X], X).

min([X, Y | R], Y) :-
    X < Y, !,
    min([X | R], Y).

min([_, Y | R], Y) :-
   min([Y | R], Y).


% membro(?X, ?XS) is nondet
%
% Verdadeiro se X é um elemento de XS
% Exemplo:
% ?- Membro(3, [1,2,3].
%  true.

membro(X, [X | _]).

membro(X, [_ | XS]) :-
    membro(X, XS).




