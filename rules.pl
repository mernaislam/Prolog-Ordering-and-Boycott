:-consult(data).

% question 5
getPrice(Item, ItemPrice):-
    item(Item, X, ItemPrice).

iterate([], 0).

iterate([S|E], TotalPrice):-
    getPrice(S, ItemPrice),
    iterate(E, RestPrice),
    TotalPrice is ItemPrice + RestPrice.

calcPriceOfOrder(Username, OrderID, TotalPrice):-
    customer(CustID, Username),
    order(CustID, OrderID, Items),
    iterate(Items, TotalPrice).

% question 6
isBoycott(X):-
    boycott_company(X, Z);
    alternative(X, Y).


% question 11
getTheDifferenceInPriceBetweenItemAndAlternative(Item, Alternative, DiffPrice):-
    item(Item, X, ItemPrice),
    alternative(Item, Alternative),
    item(Alternative, Y, AltPrice),
    DiffPrice is ItemPrice - AltPrice.






















