/*Frederic Marchand*/
/*100817579*/
/*Question 3*/

/*a)done*/
list_last(X, [X]).
list_last(X, [_|Tail]) :- list_last(X, Tail).

/*b) done*/
after(X, [Head | Tail], R) :- Head = X, R = Tail.
after(X, [_ | Tail], R) :- after(X, Tail, R).

/*c)done*/
nextto_redefined(X, Y, [X, Y | _]).
nextto_redefined(Y, X, [X, Y | _]).
nextto_redefined(X, Y, [_ | Tail]) :- nextto_redefined(X, Y, Tail).

/*d)done*/
occurs_at_position(X, L, P) :- occurs_at_position(X, L, 0, P).

occurs_at_position(X, [X|_], A, P) :- P is A + 1.
occurs_at_position(X, [_|Tail], A, P) :- A2 is A + 1,
     					 				 occurs_at_position(X, Tail, A2, P).
