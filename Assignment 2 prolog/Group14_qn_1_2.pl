% Entity Definitions
company(sumsum).
company(appy).

% Fact Definitions
developed(sumsum, galacticas3).
stolen(stevey, galacticas3).
boss(stevey, appy).
competitor(sumsum, appy).
smartphoneTech(galacticas3).

% Derived facts and rules
business(X) :- smartphoneTech(X).  % Defines that all smartphone technology is business

% Defines rivals based on competitor relationships, bidirectional
rival(X, Y) :- competitor(X, Y).
rival(Y, X) :- competitor(X, Y).

% Ethical Evaluation Rule
unethical(X) :-
    boss(X, Y),
    stolen(X, Z),
    business(Z),
    rival(W, Y),
    company(W),
    company(Y).
