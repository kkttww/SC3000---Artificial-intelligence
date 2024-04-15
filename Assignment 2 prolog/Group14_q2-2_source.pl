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

% New succession rule based on birth order irrespective of gender
new_line_of_succession(SuccessionList) :-
    findall(Order-Name, (
        parent(queen_elizabeth, Name),
        birth_order(Name, Order)
    ), NamesAndOrders),
    keysort(NamesAndOrders, SortedNamesAndOrders),
    % Extract just the names from the sorted pairs
    findall(Name, member(_Order-Name, SortedNamesAndOrders), SuccessionList).
