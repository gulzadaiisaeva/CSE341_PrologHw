% HomeWork2 Part 4 
% 131044085 
% GULZADA IISAEVA

%4.1. Define a Prolog predicate “add(L,S)” that adds all the elements of L binding the results to S.
add([],0).
add([H|T],X) :- add(T,Y), 
		 		X is H + Y.

%4.2. Define a Prolog predicate “unique(L1,L2)” that removes duplicates in L1 binding the results to L2.
member1(X,[Head|_]) :- X==Head,!.
member1(X,[_|Tail]) :- member1(X,Tail).
unique([],[]).
unique([Head|Tail],C) :- member1(Head,Tail),!, unique(Tail,C).
unique([Head|Tail],[Head|C]) :- unique(Tail,C).

%4.3. Define a Prolog predicate “flatten(L1,L2)” that flattens the list of lists (your can assume that
%elements of L1 are not nested lists) in L1 binding results to L2.
flatten(List, FlatList) :-flatten(List, [], FlatList).
flatten(Var, T, [Var|T]) :-
	var(Var), !.
flatten([], T, T) :- !.
flatten([H|T], TailList, List) :- !,
	flatten(H, FlatTail, List),
	flatten(T, TailList, FlatTail).
flatten(NonList, T, [NonList|T]).