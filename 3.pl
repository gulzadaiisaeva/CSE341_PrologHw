% HomeWork2 Part 3 
% 131044085 
% GULZADA IISAEVA


% a database about classes, classrooms and student enrollment.
classes(102,10,z23).
classes(108,12,z11).
classes(341,14,z06).
classes(455,16,207).
classes(452,17,207).

enrollment(a,102).
enrollment(a,108).
enrollment(b,102).
enrollment(c,108).
enrollment(d,341).
enrollment(e,455).


% a predicates “when(X,Y) – time of the course X is Y”, “where(X,Y) – place of the course X is Y”,
% and “enroll(X,Y) – student X is enrolled in course Y”
when(X,Y):- write("The result is =\n") , classes(X,Y,_).

where(X,Y):-write("The result is =\n") ,classes(X,_,Y).

enroll(X,Y):-write("The result is =\n") ,enrollment(X,Y).

%a predicate “schedule(S,P,T)” associates a student to a place and time of class.
schedule(S,P,T):- enroll(S,D),
				  classes(D,T,P).

 % a predicate “usage(P,T)” that gives the usage times of a classroom.
usage(P,T):- classes(_,T,P).

% a predicate “conflict(X,Y)” that gives true if X and Y conflicts due to classroom or time.
conflict(X,Y):- (classes(X,T,_),
				classes(Y,T,_));
				(classes(X,_,P),
				classes(Y,_,P)).

%predicate “meet(X,Y)” that gives true if student X and student Y are present %in the same classroom at the same time.
meet(X,Y):-  enroll(X,C),            
			classes(C,T,P),
			enroll(Y,C),
			classes(C,T,P).				

