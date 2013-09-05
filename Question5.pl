/*Frederic Marchand*/
/*100817579*/
/*Question 5*/

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

/*a)*/
travel(X, Y) :- helper(X, Y).
travel(X, Y) :- helper(X, Z), travel(Z, Y).

helper(X, Y) :- byCar(X, Y).
helper(X, Y) :- byTrain(X, Y).
helper(X, Y) :- byPlane(X, Y).

/*b)*/
travel(X, Y, go(X, Y, Vehicle)) :- helper(X, Y, Vehicle).
travel(X, Y, go(X, Z, Vehicle, Route)) :- helper(X, Z, Vehicle), travel(Z, Y, Route).

helper(X, Y, byCar) :- byCar(X, Y).
helper(X, Y, byTrain) :- byTrain(X, Y).
helper(X, Y, byPlane) :- byPlane(X, Y).