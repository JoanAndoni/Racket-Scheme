/*
    Aritmetic functions 

    Alejandra Tubilla Castellanos
    A01022960
*/

% =  and \= to compare two expressions not to evaluate expressions
% ( 2+3 = 8-3 ) = false

% =:= and =\= are used to compare and evaluate expressions expressions
% (2+3 =:= 8-3) = true

% is = used to assign values to variables 
%B is 5*2.

celsius_to_fahrenheit(C, F) :- 
    F is C * (9 / 5) + 32.

    %RESULT:
    %celsius_to_fahrenheit(34.2,F).
    %F = 93.56.
%An element of the relation has to be the parameter thar recieves the result


fahrenheit_to_celsius(F, C) :-
    C is (F - 32) * 5 / 9. 


quadratic(A, B, C, X1, X2) :-
    %define D to assing value and use later on the same rule
    D is B * B - 4 * A * C,
    D >= 0,
    X1 is (- B - sqrt(D)) / (2 * A),
    X2 is (- B + sqrt(D)) / (2 * A).

%Factorial
%Base Case
factorial(0,1).

%Recursive rule
    %N = the number 
    %R = result
%inside () of the rule you cannot use expressions to evaluate
%create variables with the same expressions
factorial(N,R) :-
    N > 0,
    N1 is N-1,
    factorial(N1, S),
    R is N * S.



