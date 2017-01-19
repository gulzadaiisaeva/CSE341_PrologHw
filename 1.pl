% HomeWork2 Part 1 
% 131044085 
% GULZADA IISAEVA


% To teacher : You can also check the route like this -> path(gaziantep,konya,[gaziantep],Rota).
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


% First I find the route and check if there is a route between any
%given two cities.
% If inlcude is  path(gaziantep,konya,[gaziantep],Rota)
%it will print lik this
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
	