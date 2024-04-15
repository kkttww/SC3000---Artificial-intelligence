% Parent-child relationships
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

% Gender definitions
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).

% Birth order
birth_order(prince_charles, 1).
birth_order(princess_ann, 2).
birth_order(prince_andrew, 3).
birth_order(prince_edward, 4).

% Succession rule based on gender and birth order
% Collect all successors in a list, sorted by the rule
line_of_succession(SuccessionList) :-
    findall(Name, (
        parent(queen_elizabeth, Name),
        male(Name),
        birth_order(Name, _)
    ), MaleSuccessors),
    findall(Name, (
        parent(queen_elizabeth, Name),
        female(Name),
        birth_order(Name, _)
    ), FemaleSuccessors),
    append(MaleSuccessors, FemaleSuccessors, SuccessionList).
