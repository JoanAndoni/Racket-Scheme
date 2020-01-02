/*
    Simple example of Natural Language Processing
    Based on the presentation at:
    http://members.unine.ch/jacques.savoy/lectures/SemCL/PrologNLPCL.pdf

    Gilberto Echeverria
    04/11/2019
*/

%%% Vocabulary

% Articles %
article(sing, mas, L0, L) :- terminal(el, L0, L).
article(sing, fem, L0, L) :- terminal(la, L0, L).
article(plural, mas, L0, L) :- terminal(los, L0, L).
article(plural, fem, L0, L) :- terminal(las, L0, L).

% Nouns %
noun(sing, mas, L0, L) :- terminal(niño, L0, L).
noun(plural, mas, L0, L) :- terminal(niños, L0, L).
noun(sing, fem, L0, L) :- terminal(niña, L0, L).
noun(plural, fem, L0, L) :- terminal(niñas, L0, L).
noun(sing, mas, L0, L) :- terminal(parque, L0, L).
noun(plural, mas, L0, L) :- terminal(parques, L0, L).
noun(sing, fem, L0, L) :- terminal(bici, L0, L).
noun(plural, fem, L0, L) :- terminal(bicis, L0, L).
noun(sing, fem, L0, L) :- terminal(pelota, L0, L).
noun(plural, fem, L0, L) :- terminal(pelotas, L0, L).
noun(sing, fem, L0, L) :- terminal(sopa, L0, L).
noun(sing, fem, L0, L) :- terminal(cuchara, L0, L).

% Adjetives %
adjetive(sing, mas, L0, L) :- terminal(rojo, L0, L).
adjetive(sing, fem, L0, L) :- terminal(roja, L0, L).
adjetive(sing, mas, L0, L) :- terminal(grande, L0, L).
adjetive(sing, fem, L0, L) :- terminal(grande, L0, L).
adjetive(sing, mas, L0, L) :- terminal(pequeño, L0, L).
adjetive(sing, fem, L0, L) :- terminal(pequeña, L0, L).
adjetive(plural, mas, L0, L) :- terminal(rojos, L0, L).
adjetive(plural, fem, L0, L) :- terminal(rojas, L0, L).

% Verbs %
verb(sing, present, intransitive, L0, L) :- terminal(corre, L0, L).
verb(plural, present, intransitive, L0, L) :- terminal(corren, L0, L).
verb(sing, past, intransitive, L0, L) :- terminal(corrió, L0, L).
verb(plural, past, intransitive, L0, L) :- terminal(corrieron, L0, L).
verb(sing, future, intransitive, L0, L) :- terminal(correrá, L0, L).
verb(plural, future, intransitive, L0, L) :- terminal(correran, L0, L).
verb(sing, present, transitive, L0, L) :- terminal(monta, L0, L).
verb(plural, present, transitive, L0, L) :- terminal(montan, L0, L).
verb(sing, present, transitive, L0, L) :- terminal(lanza, L0, L).
verb(sing, past, transitive, L0, L) :- terminal(lanzó, L0, L).
verb(sing, future, transitive, L0, L) :- terminal(lanzará, L0, L).
verb(plural, present, transitive, L0, L) :- terminal(lanzan, L0, L).
verb(sing, present, transitive, L0, L) :- terminal(rebota, L0, L).
verb(plural, present, transitive, L0, L) :- terminal(rebotan, L0, L).
verb(plural, present, transitive, L0, L) :- terminal(comen, L0, L).

% Adverbs %
adverb(present, L0, L) :- terminal(fuertemente, L0, L).
adverb(past, L0, L) :- terminal(ayer, L0, L).
adverb(future, L0, L) :- terminal(mañana, L0, L).

% Conectors%
conector(L0, L) :- terminal(de, L0, L).
conector(L0, L) :- terminal(a, L0, L).
conector(L0, L) :- terminal(con, L0, L).

terminal(Word, [Word|List], List).

% Simple noun & simple verb
sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    verb(Plurality, _, _, L2, L).

sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    verb(Plurality, _, transitive, L2, L3),
    sentenceComplement(L3, L).

% Noun with adjective & simple verb
sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    adjetive(Plurality, Genre, L2, L3),
    verb(Plurality, _, _, L3, L).

sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    adjetive(Plurality, Genre, L2, L3),
    verb(Plurality, _, transitive, L3, L4),
    sentenceComplement(L4, L).

% Simple noun & verb with adverb
sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    verb(Plurality, Time, _, L2, L3),
    verbComplement(Time, L3, L).

sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    verb(Plurality, Time, transitive, L2, L3),
    verbComplement(Time, L3, L4),
    sentenceComplement(L4, L).

% Noun with adjective & verb with adverb
sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    adjetive(Plurality, Genre, L2, L3),
    verb(Plurality, Time, _, L3, L4),
    verbComplement(Time, L4, L).

sentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    adjetive(Plurality, Genre, L2, L3),
    verb(Plurality, Time, transitive, L3, L4),
    verbComplement(Time, L4, L5),
    sentenceComplement(L5, L).

% Verb complement with an adverb
verbComplement(Time, L0, L) :-
    adverb(Time, L0, L).

% Verb complement with a noun sentence
verbComplement(_, L0, L) :-
    nounSentence(L0, L).

% Verb complement with a noun sentence and an adverb
verbComplement(Time, L0, L) :-
    nounSentence(L0, L1),
    adverb(Time, L1, L).

% Verb complement with an adverb and a noun sentence
verbComplement(Time, L0, L) :-
    adverb(Time, L0, L1),
    nounSentence(L1, L).

% Noun sentence with an article and a noun
nounSentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L).

% Noun sentence with an article, a noun and an adjective
nounSentence(L0, L) :-
    article(Plurality, Genre, L0, L1),
    noun(Plurality, Genre, L1, L2),
    adjetive(Plurality, Genre, L2, L).

sentenceComplement(L0, L) :-
    conector(L0, L1),
    nounSentence(L1, L).

% Plural / singular
%   [los, niños, corren]

% Adjetivos
%   [el, niño, pequeño, lanza, la, pelota, roja]
%   [la, pelota, grande, rebota]

% Conjugación ( pasado / futuro ) y adverbios
%   [el, niño, lanzó, la, pelota, ayer]
%   [el, niño, lanzará, mañana, la, pelota]
%   [el, niño, lanza, fuertemente, la, pelota]

% Complementos directo e indirecto de los verbos
%   [el, niño, monta, la, bici, a, el, parque]
%   [los, niños, comen, la, sopa, con, la, cuchara]
