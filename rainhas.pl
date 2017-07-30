﻿%% ------------------- VERSÃO GERAR E TESTAR COM PERMUTAÇÕES -------------------

% rainhas_p(Q, N) is nondet
% Verdadeiro se Q é uma solução de tamanho N com N rainhas.
% Este predicado constrói as possíves soluções do N-rainhas.
%rainhas_p(Q, N) :-
%	sequencia(1, N, R),
%	permutacao(R, Q),
%	solucao(Q).


% sequencia(+I, +F, ?S) is semidet
% Verdadeiro se S é uma lista com os números inteiros entre I e F (inclusive)
sequencia(I, F, S) :-
	auxiliar1(I, F, S).

auxiliar1(N, L, S) :-
    auxiliar2(N, [], L, S).

auxiliar2(0, L, L, S) :- !.

auxuliar2(N, R, L, S) :-
	N > 0,
	N1 is N-1,
	auxiliar2(N1, [N|R], L, S).

%% certo
%    teste(N, L, S) :-
%    teste2(N, [], L, S).

%teste2(0, L, L, S) :- !.

%teste2(N, R, L, S) :-
%	N > 0,
%	N1 is N-1,
%	deus(N1, [N|R], L, S).



%% =====	BASE -
%https://stackoverflow.com/questions/10202666/prolog-create-a-list
%https://stackoverflow.com/questions/16431465/prolog-fill-list-with-n-elements
%https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_7.html
%
%?- do_list(4, L). -> L = [1, 2, 3, 4].
%do_list(N, L) :-
%	do_list1(N, [], L).

%do_list1(0, L, L) :- !.
%do_list1(N, R, L) :-
%	N > 0,
%	N1 is N-1,
%	do_list1(N1, [N|R], L).
%% =====	BASE


% permutacao(?L, ?P) is nondet
% Verdadeiro se P é uma permutação da lista L
permutacao(L, P) :-
	% ... continuar
	permutation(L, P)
	.

%% -------------------------- VERSÃO COM BACKTRACKING --------------------------

% rainhas_n(?Q, +N) is nondet
% predicado "interface" para o rainhas/3
%rainhas_n(Q, N) :-
%	rainhas_n(Q, N, N).

% rainhas_n(?Q, +N, +T) is nondet
% Verdadeiro se Q é uma solução de tamanho T com N rainhas.
% Este é um predicado auxiliar e não deve ser chamado diretamente.
% Sua prova deve ser realizada com N = T.
% Exemplo:
%  ?- rainhas_n(Q, 5, 5).
%  Q = [4, 2, 5, 3, 1] ;
%  Q = [3, 5, 2, 4, 1] ;
%  Q = [5, 3, 1, 4, 2] ;
%  ...
%rainhas_n([R|Rs], N, T) :-
%	T > 0, !,
%	T0 is T-1,
%	rainhas_n(Rs, N, T0),
%	entre(1, N, R),
%	solucao([R|Rs]).

%rainhas_n([], _, 0).

%% entre(+I, +F, ?V) is nondet
% Verdadeiro se V é um número natural entre I e F (inclusive).
% Exemplo:
%  ?- entre(1, 3, V).
%  V = 1;
%  V = 2;
%  V = 3;
%  false.
%entre(I, F, V) :-
	% ... continuar
%	.

%% solucao(+Q) is semidet
% Verdadeiro se Q é uma solução N-rainhas
% Este predicado apenas verifica se Q é uma solução, e não a constrói.
% Exemplo:
%  ?- solucao([4, 5, 3, 2, 1]).
%   true.
%solucao(Q) :-
	% ... continuar
%	.
