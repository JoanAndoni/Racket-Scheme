%% 
%%  Prolog Basic 
%%  Joan Andoni González Rioz 
%%  A00569929
%% 

%% Take two arguments, a list and an element, and determine if the element can
%% be found inside the list.

%% BASE CASE
in_list([ElementInList|_], ElementInList). %% It will be true when the header of the list recived is the element in the list

%% RECURSIVE RULE
in_list([_|Tail], ElementInList) :-        %% If the element in the header isn't the element in the header erase the header and left the tail
    in_list(Tail, ElementInList).          %% Call the function again with the tail and the element to search in the list

%% Take as argument a list, and determine if the list has an odd number of elements or not.

%% BASE CASE
odd_length([]).               %% It will return true if at the end you get a empty list

%% RECURSIVE RULE
odd_length([_|[_|Tail]]) :-   %% If you don't have an empty list you will take out two elements which headers
    odd_length(Tail).         %% Call the function with the list without two numbers

%% Take as argument an index and a list, and return the element at index n of
%% the list. Indices start at 0.

%% BASE CASE
element_at(0, [ElementAtIndex|_], ElementAtIndex).      %% It will return the element at the header when the index that you give is 0

%% RECURSIVE RULE
element_at(IndexInList, [_|Tail], ElementAtIndex) :-
    IndexInListHelper is IndexInList-1,
    element_at(IndexInListHelper, Tail, ElementAtIndex).


%% Take two lists as arguments, and determine if they are permutations of each
%% other. That is, they have the exact same elements, but in different orders.

%% BASE CASE
is_permutation([], []).     %% Will return true if the two list that recieve are empty 

%%RECURSIVE RULE
is_permutation([Header|Tail], SecondList) :-
    select(Header, SecondList, HelperList),
    is_permutation(Tail, HelperList).

%% Take as argument a list, and generate a list without contiguous elements that are duplicated.

%% BASE CASE
tec_remove_doubles([ResultList], [ResultList]).             %% Return the resultant list when both lists are the same

%% RECURSIVE RULE
% IF List[0] == List[1]
tec_remove_doubles([Head, Head2|Tail], Result) :-           %% Defining the first two elements of the lists and not touch the result cause the elements are equal
    Head == Head2,                                          %% Make the comparison between the first two elements of the array
    tec_remove_doubles([Head2|Tail], Result).               %% If they are the same just send the second element plus the tail and do nothing to the result

% IF List[0] != List[1]
tec_remove_doubles([Head, Head2|Tail], [Head|Result]) :-    %% Defining the first two elements of the lists and concatenate the Head (First value to compare that it's different) and then the result to keep adding the different values
    Head \= Head2,                                          %% Make the comparison between the first two elements of the array
    tec_remove_doubles([Head2|Tail], Result).               %% Call the function with the second Head plus the Result that has already the different element
