/*Frederic Marchand*/
/*100817579*/
/*Question 4*/

/*a)done*/
append([], L, L).
append([X | L1], L2, [X | L3]) :- append(L1, L2, L3).

/*b)done*/
last_with_append(X, L) :- append(_, [X], L).

/*c)done*/
nextto_with_append(X, Y, L) :- append(_, [X, Y | _], L) ; append(_, [Y, X | _], L).

/*d)done*/
reverse([], []).
reverse([Head | Tail], R) :- reverse(Tail, F), append(F, [Head], R).