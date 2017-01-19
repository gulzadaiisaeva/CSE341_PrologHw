% HomeWork2 Part 2 
% 131044085 
% GULZADA IISAEVA

% To teacher : You can also check the route like this in part1 -> path(gaziantep,konya,[gaziantep],Rota).
%it finds the route as a list

% The possible flights between some of the cities in Turkey.

flight(edirne,edremit).
flight(edremit,edirne).
flight(erzincan,edremit).
flight(edremit,erzincan).
flight(istanbul,ankara).
flight(ankara,istanbul).
flight(istanbul,trabzon).
flight(trabzon,istanbul).
flight(istanbul,gaziantep).
flight(gaziantep,istanbul).
flight(istanbul,konya).
flight(konya,istanbul).
flight(istanbul,antalya).  % the fact that Istanbul and Antalya has a flight.
flight(antalya,istanbul).
flight(istanbul,izmir).
flight(izmir,istanbul).
flight(ankara,trabzon).
flight(trabzon,ankara).
flight(ankara,izmir).
flight(izmir,ankara).
flight(istanbul,kars).
flight(kars,istanbul).
flight(ankara,kars).
flight(kars,ankara).
flight(ankara,konya).
flight(konya,ankara).

% The possible flights between some of the cities in Turkey with their distances.
 

distance(istanbul,ankara,350).
distance(ankara,istanbul,350).
distance(istanbul,trabzon,902).
distance(trabzon,istanbul,902).
distance(istanbul,kars,1179).
distance(kars,istanbul,1179).
distance(istanbul,gaziantep,848).
distance(gaziantep,istanbul,848).
distance(istanbul,konya,461).
distance(konya,istanbul,461).
distance(istanbul,antalya,482).
distance(antalya,istanbul,482).
distance(istanbul,izmir,328).
distance(izmir,istanbul,328).
distance(ankara,trabzon,578).
distance(trabzon,ankara,578).
distance(ankara,kars,872).
distance(kars,ankara,872).
distance(ankara,konya,231).
distance(konya,ankara,231).
distance(ankara,izmir,521).
distance(izmir,ankara,521).
distance(edirne,edremit,168).
distance(edremit,edirne,168).
distance(edremit,erzincan,1044).
distance(erzincan,edremit,1044).

  
% First I find the route and check if there is a route between any
%given two cities.
% If inlcude is  path(gaziantep,konya,[gaziantep],Rota)
%it will print like this
% Rota = [gaziantep, istanbul, ankara, konya] ;
% Rota = [gaziantep, istanbul, trabzon, ankara, konya] ;
% Rota = [gaziantep, istanbul, konya] ;
% Rota = [gaziantep, istanbul, izmir, ankara, konya] ;
% Rota = [gaziantep, istanbul, kars, ankara, konya] ;

path(Node, Node, _, [Node]).                      
path(Start, Finish, Visited, [Start | Path]) :-  flight(Start, Y),  
     											 not(member(Y, Visited)),
     											 path(Y, Finish, [Y | Visited], Path).



% a predicate indicating there exist a route between
% X and Y if there is flight between X and Y.
%it lists all the connected cities for a given city.

route(X,Y) :- flight(X,Z), flight(Z,Y).   
route(X,Y) :- flight(X,Y).
	

% gives the shortest route between two cities

sroute(X,Y,D) :- distance(X,Y,D).	
sroute(X,Y,L) :-
        distance(X, Z, L),
        distance(Z, Y, L1),
        L < L1.

	