vizinhos(arad, [d(sibiu,140), d(timisoara,118), d(zerind,75)]).
vizinhos(bucharest, [d(fagaras,211), d(giurgiu,90), d(pitesti,101), d(urziceni,85)]).
vizinhos(craiova, [d(dobreta,120), d(pitesti,138), d(rimnicu_vilcea,146)]).
% ... continuar

heuristica(arad, 366).
heuristica(bucharest, 0).
heuristica(craiova, 160).
% ... continuar

%% melhor_caminho(?O, ?C) is nondet
% Verdadeiro se C é o melhor caminho entre O e bucharest
% Exemplo:
%  ?- melhor_caminho(sibiu, C).
%  C = [sibiu, rimnicu_vilcea, pitesti, bucharest].
melhor_caminho(bucharest, [bucharest]) :- !.
melhor_caminho(O, [O|Cs]) :-
	melhor_vizinho(O, V), !,
	melhor_caminho(V, Cs).

%% melhor_vizinho(?O, ?V) is nondet
% Verdadeiro se V é o melhor vizinho de O
% Exemplo:
%  ?- melhor_vizinho(sibiu, V).
%  V = rimnicu_vilcea.
melhor_vizinho(O, V) :-
	% ... continuar
	.
