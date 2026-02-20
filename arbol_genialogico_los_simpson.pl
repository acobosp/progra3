% --- RELACIONES FAMILIARES ---
padre(abraham, homero).
padre(abraham, herbert).
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, lisa).
padre(homero, magie).

madre(mona, homero).
madre(mona, herbert).
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(marge, bart).
madre(marge, lisa).
madre(marge, magie).
madre(selma, ling).

% Reglas de Parentesco
abuelo(X, Y) :- padre(X, Z), (padre(Z, Y) ; madre(Z, Y)).
abuela(R, S) :- madre(R, A), (madre(A, S) ; padre(A, S)).

nieto(Y, X) :- abuelo(X, Y).
nieta(S, R) :- abuela(R, S).

% Se añade \== para que no sea hermano de sí mismo
hermano(Q, W) :- padre(T, Q), padre(T, W), Q \== W.
hermana(Q, W) :- madre(M, Q), madre(M, W), Q \== W.

tio(T, N) :- hermano(T, P), (padre(P, N) ; madre(P, N)).
tia(T, N) :- hermana(T, P), (padre(P, N) ; madre(P, N)).

sobrino(N, T) :- (tio(T, N) ; tia(T, N)).

% --- EJERCICIO DEL CORONEL WEST ---

americano(west).
arma(misil).
enemigo(corea, eeuu).

hostil(X) :- enemigo(X, eeuu).

tiene(corea, misil).
vende(west, misil, corea).

criminal(X) :-
    americano(X),
    vende(X, Y, Z),
    arma(Y),
    hostil(Z).
