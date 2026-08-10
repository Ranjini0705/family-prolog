edge(pam, bob).
edge(tom, bob).
edge(tom, liz).
edge(bob, ann).
edge(bob, pat).
edge(pat, jill).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

path(X, Y) :-
    travel(X, Y, [X]).

travel(X, Y, _) :-
    connected(X, Y).

travel(X, Y, Visited) :-
    connected(X, Z),
    \+ member(Z, Visited),
    travel(Z, Y, [Z|Visited]).
