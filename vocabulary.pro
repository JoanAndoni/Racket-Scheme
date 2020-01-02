/*
    Natural language processing
*/

%%% Vocabulary
article([el]).
article([la]).
noun([niño]).
noun([bici]).
verb([corre]).
verb([monta]).

%%% Rules
sentence(L) :-
    noun_phrase(NL),
    verb_phrase(VL),
    append(NL, VL, L).

noun_phrase(L) :-
article(A),
    noun(N),
    append(A, N, L).

% Only a verb
verb_phrase(L) :-
verb(V),
append(V, [], L).

% Verb followed by a noun_phrase
verb_phrase(L) :-
    verb(V),
    noun_phrase(N),
    append(V, N, L).

