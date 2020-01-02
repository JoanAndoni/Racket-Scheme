/*
    Simple example of Natural Language Processing
    Based on the presentation at:
    http://members.unine.ch/jacques.savoy/lectures/SemCL/PrologNLPCL.pdf

    Gilberto Echeverria
    04/11/2019
*/

%%% Vocabulary
article(mas, L0, L) :- terminal(el, L0, L).
article(fem, L0, L) :- terminal(la, L0, L).
noun(mas, L0, L) :- terminal(niño, L0, L).
noun(fem, L0, L) :- terminal(bici, L0, L).
noun(fem, L0, L) :- terminal(pelota, L0, L).
verb(intransitive, L0, L) :- terminal(corre, L0, L).
verb(transitive, L0, L) :- terminal(monta, L0, L).
verb(transitive, L0, L) :- terminal(lanza, L0, L).
terminal(Word, [Word|List], List).

%%% Rules
% A full sentence
sentence(L0, L) :-
    noun_phrase(L0, L1),
    verb_phrase(L1, L).

noun_phrase(L0, L) :-
    article(Genre, L0, L1),
    noun(Genre, L1, L).

% Only a verb
verb_phrase(L0, L) :-
    verb(intransitive, L0, L).

% Verb followed by a noun_phrase
verb_phrase(L0, L) :-
    verb(transitive, L0, L1),
    noun_phrase(L1, L).
