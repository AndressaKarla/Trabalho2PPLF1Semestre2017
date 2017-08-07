%% ------------------- VERSÃO GERAR E TESTAR COM PERMUTAÇÕES -------------------

% rainhas_p(Q, N) is nondet
% Verdadeiro se Q é uma solução de tamanho N com N rainhas.
% Este predicado constrói as possíves soluções do N-rainhas.
rainhas_p(Q, N) :-
	sequencia(1, N, R),
	permutacao(R, Q),
	solucao(Q).

% sequencia(+I, +F, ?S) is semidet
% Verdadeiro se S é uma lista com os números inteiros entre I e F (inclusive)
sequencia(I, F, S) :-
	aux_sequencia(I, F, S).

aux_sequencia(I,I,[I]):-!.

aux_sequencia(I,F,[I|LS]):-
	I < F,
	I1 is I + 1,
	aux_sequencia(I1,F,LS).

% membro(?X, ?L, ?L1) is nondet
% Verdadeiro se ao inserir um elemento X em algum lugar de uma lista L
% resulta em uma nova lista L1, com o elemento X inserido na posição
% desejada

insercao(X, L, L1):-
	remocao(X, L1, L).

% membro(?X, ?L) is nondet
% Verdadeiro se X é membro de L
membro(X, L) :-
	remocao(X, L, _).

% remocao(?X, ?L, ?L1) is nondet
% Verdadeiro se a lista L1 é a lista L com o elemento X removido
remocao(X, [X | XS], XS).
remocao(X, [Y | XS], [Y | YS]):-
remocao(X, XS, YS).

% permutacao(?L, ?P) is nondet
% Verdadeiro se P é uma permutação da lista L
permutacao(L, P):-
	aux_permutacao(L,P).

aux_permutacao([], []).

aux_permutacao([L | LS], P):-
	permutacao(LS, L1),
	insercao(L, L1, P).

%% solucao(+Q) is semidet
% Verdadeiro se Q é uma solução N-rainhas
% Este predicado apenas verifica se Q é uma solução, e não a constrói.
% Exemplo:
%  ?- solucao([3, 1, 4, 2]).
%   true.
solucao(Q):-
	aux_solucao(Q).

aux_solucao([]).

aux_solucao([Q|QS]) :-
	aux_solucao(QS),
	rainha_nao_ataca(Q, QS,1).

% rainha_nao_ataca(+X, +Y, +INDICE) is det
% Verdadeiro se há diferença entre os elementos da lista Y e o valor X e
% o índice
% Caso haja essa diferença, significa que não há ataque
% entre as rainhas
% na diagonal
% Exemplo.
% ?- rainha_nao_ataca(4, [3, 1, 4, 2], 3).
% true.
rainha_nao_ataca(_,[],_).

rainha_nao_ataca(X,[Y|YS], INDICE) :-
	Y-X =\= INDICE,
	X-Y =\= INDICE,
	INDICE1 is INDICE + 1,
	rainha_nao_ataca(X, YS, INDICE1).
