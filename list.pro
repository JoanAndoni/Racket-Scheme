% Tail recursion for finding the length of the list
% Fact, base case
tec_length([], L, L).

% Recursive rule
tec_length([_|T], A, L) :-
    A1 is A + 1,
    tec_length(T, A1, L).

% Reverse list
tec_reverse(L, R) :-
    reverse_helper(L,R,[]).

% Base Case fact 
reverse_helper([], R, R).

% Recursive rule
reverse_helper([H|T], R, A) :-
    reverse_helper(T, R, [H|A]).

% Base case
tec_append([], L, L).
% Append two lists
tec_append([H1|T1], L2, [H1|R]) :-
    tec_append(T1, L2, R).

% Double the elements of a list
% Base case fact
double_elements([], []).
% Recursive rule
double_elements([H|T], [X|R]) :-
    X is H * 2,
    double_elements(T, R).