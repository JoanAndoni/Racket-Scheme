/*
    Implementations binary trees

    Alejandra Tubilla
    A01022960

*/

%create a relationship to define the tree

%fahter is 6 and has no children 
%node(6, nil, nil) 


%father is 6 and in one side has no child,
% and in the other side has child woth value 10
%node(6, nil, node(10, nil, nil))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).

%invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Predicate to determine if an expression is a valid trees
%Base case fact
is_tree(nil).

%Check if the tree has a left and a right tree, the head doesn't matter
is_tree(node(_, LeftTree, RightTree)) :-
    is_tree(LeftTree),
    is_tree(RightTree).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%search for an element inside the tree

%Base case fact
%if the element is the root
tree_element(Element, node(Root, _, _)) :-
    Element=Root.

%if the element is higher than the root go to the right tree
tree_element(Element, node(Root, _, RightTree)) :-
    Element>Root,
    tree_element(Element, RightTree).

%if the element is lower than the root go to the left tree
tree_element(Element, node(Root, LeftTree, _)) :-
    Element<Root,
    tree_element(Element, LeftTree).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%insert a new element X in the Tree. The result is NewTree

%Base case fact
%If we have an empty tree
tree_insert(Element, nil, node(Element, nil, nil)).

%If the element is already in the tree, return the same tree
tree_insert(Element, node(Root, LeftTree, RightTree), node(Root, LeftTree, RightTree)) :-
    Element=Root.

%If the element is lower than the root
tree_insert(Element, node(Root, LeftTree, RightTree), node(Root, NewLeftTree, RightTree)) :-
    Element<Root,
    tree_insert(Element, LeftTree, NewLeftTree).

%If the element is highest than the root
tree_insert(Element, node(Root, LeftTree, RightTree), node(Root, LeftTree, NewRightTree)) :-
    Element>Root,
    tree_insert(Element, RightTree, NewRightTree).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Take the elements in the tree and crate an ordered list

%Base case fact
%if the tree is empty you get an empty list
tree_inorder(nil, []).

%go through the left tree, then the right tree and append both lists with the root in the middle
tree_inorder(node(Root, LeftTree, RightTree), List) :-
    tree_inorder(LeftTree, LeftList),
    tree_inorder(RightTree, RightList),
    append(LeftList, [Root|RightList], List).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Take the elements in the tree and crate an ordered list with the root at the begining

%Base case fact
%if the tree is empty you get an empty list
tree_preorder(nil, []).
%go through the left tree, then the right tree and append both lists with the root at the begining
tree_preorder(node(Root, LeftTree, RightTree), List) :-
    tree_preorder(LeftTree, LeftList),
    tree_preorder(RightTree, RightList),
    append([Root|LeftList], RightList, List).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Print a nicely formatted tree
%print_tree(Tree,Depth,Caracter).

%Base case fact
print_tree(nil, 0, _).
/*print_tree(Tree,Depth,Caracter).

print_tree(node(Root, LeftTree, RightTree), TreeDepth ) :-
    print_tree(RightTree, TreeDepth + 1, write('  ') write(/), write(RightTree), write(nl),
    print_tree(LeftTree, TreeDepth + 1, write(' '), write(\LeftTree), nl).*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Delete an element from the tree

%Base case fact
tree_delete(_, nil, nil).

%If the element is smaller than the root goes to the left tree and we create a new tree
tree_delete(Element, node(Root, LeftTree, RightTree), node(Root, NewLeftTree, RightTree)) :-
    Element<Root,
    tree_delete(Element, LeftTree, NewLeftTree).

%If the element is higher than the root goes to the right tree and we create a new tree
tree_delete(Element, node(Root, LeftTree, RightTree), node(Root, LeftTree, NewRightTree)) :-
    Element>Root,
    tree_delete(Element, RightTree, NewRightTree).

%if the element is one of the leaves
tree_delete(Element, node(Element, nil, nil), nil).

tree_delete(Element, node(Element, LeftTree, nil), LeftTree).
tree_delete(Element, node(Element, nil, RightTree), RightTree).

tree_delete(Element, node(Element, LeftTree, RightTree), node(Min, LeftTree, NewRightTree)) :-
    tree_min(RightTree, Min),
    tree_delete(Min, RightTree, NewRightTree).

%find the smallest number in a tree
tree_min(nil, nil).
%if the root has no leaves
tree_min(node(Root, nil, _), Root).
tree_min(node(_, LeftTree, _), Min) :-
    tree_min(LeftTree, Min).
