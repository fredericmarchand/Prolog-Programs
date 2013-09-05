/*Frederic Marchand*/
/*100817579*/
/*Question 1*/

/*Defining dictionary*/
male(fred).
male(julien).
male(pierre).
male(nicolas).
male(antoine).
male(keven).
male(daniel).
male(patrick).
male(stephane).
male(gilles).
male(jack).

male(junior).
male(laval).

female(johanne).
female(sophie).
female(chantal).
female(linda).
female(sylvie).
female(therese).
female(gisele).

female(celine).
female(valerie).
female(tina).

/*half siblings*/
parent(tina, junior).
parent(laval, junior).
parent(laval, valerie).
parent(celine, valerie).



parent(pierre,fred). 
parent(johanne,fred). 
parent(johanne,julien). 
parent(pierre,julien). 
parent(antoine, pierre).
parent(gisele, pierre).
parent(therese, johanne).
parent(gilles, johanne).

parent(daniel, patrick).
parent(chantal, patrick).
parent(gilles, daniel).
parent(therese, daniel).

parent(jack, keven).
parent(linda, keven).
parent(gilles, linda).
parent(therese, linda).

parent(stephane, sophie).
parent(sylvie, sophie).
parent(stephane, nicolas).
parent(sylvie, nicolas).
parent(therese, stephane).
parent(gilles, stephane).


father(X, Y) :- male(X), parent(X, Y). /* X is the father of Y */
mother(X, Y) :- female(X), parent(X, Y). /* X is the mother of Y */

difference(X,Y) :- X \== Y. /* X and Y are different */

/* X is married to Y */
married(gilles, therese).
married(antoine, gisele).
married(pierre, johanne).
married(jack, linda).
married(daniel, chantal).

husband(X,Y) :- male(X), married(X,Y). /* X is husband of Y */
wife(X,Y) :- female(X), married(Y,X). /* X is wife of Y */

is_mother(X) :- mother(X, _). /* X is a mother */
is_father(X) :- father(X, _). /* X is a father */


/* X is an aunt of Y */
aunt(X, Y) :- female(X), sibling(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), wife(X, W), sibling(W, Z), parent(Z, Y).


/* X is an uncle of Y */
uncle(X, Y) :- male(X), sibling(X, Z), parent(Z, Y).
uncle(X, Y) :- male(X), husband(X, W), sibling(W, Z), parent(Z, Y).


/* X is a sister of Y */
sister_of(X,Y) :- female(X), father(F, X), father(F, Y),
					mother(M, X), mother(M,Y), difference(X, Y).

/* X is a brother of Y */
brother_of(X,Y) :- male(X), father(F, X), father(F, Y),
					mother(M, X), mother(M,Y), difference(X, Y).


grandfather_of(X,Y) :- father(X,Z), parent(Z,Y). /* X is a grandfather of Y */
grandmother_of(X,Y) :- mother(X,Z), parent(Z,Y). /* X is a grandmother of Y */

grandchild(X,Y) :- grandfather_of(Y,X); grandmother_of(Y,X). /* X is a grandchild of Y */

sibling(X,Y) :- father(P,X), father(P,Y), mother(M, X), mother(M,Y), difference(X, Y). /* X is a sibling of Y, i.e they have the same parents */

/*they have same mother but different fathers or same father, different mothers */
half_sibling(X,Y) :- father(P,X), father(P,Y), mother(T, X), mother(U,Y), difference(T,U).
half_sibling(X,Y) :- father(I,X), father(O,Y), mother(H, X), mother(H,Y), difference(I,O). 
						


related(X, Y) :- ancestor(Z, X) , ancestor(Z, Y), difference(X, Y). /*X and Y have a common ancestor*/

/* X is an ancestor of Y */
ancestor(X, Y) :- parent(X, Y). 
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

descendent(X, Y) :- ancestor(Y, X). /* X is a descendent of Y */

